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
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator.RowData;
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
import java.security.NoSuchAlgorithmException;
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
    private static final String LOGS_DIRECTORY = "./logs";
    private static final String LOG_FORMAT_ERROR_CONTEXT = "{}: {}";
    private static final String STATUS_FAILED = "FAILED";
    
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
        
        AnonymizerConfig config = null;
        
        try {
            // 1. Load configuration and rules
            log.info("Loading configuration...");
            config = loadConfig(configFile);
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
        } catch (SQLException e) {
            String errorContext = String.format("Anonymization failed during execution (ID: %s)", executionId);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, sanitizeError(e), e);
            report.setStatus(STATUS_FAILED);
            report.setErrorMessage(errorContext + ": " + sanitizeError(e));
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            writeReport(report, config != null ? config.getLoggingPath() : LOGS_DIRECTORY, executionId);
            return 1;
        } catch (IOException e) {
            String errorContext = String.format("Configuration or file I/O error (ID: %s)", executionId);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, e.getMessage(), e);
            report.setStatus(STATUS_FAILED);
            report.setErrorMessage(errorContext + ": " + e.getMessage());
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            writeReport(report, config != null ? config.getLoggingPath() : LOGS_DIRECTORY, executionId);
            return 1;
        } catch (Exception e) {
            // Fallback handler for all other exceptions (safety, validation, etc.)
            String errorContext = String.format("Unexpected error during execution (ID: %s)", executionId);
            log.error(LOG_FORMAT_ERROR_CONTEXT, errorContext, e.getMessage(), e);
            report.setStatus(STATUS_FAILED);
            report.setErrorMessage(errorContext + ": " + sanitizeError(e));
            
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
                               AnonymizationRules rules,
                               HmacAnonymizer hmacAnonymizer,
                               RunReport report) throws SQLException {
        
        if (config.getTarget().isReadOnly()) {
            throw new IllegalStateException(
                "Target database is configured as read-only. Set target.readOnly: false in config.yaml");
        }
        
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
            
            // Mark success to commit the transaction
            writer.markSuccess();
            log.info("Successfully committed all changes for schema: {}", schema);
        }
    }
    
    /**
     * Process all tables defined in rules for a schema
     */
    private void processSchemaTables(String schema, AnonymizationRules rules,
                                     AnonymizationEngine engine, KeysetPaginator paginator,
                                     DirectRestoreWriter writer, RunReport report) throws SQLException {
        
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(schema);
        if (dbRules == null || dbRules.getTables() == null) {
            log.warn("No rules found for schema: {}", schema);
            return;
        }
        
        for (Map.Entry<String, AnonymizationRules.TableRules> entry : dbRules.getTables().entrySet()) {
            processTable(schema, entry.getKey(), entry.getValue(), engine, paginator, writer, report);
        }
    }
    
    /**
     * Process a single table
     */
    private void processTable(String schema, String tableName, AnonymizationRules.TableRules tableRules,
                             AnonymizationEngine engine, KeysetPaginator paginator,
                             DirectRestoreWriter writer, RunReport report) throws SQLException {
        
        if (tableRules.getColumns() == null || tableRules.getColumns().isEmpty()) {
            log.warn("No columns defined for table: {}.{}", schema, tableName);
            return;
        }
        
        log.info("Processing table: {}.{}", schema, tableName);
        
        long tableStartTime = System.currentTimeMillis();
        long[] rowCount = {0};
        Map<String, Integer> strategyCounts = new HashMap<>();
        List<String> allColumns = List.copyOf(tableRules.getColumns().keySet());
        
        // Calculate strategy counts once per table (not per batch)
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
            ds.setConnectTimeout(30000); // 30 second timeout
            ds.setUseSSL(true);
            ds.setRequireSSL(false);
            ds.setVerifyServerCertificate(false);
            ds.setRewriteBatchedStatements(true); // Critical for batch performance
            ds.setUseServerPrepStmts(false); // Avoid prep stmt overhead for large batches
        } catch (SQLException e) {
            log.warn("Failed to set advanced connection properties for {}: {}", dbConfig.getHost(), e.getMessage(), e);
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
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(fileBytes);
            return bytesToHex(hash).substring(0, 16); // First 16 chars
        } catch (IOException e) {
            log.warn("Failed to read file {}: {}", filePath, e.getMessage(), e);
            return "unknown";
        } catch (NoSuchAlgorithmException e) {
            log.warn("SHA-256 algorithm not available: {}", e.getMessage(), e);
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
