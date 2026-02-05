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

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.db.piramalswasthya.anonymizer.core.AnonymizationEngine;
import com.db.piramalswasthya.anonymizer.core.HmacAnonymizer;
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator;
import com.db.piramalswasthya.anonymizer.output.DirectRestoreWriter;
import com.db.piramalswasthya.anonymizer.report.RunReport;
import com.db.piramalswasthya.anonymizer.safety.SafetyGuard;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.mysql.cj.jdbc.MysqlDataSource;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

/**
 * Main execution command - Multi-schema direct restore: DB1 replica → DB2 UAT
 * 
 * Processes all schemas in config (db_iemr, db_identity, db_reporting, db_1097_identity).
 * No SQL dump mode - direct restore only for simplicity and performance.
 */
@Command(
    name = "run",
    description = "Execute multi-schema anonymization: DB1 replica → DB2 UAT (direct restore)",
    mixinStandardHelpOptions = true
)
public class RunCommand implements Callable<Integer> {
    
    private static final Logger log = LoggerFactory.getLogger(RunCommand.class);
    
    @Option(names = {"-c", "--config"}, description = "Config file (default: config.yaml)", 
            defaultValue = "config.yaml")
    private String configFile;
    
    @Option(names = {"--approve"}, description = "Explicit approval token (required for safety)", 
            required = true)
    private String approvalToken;
    
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
        
        try {
            // 1. Load configuration and rules
            log.info("Loading configuration...");
            AnonymizerConfig config = loadConfig(configFile);
            AnonymizationRules rules = loadRules(config.getRulesFile());
            
            // 2. Hash config and rules for versioning
            report.setConfigHash(hashFileContents(configFile));
            report.setRulesHash(hashFileContents(config.getRulesFile()));
            report.setRulesVersion(rules.getRulesVersion());
            
            // 3. Validate configuration
            validateConfiguration(config, rules);
            
            // 4. Safety checks for BOTH source and target
            log.info("Running safety checks...");
            SafetyGuard safetyGuard = new SafetyGuard(config.getSafety());
            
            // Validate source (DB1 replica)
            for (String schema : config.getSource().getSchemas()) {
                safetyGuard.validateSafeToConnect(
                    config.getSource().getHost(),
                    schema,
                    approvalToken
                );
            }
            
            // Validate target (DB2 UAT)
            for (String schema : config.getTarget().getSchemas()) {
                safetyGuard.validateSafeToConnect(
                    config.getTarget().getHost(),
                    schema,
                    approvalToken
                );
            }
            
            log.info("Safety checks passed");
            
            if (dryRun) {
                log.info("DRY RUN: Configuration and safety validated. Exiting.");
                report.setStatus("DRY_RUN_SUCCESS");
                report.setEndTime(LocalDateTime.now());
                writeReport(report, config.getLoggingPath(), executionId);
                return 0;
            }
            
            // 5. Initialize HMAC anonymizer
            String secret = System.getenv("ANONYMIZATION_SECRET");
            if (secret == null || secret.length() < 32) {
                throw new IllegalStateException(
                    "ANONYMIZATION_SECRET env var required (min 32 characters)");
            }
            HmacAnonymizer hmacAnonymizer = new HmacAnonymizer(secret);
            
            // 6. Process each schema
            for (String schema : config.getSource().getSchemas()) {
                log.info("\n========== Processing schema: {} ==========", schema);
                
                processSchema(schema, config, rules, hmacAnonymizer, report);
            }
            
            report.setStatus("SUCCESS");
            
        } catch (Exception e) {
            log.error("Anonymization failed: {}", sanitizeError(e), e);
            report.setStatus("FAILED");
            report.setErrorMessage(sanitizeError(e));
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            writeReport(report, "./logs", executionId);
            return 1;
        }
        
        report.setEndTime(LocalDateTime.now());
        report.setTotalDurationMs(
            java.time.Duration.between(startTime, report.getEndTime()).toMillis());
        
        writeReport(report, "./logs", executionId);
        
        log.info("\n=== Anonymization Complete ===");
        log.info("Total rows processed: {}", report.getTotalRowsProcessed());
        log.info("Total duration: {} ms", report.getTotalDurationMs());
        log.info("Report written to: ./logs/run-report-{}.json", executionId);
        
        return 0;
    }
    
    /**
     * Process single schema: reset target, stream from source, anonymize, write to target
     */
    private void processSchema(String schema, AnonymizerConfig config, 
                               AnonymizationRules rules,
                               HmacAnonymizer hmacAnonymizer,
                               RunReport report) throws Exception {
        
        // Create DataSources for this schema
        DataSource sourceDataSource = createDataSource(config.getSource(), schema);
        DataSource targetDataSource = createDataSource(config.getTarget(), schema);
        
        // Initialize components
        AnonymizationEngine engine = new AnonymizationEngine(hmacAnonymizer, rules);
        KeysetPaginator paginator = new KeysetPaginator(
            sourceDataSource, 
            config.getPerformance().getBatchSize()
        );
        
        try (DirectRestoreWriter writer = new DirectRestoreWriter(
                targetDataSource, 
                config.getPerformance().getBatchSize(),
                schema)) {
            
            // Reset target schema
            log.info("Resetting target schema: {}", schema);
            writer.resetSchema(sourceDataSource);
            
            // Process all tables in this schema
            processSchemaTables(schema, rules, engine, paginator, writer, report);
        }
    }
    
    /**
     * Process all tables defined in rules for a schema
     */
    private void processSchemaTables(String schema, AnonymizationRules rules,
                                     AnonymizationEngine engine, KeysetPaginator paginator,
                                     DirectRestoreWriter writer, RunReport report) throws Exception {
        
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(schema);
        if (dbRules == null || dbRules.getTables() == null) {
            log.warn("No rules found for schema: {}", schema);
            return;
        }
        
        for (Map.Entry<String, AnonymizationRules.TableRules> entry : 
                dbRules.getTables().entrySet()) {
            
            String tableName = entry.getKey();
            AnonymizationRules.TableRules tableRules = entry.getValue();
            
            if (tableRules.getColumns() == null || tableRules.getColumns().isEmpty()) {
                log.warn("No columns defined for table: {}.{}", schema, tableName);
                continue;
            }
            
            log.info("Processing table: {}.{}", schema, tableName);
            
            long tableStartTime = System.currentTimeMillis();
            long[] rowCount = {0};  // Use array for lambda access
            Map<String, Integer> strategyCounts = new HashMap<>();
            
            // Get all column names for SELECT
            List<String> allColumns = List.copyOf(tableRules.getColumns().keySet());
            
            // Stream and process table using keyset pagination
            try {
                paginator.streamTable(
                    tableName,
                    tableRules.getPrimaryKey(),
                    allColumns,
                    batch -> {
                        try {
                            // Anonymize batch
                            engine.anonymizeBatch(schema, tableName, batch);
                            
                            // Convert RowData to Map (use getData() directly - no copying)
                            List<Map<String, Object>> rowMaps = batch.stream()
                                .map(row -> row.getData())
                                .toList();
                            
                            // Write to target
                            writer.writeInsert(tableName, allColumns, rowMaps);
                            
                            rowCount[0] += batch.size();
                            
                            // Track strategy counts
                            for (String column : tableRules.getColumns().keySet()) {
                                String strategy = tableRules.getColumns().get(column).getStrategy();
                                strategyCounts.merge(strategy, 1, Integer::sum);
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException("Batch processing failed", e);
                        }
                    }
                );
                
            } catch (SQLException e) {
                log.error("Failed to process table {}.{}: {}", schema, tableName, e.getMessage());
                throw e;
            }
            
            long tableDuration = System.currentTimeMillis() - tableStartTime;
            
            // Record table report
            report.addTableReport(
                schema + "." + tableName,
                rowCount[0],
                tableDuration,
                tableRules.getColumns().size(),
                strategyCounts
            );
            
            log.info("Completed {}.{}: {} rows, {} ms", 
                schema, tableName, rowCount[0], tableDuration);
        }
    }
    
    /**
     * Load configuration from YAML
     */
    private AnonymizerConfig loadConfig(String path) throws IOException {
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        return mapper.readValue(new File(path), AnonymizerConfig.class);
    }
    
    /**
     * Load rules from YAML
     */
    private AnonymizationRules loadRules(String path) throws IOException {
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        return mapper.readValue(new File(path), AnonymizationRules.class);
    }
    
    /**
     * Validate configuration and rules
     */
    private void validateConfiguration(AnonymizerConfig config, AnonymizationRules rules) {
        if (config.getSource() == null) {
            throw new IllegalArgumentException("Source database configuration required");
        }
        
        if (config.getSource().getSchemas() == null || config.getSource().getSchemas().isEmpty()) {
            throw new IllegalArgumentException("Source schemas list cannot be empty");
        }
        
        if (config.getTarget() == null) {
            throw new IllegalArgumentException("Target database configuration required for direct restore");
        }
        
        if (config.getTarget().getSchemas() == null || config.getTarget().getSchemas().isEmpty()) {
            throw new IllegalArgumentException("Target schemas list cannot be empty");
        }
        
        if (!config.getSource().getSchemas().equals(config.getTarget().getSchemas())) {
            log.warn("Source and target schema lists differ - ensure this is intentional");
        }
        
        if (rules.getDatabases() == null || rules.getDatabases().isEmpty()) {
            throw new IllegalArgumentException("Rules must define at least one database");
        }
        
        log.info("Configuration validated successfully");
        log.info("Schemas to process: {}", config.getSource().getSchemas());
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
            ds.setConnectTimeout(dbConfig.getConnectionTimeout());
            ds.setUseSSL(true);
            ds.setRequireSSL(false);
            ds.setVerifyServerCertificate(false);
            ds.setRewriteBatchedStatements(true); // Critical for batch performance
            ds.setUseServerPrepStmts(false); // Avoid prep stmt overhead for large batches
        } catch (Exception e) {
            log.warn("Failed to set advanced connection properties: {}", e.getMessage());
        }
        
        return ds;
    }
    
    /**
     * Hash file contents (not path) for versioning
     */
    private String hashFileContents(String filePath) {
        try {
            byte[] fileBytes = Files.readAllBytes(Paths.get(filePath));
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(fileBytes);
            return bytesToHex(hash).substring(0, 16); // First 16 chars
        } catch (Exception e) {
            log.warn("Failed to hash file {}: {}", filePath, e.getMessage());
            return "unknown";
        }
    }
    
    private String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
    
    /**
     * Sanitize error message (remove any potential PII)
     */
    private String sanitizeError(Exception e) {
        String message = e.getMessage();
        if (message == null) {
            return e.getClass().getSimpleName();
        }
        
        // Remove any potential SQL values or data
        message = message.replaceAll("VALUES\\s*\\([^)]+\\)", "VALUES (...)");
        message = message.replaceAll("'[^']{10,}'", "'...'");
        message = message.replaceAll("\\b\\d{10,}\\b", "###");
        
        return message;
    }
    
    /**
     * Write report to file
     */
    private void writeReport(RunReport report, String loggingPath, String executionId) 
            throws IOException {
        Files.createDirectories(Paths.get(loggingPath));
        String reportPath = loggingPath + "/run-report-" + executionId + ".json";
        
        ObjectMapper mapper = new ObjectMapper();
        mapper.writerWithDefaultPrettyPrinter().writeValue(new File(reportPath), report);
        
        log.info("Report written to: {}", reportPath);
    }
}
