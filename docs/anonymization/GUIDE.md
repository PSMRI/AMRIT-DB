# AMRIT Database Anonymization - User Guide

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Quick Start](#quick-start)
5. [Command-Line Usage](#command-line-usage)
6. [Automation Scripts](#automation-scripts)
7. [Jenkins Pipeline](#jenkins-pipeline)
8. [Configuration](#configuration)
9. [Troubleshooting](#troubleshooting)
10. [FAQ](#faq)

## Overview

The AMRIT Database Anonymization Tool transforms production SQL dumps into anonymized versions safe for UAT testing. It preserves database structure and referential integrity while protecting sensitive patient information.

**Key Features:**
- Processes large SQL dump files efficiently (streaming, memory-safe)
- Consistent anonymization (same original → same anonymized value)
- Configurable strategies (hashing, masking, fake data, generalization)
- Preserves referential integrity across tables
- Command-line tool and automation scripts
- Jenkins pipeline ready

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

3. **MySQL 8.0** (for creating dumps)
   ```bash
   # Check MySQL version
   mysql --version
   ```

### System Requirements

- **Disk Space**: 3x size of production dump (input + output + lookup cache)
- **Memory**: 4GB RAM recommended
- **CPU**: 2+ cores recommended for better performance

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
AMRIT Database Anonymization Tool v1.0.0
Use --help for usage information

Available commands:
  anonymize  - Anonymize a SQL dump file
```

## Quick Start

### 1. Create Production Dump

```bash
# Windows (PowerShell)
mysqldump -u root -p --databases db_identity db_iemr db_1097_identity `
  --single-transaction --quick --lock-tables=false `
  --result-file=production-dump.sql

# Linux/Mac
mysqldump -u root -p --databases db_identity db_iemr db_1097_identity \
  --single-transaction --quick --lock-tables=false \
  --result-file=production-dump.sql
```

### 2. Run Anonymization

```bash
# Basic usage
java -jar target/Amrit-DB-1.0.0.war anonymize \
  --input production-dump.sql \
  --output anonymized-dump.sql
```

### 3. Restore to UAT

```bash
# Import anonymized dump
mysql -u root -p < anonymized-dump.sql
```

## Command-Line Usage

### Basic Command Structure

```bash
java -jar target/Amrit-DB-1.0.0.war anonymize [OPTIONS]
```

### Required Options

| Option | Description | Example |
|--------|-------------|---------|
| `-i, --input FILE` | Input SQL dump file | `--input prod.sql` |
| `-o, --output FILE` | Output anonymized file | `--output uat.sql` |

### Optional Parameters

| Option | Description | Default |
|--------|-------------|---------|
| `-r, --registry FILE` | Custom registry YAML | classpath:anonymization-registry.yml |
| `-l, --lookup PATH` | H2 lookup DB path | ./lookup-cache |
| `-s, --salt STRING` | Custom salt for hashing | AMRIT_2024_SECURE_SALT |
| `--dry-run` | Validate without processing | (disabled) |
| `-v, --verbose` | Verbose output | (disabled) |
| `-h, --help` | Show help message | - |

### Usage Examples

**Example 1: Basic anonymization**
```bash
java -jar target/Amrit-DB-1.0.0.war anonymize \
  --input /backup/production.sql \
  --output /backup/uat.sql
```

**Example 2: Verbose output**
```bash
java -jar target/Amrit-DB-1.0.0.war anonymize \
  --input production.sql \
  --output anonymized.sql \
  --verbose
```

**Example 3: Custom registry and lookup path**
```bash
java -jar target/Amrit-DB-1.0.0.war anonymize \
  --input prod.sql \
  --output uat.sql \
  --registry custom-rules.yml \
  --lookup /data/lookup-cache
```

**Example 4: Dry run (validation only)**
```bash
java -jar target/Amrit-DB-1.0.0.war anonymize \
  --input huge-dump.sql \
  --output test-output.sql \
  --dry-run
```

**Example 5: Custom salt**
```bash
java -jar target/Amrit-DB-1.0.0.war anonymize \
  --input prod.sql \
  --output uat.sql \
  --salt "MySecureRandomSalt123"
```

**Example 6: Increased memory for large dumps**
```bash
java -Xmx8g -jar target/Amrit-DB-1.0.0.war anonymize \
  --input large-production-10GB.sql \
  --output uat-anonymized.sql
```

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

### Anonymization Registry

The registry file (`anonymization-registry.yml`) defines which fields to anonymize and how.

**Location**: `src/main/resources/anonymization-registry.yml`

**Structure:**
```yaml
version: "1.0.0"
lastUpdated: "2026-02-04T12:00:00Z"
databases:
  db_identity:
    tables:
      m_beneficiaryregidmapping:
        columns:
          BenRegID:
            anonymizationRule: "HASH_SHA256"
            piiRisk: "CRITICAL"
          FirstName:
            anonymizationRule: "RANDOM_FAKE_DATA"
            piiRisk: "HIGH"
          PhoneNo:
            anonymizationRule: "PARTIAL_MASK"
            piiRisk: "HIGH"
            options:
              show_last_n: 4
```

### Available Anonymization Strategies

| Strategy | Description | Example |
|----------|-------------|---------|
| `HASH_SHA256` | One-way hash (deterministic) | `BEN12345` → `a3f2c8...` |
| `RANDOM_FAKE_DATA` | Realistic fake data (Indian locale) | `John` → `Rajesh Kumar` |
| `PARTIAL_MASK` | Mask with X, show last N | `9876543210` → `XXXXXX3210` |
| `GENERALIZE` | Reduce precision | `1985-05-15` → `1985` |
| `SUPPRESS` | Replace with NULL | `Secret notes` → `NULL` |
| `PRESERVE` | No change (non-sensitive) | `Active` → `Active` |

### Customizing Registry

To add a new field for anonymization:

1. Open `anonymization-registry.yml`
2. Navigate to database → table → columns
3. Add new column entry:
   ```yaml
   NewColumn:
     canonicalName: "NewColumn"
     dataType: "VARCHAR"
     piiRisk: "HIGH"
     anonymizationRule: "HASH_SHA256"
   ```
4. Rebuild and redeploy

## Troubleshooting

### Common Issues

#### Issue: "Out of memory error"

**Symptoms:**
```
java.lang.OutOfMemoryError: Java heap space
```

**Solution:**
Increase heap size:
```bash
java -Xmx8g -jar target/Amrit-DB-1.0.0.war anonymize ...
```

#### Issue: "H2 database locked"

**Symptoms:**
```
Database may be already in use: "Locked by another process"
```

**Solution:**
1. Close other processes using lookup DB
2. Delete lock file: `lookup-cache.lock.db`
3. Ensure `AUTO_SERVER=TRUE` in H2 URL (already enabled)

#### Issue: "SQL parsing error"

**Symptoms:**
```
Failed to parse INSERT statement at line 12345
```

**Solution:**
Ensure MySQL dump uses compatible format:
```bash
mysqldump --compatible=mysql --no-create-info ...
```

#### Issue: "Input file not found"

**Symptoms:**
```
ERROR: Input file not found: production.sql
```

**Solution:**
- Check file path (use absolute paths)
- Verify file permissions (readable)
- On Windows, use backslashes: `D:\backup\dump.sql`

#### Issue: "Registry validation failed"

**Symptoms:**
```
ERROR: Failed to load anonymization registry
```

**Solution:**
1. Validate YAML syntax: https://www.yamllint.com/
2. Check indentation (must use spaces, not tabs)
3. Verify required fields present

### Debug Mode

Enable detailed logging:

```bash
java -Dlogging.level.com.db.piramalswasthya=DEBUG \
  -jar target/Amrit-DB-1.0.0.war anonymize \
  --input prod.sql \
  --output uat.sql \
  --verbose
```

### Log Files

**PowerShell Script Logs:**
- Location: `logs/anonymization_YYYYMMDD_HHMMSS.log`
- Contains full console output + errors

**Application Logs:**
- Location: `logs/amrit-db.log` (if configured)
- Rotation: Daily, keep 7 days

**View Last Errors:**
```bash
# Windows
Get-Content logs\anonymization_*.log -Tail 50

# Linux/Mac
tail -50 logs/anonymization_*.log
```

## FAQ

### Q1: How long does anonymization take?

**A:** Processing time depends on dump size:
- 100 MB: 1-2 minutes
- 1 GB: 10-15 minutes
- 10 GB: 1.5-2 hours

### Q2: Can I run multiple anonymizations in parallel?

**A:** Yes, but use separate lookup database paths:
```bash
# Process 1
--lookup ./lookup-cache-1

# Process 2
--lookup ./lookup-cache-2
```

### Q3: Is the original dump modified?

**A:** No. The tool only reads the input file and creates a new output file.

### Q4: What happens if anonymization fails midway?

**A:** The output file will be incomplete. Delete it and re-run. The lookup cache preserves mappings.

### Q5: Can I anonymize only specific tables?

**A:** Yes. Modify `anonymization-registry.yml` to include only desired tables. Remove unwanted table entries.

### Q6: How do I verify anonymization worked?

**A:** 
1. Check output file size (should be similar to input)
2. Spot-check sensitive fields:
   ```sql
   mysql> SELECT BenRegID, FirstName FROM m_beneficiaryregidmapping LIMIT 10;
   ```
3. Verify foreign keys still match

### Q7: Can I use this for databases other than MySQL?

**A:** Currently supports MySQL only. PostgreSQL/Oracle support planned for future releases.

### Q8: How secure is the anonymization?

**A:**
- Uses salted SHA-256 hashing (one-way, irreversible)
- Lookup table stores hashes, not original values
- Custom salt recommended for production

### Q9: What about foreign key constraints?

**A:** The lookup table ensures consistency:
- Same BenRegID in table A → same hash in table B
- Referential integrity preserved

### Q10: Can I anonymize incrementally?

**A:** Not yet. Currently processes full dumps. Incremental support planned for v2.0.

## Best Practices

1. **Backup Before Restoring**
   ```bash
   mysqldump uat_database > uat-backup-before-refresh.sql
   ```

2. **Use Custom Salt in Production**
   ```bash
   --salt $(cat /secure/salt.txt)
   ```

3. **Verify Output Before UAT Deployment**
   ```bash
   # Test on staging first
   mysql staging_uat < anonymized-dump.sql
   ```

4. **Keep Lookup Cache Persistent**
   - Store lookup DB in version control or shared storage
   - Ensures consistency across multiple anonymization runs

5. **Monitor Disk Space**
   ```bash
   # Windows
   Get-PSDrive C
   
   # Linux
   df -h
   ```

6. **Schedule Regular UAT Refreshes**
   - Weekly or bi-weekly recommended
   - Use Jenkins scheduled builds

## Support

For issues or questions:
- GitHub Issues: https://github.com/PSMRI/AMRIT-DB/issues
- Email: support@piramalswasthya.org
- Documentation: [TECHNICAL-DOCUMENTATION.md](TECHNICAL-DOCUMENTATION.md)

## License

Copyright (C) 2024 Piramal Swasthya Management and Research Institute

Licensed under GPL v3.0
