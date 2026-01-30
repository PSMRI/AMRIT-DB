# AMRIT Database Anonymization - Phase 2: Execution Engine

**Project**: Automated UAT Database Refresh with Anonymization  
**Technology Stack**: Java 17, Spring Boot 3.3.2, MySQL 8.0  
**Phase**: 2 of 3 - Anonymization Execution  
**Status**: Planning  
**Prerequisites**: Phase 1 completed with all artifacts generated  
**Platform**: Cross-platform (Windows, Linux, macOS)  
**Last Updated**: January 28, 2026

---

## Executive Summary

Phase 2 focuses on building the **execution engine** that performs actual data anonymization. This phase takes the analysis outputs from Phase 1 and implements a robust, auditable, and reversible anonymization process. The engine will handle bulk data transformation while preserving referential integrity and ensuring zero data loss.

### Key Deliverables

- ✅ Java-based anonymization execution engine
- ✅ Batch processing system for large datasets
- ✅ BenRegID cross-database mapping implementation
- ✅ SQL script generation for bulk updates
- ✅ Referential integrity validation framework
- ✅ Audit logging and compliance reporting
- ✅ Rollback capability with backup verification

---

## Table of Contents

1. [Phase 2 Objectives](#1-phase-2-objectives)
2. [Architecture & Design](#2-architecture--design)
3. [Core Components](#3-core-components)
4. [Execution Workflow](#4-execution-workflow)
5. [BenRegID Mapping Strategy](#5-benregid-mapping-strategy)
6. [Batch Processing Strategy](#6-batch-processing-strategy)
7. [Data Validation](#7-data-validation)
8. [Audit & Compliance](#8-audit--compliance)
9. [Error Handling & Rollback](#9-error-handling--rollback)
10. [Performance Optimization](#10-performance-optimization)
11. [Testing Strategy](#11-testing-strategy)
12. [Implementation Timeline](#12-implementation-timeline)

---

## 1. Phase 2 Objectives

### 1.1 Primary Goals

| Objective | Description | Success Criteria |
|-----------|-------------|------------------|
| **Execution Engine** | Build Java application that anonymizes all identified PII fields | Successfully anonymizes 100% of identified fields |
| **Referential Integrity** | Preserve all foreign key relationships, especially BenRegID | 0 constraint violations post-anonymization |
| **Performance** | Process millions of rows efficiently | Complete db_identity in <30 minutes |
| **Auditability** | Log every transformation for compliance | Complete audit trail with before/after counts |
| **Reversibility** | Ability to rollback via backup restoration | Tested rollback procedure |
| **Validation** | Automated checks to verify anonymization success | 100% validation pass rate |

### 1.2 Input Artifacts (from Phase 1)

- `schema-catalog.json` - Complete database schema
- `pii-field-inventory.csv` - All PII fields identified
- `anonymization-strategy-map.json` - Strategy per field
- `benregid_mapping.csv` - BenRegID mapping (generated in Phase 2)

### 1.3 Output Artifacts

- `anonymized_database_backup_<timestamp>.sql` - Anonymized database dumps
- `anonymization_audit_report_<timestamp>.json` - Complete audit trail
- `validation_report_<timestamp>.html` - Validation results
- `anonymization_execution.log` - Detailed execution logs
- `benregid_mapping_<timestamp>.csv` - BenRegID mapping for reference

---

## 2. Architecture & Design

### 2.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    Phase 1 Outputs                              │
│  (schema-catalog.json, pii-field-inventory.csv, strategy-map)  │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│              Anonymization Orchestrator                          │
│  • Configuration Loader                                          │
│  • Execution Planner (determines order)                          │
│  • Progress Tracker                                              │
└────────┬──────────────┬──────────────┬──────────────────────────┘
         │              │              │
         ▼              ▼              ▼
┌────────────────┐ ┌────────────┐ ┌──────────────────┐
│  BenRegID      │ │  Field     │ │  Batch           │
│  Mapper        │ │  Anonymizer│ │  Processor       │
│                │ │            │ │                  │
│ • Build map    │ │ • Faker    │ │ • Chunk data     │
│ • Persist map  │ │ • Custom   │ │ • Update batches │
│ • Validate     │ │ • Null     │ │ • Track progress │
└────────┬───────┘ └─────┬──────┘ └────────┬─────────┘
         │               │                  │
         └───────────────┴──────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    MySQL Databases                               │
│  (db_identity, db_1097_identity, db_iemr, db_reporting)         │
└─────────────────────────────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                Validation & Audit Layer                          │
│  • Integrity Validator                                           │
│  • Audit Logger                                                  │
│  • Report Generator                                              │
└─────────────────────────────────────────────────────────────────┘
```

### 2.2 Module Structure

```
AMRIT-DB/
├── src/main/java/com/db/piramalswasthya/
│   ├── anonymization/
│   │   ├── analyzer/                    [Phase 1 - Already built]
│   │   │   ├── DatabaseSchemaAnalyzer.java
│   │   │   ├── PIIDetector.java
│   │   │   └── ...
│   │   │
│   │   ├── executor/                    [NEW - Phase 2]
│   │   │   ├── AnonymizationOrchestrator.java
│   │   │   ├── ExecutionPlanner.java
│   │   │   ├── ExecutionEngine.java
│   │   │   └── ProgressTracker.java
│   │   │
│   │   ├── strategy/                    [NEW - Phase 2]
│   │   │   ├── AnonymizationStrategy.java (interface)
│   │   │   ├── FakeNameStrategy.java
│   │   │   ├── FakePhoneStrategy.java
│   │   │   ├── FakeEmailStrategy.java
│   │   │   ├── FakeAddressStrategy.java
│   │   │   ├── FakeGovernmentIDStrategy.java
│   │   │   ├── NullificationStrategy.java
│   │   │   ├── GenericPlaceholderStrategy.java
│   │   │   └── BenRegIDMappingStrategy.java
│   │   │
│   │   ├── mapping/                     [NEW - Phase 2]
│   │   │   ├── BenRegIDMapper.java
│   │   │   ├── MappingTable.java
│   │   │   └── MappingPersistence.java
│   │   │
│   │   ├── batch/                       [NEW - Phase 2]
│   │   │   ├── BatchProcessor.java
│   │   │   ├── ChunkStrategy.java
│   │   │   └── ParallelExecutor.java
│   │   │
│   │   ├── validation/                  [NEW - Phase 2]
│   │   │   ├── IntegrityValidator.java
│   │   │   ├── ForeignKeyChecker.java
│   │   │   ├── UniqueConstraintChecker.java
│   │   │   ├── PIILeakageDetector.java
│   │   │   └── DataQualityValidator.java
│   │   │
│   │   ├── audit/                       [NEW - Phase 2]
│   │   │   ├── AuditLogger.java
│   │   │   ├── AuditEvent.java
│   │   │   ├── AuditRepository.java
│   │   │   └── ComplianceReporter.java
│   │   │
│   │   ├── backup/                      [NEW - Phase 2]
│   │   │   ├── BackupManager.java
│   │   │   ├── RestoreManager.java
│   │   │   └── BackupVerifier.java
│   │   │
│   │   └── model/                       [Shared]
│   │       ├── AnonymizationJob.java
│   │       ├── ExecutionContext.java
│   │       ├── AnonymizationResult.java
│   │       └── ValidationReport.java
│   │
│   └── config/
│       ├── DataSourceConfig.java        [Existing]
│       └── AnonymizationConfig.java     [NEW]
│
├── src/main/resources/
│   ├── application-anonymization.properties  [NEW]
│   └── anonymization-strategies.yml          [NEW]
│
└── scripts/
    ├── backup/                          [NEW - Bash scripts]
    │   ├── create_backup.sh
    │   └── restore_backup.sh
    └── validation/                      [NEW - SQL scripts]
        ├── check_foreign_keys.sql
        └── check_unique_constraints.sql
```

---

## 3. Core Components

### 3.1 AnonymizationOrchestrator

**Responsibility**: Main entry point that coordinates the entire anonymization process

```java
@Service
@Slf4j
public class AnonymizationOrchestrator {
    
    @Autowired
    private ExecutionPlanner executionPlanner;
    
    @Autowired
    private BenRegIDMapper benRegIDMapper;
    
    @Autowired
    private ExecutionEngine executionEngine;
    
    @Autowired
    private IntegrityValidator integrityValidator;
    
    @Autowired
    private AuditLogger auditLogger;
    
    @Autowired
    private BackupManager backupManager;
    
    public AnonymizationResult executeAnonymization(AnonymizationConfig config) {
        
        log.info("Starting anonymization process...");
        
        ExecutionContext context = new ExecutionContext();
        context.setStartTime(Instant.now());
        
        try {
            // Step 1: Create backup checkpoint
            log.info("Step 1: Creating backup checkpoint...");
            BackupInfo backup = backupManager.createBackup();
            context.setBackupInfo(backup);
            auditLogger.logBackupCreated(backup);
            
            // Step 2: Load execution plan from Phase 1 outputs
            log.info("Step 2: Loading execution plan...");
            ExecutionPlan plan = executionPlanner.createPlan(config.getStrategyMapPath());
            context.setExecutionPlan(plan);
            
            // Step 3: Pre-execution validation
            log.info("Step 3: Running pre-execution validation...");
            ValidationReport preValidation = integrityValidator.validatePreExecution();
            if (!preValidation.isValid()) {
                throw new AnonymizationException("Pre-execution validation failed: " + preValidation.getErrors());
            }
            
            // Step 4: Build BenRegID mapping
            log.info("Step 4: Building BenRegID mapping...");
            benRegIDMapper.buildMapping();
            context.setBenRegIDMappingCount(benRegIDMapper.getMappingCount());
            auditLogger.logBenRegIDMappingCreated(benRegIDMapper.getMappingCount());
            
            // Step 5: Execute anonymization in planned order
            log.info("Step 5: Executing anonymization...");
            for (DatabaseExecutionStep step : plan.getDatabaseSteps()) {
                executeDatabaseAnonymization(step, context);
            }
            
            // Step 6: Post-execution validation
            log.info("Step 6: Running post-execution validation...");
            ValidationReport postValidation = integrityValidator.validatePostExecution();
            context.setValidationReport(postValidation);
            
            if (!postValidation.isValid()) {
                log.error("Post-execution validation failed! Initiating rollback...");
                backupManager.restore(backup);
                throw new AnonymizationException("Validation failed, rolled back: " + postValidation.getErrors());
            }
            
            // Step 7: Generate audit report
            log.info("Step 7: Generating audit report...");
            AuditReport auditReport = auditLogger.generateReport(context);
            context.setAuditReport(auditReport);
            
            // Step 8: Export anonymized backup
            log.info("Step 8: Creating anonymized backup...");
            BackupInfo anonymizedBackup = backupManager.createAnonymizedBackup();
            context.setAnonymizedBackup(anonymizedBackup);
            
            context.setEndTime(Instant.now());
            context.setStatus(ExecutionStatus.SUCCESS);
            
            log.info("Anonymization completed successfully!");
            log.info("Duration: {} minutes", context.getDurationMinutes());
            log.info("Records processed: {}", context.getTotalRecordsProcessed());
            
            return new AnonymizationResult(context);
            
        } catch (Exception e) {
            log.error("Anonymization failed: {}", e.getMessage(), e);
            context.setStatus(ExecutionStatus.FAILED);
            context.setError(e);
            auditLogger.logError(e);
            throw new AnonymizationException("Anonymization failed", e);
        }
    }
    
    private void executeDatabaseAnonymization(DatabaseExecutionStep step, ExecutionContext context) {
        log.info("Anonymizing database: {}", step.getDatabaseName());
        
        for (TableExecutionStep tableStep : step.getTableSteps()) {
            log.info("  Processing table: {}", tableStep.getTableName());
            
            TableAnonymizationResult result = executionEngine.anonymizeTable(tableStep);
            context.addTableResult(result);
            
            auditLogger.logTableAnonymized(result);
            
            log.info("    Processed {} rows", result.getRowsProcessed());
        }
    }
}
```

### 3.2 ExecutionPlanner

**Responsibility**: Determines the order of table processing to respect foreign key dependencies

```java
@Service
public class ExecutionPlanner {
    
    public ExecutionPlan createPlan(String strategyMapPath) throws IOException {
        
        // Load strategy map from Phase 1
        AnonymizationStrategyMap strategyMap = loadStrategyMap(strategyMapPath);
        
        ExecutionPlan plan = new ExecutionPlan();
        
        // Database order (respecting dependencies)
        // 1. db_identity (source of BenRegID)
        // 2. db_1097_identity (references BenRegID)
        // 3. db_iemr (references BenRegID)
        // 4. db_reporting (derived from other DBs)
        
        plan.addDatabaseStep(createDatabaseStep("db_identity", strategyMap));
        plan.addDatabaseStep(createDatabaseStep("db_1097_identity", strategyMap));
        plan.addDatabaseStep(createDatabaseStep("db_iemr", strategyMap));
        plan.addDatabaseStep(createDatabaseStep("db_reporting", strategyMap));
        
        return plan;
    }
    
    private DatabaseExecutionStep createDatabaseStep(String dbName, AnonymizationStrategyMap strategyMap) {
        
        DatabaseExecutionStep dbStep = new DatabaseExecutionStep(dbName);
        
        DatabaseStrategyConfig dbConfig = strategyMap.getDatabaseConfig(dbName);
        
        // Sort tables by dependency order using topological sort
        List<TableStrategyConfig> sortedTables = topologicalSort(dbConfig.getTables());
        
        for (TableStrategyConfig tableConfig : sortedTables) {
            TableExecutionStep tableStep = new TableExecutionStep(
                tableConfig.getTableName(),
                tableConfig.getColumns(),
                tableConfig.getRowCount()
            );
            dbStep.addTableStep(tableStep);
        }
        
        return dbStep;
    }
    
    private List<TableStrategyConfig> topologicalSort(List<TableStrategyConfig> tables) {
        // Build dependency graph
        DirectedGraph<TableStrategyConfig, DefaultEdge> graph = new DefaultDirectedGraph<>(DefaultEdge.class);
        
        // Add vertices
        for (TableStrategyConfig table : tables) {
            graph.addVertex(table);
        }
        
        // Add edges (foreign key dependencies)
        for (TableStrategyConfig table : tables) {
            for (ForeignKeyMetadata fk : table.getForeignKeys()) {
                TableStrategyConfig referencedTable = findTable(tables, fk.getReferencedTable());
                if (referencedTable != null) {
                    graph.addEdge(referencedTable, table); // Referenced table must be processed first
                }
            }
        }
        
        // Perform topological sort
        TopologicalOrderIterator<TableStrategyConfig, DefaultEdge> iterator = 
            new TopologicalOrderIterator<>(graph);
        
        List<TableStrategyConfig> sorted = new ArrayList<>();
        while (iterator.hasNext()) {
            sorted.add(iterator.next());
        }
        
        return sorted;
    }
}
```

### 3.3 ExecutionEngine

**Responsibility**: Executes anonymization for a single table using batch processing

```java
@Service
public class ExecutionEngine {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private BatchProcessor batchProcessor;
    
    @Autowired
    private Map<String, AnonymizationStrategy> strategies; // Injected strategy beans
    
    @Autowired
    private ProgressTracker progressTracker;
    
    public TableAnonymizationResult anonymizeTable(TableExecutionStep tableStep) {
        
        String tableName = tableStep.getTableName();
        List<ColumnAnonymizationConfig> columns = tableStep.getColumnsToAnonymize();
        
        // Get total row count
        Long totalRows = jdbcTemplate.queryForObject(
            "SELECT COUNT(*) FROM " + tableName, Long.class
        );
        
        log.info("Table {} has {} rows to process", tableName, totalRows);
        
        progressTracker.startTable(tableName, totalRows);
        
        int batchSize = determineBatchSize(totalRows);
        int processedRows = 0;
        int updatedRows = 0;
        
        // Process in batches
        for (int offset = 0; offset < totalRows; offset += batchSize) {
            
            // Fetch batch
            List<Map<String, Object>> batch = fetchBatch(tableName, offset, batchSize);
            
            // Anonymize batch
            List<Map<String, Object>> anonymizedBatch = anonymizeBatch(batch, columns);
            
            // Update batch
            int updated = updateBatch(tableName, anonymizedBatch);
            
            processedRows += batch.size();
            updatedRows += updated;
            
            progressTracker.updateProgress(tableName, processedRows);
            
            log.debug("Processed {}/{} rows", processedRows, totalRows);
        }
        
        progressTracker.completeTable(tableName);
        
        return new TableAnonymizationResult(tableName, totalRows, updatedRows);
    }
    
    private List<Map<String, Object>> fetchBatch(String tableName, int offset, int limit) {
        String query = String.format(
            "SELECT * FROM %s LIMIT %d OFFSET %d",
            tableName, limit, offset
        );
        return jdbcTemplate.queryForList(query);
    }
    
    private List<Map<String, Object>> anonymizeBatch(
            List<Map<String, Object>> batch, 
            List<ColumnAnonymizationConfig> columns) {
        
        List<Map<String, Object>> anonymizedBatch = new ArrayList<>();
        
        for (Map<String, Object> row : batch) {
            Map<String, Object> anonymizedRow = new HashMap<>(row);
            
            for (ColumnAnonymizationConfig column : columns) {
                String columnName = column.getColumnName();
                Object originalValue = row.get(columnName);
                
                // Get strategy for this column
                AnonymizationStrategy strategy = strategies.get(column.getStrategyType());
                
                // Apply strategy
                Object anonymizedValue = strategy.anonymize(originalValue, column);
                
                anonymizedRow.put(columnName, anonymizedValue);
            }
            
            anonymizedBatch.add(anonymizedRow);
        }
        
        return anonymizedBatch;
    }
    
    private int updateBatch(String tableName, List<Map<String, Object>> batch) {
        
        if (batch.isEmpty()) {
            return 0;
        }
        
        // Build parameterized UPDATE statement
        Map<String, Object> firstRow = batch.get(0);
        String primaryKey = determinePrimaryKey(tableName);
        
        List<String> updateColumns = firstRow.keySet().stream()
            .filter(col -> !col.equals(primaryKey))
            .collect(Collectors.toList());
        
        String updateSQL = buildUpdateSQL(tableName, primaryKey, updateColumns);
        
        // Batch update
        return batchProcessor.batchUpdate(updateSQL, batch, primaryKey, updateColumns);
    }
    
    private String buildUpdateSQL(String tableName, String primaryKey, List<String> columns) {
        String setClause = columns.stream()
            .map(col -> col + " = ?")
            .collect(Collectors.joining(", "));
        
        return String.format(
            "UPDATE %s SET %s WHERE %s = ?",
            tableName, setClause, primaryKey
        );
    }
    
    private int determineBatchSize(long totalRows) {
        if (totalRows < 10000) return 1000;
        if (totalRows < 100000) return 5000;
        if (totalRows < 1000000) return 10000;
        return 20000; // Large tables
    }
}
```

### 3.4 AnonymizationStrategy Implementations

**Interface:**

```java
public interface AnonymizationStrategy {
    
    /**
     * Anonymizes a single value
     * @param originalValue The original value (may be null)
     * @param config Configuration for this column
     * @return Anonymized value
     */
    Object anonymize(Object originalValue, ColumnAnonymizationConfig config);
    
    /**
     * Strategy type identifier
     */
    String getStrategyType();
}
```

**Example Implementation: FakeNameStrategy**

```java
@Component("FAKE_NAME")
public class FakeNameStrategy implements AnonymizationStrategy {
    
    private final Faker faker = new Faker(new Locale("en-IN"));
    
    @Override
    public Object anonymize(Object originalValue, ColumnAnonymizationConfig config) {
        
        if (originalValue == null) {
            return null; // Preserve NULL values
        }
        
        String columnName = config.getColumnName().toLowerCase();
        int maxLength = config.getMaxLength();
        
        String fakeName;
        
        if (columnName.contains("first")) {
            fakeName = faker.name().firstName();
        } else if (columnName.contains("last")) {
            fakeName = faker.name().lastName();
        } else if (columnName.contains("father")) {
            fakeName = faker.name().firstName() + " " + faker.name().lastName();
        } else if (columnName.contains("mother")) {
            fakeName = faker.name().firstName() + " " + faker.name().lastName();
        } else {
            fakeName = faker.name().fullName();
        }
        
        // Truncate to max length
        if (maxLength > 0 && fakeName.length() > maxLength) {
            fakeName = fakeName.substring(0, maxLength);
        }
        
        return fakeName;
    }
    
    @Override
    public String getStrategyType() {
        return "FAKE_NAME";
    }
}
```

**Example: FakePhoneStrategy**

```java
@Component("FAKE_PHONE")
public class FakePhoneStrategy implements AnonymizationStrategy {
    
    private final Faker faker = new Faker(new Locale("en-IN"));
    private final Random random = new Random();
    
    @Override
    public Object anonymize(Object originalValue, ColumnAnonymizationConfig config) {
        
        if (originalValue == null) {
            return null;
        }
        
        String original = originalValue.toString();
        
        // Detect format from original
        if (original.startsWith("+91-")) {
            return generatePhoneWithFormat("+91-");
        } else if (original.startsWith("91") && original.length() == 12) {
            return "91" + generateDigits(10);
        } else {
            return generateDigits(10);
        }
    }
    
    private String generatePhoneWithFormat(String prefix) {
        // Indian mobile numbers start with 6, 7, 8, or 9
        int firstDigit = 6 + random.nextInt(4); // 6, 7, 8, or 9
        return prefix + firstDigit + generateDigits(9);
    }
    
    private String generateDigits(int count) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < count; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
    
    @Override
    public String getStrategyType() {
        return "FAKE_PHONE";
    }
}
```

**Example: BenRegIDMappingStrategy**

```java
@Component("BENREGID_MAPPING")
public class BenRegIDMappingStrategy implements AnonymizationStrategy {
    
    @Autowired
    private BenRegIDMapper benRegIDMapper;
    
    @Override
    public Object anonymize(Object originalValue, ColumnAnonymizationConfig config) {
        
        if (originalValue == null) {
            return null;
        }
        
        Long originalBenRegID = ((Number) originalValue).longValue();
        Long anonymizedBenRegID = benRegIDMapper.getAnonymizedId(originalBenRegID);
        
        if (anonymizedBenRegID == null) {
            throw new AnonymizationException(
                "No mapping found for BenRegID: " + originalBenRegID
            );
        }
        
        return anonymizedBenRegID;
    }
    
    @Override
    public String getStrategyType() {
        return "BENREGID_MAPPING";
    }
}
```

---

## 4. Execution Workflow

### 4.1 Complete Execution Flow

```
START
  │
  ├─► 1. Create Pre-Anonymization Backup
  │     └─► mysqldump all 4 databases to backup_<timestamp>.sql
  │
  ├─► 2. Load Execution Plan
  │     └─► Read anonymization-strategy-map.json
  │
  ├─► 3. Pre-Execution Validation
  │     ├─► Check database connectivity
  │     ├─► Verify all tables exist
  │     ├─► Check foreign key constraints (baseline)
  │     └─► Verify sufficient disk space
  │
  ├─► 4. Build BenRegID Mapping
  │     ├─► Extract all unique BenRegIDs from db_identity.i_beneficiary
  │     ├─► Generate anonymized BenRegIDs (sequential or random)
  │     ├─► Store mapping in benregid_mapping table (MEMORY engine)
  │     └─► Export mapping to CSV for audit
  │
  ├─► 5. Anonymize db_identity
  │     ├─► For each table (in dependency order):
  │     │     ├─► Process in batches (e.g., 10,000 rows)
  │     │     ├─► Apply anonymization strategies per column
  │     │     ├─► Update rows in database
  │     │     └─► Log progress
  │     └─► Validate db_identity integrity
  │
  ├─► 6. Anonymize db_1097_identity
  │     ├─► Apply BenRegID mapping (from step 4)
  │     ├─► Anonymize PII fields
  │     └─► Validate referential integrity with db_identity
  │
  ├─► 7. Anonymize db_iemr
  │     ├─► Apply BenRegID mapping
  │     ├─► Anonymize medical records
  │     └─► Validate constraints
  │
  ├─► 8. Anonymize db_reporting
  │     ├─► Apply BenRegID mapping
  │     ├─► Anonymize derived PII
  │     └─► Validate views
  │
  ├─► 9. Post-Execution Validation
  │     ├─► Check all foreign keys (0 violations expected)
  │     ├─► Check unique constraints (maintained)
  │     ├─► Verify no PII leakage (sample validation)
  │     ├─► Compare row counts (before == after)
  │     └─► Check data quality (no NULL where NOT NULL)
  │
  ├─► 10. Generate Audit Report
  │     ├─► Total tables processed
  │     ├─► Total rows anonymized
  │     ├─► Execution duration
  │     ├─► BenRegID mapping statistics
  │     └─► Validation results
  │
  ├─► 11. Create Anonymized Backup
  │     └─► mysqldump anonymized databases to anonymized_<timestamp>.sql
  │
  └─► END (SUCCESS)
  
  ❌ ON ERROR:
      ├─► Log error details
      ├─► Restore from pre-anonymization backup
      ├─► Generate failure report
      └─► EXIT with error code
```

### 4.2 Transaction Management Strategy

**Approach**: Table-level transactions (not full database transaction)

**Rationale**:
- Full database transaction would lock entire DB for hours
- Table-level allows parallel processing and progress visibility
- Rollback handled via backup restoration

```java
@Transactional(propagation = Propagation.REQUIRES_NEW)
public TableAnonymizationResult anonymizeTable(TableExecutionStep tableStep) {
    // This creates a new transaction per table
    // If this table fails, only this table is rolled back
    // Other tables remain committed
}
```

**Checkpoint Strategy**:
- After each table completion, commit transaction
- Save checkpoint to disk (which tables are done)
- On resume, skip already-completed tables

---

## 5. BenRegID Mapping Strategy

### 5.1 Mapping Table Implementation

```java
@Service
@Slf4j
public class BenRegIDMapper {
    
    @Autowired
    private JdbcTemplate identityJdbcTemplate;
    
    private ConcurrentHashMap<Long, Long> mappingCache = new ConcurrentHashMap<>();
    
    private static final String CREATE_MAPPING_TABLE_SQL = 
        "CREATE TABLE IF NOT EXISTS benregid_mapping (" +
        "  original_benregid BIGINT NOT NULL PRIMARY KEY, " +
        "  anonymized_benregid BIGINT NOT NULL UNIQUE, " +
        "  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
        "  INDEX idx_original (original_benregid), " +
        "  INDEX idx_anonymized (anonymized_benregid)" +
        ") ENGINE=InnoDB";
    
    public void buildMapping() {
        log.info("Building BenRegID mapping...");
        
        // Step 1: Create mapping table
        identityJdbcTemplate.execute(CREATE_MAPPING_TABLE_SQL);
        
        // Step 2: Extract all unique BenRegIDs
        String query = "SELECT DISTINCT BeneficiaryRegID FROM i_beneficiary ORDER BY BeneficiaryRegID";
        List<Long> originalIds = identityJdbcTemplate.queryForList(query, Long.class);
        
        log.info("Found {} unique BenRegIDs", originalIds.size());
        
        // Step 3: Generate anonymized IDs
        long startId = 1000000000L; // Start from 1 billion
        
        List<Object[]> batchArgs = new ArrayList<>();
        
        for (Long originalId : originalIds) {
            Long anonymizedId = startId++;
            mappingCache.put(originalId, anonymizedId);
            batchArgs.add(new Object[]{originalId, anonymizedId});
        }
        
        // Step 4: Bulk insert into mapping table
        String insertSQL = "INSERT INTO benregid_mapping (original_benregid, anonymized_benregid) VALUES (?, ?)";
        identityJdbcTemplate.batchUpdate(insertSQL, batchArgs);
        
        log.info("BenRegID mapping built successfully. {} mappings created.", mappingCache.size());
        
        // Step 5: Export to CSV for audit
        exportMappingToCSV();
    }
    
    public Long getAnonymizedId(Long originalId) {
        return mappingCache.get(originalId);
    }
    
    public int getMappingCount() {
        return mappingCache.size();
    }
    
    private void exportMappingToCSV() {
        String fileName = String.format("benregid_mapping_%s.csv", 
            LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss")));
        
        String filePath = "docs/phase2-outputs/" + fileName;
        
        try (CSVPrinter printer = new CSVPrinter(new FileWriter(filePath), CSVFormat.DEFAULT)) {
            printer.printRecord("original_benregid", "anonymized_benregid");
            
            for (Map.Entry<Long, Long> entry : mappingCache.entrySet()) {
                printer.printRecord(entry.getKey(), entry.getValue());
            }
            
            log.info("BenRegID mapping exported to: {}", filePath);
        } catch (IOException e) {
            log.error("Failed to export BenRegID mapping", e);
        }
    }
}
```

### 5.2 Applying BenRegID Mapping to Other Databases

```java
public void applyBenRegIDMappingToTable(String database, String tableName, String columnName) {
    
    log.info("Applying BenRegID mapping to {}.{}.{}", database, tableName, columnName);
    
    // Option 1: SQL-based JOIN update (faster for large tables)
    String updateSQL = String.format(
        "UPDATE %s.%s t " +
        "JOIN db_identity.benregid_mapping m ON t.%s = m.original_benregid " +
        "SET t.%s = m.anonymized_benregid",
        database, tableName, columnName, columnName
    );
    
    int updated = jdbcTemplate.update(updateSQL);
    log.info("Updated {} rows in {}.{}", updated, database, tableName);
    
    // Option 2: Batch update via Java (more control)
    // Use this if cross-database UPDATE is not allowed
    /*
    List<Map<String, Object>> rows = fetchAllRows(database, tableName);
    for (Map<String, Object> row : rows) {
        Long originalBenRegID = (Long) row.get(columnName);
        Long anonymizedBenRegID = benRegIDMapper.getAnonymizedId(originalBenRegID);
        updateRow(database, tableName, row.getPrimaryKey(), columnName, anonymizedBenRegID);
    }
    */
}
```

---

## 6. Batch Processing Strategy

### 6.1 BatchProcessor Implementation

```java
@Service
public class BatchProcessor {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public int batchUpdate(String sql, List<Map<String, Object>> batch, 
                          String primaryKey, List<String> updateColumns) {
        
        int[] updateCounts = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                Map<String, Object> row = batch.get(i);
                
                int paramIndex = 1;
                
                // Set update column values
                for (String column : updateColumns) {
                    ps.setObject(paramIndex++, row.get(column));
                }
                
                // Set WHERE clause (primary key)
                ps.setObject(paramIndex, row.get(primaryKey));
            }
            
            @Override
            public int getBatchSize() {
                return batch.size();
            }
        });
        
        return Arrays.stream(updateCounts).sum();
    }
}
```

### 6.2 Parallel Processing (Optional Optimization)

```java
@Service
public class ParallelExecutor {
    
    private ExecutorService executor = Executors.newFixedThreadPool(4); // 4 parallel threads
    
    public List<TableAnonymizationResult> anonymizeTablesInParallel(List<TableExecutionStep> tables) {
        
        List<Future<TableAnonymizationResult>> futures = new ArrayList<>();
        
        for (TableExecutionStep table : tables) {
            Future<TableAnonymizationResult> future = executor.submit(() -> 
                executionEngine.anonymizeTable(table)
            );
            futures.add(future);
        }
        
        // Wait for all to complete
        List<TableAnonymizationResult> results = new ArrayList<>();
        for (Future<TableAnonymizationResult> future : futures) {
            try {
                results.add(future.get());
            } catch (Exception e) {
                log.error("Parallel execution failed", e);
            }
        }
        
        return results;
    }
}
```

**Note**: Only use parallel processing for independent tables (no foreign key relationships)

---

## 7. Data Validation

### 7.1 IntegrityValidator

```java
@Service
@Slf4j
public class IntegrityValidator {
    
    @Autowired
    private List<DataSource> dataSources;
    
    @Autowired
    private ForeignKeyChecker foreignKeyChecker;
    
    @Autowired
    private UniqueConstraintChecker uniqueConstraintChecker;
    
    @Autowired
    private PIILeakageDetector piiLeakageDetector;
    
    public ValidationReport validatePreExecution() {
        log.info("Running pre-execution validation...");
        
        ValidationReport report = new ValidationReport("PRE_EXECUTION");
        
        // Check 1: Database connectivity
        for (DataSource ds : dataSources) {
            try (Connection conn = ds.getConnection()) {
                report.addCheck("Database connectivity", true, "Connected");
            } catch (SQLException e) {
                report.addCheck("Database connectivity", false, e.getMessage());
            }
        }
        
        // Check 2: Verify tables exist
        // ... implementation
        
        return report;
    }
    
    public ValidationReport validatePostExecution() {
        log.info("Running post-execution validation...");
        
        ValidationReport report = new ValidationReport("POST_EXECUTION");
        
        // Check 1: Foreign key integrity
        ForeignKeyValidationResult fkResult = foreignKeyChecker.checkAllForeignKeys();
        report.addCheck("Foreign key integrity", fkResult.isValid(), fkResult.getMessage());
        
        // Check 2: Unique constraints
        UniqueConstraintValidationResult ucResult = uniqueConstraintChecker.checkAllUniqueConstraints();
        report.addCheck("Unique constraints", ucResult.isValid(), ucResult.getMessage());
        
        // Check 3: PII leakage detection
        PIILeakageResult piiResult = piiLeakageDetector.scanForPIILeakage();
        report.addCheck("PII leakage", !piiResult.hasLeakage(), piiResult.getMessage());
        
        // Check 4: Row count preservation
        // ... implementation
        
        return report;
    }
}
```

### 7.2 ForeignKeyChecker

```java
@Service
public class ForeignKeyChecker {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public ForeignKeyValidationResult checkAllForeignKeys() {
        
        List<ForeignKeyViolation> violations = new ArrayList<>();
        
        // Query to find foreign key constraints
        String query = 
            "SELECT " +
            "  TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, " +
            "  REFERENCED_TABLE_SCHEMA, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME " +
            "FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE " +
            "WHERE REFERENCED_TABLE_NAME IS NOT NULL " +
            "  AND TABLE_SCHEMA IN ('db_identity', 'db_1097_identity', 'db_iemr', 'db_reporting')";
        
        List<Map<String, Object>> foreignKeys = jdbcTemplate.queryForList(query);
        
        for (Map<String, Object> fk : foreignKeys) {
            String schema = (String) fk.get("TABLE_SCHEMA");
            String table = (String) fk.get("TABLE_NAME");
            String column = (String) fk.get("COLUMN_NAME");
            String refSchema = (String) fk.get("REFERENCED_TABLE_SCHEMA");
            String refTable = (String) fk.get("REFERENCED_TABLE_NAME");
            String refColumn = (String) fk.get("REFERENCED_COLUMN_NAME");
            
            // Check for orphaned rows
            String violationQuery = String.format(
                "SELECT COUNT(*) FROM %s.%s t " +
                "WHERE t.%s IS NOT NULL " +
                "AND NOT EXISTS (SELECT 1 FROM %s.%s r WHERE r.%s = t.%s)",
                schema, table, column, refSchema, refTable, refColumn, column
            );
            
            Long violationCount = jdbcTemplate.queryForObject(violationQuery, Long.class);
            
            if (violationCount > 0) {
                violations.add(new ForeignKeyViolation(
                    schema, table, column, refSchema, refTable, refColumn, violationCount
                ));
            }
        }
        
        if (violations.isEmpty()) {
            return ForeignKeyValidationResult.success();
        } else {
            return ForeignKeyValidationResult.failure(violations);
        }
    }
}
```

---

## 8. Audit & Compliance

### 8.1 AuditLogger

```java
@Service
public class AuditLogger {
    
    @Autowired
    private AuditRepository auditRepository;
    
    private List<AuditEvent> events = new ArrayList<>();
    
    public void logBackupCreated(BackupInfo backup) {
        AuditEvent event = AuditEvent.builder()
            .timestamp(Instant.now())
            .eventType("BACKUP_CREATED")
            .details(Map.of(
                "backupPath", backup.getFilePath(),
                "backupSize", backup.getSizeBytes()
            ))
            .build();
        
        events.add(event);
        auditRepository.save(event);
    }
    
    public void logBenRegIDMappingCreated(int mappingCount) {
        AuditEvent event = AuditEvent.builder()
            .timestamp(Instant.now())
            .eventType("BENREGID_MAPPING_CREATED")
            .details(Map.of("mappingCount", mappingCount))
            .build();
        
        events.add(event);
        auditRepository.save(event);
    }
    
    public void logTableAnonymized(TableAnonymizationResult result) {
        AuditEvent event = AuditEvent.builder()
            .timestamp(Instant.now())
            .eventType("TABLE_ANONYMIZED")
            .details(Map.of(
                "tableName", result.getTableName(),
                "rowsProcessed", result.getRowsProcessed(),
                "duration", result.getDurationSeconds()
            ))
            .build();
        
        events.add(event);
        auditRepository.save(event);
    }
    
    public AuditReport generateReport(ExecutionContext context) {
        return AuditReport.builder()
            .executionId(context.getExecutionId())
            .startTime(context.getStartTime())
            .endTime(context.getEndTime())
            .durationMinutes(context.getDurationMinutes())
            .databasesProcessed(context.getDatabasesProcessed())
            .tablesProcessed(context.getTablesProcessed())
            .totalRowsProcessed(context.getTotalRecordsProcessed())
            .benRegIDMappingCount(context.getBenRegIDMappingCount())
            .validationResult(context.getValidationReport())
            .events(events)
            .build();
    }
}
```

---

## 9. Error Handling & Rollback

### 9.1 BackupManager

```java
@Service
@Slf4j
public class BackupManager {
    
    @Value("${anonymization.backup.directory}")
    private String backupDirectory;
    
    public BackupInfo createBackup() {
        log.info("Creating database backup...");
        
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        String backupFile = String.format("%s/backup_%s.sql", backupDirectory, timestamp);
        
        // Call mysqldump via ProcessBuilder
        String[] databases = {"db_identity", "db_1097_identity", "db_iemr", "db_reporting"};
        
        for (String db : databases) {
            String dbBackupFile = String.format("%s/backup_%s_%s.sql", backupDirectory, db, timestamp);
            
            ProcessBuilder pb = new ProcessBuilder(
                "mysqldump",
                "-u", "amrit_user",
                "-p" + System.getenv("DB_PASSWORD"),
                "--single-transaction",
                "--quick",
                "--lock-tables=false",
                db
            );
            
            pb.redirectOutput(new File(dbBackupFile));
            
            try {
                Process process = pb.start();
                int exitCode = process.waitFor();
                
                if (exitCode != 0) {
                    throw new BackupException("mysqldump failed for " + db);
                }
                
                log.info("Backup created for {}: {}", db, dbBackupFile);
            } catch (Exception e) {
                throw new BackupException("Backup failed for " + db, e);
            }
        }
        
        return new BackupInfo(backupFile, calculateBackupSize(backupFile));
    }
    
    public void restore(BackupInfo backup) {
        log.warn("Restoring from backup: {}", backup.getFilePath());
        
        // Call mysql to restore
        // Implementation similar to backup but using mysql < backup.sql
    }
}
```

---

## 10. Performance Optimization

### 10.1 Optimization Strategies

| Strategy | Implementation | Expected Improvement |
|----------|---------------|---------------------|
| **Batch Updates** | Update 10,000 rows per batch | 100x faster than row-by-row |
| **Index Maintenance** | Temporarily disable non-unique indexes during bulk updates | 2-3x faster |
| **MEMORY Engine** | Use MEMORY engine for benregid_mapping table | 10x faster lookups |
| **Parallel Processing** | Process independent tables in parallel | 2-4x faster overall |
| **Connection Pooling** | Reuse database connections | Reduce overhead |
| **Prepared Statements** | Use PreparedStatement for batch updates | Faster execution |

### 10.2 Index Management

```java
@Service
public class IndexManager {
    
    public void disableIndexes(String tableName) {
        jdbcTemplate.execute("ALTER TABLE " + tableName + " DISABLE KEYS");
    }
    
    public void enableIndexes(String tableName) {
        jdbcTemplate.execute("ALTER TABLE " + tableName + " ENABLE KEYS");
    }
}
```

---

## 11. Testing Strategy

### 11.1 Unit Tests

```java
@SpringBootTest
class AnonymizationStrategyTest {
    
    @Autowired
    private FakeNameStrategy fakeNameStrategy;
    
    @Test
    void testFakeNamePreservesLength() {
        ColumnAnonymizationConfig config = new ColumnAnonymizationConfig();
        config.setColumnName("FirstName");
        config.setMaxLength(10);
        
        String result = (String) fakeNameStrategy.anonymize("Rajesh", config);
        
        assertThat(result).isNotNull();
        assertThat(result.length()).isLessThanOrEqualTo(10);
        assertThat(result).isNotEqualTo("Rajesh");
    }
}
```

### 11.2 Integration Tests

```java
@SpringBootTest
@Testcontainers
class ExecutionEngineIntegrationTest {
    
    @Container
    static MySQLContainer mysql = new MySQLContainer("mysql:8.0");
    
    @Test
    void testTableAnonymization() {
        // Setup test database
        // Insert test data
        // Run anonymization
        // Verify results
    }
}
```

---

## 12. Implementation Timeline

### Week 5-6: Core Engine

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Implement AnonymizationOrchestrator | Orchestration logic |
| 3-4 | Implement ExecutionPlanner | Dependency-aware execution plan |
| 5 | Implement ExecutionEngine | Table-level anonymization |
| 6-7 | Implement all AnonymizationStrategy classes | 8-10 strategy implementations |
| 8-9 | Implement BenRegIDMapper | Mapping table logic |
| 10 | Unit tests for all components | Test suite |

### Week 7: Validation & Audit

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Implement IntegrityValidator | Pre/post validation |
| 3 | Implement ForeignKeyChecker | FK validation |
| 4 | Implement PIILeakageDetector | PII scan logic |
| 5 | Implement AuditLogger | Audit trail |

### Week 8: Testing & Refinement

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-3 | Integration testing on small dataset | Working end-to-end |
| 4-5 | Performance optimization | Batch tuning |
| 6-7 | Full-scale test on production-sized data | Performance report |
| 8-10 | Bug fixes and refinement | Production-ready code |

**Total Duration**: 4 weeks

---

**End of Phase 2 Plan**
