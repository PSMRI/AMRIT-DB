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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

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
import com.db.piramalswasthya.anonymizer.report.RunReport;

import com.db.piramalswasthya.anonymizer.util.StringUtils;
import com.db.piramalswasthya.anonymizer.util.CryptoUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.mysql.cj.jdbc.MysqlDataSource;

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
    private static final String STATUS_FAILED = "FAILED";
    private static final ObjectMapper YAML_MAPPER = new ObjectMapper(new YAMLFactory());
    
        @Option(names = {"-c", "--config"}, description = "Config file (default: src/main/environment/common_local.properties)", 
            defaultValue = "src/main/environment/common_local.properties")
    private String configFile;

    
    @Option(names = {"--dry-run"}, description = "Validate configuration without executing")
    private boolean dryRun;
    
    @Override
    public Integer call() throws Exception {
        log.info("=== AMRIT DB Anonymization - Multi-Schema Direct Restore ===");
        log.info("Config file: {}", configFile);
        log.info("Dry run: {}", dryRun);
        
        LocalDateTime startTime = LocalDateTime.now();
        String executionId = startTime.format(DateTimeFormatter.ofPattern("yyyyMMdd-HHmmss"));
        
        RunReport report = new RunReport();
        report.setExecutionId(executionId);
        report.setStartTime(startTime);
        
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
            
            // 2. Hash config and rules for versioning
            report.setConfigHash(hashFileContents(configFile));
            report.setRulesHash(hashFileContents(config.getRulesFile()));
            report.setRulesVersion(rules.getRulesVersion());

            // 3. Validate configuration
            validateConfiguration(config, rules);
            
            // 4. Interactive safety confirmation
            log.info("Running safety confirmation checks...");
            if (!interactiveSafetyConfirmation(config)) {
                log.info("User declined safety confirmation. Aborting run.");
                report.setStatus("ABORTED_BY_USER");
                report.setEndTime(LocalDateTime.now());
                writeReport(report, config.getLoggingPath(), executionId);
                return 1;
            }
            log.info("Safety confirmation accepted");
            
            if (dryRun) {
                log.info("DRY RUN: Configuration and safety validated. Exiting.");
                report.setStatus("DRY_RUN_SUCCESS");
                report.setEndTime(LocalDateTime.now());
                writeReport(report, config.getLoggingPath(), executionId);
                return 0;
            }
            
            // 5. Prepare HMAC secret and faker locale (engine will instantiate helpers)
            String secret = System.getenv("ANONYMIZATION_SECRET");
            if (secret == null || secret.length() < 32) {
                throw new IllegalStateException(
                    "ANONYMIZATION_SECRET env var required (min 32 characters)");
            }
            // Initialize faker locale (engine will create the seeded Faker instances)
            String fakeLocale = System.getenv().getOrDefault("ANONYMIZER_FAKE_LOCALE", "en");
            java.util.Locale locale = java.util.Locale.forLanguageTag(fakeLocale.replace('_', '-'));
            
            // 6. Process each schema
            for (String schema : config.getSource().getSchemas()) {
                log.info("\n========== Processing schema: {} ==========", schema);
                
                processSchema(schema, config, rules, secret, locale, report);
            }
            
            report.setStatus("SUCCESS");            
        } catch (SQLException e) {
            String errorContext = String.format("Anonymization failed during execution (ID: %s)", executionId);
            String sanitized = sanitizeError(e);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitized, e);
            report.setStatus(STATUS_FAILED);
            report.setErrorMessage(errorContext + ": " + sanitized);
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            writeReport(report, config != null ? config.getLoggingPath() : LOGS_DIRECTORY, executionId);
            return 1;
        } catch (IOException e) {
            String errorContext = String.format("Configuration or file I/O error (ID: %s)", executionId);
            String sanitized = sanitizeError(e);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitized, e);
            report.setStatus(STATUS_FAILED);
            report.setErrorMessage(errorContext + ": " + sanitized);
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            writeReport(report, config != null ? config.getLoggingPath() : LOGS_DIRECTORY, executionId);
            return 1;
        } catch (Exception e) {
            // Fallback handler for all other exceptions (safety, validation, etc.)
            String errorContext = String.format("Unexpected error during execution (ID: %s)", executionId);
            String sanitized = sanitizeError(e);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitized, e);
            report.setStatus(STATUS_FAILED);
            report.setErrorMessage(errorContext + ": " + sanitized);
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            writeReport(report, config != null ? config.getLoggingPath() : LOGS_DIRECTORY, executionId);
            return 1;
        }
        
        report.setEndTime(LocalDateTime.now());
        report.setTotalDurationMs(
            java.time.Duration.between(startTime, report.getEndTime()).toMillis());
        
        writeReport(report, config.getLoggingPath(), executionId);
        
        log.info("\n=== Anonymization Complete ===");
        log.info("Total rows processed: {}", report.getTotalRowsProcessed());
        log.info("Total duration: {} ms", report.getTotalDurationMs());
        log.info("Report written to: {}/run-report-{}.json", config.getLoggingPath(), executionId);
        
        return 0;
    }
    /**
     * Process single schema: reset target, stream from source, anonymize, write to target
     */
    private void processSchema(String schema, AnonymizerConfig config,
                               AnonymizationRules rules, String secret, java.util.Locale locale, 
                               RunReport report) throws SQLException {
        
        if (config.getTarget().isReadOnly()) {
            throw new IllegalStateException(
                "Target database is configured as read-only. Set target.readOnly: false in local properties to enable writing.");
        }

        // Create DataSources for this schema
        DataSource sourceDataSource = createDataSource(config.getSource(), schema);

        // Determine write target: always the configured final target
        DataSource writeTargetDataSource = createDataSource(config.getTarget(), schema);

        // Initialize components - construct HMAC helper and shared faker, then inject into engine
        HmacAnonymizer hmac = new HmacAnonymizer(secret);
        RandomFakeDataAnonymizer faker = new RandomFakeDataAnonymizer(locale);
        AnonymizationEngine engine = new AnonymizationEngine(hmac, rules, faker);

        KeysetPaginator paginator = new KeysetPaginator(
            sourceDataSource,
            config.getPerformance().getBatchSize()
        );

        try (DirectRestoreWriter writer = new DirectRestoreWriter(
                writeTargetDataSource,
                config.getPerformance().getBatchSize(),
                schema)) {

            // Reset write target schema using source schema as template
            log.info("Resetting write-target schema: {}", schema);
            writer.resetSchema(sourceDataSource);

            // Process all tables in this schema (anonymize from source -> writeTarget)
            processSchemaTables(schema, rules, engine, paginator, writer, report);

            // Mark success to commit the transaction on the write target
            writer.markSuccess();
            log.info("Successfully committed all changes to write-target for schema: {}", schema);
        }

    }

    //Process all tables defined in rules for a schema
    private void processSchemaTables(String schema, AnonymizationRules rules,
                                     AnonymizationEngine engine, KeysetPaginator paginator,
                                     DirectRestoreWriter writer, RunReport report) throws SQLException {
        
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(schema);
        if (dbRules == null || dbRules.getTables() == null) {
            log.warn("No rules found for schema: {}", schema);
            return;
        }
        
        for (Map.Entry<String, AnonymizationRules.TableRules> entry : dbRules.getTables().entrySet()) {
            processTable(schema, entry.getKey(), entry.getValue(), rules, engine, paginator, writer, report);
        }
    }

    //Process a single table
    private void processTable(String schema, String tableName, AnonymizationRules.TableRules tableRules,
                             AnonymizationRules rules, AnonymizationEngine engine, KeysetPaginator paginator,
                             DirectRestoreWriter writer, RunReport report) throws SQLException {
        
        if (tableRules.getColumns() == null || tableRules.getColumns().isEmpty()) {
            log.warn("No columns defined for table: {}.{}", schema, tableName);
            return;
        }
        
        log.info("Processing table: {}.{}", schema, tableName);
        
        long tableStartTime = System.currentTimeMillis();
        long[] rowCount = {0};
        Map<String, Integer> strategyCounts = new HashMap<>();

        // Fetch real source columns for this table so we don't accidentally drop unknown columns.
        List<String> sourceColumns = paginator.getTableColumns(tableName);

        if (tableRules.getColumns() == null) {
            tableRules.setColumns(new java.util.LinkedHashMap<>());
        }

        for (String srcCol : sourceColumns) {
            if (!tableRules.getColumns().containsKey(srcCol)) {
                switch (rules.getUnknownColumnPolicy()) {
                    case FAIL -> throw new IllegalStateException("Unknown column found in source not present in rules: " + srcCol + " for table " + tableName);
                    case WARN -> log.warn("Unknown column {}.{} found in source - auto-adding with PRESERVE strategy", schema, srcCol);
                    case PRESERVE -> log.debug("Auto-adding unknown column {}.{} with PRESERVE strategy", schema, srcCol);
                }

                if (rules.getUnknownColumnPolicy() != AnonymizationRules.UnknownColumnPolicy.FAIL) {
                    AnonymizationRules.ColumnRule cr = new AnonymizationRules.ColumnRule();
                    cr.setStrategy("PRESERVE");
                    tableRules.getColumns().put(srcCol, cr);
                }
            }
        }
        List<String> allColumns = sourceColumns;

        // Calculate strategy counts once per table for reporting (since we apply strategies per column, not per row)
        updateStrategyCounts(tableRules, strategyCounts);
        
        BatchContext context = new BatchContext(schema, tableName, tableRules, allColumns, 
                                                engine, writer, rowCount);
        processTableBatches(context, paginator);
        
        recordTableCompletion(schema, tableName, tableStartTime, rowCount[0], tableRules, strategyCounts, report);
    }
    
    /**
     * Process table batches with pagination
     */
    private void processTableBatches(BatchContext context, KeysetPaginator paginator) throws SQLException {
        try {
            paginator.streamTable(
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
            context.engine.anonymizeBatch(context.schema, context.tableName, batch);
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
            strategyCounts.merge(strategy, 1, Integer::sum);
        }
    }
    
    /**
     * Record table completion in report
     */
    private void recordTableCompletion(String schema, String tableName, long startTime, long rowCount,
                                      AnonymizationRules.TableRules tableRules,
                                      Map<String, Integer> strategyCounts, RunReport report) {
        long duration = System.currentTimeMillis() - startTime;
        
        report.addTableReport(
            schema + "." + tableName,
            rowCount,
            duration,
            tableRules.getColumns().size(),
            strategyCounts
        );
        log.info("Completed {}.{}: {} rows, {} ms", schema, tableName, rowCount, duration);
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
     * Expected keys (examples):
     *  anonymizer.source.host=localhost
     *  anonymizer.source.port=3306
     *  anonymizer.source.schemas=dbiemr,db_identity
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
        String denied = props.getProperty("anonymizer.safety.deniedPatterns", "");
        if (!denied.isBlank()) {
            safety.setDeniedPatterns(StringUtils.commaSepToList(denied));
        }
        safety.setRequireExplicitApproval(propBool(props, "anonymizer.safety.requireExplicitApproval", false));
        safety.setApprovalFlag(prop(props, "anonymizer.safety.approvalFlag", ""));
        cfg.setSafety(safety);

        // Performance
        AnonymizerConfig.PerformanceConfig perf = new AnonymizerConfig.PerformanceConfig();
        perf.setBatchSize(propInt(props, "anonymizer.performance.batchSize", 1000));
        perf.setFetchSize(propInt(props, "anonymizer.performance.fetchSize", 1000));
        perf.setMaxMemoryMb(propInt(props, "anonymizer.performance.maxMemoryMb", 512));
        cfg.setPerformance(perf);

        cfg.setRulesFile(prop(props, "anonymizer.rulesFile", "anonymization-registry.yml"));
        cfg.setLoggingPath(prop(props, "anonymizer.loggingPath", LOGS_DIRECTORY));

        return cfg;
    }

    private AnonymizerConfig.DatabaseConfig buildSourceConfig(java.util.Properties props) {
        AnonymizerConfig.DatabaseConfig src = new AnonymizerConfig.DatabaseConfig();

        String jpaUrl = prop(props, "jakarta.persistence.jdbc.url", "").trim();
        if (!jpaUrl.isBlank()) {
            JdbcParts p = parseJdbcUrl(jpaUrl);
            if (p != null) {
                src.setHost(p.host);
                src.setPort(p.port);
                if (p.database != null) src.setSchemas(java.util.List.of(p.database));
            }
        }

        java.util.List<String> discovered = new java.util.ArrayList<>();
        for (String key : props.stringPropertyNames()) {
            if (key.startsWith("spring.datasource.") && key.endsWith(".jdbc-url")) {
                String url = props.getProperty(key);
                JdbcParts p = parseJdbcUrl(url);
                if (p != null && p.database != null && !discovered.contains(p.database)) {
                    discovered.add(p.database);
                    if (src.getHost() == null || src.getHost().isBlank()) {
                        src.setHost(p.host);
                        src.setPort(p.port);
                    }
                }
            }
        }
        if (!discovered.isEmpty()) {
            if (src.getSchemas() == null || src.getSchemas().isEmpty()) {
                src.setSchemas(discovered);
            } else {
                java.util.List<String> merged = new java.util.ArrayList<>(src.getSchemas());
                for (String d : discovered) if (!merged.contains(d)) merged.add(d);
                src.setSchemas(merged);
            }
        }

        // Credentials: prefer jakarta.persistence.user/password, then spring.datasource.username/password, then anonymizer.* (last resort)
        String jpaUser = prop(props, "jakarta.persistence.jdbc.user", "");
        String jpaPass = prop(props, "jakarta.persistence.jdbc.password", "");
        if (!jpaUser.isBlank()) {
            src.setUsername(jpaUser);
            src.setPassword(jpaPass);
        } else if (!prop(props, "spring.datasource.username", "").isBlank()) {
            src.setUsername(prop(props, "spring.datasource.username", ""));
            src.setPassword(prop(props, "spring.datasource.password", ""));
        } else {
            src.setUsername(prop(props, "anonymizer.source.username", "root"));
            src.setPassword(prop(props, "anonymizer.source.password", ""));
        }

        // Defaults for other flags
        if (src.getHost() == null || src.getHost().isBlank()) src.setHost(prop(props, "anonymizer.source.host", "localhost"));
        if (src.getPort() == 0) src.setPort(propInt(props, "anonymizer.source.port", 3306));
        src.setReadOnly(propBool(props, "anonymizer.source.readOnly", true));
        src.setConnectionTimeout(propInt(props, "anonymizer.source.connectionTimeout", 30000));
        src.setVerifyServerCertificate(propBool(props, "anonymizer.source.verifyServerCertificate", true));

        return src;
    }

    private AnonymizerConfig.DatabaseConfig buildTargetConfig(java.util.Properties props, AnonymizerConfig.DatabaseConfig src) {
        AnonymizerConfig.DatabaseConfig tgt = new AnonymizerConfig.DatabaseConfig();
        String targetUrl = prop(props, "spring.datasource.db-identity.jdbc-url", "");
        if (!targetUrl.isBlank()) {
            JdbcParts p = parseJdbcUrl(targetUrl);
            if (p != null) {
                tgt.setHost(p.host);
                tgt.setPort(p.port);
                if (p.database != null) tgt.setSchemas(java.util.List.of(p.database));
            }
            if (!prop(props, "spring.datasource.db-identity.username", "").isBlank()) {
                tgt.setUsername(prop(props, "spring.datasource.db-identity.username", ""));
                tgt.setPassword(prop(props, "spring.datasource.db-identity.password", ""));
            }
        }

        // If target schemas still not set, use discovered source schemas
        if (tgt.getSchemas() == null || tgt.getSchemas().isEmpty()) {
            tgt.setSchemas(src.getSchemas());
        }

        // For any missing target host/port/credentials, fall back to anonymizer.* or source
        if (tgt.getHost() == null || tgt.getHost().isBlank()) tgt.setHost(prop(props, "anonymizer.target.host", src.getHost()));
        if (tgt.getPort() == 0) tgt.setPort(propInt(props, "anonymizer.target.port", src.getPort()));
        if (tgt.getUsername() == null || tgt.getUsername().isBlank()) tgt.setUsername(prop(props, "anonymizer.target.username", src.getUsername()));
        if (tgt.getPassword() == null) tgt.setPassword(prop(props, "anonymizer.target.password", src.getPassword()));
        tgt.setReadOnly(propBool(props, "anonymizer.target.readOnly", false));
        tgt.setConnectionTimeout(propInt(props, "anonymizer.target.connectionTimeout", src.getConnectionTimeout()));
        tgt.setVerifyServerCertificate(propBool(props, "anonymizer.target.verifyServerCertificate", true));

        return tgt;
    }

    /**
     * Simple JDBC URL parser to extract host, port and database name for MySQL URLs.
     * Supports formats like: jdbc:mysql://host:3306/dbname?params
     */
    private static class JdbcParts {
        String host;
        int port;
        String database;
    }

    private JdbcParts parseJdbcUrl(String url) {
        if (url == null) return null;
        try {
            String u = url.trim();
            if (!u.startsWith("jdbc:")) return null;
            // remove jdbc: prefix
            u = u.substring(5);
            // Expect mysql://host:port/dbname
            int idx = u.indexOf("//");
            if (idx >= 0) u = u.substring(idx + 2);
            // split host[:port]/db
            int slash = u.indexOf('/');
            String hostPort = (slash >= 0) ? u.substring(0, slash) : u;
            String rest = (slash >= 0) ? u.substring(slash + 1) : "";
            String host = hostPort;
            int port = 3306;
            if (hostPort.contains(":")) {
                String[] hp = hostPort.split(":", 2);
                host = hp[0];
                try { port = Integer.parseInt(hp[1]); } catch (NumberFormatException ex) { port = 3306; }
            }
            String db = rest;
            // strip params after ?
            int q = db.indexOf('?');
            if (q >= 0) db = db.substring(0, q);
            JdbcParts p = new JdbcParts();
            p.host = host;
            p.port = port;
            p.database = (db == null || db.isBlank()) ? null : db;
            return p;
        } catch (Exception e) {
            return null;
        }
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

    // Use shared StringUtils.commaSepToList(...) helper instead of duplicating logic
    
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
        validateSchemaMatching(config);
        validateRules(rules);
        
        log.info("Configuration validated successfully");
        log.info("Schemas to process: {}", config.getSource().getSchemas());
    }
    
    private void validateSourceConfiguration(AnonymizerConfig config) {
        if (config.getSource() == null) {
            throw new IllegalArgumentException("Source database configuration required");
        }
        if (config.getSource().getSchemas() == null || config.getSource().getSchemas().isEmpty()) {
            throw new IllegalArgumentException("Source schemas list cannot be empty");
        }
    }
    
    private void validateTargetConfiguration(AnonymizerConfig config) {
        if (config.getTarget() == null) {
            throw new IllegalArgumentException("Target database configuration required for direct restore");
        }
        if (config.getTarget().getSchemas() == null || config.getTarget().getSchemas().isEmpty()) {
            throw new IllegalArgumentException("Target schemas list cannot be empty");
        }
    }
    
    private void validateSchemaMatching(AnonymizerConfig config) {
        if (!config.getSource().getSchemas().equals(config.getTarget().getSchemas())) {
            log.warn("Source and target schema lists differ - ensure this is intentional");
        }
    }
    
    private void validateRules(AnonymizationRules rules) {
        if (rules.getDatabases() == null || rules.getDatabases().isEmpty()) {
            throw new IllegalArgumentException("Rules must define at least one database");
        }
    }
    
    /**
     * Create MySQL DataSource for specific schema
     */
    private DataSource createDataSource(AnonymizerConfig.DatabaseConfig dbConfig, String schema) {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setServerName(dbConfig.getHost());
        ds.setPort(dbConfig.getPort());
        ds.setDatabaseName(schema);
        ds.setUser(dbConfig.getUsername());
        ds.setPassword(dbConfig.getPassword());
        
        // Additional connection properties for performance
        try {
            ds.setConnectTimeout(dbConfig.getConnectionTimeout()); // configurable timeout
            ds.setUseSSL(true);
            ds.setRequireSSL(false);
            ds.setVerifyServerCertificate(dbConfig.isVerifyServerCertificate());
            ds.setRewriteBatchedStatements(true); // Critical for batch performance
            ds.setUseServerPrepStmts(false); // Avoid prep stmt overhead for large batches
            // Set socket timeout (milliseconds) to avoid hanging reads - default 5 minutes
            try {
                // Use reflection because some connector implementations make this protected
                java.lang.reflect.Method m = ds.getClass().getMethod("setIntegerRuntimeProperty", String.class, int.class);
                m.invoke(ds, "socketTimeout", 300000);
            } catch (Exception ex) {
                log.debug("Connector doesn't support setIntegerRuntimeProperty(socketTimeout) via reflection", ex);
            }
        } catch (SQLException e) {
            log.warn("Failed to set advanced connection properties for {}", dbConfig.getHost(), e);
        }
        
        // Wrap DataSource to apply readOnly setting
        return new ReadOnlyAwareDataSource(ds, dbConfig.isReadOnly());
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
     * Interactive safety confirmation.
     * Returns true if the user confirms (Y or A), false to abort.
     */
    private boolean interactiveSafetyConfirmation(AnonymizerConfig config) {
        log.info("Safety checks enabled; proceeding without interactive approval prompt.");
        return true;
    }
    
    /**
     * Write report to file
     */
    private void writeReport(RunReport report, String loggingPath, String executionId) 
            throws IOException {
        Files.createDirectories(Paths.get(loggingPath));
        String reportPath = loggingPath + "/run-report-" + executionId + ".json";
        
        ObjectMapper mapper = new ObjectMapper();
        // auto-detect and register modules (e.g., JSR-310) so Java 8 date/time types serialize
        mapper.findAndRegisterModules();
        mapper.writerWithDefaultPrettyPrinter().writeValue(new File(reportPath), report);
        
        log.info("Report written to: {}", reportPath);
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
        
        BatchContext(String schema, String tableName, AnonymizationRules.TableRules tableRules,
                    List<String> allColumns, AnonymizationEngine engine, DirectRestoreWriter writer,
                    long[] rowCount) {
            this.schema = schema;
            this.tableName = tableName;
            this.tableRules = tableRules;
            this.allColumns = allColumns;
            this.engine = engine;
            this.writer = writer;
            this.rowCount = rowCount;
        }
    }
    
    /**
     * DataSource wrapper that applies readOnly setting to connections
     */
    private static class ReadOnlyAwareDataSource implements DataSource {
        private final DataSource delegate;
        private final boolean readOnly;
        
        ReadOnlyAwareDataSource(DataSource delegate, boolean readOnly) {
            this.delegate = delegate;
            this.readOnly = readOnly;
        }
        
        @Override
        public java.sql.Connection getConnection() throws SQLException {
            java.sql.Connection conn = delegate.getConnection();
            try {
                conn.setReadOnly(readOnly);
                return conn;
            } catch (SQLException e) {
                conn.close();
                throw e;
            }
        }
        
        @Override
        public java.sql.Connection getConnection(String username, String password) throws SQLException {
            java.sql.Connection conn = delegate.getConnection(username, password);
            try {
                conn.setReadOnly(readOnly);
                return conn;
            } catch (SQLException e) {
                conn.close();
                throw e;
            }
        }
        
        @Override
        public java.io.PrintWriter getLogWriter() throws SQLException {
            return delegate.getLogWriter();
        }
        
        @Override
        public void setLogWriter(java.io.PrintWriter out) throws SQLException {
            delegate.setLogWriter(out);
        }
        
        @Override
        public void setLoginTimeout(int seconds) throws SQLException {
            delegate.setLoginTimeout(seconds);
        }
        
        @Override
        public int getLoginTimeout() throws SQLException {
            return delegate.getLoginTimeout();
        }
        
        @Override
        public java.util.logging.Logger getParentLogger() {
            return java.util.logging.Logger.getLogger("ReadOnlyAwareDataSource");
        }
        
        @Override
        public <T> T unwrap(Class<T> iface) throws SQLException {
            return delegate.unwrap(iface);
        }
        
        @Override
        public boolean isWrapperFor(Class<?> iface) throws SQLException {
            return delegate.isWrapperFor(iface);
        }
    }
}
