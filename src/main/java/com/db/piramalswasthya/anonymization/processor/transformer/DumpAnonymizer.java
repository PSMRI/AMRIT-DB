package com.db.piramalswasthya.anonymization.processor.transformer;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.model.AnonymizationRegistry.ColumnRegistry;
import com.db.piramalswasthya.anonymization.processor.parser.InsertStatementParser;
import com.db.piramalswasthya.anonymization.processor.parser.SQLDumpReader;
import com.db.piramalswasthya.anonymization.processor.model.SQLStatement;
import com.db.piramalswasthya.anonymization.processor.writer.SQLDumpWriter;
import com.db.piramalswasthya.anonymization.registry.AnonymizationRegistryService;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyFactory;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

/**
 * Main orchestrator for anonymizing SQL dumps.
 * Reads dump file, identifies sensitive columns, applies anonymization strategies,
 * and writes anonymized output.
 */
@Component
public class DumpAnonymizer {
    private static final Logger log = LoggerFactory.getLogger(DumpAnonymizer.class);
    private final AnonymizationRegistryService registry;
    private final StrategyFactory strategyFactory;
    private final InsertStatementParser parser;
    
    private long totalStatements = 0;
    private long insertStatements = 0;
    private long rowsProcessed = 0;
    private long valuesAnonymized = 0;
    
    public DumpAnonymizer(AnonymizationRegistryService registry,
                         StrategyFactory strategyFactory,
                         InsertStatementParser parser) {
        this.registry = registry;
        this.strategyFactory = strategyFactory;
        this.parser = parser;
    }
    
    /**
     * Anonymize an entire SQL dump file
     * 
     * @param inputPath Path to input SQL dump
     * @param outputPath Path to output anonymized dump
     * @throws AnonymizationException if processing fails
     */
    public AnonymizationStats anonymizeDump(Path inputPath, Path outputPath) 
            throws AnonymizationException {
        
        log.info("===== Starting SQL Dump Anonymization =====");
        log.info("Input: {}", inputPath);
        log.info("Output: {}", outputPath);
        
        long startTime = System.currentTimeMillis();
        
        resetCounters();
        
        try (SQLDumpReader reader = new SQLDumpReader(inputPath);
             SQLDumpWriter writer = new SQLDumpWriter(outputPath)) {
            
            // Write header
            writer.writeHeader("Production Database", "1.0.0");
            
            // Process each statement
            String sqlLine;
            while ((sqlLine = reader.readStatement()) != null) {
                totalStatements++;
                
                // Parse statement
                SQLStatement statement = parser.parse(sqlLine);
                
                // Process based on type
                if (statement.getType() == SQLStatement.StatementType.INSERT) {
                    processInsertStatement(statement, writer);
                    insertStatements++;
                } else {
                    // Pass through other statements unchanged
                    writer.writeStatement(statement);
                }
                
                // Progress logging
                if (totalStatements % 10000 == 0) {
                    logProgress(reader);
                }
            }
            
            // Write footer
            writer.writeFooter();
            writer.flush();
            
            long endTime = System.currentTimeMillis();
            long durationMs = endTime - startTime;
            
            // Create stats
            AnonymizationStats stats = AnonymizationStats.builder()
                .totalStatements(totalStatements)
                .insertStatements(insertStatements)
                .rowsProcessed(rowsProcessed)
                .valuesAnonymized(valuesAnonymized)
                .durationMs(durationMs)
                .inputFilePath(inputPath.toString())
                .outputFilePath(outputPath.toString())
                .build();
            
            logSummary(stats);
            
            return stats;
            
        } catch (Exception e) {
            log.error("Anonymization failed", e);
            throw new AnonymizationException("Failed to anonymize dump file", e);
        }
    }
    
    /**
     * Process an INSERT statement by anonymizing sensitive columns
     */
    private void processInsertStatement(SQLStatement statement, SQLDumpWriter writer) 
            throws AnonymizationException {
        
        String databaseName = statement.getDatabaseName();
        String tableName = statement.getTableName();
        List<String> columnNames = statement.getColumnNames();
        List<List<String>> originalRows = statement.getRowValues();
        
        // Get anonymization rules for this table
        List<ColumnRegistry> tableRules = registry.getTableRules(databaseName, tableName);
        
        if (tableRules.isEmpty()) {
            // No anonymization needed - write as-is
            writer.writeStatement(statement);
            rowsProcessed += originalRows.size();
            return;
        }
        
        // Anonymize rows
        List<List<String>> anonymizedRows = new ArrayList<>();
        
        for (List<String> originalRow : originalRows) {
            List<String> anonymizedRow = anonymizeRow(
                databaseName, tableName, columnNames, originalRow, tableRules
            );
            anonymizedRows.add(anonymizedRow);
            rowsProcessed++;
        }
        
        // Write anonymized INSERT
        writer.writeInsert(databaseName, tableName, columnNames, anonymizedRows);
    }
    
    /**
     * Anonymize a single row of data
     */
    private List<String> anonymizeRow(String databaseName, String tableName,
                                      List<String> columnNames, List<String> originalRow,
                                      List<ColumnRegistry> tableRules) 
            throws AnonymizationException {
        
        List<String> anonymizedRow = new ArrayList<>(originalRow);
        
        // Process each column
        for (int i = 0; i < columnNames.size() && i < originalRow.size(); i++) {
            String columnName = columnNames.get(i);
            String originalValue = originalRow.get(i);
            
            // Check if this column needs anonymization
            ColumnRegistry columnRule = findColumnRule(columnName, tableRules);
            
            if (columnRule != null && originalValue != null && !"NULL".equalsIgnoreCase(originalValue)) {
                String anonymizedValue = anonymizeValue(
                    databaseName, tableName, columnName, originalValue, columnRule
                );
                anonymizedRow.set(i, anonymizedValue);
                valuesAnonymized++;
            }
        }
        
        return anonymizedRow;
    }
    
    /**
     * Anonymize a single value using the appropriate strategy
     */
    private String anonymizeValue(String databaseName, String tableName, String columnName,
                                  String originalValue, ColumnRegistry columnRule) 
            throws AnonymizationException {
        
        String strategyName = columnRule.getAnonymizationRule();
        
        if (strategyName == null || "PRESERVE".equals(strategyName)) {
            return originalValue;
        }
        
        // Get strategy
        AnonymizationStrategy strategy = strategyFactory.getStrategy(strategyName);
        
        // Build context
        StrategyContext context = StrategyContext.builder()
            .databaseName(databaseName)
            .tableName(tableName)
            .columnName(columnName)
            .dataType(columnRule.getDataType())
            .locale("en-IND")
            .build();
        
        // Apply strategy
        AnonymizationResult result = strategy.anonymize(originalValue, context);
        
        return result.anonymizedValue();
    }
    
    /**
     * Find the anonymization rule for a specific column
     */
    private ColumnRegistry findColumnRule(String columnName, List<ColumnRegistry> tableRules) {
        for (ColumnRegistry rule : tableRules) {
            if (rule.getCanonicalName().equalsIgnoreCase(columnName)) {
                return rule;
            }
        }
        return null;
    }
    
    /**
     * Reset counters for new run
     */
    private void resetCounters() {
        totalStatements = 0;
        insertStatements = 0;
        rowsProcessed = 0;
        valuesAnonymized = 0;
    }
    
    /**
     * Log progress during processing
     */
    private void logProgress(SQLDumpReader reader) {
        double progress = reader.getProgress() * 100;
        log.info("Progress: {:.1f}% | Statements: {} | Rows: {} | Anonymized: {}",
            progress, totalStatements, rowsProcessed, valuesAnonymized);
    }
    
    /**
     * Log summary after completion
     */
    private void logSummary(AnonymizationStats stats) {
        log.info("===== Anonymization Complete =====");
        log.info("Total statements: {}", stats.getTotalStatements());
        log.info("INSERT statements: {}", stats.getInsertStatements());
        log.info("Rows processed: {}", stats.getRowsProcessed());
        log.info("Values anonymized: {}", stats.getValuesAnonymized());
        log.info("Duration: {} seconds", stats.getDurationMs() / 1000.0);
        log.info("Throughput: {:.0f} rows/second", 
            stats.getRowsProcessed() / (stats.getDurationMs() / 1000.0));
    }
}
