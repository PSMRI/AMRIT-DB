/*
* AMRIT – Accessible Medical Records via Integrated Technology 
* Integrated EHR (Electronic Health Records) Solution 
*
* Copyright (C) "Piramal Swasthya Management and Research Institute" 
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/

package com.db.piramalswasthya.anonymizer.cli;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import javax.naming.ConfigurationException;

import javax.sql.DataSource;

import lombok.extern.slf4j.Slf4j;
import com.db.piramalswasthya.anonymizer.core.RandomFakeDataAnonymizer;
import com.db.piramalswasthya.anonymizer.core.HmacAnonymizer;
import com.db.piramalswasthya.anonymizer.core.AnonymizationEngine;
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator;
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator.RowData;
import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.db.piramalswasthya.anonymizer.output.DirectRestoreWriter;

import com.db.piramalswasthya.anonymizer.util.StringUtils;
import com.db.piramalswasthya.anonymizer.util.CryptoUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.db.piramalswasthya.anonymizer.util.JdbcUrlParser;
import com.db.piramalswasthya.anonymizer.util.DbUtils;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

/**
 * Main execution command - Multi-schema direct restore: DB1 replica → DB2 UAT
 * 
 * Processes all schemas in config (db_iemr, db_identity, db_reporting, db_1097_identity).
 * No SQL dump mode - direct restore only for simplicity and performance.
 * Uses the same connection logic for source and target, but with different credentials and safety checks.
 * Using .properties files for config is supported to avoid excess addition of files, relying on anonymizer.* namespace.
 */

@Command(
    name = "run",
    description = "Execute multi-schema anonymization: DB1 replica → DB2 UAT (direct restore)",
    mixinStandardHelpOptions = true
)
@Slf4j
public class RunCommand implements Callable<Integer> {
    
    private static final String LOGS_DIRECTORY = "./logs";
    private static final String LOG_FORMAT_ERROR_CONTEXT = "{}: {}";
    // this was suggested by sonarqube and in my humble opinion, isn't necessary unless exact timestampped logs help in recovery
    private static final String LOG_FORMAT_EXECUTION_FAILED = "Execution {}: FAILED - {}";
    private static final Clock SYSTEM_CLOCK = Clock.systemUTC();
    private static final DateTimeFormatter EXECUTION_ID_FORMATTER =
        DateTimeFormatter.ofPattern("yyyyMMdd-HHmmss").withZone(ZoneId.systemDefault());
    
    private static final ObjectMapper YAML_MAPPER = new ObjectMapper(new YAMLFactory());
    private long totalRowsProcessed = 0L;
    
    @Option(names = {"-c", "--config"}, description = "Config file (default: src/main/environment/common_local.properties)", 
        defaultValue = "src/main/environment/common_local.properties")
    private String configFile;

    
    @Option(names = {"--dry-run"}, description = "Validate configuration without executing")
    private boolean dryRun;

    @Option(names = {"--yes", "-y"}, description = "Skip the interactive confirmation prompt (for cron/CI)")
    private boolean assumeYes;
    
    @Override
    public Integer call() throws Exception {
        log.info("=== AMRIT DB Anonymization - Multi-Schema Direct Restore ===");
        log.info("Config file: {}", configFile);
        log.info("Dry run: {}", dryRun);
        
        Instant startTime = Instant.now(SYSTEM_CLOCK);
        String executionId = EXECUTION_ID_FORMATTER.format(startTime);
        
        AnonymizerConfig config = null;
        
        try {
            // 1. Load configuration and rules
            log.info("Loading configuration...");
            // Ensure config file exists; fallback only to common_local.properties
            java.io.File cfgFile = new java.io.File(configFile);
            if ((!cfgFile.exists() || cfgFile.isDirectory())) {
                String fallback = "src/main/environment/common_local.properties";
                java.io.File f = new java.io.File(fallback);
                if (f.exists() && f.isFile()) {
                    log.info("Falling back to properties config: {}", fallback);
                    configFile = fallback;
                } else {
                    throw new IllegalArgumentException("Config file not found: " + configFile + ". Expected " + fallback + " to exist.");
                }
            }

            config = loadConfig(configFile);
            String rulesPath = config.getRulesFile();
            if (rulesPath == null || rulesPath.isBlank()) {
                throw new IllegalArgumentException("Configuration must specify a rules file via 'anonymizer.rulesFile' or rulesFile in YAML config.");
            }
            java.io.File rf = new java.io.File(rulesPath);
            if (!rf.exists() || rf.isDirectory()) {
                throw new IllegalArgumentException("Anonymization rules file not found: " + rulesPath + ". Provide a valid rules YAML (e.g. anonymization-registry.yml).");
            }

            AnonymizationRules rules = loadRules(config.getRulesFile());
            // 2. Hash config and rules for versioning (logged, no file report)
            log.info("Config hash: {}", hashFileContents(configFile));
            log.info("Rules hash: {}", hashFileContents(config.getRulesFile()));
            log.info("Rules version: {}", rules.getRulesVersion());

            // 3. Validate configuration
            validateConfiguration(config, rules);
            
            // 4. Interactive safety confirmation
            log.info("Running safety confirmation checks...");
            if (!interactiveSafetyConfirmation(config)) {
                log.info("User declined safety confirmation. Aborting run.");
                log.info("Execution {} aborted by user", executionId);
                return 1;
            }
            log.info("Safety confirmation accepted");
            
            if (dryRun) {
                return runDryRunChecks(config, rules, executionId);
            }
            
            // 5. Prepare HMAC secret and faker locale (engine will instantiate helpers)
            String secret = resolveAnonymizationSecret();
            if (secret == null || secret.length() < 32) {
                throw new IllegalStateException(
                    "ANONYMIZATION_SECRET env var required (min 32 characters) or anonymizer.hmacSecretKey property in properties file");
            }
            // Initialize faker locale (engine will create the seeded Faker instances)
            String fakeLocale = System.getenv().getOrDefault("ANONYMIZER_FAKE_LOCALE", "en");
            java.util.Locale locale = java.util.Locale.forLanguageTag(fakeLocale.replace('_', '-'));
            
            // 6. Process each schema
            for (String schema : config.requireSource().getSchemas()) {
                log.info("\n========== Processing schema: {} ==========", schema);
                processSchema(schema, config, rules, secret, locale);
            }
        } catch (SQLException e) {
            String errorContext = String.format("Anonymization failed during execution (ID: %s)", executionId);
            String sanitized = sanitizeError(e);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitized, e);
            log.error(LOG_FORMAT_EXECUTION_FAILED, executionId, sanitized);
            return 1;
        } catch (IOException e) {
            String errorContext = String.format("Configuration or file I/O error (ID: %s)", executionId);
            String sanitized = sanitizeError(e);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitized, e);
            log.error(LOG_FORMAT_EXECUTION_FAILED, executionId, sanitized);
            return 1;
        } catch (Exception e) {
            String errorContext = String.format("Unexpected error during execution (ID: %s)", executionId);
            String sanitized = sanitizeError(e);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitized, e);
            log.error(LOG_FORMAT_EXECUTION_FAILED, executionId, sanitized);
            return 1;
        }

        long endMillis = Duration.between(startTime, Instant.now(SYSTEM_CLOCK)).toMillis();
        log.info("\n=== Anonymization Complete ===");
        log.info("Total rows processed: {}", totalRowsProcessed);
        log.info("Total duration: {} ms", endMillis);
        log.info("Execution {} complete", executionId);

        return 0;
    }

    private Integer runDryRunChecks(AnonymizerConfig config, AnonymizationRules rules, String executionId) {
        log.info("DRY RUN: Performing schema/table checks...");
        for (String schema : config.requireSource().getSchemas()) {
            runDryRunCheckForSchema(config, rules, schema);
        }
        log.info("DRY RUN: Configuration and safety validated. Exiting.");
        log.info("Execution {}: DRY_RUN_SUCCESS", executionId);
        return 0;
    }

    private void runDryRunCheckForSchema(AnonymizerConfig config, AnonymizationRules rules, String schema) {
        String physical = resolvePhysicalSchema(config, schema);
        log.info("\n--- Dry-run check schema: {} (physical={}) ---", schema, physical);
        try {
            DataSource sourceDs = DbUtils.createDataSource(config.requireSource(), physical);
            java.util.List<String> sourceTables = DbUtils.listTables(sourceDs, physical);
            log.info("Source tables for {} (physical={}): {}", schema, physical, sourceTables);
            reportMissingDryRunTables(schema, sourceTables, rules);
        } catch (Exception e) {
            log.warn("Dry-run: failed to inspect schema {}: {}", schema, e.getMessage());
        }
    }

    private void reportMissingDryRunTables(String schema, java.util.List<String> sourceTables,
                                           AnonymizationRules rules) {
        AnonymizationRules.DatabaseRules dbRules =
            rules.getDatabases() != null ? rules.getDatabases().get(schema) : null;
        if (dbRules == null || dbRules.getTables().isEmpty()) {
            log.warn("No rules found for schema: {}", schema);
            return;
        }

        java.util.Set<String> expected = new java.util.LinkedHashSet<>(dbRules.getTables().keySet());
        java.util.Set<String> present = new java.util.LinkedHashSet<>(sourceTables);
        java.util.Set<String> missingInSource = new java.util.LinkedHashSet<>(expected);
        missingInSource.removeAll(present);
        if (!missingInSource.isEmpty()) {
            log.warn("Tables defined in rules but missing in source {}: {}", schema, missingInSource);
        } else {
            log.info("All expected tables present in source {}", schema);
        }
    }

    private String resolveAnonymizationSecret() {
        String secret = System.getenv("ANONYMIZATION_SECRET");
        if (secret != null && secret.length() >= 32) {
            return secret;
        }
        return readSecretFromPropertiesConfig(secret);
    }

    private String readSecretFromPropertiesConfig(String fallbackSecret) {
        if (configFile == null || !configFile.endsWith(".properties")) {
            return fallbackSecret;
        }
        try (java.io.FileInputStream fis = new java.io.FileInputStream(configFile)) {
            java.util.Properties p = new java.util.Properties();
            p.load(fis);
            String propSecret = p.getProperty("anonymizer.hmacSecretKey");
            if (propSecret != null && propSecret.length() >= 32) {
                log.warn("ANONYMIZATION_SECRET env var missing or weak; falling back to anonymizer.hmacSecretKey from properties. This is insecure for production and should only be used for local testing.");
                return propSecret;
            }
        } catch (IOException e) {
            log.warn("Failed to read properties for secret fallback: {}", e.getMessage());
        }
        return fallbackSecret;
    }

    /**
     * Process ALL tables present in the source schema (full replica). The rules
     * registry acts as a PII overlay: tables with registry entries get their
     * configured strategies; every other table is copied with its columns
     * screened by the unknown-column handling.
     */
    private void processSchemaTables(String schema, AnonymizationRules rules,
                                     AnonymizationEngine engine, KeysetPaginator paginator,
                                     DirectRestoreWriter writer,
                                     List<String> sourceTables) throws SQLException {

        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(schema);
        Map<String, AnonymizationRules.TableRules> ruleTables =
            dbRules == null ? Map.of() : dbRules.getTables();

        if (ruleTables.isEmpty()) {
            log.warn("No registry rules for schema {} - all tables will be copied with " +
                "unknown-column screening only", schema);
        }

        for (String tableName : sourceTables) {
            AnonymizationRules.TableRules tableRules = ruleTables.get(tableName);
            if (tableRules == null) {
                log.info("Table {}.{} has no registry entry - copying with unknown-column screening",
                    schema, tableName);
                tableRules = new AnonymizationRules.TableRules();
                tableRules.setColumns(new java.util.LinkedHashMap<>());
            }
            processTable(schema, tableName, tableRules, rules, engine, paginator, writer);
        }

        // Drift visibility: registry tables that vanished from the source
        java.util.Set<String> missing = new java.util.LinkedHashSet<>(ruleTables.keySet());
        sourceTables.forEach(missing::remove);
        if (!missing.isEmpty()) {
            log.warn("Registry defines tables that are missing in source {}: {}", schema, missing);
        }
    }
    //Process a single table
    void processTable(String schema, String tableName, AnonymizationRules.TableRules tableRules,
                      AnonymizationRules rules, AnonymizationEngine engine, KeysetPaginator paginator,
                      DirectRestoreWriter writer) throws SQLException {
        
        log.info("Processing table: {}.{}", schema, tableName);
        
        long tableStartTime = System.currentTimeMillis();
        long[] rowCount = {0};
        Map<String, Integer> strategyCounts = new HashMap<>();

        // Fetch real source columns (with metadata) so we don't accidentally drop
        // unknown columns and so outputs can be fitted to column definitions.
        List<com.db.piramalswasthya.anonymizer.core.ColumnMeta> sourceColumnMeta;
        try {
            sourceColumnMeta = paginator.getTableColumnMeta(tableName);
        } catch (SQLException e) {
            if (isTableMissing(e)) {
                log.warn("Source table not found, skipping {}.{}", schema, tableName);
                return;
            }
            throw e;
        }
        List<String> sourceColumns = sourceColumnMeta.stream()
            .map(com.db.piramalswasthya.anonymizer.core.ColumnMeta::name)
            .toList();
        Map<String, com.db.piramalswasthya.anonymizer.core.ColumnMeta> columnMetaByName =
            new java.util.LinkedHashMap<>();
        for (com.db.piramalswasthya.anonymizer.core.ColumnMeta cm : sourceColumnMeta) {
            columnMetaByName.put(cm.name(), cm);
        }

        Map<String, AnonymizationRules.ColumnRule> mutableColumns = new java.util.LinkedHashMap<>();
        mutableColumns.putAll(tableRules.getColumns());

        for (String srcCol : sourceColumns) {
            if (mutableColumns.containsKey(srcCol)) {
                continue;
            }

            // The registry is the single source of truth for PII: columns not
            // listed there are copied as-is. Devs maintain the registry when
            // new tables/columns are added.
            switch (rules.getUnknownColumnPolicy()) {
                case FAIL -> throw new IllegalStateException("Unknown column found in source not present in rules: " + srcCol + " for table " + tableName);
                case WARN -> log.debug("Column {}.{}.{} not in registry - preserving", schema, tableName, srcCol);
                case PRESERVE -> log.debug("Auto-adding unknown column {}.{} with PRESERVE strategy", schema, srcCol);
            }

            AnonymizationRules.ColumnRule cr = new AnonymizationRules.ColumnRule();
            cr.setStrategy("PRESERVE");
            mutableColumns.put(srcCol, cr);
        }
        tableRules.setColumns(mutableColumns);
        List<String> allColumns = sourceColumns;

        // Calculate strategy counts once per table for reporting (since we apply strategies per column, not per row)
        updateStrategyCounts(tableRules, strategyCounts);
        
        BatchContext context = new BatchContext(schema, tableName, tableRules, allColumns,
                                                engine, writer, rowCount, columnMetaByName);
        processTableBatches(context, paginator);

        // Commit per table so a crash loses at most the current table
        writer.commitTable();
        recordTableCompletion(schema, tableName, tableStartTime, rowCount[0], tableRules, strategyCounts);
    }
    
    /**
     * Process table batches with pagination
     */
    private void processTableBatches(BatchContext context, KeysetPaginator paginator) throws SQLException {
        try {
            paginator.streamTableAuto(
                context.tableName,
                context.tableRules.getPrimaryKey(),
                context.allColumns,
                batch -> processBatch(context, batch)
            );
        } catch (BatchProcessingException e) {
            unwrapAndThrowSQLException(e);
        }
    }
    
    /**
     * Process a single batch of rows
     */
    private void processBatch(BatchContext context, List<RowData> batch) {
        try {
            context.engine.anonymizeBatch(context.schema, context.tableName, context.tableRules,
                batch, context.columnMeta);
            List<Map<String, Object>> rowMaps = batch.stream()
                .map(RowData::getData)
                .toList();
            context.writer.writeInsert(context.tableName, context.allColumns, rowMaps);
            context.rowCount[0] += batch.size();
        } catch (SQLException e) {
            String errorMsg = String.format("Batch processing failed for table %s.%s", 
                context.schema, context.tableName);
            throw new BatchProcessingException(errorMsg, e);
        }
    }
    
    /**
     * Update strategy counts for reporting
     */
    private void updateStrategyCounts(AnonymizationRules.TableRules tableRules, Map<String, Integer> strategyCounts) {
        for (String column : tableRules.getColumns().keySet()) {
            String strategy = tableRules.getColumns().get(column).getStrategy();
            strategyCounts.put(strategy, strategyCounts.getOrDefault(strategy, 0) + 1);
        }
    }
    
    /**
     * Record table completion in report
     */
    private void recordTableCompletion(String schema, String tableName, long startTime, long rowCount,
                                      AnonymizationRules.TableRules tableRules,
                                      Map<String, Integer> strategyCounts) {
        long duration = System.currentTimeMillis() - startTime;
        totalRowsProcessed += rowCount;
        log.info("Completed {}.{}: {} rows, {} ms, columns_anonymized={}, strategies={}",
            schema, tableName, rowCount, duration, tableRules.getColumns().size(), strategyCounts);
    }
    
    /**
     * Unwrap BatchProcessingException and throw SQLException
     */
    private void unwrapAndThrowSQLException(BatchProcessingException e) throws SQLException {
        if (e.getCause() instanceof SQLException sqlEx) {
            throw sqlEx;
        }
        throw new SQLException("Batch processing failed: " + e.getMessage(), e);
    }
    
    /**
     * Load configuration from YAML
     */
    private AnonymizerConfig loadConfig(String path) throws IOException {
        if (path == null) {
            throw new IllegalArgumentException("Config path cannot be null");
        }

        if (path.endsWith(".properties")) {
            java.util.Properties props = new java.util.Properties();
            try (java.io.FileInputStream in = new java.io.FileInputStream(path)) {
                props.load(in);
            }
            return loadConfigFromProperties(props);
        }
        return YAML_MAPPER.readValue(new File(path), AnonymizerConfig.class);
    }

    /**
     * Map properties to AnonymizerConfig using anonymizer.* namespace.
     */
    private AnonymizerConfig loadConfigFromProperties(java.util.Properties props) {
        AnonymizerConfig cfg = new AnonymizerConfig();

        AnonymizerConfig.DatabaseConfig src = buildSourceConfig(props);
        AnonymizerConfig.DatabaseConfig tgt = buildTargetConfig(props, src);

        cfg.setSource(src);
        cfg.setTarget(tgt);

        // Safety
        AnonymizerConfig.SafetyConfig safety = new AnonymizerConfig.SafetyConfig();
        safety.setEnabled(propBool(props, "anonymizer.safety.enabled", true));
        String allow = props.getProperty("anonymizer.safety.allowedHosts", "");
        if (!allow.isBlank()) {
            safety.setAllowedHosts(StringUtils.commaSepToList(allow));
        }
        cfg.setSafety(safety);

        // Performance
        AnonymizerConfig.PerformanceConfig perf = new AnonymizerConfig.PerformanceConfig();
        perf.setBatchSize(propInt(props, "anonymizer.performance.batchSize", 1000));
        perf.setFetchSize(propInt(props, "anonymizer.performance.fetchSize", 1000));
        perf.setMaxMemoryMb(propInt(props, "anonymizer.performance.maxMemoryMb", 512));
        cfg.setPerformance(perf);

        cfg.setRulesFile(prop(props, "anonymizer.rulesFile", "anonymization-registry.yml"));
        cfg.setLoggingPath(prop(props, "anonymizer.loggingPath", LOGS_DIRECTORY));

        // Optional schema name mappings: anonymizer.schema.map.<logical>=<physical>, except its not optional
        java.util.Map<String,String> schemaMap = new java.util.HashMap<>();
        for (String key : props.stringPropertyNames()) {
            if (key.startsWith("anonymizer.schema.map.")) {
                String logical = key.substring("anonymizer.schema.map.".length());
                String phys = props.getProperty(key);
                if (phys != null && !phys.isBlank()) schemaMap.put(logical, phys);
            }
        }
        if (!schemaMap.isEmpty()) cfg.setSchemaMap(schemaMap);

        return cfg;
    }

    private AnonymizerConfig.DatabaseConfig buildSourceConfig(java.util.Properties props) {
        AnonymizerConfig.DatabaseConfig src = new AnonymizerConfig.DatabaseConfig();

        // Canonical explicit configuration: anonymizer.source.*
        String explicitHost = prop(props, "anonymizer.source.host", "");
        if (!explicitHost.isBlank()) {
            src.setHost(explicitHost);
            src.setPort(propInt(props, "anonymizer.source.port", 3306));
            src.setUsername(prop(props, "anonymizer.source.username", ""));
            src.setPassword(prop(props, "anonymizer.source.password", ""));
            String schemas = prop(props, "anonymizer.source.schemas", "");
            if (schemas.isBlank()) {
                throw new IllegalArgumentException(
                    "anonymizer.source.host is set but anonymizer.source.schemas is empty. " +
                    "List the schemas to anonymize, e.g. anonymizer.source.schemas=db_iemr,db_identity");
            }
            src.setSchemas(StringUtils.commaSepToList(schemas));
            src.setReadOnly(true);
            src.setConnectionTimeout(propInt(props, "anonymizer.source.connectionTimeout", 30000));
            src.setVerifyServerCertificate(propBool(props, "anonymizer.source.verifyServerCertificate", true));
            return src;
        }

        // Legacy fallback: discover schemas and host/port from spring.datasource.*.jdbc-url
        // entries. Only usable when every datasource points at the same server.
        log.warn("anonymizer.source.host not set - falling back to spring.datasource.* discovery. " +
            "Prefer explicit anonymizer.source.* properties.");
        java.util.List<String> discovered = new java.util.ArrayList<>();
        for (String key : props.stringPropertyNames()) {
            if (key.startsWith("spring.datasource.") && (key.endsWith(".jdbc-url") || key.endsWith(".url"))) {
                String url = props.getProperty(key);
                JdbcUrlParser.Parts p = JdbcUrlParser.parse(url);
                if (p != null && p.database() != null && !discovered.contains(p.database())) {
                    discovered.add(p.database());
                    if (src.getHost() == null || src.getHost().isBlank()) {
                        src.setHost(p.host());
                        src.setPort(p.port());
                    }

                    // source credentials (first match wins). This supports properties
                    // like spring.datasource.dbiemr.username/password.
                    String urlSuffix = key.endsWith(".jdbc-url") ? ".jdbc-url" : ".url";
                    String prefix = key.substring(0, key.length() - urlSuffix.length());
                    String uKey = prefix + ".username";
                    String pKey = prefix + ".password";
                    String uVal = props.getProperty(uKey);
                    String pVal = props.getProperty(pKey);
                    if (uVal != null && !uVal.isBlank()) {
                        src.setUsername(uVal);
                    }
                    if (pVal != null && !pVal.isBlank()) {
                        src.setPassword(pVal);
                    }
                }
            }
        }
        if (!discovered.isEmpty()) {
            src.setSchemas(discovered);
        }

        // Credentials: prefer per-datasource values discovered above; fall back to
        // global spring.datasource.username/password only if none were found.
        if (src.getUsername() == null || src.getUsername().isBlank()) {
            src.setUsername(prop(props, "spring.datasource.username", ""));
        }
        if (src.getPassword() == null || src.getPassword().isBlank()) {
            src.setPassword(prop(props, "spring.datasource.password", ""));
        }


        if (src.getHost() == null || src.getHost().isBlank()) src.setHost("localhost");
        if (src.getPort() == 0) src.setPort(3306);
        src.setReadOnly(true);
        src.setConnectionTimeout(30000);
        src.setVerifyServerCertificate(true);

        return src;
    }

    private AnonymizerConfig.DatabaseConfig buildTargetConfig(java.util.Properties props, AnonymizerConfig.DatabaseConfig src) {
        AnonymizerConfig.DatabaseConfig tgt = new AnonymizerConfig.DatabaseConfig();

        // The target must be configured explicitly. Deriving it from a
        // spring.datasource.* entry (previous behavior) was unsafe: those
        // entries also define the SOURCE, so the tool could never point at a
        // genuinely separate UAT server via properties.
        String host = prop(props, "anonymizer.target.host", "");
        if (host.isBlank()) {
            throw new IllegalArgumentException(
                "anonymizer.target.host is required in properties mode. Configure the UAT target " +
                "explicitly: anonymizer.target.host / port / username / password " +
                "(and optionally anonymizer.target.schemas).");
        }
        tgt.setHost(host);
        tgt.setPort(propInt(props, "anonymizer.target.port", 3306));
        tgt.setUsername(prop(props, "anonymizer.target.username", ""));
        tgt.setPassword(prop(props, "anonymizer.target.password", ""));

        String schemas = prop(props, "anonymizer.target.schemas", "");
        if (!schemas.isBlank()) {
            tgt.setSchemas(StringUtils.commaSepToList(schemas));
        } else {
            tgt.setSchemas(src.getSchemas());
        }

        tgt.setReadOnly(propBool(props, "anonymizer.target.readOnly", false));
        tgt.setConnectionTimeout(propInt(props, "anonymizer.target.connectionTimeout", src.getConnectionTimeout()));
        tgt.setVerifyServerCertificate(propBool(props, "anonymizer.target.verifyServerCertificate", true));

        return tgt;
    }

    // Lightweight property helpers to centralize defaults and parsing
    private String prop(java.util.Properties props, String key, String def) {
        String v = props.getProperty(key);
        return v == null ? def : v;
    }

    private int propInt(java.util.Properties props, String key, int def) {
        String v = props.getProperty(key);
        if (v == null) return def;
        try {
            return Integer.parseInt(v);
        } catch (NumberFormatException e) {
            return def;
        }
    }

    private boolean propBool(java.util.Properties props, String key, boolean def) {
        String v = props.getProperty(key);
        if (v == null) return def;
        return Boolean.parseBoolean(v);
    }
    
    /**
     * Load rules for anonimization
     */
    private AnonymizationRules loadRules(String path) throws IOException {
        return YAML_MAPPER.readValue(new File(path), AnonymizationRules.class);
    }
    
    /**
     * Validate configuration and rules
     */
    private void validateConfiguration(AnonymizerConfig config, AnonymizationRules rules) {
        validateSourceConfiguration(config);
        validateTargetConfiguration(config);
        // Enforces host allowlist and source!=target using resolved IPs
        com.db.piramalswasthya.anonymizer.core.SafetyGuard.enforce(config);
        validateSchemaMatching(config);
        validateRules(rules);

        log.info("Configuration validated successfully");
        log.info("Schemas to process: {}", config.requireSource().getSchemas());
    }
    
    private void validateSourceConfiguration(AnonymizerConfig config) {
        AnonymizerConfig.DatabaseConfig source = config.getSource();
        if (source == null) {
            throw new IllegalArgumentException("Source database configuration required");
        }
        if (source.getSchemas().isEmpty()) {
            throw new IllegalArgumentException("Source schemas list cannot be empty");
        }
    }

    private void validateTargetConfiguration(AnonymizerConfig config) {
        AnonymizerConfig.DatabaseConfig target = config.getTarget();
        if (target == null) {
            throw new IllegalArgumentException("Target database configuration required for direct restore");
        }
        if (target.getSchemas().isEmpty()) {
            throw new IllegalArgumentException("Target schemas list cannot be empty");
        }
    }

    private void validateSchemaMatching(AnonymizerConfig config) {
        // Both configs are validated non-null before this runs
        if (!config.requireSource().getSchemas().equals(config.requireTarget().getSchemas())) {
            log.warn("Source and target schema lists differ - ensure this is intentional");
        }
    }
    
    private void validateRules(AnonymizationRules rules) {
        if (rules.getDatabases().isEmpty()) {
            throw new IllegalArgumentException("Rules must define at least one database");
        }

        // Fail fast on typo'd strategies: a bad strategy on a column whose
        // values happen to be NULL in the current data would otherwise go
        // unnoticed until real values arrive - and then leak or crash mid-run.
        java.util.List<String> invalid = new java.util.ArrayList<>();
        for (Map.Entry<String, AnonymizationRules.DatabaseRules> db : rules.getDatabases().entrySet()) {
            if (db.getValue() == null) continue;
            for (Map.Entry<String, AnonymizationRules.TableRules> table : db.getValue().getTables().entrySet()) {
                Map<String, AnonymizationRules.ColumnRule> columns = table.getValue().getColumns();
                if (columns == null) continue;
                for (Map.Entry<String, AnonymizationRules.ColumnRule> col : columns.entrySet()) {
                    String strategy = col.getValue() == null ? null : col.getValue().getStrategy();
                    if (strategy == null
                        || !AnonymizationEngine.VALID_STRATEGIES.contains(strategy.toUpperCase(java.util.Locale.ROOT))) {
                        invalid.add(db.getKey() + "." + table.getKey() + "." + col.getKey()
                            + " -> '" + strategy + "'");
                    }
                }
            }
        }
        if (!invalid.isEmpty()) {
            throw new IllegalArgumentException(
                "Rules file contains unknown strategies (valid: " + AnonymizationEngine.VALID_STRATEGIES
                + "): " + invalid);
        }
    }

    /**
     * Resolve a logical schema name to a physical DB/schema name using optional mapping
     * provided in configuration. If no mapping exists, returns the original logical name.
     */
    private String resolvePhysicalSchema(AnonymizerConfig config, String logicalSchema) {
        java.util.Map<String,String> map = config.getSchemaMap();
        if (map == null) return logicalSchema;
        return map.getOrDefault(logicalSchema, logicalSchema);
    }

    /**
     * Process single schema: reset target, stream from source, anonymize, write to target
     */
    private void processSchema(String schema, AnonymizerConfig config,
                               AnonymizationRules rules, String secret, java.util.Locale locale) throws SQLException {
        if (config.requireTarget().isReadOnly()) {
            throw new IllegalStateException(
                "Target database is configured as read-only. Set target.readOnly: false in local properties to enable writing.");
        }

        // Resolve logical->physical schema mapping (if configured). The same
        // mapping applies to both sides so the target schema is created with
        // the production (physical) name.
        String physicalSchema = resolvePhysicalSchema(config, schema);
        // Create DataSources for this schema using centralized DbUtils
        DataSource sourceDataSource = DbUtils.createDataSource(config.requireSource(), physicalSchema);

        // Determine write target: always the configured final target.
        // No default database - the writer creates the schema if missing.
        DataSource writeTargetDataSource = DbUtils.createDataSource(config.requireTarget(), null);

        // Initialize components - construct HMAC helper and shared faker, then inject into engine
        HmacAnonymizer hmac = new HmacAnonymizer(secret);
        RandomFakeDataAnonymizer faker = new RandomFakeDataAnonymizer(locale);
        AnonymizationEngine engine = new AnonymizationEngine(hmac, rules, faker);

        KeysetPaginator paginator = new KeysetPaginator(
            sourceDataSource,
            config.getPerformance().getBatchSize()
        );

        // Full-copy model: every base table in the source schema is processed
        List<String> sourceTables = DbUtils.listTables(sourceDataSource, physicalSchema);
        log.info("Source tables for {} (physical={}): {} tables", schema, physicalSchema, sourceTables.size());

        try (DirectRestoreWriter writer = new DirectRestoreWriter(
                writeTargetDataSource,
                config.getPerformance().getBatchSize(),
                physicalSchema)) {

            // Reset write target schema using source schema as template
            log.info("Resetting write-target schema: {} (physical={})", schema, physicalSchema);
            writer.resetSchema(sourceDataSource);

            // Process all tables in this schema (anonymize from source -> writeTarget)
            processSchemaTables(schema, rules, engine, paginator, writer, sourceTables);

            // Mark success to commit the transaction on the write target
            writer.markSuccess();
            log.info("Successfully committed all changes to write-target for schema: {}", schema);
        }
    }
    /**
     * Hash file contents (not path) for versioning
     */
    private String hashFileContents(String filePath) {
        try {
            byte[] fileBytes = Files.readAllBytes(Paths.get(filePath));
            return CryptoUtils.sha256Hex(fileBytes).substring(0, 16);
        } catch (IOException e) {
            log.warn("Failed to read file {}", filePath, e);
            return "unknown";
        }
    }
    
    /**
     * Sanitize error message
     */
    /* package-private for tests */
    String sanitizeError(Exception e) {
        String message = e.getMessage();
        if (message == null) {
            return e.getClass().getSimpleName();
        }

        // Cap message length to avoid heavy regex processing on enormous inputs
        final int MAX_LEN = 2000;
        boolean truncated = false;
        if (message.length() > MAX_LEN) {
            message = message.substring(0, MAX_LEN);
            truncated = true;
        }

        // Remove any potential SQL values or data
        message = message.replaceAll("VALUES\\s*\\([^)]+\\)", "VALUES (...)");
        message = message.replaceAll("'[^']{10,}'", "'...'");
        message = message.replaceAll("\\b\\d{10,}\\b", "###");

        if (truncated) {
            message = message + " [truncated]";
        }

        return message;
    }

    /**
     * Interactive safety confirmation: shows what the run will do (including
     * that the target schemas get reset) and requires a typed 'yes'.
     * Non-interactive sessions must pass --yes explicitly.
     */
    private boolean interactiveSafetyConfirmation(AnonymizerConfig config) {
        AnonymizerConfig.DatabaseConfig src = config.requireSource();
        AnonymizerConfig.DatabaseConfig tgt = config.requireTarget();
        log.info("About to anonymize:");
        log.info("  Source (read):  {}:{} schemas={}", src.getHost(), src.getPort(), src.getSchemas());
        log.info("  Target (RESET + WRITE): {}:{} schemas={}", tgt.getHost(), tgt.getPort(), tgt.getSchemas());
        log.info("  All target tables in these schemas will be dropped and re-created.");

        if (assumeYes) {
            log.info("--yes supplied; skipping interactive approval");
            return true;
        }
        if (dryRun) {
            return true; // dry run writes nothing
        }

        java.io.Console console = System.console();
        if (console == null) {
            log.error("Non-interactive session and --yes not supplied - aborting for safety. " +
                "Pass --yes to run from cron/CI.");
            return false;
        }
        String answer = console.readLine("Type 'yes' to proceed: ");
        return answer != null && answer.trim().equalsIgnoreCase("yes");
    }

    /**
     * Detect if SQLException indicates a missing table.
     */
    private boolean isTableMissing(SQLException e) {
        if (e == null) return false;
        String sqlState = e.getSQLState();
        if (sqlState != null && sqlState.equals("42S02")) return true;
        String msg = e.getMessage();
        if (msg != null && (msg.toLowerCase(java.util.Locale.ROOT).contains("doesn't exist") || msg.toLowerCase(java.util.Locale.ROOT).contains("does not exist"))) {
            return true;
        }
        Throwable cause = e.getCause();
        if (cause instanceof SQLException sqlException) return isTableMissing(sqlException);
        return false;
    }
    
    /**
     * Custom exception for batch processing failures
     */
    private static class BatchProcessingException extends RuntimeException {
        public BatchProcessingException(String message, Throwable cause) {
            super(message, cause);
        }
    }
    
    /**
     * Context object to reduce method parameters for batch processing
     */
    private static class BatchContext {
        private final String schema;
        private final String tableName;
        private final AnonymizationRules.TableRules tableRules;
        private final List<String> allColumns;
        private final AnonymizationEngine engine;
        private final DirectRestoreWriter writer;
        private final long[] rowCount;
        private final Map<String, com.db.piramalswasthya.anonymizer.core.ColumnMeta> columnMeta;

        BatchContext(String schema, String tableName, AnonymizationRules.TableRules tableRules,
                    List<String> allColumns, AnonymizationEngine engine, DirectRestoreWriter writer,
                    long[] rowCount, Map<String, com.db.piramalswasthya.anonymizer.core.ColumnMeta> columnMeta) {
            this.schema = schema;
            this.tableName = tableName;
            this.tableRules = tableRules;
            this.allColumns = allColumns;
            this.engine = engine;
            this.writer = writer;
            this.rowCount = rowCount;
            this.columnMeta = columnMeta;
        }
    }

}
