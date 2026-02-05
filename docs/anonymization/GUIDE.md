# AMRIT Database Anonymization - User Guide (v2.0)
Direct restore from DB1 read replica to DB2 UAT database

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Installation](#installation)
5. [Configuration](#configuration)
6. [Command-Line Usage](#command-line-usage)
7. [Security Model](#security-model)
8. [Troubleshooting](#troubleshooting)
9. [FAQ](#faq)

## Overview

The AMRIT Database Anonymization Tool v2.0 **connects directly to a production read replica (DB1)**, streams data using keyset pagination, anonymizes sensitive fields using HMAC-based deterministic strategies, and **writes directly to UAT database (DB2)**.

**What This Tool DOES:**
- Connects to DB1 read replica (never production master)
- Processes multiple schemas in single run (db_iemr, db_identity, db_reporting, db_1097_identity)
- Streams billions of rows efficiently (keyset pagination, no OFFSET)
- Resets target schemas (DROP/CREATE or DELETE fallback)
- Clones table structures from source to target
- Deterministic HMAC-based anonymization (same input → same output)
- Direct restore to DB2 (no SQL dump files)
- Production safety guards (hostname checks, allowlists, approval tokens)
- PII-safe logging (counts/timings only, never raw data)
- Schema drift detection (compare DB to rules.yaml)
- Validates rules before execution

**What This Tool DOES NOT Do:**
- Does NOT create SQL dump files (removed in v2.0)
- Does NOT connect to production master databases (safety enforced)
- Does NOT log or store raw PII (all logging is sanitized)
- Does NOT use OFFSET queries (always keyset pagination)
- Does NOT require large lookup tables (HMAC is deterministic)

**Key Features:**
- Multi-schema processing in single command
- Keyset pagination for O(log n) performance on large tables
- HMAC-SHA256 deterministic anonymization (no lookup tables needed)
- Schema reset with fallback strategies
- Production safety: hostname allowlist/denylist with explicit approval flags
- PII-safe logging: counts, timings, hashed IDs only
- Schema drift detection: diff-schema command
- YAML-based configuration and rules

## Architecture

```
┌──────────────────────────────────────┐
│ DB1 (Read Replica - Production)     │
│ Schemas:                             │
│  - db_iemr                           │  ← Read-only connection
│  - db_identity                       │     TLS/SSL enforced
│  - db_reporting                      │
│  - db_1097_identity                  │
└────────┬─────────────────────────────┘
         │ Keyset Pagination
         │ SELECT * FROM table WHERE pk > ? ORDER BY pk LIMIT 1000
         │
         │
┌─────────────────────────────────────────────┐
│  Java CLI Tool (amrit-db-anonymize)         │
│  For each schema:                           │
│    1. Reset target schema (DROP/CREATE)     │
│    2. Clone table structures from source    │
│    3. For each table:                       │
│       - Stream with keyset pagination       │
│       - Apply HMAC anonymization            │
│       - Batch INSERT into target            │
│  - Safety Guard (allowlist check)           │
│  - HMAC Anonymizer (deterministic)          │
│  - Streaming processor (batched)            │
│  - PII-safe logger                          │
└────────┬────────────────────────────────────┘
         │
         │
         ▼
┌──────────────────────────────────────┐
│ DB2 (UAT Database)                   │
│ Schemas:                             │
│  - db_iemr        (anonymized)       │
│  - db_identity    (anonymized)       │
│  - db_reporting   (anonymized)       │
│  - db_1097_identity (anonymized)     │
└──────────────────────────────────────┘
         │
         │
         ▼
   run-report.json
   (PII-safe metrics)
```

**Key Design Principles:**
1. **Multi-Schema**: Processes all 4 AMRIT schemas in single run
2. **Streaming**: Never loads entire tables into memory
3. **Keyset Pagination**: O(log n) performance, no OFFSET
4. **Deterministic**: HMAC ensures same input → same output
5. **Direct Restore**: No intermediate SQL dump files
6. **Safety-First**: Multiple layers of production protection
7. **PII-Safe**: Logs contain only counts, timings, hashed IDs

## Prerequisites

### Required Software

1. **Java 17 or later**
   ```bash
   # Check Java version
   java -version
   ```
   Expected output: `java version "17.0.x"` or higher

2. **Maven 3.6 or later** (for building)
   ```bash
   # Check Maven version
   mvn -version
   ```

3. **MySQL 8.0+** (for DB connections)
   - Read replica access to production database
   - Write access to UAT database (if using direct restore mode)

### System Requirements

- **Memory**: 512MB-2GB RAM (configurable batch size)
- **CPU**: 2+ cores recommended
- **Disk Space**: 2x final output size (for compressed dumps)
- **Network**: Stable connection to database servers

### Required Access

1. **DB1 (Source)**: Read-only user with SELECT privileges on all schemas
2. **DB2 (Target)**: Write user with DROP/CREATE/INSERT privileges on all schemas
3. **TLS/SSL**: Encrypted connections enforced for production

## Installation

### Step 1: Clone Repository

```bash
git clone https://github.com/PSMRI/AMRIT-DB.git
cd AMRIT-DB
```

### Step 2: Build Project

```bash
# Build with Maven
mvn clean package -DENV_VAR=local -DskipTests

# Output: target/Amrit-DB-1.0.0.war
```

### Step 3: Verify Build

```bash
# Test CLI tool
java -jar target/Amrit-DB-1.0.0.war --help
```

Expected output:
```
Usage: amrit-db.war [-hV] [COMMAND]
AMRIT Database Anonymization Tool v2.0.0
Commands:
  run          Anonymize and restore database
  diff-schema  Compare database schema with rules
```

## Quick Start

### 1. Create Configuration Files

Create `config.yaml`:
```yaml
source:
  host: db-replica.prod.example.com
  port: 3306
  schemas:
    - db_iemr
    - db_identity
    - db_reporting
    - db_1097_identity
  username: readonly_user
  password: ${DB_READ_PASSWORD}
  readOnly: true

target:
  host: uat-db.example.com
  port: 3306
  schemas:
    - db_iemr
    - db_identity
    - db_reporting
    - db_1097_identity
  username: write_user
  password: ${DB_WRITE_PASSWORD}

safety:
  enabled: true
  allowedHosts:
    - db-replica.prod.example.com
  requireExplicitApproval: true
  approvalFlag: PROD_2025_FEB

performance:
  batchSize: 1000
  fetchSize: 1000

rulesFile: rules.yaml
loggingPath: ./logs
```

Create `rules.yaml` (see rules.yaml.example for complete structure).

### 2. Run Anonymization

```bash
# Direct restore from DB1 to DB2
java -jar target/Amrit-DB-1.0.0.war run \
  --config config.yaml \
  --approve PROD_2025_FEB

# This will:
# 1. Validate safety checks
# 2. For each schema (db_iemr, db_identity, db_reporting, db_1097_identity):
#    a. Reset target schema (DROP/CREATE)
#    b. Clone table structures from source
#    c. Stream, anonymize, and insert data
# 3. Generate run-report.json
```

### 3. Review Results

Check `run-report.json` for:
- Schemas processed
- Tables and row counts
- Anonymization strategies applied
- Execution time per table
- Any errors (PII-safe)

## Command-Line Usage

### Run Command (Main Anonymization)

```bash
java -jar target/Amrit-DB-1.0.0.war run [OPTIONS]
```

### Required Options

| Option | Description | Example |
|--------|-------------|---------|
| `-c, --config FILE` | Configuration YAML | `--config config.yaml` |
| `--approve TOKEN` | Approval token matching config | `--approve PROD_2025_FEB` |

### Optional Parameters

| Option | Description | Default |
|--------|-------------|---------|
| `-r, --rules FILE` | Custom rules YAML | `rules.yaml` (from config) |
| `--dry-run` | Validate without execution | false |

### Diff-Schema Command (Schema Drift Detection)

```bash
java -jar target/Amrit-DB-1.0.0.war diff-schema [OPTIONS]
```

Compare database schemas with rules.yaml to detect missing tables or columns.

| Option | Description | Example |
|--------|-------------|---------|
| `-c, --config FILE` | Configuration YAML | `--config config.yaml` |
| `-r, --rules FILE` | Rules YAML | `--rules rules.yaml` |
| `-o, --output FILE` | Suggested rules output | `--output suggested.yaml` |

### Usage Examples

**Example 1: Direct restore with all schemas**
```bash
java -jar target/Amrit-DB-1.0.0.war run \
  --config config.yaml \
  --approve PROD_2025_FEB
```

**Example 2: Dry run validation**
```bash
java -jar target/Amrit-DB-1.0.0.war run \
  --config config.yaml \
  --approve PROD_2025_FEB \
  --dry-run
```

**Example 3: Schema drift detection**
```bash
java -jar target/Amrit-DB-1.0.0.war diff-schema \
  --config config.yaml \
  --rules rules.yaml \
  --output suggested-rules.yaml
```

**Example 4: Custom rules file**
```bash
java -jar target/Amrit-DB-1.0.0.war run \
  --config config.yaml \
  --rules custom-rules.yaml \
  --approve PROD_2025_FEB
```

## Configuration

### config.yaml Structure

Complete configuration file with all options:

```yaml
# Source Database (Read Replica)
source:
  host: db-replica.prod.example.com
  port: 3306
  schemas:
    - db_iemr
    - db_identity
    - db_reporting
    - db_1097_identity
  username: readonly_user
  password: ${DB_READ_PASSWORD}
  readOnly: true
  connectionTimeout: 30000

# Target Database (UAT)
target:
  host: uat-db.example.com
  port: 3306
  schemas:
    - db_iemr
    - db_identity
    - db_reporting
    - db_1097_identity
  username: write_user
  password: ${DB_WRITE_PASSWORD}
  connectionTimeout: 30000

# Safety Configuration
safety:
  enabled: true
  allowedHosts:
    - db-replica.prod.example.com
  deniedPatterns:
    - "*prod-master*"
  requireExplicitApproval: true
  approvalFlag: PROD_2025_FEB

# Performance Tuning
performance:
  batchSize: 1000
  fetchSize: 1000
  maxMemoryMb: 512

rulesFile: rules.yaml
loggingPath: ./logs
```

## Schema Reset Strategies

Before anonymizing data, the tool resets target schemas using one of these strategies:

### Strategy 1: DROP and CREATE (Preferred)

```sql
DROP DATABASE IF EXISTS db_iemr;
CREATE DATABASE db_iemr CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

**Requirements**: DROP and CREATE privileges

### Strategy 2: Clone and DELETE (Fallback)

```sql
-- Clone table structures
SHOW CREATE TABLE source_db.table1;
-- Execute CREATE TABLE in target_db

-- Delete all data
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM db_iemr.table1;
SET FOREIGN_KEY_CHECKS = 1;
```

**Requirements**: DELETE privilege on target, SELECT on source

### Strategy 3: Manual Intervention

If both fail, manually reset schemas and re-run.

### Exit Codes

| Code | Meaning | Description |
|------|---------|-------------|
| 0 | Success | Anonymization completed successfully |
| 1 | Anonymization Error | Failed during processing (check logs) |
| 2 | Unexpected Error | System error (JVM crash, out of memory) |

## Automation Scripts

### Windows PowerShell Script

**Location**: `scripts/anonymize-db.ps1`

**Usage:**
```powershell
# Basic usage
.\scripts\anonymize-db.ps1 -InputDump "production.sql" -OutputDump "uat.sql"

# With custom options
.\scripts\anonymize-db.ps1 `
  -InputDump "D:\backup\prod.sql" `
  -OutputDump "D:\backup\uat.sql" `
  -LookupPath "D:\cache" `
  -Verbose

# Dry run
.\scripts\anonymize-db.ps1 `
  -InputDump "prod.sql" `
  -OutputDump "uat.sql" `
  -DryRun
```

**Features:**
- Color-coded output (green=success, red=error, cyan=info)
- Automatic log file creation (logs/anonymization_YYYYMMDD_HHMMSS.log)
- File size reporting
- Duration tracking
- Exit code handling

### Linux/Mac Bash Script

**Location**: `scripts/anonymize-db.sh`

**Usage:**
```bash
# Make executable
chmod +x scripts/anonymize-db.sh

# Basic usage
./scripts/anonymize-db.sh --input production.sql --output uat.sql

# With custom options
./scripts/anonymize-db.sh \
  --input /backup/prod.sql \
  --output /backup/uat.sql \
  --lookup /data/cache \
  --verbose

# Dry run
./scripts/anonymize-db.sh \
  --input prod.sql \
  --output uat.sql \
  --dry-run

# Show help
./scripts/anonymize-db.sh --help
```

## Jenkins Pipeline

### Setup Instructions

1. **Create Jenkins Credentials**
   - Go to Jenkins → Credentials → System → Global credentials
   - Add Secret text:
     - ID: `amrit-anonymization-salt`
     - Secret: Your secure salt value

2. **Create Pipeline Job**
   - New Item → Pipeline
   - Name: "AMRIT-DB-Anonymization"
   - Pipeline script from SCM:
     - SCM: Git
     - Repository: Your AMRIT-DB repo
     - Script Path: `scripts/jenkins/Jenkinsfile`

3. **Configure Job Tools**
   - Jenkins → Manage Jenkins → Global Tool Configuration
   - Add JDK 17 (name: `JDK17`)
   - Add Maven 3.x (name: `Maven3`)

### Running the Pipeline

1. Go to job page
2. Click "Build with Parameters"
3. Set parameters:
   - **PROD_DUMP_PATH**: `/backup/production-dump.sql`
   - **UAT_DUMP_PATH**: `/backup/uat-anonymized.sql`
   - **DRY_RUN**: false
   - **VERBOSE**: true
4. Click "Build"

### Pipeline Stages

1. **Preparation** - Validates input file exists
2. **Build** - Compiles the anonymization tool
3. **Validate** - Runs dry-run validation
4. **Anonymize** - Executes anonymization (if not dry-run)
5. **Verify Output** - Checks output file integrity
6. **Archive** - Archives the anonymized dump

## Configuration

The tool uses two configuration files:

### 1. config.yaml (System Configuration)

```yaml
# Database connections
source:
  host: db-read-replica.example.com
  port: 3306
  database: db_iemr
  username: readonly_user
  password: ${DB_PASSWORD}
  readOnly: true

target:
  host: uat-database.example.com
  port: 3306
  database: db_iemr_uat
  username: uat_user
  password: ${DB_UAT_PASSWORD}

# CRITICAL: Production safety settings
safety:
  enabled: true
  allowedHosts:
    - "db-read-replica.example.com"
    - "*.nonprod.internal"
  deniedPatterns:
    - ".*prod.*"
    - ".*production.*"
  requireExplicitApproval: true
  approvalFlag: "I_CONFIRM_UAT_REFRESH_2026"

# Performance tuning
performance:
  batchSize: 1000        # Rows per batch
  fetchSize: 1000        # JDBC fetch size
  maxMemoryMb: 512       # Max heap usage
  threadPoolSize: 4      # Parallel table processing

# Output configuration
output:
  mode: SQL_DUMP         # SQL_DUMP or DIRECT_RESTORE
  path: ./output/anonymized.sql.gz
  compress: true
  includeSchema: false

rulesFile: rules.yaml
loggingPath: ./logs
```

**Environment Variables** (recommended for secrets):
- `DB_PASSWORD`: Source database password
- `DB_UAT_PASSWORD`: Target database password
- `ANONYMIZATION_SECRET`: HMAC secret key (32+ chars)

### 2. rules.yaml (Anonymization Rules)

```yaml
rulesVersion: "2.0.0"
schemaHint: "db_iemr-2024-Q4"
lastUpdated: "2026-02-05T00:00:00Z"
unknownColumnPolicy: WARN  # FAIL, WARN, PRESERVE

databases:
  db_identity:
    tables:
      m_beneficiaryregidmapping:
        primaryKey: BenRegID
        columns:
          BenRegID:
            strategy: HASH           # HMAC-SHA256
            dataType: BIGINT

          FirstName:
            strategy: FAKE_NAME      # Deterministic fake
            dataType: VARCHAR
          PhoneNo:
            strategy: MASK           # Show last N
            dataType: VARCHAR
            options:
              showLast: 4
          DOB:
            strategy: GENERALIZE     # Year only
            dataType: DATE
            options:
              precision: YEAR
          GenderID:
            strategy: PRESERVE       # No change
            dataType: INT
```

**Available Strategies:**
| Strategy | Description | Deterministic | Example |
|----------|-------------|---------------|---------|
| `HASH` | HMAC-SHA256 hash | Yes | `12345` → `a3f2c8...` |
| `FAKE_NAME` | HMAC-seeded fake name | Yes | `John Doe` → `Amit Kumar` |
| `MASK` | Mask with X, show last N | Yes | `9876543210` → `XXXXXX3210` |
| `GENERALIZE` | Reduce precision | Yes | `1985-05-15` → `1985` |
| `SUPPRESS` | Replace with NULL | Yes | `Secret` → `NULL` |
| `PRESERVE` | No change | Yes | `Active` → `Active` |

**Unknown Column Policy:**
- `FAIL`: Stop if DB has columns not in rules
- `WARN`: Log warning, preserve unknown columns
- `PRESERVE`: Silently keep unknown columns unchanged

## Command-Line Usage

### Basic Command Structure

```bash
java -jar target/Amrit-DB-2.0.0.war <command> [options]
```

### Available Commands

#### 1. run - Execute Anonymization

```bash
# Basic usage (SQL dump output)
java -jar target/Amrit-DB-2.0.0.war run \
  --config config.yaml \
  --approval-flag "I_CONFIRM_UAT_REFRESH_2026"

# Direct restore to DB2
java -jar target/Amrit-DB-2.0.0.war run \
  --config config-direct-restore.yaml \
  --approval-flag "I_CONFIRM_UAT_REFRESH_2026"

# Dry run (validation only)
java -jar target/Amrit-DB-2.0.0.war run \
  --config config.yaml \
  --dry-run
```

#### 2. diff-schema - Schema Drift Detection

```bash
# Compare DB schema to rules.yaml
java -jar target/Amrit-DB-2.0.0.war diff-schema \
  --config config.yaml \
  --rules rules.yaml

# Output suggested rules to file
java -jar target/Amrit-DB-2.0.0.war diff-schema \
  --config config.yaml \
  --rules rules.yaml \
  --output suggested-rules.yaml
```

**Output Example:**
```
Schema Drift Analysis
=====================

Missing Tables (in DB, not in rules):
  - db_iemr.t_newpatients (15 columns)
  
Missing Columns:
  - db_identity.m_beneficiaryregidmapping.NewColumn (VARCHAR)

Suggested Rules:
  NewColumn:
    strategy: PRESERVE  # Review and change if PII
    dataType: VARCHAR
    piiLevel: UNKNOWN
```

#### 3. validate-rules - Validate Configuration

```bash
# Validate rules.yaml
java -jar target/Amrit-DB-2.0.0.war validate-rules \
  --rules rules.yaml
```

**Validation Checks:**
- YAML syntax valid
- Required fields present (rulesVersion, schemaHint)
- Strategy names are valid
- Primary keys defined for all tables
- No duplicate column definitions

## Security Model

### Multi-Layer Safety

1. **Hostname Allowlist**
   - Only connects to explicitly allowed hosts
   - Supports wildcards: `*.nonprod.internal`

2. **Deny Pattern Matching**
   - Built-in patterns: `.*prod.*`, `.*production.*`, `.*live.*`
   - Custom patterns in config.yaml

3. **Explicit Approval Flag**
   - Required for execution
   - Rotates periodically (date-based)
   - Prevents accidental runs

4. **Read-Only Connections**
   - Source database connections are read-only
   - Enforced at JDBC level

5. **PII-Safe Logging**
   - Logs contain ONLY:
     - Row counts
     - Processing times
     - Hashed IDs (never raw values)
     - Error codes (no sensitive details)

### Example Safety Violation

```bash
$ java -jar amrit-db.war run --config config.yaml

Running safety checks for prod-db.example.com:db_iemr
DENIED: Host 'prod-db.example.com' matches production pattern '.*prod.*'
   If this is intentional, add to allowlist and provide approval flag.

Exit code: 1
```

## Command-Line Usage Examples

### Example 1: Weekly UAT Refresh (SQL Dump)

```bash
# Set environment variables
export DB_PASSWORD="readonly_pass"
export ANONYMIZATION_SECRET="your-32-char-secret-key-here"

# Run anonymization
java -Xmx2g -jar target/Amrit-DB-2.0.0.war run \
  --config config.yaml \
  --approval-flag "I_CONFIRM_UAT_REFRESH_2026_FEB"

# Output: ./output/anonymized-2026-02-05.sql.gz
```

### Example 2: Direct Restore to UAT

```bash
# config.yaml with output.mode: DIRECT_RESTORE
java -Xmx2g -jar target/Amrit-DB-2.0.0.war run \
  --config config-direct-restore.yaml \
  --approval-flag "I_CONFIRM_UAT_REFRESH_2026_FEB"

# Connects to DB2 and restores directly (no intermediate file)
```

### Example 3: Schema Change Detection

```bash
# After a production schema change, check what's new
java -jar target/Amrit-DB-2.0.0.war diff-schema \
  --config config.yaml \
  --rules rules.yaml \
  --output new-columns.yaml

# Review new-columns.yaml
# Update rules.yaml with appropriate strategies
# Commit changes to version control
```

### Example 4: Pre-Execution Validation

```bash
# Before running on Monday morning
java -jar target/Amrit-DB-2.0.0.war validate-rules --rules rules.yaml
java -jar target/Amrit-DB-2.0.0.war run --config config.yaml --dry-run

# If both pass, run actual execution
java -jar target/Amrit-DB-2.0.0.war run \
  --config config.yaml \
  --approval-flag "I_CONFIRM_UAT_REFRESH_2026_FEB"
```

## Troubleshooting

### Common Issues

#### Issue: "Safety check failed - host not in allowlist"

**Symptoms:**
```
DENIED: Host 'db-server.example.com' not in allowlist
```

**Solution:**
1. Verify you're connecting to correct read replica
2. Add host to `config.yaml`:
   ```yaml
   safety:
     allowedHosts:
       - "db-server.example.com"
   ```
3. Provide approval flag: `--approval-flag "..."`

#### Issue: "Connection timeout to database"

**Symptoms:**
```
ERROR: Failed to connect to db-replica:3306 after 30s
```

**Solution:**
1. Check network connectivity: `telnet db-replica 3306`
2. Verify credentials: `mysql -h db-replica -u user -p`
3. Increase timeout in config.yaml:
   ```yaml
   source:
     connectionTimeout: 60000  # 60 seconds
   ```

#### Issue: "Out of memory error"

**Symptoms:**
```
java.lang.OutOfMemoryError: Java heap space
```

**Solution:**
1. Reduce batch size in config.yaml:
   ```yaml
   performance:
     batchSize: 500  # Was 1000
     fetchSize: 500
   ```
2. Increase JVM heap:
   ```bash
   java -Xmx4g -jar target/Amrit-DB-2.0.0.war run ...
   ```

#### Issue: "Unknown column in rules"

**Symptoms:**
```
WARN: Column 'NewColumn' in table 't_patients' not found in rules.yaml
```

**Solution:**
1. Run schema diff:
   ```bash
   java -jar amrit-db.war diff-schema --config config.yaml --output new-rules.yaml
   ```
2. Review `new-rules.yaml`
3. Merge into `rules.yaml`
4. Re-run with updated rules

#### Issue: "Primary key not defined for table"

**Symptoms:**
```
ERROR: Table 't_visits' missing primaryKey in rules.yaml
```

**Solution:**
Add primary key to rules.yaml:
```yaml
databases:
  db_iemr:
    tables:
      t_visits:
        primaryKey: VisitID  # <-- Add this
        columns:
          ...
```

### Debug Mode

Enable detailed logging:

```bash
# Set logging level to DEBUG
export LOGGING_LEVEL=DEBUG

java -jar target/Amrit-DB-2.0.0.war run \
  --config config.yaml \
  --approval-flag "..."
```

**Log Output (PII-Safe):**
```
DEBUG KeysetPaginator: Fetching batch WHERE BenRegID > 12345 LIMIT 1000
DEBUG HmacAnonymizer: Hashed ID count=1000, avg_time=0.5ms
INFO  Progress: Table m_beneficiaryregidmapping - 50000/500000 rows (10%)
```

### Log Files

**Location**: `./logs/anonymization-YYYYMMDD-HHMMSS.log`

**Contains (PII-Safe)**:
- Start/end timestamps
- Tables processed
- Row counts per table
- Processing times
- Errors (no sensitive data)
- Configuration hash
- Rules version

**Example Log:**
```json
{
  "timestamp": "2026-02-05T10:00:00Z",
  "event": "table_completed",
  "table": "m_beneficiaryregidmapping",
  "rowsProcessed": 125000,
  "durationMs": 45000,
  "strategy": "HASH",
  "columnsAnonymized": 8
}
```

## FAQ

### Q1: How do I handle schema changes?

**A:** Use the diff-schema command regularly:

```bash
# Weekly check
java -jar amrit-db.war diff-schema \
  --config config.yaml \
  --output schema-changes.yaml

# Review changes
cat schema-changes.yaml

# Update rules.yaml
vi rules.yaml

# Commit to version control
git add rules.yaml
git commit -m "Add rules for new columns in Q1-2026 schema"
```

### Q2: Can I run this in parallel for multiple databases?

**A:** Yes, but use separate config files:

```bash
# Terminal 1: db_iemr
java -jar amrit-db.war run --config config-iemr.yaml --approval-flag "..."

# Terminal 2: db_identity
java -jar amrit-db.war run --config config-identity.yaml --approval-flag "..."
```

### Q3: How long does anonymization take?

**A:** Depends on data size:
- 1M rows: ~5-10 minutes
- 10M rows: ~30-60 minutes
- 100M rows (crores): ~5-8 hours
- 1B rows: ~2-3 days

**Performance factors:**
- Network speed (DB1 → tool)
- Batch size (higher = faster, more memory)
- Number of columns to anonymize
- HMAC computation overhead (~100μs per value)

### Q4: Is the anonymization reversible?

**A:** **NO.** HMAC-SHA256 is one-way:
- Cannot reverse hash back to original
- Same input always produces same hash (deterministic)
- Secure for production-to-UAT workflows

### Q5: What happens if the tool crashes mid-execution?

**A:**
- **SQL Dump mode**: Partial file written, incomplete. Delete and re-run.
- **Direct Restore mode**: Partial data in DB2. Drop tables and re-run.
- **No data loss** in DB1 (read-only connection)
- **Restart from beginning** (no resume support in v2.0)

### Q6: Can I anonymize only specific tables?

**A:** Yes, edit rules.yaml to include only desired tables:

```yaml
databases:
  db_identity:
    tables:
      m_beneficiaryregidmapping:  # Only this table
        ...
      # Remove other tables
```

### Q7: How do I verify anonymization worked?

**A:** Check run-report.json:

```json
{
  "executionId": "20260205-100000",
  "status": "SUCCESS",
  "tables": [
    {
      "name": "m_beneficiaryregidmapping",
      "rowsProcessed": 125000,
      "columnsAnonymized": 8,
      "strategies": {
        "HASH": 3,
        "FAKE_NAME": 2,
        "MASK": 2,
        "PRESERVE": 1
      }
    }
  ],
  "totalDurationMs": 180000,
  "configHash": "a3f2c8...",
  "rulesVersion": "2.0.0"
}
```

Spot-check UAT database:
```sql
SELECT BenRegID, FirstName, PhoneNo FROM m_beneficiaryregidmapping LIMIT 10;

-- Should see:
-- BenRegID: hashed (long hex string)
-- FirstName: fake name (Amit Kumar, Priya Sharma)
-- PhoneNo: masked (XXXXXX3210)
```

### Q8: How secure is the HMAC secret key?

**A:** **CRITICAL SECURITY:**
- Store in environment variable or secret manager
- Never commit to version control
- Rotate periodically (quarterly recommended)
- Use 32+ character random string:
  ```bash
  openssl rand -hex 32
  ```

### Q9: Can I use this for databases other than MySQL?

**A:** Currently MySQL only. PostgreSQL/Oracle support planned for v2.1.

### Q10: What's the difference between v1.0 and v2.0?

| Feature | v1.0 (deprecated) | v2.0 (current) |
|---------|-------------------|----------------|
| Input | SQL dump file | Live DB connection |
| Pagination | N/A (file-based) | Keyset pagination |
| Performance | O(n) file read | O(log n) queries |
| Safety | Basic | Multi-layer (allowlist, approval) |
| Output | SQL file | SQL file OR direct restore |
| Schema Diff | No | Yes (diff-schema command) |
| PII Logging | Potential risk | Guaranteed PII-safe |

## Best Practices

1. **Always Use Read Replicas**
   - Never connect to production master
   - Use dedicated read replica with lag monitoring

2. **Rotate Approval Flags Monthly**
   ```yaml
   safety:
     approvalFlag: "I_CONFIRM_UAT_REFRESH_2026_FEB"  # Change monthly
   ```

3. **Version Control Your Rules**
   ```bash
   git add rules.yaml config.yaml
   git commit -m "Update rules for Q1-2026 schema"
   git tag anonymization-rules-2026-Q1
   ```

4. **Run Diff-Schema Weekly**
   ```bash
   # Cron job: Every Monday 6 AM
   0 6 * * 1 java -jar amrit-db.war diff-schema --config config.yaml
   ```

5. **Test on Staging First**
   ```bash
   # Staging config (smaller dataset)
   java -jar amrit-db.war run --config config-staging.yaml --approval-flag "..."
   
   # If successful, run production config
   java -jar amrit-db.war run --config config-prod.yaml --approval-flag "..."
   ```

6. **Monitor Execution**
   - Check run-report.json after completion
   - Verify row counts match expectations
   - Spot-check anonymized data in UAT

7. **Keep Logs**
   ```bash
   # Archive logs for audit trail
   tar -czf logs-$(date +%Y%m%d).tar.gz logs/
   aws s3 cp logs-$(date +%Y%m%d).tar.gz s3://audit-bucket/
   ```

## Support

For issues or questions:
- GitHub Issues: https://github.com/PSMRI/AMRIT-DB/issues
- Email: support@piramalswasthya.org
- Internal Wiki: [AMRIT DB Anonymization](link)

## Appendix

### A. Full Config Reference

See [config.yaml.example](../../config.yaml.example)

### B. Full Rules Reference

See [rules.yaml.example](../../rules.yaml.example)

### C. Architecture Diagram

See [architecture diagram.png](architecture%20diagram.png)

### D. Migration from v1.0 to v2.0

**v1.0 Command:**
```bash
java -jar Amrit-DB-1.0.0.war anonymize --input dump.sql --output uat.sql
```

**v2.0 Equivalent:**
1. Create DB connection config (config.yaml)
2. Run: `java -jar Amrit-DB-2.0.0.war run --config config.yaml --approval-flag "..."`

**Key Differences:**
- v2.0 connects to live DB (no dump file needed)
- v2.0 requires safety approval flag
- v2.0 uses keyset pagination (faster for large datasets)

---

**Document Version**: 2.0.0  
**Last Updated**: February 5, 2026  
**Status**: v2.0 Implementation In Progress
