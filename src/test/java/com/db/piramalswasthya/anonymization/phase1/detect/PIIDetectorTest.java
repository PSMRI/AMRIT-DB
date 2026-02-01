package com.db.piramalswasthya.anonymization.phase1.detect;

import com.db.piramalswasthya.anonymization.phase1.model.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for PIIDetector - validates heuristic classification.
 */
class PIIDetectorTest {
    
    private PIIDetector detector;
    
    @BeforeEach
    void setUp() {
        detector = new PIIDetector();
        // Manually initialize since @PostConstruct won't run in unit tests (should I be concerned?, still looking up why)
        ReflectionTestUtils.invokeMethod(detector, "initialize");
    }
    
    @Test
    void testBenRegID_ClassifiedAsLinkingKey() {
        ColumnMetadata column = createColumn("BeneficiaryRegID", "BIGINT(20)");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.LINKING_KEY, column.getPiiCategory());
        assertEquals(RiskLevel.LINKING_KEY, column.getRiskLevel());
        assertTrue(column.isLinkingKey());
    }
    
    @Test
    void testFirstName_ClassifiedAsCriticalPII() {
        ColumnMetadata column = createColumn("FirstName", "VARCHAR(50)");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.PERSONAL_IDENTIFIER, column.getPiiCategory());
        assertEquals(RiskLevel.CRITICAL, column.getRiskLevel());
        assertTrue(column.requiresAnonymization());
    }
    
    @Test
    void testPhoneNo_ClassifiedAsCriticalContact() {
        ColumnMetadata column = createColumn("PhoneNo", "VARCHAR(15)");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.CONTACT, column.getPiiCategory());
        assertEquals(RiskLevel.CRITICAL, column.getRiskLevel());
    }
    
    @Test
    void testAadharNo_ClassifiedAsGovernmentID() {
        ColumnMetadata column = createColumn("AadharNo", "VARCHAR(12)");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.GOVERNMENT_ID, column.getPiiCategory());
        assertEquals(RiskLevel.CRITICAL, column.getRiskLevel());
    }
    
    @Test
    void testEmail_ClassifiedAsCriticalContact() {
        ColumnMetadata column = createColumn("EmailID", "VARCHAR(100)");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.CONTACT, column.getPiiCategory());
        assertEquals(RiskLevel.CRITICAL, column.getRiskLevel());
    }
    
    @Test
    void testDiagnosis_ClassifiedAsMedicalCondition() {
        ColumnMetadata column = createColumn("DiagnosisText", "TEXT");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.MEDICAL_CONDITION, column.getPiiCategory());
        assertEquals(RiskLevel.MEDIUM, column.getRiskLevel());
    }
    
    @Test
    void testNotes_ClassifiedAsFreeTextRisk() {
        ColumnMetadata column = createColumn("ClinicalNotes", "TEXT");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.FREE_TEXT_PII_RISK, column.getPiiCategory());
        assertEquals(RiskLevel.MEDIUM, column.getRiskLevel());
    }
    
    @Test
    void testAge_ClassifiedAsLowRisk() {
        ColumnMetadata column = createColumn("Age", "INT");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.DEMOGRAPHIC, column.getPiiCategory());
        assertEquals(RiskLevel.LOW, column.getRiskLevel());
        assertFalse(column.requiresAnonymization()); // Risk level below threshold
    }
    
    @Test
    void testCreatedDate_ClassifiedAsNonSensitive() {
        ColumnMetadata column = createColumn("CreatedDate", "TIMESTAMP");
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.METADATA, column.getPiiCategory());
        assertEquals(RiskLevel.NONE, column.getRiskLevel());
    }
    
    @Test
    void testPrimaryKeyID_ClassifiedAsNonPII() {
        ColumnMetadata column = createColumn("ID", "BIGINT");
        column.setPrimaryKey(true);
        SchemaCatalog catalog = createCatalog(column);
        
        detector.annotatePII(catalog);
        
        // Primary key IDs should be non-PII (fallback heuristic)
        assertEquals(PIICategory.NON_PII, column.getPiiCategory());
        assertEquals(RiskLevel.NONE, column.getRiskLevel());
    }
    
    @Test
    void testMultipleColumns_CorrectCounts() {
        ColumnMetadata col1 = createColumn("FirstName", "VARCHAR(50)");
        ColumnMetadata col2 = createColumn("PhoneNo", "VARCHAR(15)");
        ColumnMetadata col3 = createColumn("Age", "INT");
        ColumnMetadata col4 = createColumn("CreatedDate", "TIMESTAMP");
        
        TableMetadata table = TableMetadata.builder()
            .name("test_table")
            .build();
        table.getColumns().add(col1);
        table.getColumns().add(col2);
        table.getColumns().add(col3);
        table.getColumns().add(col4);
        
        DatabaseMetadata db = DatabaseMetadata.builder()
            .databaseName("test_db")
            .build();
        db.getTables().add(table);
        
        SchemaCatalog catalog = SchemaCatalog.builder().build();
        catalog.getDatabases().add(db);
        
        detector.annotatePII(catalog);
        
        // FirstName and PhoneNo require anonymization (CRITICAL)
        // Age is LOW risk (below threshold)
        // CreatedDate is NONE
        assertEquals(2, table.getPiiColumnCount());
        assertTrue(col1.requiresAnonymization());
        assertTrue(col2.requiresAnonymization());
        assertFalse(col3.requiresAnonymization());
        assertFalse(col4.requiresAnonymization());
    }
    
    @Test
    void testCaseInsensitiveMatching() {
        ColumnMetadata col1 = createColumn("firstname", "VARCHAR(50)");
        ColumnMetadata col2 = createColumn("PHONENO", "VARCHAR(15)");
        ColumnMetadata col3 = createColumn("eMaIl", "VARCHAR(100)");
        
        SchemaCatalog catalog = SchemaCatalog.builder().build();
        DatabaseMetadata db = DatabaseMetadata.builder().databaseName("test_db").build();
        TableMetadata table = TableMetadata.builder().name("test_table").build();
        table.getColumns().add(col1);
        table.getColumns().add(col2);
        table.getColumns().add(col3);
        db.getTables().add(table);
        catalog.getDatabases().add(db);
        
        detector.annotatePII(catalog);
        
        assertEquals(PIICategory.PERSONAL_IDENTIFIER, col1.getPiiCategory());
        assertEquals(PIICategory.CONTACT, col2.getPiiCategory());
        assertEquals(PIICategory.CONTACT, col3.getPiiCategory());
    }
    
    // Helper methods
    
    private ColumnMetadata createColumn(String name, String dataType) {
        return ColumnMetadata.builder()
            .name(name)
            .dataType(dataType)
            .nullable(true)
            .primaryKey(false)
            .uniqueConstraint(false)
            .canonicalName(name)
            .build();
    }
    
    private SchemaCatalog createCatalog(ColumnMetadata column) {
        TableMetadata table = TableMetadata.builder()
            .name("test_table")
            .canonicalName("test_table")
            .build();
        table.getColumns().add(column);
        
        DatabaseMetadata db = DatabaseMetadata.builder()
            .databaseName("test_db")
            .build();
        db.getTables().add(table);
        
        SchemaCatalog catalog = SchemaCatalog.builder().build();
        catalog.getDatabases().add(db);
        
        return catalog;
    }
}
