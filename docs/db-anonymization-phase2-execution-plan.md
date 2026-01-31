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

Phase 2 focuses on building the **execution engine** that performs actual data anonymization with **fail-closed schema drift protection**. This phase takes the analysis outputs from Phase 1 (including the Anonymization Registry) and implements a robust, auditable anonymization process with rollback capability via backup restoration. The engine will handle bulk data transformation while preserving referential integrity and ensuring zero data loss.

**Schema Drift Gate**: Before any anonymization occurs, the execution engine validates the live database schema against the Anonymization Registry. If any uncovered PII is detected (new columns, renamed tables, missing rules), execution **ABORTS immediately** (fail-closed behavior) and generates a drift report.

### Key Deliverables

- ✅ Java-based anonymization execution engine with drift detection gate
- ✅ Batch processing system using PK keyset pagination (not LIMIT/OFFSET)
- ✅ BenRegID cross-database mapping implementation (in-memory only, NO CSV export)
- ✅ SQL batch execution with PreparedStatement for bulk updates
- ✅ Referential integrity validation framework
- ✅ Audit logging (metadata only, NO plaintext PII or reversible mappings)
- ✅ Rollback capability via backup restoration (NOT reversible anonymization)

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
| **Schema Drift Detection (CRITICAL)** | Validate live schema against Anonymization Registry before execution | 0 uncovered PII columns (fail-closed gate) |
| **Drift Report Generation** | Produce metadata-only HTML report showing uncovered PII and remediation steps | Drift report ready for DevOps review |
| **Execution Engine** | Build Java application that anonymizes all identified PII fields | Successfully anonymizes 100% of mapped fields |
| **Referential Integrity** | Preserve all foreign key relationships, especially BenRegID | 0 constraint violations post-anonymization |
| **Performance** | Process millions of rows efficiently using PK keyset pagination | Complete db_identity in <30 minutes |
| **Auditability** | Log every transformation for compliance (metadata only, NO plaintext mappings or original→anon pairs) | Complete audit trail with before/after counts |
| **Rollback Capability** | Ability to restore from pre-anonymization backup | Tested rollback procedure via backup restoration |
| **Validation** | Automated checks to verify anonymization success | 100% validation pass rate |

### 1.2 Input Artifacts (from Phase 1)

- `schema-catalog.json` - Complete database schema
- `anonymization-registry.json` - Canonical schema with PII rules (drift detection)
- `pii-field-inventory.csv` - All PII fields identified
- `anonymization-strategy-map.json` - Strategy per field

### 1.3 Output Artifacts

- `anonymized_database_backup_<timestamp>.sql` - Anonymized database dumps
- `drift-report-<timestamp>.html` - Schema drift detection report (if drift detected, execution aborts)
- `anonymization_audit_report_<timestamp>.json` - Complete audit trail (metadata only, NO plaintext mappings)
- `validation_report_<timestamp>.html` - Validation results
- `anonymization_execution.log` - Detailed execution logs

---

## 2. Phase 2 Preflight: Schema Drift Gate

### 2.1 Drift Detection Algorithm

**Purpose**: Ensure the live database schema matches the Anonymization Registry before anonymization. If drift is detected (new PII columns, renamed tables, missing rules), **ABORT execution immediately** (fail-closed).

**Workflow**:

```
STEP 1: Load Anonymization Registry
  ↓ Load anonymization-registry.json
  ↓ Extract canonical names, anonymization rules, schema hashes

STEP 2: Analyze Live Database Schema  
  ↓ Connect to all 4 databases
  ↓ Extract current schema metadata (tables, columns, types)
  ↓ Compute SHA-256 hash per database

STEP 3: Resolve Physical Schema to Canonical Names
  ↓ For each physical table/column, lookup in lineage
  ↓ If physical name ≠ canonical name, check aliases
  ↓ Example: Physical "ben_first_name" → Canonical "FirstName"
  ↓ If no match found → Flag as NEW/UNMAPPED object

STEP 4: Apply PII-Risk Heuristics
  ↓ For each unmapped column, run PIIDetector heuristic
  ↓ Check column name patterns: .*name.*, .*phone.*, .*email.*, etc.
  ↓ Check data type: VARCHAR → potential PII, INT → likely safe
  ↓ Assign risk level: CRITICAL, HIGH, MEDIUM, LOW, UNKNOWN

STEP 5: Fail-Closed Validation
  ↓ Collect all unmapped columns with PII risk ≥ MEDIUM
  ↓ Collect all columns missing anonymization rules
  ↓ Compute schema hash mismatch per database
  ↓
  ↓ IF drift detected:
  ↓   → Generate drift-report-<timestamp>.html
  ↓   → Log all uncovered PII columns
  ↓   → Send alert to DevOps team
  ↓   → ❌ ABORT EXECUTION (FAIL-CLOSED)
  ↓
  ↓ IF no drift:
  ↓   → ✅ Proceed to anonymization
```

### 2.2 Drift Report Output

**Report includes**:
- Uncovered PII fields (table, column, risk level, suggested anonymization rule)
- Renamed objects requiring lineage update (old name → new name)
- Schema hash comparison (expected vs. actual)
- Remediation steps (update registry + rules, commit, retry)

**Delivery**:
- Saved to `docs/phase2-outputs/drift-report-<timestamp>.html`
- Emailed to DevOps + Security team
- Slack/PagerDuty alert triggered

---

## 3. Architecture & Design

### 2.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    Phase 1 Outputs                              │
│  (anonymization-registry.json, pii-coverage-report.json, etc.) │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│           PREFLIGHT: DriftDetector (FAIL-CLOSED GATE)           │
│  • Load registry → Analyze live schema → Resolve canonical     │
│  • Apply PII-risk heuristics → Fail-closed validation          │
│  • IF DRIFT → Generate report + ABORT                          │
│  • IF NO DRIFT → Proceed to orchestrator                       │
└────────────────────┬────────────────────────────────────────────┘
                     │ (Only if no drift detected)
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
│   │   │   ├── AnonymizationRegistry.java
│   │   │   └── ...
│   │   │
│   │   ├── drift/                       [NEW - Phase 2 Preflight]
│   │   │   ├── DriftDetector.java
│   │   │   ├── DriftDetectionResult.java
│   │   │   ├── DriftReportGenerator.java
│   │   │   ├── UncoveredPII.java
│   │   │   └── UnmappedObject.java
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
│   │   │   └── InMemoryMapping.java
│   │   │
│   │   ├── batch/                       [NEW - Phase 2]
│   │   │   ├── BatchProcessor.java
│   │   │   ├── KeysetPagination.java   [Replaces LIMIT/OFFSET]
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
│   │   │   ├── BackupService.java      [Pure Java, ProcessBuilder]
│   │   │   ├── RestoreService.java     [Pure Java, ProcessBuilder]
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
│   ├── anonymization-strategies.yml          [NEW]
│   └── drift-report-template.html            [NEW]
│
└── docs/
    └── phase2-outputs/                  [NEW - Phase 2 artifacts]
        ├── drift-report-<timestamp>.html
        ├── anonymization_audit_report_<timestamp>.json
        ├── validation_report_<timestamp>.html
        └── anonymization_execution.log
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
    private DriftDetector driftDetector;
    
    @Autowired
    private DriftReportGenerator driftReportGenerator;
    
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
    private BackupService backupService;
    
    public AnonymizationResult executeAnonymization(AnonymizationConfig config) {
        
        log.info("Starting anonymization process...");
        
        ExecutionContext context = new ExecutionContext();
        context.setStartTime(Instant.now());
        
        try {
            // ================================================================
            // STEP 0: DRIFT DETECTION GATE (FAIL-CLOSED)
            // ================================================================
            log.info("Step 0: Running schema drift detection gate...");
            DriftDetectionResult driftResult = driftDetector.detectDrift();
            context.setDriftDetectionResult(driftResult);
            
            if (driftResult.isDriftDetected()) {
                log.error("❌ Schema drift detected! Execution ABORTED (fail-closed)");
                
                // Generate drift report
                driftReportGenerator.generateDriftReport(driftResult);
                
                // Abort execution
                context.setStatus(ExecutionStatus.ABORTED_DRIFT);
                context.setError("Schema drift detected - uncovered PII columns found");
                
                return new AnonymizationResult(context);
            }
            
            log.info("✅ Drift gate passed - No uncovered PII detected");
            log.info("Proceeding to anonymization...");
            
            // ================================================================
            // STEP 1: Create Pre-Anonymization Backup
            // ================================================================
            log.info("Step 1: Creating pre-anonymization backup...");
            BackupInfo backup = backupService.createBackup();
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
            
            // ================================================================
            // STEP 4: Build BenRegID Mapping (IN-MEMORY ONLY)
            // ================================================================
            log.info("Step 4: Building BenRegID mapping (in-memory, NO CSV export)...");
            benRegIDMapper.buildMapping();
            context.setBenRegIDMappingCount(benRegIDMapper.getMappingCount());
            auditLogger.logBenRegIDMappingCreated(benRegIDMapper.getMappingCount());
            log.info("BenRegID mappings created: {} (in-memory, ephemeral)", benRegIDMapper.getMappingCount());
            
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
            
            // ================================================================
            // STEP 10: Generate Audit Report (METADATA ONLY)
            // ================================================================
            log.info("Step 10: Generating audit report (metadata only)...");
            AuditReport auditReport = auditLogger.generateReport(context);
            context.setAuditReport(auditReport);
            
            // ================================================================
            // STEP 11: Discard BenRegID Mapping (SECURITY)
            // ================================================================
            log.info("Step 11: Discarding BenRegID mapping (security requirement)...");
            benRegIDMapper.clearMapping();
            log.info("BenRegID mapping cleared from memory (never persisted)");
            
            context.setEndTime(Instant.now());
            context.setStatus(ExecutionStatus.SUCCESS);
            
            log.info("=================================================" );
            log.info("  Anonymization completed successfully!         ");
            log.info("  Duration: {} minutes", context.getDurationMinutes());
            log.info("  Records processed: {}", context.getTotalRecordsProcessed());
            log.info("  Rollback: Via backup restoration (backup saved)");
            log.info("=================================================");
            
            return new AnonymizationResult(context);
            
        } catch (Exception e) {
            log.error("Anonymization failed: {}", e.getMessage(), e);
            context.setStatus(ExecutionStatus.FAILED);
            context.setError(e.getMessage());
            auditLogger.logError(e);
            
            // Discard in-memory mapping on failure
            benRegIDMapper.clearMapping();
            
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
        
        Object lastPKValue = null; // For keyset pagination
        
        // Process in batches using PK keyset pagination (NOT LIMIT/OFFSET)
        while (processedRows < totalRows) {
            
            // Fetch batch using keyset pagination
            List<Map<String, Object>> batch = fetchBatchKeyset(
                tableName, primaryKey, lastPKValue, batchSize
            );
            
            if (batch.isEmpty()) {
                break; // No more rows
            }
            
            // Anonymize batch
            List<Map<String, Object>> anonymizedBatch = anonymizeBatch(batch, columns);
            
            // Update batch
            int updated = updateBatch(tableName, anonymizedBatch);
            
            processedRows += batch.size();
            updatedRows += updated;
            
            // Update last PK value for next iteration
            lastPKValue = batch.get(batch.size() - 1).get(primaryKey);
            
            progressTracker.updateProgress(tableName, processedRows);
            
            log.debug("Processed {}/{} rows (last PK: {})", processedRows, totalRows, lastPKValue);
        }
        
        progressTracker.completeTable(tableName);
        
        return new TableAnonymizationResult(tableName, totalRows, updatedRows);
    }
    
    /**
     * Fetch batch using PK keyset pagination (more efficient than LIMIT/OFFSET)
     * 
     * Keyset pagination benefits:
     * - O(1) performance (no offset scanning)
     * - Works correctly with concurrent modifications
     * - Stable ordering (PK-based)
     * 
     * Example query:
     *   SELECT * FROM table WHERE pk > ? ORDER BY pk LIMIT 10000
     */
    private List<Map<String, Object>> fetchBatchKeyset(
            String tableName, String primaryKey, Object lastPKValue, int batchSize) {
        
        String query;
        List<Map<String, Object>> batch;
        
        if (lastPKValue == null) {
            // First batch
            query = String.format(
                "SELECT * FROM %s ORDER BY %s LIMIT %d",
                tableName, primaryKey, batchSize
            );
            batch = jdbcTemplate.queryForList(query);
        } else {
            // Subsequent batches (keyset pagination)
            query = String.format(
                "SELECT * FROM %s WHERE %s > ? ORDER BY %s LIMIT %d",
                tableName, primaryKey, primaryKey, batchSize
            );
            batch = jdbcTemplate.queryForList(query, lastPKValue);
        }
        
        return batch;
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

### 4.1 Complete Execution Flow (WITH DRIFT GATE)

```
START
  │
  ├─► 0. DRIFT DETECTION GATE (NEW - FAIL-CLOSED)
  │     ├─► Load anonymization-registry.json
  │     ├─► Analyze live database schema (all 4 databases)
  │     ├─► Compare live schema vs. registry
  │     ├─► Detect new/renamed/missing tables/columns
  │     │
  │     ├─► IF DRIFT DETECTED:
  │     │     ├─► Generate drift-report-<timestamp>.html
  │     │     ├─► Log all uncovered PII columns
  │     │     ├─► Send alert to DevOps team
  │     │     └─► ABORT EXECUTION (FAIL-CLOSED)
  │     │
  │     └─► IF NO DRIFT: Proceed to step 1 ✅
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
  ├─► 4. Build BenRegID Mapping (IN-MEMORY ONLY)
  │     ├─► Extract all unique BenRegIDs from db_identity.i_beneficiary
  │     ├─► Generate anonymized BenRegIDs via BeneficiaryID-Generation-API
  │     ├─► Store mapping in ConcurrentHashMap<Long, Long> (in-memory)
  │     └─► NO CSV EXPORT (security requirement)
  │
  ├─► 5. Anonymize db_identity
  │     ├─► For each table (in dependency order):
  │     │     ├─► Process in batches (e.g., 10,000 rows)
  │     │     ├─► Apply anonymization strategies per column
  │     │     ├─► Update rows in database
  │     │     └─► Log progress (metadata only, NO plaintext values)
  │     └─► Validate db_identity integrity
  │
  ├─► 6. Anonymize db_1097_identity
  │     ├─► Apply BenRegID mapping (from in-memory map)
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
  ├─► 10. Generate Audit Report (METADATA ONLY)
  │     ├─► Total tables processed
  │     ├─► Total rows anonymized (counts only)
  │     ├─► Execution duration
  │     ├─► BenRegID mapping statistics (count only, NO mappings)
  │     ├─► Validation results
  │     └─► Schema hash (current state)
  │
  ├─► 11. Discard BenRegID Mapping (SECURITY)
  │     └─► Clear in-memory ConcurrentHashMap (mappings never persisted)
  │
  ├─► 12. Create Anonymized Backup
  │     └─► mysqldump anonymized databases to anonymized_<timestamp>.sql
  │
  └─► END (SUCCESS)
  
  ❌ ON ERROR:
      ├─► Log error details
      ├─► Discard in-memory BenRegID mapping
      ├─► Restore from pre-anonymization backup
      ├─► Generate failure report
      └─► EXIT with error code
```

### 4.2 Transaction Management Strategy

**Approach**: Table-level transactions (not full database transaction)

**Rationale**:
- Full database transaction would lock entire DB for hours
- Table-level allows parallel processing and progress visibility
- Rollback handled via backup restoration (NOT transaction rollback)

```java
@Transactional(propagation = Propagation.REQUIRES_NEW)
public TableAnonymizationResult anonymizeTable(TableExecutionStep tableStep) {
    // This creates a new transaction per table
    // If this table fails, only this table is rolled back
    // Other tables remain committed
    // Full rollback achieved via RestoreService.java (backup restoration)
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
    
    @Autowired
    private BeneficiaryIDGenerator benIdGenerator;
    
    private ConcurrentHashMap<Long, Long> mappingCache = new ConcurrentHashMap<>();
    
    public void buildMapping() {
        log.info("Building BenRegID mapping (in-memory, ephemeral)...");
        
        // Step 1: Extract all unique BenRegIDs
        String query = "SELECT DISTINCT BeneficiaryRegID FROM i_beneficiary ORDER BY BeneficiaryRegID";
        List<Long> originalIds = identityJdbcTemplate.queryForList(query, Long.class);
        
        log.info("Found {} unique BenRegIDs", originalIds.size());
        
        // Step 2: Generate anonymized IDs using BeneficiaryID-Generation-API
        for (Long originalId : originalIds) {
            Long anonymizedId = benIdGenerator.generateBeneficiaryID();
            mappingCache.put(originalId, anonymizedId);
        }
        
        log.info("BenRegID mapping built successfully. {} mappings created (in-memory only).", mappingCache.size());
        log.info("❌ NO CSV export - mapping stays in-memory (security requirement)");
    }
    
    public Long getAnonymizedId(Long originalId) {
        return mappingCache.get(originalId);
    }
    
    public int getMappingCount() {
        return mappingCache.size();
    }
    
    /**
     * Clear mapping from memory (security requirement)
     * Called after anonymization completes or on error
     */
    public void clearMapping() {
        log.info("Clearing BenRegID mapping from memory...");
        int count = mappingCache.size();
        mappingCache.clear();
        log.info("Cleared {} BenRegID mappings (never persisted to disk)", count);
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
                // ❌ NO row data, NO plaintext PII
            ))
            .build();
        
        events.add(event);
        auditRepository.save(event);
    }
    
    public void logBenRegIDMappingCreated(int mappingCount) {
        AuditEvent event = AuditEvent.builder()
            .timestamp(Instant.now())
            .eventType("BENREGID_MAPPING_CREATED")
            .details(Map.of(
                "mappingCount", mappingCount
                // ❌ NO original→anonymized pairs (de-anonymization risk)
                // ✅ Count only (metadata)
            ))
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
                // ❌ NO plaintext values (before/after)
                // ✅ Metadata only (counts, timings)
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
            .benRegIDMappingCount(context.getBenRegIDMappingCount()) // Count only
            .validationResult(context.getValidationReport())
            .events(events)
            .securityNote("Metadata only - no plaintext PII or reversible mappings included")
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
public class BackupService {
    
    @Value("${anonymization.backup.directory}")
    private String backupDirectory;
    
    @Value("${mysql.host}")
    private String mysqlHost;
    
    @Value("${mysql.port}")
    private int mysqlPort;
    
    @Value("${mysql.username}")
    private String mysqlUsername;
    
    public BackupInfo createBackup() throws IOException, InterruptedException {
        log.info("Creating database backup (via ProcessBuilder)...");
        
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        
        String[] databases = {"db_identity", "db_1097_identity", "db_iemr", "db_reporting"};
        
        List<String> backupFiles = new ArrayList<>();
        
        for (String db : databases) {
            String dbBackupFile = String.format("%s/backup_%s_%s.sql", backupDirectory, db, timestamp);
            
            // Use ProcessBuilder for cross-platform mysqldump execution
            ProcessBuilder pb = new ProcessBuilder(
                "mysqldump",
                "-h", mysqlHost,
                "-P", String.valueOf(mysqlPort),
                "-u", mysqlUsername,
                "-p" + System.getenv("MYSQL_PASSWORD"), // From environment variable
                "--single-transaction",
                "--quick",
                "--lock-tables=false",
                "--skip-triggers", // Optional: skip triggers
                db
            );
            
            pb.redirectOutput(ProcessBuilder.Redirect.to(new File(dbBackupFile)));
            pb.redirectError(ProcessBuilder.Redirect.INHERIT);
            
            Process process = pb.start();
            int exitCode = process.waitFor();
            
            if (exitCode != 0) {
                throw new BackupException("mysqldump failed for " + db + " (exit code: " + exitCode + ")");
            }
            
            log.info("Backup created for {}: {}", db, dbBackupFile);
            backupFiles.add(dbBackupFile);
        }
        
        long totalSize = backupFiles.stream()
            .mapToLong(f -> new File(f).length())
            .sum();
        
        return new BackupInfo(backupDirectory, backupFiles, totalSize, timestamp);
    }
}
```

---

## 10. Performance Optimization

### 10.1 Optimization Strategies

| Strategy | Implementation | Expected Improvement |
|----------|---------------|---------------------|
| **PK Keyset Pagination** | Replace LIMIT/OFFSET with WHERE pk > ? | 10-100x faster for large tables |
| **Batch Updates** | Update 10,000 rows per PreparedStatement batch | 100x faster than row-by-row |
| **In-Memory Mapping** | ConcurrentHashMap for BenRegID lookup | O(1) lookup vs SQL JOIN |
| **Parallel Processing** | Process independent tables in parallel | 2-4x faster overall |
| **Connection Pooling** | Reuse database connections | Reduce overhead |
| **PreparedStatement Reuse** | Reuse PreparedStatement for batch updates | Faster execution |

### 10.2 Performance Notes

**Removed Optimizations** (security concerns):
- ❌ `ALTER TABLE ... DISABLE KEYS` - **REMOVED** (not supported by InnoDB, misleading claim)
- ❌ MEMORY engine for mapping table - **REMOVED** (no persistent mapping table anymore)

**Why DISABLE KEYS was removed**:
- InnoDB (default MySQL engine) does NOT support `DISABLE KEYS`
- Only works for MyISAM (legacy engine)
- Modern InnoDB uses clustered indexes (cannot be disabled)
- Misleading performance claim

**Actual InnoDB Optimizations**:
- Use `SET unique_checks=0; SET foreign_key_checks=0;` (risky, not recommended)
- Use keyset pagination (more effective than index disabling)
- Use PreparedStatement batching (already implemented)

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

### Week 5-6: Core Engine + Drift Gate

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Implement DriftDetector + DriftReportGenerator | Drift detection gate |
| 3-4 | Implement AnonymizationOrchestrator | Orchestration logic with drift gate |
| 5 | Implement ExecutionPlanner | Dependency-aware execution plan |
| 6 | Implement ExecutionEngine with PK keyset pagination | Table-level anonymization |
| 7-8 | Implement all AnonymizationStrategy classes | 8-10 strategy implementations |
| 9 | Implement BenRegIDMapper (in-memory only) | In-memory mapping logic |
| 10 | Unit tests for all components | Test suite |

### Week 7: Validation & Audit

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Implement IntegrityValidator | Pre/post validation |
| 3 | Implement ForeignKeyChecker | FK validation |
| 4 | Implement PIILeakageDetector | PII scan logic |
| 5 | Implement AuditLogger (metadata only) | Audit trail (no plaintext) |
| 6 | Implement BackupService + RestoreService (Java) | Backup/restore via ProcessBuilder |

### Week 8: Testing & Refinement

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-3 | Integration testing on small dataset | Working end-to-end with drift gate |
| 4-5 | Performance optimization (keyset pagination tuning) | Batch tuning |
| 6-7 | Full-scale test on production-sized data | Performance report |
| 8-9 | Drift detection testing (simulate schema changes) | Drift gate validation |
| 10 | Bug fixes and refinement | Production-ready code |

**Total Duration**: 4 weeks

---

**End of Phase 2 Plan**
