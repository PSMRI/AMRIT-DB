package com.db.piramalswasthya.anonymization.lookup;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;

/**
 * Tests for H2LookupManager embedded database functionality
 */
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class H2LookupManagerTest {
    
    private static Path testDbPath;
    private H2LookupManager lookupManager;
    
    @BeforeAll
    static void setupTestDb() throws IOException {
        // Create temp directory for test database
        testDbPath = Files.createTempDirectory("amrit-lookup-test");
        Path dbFile = testDbPath.resolve("test-lookup");
        System.out.println("Test DB path: " + dbFile);
    }
    
    @BeforeEach
    void setUp() throws AnonymizationException {
        Path dbFile = testDbPath.resolve("test-lookup");
        // Use fixed password for all tests to avoid encryption mismatch
        lookupManager = new H2LookupManager(dbFile, "TEST_SALT_2024_SECURE", "TEST_PASSWORD_123456");
    }
    
    @AfterEach
    void tearDown() throws AnonymizationException {
        if (lookupManager != null) {
            lookupManager.close();
        }
    }
    
    @AfterAll
    static void cleanup() {
        // Clean up test database files
        try {
            if (testDbPath != null && Files.exists(testDbPath)) {
                Files.walk(testDbPath)
                    .sorted((a, b) -> -a.compareTo(b))  // Delete files before directories
                    .forEach(path -> {
                        try {
                            Files.deleteIfExists(path);
                        } catch (IOException e) {
                            System.err.println("Failed to delete: " + path);
                        }
                    });
            }
        } catch (IOException e) {
            System.err.println("Cleanup failed: " + e.getMessage());
        }
    }
    
    @Test
    @Order(1)
    void testStoreAndFindMapping() throws AnonymizationException {
        // Store a mapping
        lookupManager.storeMapping(
            "db_identity", "m_benregidmapping", "BenRegID",
            "12345", "ANON-98765", "HASH_SHA256", "BIGINT"
        );
        
        // Find it
        Optional<String> result = lookupManager.findAnonymized(
            "db_identity", "m_benregidmapping", "BenRegID", "12345"
        );
        
        assertTrue(result.isPresent(), "Should find stored mapping");
        assertEquals("ANON-98765", result.get(), "Should return correct anonymized value");
    }
    
    @Test
    @Order(2)
    void testFindNonExistentMapping() throws AnonymizationException {
        // Try to find mapping that doesn't exist
        Optional<String> result = lookupManager.findAnonymized(
            "db_identity", "m_benregidmapping", "BenRegID", "99999"
        );
        
        assertFalse(result.isPresent(), "Should not find non-existent mapping");
    }
    
    @Test
    @Order(3)
    void testConsistentHashing() throws AnonymizationException {
        // Store mapping
        lookupManager.storeMapping(
            "db_identity", "users", "phone",
            "9876543210", "MASKED-XXX3210", "PARTIAL_MASK", "VARCHAR"
        );
        
        // Retrieve multiple times - should always return same value
        for (int i = 0; i < 5; i++) {
            Optional<String> result = lookupManager.findAnonymized(
                "db_identity", "users", "phone", "9876543210"
            );
            
            assertTrue(result.isPresent(), "Should find mapping on iteration " + i);
            assertEquals("MASKED-XXX3210", result.get(), 
                "Should return same value on iteration " + i);
        }
    }
    
    @Test
    @Order(4)
    void testMultipleColumnsInSameTable() throws AnonymizationException {
        // Store mappings for different columns
        lookupManager.storeMapping(
            "db_identity", "m_user", "firstName",
            "John", "Raj", "RANDOM_FAKE", "VARCHAR"
        );
        
        lookupManager.storeMapping(
            "db_identity", "m_user", "lastName",
            "Doe", "Kumar", "RANDOM_FAKE", "VARCHAR"
        );
        
        lookupManager.storeMapping(
            "db_identity", "m_user", "emailID",
            "john@example.com", "raj@example.com", "RANDOM_FAKE", "VARCHAR"
        );
        
        // Retrieve all
        Optional<String> firstName = lookupManager.findAnonymized(
            "db_identity", "m_user", "firstName", "John"
        );
        Optional<String> lastName = lookupManager.findAnonymized(
            "db_identity", "m_user", "lastName", "Doe"
        );
        Optional<String> email = lookupManager.findAnonymized(
            "db_identity", "m_user", "emailID", "john@example.com"
        );
        
        assertTrue(firstName.isPresent() && lastName.isPresent() && email.isPresent(),
            "Should find all column mappings");
        assertEquals("Raj", firstName.get());
        assertEquals("Kumar", lastName.get());
        assertEquals("raj@example.com", email.get());
    }
    
    @Test
    @Order(5)
    void testLookupCount() throws AnonymizationException {
        // Clear and count
        lookupManager.clearAll();
        assertEquals(0, lookupManager.getLookupCount(), "Should be empty after clear");
        
        // Add some entries
        lookupManager.storeMapping("db1", "table1", "col1", "val1", "anon1", "HASH", "VARCHAR");
        lookupManager.storeMapping("db1", "table1", "col2", "val2", "anon2", "HASH", "VARCHAR");
        lookupManager.storeMapping("db1", "table2", "col1", "val3", "anon3", "HASH", "VARCHAR");
        
        assertEquals(3, lookupManager.getLookupCount(), "Should have 3 entries");
    }
    
    @Test
    @Order(6)
    void testDuplicateStorageUpdatesTimestamp() throws AnonymizationException {
        // Store initial mapping
        lookupManager.storeMapping(
            "db_identity", "test_table", "test_col",
            "original", "anonymized", "HASH", "VARCHAR"
        );
        
        // Store again with same key (should update, not fail)
        assertDoesNotThrow(() -> {
            lookupManager.storeMapping(
                "db_identity", "test_table", "test_col",
                "original", "anonymized", "HASH", "VARCHAR"
            );
        }, "Should handle duplicate storage gracefully");
        
        // Verify still returns correct value
        Optional<String> result = lookupManager.findAnonymized(
            "db_identity", "test_table", "test_col", "original"
        );
        
        assertTrue(result.isPresent());
        assertEquals("anonymized", result.get());
    }
    
    @Test
    @Order(7)
    void testPersistenceAcrossSessions() throws AnonymizationException {
        Path dbFile = testDbPath.resolve("persistence-test");
        
        // Session 1: Store data
        try (H2LookupManager session1 = new H2LookupManager(dbFile, "SALT_VALUE_16CHARS", "TEST_PASSWORD_123456")) {
            session1.storeMapping("db1", "table1", "col1", "value1", "anon1", "HASH", "VARCHAR");
        }
        
        // Session 2: Read data
        try (H2LookupManager session2 = new H2LookupManager(dbFile, "SALT_VALUE_16CHARS", "TEST_PASSWORD_123456")) {
            Optional<String> result = session2.findAnonymized("db1", "table1", "col1", "value1");
            
            assertTrue(result.isPresent(), "Should persist data across sessions");
            assertEquals("anon1", result.get());
        }
    }
    
    @Test
    @Order(8)
    void testDifferentDatabasesIsolated() throws AnonymizationException {
        // Store same column/table in different databases
        lookupManager.storeMapping(
            "db_identity", "users", "phone", "1234567890", "ANON-1", "HASH", "VARCHAR"
        );
        
        lookupManager.storeMapping(
            "db_report", "users", "phone", "1234567890", "ANON-2", "HASH", "VARCHAR"
        );
        
        // Retrieve - should get different values
        Optional<String> identity = lookupManager.findAnonymized(
            "db_identity", "users", "phone", "1234567890"
        );
        Optional<String> report = lookupManager.findAnonymized(
            "db_report", "users", "phone", "1234567890"
        );
        
        assertTrue(identity.isPresent() && report.isPresent());
        assertEquals("ANON-1", identity.get());
        assertEquals("ANON-2", report.get());
        assertNotEquals(identity.get(), report.get(), 
            "Different databases should have different anonymized values");
    }
}
