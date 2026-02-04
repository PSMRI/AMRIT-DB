package com.db.piramalswasthya.anonymization.processor.parser;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.processor.model.SQLStatement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Simple test to verify SQL parsing works correctly.
 * Run this manually to test the parser implementation.
 */
public class ParserTestRunner {
    
    private static final Logger log = LoggerFactory.getLogger(ParserTestRunner.class);
    
    public static void main(String[] args) {
        log.info("===== SQL Dump Parser Test =====");
        
        // Test file path
        Path testFile = Paths.get("src/test/resources/sample-dump.sql");
        
        if (!testFile.toFile().exists()) {
            log.error("Test file not found: {}", testFile);
            System.exit(1);
        }
        
        log.info("Reading SQL dump: {}", testFile);
        
        int totalStatements = 0;
        int insertStatements = 0;
        int createStatements = 0;
        int otherStatements = 0;
        int totalRows = 0;
        
        try (SQLDumpReader reader = new SQLDumpReader(testFile)) {
            InsertStatementParser parser = new InsertStatementParser();
            
            String sql;
            while ((sql = reader.readStatement()) != null) {
                totalStatements++;
                
                SQLStatement stmt = parser.parse(sql);
                
                switch (stmt.getType()) {
                    case INSERT:
                        insertStatements++;
                        totalRows += stmt.getRowCount();
                        log.info("INSERT: {} -> {} rows, {} columns",
                            stmt.getTableName(),
                            stmt.getRowCount(),
                            stmt.getColumnNames().size());
                        
                        // Show first row values
                        if (!stmt.getRowValues().isEmpty()) {
                            log.debug("  First row: {}", stmt.getRowValues().get(0));
                        }
                        break;
                        
                    case CREATE_TABLE:
                        createStatements++;
                        log.info("CREATE TABLE: {}", stmt.getTableName());
                        break;
                        
                    case USE_DATABASE:
                        log.info("USE: {}", stmt.getDatabaseName());
                        otherStatements++;
                        break;
                        
                    case COMMENT:
                        log.debug("COMMENT: {}", sql.substring(0, Math.min(50, sql.length())));
                        otherStatements++;
                        break;
                        
                    default:
                        log.debug("OTHER: {}", sql.substring(0, Math.min(50, sql.length())));
                        otherStatements++;
                        break;
                }
                
                // Show progress every 10 statements
                if (totalStatements % 10 == 0) {
                    log.info("Progress: {}% - {} statements", 
                        (int)(reader.getProgress() * 100),
                        totalStatements);
                }
            }
            
            log.info("===== Parsing Complete =====");
            log.info("Total statements: {}", totalStatements);
            log.info("INSERT statements: {} ({} total rows)", insertStatements, totalRows);
            log.info("CREATE statements: {}", createStatements);
            log.info("Other statements: {}", otherStatements);
            log.info("File size: {} bytes", reader.getFileSize());
            log.info("Lines read: {}", reader.getLineNumber());
            
        } catch (AnonymizationException e) {
            log.error("Parser test failed", e);
            System.exit(1);
        }
        
        log.info("===== Test Passed =====");
    }
}
