# AMRIT Database Anonymization - User Guide

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Quick Start](#quick-start)
5. [Configuration](#configuration)
6. [Anonymization Rules](#anonymization-rules)
7. [Command-Line Usage](#command-line-usage)
8. [Safety Model](#safety-model)
9. [Troubleshooting](#troubleshooting)
10. [FAQ](#faq)

## Overview

The AMRIT Database Anonymization Tool streams data from a production read replica (DB1) to a UAT database (DB2), applying deterministic HMAC-based anonymization to sensitive fields.

### What This Tool Does

- Connects to DB1 read replica (never production master)
- Processes multiple schemas in one command: db_iemr, db_identity, db_reporting, db_1097_identity
- Streams billions of rows efficiently using keyset pagination
- Resets target schemas before writing (DROP/CREATE or DELETE fallback)
- Clones table structures from source to target
- Applies deterministic HMAC anonymization (same input always produces same output)
- Writes directly to DB2 (no intermediate files)
- Enforces production safety with allowlists and approval tokens
- Logs only PII-safe metrics (counts, timings, hashed IDs)
- Validates configuration and rules before execution

### What This Tool Does NOT Do

- Does NOT create SQL dump files
- Does NOT connect to production master databases
- Does NOT log or store raw PII data
- Does NOT use OFFSET-based pagination
- Does NOT require lookup tables for consistency

### Key Features

- Multi-schema processing in single run
- Keyset pagination for O(log n) performance
- HMAC-SHA256 deterministic anonymization
- Multi-layer safety guards (allowlist, denylist, approval tokens)
- PII-safe logging (counts and timings only)
- Schema drift detection (diff-schema command)
- YAML-based configuration

## Architecture

```mermaid
flowchart LR
  subgraph Source[DB1: Read Replica]
    S1[(db_iemr<br/>db_identity<br/>db_reporting<br/>db_1097_identity)]
  end

  subgraph CLI[amrit-db-anonymize]
    C1[Keyset Pagination\nHMAC Anonymizer\nClone & Reset Schema]
  end

  subgraph Target[DB2: UAT]
    T1[(db_iemr<br/>db_identity<br/>db_reporting<br/>db_1097_identity)]
  end

  S1 -->|stream rows (keyset)| C1
  C1 -->|write anonymized rows| T1
  C1 -->|write metrics| R[run-report.json]

  classDef dbs fill:#f9f,stroke:#333,stroke-width:1px;
  class Source,Target dbs;
```

### Design Principles

1. **Direct Restore**: No intermediate SQL dump files
2. **Multi-Schema**: Processes all 4 AMRIT schemas in single command
3. **Streaming**: Never loads entire tables into memory
4. **Keyset Pagination**: WHERE pk > ? ORDER BY pk - O(log n) performance
5. **Deterministic**: HMAC ensures same input always produces same output
6. **Safety-First**: Multiple layers of production protection
7. **PII-Safe**: Logs contain only aggregated metrics

## Prerequisites

### Database Permissions

**DB1 (Source) - Read-only user:**
```sql
GRANT SELECT ON db_iemr.* TO 'readonly_user'@'%';
GRANT SELECT ON db_identity.* TO 'readonly_user'@'%';
GRANT SELECT ON db_reporting.* TO 'readonly_user'@'%';
GRANT SELECT ON db_1097_identity.* TO 'readonly_user'@'%';
```

**DB2 (Target) - Write user:**
```sql
GRANT ALL PRIVILEGES ON db_iemr.* TO 'uat_user'@'%';
GRANT ALL PRIVILEGES ON db_identity.* TO 'uat_user'@'%';
GRANT ALL PRIVILEGES ON db_reporting.* TO 'uat_user'@'%';
GRANT ALL PRIVILEGES ON db_1097_identity.* TO 'uat_user'@'%';
```

### System Requirements

- Memory: 512MB-2GB RAM (depends on batch size)
- CPU: 2+ cores recommended
- Network: Stable connection to both databases
- Disk: Minimal (no dump files created)

## Quick Start

### 1. Build the Tool

```bash
cd AMRIT-DB
mvn clean package -DENV_VAR=local -DskipTests

# Output: target/Amrit-DB-1.0.0.war
```

### 2. Verify Installation

```bash
# View available commands
mvn exec:java "-Dexec.args=--help"
```

```bash
#expected output:

Usage: amrit-db-anonymize [-hV] [COMMAND]
AMRIT Database Anonymization Tool - Production-safe DB anonymization with
streaming
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
Commands:
  run          Execute multi-schema anonymization: DB1 replica ? DB2 UAT
                 (direct restore)
  diff-schema  Compare DB schema to rules.yaml and suggest updates
```

### 3. Create Configuration

This project uses Spring `.properties` files and environment variables for configuration.

- Copy the `anonymizer.*` block from [src/main/environment/common_example.properties](src/main/environment/common_example.properties#L1-L200)
  into [src/main/environment/common_local.properties](src/main/environment/common_local.properties) (this file is gitignored) and update values.
- Required runtime secrets should be supplied via environment variables (for example `HMAC_SECRET_KEY`).

Example (what to copy into `common_local.properties`):

```
# anonymizer.source.host=localhost
# anonymizer.source.port=3306
# anonymizer.source.schemas=dbiemr,db_identity,db_reporting,db_1097_identity
# anonymizer.source.username=root
# anonymizer.source.password=...
# anonymizer.target.host=localhost
# anonymizer.target.username=root
# anonymizer.target.password=...
# anonymizer.hmacSecretKey=${HMAC_SECRET_KEY}
# anonymizer.safety.operationId=OPERATION_2026_02_20
```

The CLI will automatically use the `anonymizer.*` keys from Spring properties when a YAML config is not supplied.

### 4. Set Environment Variables

```bash
# Windows PowerShell
$env:DB_READ_PASSWORD="your_readonly_password"
$env:DB_WRITE_PASSWORD="your_uat_password"
$env:HMAC_SECRET_KEY="$(openssl rand -hex 32)"

# Linux/Mac
export DB_READ_PASSWORD="your_readonly_password"
export DB_WRITE_PASSWORD="your_uat_password"
export HMAC_SECRET_KEY="$(openssl rand -hex 32)"
```

### 5. Run Anonymization

Use the `anonymizer.*` properties or environment variables; do not use YAML.

```bash
# Dry run (validation only)
mvn exec:java "-Dexec.args=run --operation-id PROD_REFRESH_2026_FEB --dry-run"

# Actual execution
mvn exec:java "-Dexec.args=run --operation-id PROD_REFRESH_2026_FEB"
```

Output:
```
[INFO] Safety check: PASSED
[INFO] Processing schema: db_iemr
[INFO]   Resetting schema db_iemr...
[INFO]   Cloning 45 table structures...
[INFO]   Processing table m_beneficiaryregidmapping (125000 rows)...
[INFO]     Progress: 50000/125000 (40%)
[INFO]     Progress: 100000/125000 (80%)
[INFO]     Completed: 125000 rows in 45s
[INFO] Processing schema: db_identity
...
[INFO] Anonymization completed successfully
[INFO] Report saved: run-report.json
```

### 6. Verify Results

Check `run-report.json`:
```json
{
  "timestamp": "2026-02-06T10:30:00Z",
  "status": "SUCCESS",
  "schemas": [
    {
      "name": "db_iemr",
      "tables": [
        {
          "name": "m_beneficiaryregidmapping",
          "rowsProcessed": 125000,
          "columnsAnonymized": 3,
          "durationMs": 45000,
          "strategyCounts": {
            "HMAC_HASH": 3,
            "PRESERVE": 5
          }
        }
      ]
    }
  ],
  "totalDurationMs": 3600000,
  "configHash": "a3f2c8d1..."
}
```

## Configuration

### Configuration File Format

The tool supports two configuration approaches: the original YAML `config.yaml` and a
`properties`-based fallback that loads `anonymizer.*` keys from the Spring environment.

YAML files (optional): store them in `src/main/environment/`:

- `anonymization_example.yaml` - Base template
- `anonymization_local.yaml` - Local development (gitignored)
- `anonymization_docker.yaml` - Docker environment (gitignored)
- `anonymization_production.yaml` - Production (gitignored)
- `anonymization_ci.yaml` - CI/CD pipelines (gitignored)

Properties-based configuration (recommended for local/dev):

- You can provide anonymizer configuration via Spring `.properties` files using keys
  prefixed with `anonymizer.` (for example `anonymizer.source.host`,
  `anonymizer.target.username`, `anonymizer.hmacSecretKey`).
- An example set of keys is available in [src/main/environment/common_example.properties](src/main/environment/common_example.properties#L1-L120).
- To use locally, copy the `anonymizer.*` block from the example into
  [src/main/environment/common_local.properties](src/main/environment/common_local.properties) (gitignored) and update values,
  especially `anonymizer.hmacSecretKey` which should be set to a secure value or
  supplied via the environment variable `HMAC_SECRET_KEY`.
- The CLI will automatically fall back to these properties when a YAML config is
  not provided with `--config`.

### Complete Configuration Reference

### Complete Configuration Reference

```yaml
# Source Database (Production Read Replica)
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
  readOnly: true                    # Enforced safety
  connectionTimeout: 30000          # 30 seconds

# Target Database (UAT)
target:
  host: uat-db.example.com
  port: 3306
  schemas:
    - db_iemr
    - db_identity
    - db_reporting
    - db_1097_identity
  username: uat_user
  password: ${DB_WRITE_PASSWORD}
  connectionTimeout: 30000

# Safety Configuration
safety:
  enabled: true
  allowedHosts:
    - db-replica.prod.example.com
  deniedPatterns:
    - "*prod-master*"
    - "*production-primary*"
  requireExplicitApproval: true
  approvalFlag: PROD_REFRESH_2026_FEB  # Change monthly

# Performance Tuning
performance:
  batchSize: 1000      # Rows per INSERT batch
  fetchSize: 1000      # JDBC fetch size
  maxMemoryMb: 512     # JVM heap limit

# HMAC Secret (store securely)
hmacSecretKey: ${HMAC_SECRET_KEY}

# Rules file path
rulesFile: rules.yaml
```

### Environment Variable Substitution

Use `${VAR_NAME}` syntax for sensitive values:

```yaml
source:
  password: ${DB_READ_PASSWORD}
target:
  password: ${DB_WRITE_PASSWORD}
hmacSecretKey: ${HMAC_SECRET_KEY}
```

Set in environment:
```bash
export DB_READ_PASSWORD="secret"
export DB_WRITE_PASSWORD="secret"
export HMAC_SECRET_KEY="$(openssl rand -hex 32)"
```

## Anonymization Rules

### Rules File Format

Create `rules.yaml` to define anonymization strategies for each table and column.

### Available Strategies

The tool implements two anonymization strategies:

| Strategy | Description | Use Case | Example |
|----------|-------------|----------|---------|
| `PRESERVE` | Keep original value unchanged | Non-sensitive columns, IDs needed for joins | Status codes, timestamps |
| `HMAC_HASH` | Apply HMAC-SHA256 hash | Sensitive identifiers, deterministic anonymization | Names, phone numbers, email |

### Rules Structure

Before anonymizing data, the tool resets target schemas using one of these strategies:

### Schema Reset Strategies

Before anonymizing, the tool resets target schemas using one of these methods:

**Strategy 1: DROP and CREATE (Preferred)**
```sql
DROP DATABASE IF EXISTS db_iemr;
CREATE DATABASE db_iemr CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
Requires: DROP and CREATE privileges

**Strategy 2: DELETE (Fallback)**
```sql
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM db_iemr.table1;
DELETE FROM db_iemr.table2;
...
SET FOREIGN_KEY_CHECKS = 1;
```
Requires: DELETE privilege on all tables

The tool automatically attempts Strategy 1, then falls back to Strategy 2 if needed.

## Command-Line Usage

### Running Commands

All commands are executed using Maven exec plugin:

```bash
mvn exec:java "-Dexec.args=[COMMAND] [OPTIONS]"
```

**Important Notes:**
- Always quote the `-Dexec.args` parameter
- Use double quotes on Windows, single or double on Linux/Mac
- The tool runs as a CLI application (does not start a web server)

### View Help

```bash
# Main help
mvn exec:java "-Dexec.args=--help"

# Command-specific help
mvn exec:java "-Dexec.args=run --help"
mvn exec:java "-Dexec.args=diff-schema --help"
```

### run Command

Anonymize and restore database from source to target.

**Required Options:**
- `--operation-id ID` - Operation identifier (recommended; can also be set via `anonymizer.safety.operationId` in properties)

**Optional Options:**
- `--dry-run` - Validate configuration without executing

**Examples:**

```bash
# Normal execution (uses anonymizer.* properties from Spring environment)
mvn exec:java "-Dexec.args=run --operation-id OPERATION_2026_02_20"

# Dry run (validation only)
mvn exec:java "-Dexec.args=run --operation-id OPERATION_2026_02_20 --dry-run"
```

**Exit Codes:**
- `0` - Success
- `1` - Validation or execution error

### diff-schema Command

Compare database schemas with rules.yaml to detect schema drift.

**Options:**
- `-r, --rules FILE` - Rules file (default: rules.yaml)
- `-o, --output FILE` - Write suggested rules to file (optional)

**Examples:**

```bash
# Compare schema with rules (uses anonymizer.* properties from Spring environment)
mvn exec:java "-Dexec.args=diff-schema --rules rules.yaml"

# Generate suggested rules for new columns
mvn exec:java "-Dexec.args=diff-schema --rules rules.yaml --output suggested-rules.yaml"
```

### Exit Codes

| Code | Meaning | Action |
|------|---------|--------|
| 0 | Success | Anonymization completed |
| 1 | Error | Check run-report.json for details |

## Safety Model

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
   mvn exec:java "-Dexec.args=diff-schema --config config.yaml --output new-rules.yaml"
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

# Run with debug logging
mvn exec:java "-Dexec.args=run --operation-id TOKEN"
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
mvn exec:java "-Dexec.args=diff-schema --config config.yaml --output schema-changes.yaml"

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
# Terminal 1: db_iemr (properties point to db_iemr)
mvn exec:java "-Dexec.args=run --operation-id OP_IEMR_2026_02_20"

# Terminal 2: db_identity (properties point to db_identity)
mvn exec:java "-Dexec.args=run --operation-id OP_IDENTITY_2026_02_20"
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

### What happens if the tool crashes?

- Partial data written to DB2 (target)
- No data loss in DB1 (read-only connection)
- Re-run from beginning (no resume support)
- Consider: Drop target schemas and restart

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
      "strategyCounts": {
        "HMAC_HASH": 3,
        "PRESERVE": 5
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
-- BenRegID: long hex hash (64 chars)
-- FirstName: long hex hash (64 chars)
-- PhoneNo: long hex hash (64 chars)
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
  git add rules.yaml
  git commit -m "Update rules for Q1-2026 schema"
  git tag anonymization-rules-2026-Q1
  ```

4. **Run Diff-Schema Weekly**
   ```bash
   # Cron job: Every Monday 6 AM (Linux)
  0 6 * * 1 cd /path/to/AMRIT-DB && mvn exec:java "-Dexec.args=diff-schema"
   ```

5. **Test on Staging First**
   ```bash
  # Staging run (smaller dataset)
  mvn exec:java "-Dexec.args=run --operation-id STAGING_RUN_2026"
   
  # If successful, run production (ensure anonymizer.safety.operationId and secrets are set)
  mvn exec:java "-Dexec.args=run --operation-id PRODUCTION_RUN_2026"
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

### D. Command Reference Quick Guide

**All commands use Maven exec plugin:**

```bash
# View all commands
mvn exec:java "-Dexec.args=--help"

# Run anonymization
mvn exec:java "-Dexec.args=run --operation-id TOKEN"

# Dry run (validation)
mvn exec:java "-Dexec.args=run --operation-id TOKEN --dry-run"

# Compare schema
mvn exec:java "-Dexec.args=diff-schema --rules rules.yaml"

# Get help for specific command
mvn exec:java "-Dexec.args=run --help"
mvn exec:java "-Dexec.args=diff-schema --help"
```

**Key Features:**
- Direct DB-to-DB streaming (no SQL dump files)
- Multi-schema processing (db_iemr, db_identity, db_reporting, db_1097_identity)
- HMAC-SHA256 deterministic anonymization
- Keyset pagination for efficient large-dataset processing
- Production safety guards (allowlist, operation identifier)
- PII-safe logging (only metrics, no sensitive data)

