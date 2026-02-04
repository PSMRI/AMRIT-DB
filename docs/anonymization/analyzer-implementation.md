# AMRIT Anonymization Phase 1: Analysis & Registry Bootstrapping

**Version:** 1.0  
**Status:** Implementation Complete  
**Last Updated:** February 1, 2026

---

## Overview

Phase 1 implements **schema analysis and PII detection** for the AMRIT database anonymization project. This phase performs **metadata-only** analysis across all 4 AMRIT databases to:

1. Extract complete database schema metadata
2. Detect PII-risk fields using configurable YAML rules
3. Generate the **Anonymization Registry** with canonical naming and schema hashes
4. Export Phase 1 artifacts for review and Phase 2 preparation

**Critical:** Phase 1 does NOT modify any data - it only reads schema metadata.

---

## Architecture

### Package Structure

```
src/main/java/com/db/piramalswasthya/anonymization/phase1/
├── model/               # POJOs for schema, PII, registry
│   ├── PIICategory.java
│   ├── RiskLevel.java
│   ├── ColumnMetadata.java
│   ├── TableMetadata.java
│   ├── DatabaseMetadata.java
│   ├── SchemaCatalog.java
│   ├── PIIDetectionRule.java
│   └── AnonymizationRegistry.java
├── scan/                # Schema extraction
│   └── DatabaseSchemaAnalyzer.java
├── detect/              # PII detection
│   └── PIIDetector.java
├── registry/            # Registry generation
│   ├── RegistryGenerator.java
│   └── SchemaHasher.java
├── export/              # Artifact exporters
│   └── ArtifactExporter.java
└── cli/                 # CLI runner
    └── AnalyzerRunner.java
```

### Configuration

**PII Detection Rules:** `src/main/resources/anonymization/pii-detection-rules.yml`  
**Analyzer Profile:** `src/main/resources/application-analyzer.properties`

---

## Running Phase 1 Analysis

### Prerequisites

1. **Database Access:** Ensure you have read-only credentials for all 4 databases:
   - `db_identity`
   - `db_1097_identity`
   - `db_iemr`
   - `db_reporting`

2. **Environment Configuration:** Set database connection properties in environment variables:

```bash
# Windows PowerShell
$env:DB_IDENTITY_URL="jdbc:mysql://localhost:3306/db_identity"
$env:DB_IDENTITY_USER="readonly_user"
$env:DB_IDENTITY_PASSWORD="your_password"

$env:DB_1097_IDENTITY_URL="jdbc:mysql://localhost:3306/db_1097_identity"
$env:DB_1097_IDENTITY_USER="readonly_user"
$env:DB_1097_IDENTITY_PASSWORD="your_password"

$env:DB_IEMR_URL="jdbc:mysql://localhost:3306/db_iemr"
$env:DB_IEMR_USER="readonly_user"
$env:DB_IEMR_PASSWORD="your_password"

$env:DB_REPORTING_URL="jdbc:mysql://localhost:3306/db_reporting"
$env:DB_REPORTING_USER="readonly_user"
$env:DB_REPORTING_PASSWORD="your_password"
```

Or update `src/main/resources/application.properties` (DO NOT commit credentials).

### Run Analysis

**Option 1: Using Maven (Recommended)**

```bash
# Run analyzer with all databases
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer

# Run with specific databases only
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -Dspring-boot.run.arguments="--dbs=db_identity,db_iemr"

# Custom output directory
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -Dspring-boot.run.arguments="--output-dir=build/analysis-results"

# Specify Flyway version for registry
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -Dspring-boot.run.arguments="--flyway-version=V35"
```

**Option 2: Using JAR (After Build)**

```bash
# Build JAR
./mvnw clean package -DskipTests

# Run analyzer
java -jar target/Amrit-DB-1.0.0.war --spring.profiles.active=analyzer
```

### CLI Options

| Option | Description | Default |
|--------|-------------|---------|
| `--dbs=<list>` | Comma-separated database names to analyze | All 4 databases |
| `--output-dir=<path>` | Output directory for artifacts | `docs/phase1-outputs` |
| `--flyway-version=<version>` | Current Flyway schema version | `UNKNOWN` |
| `--skip-export` | Skip artifact export (analysis only) | false |

---

## Generated Artifacts

Phase 1 generates **6 artifacts** in the output directory (default: `docs/phase1-outputs`):

### 1. schema-catalog.json

Complete metadata catalog of all analyzed databases, tables, columns, constraints, and indexes.

**Usage:** Input for Phase 2 anonymization execution.

**Sample:**
```json
{
  "version": "1.0",
  "generatedAt": "2026-02-01T10:30:00Z",
  "toolVersion": "1.0.0-PHASE1",
  "databases": [
    {
      "databaseName": "db_identity",
      "tables": [
        {
          "name": "i_beneficiary",
          "columns": [
            {
              "name": "BeneficiaryRegID",
              "dataType": "BIGINT(20)",
              "piiCategory": "LINKING_KEY",
              "riskLevel": "LINKING_KEY"
            }
          ]
        }
      ]
    }
  ]
}
```

### 2. pii-field-inventory.csv

CSV export of all PII-risk fields for final manual review. This is a safety net for any unprompted edge cases which may arise at any stage in the future.

**Usage:** Review PII classifications, share with security team.

**Columns:**
- Database, Table, Column, DataType
- PIICategory, RiskLevel, Rationale
- ProposedRule, Nullable, PrimaryKey, UniqueConstraint

### 3. anonymization-strategy-map.json

Maps each PII field to a proposed anonymization strategy.

**Usage:** Phase 2 execution planning, strategy validation.

### 4. anonymization-registry.json ⭐ **PRIMARY DELIVERABLE**

The metadata-only registry with:
- Canonical naming for all database objects
- Schema hashes (SHA-256) for drift detection
- PII risk classifications
- Anonymization rule bindings

**Usage:** 
- Phase 2/3 will fail-closed if schema drifts from this registry
- Manual updates required when schema changes
- Version-controlled single source of truth

**Sample:**
```json
{
  "version": "1.0",
  "schemaVersion": "V35",
  "databases": {
    "db_identity": {
      "schemaHash": "sha256:a1b2c3d4...",
      "tables": {
        "i_beneficiary": {
          "canonicalName": "i_beneficiary",
          "columns": {
            "FirstName": {
              "canonicalName": "FirstName",
              "dataType": "VARCHAR(50)",
              "piiRisk": "CRITICAL",
              "anonymizationRule": "FAKE_FIRST_NAME"
            }
          }
        }
      }
    }
  }
}
```

### 5. constraint-dependency-graph.html

Visual HTML representation of foreign key relationships across databases.

**Usage:** Understanding cross-database dependencies (e.g., BenRegID linking).

### 6. pii-coverage-report.json

Validation report showing PII coverage percentage.

**Usage:** Ensure 100% PII fields have assigned rules before Phase 2.

---

## PII Detection Rules

PII detection is driven by `pii-detection-rules.yml` with 40+ pre-configured patterns.

### Rule Structure

```yaml
rules:
  - ruleId: AADHAAR
    columnNamePattern: ".*[Aa]adh?ar.*|^AadharNo$"
    tableNamePattern: ".*"
    dataTypePattern: "VARCHAR.*|BIGINT.*"
    piiCategory: GOVERNMENT_ID
    riskLevel: CRITICAL
    suggestedRuleId: FAKE_AADHAAR
    rationale: "Government-issued unique ID"
    priority: 95
```

### PII Categories

| Category | Description | Examples |
|----------|-------------|----------|
| `LINKING_KEY` | Cross-DB linking keys | BeneficiaryRegID |
| `PERSONAL_IDENTIFIER` | Names, guardian names | FirstName, LastName, FatherName |
| `CONTACT` | Contact info | Phone, Email, Address, PIN |
| `GOVERNMENT_ID` | Gov IDs | Aadhaar, PAN, Voter ID |
| `HEALTH_IDENTIFIER` | Health IDs | HealthID, ABHA, MRN |
| `BIOMETRIC` | Biometric data | Fingerprint, Face embedding |
| `MEDICAL_CONDITION` | Health data | Diagnosis, Symptoms |
| `FREE_TEXT_PII_RISK` | Free-text fields | Notes, Comments |
| `DEMOGRAPHIC` | Demographics | Age, Gender |
| `METADATA` | System metadata | Timestamps, IP |
| `UNKNOWN` | Requires review | - |

### Risk Levels

| Level | Priority | Description |
|-------|----------|-------------|
| `CRITICAL` | 5 | Direct PII - MUST anonymize |
| `HIGH` | 4 | Indirect identifiers - MUST anonymize |
| `MEDIUM` | 3 | Health/sensitive data - SHOULD anonymize |
| `LOW` | 2 | MAY retain for analytics |
| `LINKING_KEY` | 5 | Special handling - preserve relationships |
| `NONE` | 0 | Non-sensitive |

### Customizing Rules

Edit `src/main/resources/anonymization/pii-detection-rules.yml`:

1. Add new rules with higher priority (evaluated first)
2. Adjust regex patterns for your schema naming conventions
3. Test with `--dbs=db_identity` before full analysis

---

## Output Review Checklist

After running Phase 1:

- [ ] **Review `pii-coverage-report.json`:** Ensure coverage percentage is 100%
- [ ] **Review `pii-field-inventory.csv`:** Validate PII classifications are correct
- [ ] **Review Unknown Classifications:** Check for `PIICategory: UNKNOWN` entries
- [ ] **Review Linking Keys:** Ensure `BeneficiaryRegID` is classified as `LINKING_KEY`
- [ ] **Review Free-Text Fields:** Ensure notes/comment fields are flagged as `FREE_TEXT_PII_RISK`
- [ ] **Commit Registry:** Add `anonymization-registry.json` to version control
- [ ] **Security Sign-Off:** Get approval from security team before Phase 2

---

## Common Issues & Troubleshooting

### Issue: "Failed to connect to database"

**Cause:** Database credentials not configured or network access blocked.

**Solution:**
1. Verify credentials in environment variables or `application.properties`
2. Test connection: `mysql -h <host> -u <user> -p <database>`
3. Check firewall rules if connecting to remote database

### Issue: "No rules matched - requires manual review"

**Cause:** Column name doesn't match any YAML pattern.

**Solution:**
1. Review the column in `pii-field-inventory.csv`
2. Add a custom rule to `pii-detection-rules.yml` if needed
3. Or accept as `NON_PII` and update manually in registry

### Issue: "Many columns classified as UNKNOWN"

**Cause:** Schema uses non-standard naming conventions.

**Solution:**
1. Review `pii-detection-rules.yml` patterns
2. Add custom patterns matching your naming conventions
3. Re-run analysis with updated rules

### Issue: "Schema hash mismatch after re-run"

**Cause:** Database schema changed between runs.

**Solution:**
- This is expected if schema was modified
- Schema hashes are deterministic - same schema = same hash
- Update registry after intentional schema changes

---

## Next Steps: Phase 2

After Phase 1 completion:

1. **Review & Approve Registry:** Security team validation
2. **Update Registry (if needed):** Manual adjustments to rule bindings
3. **Commit Registry to Git:** Version control for drift detection
4. **Proceed to Phase 2:** Anonymization execution engine implementation

Phase 2 will:
- Read this registry as input
- Execute anonymization rules on actual data
- Enforce fail-closed if schema drifts from registry
- Generate anonymized backup for UAT restore

---

## Security Notes

✅ **What Phase 1 Does:**
- Reads schema metadata only (table/column names, types, constraints)
- NO raw data values are queried or exported
- NO reversible mappings are created or stored
- All artifacts are metadata-only

❌ **What Phase 1 Does NOT Do:**
- Does NOT anonymize any data
- Does NOT modify database contents
- Does NOT export original→anonymized value pairs
- Does NOT create BenRegID mappings (Phase 2 only)

**Credentials Security:**
- Use environment variables for database passwords
- Never commit credentials to Git
- Use read-only database users for analysis
- Run on secure network (VPN if analyzing production replicas)

---

## Support & Maintenance

**Owner:** AMRIT DevOps Team  
**Maintained By:** Database Anonymization Project Team  
**Documentation:** `docs/anonymization/phase1.md` (this file)

**For Issues:**
1. Check this documentation
2. Review logs in console output
3. File issue in project tracker with:
   - Command executed
   - Error message
   - Database versions
   - Relevant logs

---

## Appendix: File Locations

| File | Purpose |
|------|---------|
| `src/main/java/com/db/piramalswasthya/anonymization/phase1/**` | Phase 1 Java implementation |
| `src/main/resources/anonymization/pii-detection-rules.yml` | PII detection rules (customizable) |
| `src/main/resources/application-analyzer.properties` | Analyzer profile config |
| `docs/phase1-outputs/**` | Generated artifacts (default location) |
| `docs/anonymization/phase1.md` | This documentation |
| `docs/db-anonymization-phase1-analysis-plan.md` | Original Phase 1 planning document |

---

**End of Phase 1 Documentation**
