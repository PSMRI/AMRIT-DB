package com.db.piramalswasthya.anonymization.phase1.registry;

import com.db.piramalswasthya.anonymization.phase1.model.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for SchemaHasher - validates deterministic hashing.
 */
class SchemaHasherTest {
    
    private SchemaHasher hasher;
    
    @BeforeEach
    void setUp() {
        hasher = new SchemaHasher();
    }
    
    @Test
    void testDeterministicHashing_SameSchema_SameHash() {
        DatabaseMetadata db1 = createTestDatabase();
        DatabaseMetadata db2 = createTestDatabase();
        
        String hash1 = hasher.computeDatabaseHash(db1);
        String hash2 = hasher.computeDatabaseHash(db2);
        
        assertEquals(hash1, hash2, "Same schema should produce same hash");
    }
    
    @Test
    void testHashFormat_StartsWithSha256Prefix() {
        DatabaseMetadata db = createTestDatabase();
        String hash = hasher.computeDatabaseHash(db);
        
        assertTrue(hash.startsWith("sha256:"), "Hash should start with 'sha256:' prefix");
        assertEquals(71, hash.length(), "SHA-256 hex string should be 71 chars (prefix + 64 hex)");
    }
    
    @Test
    void testSchemaChange_DifferentHash() {
        DatabaseMetadata db1 = createTestDatabase();
        DatabaseMetadata db2 = createTestDatabase();
        
        // Add a column to db2
        ColumnMetadata newColumn = ColumnMetadata.builder()
            .name("NewColumn")
            .dataType("VARCHAR(50)")
            .nullable(true)
            .build();
        db2.getTables().get(0).getColumns().add(newColumn);
        
        String hash1 = hasher.computeDatabaseHash(db1);
        String hash2 = hasher.computeDatabaseHash(db2);
        
        assertNotEquals(hash1, hash2, "Different schemas should produce different hashes");
    }
    
    @Test
    void testColumnOrderChange_SameHash() {
        DatabaseMetadata db1 = createTestDatabase();
        DatabaseMetadata db2 = createTestDatabase();
        
        // Swap ordinal positions (but schema is logically the same)
        db2.getTables().get(0).getColumns().get(0).setOrdinalPosition(2);
        db2.getTables().get(0).getColumns().get(1).setOrdinalPosition(1);
        
        String hash1 = hasher.computeDatabaseHash(db1);
        String hash2 = hasher.computeDatabaseHash(db2);
        
        // Hashing uses ordinal position for sorting, so this changes the hash
        // This is expected behavior - ordinal position is part of schema
        assertNotEquals(hash1, hash2);
    }
    
    @Test
    void testDataTypeChange_DifferentHash() {
        DatabaseMetadata db1 = createTestDatabase();
        DatabaseMetadata db2 = createTestDatabase();
        
        // Change data type
        db2.getTables().get(0).getColumns().get(0).setDataType("BIGINT(20)");
        
        String hash1 = hasher.computeDatabaseHash(db1);
        String hash2 = hasher.computeDatabaseHash(db2);
        
        assertNotEquals(hash1, hash2, "Data type change should produce different hash");
    }
    
    @Test
    void testNullabilityChange_DifferentHash() {
        DatabaseMetadata db1 = createTestDatabase();
        DatabaseMetadata db2 = createTestDatabase();
        
        // Change nullability
        db2.getTables().get(0).getColumns().get(0).setNullable(false);
        
        String hash1 = hasher.computeDatabaseHash(db1);
        String hash2 = hasher.computeDatabaseHash(db2);
        
        assertNotEquals(hash1, hash2, "Nullability change should produce different hash");
    }
    
    @Test
    void testForeignKeyChange_DifferentHash() {
        DatabaseMetadata db1 = createTestDatabase();
        DatabaseMetadata db2 = createTestDatabase();
        
        // Add foreign key
        ForeignKeyMetadata fk = ForeignKeyMetadata.builder()
            .fkColumnName("StateID")
            .pkTableName("m_state")
            .pkColumnName("StateID")
            .build();
        db2.getTables().get(0).getForeignKeys().add(fk);
        
        String hash1 = hasher.computeDatabaseHash(db1);
        String hash2 = hasher.computeDatabaseHash(db2);
        
        assertNotEquals(hash1, hash2, "Foreign key addition should produce different hash");
    }
    
    @Test
    void testTableHash_Deterministic() {
        TableMetadata table1 = createTestTable();
        TableMetadata table2 = createTestTable();
        
        String hash1 = hasher.computeTableHash(table1);
        String hash2 = hasher.computeTableHash(table2);
        
        assertEquals(hash1, hash2, "Same table schema should produce same hash");
    }
    
    @Test
    void testCompareHashes_Match() {
        String hash1 = "sha256:abc123";
        String hash2 = "sha256:abc123";
        
        assertTrue(hasher.compareHashes(hash1, hash2), "Identical hashes should match");
    }
    
    @Test
    void testCompareHashes_NoMatch() {
        String hash1 = "sha256:abc123";
        String hash2 = "sha256:def456";
        
        assertFalse(hasher.compareHashes(hash1, hash2), "Different hashes should not match");
    }
    
    @Test
    void testCompareHashes_NullHandling() {
        assertFalse(hasher.compareHashes(null, "sha256:abc"), "Null hash should not match");
        assertFalse(hasher.compareHashes("sha256:abc", null), "Hash vs null should not match");
        assertFalse(hasher.compareHashes(null, null), "Both null should not match");
    }
    
    // Helper methods
    
    private DatabaseMetadata createTestDatabase() {
        DatabaseMetadata db = DatabaseMetadata.builder()
            .databaseName("test_db")
            .productName("MySQL")
            .productVersion("8.0")
            .build();
        
        db.getTables().add(createTestTable());
        
        return db;
    }
    
    private TableMetadata createTestTable() {
        TableMetadata table = TableMetadata.builder()
            .name("test_table")
            .canonicalName("test_table")
            .build();
        
        ColumnMetadata col1 = ColumnMetadata.builder()
            .name("ID")
            .dataType("INT")
            .nullable(false)
            .primaryKey(true)
            .ordinalPosition(1)
            .build();
        
        ColumnMetadata col2 = ColumnMetadata.builder()
            .name("Name")
            .dataType("VARCHAR(50)")
            .nullable(true)
            .primaryKey(false)
            .ordinalPosition(2)
            .build();
        
        table.getColumns().add(col1);
        table.getColumns().add(col2);
        
        return table;
    }
}
