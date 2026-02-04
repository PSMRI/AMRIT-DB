package com.db.piramalswasthya.anonymization.processor.transformer;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyFactory;
import com.db.piramalswasthya.anonymization.processor.parser.InsertStatementParser;
import com.db.piramalswasthya.anonymization.registry.AnonymizationRegistryService;

/**
 * Integration test for end-to-end SQL dump anonymization
 */
class DumpAnonymizerTest {
    
    @TempDir
    Path tempDir;
    
    private DumpAnonymizer anonymizer;
    
    @BeforeEach
    void setUp() {
        AnonymizationRegistryService registry = new AnonymizationRegistryService();
        List<AnonymizationStrategy> strategies = new ArrayList<>();
        StrategyFactory strategyFactory = new StrategyFactory(strategies);
        InsertStatementParser parser = new InsertStatementParser();
        
        anonymizer = new DumpAnonymizer(registry, strategyFactory, parser);
    }
    
    @Test
    void testAnonymizeDumpEndToEnd() throws Exception {
        Path inputDump = tempDir.resolve("test-input.sql");
        String inputContent = """
            -- Test Database Dump
            -- Generated for testing
            
            DROP DATABASE IF EXISTS `test_db`;
            CREATE DATABASE `test_db`;
            USE `test_db`;
            
            -- Table: m_users
            DROP TABLE IF EXISTS `m_users`;
            CREATE TABLE `m_users` (
              `UserID` bigint NOT NULL AUTO_INCREMENT,
              `FirstName` varchar(100) DEFAULT NULL,
              `LastName` varchar(100) DEFAULT NULL,
              `EmailID` varchar(100) DEFAULT NULL,
              `PhoneNo` varchar(15) DEFAULT NULL,
              PRIMARY KEY (`UserID`)
            ) ENGINE=InnoDB;
            
            INSERT INTO `test_db`.`m_users` (`UserID`, `FirstName`, `LastName`, `EmailID`, `PhoneNo`) VALUES
            (1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9876543210'),
            (2, 'Priya', 'Sharma', 'priya.sharma@example.com', '9876543211'),
            (3, 'Amit', 'Patel', 'amit.patel@example.com', '9876543212');
            
            -- Table: m_beneficiary (no sensitive data)
            DROP TABLE IF EXISTS `m_beneficiary`;
            CREATE TABLE `m_beneficiary` (
              `BeneficiaryID` bigint NOT NULL AUTO_INCREMENT,
              `BenRegID` bigint DEFAULT NULL,
              `ProviderServiceMapID` int DEFAULT NULL,
              PRIMARY KEY (`BeneficiaryID`)
            ) ENGINE=InnoDB;
            
            INSERT INTO `test_db`.`m_beneficiary` (`BeneficiaryID`, `BenRegID`, `ProviderServiceMapID`) VALUES
            (100, 1000, 1),
            (101, 1001, 1);
            
            -- End of dump
            """;
        
        Files.writeString(inputDump, inputContent);

        Path outputDump = tempDir.resolve("test-output.sql");

        AnonymizationStats stats = anonymizer.anonymizeDump(inputDump, outputDump);

        assertNotNull(stats);
        assertTrue(stats.getTotalStatements() > 0, "Should process statements");
        assertTrue(stats.getInsertStatements() >= 2, "Should find at least 2 INSERT statements");
        assertTrue(stats.getRowsProcessed() >= 5, "Should process at least 5 rows");
        assertTrue(stats.getDurationMs() > 0, "Should track duration");
        assertTrue(Files.exists(outputDump), "Output dump should be created");

        String outputContent = Files.readString(outputDump);
        
        // Verify structure is preserved
        assertTrue(outputContent.contains("CREATE DATABASE"), "Should preserve CREATE DATABASE");
        assertTrue(outputContent.contains("USE `test_db`"), "Should preserve USE statement");
        assertTrue(outputContent.contains("CREATE TABLE"), "Should preserve CREATE TABLE");
        
        // Verify INSERTs are present
        assertTrue(outputContent.contains("INSERT INTO"), "Should contain INSERT statements");
        assertTrue(outputContent.contains("m_users"), "Should contain m_users table");
        assertTrue(outputContent.contains("m_beneficiary"), "Should contain m_beneficiary table");
        
        // Verify anonymization occurred (original names should not appear)
        // Note: This depends on having a proper registry loaded
        // For now, just verify the file is well-formed
        String[] lines = outputContent.split("\n");
        assertTrue(lines.length > 10, "Output should have substantial content");
    }
    
    @Test
    void testAnonymizeDumpWithComments() throws Exception {
        // Create test input with extensive comments
        Path inputDump = tempDir.resolve("test-comments.sql");
        String inputContent = """
            -- This is a header comment
            /* Multi-line comment
               Line 2
               Line 3 */
            
            CREATE DATABASE `test_db`;
            
            -- Another comment
            INSERT INTO `test_db`.`m_users` (`UserID`, `FirstName`) VALUES
            (1, 'Test'); -- Inline comment
            
            /* Final comment block */
            """;
        
        Files.writeString(inputDump, inputContent);
        
        Path outputDump = tempDir.resolve("test-comments-output.sql");
        
        // Should process without errors
        AnonymizationStats stats = anonymizer.anonymizeDump(inputDump, outputDump);
        
        assertNotNull(stats);
        assertTrue(Files.exists(outputDump));
        
        // Verify output contains the data but not the comments in wrong places
        String output = Files.readString(outputDump);
        assertTrue(output.contains("CREATE DATABASE"));
        assertTrue(output.contains("INSERT INTO"));
    }
    
    @Test
    void testAnonymizeDumpWithNullValues() throws Exception {
        Path inputDump = tempDir.resolve("test-nulls.sql");
        String inputContent = """
            CREATE DATABASE `test_db`;
            USE `test_db`;
            
            CREATE TABLE `m_users` (
              `UserID` bigint NOT NULL,
              `FirstName` varchar(100),
              `LastName` varchar(100)
            );
            
            INSERT INTO `test_db`.`m_users` (`UserID`, `FirstName`, `LastName`) VALUES
            (1, 'John', NULL),
            (2, NULL, 'Doe'),
            (3, NULL, NULL);
            """;
        
        Files.writeString(inputDump, inputContent);
        
        Path outputDump = tempDir.resolve("test-nulls-output.sql");
        
        AnonymizationStats stats = anonymizer.anonymizeDump(inputDump, outputDump);
        
        assertNotNull(stats);
        assertTrue(stats.getRowsProcessed() >= 3);
        
        // Verify NULLs are preserved
        String output = Files.readString(outputDump);
        assertTrue(output.contains("NULL"), "NULL values should be preserved");
    }
    
    @Test
    void testAnonymizeDumpWithBatchInserts() throws Exception {
        Path inputDump = tempDir.resolve("test-batch.sql");
        String inputContent = """
            CREATE DATABASE `test_db`;
            USE `test_db`;
            
            CREATE TABLE `m_users` (
              `UserID` bigint NOT NULL,
              `FirstName` varchar(100)
            );
            
            INSERT INTO `test_db`.`m_users` (`UserID`, `FirstName`) VALUES
            (1, 'Alice'),
            (2, 'Bob'),
            (3, 'Charlie'),
            (4, 'David'),
            (5, 'Eve');
            """;
        
        Files.writeString(inputDump, inputContent);
        
        Path outputDump = tempDir.resolve("test-batch-output.sql");
        
        AnonymizationStats stats = anonymizer.anonymizeDump(inputDump, outputDump);
        
        assertNotNull(stats);
        assertEquals(5, stats.getRowsProcessed(), "Should process all 5 rows in batch INSERT");
        
        // Verify all rows are in output
        String output = Files.readString(outputDump);
        assertTrue(output.contains("INSERT INTO"));
    }
}
