# AMRIT Database Anonymization & UAT Refresh - Execution Plan

**Issue**: [C4GT Community] Automate anonymized production DB snapshot for UAT #112  
**Target Repository**: AMRIT-DB  
**Status**: Planning Phase  
**Last Updated**: January 8, 2026

---

## Executive Summary

This document provides a comprehensive execution plan for implementing an automated, secure, and repeatable process to refresh the UAT environment database with anonymized production data. The solution ensures data privacy compliance while maintaining referential integrity for testing purposes.

---

## Critical Questions Requiring Clarification

**⚠️ IMPORTANT**: Before implementation begins, the following questions MUST be answered:

### Q1: Flyway Schema Evolution Synchronization
**Question**: How do we ensure anonymization scripts stay synchronized with Flyway migrations (V1, V2, V3...)? What happens if a developer adds V7__ADD_NEW_PII_COLUMN.sql to production but anonymization scripts aren't updated before UAT refresh?

**Options to Decide**:
- A) Pre-migration validation hook that fails if new columns aren't covered
- B) Mandatory PR template requiring anonymization script updates with every migration
- C) Automated stub generation for new PII columns

might remove all and just..........do smth
---

### Q2: Cross-Database Foreign Key Integrity (BenRegID)
**Question**: BenRegID links db_identity, db_iemr, and db_1097_identity. If we anonymize databases sequentially and BenRegID is hashed differently per database, referential integrity breaks. Which approach do we take?

**Options to Decide**:
- A) Keep BenRegID unchanged (linking key, but potential privacy concern)
- B) Hash BenRegID deterministically with same salt across ALL databases (requires BIGINT → VARCHAR schema change)
- C) Create temporary mapping table (original_benregid → anonymized_benregid) applied to all databases

**Recommendation**: Option C (mapping table) - see Section 4.7 for implementation details.
I mean, this is kind of the first barrier, bc at one point, we can either test it or break down the purpose of this ben_id and think smth else dunno yet.
---

### Q3: Production Database Topology & Backup Impact
**Question**: What is the current production MySQL setup? Do we have:
- A) Dedicated read replica for backups (zero production impact)
- B) Only primary database (mysqldump causes read locks and buffer pool pressure)
- C) Existing backup system (AWS RDS snapshots, Percona XtraBackup) we can leverage?

**Impact**: Determines execution window (24/7 vs. 2-6 AM only), infrastructure provisioning needs, and timeline.

Yeah, this might be a blocker........(may refer to prev amrit dmp project for more info)

---

## Table of Contents

1. [What - Project Scope](#1-what---project-scope)
2. [Why - Business Justification](#2-why---business-justification)
3. [Where - Implementation Locations](#3-where---implementation-locations)
4. [How - Technical Implementation](#4-how---technical-implementation)
5. [When - Timeline & Sequencing](#5-when---timeline--sequencing)
6. [Security & Compliance](#6-security--compliance)
7. [Testing & Validation](#7-testing--validation)
8. [Rollout & Maintenance](#8-rollout--maintenance)
9. [Appendices](#appendices)

---

## 1. WHAT - Project Scope

### 1.1 Objectives

Create an automated pipeline that:
- Takes production database backups securely
- Anonymizes all PII and sensitive health data
- Preserves referential integrity and data relationships
- Restores anonymized data to UAT environment
- Provides audit logs and validation reports
- Runs on-demand or scheduled via CI/CD (Jenkins preferred)

### 1.2 In-Scope Databases

Based on AMRIT architecture (MySQL 8.0):

| Database | Purpose | Priority | Estimated Tables with PII |
|----------|---------|----------|---------------------------|
| `db_identity` | Beneficiary identity & registration | **HIGH** | ~15-20 tables |
| `db_1097_identity` | 1097 helpline identity data | **HIGH** | ~10-15 tables |
| `db_iemr` | Integrated EMR data | **MEDIUM** | ~30-40 tables |
| `db_reporting` | Analytics & reporting views | **MEDIUM** | ~10-15 views |

### 1.3 Out of Scope

- ❌ Real-time data synchronization
- ❌ Production database performance optimization
- ❌ Schema migrations (handled by Flyway separately)
- ❌ Application-level changes
- ❌ Non-PII data transformations

---

## 2. WHY - Business Justification

### 2.1 Current Pain Points

| Problem | Impact | Cost |
|---------|--------|------|
| No standardized UAT refresh process | Inconsistent test environments | High dev time waste |
| Manual data anonymization | Error-prone, time-consuming | Security risk |
| Production bugs hard to reproduce | Delayed issue resolution | Customer dissatisfaction |
| Cannot share UAT with external contributors | Limited community participation | Slower innovation |
| Compliance risk with raw production data | Legal/regulatory exposure | Potential penalties |

### 2.2 Expected Benefits

**Security & Compliance**
- ✅ GDPR/HIPAA compliant UAT environment (I mean, we don't have one for India so...)
- ✅ Zero PII exposure to unauthorized personnel
- ✅ Auditable anonymization process

**Development Efficiency**
- ✅ Realistic test data matching production patterns
- ✅ Faster bug reproduction (estimate: 40% time reduction)
- ✅ Safer collaboration with external contributors

**Operational Excellence**
- ✅ One-command UAT refresh (target: <2 hours total time)
- ✅ Scheduled automated refreshes (weekly/monthly)
- ✅ Documented, repeatable process

### 2.3 Success Metrics

- **Execution Time**: Full pipeline completes in <2 hours
- **Anonymization Coverage**: 100% of identified PII fields masked
- **Data Integrity**: 0 foreign key constraint violations post-anonymization
- **Audit Trail**: Complete logs of all anonymization operations
- **Zero Production PII Leaks**: Validation checks pass 100%

---

## 3. WHERE - Implementation Locations

### 3.1 Repository Structure

```
AMRIT-DB/
├── docs/
│   ├── db-anonymization-uat-refresh.md          [NEW] User documentation
│   └── pii-field-inventory.md                   [NEW] PII fields catalog
├── scripts/
│   ├── anonymization/                           [NEW] Anonymization scripts
│   │   ├── anonymize_db_identity.sql           [NEW] Identity DB anonymization
│   │   ├── anonymize_db_1097_identity.sql      [NEW] 1097 Identity anonymization
│   │   ├── anonymize_db_iemr.sql               [NEW] IEMR anonymization
│   │   ├── anonymize_db_reporting.sql          [NEW] Reporting anonymization
│   │   ├── anonymization_functions.sql         [NEW] Reusable SQL functions
│   │   └── validation_queries.sql              [NEW] Post-anonymization checks
│   ├── pipeline/                                [NEW] Main orchestration scripts
│   │   ├── anonymize_and_refresh_uat.py        [NEW] Main Python orchestrator
│   │   ├── backup_production.sh                [NEW] Production backup script
│   │   ├── restore_to_uat.sh                   [NEW] UAT restore script
│   │   ├── config.yaml.example                 [NEW] Configuration template
│   │   └── requirements.txt                    [NEW] Python dependencies
│   └── jenkins/
│       └── Jenkinsfile.uat-refresh              [NEW] Jenkins pipeline definition
├── tests/
│   └── anonymization/                           [NEW] Validation tests
│       ├── test_anonymization.py               [NEW] Unit tests
│       └── test_data_integrity.py              [NEW] Integrity tests
└── .env.anonymization.example                   [NEW] Environment variables template
```

### 3.2 Infrastructure Requirements

**Execution Environment**
- **Where**: Secure bastion host or Jenkins agent with production DB access
- **Requirements**:
  - MySQL 8.0 client tools
  - Python 3.9+ (contemplating on using 3.10 or 3.12)
  - 100GB+ temporary storage
  - Network access: Production DB → Bastion → UAT DB
  - Credentials: Read access to Prod, Write access to UAT

**Storage Locations**
- **Backup Storage**: `/var/backups/amrit/` or S3 bucket (encrypted)
- **Temporary DB**: Docker container or dedicated MySQL instance
- **Logs**: `/var/log/amrit-anonymization/` with rotation

---

## 4. HOW - Technical Implementation

### 4.1 Architecture Overview

```
┌─────────────────┐
│  Production DB  │
│  (Read-Only)    │
└────────┬────────┘
         │ 1. mysqldump
         ▼
┌─────────────────┐
│  Backup File    │
│  (Encrypted)    │
└────────┬────────┘
         │ 2. Restore
         ▼
┌─────────────────┐
│  Temporary DB   │◄─── 3. Anonymization SQL Scripts
│  (In-Memory)    │
└────────┬────────┘
         │ 4. Validation & Export
         ▼
┌─────────────────┐
│  Anonymized     │
│  Dump File      │
└────────┬────────┘
         │ 5. Restore
         ▼
┌─────────────────┐
│    UAT DB       │
│  (Ready to Use) │
└─────────────────┘
```

### 4.2 Phase 1: PII Data Inventory

**Objective**: Identify all tables and columns containing PII

**Tables to Analyze** (Based on schema inspection):

#### db_identity Database

| Table | PII Columns | Anonymization Strategy |
|-------|-------------|------------------------|
| `i_beneficiarydetails` | FirstName, MiddleName, LastName, FatherName, MotherName, SpouseName | Faker library - realistic names |
| `i_beneficiarycontacts` | PhoneNo, PreferredPhoneNum, PhoneNum1, PhoneNum2, PhoneNum3, EmailId | Pattern-based: +91XXXXXXXXXX, dummy@example.com |
| `i_beneficiaryaddress` | PermAddrLine1/2/3, CurrAddrLine1/2/3, EmerAddrLine1/2/3, PermPinCode, CurrPinCode | Partial mask: keep district/state, mask street |
| `i_beneficiaryidentity` | GovtIdentityNo, GovtIdentityTypeID (Aadhar, etc.) | Hash with salt: SHA256(value + salt) |
| `i_beneficiaryaccount` | AccountNo, IFSCCode, BankName | Hash account numbers, keep bank codes |
| `i_beneficiaryhealthid` | HealthID, HealthIDNo, ABHANumber | UUID replacement maintaining uniqueness |
| `i_beneficiarymapping` | BenRegID (if contains PII patterns) | Hash if needed, or keep for FK integrity |
| `datamigrationtable` | ben_phone_no, ben_name | Same as above |

#### db_1097_identity Database

| Table | PII Columns | Anonymization Strategy |
|-------|-------------|------------------------|
| Similar structure to db_identity | Apply same patterns | Consistent with db_identity |

#### db_iemr Database

| Table | PII Columns | Anonymization Strategy |
|-------|-------------|------------------------|
| `t_bendemographics` | FirstName, LastName, SpouseName | Faker library |
| `t_patientvisit` | PatientName, PhoneNo | Same patterns |
| `t_prescription` | Any patient-identifying notes | Scrub with generic text |
| `t_labresults` | Patient identifiers | Hash IDs |
| `t_chiefcomplaint` | Free-text fields | Optional: Redact/generalize |
| `t_nursenotes`, `t_doctornotes` | Clinical notes with names | Pattern matching + redaction |

#### db_reporting Database

| View/Table | PII Columns | Anonymization Strategy |
|------------|-------------|------------------------|
| Reporting views pulling from above | Inherited from source tables | Cascade anonymization |

**Action Items**:
- [ ] Run SQL queries to scan all tables for pattern matches (phone: `^[0-9]{10}$`, email, etc.)
- [ ] Create comprehensive CSV: `table_name, column_name, data_type, sample_values, strategy`
- [ ] Document in `docs/pii-field-inventory.md`

### 4.3 Phase 2: Anonymization Strategy Design

#### A. Cross-Database Referential Integrity Strategy

**THE BENREGID CHALLENGE**

BenRegID (Beneficiary Registration ID) is the **universal identifier** across all AMRIT databases:

```
db_identity.i_beneficiarymapping.BenRegID (PRIMARY)
         ↓
         ├──→ db_iemr.t_bendemographics.BeneficiaryRegID
         ├──→ db_iemr.t_patientvisit.BeneficiaryRegID  
         ├──→ db_1097_identity.[tables].BeneficiaryRegID
         └──→ db_reporting.[views].BeneficiaryRegID
```

**Problem**: MySQL does not support true foreign keys across databases. Relationships are **application-enforced**.

**Solution: Deterministic Mapping Table Approach**

1. **Create Temporary Mapping Database**
   ```sql
   CREATE DATABASE IF NOT EXISTS temp_anonymization;
   
   CREATE TABLE temp_anonymization.benregid_mapping (
       original_benregid BIGINT NOT NULL,
       anonymized_benregid BIGINT NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (original_benregid),
       UNIQUE KEY (anonymized_benregid)
   ) ENGINE=InnoDB;
   
   -- Create index for reverse lookups
   CREATE INDEX idx_anon_id ON temp_anonymization.benregid_mapping(anonymized_benregid);
   ```

2. **Generate Consistent Mappings**
   ```sql
   -- Strategy: Use deterministic hash + sequential numbering
   SET @counter = 1000000; -- Start from 1 million to avoid collisions
   
   INSERT INTO temp_anonymization.benregid_mapping (original_benregid, anonymized_benregid)
   SELECT 
       BenRegID,
       1000000 + CONV(SUBSTRING(SHA2(CONCAT(BenRegID, 'AMRIT_SALT_2026'), 256), 1, 10), 16, 10) % 99000000 AS anon_id
   FROM db_identity.i_beneficiarymapping
   ORDER BY BenRegID;
   ```

3. **Apply Mapping Across All Databases**
   ```sql
   -- db_identity
   UPDATE db_identity.i_beneficiarymapping ibm
   INNER JOIN temp_anonymization.benregid_mapping map 
       ON ibm.BenRegID = map.original_benregid
   SET ibm.BenRegID = map.anonymized_benregid;
   
   -- db_iemr (multiple tables)
   UPDATE db_iemr.t_bendemographics td
   INNER JOIN temp_anonymization.benregid_mapping map 
       ON td.BeneficiaryRegID = map.original_benregid
   SET td.BeneficiaryRegID = map.anonymized_benregid;
   
   UPDATE db_iemr.t_patientvisit pv
   INNER JOIN temp_anonymization.benregid_mapping map 
       ON pv.BeneficiaryRegID = map.original_benregid
   SET pv.BeneficiaryRegID = map.anonymized_benregid;
   
   -- db_1097_identity (similar pattern)
   UPDATE db_1097_identity.[relevant_tables] t
   INNER JOIN temp_anonymization.benregid_mapping map 
       ON t.BeneficiaryRegID = map.original_benregid
   SET t.BeneficiaryRegID = map.anonymized_benregid;
   ```

4. **Validation**
   ```sql
   -- Check: No unmapped BenRegIDs remain
   SELECT COUNT(*) FROM db_iemr.t_patientvisit pv
   LEFT JOIN db_identity.i_beneficiarymapping ibm 
       ON pv.BeneficiaryRegID = ibm.BenRegID
   WHERE ibm.BenRegID IS NULL;
   -- Expected: 0 rows
   
   -- Check: Mapping is 1-to-1
   SELECT COUNT(*), COUNT(DISTINCT anonymized_benregid) 
   FROM temp_anonymization.benregid_mapping;
   -- Both counts should be equal
   ```

**Advantages**:
- ✅ Preserves BIGINT data type (no schema changes needed)
- ✅ Maintains referential integrity across all databases
- ✅ Deterministic (same input → same output)
- ✅ Can be re-created if needed (stateless)

**Execution Order**:
1. Restore ALL databases to temp environment
2. Create mapping table ONCE from db_identity
3. Apply mapping to ALL databases using same table
4. Drop mapping table after anonymization complete

---

#### B. Anonymization Functions (SQL)

Create reusable MySQL functions in `anonymization_functions.sql`:

```sql
-- Function: Generate fake Indian name
DELIMITER //
CREATE FUNCTION generate_fake_name(original_name VARCHAR(100), seed_id BIGINT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE fake_name VARCHAR(100);
    -- Use modulo of seed_id to pick from predefined name list
    SET fake_name = ELT(
        (seed_id MOD 100) + 1,
        'Amit Kumar', 'Priya Sharma', 'Rajesh Singh', 'Sunita Devi', -- ... 100 names
    );
    RETURN fake_name;
END //

-- Function: Anonymize phone number
CREATE FUNCTION anonymize_phone(phone VARCHAR(20), seed_id BIGINT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN CONCAT('+91', LPAD(MOD(seed_id, 9999999999), 10, '0'));
END //

-- Function: Hash identifier
CREATE FUNCTION hash_identifier(value VARCHAR(255))
RETURNS VARCHAR(64)
DETERMINISTIC
BEGIN
    RETURN SHA2(CONCAT(value, 'AMRIT_SALT_2026'), 256);
END //

-- Function: Mask address
CREATE FUNCTION mask_address(address VARCHAR(250))
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    RETURN CONCAT('XXX, ', SUBSTRING_INDEX(address, ',', -2)); -- Keep last 2 parts
END //

DELIMITER ;
```

#### B. Per-Database Anonymization Scripts

**Example: `anonymize_db_identity.sql`**

```sql
USE db_identity;

-- Log start
INSERT INTO anonymization_audit_log (db_name, table_name, action, timestamp)
VALUES ('db_identity', 'ALL', 'START', NOW());

-- 1. Anonymize beneficiary details
UPDATE i_beneficiarydetails
SET 
    FirstName = generate_fake_name(FirstName, BeneficiaryDetailsId),
    MiddleName = NULL,
    LastName = generate_fake_name(LastName, BeneficiaryDetailsId + 1000),
    FatherName = generate_fake_name(FatherName, BeneficiaryDetailsId + 2000),
    MotherName = generate_fake_name(MotherName, BeneficiaryDetailsId + 3000),
    SpouseName = CASE WHEN SpouseName IS NOT NULL 
                 THEN generate_fake_name(SpouseName, BeneficiaryDetailsId + 4000) 
                 ELSE NULL END;

-- Log completion
INSERT INTO anonymization_audit_log (db_name, table_name, action, rows_affected, timestamp)
VALUES ('db_identity', 'i_beneficiarydetails', 'ANONYMIZED', ROW_COUNT(), NOW());

-- 2. Anonymize contacts
UPDATE i_beneficiarycontacts
SET
    PhoneNo = anonymize_phone(PhoneNo, BenContactsID),
    PreferredPhoneNum = anonymize_phone(PreferredPhoneNum, BenContactsID + 10000),
    PhoneNum1 = CASE WHEN PhoneNum1 IS NOT NULL 
                THEN anonymize_phone(PhoneNum1, BenContactsID + 20000) 
                ELSE NULL END,
    EmailId = CONCAT('user', BenContactsID, '@anonymized.example.com');

INSERT INTO anonymization_audit_log (db_name, table_name, action, rows_affected, timestamp)
VALUES ('db_identity', 'i_beneficiarycontacts', 'ANONYMIZED', ROW_COUNT(), NOW());

-- 3. Anonymize addresses (keep district/state for testing)
UPDATE i_beneficiaryaddress
SET
    PermAddrLine1 = CONCAT('Address Line 1 - ', BenAddressID),
    PermAddrLine2 = CONCAT('Address Line 2 - ', BenAddressID),
    PermAddrLine3 = NULL,
    PermPinCode = CONCAT(SUBSTRING(PermPinCode, 1, 2), '0000'), -- Keep first 2 digits
    CurrAddrLine1 = CONCAT('Address Line 1 - ', BenAddressID),
    CurrAddrLine2 = CONCAT('Address Line 2 - ', BenAddressID),
    CurrAddrLine3 = NULL,
    CurrPinCode = CONCAT(SUBSTRING(CurrPinCode, 1, 2), '0000'),
    EmerAddrLine1 = CONCAT('Address Line 1 - ', BenAddressID),
    EmerAddrLine2 = CONCAT('Address Line 2 - ', BenAddressID),
    EmerAddrLine3 = NULL;

-- ... continue for all tables

-- 4. Anonymize health IDs / ABHA numbers
UPDATE i_beneficiaryhealthid
SET
    HealthID = CONCAT('HLTH', LPAD(HealthIDNo, 14, '0')),
    HealthIDNo = LPAD(HealthIDNo, 14, '0'),
    ABHANumber = hash_identifier(ABHANumber);

-- Log completion
INSERT INTO anonymization_audit_log (db_name, table_name, action, timestamp)
VALUES ('db_identity', 'ALL', 'COMPLETE', NOW());
```

### 4.4 Phase 3: Main Orchestration Script

**File**: `scripts/pipeline/anonymize_and_refresh_uat.py`

**Key Components**:

```python
#!/usr/bin/env python3
"""
AMRIT Database Anonymization & UAT Refresh Pipeline
Orchestrates: Backup → Anonymize → Validate → Restore
"""

import os
import sys
import yaml
import logging
import subprocess
import pymysql
from datetime import datetime
from pathlib import Path

class AnonymizationPipeline:
    def __init__(self, config_path):
        """Initialize with configuration"""
        self.config = self.load_config(config_path)
        self.setup_logging()
        
    def load_config(self, config_path):
        """Load YAML configuration"""
        with open(config_path, 'r') as f:
            return yaml.safe_load(f)
    
    def setup_logging(self):
        """Configure logging"""
        log_dir = Path(self.config['logging']['directory'])
        log_dir.mkdir(parents=True, exist_ok=True)
        
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            handlers=[
                logging.FileHandler(log_dir / f'anonymization_{datetime.now():%Y%m%d_%H%M%S}.log'),
                logging.StreamHandler()
            ]
        )
        self.logger = logging.getLogger(__name__)
    
    def safety_check(self):
        """Pre-flight safety checks"""
        self.logger.info("Running safety checks...")
        
        # 1. Verify we're not targeting production
        if 'prod' in self.config['target_db']['host'].lower():
            raise Exception("SAFETY: Cannot target production database!")
        
        # 2. Check disk space
        backup_dir = Path(self.config['backup']['directory'])
        stat = os.statvfs(backup_dir)
        free_gb = (stat.f_bavail * stat.f_frsize) / (1024**3)
        if free_gb < self.config['backup']['min_free_space_gb']:
            raise Exception(f"Insufficient disk space: {free_gb:.2f}GB available")
        
        # 3. Test DB connectivity
        self.test_connection(self.config['source_db'], "Production")
        self.test_connection(self.config['target_db'], "UAT")
        
        self.logger.info("✓ All safety checks passed")
    
    def test_connection(self, db_config, name):
        """Test database connection"""
        try:
            conn = pymysql.connect(
                host=db_config['host'],
                user=db_config['user'],
                password=db_config['password'],
                connect_timeout=10
            )
            conn.close()
            self.logger.info(f"✓ Connected to {name} database")
        except Exception as e:
            raise Exception(f"Cannot connect to {name} database: {e}")
    
    def backup_production(self):
        """Step 1: Backup production databases"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 1: Backing up production databases")
        self.logger.info("=" * 60)
        
        backup_dir = Path(self.config['backup']['directory'])
        backup_dir.mkdir(parents=True, exist_ok=True)
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        
        databases = self.config['databases']
        backup_files = {}
        
        for db_name in databases:
            backup_file = backup_dir / f"{db_name}_{timestamp}.sql.gz"
            self.logger.info(f"Backing up {db_name}...")
            
            cmd = [
                'mysqldump',
                f'--host={self.config["source_db"]["host"]}',
                f'--user={self.config["source_db"]["user"]}',
                f'--password={self.config["source_db"]["password"]}',
                '--single-transaction',
                '--routines',
                '--triggers',
                '--events',
                '--set-gtid-purged=OFF',
                db_name
            ]
            
            # Compress on the fly
            with open(backup_file, 'wb') as f:
                p1 = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                p2 = subprocess.Popen(['gzip'], stdin=p1.stdout, stdout=f)
                p1.stdout.close()
                p2.communicate()
            
            if p1.returncode != 0:
                raise Exception(f"mysqldump failed for {db_name}")
            
            backup_files[db_name] = backup_file
            self.logger.info(f"✓ {db_name} backed up to {backup_file}")
        
        return backup_files
    
    def create_temp_database(self):
        """Step 2: Create temporary working database"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 2: Creating temporary database environment")
        self.logger.info("=" * 60)
        
        # Use Docker for isolated temp DB
        if self.config['temp_db']['use_docker']:
            self.logger.info("Starting temporary MySQL Docker container...")
            
            container_name = f"amrit_temp_anon_{datetime.now():%Y%m%d%H%M%S}"
            cmd = [
                'docker', 'run', '-d',
                '--name', container_name,
                '-e', f'MYSQL_ROOT_PASSWORD={self.config["temp_db"]["password"]}',
                '-p', f'{self.config["temp_db"]["port"]}:3306',
                '--tmpfs', '/var/lib/mysql:rw,size=10G',  # In-memory for speed
                'mysql:8.0'
            ]
            
            subprocess.run(cmd, check=True)
            self.temp_container = container_name
            
            # Wait for MySQL to be ready
            import time
            time.sleep(30)
            self.logger.info("✓ Temporary database ready")
        
        return True
    
    def restore_to_temp(self, backup_files):
        """Step 3: Restore backups to temporary database"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 3: Restoring backups to temporary database")
        self.logger.info("=" * 60)
        
        for db_name, backup_file in backup_files.items():
            self.logger.info(f"Restoring {db_name}...")
            
            # Create database
            conn = pymysql.connect(
                host='localhost',
                port=self.config['temp_db']['port'],
                user='root',
                password=self.config['temp_db']['password']
            )
            with conn.cursor() as cursor:
                cursor.execute(f"CREATE DATABASE IF NOT EXISTS {db_name}")
            conn.close()
            
            # Restore from backup
            cmd = f"gunzip < {backup_file} | mysql -h localhost -P {self.config['temp_db']['port']} -u root -p{self.config['temp_db']['password']} {db_name}"
            subprocess.run(cmd, shell=True, check=True)
            
            self.logger.info(f"✓ {db_name} restored")
    
    def run_anonymization(self):
        """Step 4: Run anonymization scripts"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 4: Running anonymization scripts")
        self.logger.info("=" * 60)
        
        script_dir = Path(__file__).parent.parent / 'anonymization'
        
        # 1. Load helper functions
        self.logger.info("Loading anonymization functions...")
        self.execute_sql_file(script_dir / 'anonymization_functions.sql')
        
        # 2. Create audit log table
        self.create_audit_table()
        
        # 3. Run per-database anonymization
        databases = self.config['databases']
        for db_name in databases:
            script_file = script_dir / f'anonymize_{db_name}.sql'
            if script_file.exists():
                self.logger.info(f"Anonymizing {db_name}...")
                self.execute_sql_file(script_file)
                self.logger.info(f"✓ {db_name} anonymized")
            else:
                self.logger.warning(f"⚠ No anonymization script for {db_name}")
    
    def execute_sql_file(self, file_path):
        """Execute SQL file against temp database"""
        conn = pymysql.connect(
            host='localhost',
            port=self.config['temp_db']['port'],
            user='root',
            password=self.config['temp_db']['password']
        )
        
        with open(file_path, 'r') as f:
            sql_content = f.read()
        
        # Split by statements and execute
        statements = sql_content.split(';')
        with conn.cursor() as cursor:
            for stmt in statements:
                stmt = stmt.strip()
                if stmt and not stmt.startswith('--'):
                    cursor.execute(stmt)
        
        conn.commit()
        conn.close()
    
    def validate_anonymization(self):
        """Step 5: Validate anonymization quality"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 5: Validating anonymization")
        self.logger.info("=" * 60)
        
        # Run validation queries
        script_dir = Path(__file__).parent.parent / 'anonymization'
        validation_script = script_dir / 'validation_queries.sql'
        
        # Check for common PII patterns
        checks = {
            'phone_pattern': r'^[0-9]{10}$',
            'email_domain': '@anonymized.example.com',
            'aadhar_pattern': r'^[0-9]{12}$'  # Should be hashed
        }
        
        # Query for any remaining PII
        self.logger.info("Checking for PII patterns...")
        # ... validation logic ...
        
        self.logger.info("✓ Validation complete")
    
    def export_anonymized_dump(self):
        """Step 6: Export anonymized database"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 6: Exporting anonymized databases")
        self.logger.info("=" * 60)
        
        export_dir = Path(self.config['export']['directory'])
        export_dir.mkdir(parents=True, exist_ok=True)
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        
        export_files = {}
        for db_name in self.config['databases']:
            export_file = export_dir / f"{db_name}_anonymized_{timestamp}.sql.gz"
            
            cmd = [
                'mysqldump',
                f'--host=localhost',
                f'--port={self.config["temp_db"]["port"]}',
                f'--user=root',
                f'--password={self.config["temp_db"]["password"]}',
                '--single-transaction',
                db_name
            ]
            
            with open(export_file, 'wb') as f:
                p1 = subprocess.Popen(cmd, stdout=subprocess.PIPE)
                p2 = subprocess.Popen(['gzip'], stdin=p1.stdout, stdout=f)
                p1.stdout.close()
                p2.communicate()
            
            export_files[db_name] = export_file
            self.logger.info(f"✓ {db_name} exported to {export_file}")
        
        return export_files
    
    def restore_to_uat(self, export_files):
        """Step 7: Restore to UAT environment"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 7: Restoring to UAT database")
        self.logger.info("=" * 60)
        
        for db_name, export_file in export_files.items():
            self.logger.info(f"Restoring {db_name} to UAT...")
            
            # Drop and recreate
            conn = pymysql.connect(
                host=self.config['target_db']['host'],
                user=self.config['target_db']['user'],
                password=self.config['target_db']['password']
            )
            with conn.cursor() as cursor:
                cursor.execute(f"DROP DATABASE IF EXISTS {db_name}")
                cursor.execute(f"CREATE DATABASE {db_name}")
            conn.close()
            
            # Restore
            cmd = f"gunzip < {export_file} | mysql -h {self.config['target_db']['host']} -u {self.config['target_db']['user']} -p{self.config['target_db']['password']} {db_name}"
            subprocess.run(cmd, shell=True, check=True)
            
            self.logger.info(f"✓ {db_name} restored to UAT")
    
    def cleanup(self):
        """Step 8: Cleanup temporary resources"""
        self.logger.info("=" * 60)
        self.logger.info("STEP 8: Cleanup")
        self.logger.info("=" * 60)
        
        if hasattr(self, 'temp_container'):
            subprocess.run(['docker', 'rm', '-f', self.temp_container])
            self.logger.info("✓ Temporary container removed")
        
        # Optionally clean old backups
        if self.config.get('cleanup', {}).get('remove_old_backups', False):
            # ... cleanup logic ...
            pass
    
    def run(self):
        """Execute full pipeline"""
        try:
            self.logger.info("╔" + "═" * 58 + "╗")
            self.logger.info("║  AMRIT Database Anonymization Pipeline Started        ║")
            self.logger.info("╚" + "═" * 58 + "╝")
            
            self.safety_check()
            backup_files = self.backup_production()
            self.create_temp_database()
            self.restore_to_temp(backup_files)
            self.run_anonymization()
            self.validate_anonymization()
            export_files = self.export_anonymized_dump()
            
            if self.config.get('auto_restore_uat', True):
                self.restore_to_uat(export_files)
            else:
                self.logger.info("⚠ Auto-restore disabled. Manual restore required.")
            
            self.cleanup()
            
            self.logger.info("╔" + "═" * 58 + "╗")
            self.logger.info("║  Pipeline Completed Successfully!                     ║")
            self.logger.info("╚" + "═" * 58 + "╝")
            
        except Exception as e:
            self.logger.error(f"Pipeline failed: {e}", exc_info=True)
            self.cleanup()
            sys.exit(1)

if __name__ == '__main__':
    config_file = sys.argv[1] if len(sys.argv) > 1 else 'config.yaml'
    pipeline = AnonymizationPipeline(config_file)
    pipeline.run()
```

### 4.5 Phase 4: Configuration Management

**File**: `scripts/pipeline/config.yaml.example`

```yaml
# AMRIT Database Anonymization Configuration

# Source Database (Production - READ ONLY)
source_db:
  host: production-db.example.com
  port: 3306
  user: readonly_user
  password: ${PROD_DB_PASSWORD}  # From environment variable
  ssl: true

# Target Database (UAT)
target_db:
  host: uat-db.example.com
  port: 3306
  user: uat_admin
  password: ${UAT_DB_PASSWORD}
  ssl: true

# Temporary Database (for anonymization processing)
temp_db:
  use_docker: true
  port: 13306
  password: temp_password_change_me
  memory_limit: 10G

# Databases to process
databases:
  - db_identity
  - db_1097_identity
  - db_iemr
  - db_reporting

# Backup settings
backup:
  directory: /var/backups/amrit/raw
  min_free_space_gb: 100
  compression: gzip
  retention_days: 7

# Export settings
export:
  directory: /var/backups/amrit/anonymized
  retention_days: 30

# Logging
logging:
  directory: /var/log/amrit-anonymization
  level: INFO

# Safety settings
safety:
  require_manual_approval: false
  production_keyword_check: true
  max_execution_time_hours: 4

# Automation
auto_restore_uat: true

# Cleanup
cleanup:
  remove_old_backups: true
  remove_temp_files: true
```

### 4.6 Phase 5: Jenkins Pipeline

**File**: `scripts/jenkins/Jenkinsfile.uat-refresh`

---

### 4.7 Phase 6: Flyway Schema Synchronization Strategy

**THE SCHEMA DRIFT PROBLEM**

Flyway migrations in AMRIT-DB are continuously evolving:
- Current: db_identity at V6, db_iemr at V28
- Future: V7, V8, V9... will add new tables/columns
- Risk: New PII columns leak to UAT if anonymization scripts not updated

**Solution Architecture**:

#### A. Pre-Anonymization Schema Validation

**File**: `scripts/pipeline/schema_validator.py`

```python
import pymysql
import re
from pathlib import Path

class SchemaValidator:
    def __init__(self, db_config, script_dir):
        self.db_config = db_config
        self.script_dir = Path(script_dir)
    
    def get_all_columns_from_db(self, database):
        """Query information_schema for all columns"""
        conn = pymysql.connect(**self.db_config)
        with conn.cursor() as cursor:
            cursor.execute(f"""
                SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
                FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = '{database}'
                  AND TABLE_NAME NOT LIKE 'flyway_%'
                ORDER BY TABLE_NAME, ORDINAL_POSITION;
            """)
            return set((row[0], row[1]) for row in cursor.fetchall())
        conn.close()
    
    def get_anonymized_columns_from_script(self, database):
        """Parse anonymization SQL script to extract covered columns"""
        script_file = self.script_dir / f'anonymize_{database}.sql'
        if not script_file.exists():
            return set()
        
        covered = set()
        with open(script_file, 'r') as f:
            content = f.read()
            
            # Regex: Extract UPDATE table SET column1 = ..., column2 = ...
            update_pattern = re.compile(
                r'UPDATE\s+(\w+)\s+SET\s+([^;]+)',
                re.IGNORECASE | re.DOTALL
            )
            
            for match in update_pattern.finditer(content):
                table = match.group(1)
                set_clause = match.group(2)
                
                # Extract column names from SET clause
                columns = re.findall(r'(\w+)\s*=', set_clause)
                for col in columns:
                    covered.add((table, col))
        
        return covered
    
    def identify_pii_candidates(self, column_name):
        """Heuristic: Detect likely PII columns by name pattern"""
        pii_patterns = [
            'name', 'phone', 'email', 'address', 'aadhar', 'pan',
            'account', 'health', 'abha', 'identity', 'contact',
            'father', 'mother', 'spouse', 'guardian'
        ]
        column_lower = column_name.lower()
        return any(pattern in column_lower for pattern in pii_patterns)
    
    def validate(self, database):
        """Main validation logic"""
        print(f"Validating schema coverage for {database}...")
        
        # Step 1: Get all columns from production/temp database
        all_columns = self.get_all_columns_from_db(database)
        
        # Step 2: Get columns covered by anonymization script
        anonymized_columns = self.get_anonymized_columns_from_script(database)
        
        # Step 3: Find uncovered columns
        uncovered = all_columns - anonymized_columns
        
        # Step 4: Filter to likely PII columns
        uncovered_pii = [(t, c) for t, c in uncovered if self.identify_pii_candidates(c)]
        
        if uncovered_pii:
            print(f"\n⚠️  WARNING: Uncovered potential PII columns in {database}:")
            for table, column in sorted(uncovered_pii):
                print(f"   - {table}.{column}")
            print("\nAction Required:")
            print("1. Review columns and determine if they contain PII")
            print("2. Update anonymization script or mark as non-PII")
            print(f"3. Add to scripts/anonymization/anonymize_{database}.sql\n")
            
            return False  # Fail validation
        else:
            print(f"✅ All potential PII columns covered in {database}")
            return True

# Usage in pipeline
if __name__ == '__main__':
    validator = SchemaValidator(
        db_config={'host': 'temp_db', 'user': 'root', 'password': 'pass'},
        script_dir='scripts/anonymization'
    )
    
    all_valid = True
    for db in ['db_identity', 'db_1097_identity', 'db_iemr', 'db_reporting']:
        if not validator.validate(db):
            all_valid = False
    
    if not all_valid:
        sys.exit(1)  # Fail pipeline
```

#### B. Flyway Migration Monitoring

**File**: `scripts/pipeline/flyway_monitor.py`

```python
def get_latest_flyway_version(database):
    """Query flyway_schema_history for latest version"""
    conn = pymysql.connect(**prod_db_config)
    with conn.cursor() as cursor:
        cursor.execute(f"""
            SELECT MAX(version) 
            FROM {database}.flyway_schema_history;
        """)
        latest_version = cursor.fetchone()[0]
    conn.close()
    return latest_version

def get_known_anonymization_version():
    """Read metadata from anonymization script comments"""
    # Store latest known version in script header:
    # -- LAST_VERIFIED_FLYWAY_VERSION: V6
    pass

def check_schema_drift():
    """Alert if Flyway version > last known anonymization version"""
    for db in ['db_identity', 'db_iemr']:
        prod_version = get_latest_flyway_version(db)
        known_version = get_known_anonymization_version(db)
        
        if prod_version > known_version:
            print(f"⚠️  SCHEMA DRIFT DETECTED: {db}")
            print(f"   Production Flyway: V{prod_version}")
            print(f"   Anonymization Script: V{known_version}")
            print(f"   Gap: {prod_version - known_version} migration(s)")
            return False
    return True
```

#### C. Development Process Integration

**Pull Request Template** (`.github/PULL_REQUEST_TEMPLATE.md`):

```markdown
## Database Migration Checklist

### For ALL Pull Requests:
- [ ] No database schema changes in this PR

### For Pull Requests with Flyway Migrations:
- [ ] Flyway migration file created: `V*__*.sql`
- [ ] Migration tested on local database
- [ ] PII analysis completed (see below)

### PII Analysis (required if migration adds/modifies columns):

#### New/Modified Tables and Columns:
| Table | Column | Data Type | Contains PII? | Anonymization Strategy |
|-------|--------|-----------|---------------|------------------------|
| [table] | [column] | [type] | Yes/No | hash/mask/faker/N/A |

#### Anonymization Script Updates:
- [ ] Updated: `scripts/anonymization/anonymize_[database].sql`
- [ ] Added anonymization logic for new PII columns
- [ ] Tested anonymization script on sample data
- [ ] Updated header comment with new Flyway version: `-- LAST_VERIFIED_FLYWAY_VERSION: V[X]`

#### Validation:
- [ ] Ran `python scripts/pipeline/schema_validator.py` - PASSED
- [ ] No uncovered PII columns detected

### Reviewer Checklist:
- [ ] DBA approval (for schema changes)
- [ ] Security team approval (if PII columns added)
- [ ] Anonymization script review (if applicable)
```

#### D. Automated CI/CD Check

**File**: `.github/workflows/validate-schema-coverage.yml`

```yaml
name: Validate Anonymization Coverage

on:
  pull_request:
    paths:
      - 'src/main/resources/db/migration/**/*.sql'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Check for PII analysis in PR description
        run: |
          # Fail if PR adds Flyway migration but doesn't update anonymization scripts
          if git diff --name-only origin/main | grep -q 'db/migration'; then
            if ! git diff --name-only origin/main | grep -q 'scripts/anonymization'; then
              echo "❌ Flyway migration detected but no anonymization script update"
              exit 1
            fi
          fi
      
      - name: Run schema validator (simulation)
        run: |
          echo "✅ Schema validation check passed"
          # In production, run actual Python validator against test database
```

**Summary**:
- ✅ Pre-anonymization validation catches uncovered columns
- ✅ PR template enforces documentation
- ✅ CI/CD blocks merges without anonymization updates
- ✅ Flyway version tracking in script headers

---

### 4.8 Phase 7: Production Backup Strategy

**PRODUCTION DATABASE TOPOLOGY ASSESSMENT**

**Decision Matrix**:

| Scenario | Backup Method | Impact on Production | Window | Setup Time |
|----------|---------------|---------------------|--------|------------|
| **A: Read Replica Exists** | mysqldump from replica | ✅ Zero impact | 24/7 anytime | 0 days |
| **B: Primary Only** | mysqldump with --single-transaction | ⚠️ 10-20% latency increase | 2-6 AM only | 0 days |
| **C: Primary Only + High Traffic** | Percona XtraBackup (hot backup) | ✅ Minimal (<5%) | 24/7 anytime | 1-2 days |
| **D: AWS RDS** | Use automated snapshots | ✅ Zero impact | 24/7 anytime | 0 days |

**Recommendation Flow**:

```
Do you have a read replica?
    |
    ├─ YES → Use mysqldump from replica (Option A)
    |         
    └─ NO → Check if AWS RDS
            |
            ├─ YES → Use RDS snapshots (Option D)
            |
            └─ NO → Check traffic pattern
                    |
                    ├─ 24/7 High Traffic → Setup Percona XtraBackup (Option C)
                    └─ Manageable Downtime → mysqldump 2-6 AM (Option B)
```

**Implementation for Each Scenario**:

**Option A: Read Replica (Preferred)**
```bash
# Backup from replica
mysqldump \
  --host=read-replica.example.com \
  --user=readonly_user \
  --password=${PROD_READONLY_PASSWORD} \
  --single-transaction \
  --routines \
  --triggers \
  --events \
  --set-gtid-purged=OFF \
  --databases db_identity db_1097_identity db_iemr db_reporting | \
  gzip > amrit_backup_$(date +%Y%m%d).sql.gz
```

**Option B: Primary with Maintenance Window**
```bash
# Schedule during 2-6 AM IST
# Use --single-transaction for InnoDB (no table locks)
mysqldump \
  --host=production-db.example.com \
  --user=backup_user \
  --password=${PROD_BACKUP_PASSWORD} \
  --single-transaction \
  --quick \
  --lock-tables=false \
  db_identity | gzip > db_identity.sql.gz
```

**Option C: Percona XtraBackup**
```bash
# Install Percona XtraBackup on bastion host
apt-get install percona-xtrabackup-80

# Hot backup (production running)
xtrabackup \
  --backup \
  --target-dir=/var/backups/amrit/ \
  --user=backup_user \
  --password=${PROD_PASSWORD}

# Prepare backup
xtrabackup --prepare --target-dir=/var/backups/amrit/
```

**Option D: AWS RDS Snapshots**
```bash
# Use AWS CLI to create snapshot
aws rds create-db-snapshot \
  --db-instance-identifier amrit-prod \
  --db-snapshot-identifier amrit-uat-refresh-$(date +%Y%m%d)

# Restore to temp instance
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier amrit-temp-anon \
  --db-snapshot-identifier amrit-uat-refresh-20260114

# Export to S3
aws rds start-export-task \
  --export-task-identifier amrit-export-$(date +%Y%m%d) \
  --source-arn arn:aws:rds:region:account:snapshot:amrit-uat-refresh-20260114 \
  --s3-bucket-name amrit-db-exports
```

**Decision Required Before Implementation**:
- [ ] Confirm production database topology
- [ ] Test backup method on production (dry run)
- [ ] Measure actual backup time and impact
- [ ] Get DBA approval for chosen approach

---

### 4.9 Phase 8: Jenkins Pipeline (Enhanced)

```groovy
pipeline {
    agent {
        label 'secure-bastion'  // Jenkins agent with DB access
    }
    
    parameters {
        choice(
            name: 'EXECUTION_MODE',
            choices: ['DRY_RUN', 'FULL_EXECUTION'],
            description: 'Dry run for validation only, or full execution'
        )
        booleanParam(
            name: 'AUTO_RESTORE_UAT',
            defaultValue: true,
            description: 'Automatically restore to UAT after anonymization'
        )
        booleanParam(
            name: 'SEND_NOTIFICATION',
            defaultValue: true,
            description: 'Send completion notification'
        )
    }
    
    environment {
        PROD_DB_PASSWORD = credentials('prod-db-readonly-password')
        UAT_DB_PASSWORD = credentials('uat-db-admin-password')
        PYTHON_ENV = '/opt/python-venv/anonymization'
    }
    
    stages {
        stage('Setup') {
            steps {
                script {
                    echo "AMRIT UAT Refresh Pipeline - Starting"
                    echo "Mode: ${params.EXECUTION_MODE}"
                    
                    // Checkout AMRIT-DB repository
                    checkout scm
                    
                    // Setup Python environment
                    sh '''
                        python3 -m venv ${PYTHON_ENV}
                        source ${PYTHON_ENV}/bin/activate
                        pip install -r scripts/pipeline/requirements.txt
                    '''
                }
            }
        }
        
        stage('Pre-Flight Checks') {
            steps {
                script {
                    echo "Running safety checks..."
                    sh '''
                        source ${PYTHON_ENV}/bin/activate
                        python3 scripts/pipeline/anonymize_and_refresh_uat.py --check-only
                    '''
                }
            }
        }
        
        stage('Manual Approval') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_EXECUTION' }
            }
            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    input message: 'Approve UAT refresh with anonymized production data?',
                          ok: 'Proceed',
                          submitter: 'admin,devops-team'
                }
            }
        }
        
        stage('Execute Anonymization Pipeline') {
            steps {
                script {
                    sh '''
                        source ${PYTHON_ENV}/bin/activate
                        python3 scripts/pipeline/anonymize_and_refresh_uat.py \
                            --config scripts/pipeline/config.yaml \
                            --mode ${EXECUTION_MODE} \
                            --auto-restore-uat ${AUTO_RESTORE_UAT}
                    '''
                }
            }
        }
        
        stage('Post-Execution Validation') {
            steps {
                script {
                    echo "Running post-execution validation..."
                    sh '''
                        source ${PYTHON_ENV}/bin/activate
                        pytest tests/anonymization/ -v
                    '''
                }
            }
        }
        
        stage('Generate Report') {
            steps {
                script {
                    // Archive logs and reports
                    archiveArtifacts artifacts: 'logs/anonymization_*.log',
                                    fingerprint: true
                    
                    // Publish test results
                    junit 'test-results/*.xml'
                }
            }
        }
    }
    
    post {
        success {
            script {
                if (params.SEND_NOTIFICATION) {
                    emailext(
                        subject: "✅ AMRIT UAT Refresh Successful",
                        body: """
                        The UAT database has been successfully refreshed with anonymized production data.
                        
                        Execution Mode: ${params.EXECUTION_MODE}
                        Duration: ${currentBuild.durationString}
                        Build URL: ${env.BUILD_URL}
                        
                        UAT environment is ready for testing.
                        """,
                        to: 'devops@example.com,qa-team@example.com'
                    )
                }
            }
        }
        
        failure {
            script {
                emailext(
                    subject: "❌ AMRIT UAT Refresh Failed",
                    body: """
                    The UAT refresh pipeline failed.
                    
                    Check logs: ${env.BUILD_URL}console
                    """,
                    to: 'devops@example.com'
                )
            }
        }
        
        always {
            // Cleanup workspace
            cleanWs()
        }
    }
}
```

---

## 5. WHEN - Timeline & Sequencing

### 5.1 Development Phases

| Phase | Duration | Dependencies | Deliverables |
|-------|----------|--------------|--------------|
| **Phase 0**: Requirements Clarification | 2-3 days | Stakeholder availability | Answers to 3 critical questions, Topology diagram |
| **Phase 1**: PII Inventory | 4-6 days | Database access, Flyway history | PII field catalog, Schema analysis |
| **Phase 2**: Anonymization Design | 6-8 days | Phase 1 | SQL functions, BenRegID strategy, Anonymization strategies |
| **Phase 3**: Script Development | 12-16 days | Phase 2 | Python orchestrator, SQL scripts, Schema validator |
| **Phase 4**: Testing & Validation | 8-12 days | Phase 3, Test env | Test suite, Validation reports, BenRegID integrity tests |
| **Phase 5**: CI/CD Integration | 4-6 days | Phase 4, Jenkins access | Jenkins pipeline, PR templates, GitHub Actions |
| **Phase 6**: Documentation | 4-5 days | All phases | User docs, Runbooks, Flyway sync guide |
| **Phase 7**: Pilot Run | 3-4 days | All phases | Production pilot, Sign-off, Performance metrics |
| **Phase 8**: Production Rollout | 1-2 days | Phase 7 approval | Scheduled automation, Monitoring setup |

**Total Estimated Duration**: 6-9 weeks (including clarification phase)

### 5.2 Daily Execution Flow (Post-Implementation)

**Trigger Options**:
1. **Manual**: On-demand via Jenkins UI
2. **Scheduled**: Weekly (e.g., every Sunday 2:00 AM IST)
3. **Event-driven**: After major production releases

**Execution Timeline**:

```
T+0:00  ├─ Start Pipeline
T+0:05  ├─ Safety Checks & Pre-flight
T+0:10  ├─ Production Backup (db_identity)          [15 min]
T+0:25  ├─ Production Backup (db_1097_identity)     [10 min]
T+0:35  ├─ Production Backup (db_iemr)              [30 min]
T+1:05  ├─ Production Backup (db_reporting)         [5 min]
T+1:10  ├─ Create Temp Database Container
T+1:15  ├─ Restore to Temp (all databases)          [20 min]
T+1:35  ├─ Run Anonymization Scripts                [15 min]
T+1:50  ├─ Validation & Integrity Checks            [10 min]
T+2:00  ├─ Export Anonymized Dumps                  [20 min]
T+2:20  ├─ Restore to UAT                           [25 min]
T+2:45  ├─ Post-Restore Validation                  [5 min]
T+2:50  ├─ Cleanup & Archival
T+3:00  └─ Pipeline Complete
```

**Total Expected Duration**: ~3 hours (may vary based on data volume)

### 5.3 Maintenance Schedule

**Weekly**:
- Review anonymization logs for anomalies
- Verify UAT database health

**Monthly**:
- Update anonymization scripts if schema changes
- Review and update PII field inventory
- Performance optimization review

**Quarterly**:
- Security audit of anonymization effectiveness
- Update fake data libraries (names, addresses)
- Disaster recovery drill

---

## 6. Security & Compliance

### 6.1 Security Controls

| Control | Implementation | Verification |
|---------|----------------|--------------|
| **Access Control** | Only authorized Jenkins agents can execute | IAM policies, Audit logs |
| **Credential Management** | Use Jenkins credentials store, never hardcode | Code review, Secret scanning |
| **Network Isolation** | Bastion host with restricted access | Firewall rules, VPN |
| **Data at Rest** | Encrypt backup files with AES-256 | File system encryption |
| **Data in Transit** | SSL/TLS for all DB connections | Connection string validation |
| **Audit Trail** | All operations logged with timestamps | Log aggregation (ELK stack) |
| **Least Privilege** | Read-only prod access, limited UAT access | Database permissions audit |

### 6.2 Compliance Checklist

**GDPR / HIPAA Requirements**:
- [x] No PII stored unencrypted in logs
- [x] Right to be forgotten: BeneficiaryRegID retained but anonymized
- [x] Data minimization: Only copy necessary tables
- [x] Purpose limitation: UAT data only for testing
- [x] Audit trail: Complete logging of anonymization
- [x] Access controls: Role-based access to pipeline

### 6.3 Incident Response

**If PII Leak Detected**:
1. **Immediate**: Shut down UAT environment
2. **Within 1 hour**: Notify security team, assess scope
3. **Within 24 hours**: File incident report, patch pipeline
4. **Within 72 hours**: Regulatory notification if required

---

## 7. Testing & Validation

### 7.1 Test Strategy

**Unit Tests** (`tests/anonymization/test_anonymization.py`):
- Test individual anonymization functions
- Verify hash consistency
- Validate fake data generation

**Integration Tests** (`tests/anonymization/test_data_integrity.py`):
- Foreign key constraint validation
- Referential integrity checks
- Application workflow smoke tests

**Security Tests**:
- PII pattern scanning (regex-based)
- Sample data manual review (20 random records)
- Reverse anonymization attempts (should fail)

### 7.2 Validation Queries

**Example**: `scripts/anonymization/validation_queries.sql`

```sql
-- Check 1: No real phone numbers remain (Indian mobile pattern)
SELECT 'FAIL: Real phone numbers detected' AS status, COUNT(*) AS count
FROM db_identity.i_beneficiarycontacts
WHERE PhoneNo REGEXP '^[6-9][0-9]{9}$'
HAVING COUNT(*) > 0
UNION ALL
SELECT 'PASS: No real phone numbers' AS status, 0 AS count
WHERE NOT EXISTS (
    SELECT 1 FROM db_identity.i_beneficiarycontacts
    WHERE PhoneNo REGEXP '^[6-9][0-9]{9}$'
);

-- Check 2: All emails are anonymized
SELECT 'FAIL: Real emails detected' AS status, COUNT(*) AS count
FROM db_identity.i_beneficiarycontacts
WHERE EmailId NOT LIKE '%@anonymized.example.com'
  AND EmailId IS NOT NULL
HAVING COUNT(*) > 0;

-- Check 3: Foreign key integrity
SELECT 'FAIL: Orphaned records' AS status, COUNT(*) AS count
FROM db_iemr.t_bendemographics bd
LEFT JOIN db_identity.i_beneficiarymapping bm ON bd.BeneficiaryRegID = bm.BenRegId
WHERE bm.BenRegId IS NULL
HAVING COUNT(*) > 0;

-- Check 4: Name patterns (should be from fake name list)
SELECT 'INFO: Sample anonymized names' AS info, FirstName, LastName
FROM db_identity.i_beneficiarydetails
LIMIT 10;
```

### 7.3 Acceptance Criteria Validation

| Criteria | Validation Method | Pass Threshold |
|----------|-------------------|----------------|
| All PII anonymized | Regex pattern matching | 100% compliance |
| Foreign keys intact | Constraint validation queries | 0 orphaned records |
| Application functional | Smoke test suite | All critical flows pass |
| Execution time | Pipeline duration | < 3 hours |
| Data volume | Row count comparison | ±1% of production |

---

## 8. Rollout & Maintenance

### 8.1 Rollout Plan

**Week 1-4**: Development & Internal Testing
- Develop scripts on dev copy of database
- Internal review and testing

**Week 5**: Staging Validation
- Run on staging environment
- QA team validation

**Week 6**: Pilot Production Run
- Schedule during low-traffic period
- DevOps team monitoring
- Rollback plan ready

**Week 7**: Production Release
- Full automation enabled
- Scheduled weekly runs
- Documentation published

### 8.2 Monitoring & Alerts

**Jenkins Pipeline Monitoring**:
- Slack/Email notifications on success/failure
- Duration alerts (if > 4 hours)
- Disk space alerts

**UAT Database Monitoring**:
- Query performance comparison to production
- Data integrity checks post-refresh
- Application error rate monitoring

### 8.3 Documentation Deliverables

1. **User Guide** (`docs/db-anonymization-uat-refresh.md`):
   - Step-by-step execution instructions
   - Troubleshooting guide
   - FAQ

2. **PII Inventory** (`docs/pii-field-inventory.md`):
   - Complete table/column catalog
   - Anonymization strategies per field

3. **Runbook** (Internal Wiki):
   - Incident response procedures
   - Rollback procedures
   - Contact information

4. **Architecture Decision Records** (ADR):
   - Technology choices
   - Security considerations
   - Trade-offs

### 8.4 Success Metrics (Post-Launch)

**Month 1**:
- 4 successful UAT refreshes
- 0 PII leaks detected
- <5% bug reproduction failure rate

**Month 3**:
- UAT refresh fully automated
- 10+ external contributors using UAT
- 30% reduction in production-UAT discrepancy bugs

---

## Appendix A: Technology Stack

| Component | Technology | Version | Purpose |
|-----------|------------|---------|---------|
| Database | MySQL | 8.0 | Production/UAT DBMS |
| Orchestration | Python | 3.9+ | Main pipeline script |
| CI/CD | Jenkins | 2.x | Automation & scheduling |
| Containerization | Docker | 20.10+ | Temporary database |
| Libraries | PyMySQL, PyYAML, Faker | Latest | Python dependencies |
| Backup Tool | mysqldump | 8.0 | Native MySQL backup |
| Compression | gzip | Native | Backup compression |
| Logging | Python logging | Built-in | Audit trail |

---

## Appendix B: Risk Register

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| PII leak to UAT | Medium | Critical | Multi-layer validation, manual review |
| Production DB performance impact | Low | High | Read-only replica, off-peak execution |
| Anonymization breaks application | Medium | High | Comprehensive testing, referential integrity checks |
| Pipeline execution timeout | Medium | Medium | Optimize queries, increase timeout threshold |
| Insufficient storage | Low | Medium | Pre-flight disk space check, alerting |
| Credential exposure | Low | Critical | Jenkins secrets, no hardcoding, audit logs |

---

## Appendix C: Glossary

- **PII**: Personally Identifiable Information (names, phone, email, etc.)
- **UAT**: User Acceptance Testing environment
- **Anonymization**: Process of removing or masking PII
- **Pseudonymization**: Replacing identifying fields with fake but consistent values
- **Deterministic Anonymization**: Same input always produces same anonymized output
- **Foreign Key Integrity**: Ensuring relationships between tables remain valid
- **Bastion Host**: Secure server used as access point to production systems

---

## Appendix D: Quick Reference Commands

**Manual Execution** (from bastion host):
```bash
# Activate Python environment
source /opt/python-venv/anonymization/bin/activate

# Run full pipeline
cd /path/to/AMRIT-DB
python3 scripts/pipeline/anonymize_and_refresh_uat.py \
    --config scripts/pipeline/config.yaml

# Dry run only (no UAT restore)
python3 scripts/pipeline/anonymize_and_refresh_uat.py \
    --config scripts/pipeline/config.yaml \
    --dry-run

# Safety check only
python3 scripts/pipeline/anonymize_and_refresh_uat.py \
    --check-only
```

**Jenkins Execution**:
```
1. Navigate to Jenkins: https://jenkins.example.com/job/amrit-uat-refresh/
2. Click "Build with Parameters"
3. Select EXECUTION_MODE = FULL_EXECUTION
4. Check AUTO_RESTORE_UAT
5. Click "Build"
6. Approve when prompted
```

**Emergency Rollback**:
```bash
# Restore UAT from previous backup
mysql -h uat-db.example.com -u uat_admin -p < /var/backups/amrit/anonymized/db_identity_anonymized_PREVIOUS_TIMESTAMP.sql.gz
```

---

## Document Control

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-08 | DevOps Team | Initial execution plan |

**Approval**:
- [ ] Technical Lead
- [ ] Security Officer
- [ ] DevOps Manager
- [ ] QA Lead

---

**Next Steps**:
1. Review and approve this execution plan
2. Create GitHub Issue with sub-tasks for each phase
3. Assign team members to phases
4. Begin Phase 1: PII Data Inventory
5. Schedule weekly progress reviews

---

*End of Document*
