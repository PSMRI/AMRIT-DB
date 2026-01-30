# AMRIT Database Anonymization - Phase 1: Analysis & Planning

**Project**: Automated UAT Database Refresh with Anonymization  
**Technology Stack**: Java 17, Spring Boot 3.3.2, MySQL 8.0  
**Phase**: 1 of 3 - Analysis & Planning  
**Status**: Planning  
**Last Updated**: January 28, 2026

---

## Executive Summary

Phase 1 focuses on **systematic analysis** of all AMRIT databases to identify PII/sensitive fields, determine anonymization strategies, and establish the technical foundation for a Java-based anonymization solution. No data transformation occurs in this phase - only analysis, documentation, and tool development.

### Language & Technology Constraints

- ✅ **Primary Language**: Java 17 (cross-platform)
- ✅ **Framework**: Spring Boot 3.3.2
- ✅ **Orchestration**: Java-based (no OS-specific scripts)
- ✅ **Data Generation**: JavaFaker library + BeneficiaryID-Generation-API
- ✅ **OS Support**: Windows, Linux, macOS
- ❌ **Not Allowed**: Python, JavaScript, Bash, PowerShell, or platform-specific scripts

---

## Table of Contents

1. [Phase 1 Objectives](#1-phase-1-objectives)
2. [Database Analysis Strategy](#2-database-analysis-strategy)
3. [Java Tool Architecture](#3-java-tool-architecture)
4. [Anonymization Strategies](#4-anonymization-strategies)
5. [Output Artifacts](#5-output-artifacts)
6. [Implementation Timeline](#6-implementation-timeline)
7. [Phase 2 & 3 Preview](#7-phase-2--3-preview)

---

## 1. Phase 1 Objectives

### 1.1 Primary Goals

| Objective | Description | Success Criteria |
|-----------|-------------|------------------|
| **Database Schema Discovery** | Analyze all 4 databases and extract complete table/column metadata | 100% table coverage documented |
| **PII Identification** | Identify all fields containing PII or sensitive health data | Classification for every sensitive field |
| **Anonymization Strategy Definition** | Define how each PII field type will be anonymized | Strategy document with field-level mappings |
| **Constraint Analysis** | Document foreign keys, unique constraints, and cross-DB relationships | Complete ER diagram and constraint catalog |
| **Tool Development** | Build Java analyzer tool to automate discovery | Working schema analyzer with JSON/CSV export |
| **Sample Data Generation** | Integrate JavaFaker + BenGenAPI for realistic fake data | Sample dataset for testing |

### 1.2 Out of Scope for Phase 1

- ❌ Actual data anonymization (Phase 2)
- ❌ Production database backup/restore (Phase 3)
- ❌ Jenkins pipeline setup (Phase 3)
- ❌ UAT environment restoration (Phase 3)

---

## 2. Database Analysis Strategy

### 2.1 Target Databases

Based on AMRIT-DB Flyway migrations:

| Database | Migration Count | Estimated Tables | Priority | Analysis Complexity |
|----------|-----------------|------------------|----------|---------------------|
| `db_iemr` | 35 versions | ~200-300 tables | **HIGH** | Very High (medical records) |
| `db_identity` | 6 versions | ~30-50 tables | **CRITICAL** | High (PII concentration) |
| `db_1097_identity` | 2 versions | ~15-25 tables | **HIGH** | Medium (helpline data) |
| `db_reporting` | 2 versions | ~20-30 views/tables | **MEDIUM** | Medium (derived data) |

### 2.2 Analysis Methodology

#### Step 1: Automated Schema Extraction

**Tool**: Java-based Schema Analyzer (to be built)

```java
// Pseudo-code structure
public class DatabaseSchemaAnalyzer {
    
    @Autowired
    private List<DataSource> dataSources; // db_identity, db_1097_identity, db_iemr, db_reporting
    
    public SchemaReport analyzeAllDatabases() {
        SchemaReport report = new SchemaReport();
        
        for (DataSource ds : dataSources) {
            DatabaseMetadata metadata = analyzeDatabaseStructure(ds);
            report.addDatabaseMetadata(metadata);
        }
        
        return report;
    }
    
    private DatabaseMetadata analyzeDatabaseStructure(DataSource ds) {
        // Extract:
        // - All table names
        // - All column names with data types
        // - Primary keys
        // - Foreign keys (including cross-database FKs via BenRegID)
        // - Unique constraints
        // - Indexes
        // - Column nullability
        // - Default values
    }
}
```

**Output**: JSON schema catalog containing:
```json
{
  "database": "db_identity",
  "tables": [
    {
      "name": "i_beneficiary",
      "columns": [
        {
          "name": "BeneficiaryRegID",
          "type": "BIGINT",
          "nullable": false,
          "primaryKey": true,
          "references": []
        },
        {
          "name": "FirstName",
          "type": "VARCHAR(50)",
          "nullable": true,
          "piiCategory": "NAME", // To be manually classified
          "anonymizationStrategy": null // To be determined
        },
        {
          "name": "PhoneNo",
          "type": "VARCHAR(15)",
          "nullable": true,
          "piiCategory": "PHONE",
          "anonymizationStrategy": null
        }
      ],
      "foreignKeys": [
        {
          "column": "StateID",
          "referencesTable": "m_state",
          "referencesColumn": "StateID"
        }
      ],
      "uniqueConstraints": ["Aadhar_No", "Email"]
    }
  ]
}
```

#### Step 2: PII Field Classification

**Method**: Keyword-based + Manual Review

**PII Classification Categories**:

| Category | Examples | Anonymization Priority |
|----------|----------|------------------------|
| **PERSONAL_IDENTIFIER** | FirstName, LastName, FatherName, MotherName | Critical |
| **CONTACT** | PhoneNo, Email, Address, PIN | Critical |
| **GOVERNMENT_ID** | AadharNo, PANNo, VoterID, RationCardNo | Critical |
| **BIOMETRIC** | FaceEmbedding, Fingerprint, IrisData | Critical |
| **HEALTH_IDENTIFIER** | HealthID, MRN, BeneficiaryID | Critical (if not linking key) |
| **MEDICAL_CONDITION** | Diagnosis, ChiefComplaint, Symptoms | High |
| **GEOLOCATION** | GPS coordinates, HouseNo, Village | Medium |
| **DEMOGRAPHIC** | Age, Gender, MaritalStatus | Low (may retain for analytics) |
| **METADATA** | CreatedBy, CreatedDate, IP Address | Low |

**Keyword Detection Rules**:
```java
public class PIIDetector {
    
    private static final Map<String, PIICategory> COLUMN_NAME_PATTERNS = Map.of(
        ".*name.*", PIICategory.PERSONAL_IDENTIFIER,
        ".*phone.*|.*mobile.*|.*contact.*", PIICategory.CONTACT,
        ".*email.*", PIICategory.CONTACT,
        ".*address.*|.*pin.*|.*pincode.*", PIICategory.CONTACT,
        ".*aadhar.*|.*aadhaar.*|.*pan.*|.*voter.*", PIICategory.GOVERNMENT_ID,
        ".*embedding.*|.*fingerprint.*|.*biometric.*", PIICategory.BIOMETRIC,
        ".*diagnosis.*|.*complaint.*|.*symptom.*", PIICategory.MEDICAL_CONDITION
    );
    
    public PIICategory detectCategory(String columnName) {
        return COLUMN_NAME_PATTERNS.entrySet().stream()
            .filter(entry -> columnName.toLowerCase().matches(entry.getKey()))
            .map(Map.Entry::getValue)
            .findFirst()
            .orElse(PIICategory.UNKNOWN);
    }
}
```

#### Step 3: Constraint Dependency Mapping

**Focus**: Identify relationships that must be preserved post-anonymization

**Critical Constraints**:

1. **Cross-Database Foreign Keys (BeneficiaryRegID)**
   - `db_identity.i_beneficiary.BeneficiaryRegID` (source of truth)
   - `db_1097_identity.*` tables referencing BenRegID
   - `db_iemr.*` tables referencing BenRegID
   - `db_reporting.*` views using BenRegID

2. **Unique Constraints**
   - AadharNo (must remain unique after anonymization)
   - PhoneNo (must remain unique)
   - Email (must remain unique)

3. **Lookup Table References**
   - Gender (M_Gender table)
   - States/Districts (geographic master data)
   - Service types, disease codes, etc.

**Tool Output**: Dependency graph showing:
```
BeneficiaryRegID (db_identity.i_beneficiary)
    ├─> db_identity.i_beneficiarycontacts
    ├─> db_identity.i_beneficiaryaddress
    ├─> db_1097_identity.t_beneficiarycall
    ├─> db_iemr.t_benvisitdetail
    └─> db_reporting.fact_beneficiary_visits
```

#### Step 4: Data Sampling

**Purpose**: Understand actual data patterns before anonymization

**Approach**:
- Extract 1000 random rows from each table with PII
- Analyze data format patterns (phone format: +91-XXXXXXXXXX vs 10 digits)
- Identify NULL percentage
- Detect data quality issues

**Tool**: Java data sampler
```java
public class DataSampler {
    
    public DataSample sampleTable(DataSource ds, String tableName, int sampleSize) {
        String query = String.format(
            "SELECT * FROM %s ORDER BY RAND() LIMIT %d", 
            tableName, sampleSize
        );
        
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(query);
        
        return new DataSample(
            tableName,
            rows,
            calculateStatistics(rows) // NULL%, distinct count, format patterns
        );
    }
}
```

---

## 3. Java Tool Architecture

### 3.1 Project Structure

Create new module in AMRIT-DB:

```
AMRIT-DB/
├── src/
│   ├── main/
│   │   ├── java/com/db/piramalswasthya/
│   │   │   ├── anonymization/                    [NEW MODULE]
│   │   │   │   ├── analyzer/
│   │   │   │   │   ├── DatabaseSchemaAnalyzer.java
│   │   │   │   │   ├── PIIDetector.java
│   │   │   │   │   ├── ConstraintMapper.java
│   │   │   │   │   └── DataSampler.java
│   │   │   │   ├── model/
│   │   │   │   │   ├── SchemaReport.java
│   │   │   │   │   ├── TableMetadata.java
│   │   │   │   │   ├── ColumnMetadata.java
│   │   │   │   │   ├── PIICategory.java
│   │   │   │   │   └── AnonymizationStrategy.java
│   │   │   │   ├── generator/
│   │   │   │   │   ├── BeneficiaryIDGenerator.java    [Integrate with BenGenAPI]
│   │   │   │   │   ├── FakeDataGenerator.java         [JavaFaker wrapper]
│   │   │   │   │   └── AnonymizationStrategyFactory.java
│   │   │   │   ├── export/
│   │   │   │   │   ├── JSONExporter.java
│   │   │   │   │   ├── CSVExporter.java
│   │   │   │   │   └── HTMLReportGenerator.java
│   │   │   │   └── AnonymizationAnalyzerApplication.java
│   │   │   │
│   │   │   ├── config/
│   │   │   │   ├── DataSourceConfig.java              [Existing, reuse]
│   │   │   │   └── AnalyzerConfig.java                [NEW]
│   │   │   │
│   │   │   └── AmritDbApplication.java                [Existing]
│   │   │
│   │   └── resources/
│   │       ├── application-analyzer.properties         [NEW - analyzer specific config]
│   │       └── pii-detection-rules.yml                 [NEW - configurable PII rules]
│   │
│   └── test/
│       └── java/com/db/piramalswasthya/anonymization/
│           ├── SchemaAnalyzerTest.java
│           └── PIIDetectorTest.java
│
├── docs/
│   ├── phase1-outputs/                                 [NEW - Phase 1 artifacts]
│   │   ├── schema-catalog.json                         [Generated]
│   │   ├── pii-field-inventory.csv                     [Generated]
│   │   ├── anonymization-strategy-map.json             [Generated]
│   │   ├── constraint-dependency-graph.html            [Generated]
│   │   └── data-sample-analysis.json                   [Generated]
│   │
│   └── db-anonymization-phase1-analysis-plan.md        [THIS FILE]
```

### 3.2 Key Dependencies (Add to pom.xml)

```xml
<dependencies>
    <!-- Existing Spring Boot dependencies -->
    
    <!-- JavaFaker for fake data generation -->
    <dependency>
        <groupId>com.github.javafaker</groupId>
        <artifactId>javafaker</artifactId>
        <version>1.0.2</version>
    </dependency>
    
    <!-- Apache Commons Lang for string utilities -->
    <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
    </dependency>
    
    <!-- Apache Commons CSV for CSV export -->
    <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-csv</artifactId>
        <version>1.10.0</version>
    </dependency>
    
    <!-- Gson for JSON handling -->
    <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
    </dependency>
    
    <!-- JGraphT for dependency graph -->
    <dependency>
        <groupId>org.jgrapht</groupId>
        <artifactId>jgrapht-core</artifactId>
        <version>1.5.2</version>
    </dependency>
</dependencies>
```

### 3.3 Core Components

#### Component 1: Schema Analyzer

```java
@Service
public class DatabaseSchemaAnalyzer {
    
    @Autowired
    private DataSource identityDataSource;
    
    @Autowired
    private DataSource identity1097DataSource;
    
    @Autowired
    private DataSource iemrDataSource;
    
    @Autowired
    private DataSource reportingDataSource;
    
    public SchemaReport analyzeAllDatabases() throws SQLException {
        SchemaReport report = new SchemaReport();
        
        report.addDatabase(analyzeDatabase(identityDataSource, "db_identity"));
        report.addDatabase(analyzeDatabase(identity1097DataSource, "db_1097_identity"));
        report.addDatabase(analyzeDatabase(iemrDataSource, "db_iemr"));
        report.addDatabase(analyzeDatabase(reportingDataSource, "db_reporting"));
        
        return report;
    }
    
    private DatabaseMetadata analyzeDatabase(DataSource ds, String dbName) throws SQLException {
        try (Connection conn = ds.getConnection()) {
            DatabaseMetaData metaData = conn.getMetaData();
            
            DatabaseMetadata dbMetadata = new DatabaseMetadata(dbName);
            
            // Get all tables
            try (ResultSet tables = metaData.getTables(null, null, "%", new String[]{"TABLE"})) {
                while (tables.next()) {
                    String tableName = tables.getString("TABLE_NAME");
                    TableMetadata tableMetadata = analyzeTable(metaData, tableName);
                    dbMetadata.addTable(tableMetadata);
                }
            }
            
            return dbMetadata;
        }
    }
    
    private TableMetadata analyzeTable(DatabaseMetaData metaData, String tableName) throws SQLException {
        TableMetadata tableMetadata = new TableMetadata(tableName);
        
        // Get columns
        try (ResultSet columns = metaData.getColumns(null, null, tableName, "%")) {
            while (columns.next()) {
                ColumnMetadata col = new ColumnMetadata(
                    columns.getString("COLUMN_NAME"),
                    columns.getString("TYPE_NAME"),
                    columns.getInt("COLUMN_SIZE"),
                    columns.getString("IS_NULLABLE").equals("YES")
                );
                tableMetadata.addColumn(col);
            }
        }
        
        // Get primary keys
        try (ResultSet pks = metaData.getPrimaryKeys(null, null, tableName)) {
            while (pks.next()) {
                String columnName = pks.getString("COLUMN_NAME");
                tableMetadata.markAsPrimaryKey(columnName);
            }
        }
        
        // Get foreign keys
        try (ResultSet fks = metaData.getImportedKeys(null, null, tableName)) {
            while (fks.next()) {
                ForeignKeyMetadata fk = new ForeignKeyMetadata(
                    fks.getString("FKCOLUMN_NAME"),
                    fks.getString("PKTABLE_NAME"),
                    fks.getString("PKCOLUMN_NAME")
                );
                tableMetadata.addForeignKey(fk);
            }
        }
        
        // Get unique constraints
        try (ResultSet indexes = metaData.getIndexInfo(null, null, tableName, true, false)) {
            while (indexes.next()) {
                if (!indexes.getBoolean("NON_UNIQUE")) {
                    tableMetadata.addUniqueColumn(indexes.getString("COLUMN_NAME"));
                }
            }
        }
        
        return tableMetadata;
    }
}
```

#### Component 2: PII Detector

```java
@Service
public class PIIDetector {
    
    private Map<Pattern, PIICategory> columnNamePatterns;
    private Map<String, PIICategory> exactMatches;
    
    @PostConstruct
    public void init() {
        // Load patterns from pii-detection-rules.yml
        columnNamePatterns = new LinkedHashMap<>();
        columnNamePatterns.put(Pattern.compile(".*first.*name.*", Pattern.CASE_INSENSITIVE), PIICategory.PERSONAL_IDENTIFIER);
        columnNamePatterns.put(Pattern.compile(".*last.*name.*", Pattern.CASE_INSENSITIVE), PIICategory.PERSONAL_IDENTIFIER);
        columnNamePatterns.put(Pattern.compile(".*father.*name.*", Pattern.CASE_INSENSITIVE), PIICategory.PERSONAL_IDENTIFIER);
        columnNamePatterns.put(Pattern.compile(".*mother.*name.*", Pattern.CASE_INSENSITIVE), PIICategory.PERSONAL_IDENTIFIER);
        columnNamePatterns.put(Pattern.compile(".*phone.*|.*mobile.*|.*contact.*", Pattern.CASE_INSENSITIVE), PIICategory.CONTACT);
        columnNamePatterns.put(Pattern.compile(".*email.*", Pattern.CASE_INSENSITIVE), PIICategory.CONTACT);
        columnNamePatterns.put(Pattern.compile(".*address.*|.*street.*|.*house.*", Pattern.CASE_INSENSITIVE), PIICategory.CONTACT);
        columnNamePatterns.put(Pattern.compile(".*pin.*code.*|.*postal.*", Pattern.CASE_INSENSITIVE), PIICategory.CONTACT);
        columnNamePatterns.put(Pattern.compile(".*aadh?ar.*", Pattern.CASE_INSENSITIVE), PIICategory.GOVERNMENT_ID);
        columnNamePatterns.put(Pattern.compile(".*pan.*", Pattern.CASE_INSENSITIVE), PIICategory.GOVERNMENT_ID);
        columnNamePatterns.put(Pattern.compile(".*voter.*", Pattern.CASE_INSENSITIVE), PIICategory.GOVERNMENT_ID);
        columnNamePatterns.put(Pattern.compile(".*ration.*card.*", Pattern.CASE_INSENSITIVE), PIICategory.GOVERNMENT_ID);
        columnNamePatterns.put(Pattern.compile(".*embedding.*|.*biometric.*|.*fingerprint.*", Pattern.CASE_INSENSITIVE), PIICategory.BIOMETRIC);
        columnNamePatterns.put(Pattern.compile(".*health.*id.*", Pattern.CASE_INSENSITIVE), PIICategory.HEALTH_IDENTIFIER);
        columnNamePatterns.put(Pattern.compile(".*diagnosis.*|.*complaint.*|.*symptom.*|.*prescription.*", Pattern.CASE_INSENSITIVE), PIICategory.MEDICAL_CONDITION);
        columnNamePatterns.put(Pattern.compile(".*gps.*|.*latitude.*|.*longitude.*", Pattern.CASE_INSENSITIVE), PIICategory.GEOLOCATION);
        
        // Exact matches for common column names
        exactMatches = Map.of(
            "BeneficiaryRegID", PIICategory.LINKING_KEY, // Special category
            "FirstName", PIICategory.PERSONAL_IDENTIFIER,
            "LastName", PIICategory.PERSONAL_IDENTIFIER,
            "PhoneNo", PIICategory.CONTACT,
            "EmailID", PIICategory.CONTACT
        );
    }
    
    public PIICategory detectCategory(String columnName, String tableName) {
        // Check exact match first
        if (exactMatches.containsKey(columnName)) {
            return exactMatches.get(columnName);
        }
        
        // Check patterns
        for (Map.Entry<Pattern, PIICategory> entry : columnNamePatterns.entrySet()) {
            if (entry.getKey().matcher(columnName).matches()) {
                return entry.getValue();
            }
        }
        
        return PIICategory.UNKNOWN;
    }
    
    public void annotatePII(SchemaReport report) {
        for (DatabaseMetadata db : report.getDatabases()) {
            for (TableMetadata table : db.getTables()) {
                for (ColumnMetadata column : table.getColumns()) {
                    PIICategory category = detectCategory(column.getName(), table.getName());
                    column.setPiiCategory(category);
                }
            }
        }
    }
}
```

#### Component 3: Fake Data Generator (Integration)

```java
@Service
public class FakeDataGenerator {
    
    private final Faker faker = new Faker(new Locale("en-IN")); // Indian locale
    
    @Autowired
    private BeneficiaryIDGenerator benIdGenerator; // From BenGenAPI integration
    
    public String generateFakeData(PIICategory category, String columnType, int maxLength) {
        String fakeValue;
        
        switch (category) {
            case PERSONAL_IDENTIFIER:
                if (maxLength > 0) {
                    fakeValue = faker.name().firstName();
                    if (fakeValue.length() > maxLength) {
                        fakeValue = fakeValue.substring(0, maxLength);
                    }
                } else {
                    fakeValue = faker.name().firstName();
                }
                break;
                
            case CONTACT:
                if (columnType.contains("phone") || columnType.contains("mobile")) {
                    fakeValue = generateIndianPhoneNumber();
                } else if (columnType.contains("email")) {
                    fakeValue = faker.internet().emailAddress();
                } else {
                    fakeValue = faker.address().fullAddress();
                }
                break;
                
            case GOVERNMENT_ID:
                if (columnType.contains("aadhar")) {
                    fakeValue = generateFakeAadhar();
                } else if (columnType.contains("pan")) {
                    fakeValue = generateFakePAN();
                } else {
                    fakeValue = faker.number().digits(12);
                }
                break;
                
            case BIOMETRIC:
                // Generate random binary data or NULL
                fakeValue = null; // Or generate random base64 string
                break;
                
            case HEALTH_IDENTIFIER:
                // Use BeneficiaryID-Generation-API
                fakeValue = benIdGenerator.generateBeneficiaryID();
                break;
                
            default:
                fakeValue = faker.lorem().word();
        }
        
        return fakeValue;
    }
    
    private String generateIndianPhoneNumber() {
        // Indian phone format: +91-XXXXXXXXXX or 10 digits
        return String.format("+91-%d%s", 
            faker.number().numberBetween(7, 10), 
            faker.number().digits(9)
        );
    }
    
    private String generateFakeAadhar() {
        // 12-digit Aadhaar format (not real, just pattern)
        return faker.number().digits(12);
    }
    
    private String generateFakePAN() {
        // PAN format: AAAAA9999A
        return String.format("%s%04d%s",
            faker.lorem().characters(5, true).toUpperCase(),
            faker.number().numberBetween(1000, 9999),
            faker.lorem().characters(1, true).toUpperCase()
        );
    }
}
```

#### Component 4: BeneficiaryID Generator Integration

```java
@Service
public class BeneficiaryIDGenerator {
    
    // Option A: Direct integration (if BenGenAPI can be run as library)
    @Autowired
    private GenerateBeneficiaryService benGenService; // From BeneficiaryID-Generation-API
    
    // Option B: REST API call (if BenGenAPI needs to be running separately)
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${bengen.api.url:http://localhost:8080/bengen}")
    private String benGenApiUrl;
    
    public String generateBeneficiaryID() {
        // Option A: Direct method call
        // return benGenService.generateBeneficiaryID();
        
        // Option B: REST API call
        try {
            ResponseEntity<BenIdResponse> response = restTemplate.postForEntity(
                benGenApiUrl + "/generateBeneficiaryID",
                null,
                BenIdResponse.class
            );
            return response.getBody().getBeneficiaryRegID();
        } catch (Exception e) {
            // Fallback: Generate random BIGINT
            return String.valueOf(System.currentTimeMillis() + ThreadLocalRandom.current().nextLong(1000000));
        }
    }
    
    public List<String> generateBeneficiaryIDBatch(int count) {
        // Generate multiple IDs for efficiency
        List<String> ids = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            ids.add(generateBeneficiaryID());
        }
        return ids;
    }
}
```

---

## 4. Anonymization Strategies

### 4.1 Strategy Matrix

| PII Category | Anonymization Technique | Preserves | JavaFaker Method | Example |
|--------------|-------------------------|-----------|------------------|---------|
| **PERSONAL_IDENTIFIER** | Fake name generation | Format, Length | `faker.name().firstName()` | "Rajesh" → "Amit" |
| **CONTACT (Phone)** | Fake phone with format | Format pattern | `generateIndianPhone()` | "+91-9876543210" → "+91-8234567890" |
| **CONTACT (Email)** | Fake email | Format | `faker.internet().emailAddress()` | "john@example.com" → "alice123@test.com" |
| **CONTACT (Address)** | Fake address | Structure | `faker.address().fullAddress()` | "123 Main St" → "456 Oak Rd" |
| **GOVERNMENT_ID (Aadhaar)** | Random 12 digits | Length, format | `faker.number().digits(12)` | "123456789012" → "987654321098" |
| **GOVERNMENT_ID (PAN)** | Random PAN pattern | Format AAAAA9999A | `generateFakePAN()` | "ABCDE1234F" → "PQRST5678Z" |
| **BIOMETRIC** | NULL or random binary | Data type | `null` or random bytes | [binary data] → NULL |
| **HEALTH_IDENTIFIER** | BenGenAPI | Uniqueness | `benIdGenerator.generate()` | 1234567890 → 9876543210 |
| **MEDICAL_CONDITION** | Generic placeholder | Category | `"CONDITION_" + random` | "Diabetes Type 2" → "CONDITION_001" |
| **GEOLOCATION (GPS)** | Random coordinates | Lat/Long format | `faker.address().latitude()` | "28.6139, 77.2090" → "19.0760, 72.8777" |
| **LINKING_KEY (BenRegID)** | Deterministic hash or mapping | Relationships | Custom mapping table | 12345 → 67890 (consistent) |

### 4.2 Critical Strategy: BeneficiaryRegID Handling

**Problem**: BenRegID is used across 3 databases as a foreign key

**Solution Options**:

#### Option 1: Mapping Table (RECOMMENDED)

Create a temporary mapping table during anonymization:

```sql
CREATE TEMPORARY TABLE benregid_mapping (
    original_benregid BIGINT PRIMARY KEY,
    anonymized_benregid BIGINT UNIQUE,
    INDEX idx_original (original_benregid),
    INDEX idx_anonymized (anonymized_benregid)
) ENGINE=MEMORY;

-- Populate with all unique BenRegIDs from db_identity
INSERT INTO benregid_mapping (original_benregid, anonymized_benregid)
SELECT DISTINCT BeneficiaryRegID, 
       (1000000000 + ROW_NUMBER() OVER (ORDER BY BeneficiaryRegID)) AS anonymized_benregid
FROM db_identity.i_beneficiary;
```

**Java Implementation**:
```java
@Service
public class BenRegIDMapper {
    
    private Map<Long, Long> mappingCache = new ConcurrentHashMap<>();
    
    public void buildMapping(DataSource identityDS) {
        String query = "SELECT DISTINCT BeneficiaryRegID FROM i_beneficiary";
        List<Long> originalIds = jdbcTemplate.queryForList(query, Long.class);
        
        long startId = 1000000000L;
        for (Long originalId : originalIds) {
            Long anonymizedId = startId++;
            mappingCache.put(originalId, anonymizedId);
        }
        
        // Store in temporary table for SQL-based anonymization
        storeMappingInTempTable();
    }
    
    public Long getAnonymizedId(Long originalId) {
        return mappingCache.getOrDefault(originalId, originalId);
    }
    
    public void exportMapping(String filePath) {
        // Export to CSV for audit trail
        try (CSVPrinter printer = new CSVPrinter(new FileWriter(filePath), CSVFormat.DEFAULT)) {
            printer.printRecord("original_benregid", "anonymized_benregid");
            for (Map.Entry<Long, Long> entry : mappingCache.entrySet()) {
                printer.printRecord(entry.getKey(), entry.getValue());
            }
        }
    }
}
```

#### Option 2: Keep BenRegID Unchanged (Simpler but less secure)

- Pros: No relationship breakage, simpler implementation
- Cons: BenRegID itself might be sensitive if it's sequential or predictable
- Use Case: If BenRegID is already anonymized/random in production

#### Option 3: Deterministic Hashing (Complex)

```java
public class DeterministicHasher {
    private static final String SALT = "AMRIT_UAT_SALT_2026"; // Consistent across runs
    
    public Long hashBenRegID(Long originalId) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            String input = originalId + SALT;
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));
            
            // Convert first 8 bytes to BIGINT
            long hashedId = 0;
            for (int i = 0; i < 8; i++) {
                hashedId = (hashedId << 8) | (hash[i] & 0xFF);
            }
            
            return Math.abs(hashedId); // Ensure positive
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
```

**Cons**: Risk of hash collisions, harder to debug

---

## 5. Output Artifacts

Phase 1 will produce the following deliverables:

### 5.1 Schema Catalog (schema-catalog.json)

Complete metadata of all 4 databases:

```json
{
  "generatedAt": "2026-01-28T10:30:00Z",
  "databases": [
    {
      "name": "db_identity",
      "tableCount": 45,
      "tables": [
        {
          "name": "i_beneficiary",
          "rowCount": 1500000,
          "columns": [
            {
              "name": "BeneficiaryRegID",
              "type": "BIGINT(20)",
              "nullable": false,
              "primaryKey": true,
              "piiCategory": "LINKING_KEY",
              "anonymizationStrategy": "MAPPING_TABLE"
            },
            {
              "name": "FirstName",
              "type": "VARCHAR(50)",
              "nullable": true,
              "primaryKey": false,
              "uniqueConstraint": false,
              "piiCategory": "PERSONAL_IDENTIFIER",
              "anonymizationStrategy": "FAKE_NAME",
              "sampleValues": ["Rajesh", "Priya", "Amit"],
              "nullPercentage": 2.3
            }
          ],
          "foreignKeys": [
            {
              "column": "StateID",
              "referencesTable": "m_state",
              "referencesColumn": "StateID"
            }
          ],
          "indexes": [
            "idx_beneficiary_phone",
            "idx_beneficiary_aadhar"
          ]
        }
      ]
    }
  ]
}
```

### 5.2 PII Field Inventory (pii-field-inventory.csv)

Comprehensive list of all PII fields:

| Database | Table | Column | Data Type | PII Category | Anonymization Strategy | Unique Constraint | Foreign Key | Sample Value |
|----------|-------|--------|-----------|--------------|----------------------|-------------------|-------------|--------------|
| db_identity | i_beneficiary | FirstName | VARCHAR(50) | PERSONAL_IDENTIFIER | FAKE_NAME | No | No | "Rajesh" |
| db_identity | i_beneficiary | PhoneNo | VARCHAR(15) | CONTACT | FAKE_PHONE | Yes | No | "+91-9876543210" |
| db_identity | i_beneficiary | AadharNo | VARCHAR(12) | GOVERNMENT_ID | FAKE_AADHAR | Yes | No | "123456789012" |
| db_iemr | t_prescription | Diagnosis | TEXT | MEDICAL_CONDITION | GENERIC_PLACEHOLDER | No | No | "Diabetes Type 2" |

### 5.3 Anonymization Strategy Map (anonymization-strategy-map.json)

Detailed execution plan for Phase 2:

```json
{
  "databases": [
    {
      "name": "db_identity",
      "tables": [
        {
          "name": "i_beneficiary",
          "anonymizationOrder": 1,
          "dependsOn": [],
          "columns": [
            {
              "name": "BeneficiaryRegID",
              "strategy": {
                "type": "MAPPING_TABLE",
                "implementation": "BenRegIDMapper.getAnonymizedId()",
                "preservesRelationships": true,
                "sqlUpdate": "UPDATE i_beneficiary b JOIN benregid_mapping m ON b.BeneficiaryRegID = m.original_benregid SET b.BeneficiaryRegID = m.anonymized_benregid"
              }
            },
            {
              "name": "FirstName",
              "strategy": {
                "type": "FAKE_NAME",
                "implementation": "faker.name().firstName()",
                "preservesFormat": true,
                "sqlUpdate": "UPDATE i_beneficiary SET FirstName = ? WHERE BeneficiaryRegID = ?"
              }
            }
          ]
        }
      ]
    }
  ]
}
```

### 5.4 Constraint Dependency Graph (constraint-dependency-graph.html)

Visual representation of relationships:

```html
<!-- Interactive HTML with D3.js showing table dependencies -->
<!-- Nodes: Tables with PII -->
<!-- Edges: Foreign key relationships -->
<!-- Color-coded by anonymization priority -->
```

### 5.5 Data Sample Analysis Report

Statistical analysis of current data:

```json
{
  "database": "db_identity",
  "table": "i_beneficiary",
  "totalRows": 1500000,
  "sampledRows": 1000,
  "columns": {
    "FirstName": {
      "dataType": "VARCHAR(50)",
      "nullPercentage": 2.3,
      "uniqueValues": 985,
      "avgLength": 6.8,
      "maxLength": 45,
      "commonPatterns": [
        "Single word (98%)",
        "Contains numbers (0.2%)",
        "Contains special chars (0.1%)"
      ],
      "sampleValues": ["Rajesh", "Priya", "Amit", "Sunita"]
    },
    "PhoneNo": {
      "dataType": "VARCHAR(15)",
      "nullPercentage": 5.1,
      "uniqueValues": 950,
      "formats": {
        "+91-XXXXXXXXXX": "45%",
        "XXXXXXXXXX": "40%",
        "91XXXXXXXXXX": "10%",
        "Other/Invalid": "5%"
      }
    }
  }
}
```

---

## 6. Implementation Timeline

### Week 1: Setup & Initial Analysis

| Day | Task | Owner | Deliverable |
|-----|------|-------|-------------|
| 1 | Project setup: Create anonymization module structure | Dev | Java project skeleton |
| 2 | Add dependencies (JavaFaker, Apache Commons, etc.) | Dev | Updated pom.xml |
| 3 | Implement DatabaseSchemaAnalyzer | Dev | Working schema extraction |
| 4 | Test schema analyzer on db_identity | Dev | First schema catalog |
| 5 | Review & refine schema extraction logic | Dev + Reviewer | Validated approach |

### Week 2: PII Detection & Classification

| Day | Task | Owner | Deliverable |
|-----|------|-------|-------------|
| 1 | Implement PIIDetector with keyword patterns | Dev | PII detection engine |
| 2 | Run PII detector across all 4 databases | Dev | Raw PII field list |
| 3 | Manual review & correction of PII classifications | Domain Expert | Validated PII inventory |
| 4 | Create pii-detection-rules.yml configuration | Dev | Reusable PII rules |
| 5 | Generate pii-field-inventory.csv | Dev | Phase 1 Artifact #2 |

### Week 3: Constraint Mapping & Data Sampling

| Day | Task | Owner | Deliverable |
|-----|------|-------|-------------|
| 1 | Implement ConstraintMapper for FK analysis | Dev | Foreign key graph |
| 2 | Special analysis: BenRegID cross-database usage | Dev | BenRegID dependency map |
| 3 | Implement DataSampler | Dev | Data sampling engine |
| 4 | Run data sampling on all PII tables | Dev | Data sample analysis report |
| 5 | Generate constraint-dependency-graph.html | Dev | Phase 1 Artifact #4 |

### Week 4: Strategy Definition & Fake Data Testing

| Day | Task | Owner | Deliverable |
|-----|------|-------|-------------|
| 1 | Implement FakeDataGenerator with JavaFaker | Dev | Fake data generation engine |
| 2 | Integrate BeneficiaryID-Generation-API | Dev | BenRegID generation working |
| 3 | Create anonymization-strategy-map.json | Dev + Domain Expert | Phase 1 Artifact #3 |
| 4 | Test fake data generation for all PII types | Dev | Sample anonymized data |
| 5 | Documentation & presentation of Phase 1 findings | All | Phase 1 completion report |

**Total Duration**: 4 weeks (20 working days)

---

## 7. Phase 2 & 3 Preview

### Phase 2: Anonymization Execution Engine (Weeks 5-8)

**Objectives**:
- Build Java-based anonymization executor
- Implement SQL generation for bulk updates
- Handle cross-database BenRegID mapping
- Validate referential integrity post-anonymization

**Key Components**:
- `AnonymizationExecutor.java`: Orchestrates entire anonymization process
- `SQLAnonymizationScriptGenerator.java`: Generates UPDATE statements
- `IntegrityValidator.java`: Validates foreign keys, unique constraints
- `AnonymizationAuditLogger.java`: Records all changes for compliance

**Deliverables**:
- Working anonymization engine (Java application)
- Generated SQL anonymization scripts per database
- Validation test suite
- Rollback capability (restore from backup)

### Phase 3: Automation & UAT Integration (Weeks 9-12)

**Objectives**:
- Integrate with Jenkins CI/CD
- Implement production backup strategy
- Automate UAT database restore
- Create scheduling mechanism (weekly/monthly)

**Key Components**:
- Bash orchestration scripts (backup, restore, cleanup)
- Jenkins pipeline definition
- Configuration management (prod vs UAT credentials)
- Monitoring & alerting

**Deliverables**:
- One-click UAT refresh script
- Jenkins job for scheduled execution
- Operations runbook
- Disaster recovery procedure

---

## 8. Success Criteria for Phase 1

Phase 1 is complete when:

- ✅ All 4 databases fully analyzed and documented
- ✅ 100% of PII fields identified and classified
- ✅ Anonymization strategy defined for every PII field type
- ✅ BenRegID cross-database handling strategy finalized
- ✅ Java analyzer tools working and tested
- ✅ All 5 output artifacts generated and reviewed
- ✅ Fake data samples generated and validated for realism
- ✅ BeneficiaryID-Generation-API integration successful
- ✅ Approval from stakeholders to proceed to Phase 2

---

## 9. Risks & Mitigation

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| **Incomplete PII detection** | Critical - data leaks in UAT | Medium | Manual review by domain expert + regex refinement |
| **BenRegID strategy breaks relationships** | Critical - UAT data unusable | Medium | Thorough testing with integrity checks + Option 1 (mapping) |
| **Large database size causes timeouts** | High - Phase 2 execution fails | High | Batch processing + indexing + progress checkpoints |
| **BenGenAPI integration issues** | Medium - delays in ID generation | Low | Fallback to random BIGINT generation |
| **Schema changes during Phase 1** | Medium - outdated analysis | Low | Re-run analyzer before Phase 2 starts |
| **Missing Flyway migrations in analysis** | Medium - incomplete schema view | Medium | Compare Flyway versions with actual DB schema |

---

## 10. Next Steps

**Immediate Actions**:

1. ✅ Review and approve this Phase 1 plan
2. Create `anonymization` package in AMRIT-DB module
3. Update `pom.xml` with required dependencies
4. Set up local development database (Docker-based) for testing
5. Begin implementation of `DatabaseSchemaAnalyzer`

**Decision Required**:

- **BenRegID Handling Strategy**: Choose between:
  - Option 1: Mapping Table (recommended)
  - Option 2: Keep unchanged
  - Option 3: Deterministic hashing

**Stakeholder Review Needed**:

- Domain expert to validate PII field classifications
- DBA to provide production database topology (read replica availability)
- Security team to review anonymization strategies for compliance

---

## Appendix A: Configuration Example

**application-analyzer.properties**

```properties
# Database connections (same as main AMRIT-DB)
spring.datasource.identity.url=jdbc:mysql://localhost:3306/db_identity
spring.datasource.identity.username=amrit_user
spring.datasource.identity.password=${IDENTITY_DB_PASSWORD}

spring.datasource.identity1097.url=jdbc:mysql://localhost:3306/db_1097_identity
spring.datasource.identity1097.username=amrit_user
spring.datasource.identity1097.password=${IDENTITY_1097_DB_PASSWORD}

spring.datasource.iemr.url=jdbc:mysql://localhost:3306/db_iemr
spring.datasource.iemr.username=amrit_user
spring.datasource.iemr.password=${IEMR_DB_PASSWORD}

spring.datasource.reporting.url=jdbc:mysql://localhost:3306/db_reporting
spring.datasource.reporting.username=amrit_user
spring.datasource.reporting.password=${REPORTING_DB_PASSWORD}

# Analyzer configuration
anonymization.analyzer.sample-size=1000
anonymization.analyzer.output-dir=docs/phase1-outputs
anonymization.analyzer.export-formats=json,csv,html

# BeneficiaryID-Generation-API integration
bengen.api.enabled=true
bengen.api.url=http://localhost:8080/bengen
bengen.api.batch-size=1000

# JavaFaker configuration
faker.locale=en-IN
```

---

## Appendix B: Command Line Interface

**Run Schema Analysis**:

```bash
cd AMRIT-DB
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -Dspring-boot.run.arguments="--analyze-schema"
```

**Output**:
```
[INFO] Starting AMRIT Database Schema Analyzer...
[INFO] Analyzing db_identity... 45 tables found
[INFO] Analyzing db_1097_identity... 18 tables found
[INFO] Analyzing db_iemr... 287 tables found
[INFO] Analyzing db_reporting... 23 views found
[INFO] Running PII detection...
[INFO] Found 342 PII fields across all databases
[INFO] Generating schema-catalog.json...
[INFO] Generating pii-field-inventory.csv...
[INFO] Analysis complete! Output saved to: docs/phase1-outputs/
```

**Run Data Sampling**:

```bash
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -Dspring-boot.run.arguments="--sample-data --sample-size=1000"
```

**Generate Fake Data Samples**:

```bash
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -Dspring-boot.run.arguments="--generate-fake-samples --count=100"
```

---

**End of Phase 1 Plan**

---

**Prepared by**: AMRIT Development Team  
**Review Status**: Awaiting Stakeholder Approval  
**Next Review Date**: 2026-02-04
