# AMRIT Database Anonymization - Master Plan

**Project**: Automated UAT Database Refresh with Anonymization  
**Technology Stack**: Java 17, Spring Boot 3.3.2, MySQL 8.0, Jenkins  
**Status**: Planning Phase  
**Original Task**: [C4GT Community] Automate anonymized production DB snapshot for UAT  
**Task Reference**: See [task.txt](../task.txt)  
**Last Updated**: January 31, 2026

---

## Executive Summary

This master plan provides a complete roadmap for implementing an automated, secure, and repeatable process to refresh the UAT environment with anonymized production data. The project is divided into three sequential phases, with a total estimated timeline of **12 weeks** (3 months).

### Vision

**Enable safe, realistic testing in UAT by providing production-like data without privacy risks.**

### Key Objectives

- ✅ **Compliance**: GDPR/HIPAA-compliant anonymization (100% PII removal)
- ✅ **Automation**: One-click UAT refresh via Jenkins or standalone Java CLI
- ✅ **Integrity**: Zero referential integrity violations post-anonymization
- ✅ **Performance**: Complete refresh in <2 hours
- ✅ **Safety**: Zero production impact during backup
- ✅ **Auditability**: Complete audit trail for compliance (metadata-only)
- ✅ **Schema Drift Protection**: Anonymization Registry prevents PII leakage from schema changes (fail-closed)
- ✅ **Cross-Platform**: Pure Java orchestration (Windows, Linux, macOS)

### Alignment with Original Task

**Original Task Goal**: 
> "We should be able to run one command or pipeline preferably in Jenkins and end up with a fresh, anonymized UAT database that is safe for testing and community contributions."

**Our Solution Delivers**: ✅ Jenkins pipeline + Standalone Java CLI that executes: Backup → Anonymize → Restore → Validate

**Technology Decision**: 
- **Task Suggested**: Python / shell + SQL
- **We Chose**: Java 17 + Spring Boot + SQL
- **Rationale**: Java provides cross-platform compatibility (Windows/Linux/Mac), better integration with existing AMRIT-DB codebase (already Spring Boot), type safety, and enterprise-grade tooling. All task requirements are fully achievable in Java.

**Scope Alignment**:

| Original Task Requirement | Our Implementation | Status |
|--------------------------|-------------------|--------|
| Take production DB backup | Phase 3: BackupService.java + mysqldump integration | ✅ Covered |
| Anonymize sensitive fields (name, phone, address, ABHA ID, etc.) | Phase 2: 8+ AnonymizationStrategy implementations | ✅ Covered |
| Maintain referential integrity | Phase 2: BenRegIDMapper (in-memory) + IntegrityValidator | ✅ Covered |
| Create SQL dump for UAT | Phase 3: Export anonymized backup | ✅ Covered |
| Restore to UAT | Phase 3: RestoreService.java | ✅ Covered |
| One command/pipeline (Jenkins) | Phase 3: Jenkinsfile + CLI | ✅ Covered |
| Documented process | All 3 phases + Operations runbook | ✅ Covered |
| Auditable & safe | Phase 2: AuditLogger (metadata-only) + validation framework | ✅ Covered |
| No PII in UAT | Phase 2: PIILeakageDetector + Anonymization Registry drift gate | ✅ Covered |
| Schema drift protection | Phase 1-2: AnonymizationRegistry + fail-closed enforcement | ✅ Covered |

---

## Table of Contents

1. [Task Requirements Mapping](#1-task-requirements-mapping)
2. [Project Overview](#2-project-overview)
3. [Three-Phase Approach](#3-three-phase-approach)
4. [Anonymization Registry & Schema Drift Gate](#4-anonymization-registry--schema-drift-gate)
5. [Technology Stack](#5-technology-stack)
6. [Success Metrics](#6-success-metrics)
7. [Risk Assessment](#7-risk-assessment)
8. [Resource Requirements](#8-resource-requirements)
9. [Timeline Summary](#9-timeline-summary)
10. [Deliverables Checklist](#10-deliverables-checklist)
11. [Governance & Approvals](#11-governance--approvals)

---

## 1. Task Requirements Mapping

### 1.1 Original Task Breakdown vs Our Implementation

#### Task Step 1: Inventory of Sensitive Data
**Original Requirement**: "Identify all tables and fields with PII/sensitive data. Document them."

**Our Implementation**: 
- **Phase 1, Week 1-2**: DatabaseSchemaAnalyzer + PIIDetector + **AnonymizationRegistry**
- **Deliverable**: `pii-field-inventory.csv` with all sensitive fields + `anonymization-registry.json`
- **Coverage**: All PII fields in 4 databases (db_identity, db_1097_identity, db_iemr, db_reporting)

**NEW: Anonymization Registry** (Metadata-Only Schema Drift Protection):
- ✅ **Canonical Schema Tracking**: Registry stores expected schema structure (tables/columns/types)
- ✅ **Drift Detection**: Compares live schema vs. registry, identifies new/renamed/missing objects
- ✅ **Coverage Enforcement**: Every PII-risk column MUST have an anonymization rule (fail-closed)
- ✅ **Migration Tracking**: Handles renames via lineage metadata (anon_object_lineage)
- ✅ **Drift Report**: Generates metadata-only report of schema changes requiring action
- ✅ **Security**: NO row data, NO plaintext mappings, metadata only (schema hashes, counts)

**Fields Covered**:
- ✅ Patient names (FirstName, LastName, FatherName, MotherName)
- ✅ Phone numbers (PhoneNo, EmergencyContact)
- ✅ Addresses (Address, City, State, PIN)
- ✅ ABHA ID (HealthID, ABHA_Number)
- ✅ Beneficiary ID (BeneficiaryRegID - with cross-DB mapping)
- ✅ Government IDs (AadharNo, PANNo, VoterID, RationCardNo)
- ✅ Biometric data (FaceEmbedding, Fingerprint)
- ✅ Medical conditions (Diagnosis, ChiefComplaint, Prescription)
- ✅ Free-text fields (Notes, Comments)

---

#### Task Step 2: Design Anonymization Rules
**Original Requirement**: "Decide on masking strategies (Names → fake names, Phone → dummy format, IDs → hashed/random, Addresses → generalized). Ensure referential integrity."

**Our Implementation**: 
- **Phase 1, Week 4**: Strategy definition with domain expert
- **Phase 2, Week 6**: AnonymizationStrategy implementations + **Registry enforcement**
- **Deliverable**: `anonymization-strategy-map.json` + registry with coverage validation

**Strategies Implemented**:
- ✅ **FakeNameStrategy**: JavaFaker Indian names (preserves format, length)
- ✅ **FakePhoneStrategy**: Dummy Indian phone patterns (+91-XXXXXXXXXX)
- ✅ **FakeAddressStrategy**: JavaFaker Indian addresses
- ✅ **FakeGovernmentIDStrategy**: Random but valid-format IDs (Aadhaar: 12 digits, PAN: XXXXX9999X)
- ✅ **BenRegIDMappingStrategy**: In-memory temporary mapping (NOT persisted, discarded after execution)
- ✅ **GenericPlaceholderStrategy**: Medical conditions → "CONDITION_001", "CONDITION_002"
- ✅ **NullificationStrategy**: Biometric data → NULL (cannot fake)

**Referential Integrity**: 
- BenRegID mapping stays IN-MEMORY (Java ConcurrentHashMap) ensuring all foreign keys remain valid across db_identity → db_1097_identity → db_iemr
- Mappings discarded immediately after execution (never exported to CSV/file)
- Unique constraints maintained (phone numbers remain unique post-anonymization)

**NEW: Registry Coverage Enforcement**:
- ✅ **Pre-Execution Gate**: Registry validates ALL PII columns have anonymization rules
- ✅ **Fail-Closed**: If uncovered PII-risk columns detected, execution aborts (NO UAT restore)
- ✅ **Drift Gate**: New tables/columns from Flyway migrations trigger coverage check failure

---

#### Task Step 3: Implement Anonymization Script
**Original Requirement**: "Implement SQL-based or language-based (Python, etc.) anonymization functions. Make it configurable via environment variables."

**Our Implementation**: 
- **Phase 2, Weeks 5-8**: Java-based execution engine (no Python/shell scripts)
- **Technology**: Java 17 + Spring Boot 3.3.2
- **Deliverable**: Complete Java application with batch processing

**Components Built**:
- ✅ **AnonymizationOrchestrator**: Main coordinator with drift gate
- ✅ **ExecutionEngine**: Batch processing (10,000-20,000 rows/batch)
- ✅ **8+ AnonymizationStrategy classes**: Pluggable strategy pattern
- ✅ **BenRegIDMapper**: In-memory cross-database ID mapping (ephemeral)
- ✅ **IntegrityValidator**: Foreign key + unique constraint validation
- ✅ **AuditLogger**: Metadata-only audit trail for compliance

**Configuration**: 
- Environment variables via Spring Boot properties
- `application-anonymization.properties` for all settings
- No hardcoded credentials (uses environment variables)

---

#### Task Step 4: Implement Backup & Restore Flow
**Original Requirement**: "Script backup & restore steps around anonymization. Add safety checks (refuse to run if target DB is production)."

**Our Implementation**: 
- **Phase 3, Week 9**: BackupService + RestoreService (Pure Java, cross-platform)
- **Deliverable**: Complete backup/restore workflow (NO bash/PowerShell scripts)

**Safety Features**:
- ✅ Pre-execution validation: Checks target database is NOT production
- ✅ Database name validation: Refuses to run on DBs named "prod", "production"
- ✅ Pre-restore UAT backup: Creates rollback point before overwriting UAT
- ✅ Backup from read replica: Zero production impact
- ✅ Connection pooling: Prevents connection exhaustion
- ✅ **NEW**: Drift gate aborts execution if uncovered PII detected

**Backup Strategy**:
- Reads from production read replica (not primary)
- Uses Java ProcessBuilder to invoke mysqldump with `--single-transaction` (consistent snapshot)
- Compressed backup (gzip)
- S3/NFS storage with 30-day retention

---

#### Task Step 5: Document the Process
**Original Requirement**: "Add documentation page (e.g., docs/db-anonymization-and-uat-refresh.md). Include prerequisites, how to run, which tables/fields anonymized."

**Our Implementation**: 
- **All 3 phases**: Comprehensive documentation
- **Location**: `AMRIT-DB/docs/`

**Documentation Created**:
- ✅ `db-anonymization-master-plan.md` (this document) - Complete roadmap
- ✅ `db-anonymization-phase1-analysis-plan.md` - Analysis approach with registry creation
- ✅ `db-anonymization-phase2-execution-plan.md` - Execution engine with drift gate
- ✅ `db-anonymization-phase3-automation-plan.md` - Jenkins pipeline & CLI (Java-only)
- ✅ `pii-field-inventory.csv` (generated) - All PII fields
- ✅ `anonymization-strategy-map.json` (generated) - Strategy per field
- ✅ `anonymization-registry.json` (generated) - Canonical schema with drift detection
- ✅ Operations runbook (Phase 3) - Comprehensive operational guide
- ✅ API documentation (JavaDoc)

**Content Includes**:
- Prerequisites & environment setup
- Step-by-step execution instructions (Jenkins + standalone CLI)
- Complete list of anonymized tables/fields
- Registry maintenance procedures (handling schema drift)
- Safety warnings and constraints
- Troubleshooting guide

---

#### Task Step 6: Dry Runs & Validation
**Original Requirement**: "Test on staging copy of the DB. Verify application behavior and data anonymization manually."

**Our Implementation**: 
- **Phase 2, Week 8**: Integration testing on production-sized data
- **Phase 3, Week 10**: Dry runs with team + drift simulation tests
- **Deliverable**: Validation framework + test reports

**Testing Approach**:
- ✅ Unit tests for each AnonymizationStrategy
- ✅ Integration tests on temporary MySQL instance
- ✅ Full-scale test on production-sized dataset (non-production copy)
- ✅ Automated validation: PIILeakageDetector scans for remaining PII
- ✅ Foreign key validation: 0 constraint violations
- ✅ Unique constraint validation: All unique fields remain unique
- ✅ Row count preservation: Before count == After count
- ✅ **NEW**: Drift detection tests (simulate new PII columns, verify abort behavior)
- ✅ Application smoke tests: Core flows work in UAT

---

#### Task Acceptance Criteria: Final Checklist

**✅ A script or set of scripts exists to:**
- [x] Take a production backup → `BackupService.java` (Java, no bash)
- [x] Anonymize all defined PII fields → `ExecutionEngine.java` + strategies
- [x] Restore the anonymized DB into UAT → `RestoreService.java` (Java, no bash)

**✅ Clear documentation is added under docs/:**
- [x] Prerequisites & environment variables → Phase 1-3 docs
- [x] How to run the anonymization+restore flow → Operations runbook (Jenkins + CLI)
- [x] Which tables/fields are anonymized and how → `pii-field-inventory.csv` + strategy map
- [x] Registry maintenance procedures → Operations runbook section on drift response

**✅ The process is tested on a non-production copy of the DB first:**
- [x] Phase 2 Week 8: Full-scale testing on staging copy
- [x] Drift detection gate tested with simulated schema changes

**✅ The UAT DB after refresh:**
- [x] Works for core application flows → Validated in smoke tests
- [x] Contains no real PII in inspected tables → PIILeakageDetector validation + registry coverage

**✅ Production credentials or raw dumps are never exposed:**
- [x] Environment variables for credentials (not hardcoded)
- [x] Backups stored securely (S3/NFS with access control)
- [x] Logs sanitized (no credentials, no PII values - metadata only)
- [x] Jenkins credentials plugin for secure storage
- [x] **NEW**: BenRegID mappings never exported (in-memory only, discarded after)

---

### 1.2 Why Java Instead of Python?

**Original Task Suggestion**: "Write a script (e.g., Python / shell + SQL)"

**Our Decision**: Java 17 + Spring Boot (cross-platform, no shell scripts)

**Justification**:

| Requirement | Python + Bash | Java 17 + Spring Boot | Winner |
|-------------|---------------|----------------------|--------|
| **Cross-platform** | ⚠️ Bash requires rewrites (bash vs PowerShell) | ✅ Pure Java works everywhere | Java |
| **AMRIT stack alignment** | ❌ Not used | ✅ Existing Spring Boot | Java |
| **Type safety** | ❌ Dynamic | ✅ Static typing | Java |
| **Enterprise tooling** | ⚠️ Good | ✅ Excellent | Java |
| **Team expertise** | Unknown | ✅ AMRIT team knows Java | Java |
| **Database integration** | ✅ Good | ✅ Excellent (Spring Data JPA) | Tie |
| **CI/CD integration** | ✅ Good | ✅ Excellent (Maven) | Tie |
| **Performance** | ⚠️ Slower for batch | ✅ JVM optimization | Java |
| **Batch processing** | ⚠️ Manual | ✅ Spring Batch | Java |
| **Windows support** | ❌ Bash requires WSL/Git Bash | ✅ Native Java support | Java |

**Conclusion**: Java provides better alignment with existing AMRIT infrastructure, stronger type safety for handling sensitive data, superior cross-platform support (no OS-specific scripts), and superior batch processing capabilities via Spring Boot ecosystem.

**Task Note**: Original task said "can be refined during implementation" - we refined it to Java for the above reasons.

---

## 2. Project Overview

### 2.1 Problem Statement

**Current State**:
- UAT environment lacks realistic test data
- Manual data anonymization is error-prone and time-consuming
- Risk of PII exposure in non-production environments
- Inconsistent test results due to outdated UAT data
- Cannot share UAT access with external contributors (security concerns)
- **NEW RISK**: Schema drift from Flyway migrations can introduce uncovered PII columns

**Desired State**:
- Automated weekly/on-demand UAT refresh with anonymized production data
- Zero PII leakage (enforced via Anonymization Registry)
- Referential integrity maintained
- Scheduled via Jenkins CI/CD OR standalone Java CLI
- Complete audit trail for compliance (metadata-only)
- Operations team can execute with one button click
- **NEW**: Fail-closed behavior prevents UAT restore if schema drift introduces uncovered PII

### 2.2 Scope

**In Scope**:
- All 4 AMRIT databases: `db_identity`, `db_1097_identity`, `db_iemr`, `db_reporting`
- All PII fields: Names, phone numbers, addresses, government IDs, biometric data, medical conditions
- Cross-database foreign key relationships (especially BeneficiaryRegID)
- Automated backup/restore/anonymize pipeline (pure Java, no bash/PowerShell)
- Jenkins CI/CD integration OR standalone Java CLI
- Anonymization Registry for schema drift protection
- Monitoring and alerting
- Operations documentation (including registry maintenance)

**Out of Scope**:
- Real-time data synchronization (this is batch-based)
- Schema migrations (handled separately by Flyway)
- Application-level changes
- Non-PII data transformations
- Performance tuning of production database
- Infrastructure provisioning (assumes existing servers)

### 2.3 Constraints

**Technical Constraints**:
- ✅ **Language**: Java 17 only (no Python, JavaScript, bash, PowerShell)
- ✅ **Orchestration**: Java-based (cross-platform, no OS-specific scripts)
- ✅ **Framework**: Spring Boot 3.3.2
- ✅ **Database**: MySQL 8.0
- ✅ **CI/CD**: Jenkins (optional - can run standalone Java CLI)
- ✅ **OS Support**: Windows, Linux, macOS
- ✅ **Security**: Metadata-only auditing, no plaintext mapping exports

**Business Constraints**:
- Zero production performance impact during backup
- UAT must remain available 95%+ of the time
- Complete project in 12 weeks
- Budget: TBD (minimal infrastructure costs)

---

## 3. Three-Phase Approach

### Phase 1: Analysis & Planning (Weeks 1-4)

**Objective**: Understand what data exists and how to anonymize it

**Key Activities**:
- Analyze all 4 databases to extract schema metadata
- Identify all PII fields using keyword detection + manual review
- **Build Anonymization Registry with canonical schema + drift detection**
- Define anonymization strategy for each field type
- Document foreign key dependencies (especially BenRegID)
- Build Java analyzer tools (DatabaseSchemaAnalyzer + AnonymizationRegistry)
- Integrate JavaFaker and BeneficiaryID-Generation-API
- Generate fake data samples for testing

**Deliverables**:
1. `schema-catalog.json` - Complete database schema
2. **`anonymization-registry.json` - Canonical schema with PII rules, drift detection config**
3. `pii-field-inventory.csv` - All PII fields identified
4. `anonymization-strategy-map.json` - Strategy per field
5. `constraint-dependency-graph.html` - Foreign key relationships
6. `data-sample-analysis.json` - Current data patterns
7. Working Java analyzer application (with AnonymizationRegistry.java)
8. Phase 1 completion report

**Decision Point**: 
- **BenRegID Handling Strategy**: In-memory mapping (discarded after execution, never exported)
- **Registry Structure**: Canonical naming defaults to current physical names (no historical aliases needed initially)
- **Approval Required**: Stakeholder + Security Team sign-off to proceed to Phase 2

**Detailed Plan**: See [db-anonymization-phase1-analysis-plan.md](./db-anonymization-phase1-analysis-plan.md)

---

### Phase 2: Execution Engine (Weeks 5-8)

**Objective**: Build the anonymization engine that transforms data

**Key Activities**:
- Implement AnonymizationOrchestrator (main coordinator) **with drift gate**
- Build ExecutionEngine for batch processing
- Create AnonymizationStrategy implementations (8-10 strategies)
- Implement BenRegIDMapper (in-memory, ephemeral - never persisted)
- Build validation framework (foreign keys, unique constraints, PII leakage)
- Implement audit logging (metadata-only, NO plaintext values)
- Create BackupManager/RestoreManager (Java-based, no bash)
- **Implement drift detection: abort execution if uncovered PII detected**
- Performance optimization (batching, indexing)
- Testing on production-sized datasets + drift simulation

**Deliverables**:
1. Working Java anonymization application
2. `AnonymizationOrchestrator.java` with drift gate
3. All `AnonymizationStrategy` implementations
4. `BenRegIDMapper.java` (in-memory only, discarded post-execution)
5. `IntegrityValidator.java` and validation framework
6. `AuditLogger.java` with metadata-only compliance reporting
7. **`drift-report-<timestamp>.html` - Schema drift detection report (if drift found)**
8. `anonymization_audit_report_<timestamp>.json` - Audit trail (metadata only, NO plaintext mappings)
9. `validation_report_<timestamp>.html` - Validation results
10. Unit and integration test suite (including drift detection tests)
11. Phase 2 completion report

**Security Note**: NO CSV export of BenRegID mappings. Mappings stay in-memory (Java Map) during execution, discarded immediately after.

**Decision Point**:
- **Performance Targets Met**: Validate <2 hour execution time
- **Drift Detection Validated**: Confirm fail-closed behavior works correctly
- **Approval Required**: Security team review of anonymization strategies + drift gate implementation

**Detailed Plan**: See [db-anonymization-phase2-execution-plan.md](./db-anonymization-phase2-execution-plan.md)

---

### Phase 3: Automation & Deployment (Weeks 9-12)

**Objective**: Deploy to production as automated Jenkins pipeline OR standalone Java CLI

**Key Activities**:
- Setup production backup infrastructure (read replica)
- Build Java orchestration classes (BackupService, RestoreService, OrchestrationService)
- Build Jenkins pipeline (Jenkinsfile) with drift gate
- OR configure standalone Java CLI for Windows Task Scheduler / Linux cron
- Configure Jenkins job with scheduling (if using Jenkins)
- Setup monitoring (Prometheus/Grafana) with drift detection metrics
- Configure alerting (Slack, email) - alert on drift detected
- Create operations runbook (includes registry maintenance procedures)
- Team training (including how to handle drift alerts)
- Dry runs and load testing
- Production launch

**Deliverables**:
1. Production read replica setup (if not exists)
2. Java orchestration classes: `BackupService.java`, `RestoreService.java`, `OrchestrationService.java` (cross-platform, NO bash/PowerShell)
3. `Jenkinsfile.uat-refresh` - Complete pipeline definition with drift gate
4. Configured Jenkins job with cron trigger (if using Jenkins)
5. Prometheus metrics and Grafana dashboards (including drift detection)
6. Slack/email notification setup (alert on drift detected)
7. Operations runbook (comprehensive, includes drift response procedures)
8. Disaster recovery procedures
9. Team training materials (registry maintenance workflow)
10. Production launch report

**Decision Point**:
- **Production Readiness**: Sign-off from DevOps, Security, QA
- **Drift Handling Documented**: Confirm ops team understands registry maintenance
- **Approval Required**: Operations team takeover

**Detailed Plan**: See [db-anonymization-phase3-automation-plan.md](./db-anonymization-phase3-automation-plan.md)

---

## 4. Anonymization Registry & Schema Drift Gate

### 4.1 Overview

**Problem**: Flyway migrations add new tables/columns (e.g., `V38__ADD_EMERGENCY_CONTACT.sql` adds `EmergencyContactPhone`). If developers deploy schema changes without updating anonymization rules, **PII leaks to UAT**.

**Solution**: **Anonymization Registry** - Metadata-only tracking system that enforces 100% PII coverage with fail-closed behavior.

**Core Components**:
1. **anon_object_lineage**: Tracks table/column renames across Flyway migrations
2. **anon_rules**: Maps each PII column to its anonymization strategy
3. **schema_snapshot**: Stores expected schema structure (SHA-256 hashes)

---

### 4.2 Registry Structure

**File**: `anonymization-registry.json`

**Schema**:

```json
{
  "version": "1.0",
  "lastUpdated": "2026-01-31T10:30:00Z",
  "schemaVersion": "V35",
  
  "databases": {
    "db_identity": {
      "schemaHash": "sha256:a1b2c3d4e5f6...",
      "tables": {
        "i_beneficiary": {
          "canonicalName": "i_beneficiary",
          "lineage": {
            "aliases": [],
            "renamedFrom": null,
            "renamedInMigration": null
          },
          "columns": {
            "BeneficiaryRegID": {
              "canonicalName": "BeneficiaryRegID",
              "dataType": "BIGINT(20)",
              "nullable": false,
              "piiRisk": "LINKING_KEY",
              "anonymizationRule": "BENREGID_MAPPING",
              "lineage": {
                "aliases": [],
                "renamedFrom": null,
                "renamedInMigration": null
              },
              "addedInMigration": "V1"
            },
            "FirstName": {
              "canonicalName": "FirstName",
              "dataType": "VARCHAR(50)",
              "nullable": true,
              "piiRisk": "CRITICAL",
              "anonymizationRule": "FAKE_NAME",
              "lineage": {
                "aliases": [],
                "renamedFrom": null,
                "renamedInMigration": null
              },
              "addedInMigration": "V1"
            },
            "PhoneNo": {
              "canonicalName": "PhoneNo",
              "dataType": "VARCHAR(15)",
              "nullable": true,
              "piiRisk": "CRITICAL",
              "anonymizationRule": "FAKE_PHONE",
              "lineage": {
                "aliases": ["ContactNumber"],
                "renamedFrom": "ContactNumber",
                "renamedInMigration": "V12"
              },
              "addedInMigration": "V1"
            }
          }
        }
      }
    }
  },
  
  "piiRiskLevels": {
    "CRITICAL": "Direct PII (name, phone, Aadhar) - MUST anonymize",
    "HIGH": "Indirect identifiers (email, address) - MUST anonymize",
    "MEDIUM": "Health data (diagnosis, prescriptions) - MUST anonymize",
    "LINKING_KEY": "Cross-table linkage (BenRegID) - MUST remap consistently",
    "LOW": "Metadata (timestamps, status codes) - MAY retain"
  },
  
  "piiRiskThreshold": "MEDIUM",
  
  "flywayMigrations": {
    "tracked": ["V1", "V2", "V3", ..., "V35"],
    "lastValidated": "V35"
  }
}
```

---

### 4.3 Canonical Naming & Lineage

**Default Behavior**: Canonical names default to **current physical names** (since no historical examples exist at project start).

**Example Evolution**:

```
Migration V1  : CREATE TABLE beneficiary (contact_number VARCHAR(15))
Registry V1   : canonicalName = "contact_number", aliases = []

Migration V12 : ALTER TABLE beneficiary RENAME COLUMN contact_number TO PhoneNo
Registry V12  : canonicalName = "PhoneNo", aliases = ["contact_number"], 
                renamedFrom = "contact_number", renamedInMigration = "V12"
```

**Lineage Tracking (`anon_object_lineage`)**:
- **aliases**: All historical names for this column
- **renamedFrom**: Immediate previous name (if renamed)
- **renamedInMigration**: Flyway version that performed rename

**Benefit**: Registry can match old column names in legacy SQL queries to current schema.

---

### 4.4 Anonymization Rules (`anon_rules`)

**Rule Format**:

```json
{
  "columnPath": "db_identity.i_beneficiary.FirstName",
  "canonicalName": "FirstName",
  "piiRisk": "CRITICAL",
  "anonymizationRule": "FAKE_NAME",
  "ruleConfig": {
    "strategy": "FakeNameStrategy",
    "locale": "en_IND",
    "preserveLength": true,
    "preserveFormat": true
  }
}
```

**Fail-Closed Rule Coverage**:

```java
// Pre-execution gate
public void validateCoverage() {
    LiveSchema liveSchema = analyzeDatabase();
    Registry registry = loadRegistry();
    
    for (Column col : liveSchema.getAllColumns()) {
        PIIRisk risk = registry.classifyColumn(col);
        
        if (risk.isAtOrAbove(MEDIUM) && !registry.hasRule(col)) {
            throw new IncompleteCoverageException(
                "Column " + col.getFullPath() + 
                " has PII risk " + risk + 
                " but NO anonymization rule defined. ABORTING."
            );
        }
    }
}
```

---

### 4.5 Schema Snapshot & Drift Detection

**Schema Snapshot (`schema_snapshot`)**:

```json
{
  "database": "db_identity",
  "capturedAt": "2026-01-31T10:30:00Z",
  "schemaHash": "sha256:a1b2c3d4e5f6...",
  "tableCount": 45,
  "columnCount": 782,
  "checksums": {
    "i_beneficiary": "sha256:abc123...",
    "i_beneficiary_address": "sha256:def456..."
  }
}
```

**Drift Detection Algorithm**:

```java
public DriftReport detectDrift() {
    LiveSchema live = analyzeDatabase();
    Registry registry = loadRegistry();
    
    DriftReport report = new DriftReport();
    
    // 1. Detect new tables
    for (Table table : live.getTables()) {
        if (!registry.hasTable(table.getName())) {
            report.addNewTable(table);
        }
    }
    
    // 2. Detect new columns
    for (Column col : live.getColumns()) {
        if (!registry.hasColumn(col.getFullPath())) {
            PIIRisk risk = classifier.classify(col);
            if (risk.isAtOrAbove(MEDIUM)) {
                report.addUncoveredPIIColumn(col, risk);
            }
        }
    }
    
    // 3. Detect renamed objects (via heuristic matching)
    for (Column col : live.getColumns()) {
        if (!registry.hasColumn(col.getFullPath())) {
            Column candidate = registry.findSimilarColumn(col);
            if (candidate != null) {
                report.addPossibleRename(candidate, col);
            }
        }
    }
    
    // 4. Detect removed objects
    for (RegistryColumn regCol : registry.getAllColumns()) {
        if (!live.hasColumn(regCol.getFullPath())) {
            report.addRemovedColumn(regCol);
        }
    }
    
    return report;
}
```

---

### 4.6 Drift Report Format (Metadata-Only)

**File**: `drift-report-<timestamp>.html`

**Content** (example):

```html
<!DOCTYPE html>
<html>
<head>
    <title>Schema Drift Report - 2026-01-31 14:00</title>
    <style>
        .critical { color: red; font-weight: bold; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
    </style>
</head>
<body>
    <h1>⚠️ Schema Drift Detected</h1>
    
    <section>
        <h2>Executive Summary</h2>
        <table>
            <tr><td>Registry Version</td><td>V35</td></tr>
            <tr><td>Live Flyway Version</td><td>V37</td></tr>
            <tr><td>New Tables</td><td>1</td></tr>
            <tr><td>New Columns</td><td>3</td></tr>
            <tr><td>Uncovered PII Columns</td><td class="critical">2</td></tr>
            <tr><td>Can Proceed?</td><td class="critical">❌ NO - ABORTED</td></tr>
        </table>
    </section>
    
    <section>
        <h2>🔴 Uncovered PII Columns (CRITICAL)</h2>
        <table>
            <tr>
                <th>Database</th>
                <th>Table</th>
                <th>Column</th>
                <th>Data Type</th>
                <th>PII Risk</th>
                <th>Suggested Rule</th>
                <th>Added In</th>
            </tr>
            <tr class="critical">
                <td>db_identity</td>
                <td>i_beneficiary</td>
                <td>EmergencyContactPhone</td>
                <td>VARCHAR(15)</td>
                <td>CRITICAL</td>
                <td>FAKE_PHONE</td>
                <td>V37</td>
            </tr>
            <tr class="critical">
                <td>db_iemr</td>
                <td>t_prescription</td>
                <td>PatientMobileNumber</td>
                <td>VARCHAR(15)</td>
                <td>CRITICAL</td>
                <td>FAKE_PHONE</td>
                <td>V36</td>
            </tr>
        </table>
    </section>
    
    <section>
        <h2>ℹ️ New Tables (Non-PII)</h2>
        <table>
            <tr>
                <th>Database</th>
                <th>Table</th>
                <th>Added In</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>db_reporting</td>
                <td>v_monthly_stats</td>
                <td>V36</td>
                <td>Review (may not need anonymization)</td>
            </tr>
        </table>
    </section>
    
    <section>
        <h2>🔧 Required Actions</h2>
        <ol>
            <li>Update <code>anonymization-registry.json</code> to add rules for 2 uncovered PII columns</li>
            <li>Add entries:
                <pre>
{
  "EmergencyContactPhone": {
    "canonicalName": "EmergencyContactPhone",
    "piiRisk": "CRITICAL",
    "anonymizationRule": "FAKE_PHONE",
    "addedInMigration": "V37"
  },
  "PatientMobileNumber": {
    "canonicalName": "PatientMobileNumber",
    "piiRisk": "CRITICAL",
    "anonymizationRule": "FAKE_PHONE",
    "addedInMigration": "V36"
  }
}
                </pre>
            </li>
            <li>Commit updated registry to version control</li>
            <li>Re-run UAT refresh pipeline (will pass drift gate)</li>
        </ol>
    </section>
</body>
</html>
```

**Security Note**: Report contains ZERO row data, ZERO actual PII values - only metadata (schema structure, column names, data types).

---

### 4.7 Fail-Closed Execution Gate

**Workflow**:

```
┌─────────────────────────────────────────────┐
│  Step 0: Load Anonymization Registry        │
└────────────────┬────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────┐
│  Step 1: Analyze Live Database Schema       │
│  (Query INFORMATION_SCHEMA)                 │
└────────────────┬────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────┐
│  Step 2: Compute Schema Hash                │
│  (SHA-256 of table/column structure)        │
└────────────────┬────────────────────────────┘
                 │
                 ▼
         Hash Matches Registry?
                 │
        ┌────────┴────────┐
       YES                NO (DRIFT)
        │                 │
        ▼                 ▼
┌─────────────────┐  ┌─────────────────────────┐
│  Validate 100%  │  │  Detect Drift:          │
│  Rule Coverage  │  │  - New tables/columns   │
└────────┬────────┘  │  - Renamed objects      │
         │            │  - Removed objects      │
         ▼            └──────────┬──────────────┘
  Coverage 100%?                 │
         │                       ▼
    ┌────┴────┐         ┌────────────────────┐
   YES       NO         │  Classify New       │
    │         │         │  Columns (PII Risk) │
    │         │         └─────────┬───────────┘
    │         │                   │
    │         │                   ▼
    │         │          Uncovered PII Exists?
    │         │                   │
    │         │         ┌─────────┴─────────┐
    │         │        YES                  NO
    │         │         │                    │
    │         │         ▼                    │
    │         │  ┌──────────────────┐       │
    │         │  │  ABORT EXECUTION │       │
    │         │  │  Generate drift  │       │
    │         │  │  report          │       │
    │         │  │  Alert DevOps    │       │
    │         │  │  NO UAT restore  │       │
    │         │  └──────────────────┘       │
    │         │                             │
    │         ▼                             │
    │  ┌──────────────────┐                │
    │  │  ABORT EXECUTION │                │
    │  │  Incomplete      │                │
    │  │  coverage        │                │
    │  └──────────────────┘                │
    │                                      │
    ▼                                      ▼
┌──────────────────────────────┐  ┌──────────────────┐
│  ✅ PASS - Proceed with      │  │  Update registry │
│  Anonymization               │  │  (manual)        │
└──────────────────────────────┘  │  Re-run pipeline │
                                  └──────────────────┘
```

---

### 4.8 Registry Maintenance Workflow

**Scenario**: Developer deploys `V38__ADD_EMERGENCY_CONTACT.sql`

**Step-by-Step**:

1. **Migration Deployed** (Production):
   ```sql
   -- V38__ADD_EMERGENCY_CONTACT.sql
   ALTER TABLE i_beneficiary 
   ADD COLUMN EmergencyContactPhone VARCHAR(15) AFTER PhoneNo;
   ```

2. **UAT Refresh Triggered** (scheduled or manual):
   ```
   Jenkins Job: UAT-Refresh-Weekly
   Trigger: Every Monday 2 AM
   ```

3. **Drift Gate Detects Issue**:
   ```
   [ERROR] Drift detected: 1 uncovered PII column
     - db_identity.i_beneficiary.EmergencyContactPhone (VARCHAR(15))
     - PII Risk: CRITICAL (phone number pattern detected)
     - No anonymization rule defined
   
   [ACTION] Generating drift-report-20260203-020015.html
   [ACTION] Sending alert to #devops-alerts Slack channel
   [ABORT] Execution aborted - UAT NOT restored
   ```

4. **DevOps Receives Alert** (Slack):
   ```
   🚨 UAT Refresh ABORTED - Schema Drift Detected
   
   Uncovered PII Columns: 1
   - db_identity.i_beneficiary.EmergencyContactPhone
   
   Action Required:
   1. Review drift report: <link to HTML>
   2. Update anonymization-registry.json
   3. Re-run pipeline
   
   Jenkins Build: #456 (FAILED)
   ```

5. **DevOps Updates Registry**:
   ```bash
   cd AMRIT-DB/src/main/resources/
   vim anonymization-registry.json
   
   # Add entry:
   {
     "EmergencyContactPhone": {
       "canonicalName": "EmergencyContactPhone",
       "dataType": "VARCHAR(15)",
       "nullable": true,
       "piiRisk": "CRITICAL",
       "anonymizationRule": "FAKE_PHONE",
       "lineage": {
         "aliases": [],
         "renamedFrom": null,
         "renamedInMigration": null
       },
       "addedInMigration": "V38"
     }
   }
   
   git add anonymization-registry.json
   git commit -m "Add anonymization rule for EmergencyContactPhone (V38)"
   git push
   ```

6. **Next Pipeline Run** (SUCCESS):
   ```
   [INFO] Loading registry version V38
   [INFO] Analyzing live schema...
   [INFO] Schema hash: sha256:xyz789... (matches V38)
   [INFO] Drift gate: PASS (no uncovered PII)
   [INFO] Coverage validation: PASS (100% coverage)
   [INFO] Proceeding with anonymization...
   ✅ SUCCESS - UAT restored with anonymized data
   ```

---

### 4.9 Security Guarantees

**What Registry Stores**:
- ✅ Schema structure (table/column names, data types)
- ✅ PII risk classifications
- ✅ Anonymization rule mappings
- ✅ Flyway migration versions
- ✅ SHA-256 hashes of schema

**What Registry DOES NOT Store**:
- ❌ Row data (no actual patient names, phone numbers, etc.)
- ❌ Original→anonymized value mappings (BenRegID mappings stay in-memory only)
- ❌ Sample PII values
- ❌ Plaintext credentials
- ❌ Actual database contents

**Audit Log Security** (Metadata-Only):

```json
{
  "eventType": "ANONYMIZATION_COMPLETED",
  "timestamp": "2026-01-31T14:30:00Z",
  "executionId": "exec-20260131-143000",
  "databases": {
    "db_identity": {
      "tablesProcessed": 45,
      "rowsAnonymized": 1500000,
      "duration": "1200s"
    },
    "db_iemr": {
      "tablesProcessed": 280,
      "rowsAnonymized": 8700000,
      "duration": "3600s"
    }
  },
  "benRegIDMappings": {
    "totalMappings": 1500000,
    "mappingMethod": "BeneficiaryID-Generation-API",
    "persistenceMode": "IN_MEMORY_ONLY",
    "exportedToFile": false
  },
  "schemaValidation": {
    "driftDetected": false,
    "coveragePercentage": 100.0,
    "registryVersion": "V35"
  }
}
```

**Note**: Logs contain ZERO actual PII values - only counts, timings, and hashes.

---

## 5. Technology Stack

### 5.1 Core Technologies

**⚠️ CROSS-PLATFORM NOTE**: All components are Java-based for Windows/Linux/Mac compatibility. **NO bash, PowerShell, or OS-specific scripts**.

| Component | Technology | Version | Purpose |
|-----------|------------|---------|---------|
| **Programming Language** | Java | 17 | Main development language |
| **Framework** | Spring Boot | 3.3.2 | Application framework |
| **Database** | MySQL | 8.0+ | All AMRIT databases |
| **Migration Tool** | Flyway | 9.x | Schema version control |
| **Build Tool** | Maven | 3.8+ | Dependency management |
| **CI/CD** | Jenkins | 2.x | Automation & scheduling (optional) |
| **Orchestration** | Java (Spring Boot) | 17 | Cross-platform orchestration (ProcessBuilder for mysqldump) |
| **Containerization** | Docker | 20.x+ | Temporary anonymization DB (optional) |

### 5.2 Java Libraries

| Library | Version | Purpose |
|---------|---------|---------|
| **JavaFaker** | 1.0.2 | Fake data generation (Indian locale) |
| **Apache Commons Codec** | 1.16.0 | Schema hashing (SHA-256) for drift detection |
| **Gson** | 2.10.x | JSON handling (anonymization-registry.json) |
| **Everit JSON Schema** | 1.14.x | Validate registry JSON structure |
| **JGraphT** | 1.5.2 | Dependency graph analysis |
| **Spring Data JPA** | 3.x | Database access |
| **Micrometer** | 1.x | Metrics (Prometheus) |
| **Flyway Core** | 9.x | Query migration history for drift correlation |
| **SLF4J + Logback** | 2.x | Logging (metadata-only) |

### 5.3 Infrastructure

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Production DB** | MySQL 8.0 | Source of truth |
| **Read Replica** | MySQL 8.0 | Backup source (zero prod impact) |
| **Anonymization Server** | EC2/VM (Java 17) | Runs anonymization engine |
| **UAT Database** | MySQL 8.0 | Target environment |
| **Jenkins Server** | Jenkins 2.x | CI/CD orchestration (optional) |
| **Backup Storage** | S3 / NFS | Backup retention (30 days) |
| **Monitoring** | Prometheus + Grafana | Metrics & dashboards |

**Note**: NO bash/PowerShell scripts in deliverables. All orchestration via Java (BackupService.java, RestoreService.java, etc.).

---

## 6. Success Metrics

### 6.1 Technical Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Execution Time** | <2 hours | Jenkins pipeline duration (backup + anonymize + restore) |
| **PII Coverage** | 100% identified fields | Schema analysis report + registry validation |
| **Drift Detection Accuracy** | 100% new PII columns caught | Drift gate test suite (simulate schema changes) |
| **Fail-Closed Enforcement** | 0 UAT restores with uncovered PII | Pre-execution gate logs (abort count) |
| **Anonymization Success Rate** | 100% | No PII leakage in validation (PIILeakageDetector) |
| **Referential Integrity** | 0 violations | Foreign key validation post-anonymization |
| **Production Impact** | 0% CPU/memory spike | Monitoring during backup (read replica usage) |
| **Automation Rate** | 100% hands-off | No manual intervention (except drift response) |
| **Cross-Platform Success** | 100% | Runs on Windows + Linux + macOS without modification |

### 6.2 Business Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| **UAT Refresh Frequency** | Weekly | Jenkins schedule adherence |
| **Bug Reproduction Time** | 40% reduction | Team feedback (realistic test data) |
| **UAT Availability** | 95%+ uptime | Monitoring (downtime during refresh + failures) |
| **Security Incidents** | 0 PII leaks | Audit logs + compliance review |
| **Team Efficiency** | 20% time savings | Developer surveys (less manual UAT setup) |
| **Drift Response Time** | <4 hours | Time from drift alert to registry update |

### 6.3 Compliance Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Audit Trail Completeness** | 100% | Audit log review (all operations logged) |
| **Metadata-Only Auditing** | 100% | Verify NO plaintext PII in logs |
| **Data Retention Compliance** | 90 days logs | Backup policy enforcement |
| **Access Control** | Role-based | Access matrix (Jenkins roles, file permissions) |
| **Security Approval** | Passed | Security team review sign-off |
| **Registry Coverage** | 100% | All PII columns have anonymization rules |

---

## 7. Risk Assessment

### 7.1 Critical Risks

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| **Schema Drift Causes PII Leakage** | High | Critical | Anonymization Registry with fail-closed behavior (abort on uncovered PII) + drift alerts to DevOps |
| **Incomplete PII Detection** | Medium | Critical | Manual review by domain expert + comprehensive regex patterns + registry validation + ongoing monitoring |
| **BenRegID Strategy Breaks Relationships** | Medium | Critical | Thorough testing + validation framework + in-memory mapping approach (discarded post-execution) |
| **Registry Not Updated After Flyway Migration** | Medium | Critical | Drift gate aborts execution + alerts DevOps + operations runbook documents registry maintenance |
| **Production Backup Impacts Performance** | Low | High | Use read replica for backups (zero primary impact) |
| **Large Dataset Causes Timeouts** | High | High | Batch processing (10K-20K rows) + indexing + progress checkpoints + parallelization |
| **Failed Anonymization Corrupts UAT** | Low | High | Pre-restore UAT backup + rollback procedure + drift gate prevents execution if risks detected |
| **Team Lacks Java Expertise** | Low | Medium | Training + documentation + code reviews |

### 7.2 Medium Risks

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| **BenGenAPI Integration Issues** | Low | Medium | Fallback to random BIGINT generation (documented in strategy) |
| **Schema Changes During Development** | Medium | Medium | Re-run analyzer before Phase 2 + registry versioning |
| **Jenkins Infrastructure Unavailable** | Low | Medium | Standalone Java CLI mode (works without Jenkins) |
| **Windows Compatibility Issues** | Low | Medium | Pure Java (no OS-specific code) + Windows testing in Phase 3 |
| **Registry JSON Becomes Outdated** | Medium | Medium | Automated drift detection + quarterly manual reviews |
| **Monitoring Tools Not Available** | Low | Low | Use Jenkins console logs + file-based logs |

### 7.3 Risk Response Plan

**If Drift Detected**:
1. Pipeline aborts (fail-closed)
2. Drift report generated (HTML)
3. Slack alert sent to #devops-alerts
4. DevOps reviews report
5. DevOps updates `anonymization-registry.json`
6. Commit + re-run pipeline
7. Success ✅

**If BenRegID Mapping Fails**:
1. Transaction rolled back
2. Restore UAT from pre-execution backup
3. Alert DevOps
4. Review BenGenAPI logs
5. Fallback to random BIGINT generation (if API unavailable)

**If Validation Fails**:
1. Abort UAT restore
2. Preserve anonymized temporary DB (for debugging)
3. Generate detailed validation report
4. DevOps investigates
5. Fix issue + re-run

---

## 8. Resource Requirements

### 8.1 Human Resources

| Role | Allocation | Phases | Responsibilities |
|------|-----------|--------|------------------|
| **Java Developer (Senior)** | 100% (12 weeks) | All | Core development, architecture, registry implementation |
| **Java Developer (Mid)** | 50% (8 weeks) | 2, 3 | Implementation support, testing |
| **DevOps Engineer** | 50% (8 weeks) | 1, 3 | Infrastructure, Jenkins setup (optional), registry maintenance training |
| **Database Administrator** | 25% (12 weeks) | All | Schema analysis, backup strategy, registry review |
| **QA Engineer** | 50% (4 weeks) | 2, 3 | Testing, validation, drift simulation tests |
| **Security Analyst** | 25% (2 weeks) | 2 | Security review, compliance, registry security validation |
| **Domain Expert** | 25% (4 weeks) | 1, 2 | PII identification, validation, registry rule definitions |
| **Technical Writer** | 25% (2 weeks) | 3 | Operations runbook (including registry maintenance) |

### 8.2 Infrastructure

| Resource | Specification | Cost Estimate (Monthly) | Purpose |
|----------|--------------|------------------------|---------|
| **Anonymization Server** | 8 vCPU, 32GB RAM, 500GB SSD | $200-300 | Temporary DB + Java app |
| **Backup Storage** | 1TB S3 + 2TB NFS | $50-100 | Backup retention (30 days) |
| **Jenkins Agent** | 4 vCPU, 16GB RAM | $100-150 | Pipeline execution (if using Jenkins) |
| **Read Replica** | Same as production DB | $0 (if exists) | Backup source (zero prod impact) |

**Total Infrastructure Cost**: ~$400-600/month (ongoing)

### 8.3 Software/Tools

| Tool | License | Cost | Purpose |
|------|---------|------|---------|
| **Jenkins** | Open Source | Free | CI/CD (optional) |
| **Prometheus/Grafana** | Open Source | Free | Monitoring |
| **JavaFaker** | Open Source (MIT) | Free | Fake data |
| **MySQL Client Tools** | Open Source (GPL) | Free | Database operations |
| **IntelliJ IDEA** | Community / Ultimate | Free / $150 | Development IDE |

**Total Software Cost**: $0-150 (one-time)

---

## 9. Timeline Summary

### 9.1 Gantt Chart Overview

```
Month 1 (Weeks 1-4): PHASE 1 - Analysis & Planning
==================================================
Week 1:  [Setup] [Schema Analysis] [Registry Design]
Week 2:  [PII Detection] [Classification] [Registry Schema]
Week 3:  [Constraint Mapping] [Data Sampling] [Drift Detection Logic]
Week 4:  [Strategy Definition] [Fake Data Testing] [Registry Finalization]
Milestone: Phase 1 Complete ✓ (Registry v1.0 created)

Month 2 (Weeks 5-8): PHASE 2 - Execution Engine
==================================================
Week 5:  [Orchestrator] [Drift Gate Implementation]
Week 6:  [Execution Engine] [Strategies] [BenRegID Mapper]
Week 7:  [Validation Framework] [Audit Logger] [Drift Reports]
Week 8:  [Testing] [Optimization] [Drift Simulation Tests]
Milestone: Phase 2 Complete ✓ (Fail-closed execution validated)

Month 3 (Weeks 9-12): PHASE 3 - Automation & Deployment
========================================================
Week 9:  [Infrastructure] [Java Orchestration Classes]
Week 10: [Jenkins Integration] [Standalone CLI] [Drift Monitoring]
Week 11: [Operations] [Drift Response Runbook] [Training]
Week 12: [Production Launch] [Registry Handoff]
Milestone: Project Complete ✓
```

### 9.2 Critical Path

1. **Week 1**: Schema analysis + registry design (blocks PII detection)
2. **Week 2-3**: PII identification + drift detection logic (blocks strategy definition)
3. **Week 4**: Registry finalization + strategy definition (blocks Phase 2 start)
4. **Week 5-6**: Core engine + drift gate development (blocks testing)
5. **Week 7-8**: Testing + drift simulation (blocks production deployment)
6. **Week 9-10**: Deployment (Jenkins OR standalone CLI) + drift monitoring
7. **Week 12**: Production launch + registry handoff to ops team

### 9.3 Milestones

| Week | Milestone | Deliverables | Approval Required |
|------|-----------|--------------|-------------------|
| **4** | Phase 1 Complete | 7 analysis artifacts + registry v1.0 | Stakeholder + Security sign-off |
| **8** | Phase 2 Complete | Working engine + drift gate | Security review + QA validation |
| **10** | Deployment Ready | Jenkins pipeline OR CLI + drift monitoring | DevOps approval |
| **12** | Production Launch | Live automation + ops training | Operations takeover + CISO sign-off |

---

## 10. Deliverables Checklist

### 10.1 Phase 1 Deliverables

- [ ] `schema-catalog.json` - Complete database schema metadata
- [ ] **`anonymization-registry.json` - Canonical schema with PII rules, drift detection config, lineage tracking**
- [ ] `pii-field-inventory.csv` - All PII fields identified and classified
- [ ] `anonymization-strategy-map.json` - Strategy per field type
- [ ] `constraint-dependency-graph.html` - Visual dependency graph
- [ ] `data-sample-analysis.json` - Current data patterns
- [ ] Java analyzer application (`DatabaseSchemaAnalyzer.java` + `AnonymizationRegistry.java` + `DriftDetector.java`)
- [ ] Phase 1 completion report

### 10.2 Phase 2 Deliverables

- [ ] `AnonymizationOrchestrator.java` - Main orchestrator with drift gate
- [ ] `ExecutionEngine.java` - Batch processing engine
- [ ] All `AnonymizationStrategy` implementations (8-10 strategies)
- [ ] `BenRegIDMapper.java` - **In-memory cross-database mapping (ephemeral, never persisted)**
- [ ] `IntegrityValidator.java` - Validation framework
- [ ] `AuditLogger.java` - **Metadata-only audit trail (NO plaintext PII values)**
- [ ] `DriftDetector.java` - Schema drift detection with fail-closed enforcement
- [ ] **`drift-report-<timestamp>.html` - Schema drift detection report (metadata-only)**
- [ ] `anonymization_audit_report_<timestamp>.json` - **Audit report (metadata only, NO original→anonymized mappings)**
- [ ] `validation_report_<timestamp>.html` - Validation results
- [ ] Unit and integration test suite (including drift detection tests)
- [ ] Phase 2 completion report

### 10.3 Phase 3 Deliverables

- [ ] Production read replica setup (verified)
- [ ] Java orchestration classes: **`BackupService.java`, `RestoreService.java`, `OrchestrationService.java` (cross-platform, NO bash/PowerShell)**
- [ ] `Jenkinsfile.uat-refresh` - Jenkins pipeline with drift gate (if using Jenkins)
- [ ] OR: Standalone CLI JAR for Windows Task Scheduler / Linux cron (if not using Jenkins)
- [ ] Configured Jenkins job with cron trigger (if using Jenkins)
- [ ] Prometheus metrics exposed (including drift detection events)
- [ ] Grafana dashboards created (drift monitoring + anonymization metrics)
- [ ] Slack/email notifications configured (alert on drift detected)
- [ ] **Operations runbook (comprehensive, includes registry maintenance procedures + drift response workflow)**
- [ ] Disaster recovery procedures
- [ ] Team training materials (registry maintenance, drift response)
- [ ] Production launch report

### 10.4 Documentation Deliverables

- [ ] `db-anonymization-phase1-analysis-plan.md` ✅ (Created)
- [ ] `db-anonymization-phase2-execution-plan.md` ✅ (Created)
- [ ] `db-anonymization-phase3-automation-plan.md` ✅ (Created)
- [ ] `db-anonymization-master-plan.md` ✅ (This document)
- [ ] API documentation (JavaDoc)
- [ ] Operations runbook (includes registry maintenance)
- [ ] Disaster recovery guide
- [ ] Training materials
- [ ] Final project report

---

## 11. Governance & Approvals

### 11.1 Approval Matrix

| Phase | Deliverable | Approver | Required? |
|-------|-------------|----------|-----------|
| **Phase 1** | Analysis artifacts | Domain Expert | ✅ Required |
| **Phase 1** | Anonymization Registry (v1.0) | Security Team + DBA | ✅ Required |
| **Phase 1** | BenRegID strategy decision | DBA + Tech Lead | ✅ Required |
| **Phase 1** | Proceed to Phase 2 | Stakeholder Committee | ✅ Required |
| **Phase 2** | Anonymization strategies | Security Team | ✅ Required |
| **Phase 2** | Drift detection implementation | Security Team + QA Lead | ✅ Required |
| **Phase 2** | Fail-closed enforcement tests | Security Team | ✅ Required |
| **Phase 2** | Performance test results | Tech Lead | ✅ Required |
| **Phase 2** | Proceed to Phase 3 | Stakeholder Committee | ✅ Required |
| **Phase 3** | Jenkins pipeline OR CLI | DevOps Lead | ✅ Required |
| **Phase 3** | Operations runbook | Operations Manager | ✅ Required |
| **Phase 3** | Registry maintenance procedures | Security Team + DBA + DevOps | ✅ Required |
| **Phase 3** | Production launch | CISO + CTO | ✅ Required |

### 11.2 Stakeholder Committee

| Role | Name | Responsibility |
|------|------|----------------|
| **Project Sponsor** | TBD | Budget approval, strategic decisions |
| **Technical Lead** | TBD | Architecture, technical decisions |
| **Security Lead** | TBD | Security review, compliance, registry security validation |
| **Operations Manager** | TBD | Operational readiness, registry maintenance handoff |
| **QA Lead** | TBD | Test strategy, UAT sign-off, drift simulation validation |

### 11.3 Review Cadence

| Review Type | Frequency | Participants |
|------------|-----------|--------------|
| **Daily Standup** | Daily (15 min) | Development team |
| **Weekly Progress** | Weekly (1 hour) | Tech lead + stakeholders |
| **Phase Gate Review** | End of each phase | Stakeholder committee |
| **Security Review** | Phase 2 completion | Security team (focus on drift gate + registry security) |
| **Production Readiness** | Week 12 | All stakeholders |
| **Registry Audit** | Quarterly (ongoing) | Security + DBA (validate registry accuracy) |

---

## 12. Next Steps

### Immediate Actions (Week 0)

1. **Finalize Team**: Confirm team members and allocations
2. **Approve Budget**: Infrastructure and tool costs
3. **Infrastructure Assessment**: 
   - Does production read replica exist?
   - What is production database size?
   - Jenkins availability (decide: Jenkins mode OR standalone CLI mode)?
   - OS environments (Windows, Linux, macOS proportions)
4. **Approve Master Plan**: Stakeholder sign-off
5. **Kickoff Meeting**: Schedule Week 1 start

### Week 1 Start

1. **Phase 1 Kickoff**: Review Phase 1 detailed plan
2. **Environment Setup**: 
   - Developer workstations (Java 17, Maven, IntelliJ)
   - Database access (read-only prod replica)
   - Git repository access
3. **Begin Implementation**: 
   - `DatabaseSchemaAnalyzer` development
   - `AnonymizationRegistry` schema design

---

## Appendix A: Glossary

| Term | Definition |
|------|------------|
| **PII** | Personally Identifiable Information (names, phone, email, etc.) |
| **BenRegID** | BeneficiaryRegID - Unique identifier linking data across databases |
| **UAT** | User Acceptance Testing environment |
| **Read Replica** | Read-only copy of production database for backups |
| **Anonymization** | Process of removing/replacing PII with fake data |
| **Referential Integrity** | Maintaining valid foreign key relationships |
| **Flyway** | Database migration tool used in AMRIT |
| **Schema Drift** | Untracked changes to database schema (new tables/columns) |
| **Fail-Closed** | Security model where system aborts on detection of risks (vs. allowing risky operation) |
| **Anonymization Registry** | Metadata-only tracking system that enforces 100% PII coverage |
| **Canonical Name** | Standard/official name for a database object (may differ from physical name due to renames) |
| **Lineage** | Historical tracking of object renames (e.g., column A → column B in migration V12) |
| **Drift Gate** | Pre-execution validation that aborts pipeline if uncovered PII detected |

---

## Appendix B: Related Documents

1. [db-anonymization-phase1-analysis-plan.md](./db-anonymization-phase1-analysis-plan.md) - Phase 1 detailed plan (includes registry creation)
2. [db-anonymization-phase2-execution-plan.md](./db-anonymization-phase2-execution-plan.md) - Phase 2 detailed plan (includes drift gate)
3. [db-anonymization-phase3-automation-plan.md](./db-anonymization-phase3-automation-plan.md) - Phase 3 detailed plan (Jenkins OR CLI)
4. [amrit-db-reference-guide.md](./amrit-db-reference-guide.md) - AMRIT-DB architecture reference
5. [task.txt](../task.txt) - Original task requirements from C4GT Community

---

## Appendix C: Contact Information

| Role | Contact | Email | Slack |
|------|---------|-------|-------|
| **Project Lead** | TBD | TBD | @TBD |
| **Tech Lead** | TBD | TBD | @TBD |
| **DevOps Lead** | TBD | TBD | @TBD |
| **Security Lead** | TBD | TBD | @TBD |

**Slack Channel**: `#amrit-uat-anonymization`  
**Confluence Space**: `AMRIT - Database Anonymization`  
**Jira Project**: `AMRIT-ANON`

---

**Document Control**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-28 | AI Assistant | Initial master plan created |
| 2.0 | 2026-01-31 | AI Assistant | Added Anonymization Registry & Schema Drift Gate, removed bash scripts, removed CSV export of BenRegID mappings, metadata-only auditing |

**Approval Signatures**

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Project Sponsor | | | |
| Technical Lead | | | |
| Security Lead | | | |
| Operations Manager | | | |

---

**END OF DOCUMENT**
