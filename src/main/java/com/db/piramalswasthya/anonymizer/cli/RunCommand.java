package com.db.piramalswasthya.anonymizer.cli;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.db.piramalswasthya.anonymizer.core.AnonymizationEngine;
import com.db.piramalswasthya.anonymizer.core.HmacAnonymizer;
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator;
import com.db.piramalswasthya.anonymizer.output.DirectRestoreWriter;
import com.db.piramalswasthya.anonymizer.output.SqlDumpWriter;
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
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

/**
 * Main execution command - connects to DB1, streams data, anonymizes, outputs results
 */
@Command(
    name = "run",
    description = "Execute anonymization (DB1 -> SQL dump or DB2)",
    mixinStandardHelpOptions = true
)
public class RunCommand implements Callable<Integer> {
    
    private static final Logger log = LoggerFactory.getLogger(RunCommand.class);
    
    @Option(names = {"-c", "--config"}, description = "Config file (default: config.yaml)", 
            defaultValue = "config.yaml")
    private String configFile;
    
    @Option(names = {"--approval-flag"}, description = "Explicit approval flag for production safety")
    private String approvalFlag;
    
    @Option(names = {"--dry-run"}, description = "Validate configuration without executing")
    private boolean dryRun;
    
    @Override
    public Integer call() throws Exception {
        log.info("=== AMRIT DB Anonymization - RUN Command ===");
        log.info("Config file: {}", configFile);
        log.info("Dry run: {}", dryRun);
        
        LocalDateTime startTime = LocalDateTime.now();
        String executionId = startTime.format(DateTimeFormatter.ofPattern("yyyyMMdd-HHmmss"));
        
        RunReport report = new RunReport();
        report.setExecutionId(executionId);
        report.setStartTime(startTime);
        
        try {
            // 1. Load configuration
            log.info("Loading configuration from: {}", configFile);
            AnonymizerConfig config = loadConfig(configFile);
            report.setConfigHash(hashString(configFile));
            
            // 2. Load rules
            log.info("Loading anonymization rules from: {}", config.getRulesFile());
            AnonymizationRules rules = loadRules(config.getRulesFile());
            report.setRulesVersion(rules.getRulesVersion());
            
            // 3. Validate configuration
            validateConfiguration(config, rules);
            
            if (dryRun) {
                log.info("Dry run: configuration validated successfully");
                report.setStatus("DRY_RUN_SUCCESS");
                report.setEndTime(LocalDateTime.now());
                report.setTotalDurationMs(
                    java.time.Duration.between(startTime, report.getEndTime()).toMillis());
                writeReport(report, config.getLoggingPath(), executionId);
                return 0;
            }
            
            // 4. Safety checks
            log.info("Running safety checks...");
            SafetyGuard safetyGuard = new SafetyGuard(config.getSafety());
            safetyGuard.validateSafeToConnect(
                config.getSource().getHost(),
                config.getSource().getDatabase(),
                approvalFlag
            );
            
            // 5. Initialize anonymization components
            log.info("Initializing anonymization engine...");
            String hmacSecret = System.getenv("ANONYMIZATION_SECRET");
            if (hmacSecret == null || hmacSecret.length() < 32) {
                throw new IllegalStateException(
                    "ANONYMIZATION_SECRET environment variable must be set (32+ chars)");
            }
            
            HmacAnonymizer anonymizer = new HmacAnonymizer(hmacSecret);
            AnonymizationEngine engine = new AnonymizationEngine(anonymizer, rules);
            
            // 6. Connect to source database
            log.info("Connecting to source database: {}:{}/{}", 
                config.getSource().getHost(),
                config.getSource().getPort(),
                config.getSource().getDatabase());
            
            DataSource sourceDataSource = createDataSource(config.getSource());
            KeysetPaginator paginator = new KeysetPaginator(
                sourceDataSource, 
                config.getPerformance().getBatchSize()
            );
            
            // 7. Execute anonymization based on output mode
            if (config.getOutput().getMode() == AnonymizerConfig.OutputMode.SQL_DUMP) {
                executeSqlDumpMode(config, rules, engine, paginator, report);
            } else {
                executeDirectRestoreMode(config, rules, engine, paginator, report);
            }
            
            report.setStatus("SUCCESS");
            log.info("Anonymization completed successfully");
            
        } catch (Exception e) {
            log.error("Anonymization failed: {}", e.getMessage(), e);
            report.setStatus("FAILED");
            report.addError("execution", sanitizeError(e));
            
            report.setEndTime(LocalDateTime.now());
            report.setTotalDurationMs(
                java.time.Duration.between(startTime, report.getEndTime()).toMillis());
            
            try {
                writeReport(report, "./logs", executionId);
            } catch (IOException ioe) {
                log.error("Failed to write error report: {}", ioe.getMessage());
            }
            
            return 1;
        }
        
        report.setEndTime(LocalDateTime.now());
        report.setTotalDurationMs(
            java.time.Duration.between(startTime, report.getEndTime()).toMillis());
        
        writeReport(report, "./logs", executionId);
        
        log.info("Total rows processed: {}", report.getTotalRowsProcessed());
        log.info("Total duration: {} ms", report.getTotalDurationMs());
        log.info("Report written to: ./logs/run-report-{}.json", executionId);
        
        return 0;
    }
    
    /**
     * Execute anonymization with SQL dump output
     */
    private void executeSqlDumpMode(AnonymizerConfig config, AnonymizationRules rules,
                                   AnonymizationEngine engine, KeysetPaginator paginator,
                                   RunReport report) throws Exception {
        
        String outputPath = config.getOutput().getPath();
        if (outputPath == null) {
            outputPath = String.format("./output/anonymized-%s.sql%s",
                report.getExecutionId(),
                config.getOutput().isCompress() ? ".gz" : "");
        }
        
        log.info("Output mode: SQL_DUMP -> {}", outputPath);
        
        try (SqlDumpWriter writer = new SqlDumpWriter(outputPath, config.getOutput().isCompress())) {
            processAllTables(config.getSource().getDatabase(), rules, engine, paginator, 
                (table, columns, rows) -> {
                    writer.writeInsert(table, columns, convertRowData(rows));
                }, report);
        }
    }
    
    /**
     * Execute anonymization with direct restore to DB2
     */
    private void executeDirectRestoreMode(AnonymizerConfig config, AnonymizationRules rules,
                                         AnonymizationEngine engine, KeysetPaginator paginator,
                                         RunReport report) throws Exception {
        
        log.info("Output mode: DIRECT_RESTORE -> {}:{}/{}",
            config.getTarget().getHost(),
            config.getTarget().getPort(),
            config.getTarget().getDatabase());
        
        DataSource targetDataSource = createDataSource(config.getTarget());
        
        try (DirectRestoreWriter writer = new DirectRestoreWriter(
                targetDataSource, 
                config.getPerformance().getBatchSize())) {
            
            processAllTables(config.getSource().getDatabase(), rules, engine, paginator,
                (table, columns, rows) -> {
                    writer.writeInsert(table, columns, convertRowData(rows));
                }, report);
        }
    }
    
    /**
     * Process all tables defined in rules
     */
    private void processAllTables(String database, AnonymizationRules rules,
                                 AnonymizationEngine engine, KeysetPaginator paginator,
                                 BatchWriter writer, RunReport report) throws Exception {
        
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(database);
        if (dbRules == null || dbRules.getTables() == null) {
            throw new IllegalStateException("No tables defined for database: " + database);
        }
        
        for (Map.Entry<String, AnonymizationRules.TableRules> entry : 
                dbRules.getTables().entrySet()) {
            
            String tableName = entry.getKey();
            AnonymizationRules.TableRules tableRules = entry.getValue();
            
            log.info("Processing table: {}", tableName);
            long tableStartTime = System.currentTimeMillis();
            
            Map<String, Integer> tableStrategyCounts = new HashMap<>();
            final long[] rowCount = {0};
            
            try {
                List<String> columns = new ArrayList<>(tableRules.getColumns().keySet());
                
                paginator.streamTable(tableName, tableRules.getPrimaryKey(), columns,
                    batch -> {
                        try {
                            // Anonymize batch
                            Map<String, Integer> batchCounts = engine.anonymizeBatch(
                                database, tableName, batch);
                            
                            // Merge strategy counts
                            batchCounts.forEach((strategy, count) ->
                                tableStrategyCounts.merge(strategy, count, Integer::sum));
                            
                            // Write batch
                            writer.write(tableName, columns, batch);
                            
                            rowCount[0] += batch.size();
                        } catch (Exception e) {
                            throw new RuntimeException("Failed to process batch for " + tableName, e);
                        }
                    });
                
                long tableDuration = System.currentTimeMillis() - tableStartTime;
                
                report.addTableReport(
                    tableName,
                    rowCount[0],
                    tableDuration,
                    tableRules.getColumns().size(),
                    tableStrategyCounts
                );
                
                log.info("Completed table {} - {} rows in {} ms", 
                    tableName, rowCount[0], tableDuration);
                
            } catch (Exception e) {
                log.error("Failed to process table {}: {}", tableName, e.getMessage(), e);
                report.addError(tableName, sanitizeError(e));
                throw e;
            }
        }
    }
    
    /**
     * Functional interface for batch writing
     */
    @FunctionalInterface
    private interface BatchWriter {
        void write(String table, List<String> columns, List<KeysetPaginator.RowData> rows) 
            throws Exception;
    }
    
    /**
     * Convert RowData to Map for writers
     */
    private List<Map<String, Object>> convertRowData(List<KeysetPaginator.RowData> rows) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (KeysetPaginator.RowData row : rows) {
            result.add(new HashMap<>(row.getData()));
        }
        return result;
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
            throw new IllegalStateException("Source database configuration missing");
        }
        
        if (config.getOutput().getMode() == AnonymizerConfig.OutputMode.DIRECT_RESTORE 
                && config.getTarget() == null) {
            throw new IllegalStateException(
                "Target database configuration required for DIRECT_RESTORE mode");
        }
        
        if (rules.getDatabases() == null || rules.getDatabases().isEmpty()) {
            throw new IllegalStateException("No databases defined in rules");
        }
        
        log.info("Configuration validated successfully");
    }
    
    /**
     * Create MySQL DataSource
     */
    private DataSource createDataSource(AnonymizerConfig.DatabaseConfig dbConfig) {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setServerName(dbConfig.getHost());
        ds.setPort(dbConfig.getPort());
        ds.setDatabaseName(dbConfig.getDatabase());
        ds.setUser(dbConfig.getUsername());
        ds.setPassword(dbConfig.getPassword());
        
        // Additional connection properties
        try {
            ds.setConnectTimeout(dbConfig.getConnectionTimeout());
            ds.setUseSSL(true);
            ds.setRequireSSL(false);
            
            if (dbConfig.isReadOnly()) {
                ds.setReadOnlyPropagatesToServer(true);
            }
        } catch (Exception e) {
            log.warn("Failed to set some connection properties: {}", e.getMessage());
        }
        
        return ds;
    }
    
    /**
     * Generate hash of config file for versioning
     */
    private String hashString(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(hash).substring(0, 8);
        } catch (Exception e) {
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
            message = e.getClass().getSimpleName();
        }
        
        // Remove any potential SQL values or data
        message = message.replaceAll("VALUES\\s*\\([^)]+\\)", "VALUES (...)");
        message = message.replaceAll("'[^']{10,}'", "'...'");
        
        return message;
    }
    
    /**
     * Write report to file
     */
    private void writeReport(RunReport report, String loggingPath, String executionId) 
            throws IOException {
        String reportPath = String.format("%s/run-report-%s.json", loggingPath, executionId);
        report.writeToFile(reportPath);
    }
}
