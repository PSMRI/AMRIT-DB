# AMRIT-DB Reference Guide

**Version**: 1.0  
**Last Updated**: January 14, 2026  
**Purpose**: Comprehensive technical reference for AMRIT-DB structure, components, and architecture

---

## Table of Contents

1. [Overview](#1-overview)
2. [Technology Stack](#2-technology-stack)
3. [Project Structure](#3-project-structure)
4. [Database Architecture](#4-database-architecture)
5. [Flyway Migration System](#5-flyway-migration-system)
6. [Configuration Management](#6-configuration-management)
7. [Build & Deployment](#7-build--deployment)
8. [Key Components](#8-key-components)
9. [Database Schema Summary](#9-database-schema-summary)
10. [Cross-Database Relationships](#10-cross-database-relationships)
11. [Development Workflow](#11-development-workflow)
12. [Reference Tables](#12-reference-tables)

---

## 1. Overview

### 1.1 What is AMRIT-DB?

**AMRIT-DB** is the database schema management service for the AMRIT (Accessible Medical Records via Integrated Technologies) healthcare platform. It serves as the **single source of truth** for database schema definitions, migrations, and version control.

**Core Responsibilities**:
- ✅ **Schema Management**: Define and maintain database schemas for all AMRIT modules
- ✅ **Version Control**: Track schema changes via Flyway versioned migrations
- ✅ **Database Initialization**: Automated setup of databases from scratch
- ✅ **Migration Orchestration**: Apply schema updates across environments (dev, test, UAT, production)
- ✅ **Multi-Database Support**: Manage 4 separate databases simultaneously

### 1.2 Purpose in AMRIT Ecosystem

```
┌─────────────────────────────────────────────────────────────┐
│                    AMRIT Application Layer                  │
│  (Identity Service, EMR Service, Helpline, Reporting, etc.) │
└──────────────────────┬──────────────────────────────────────┘
                       │ Uses
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                      AMRIT-DB Service                        │
│  • Schema Definitions (DDL)                                 │
│  • Migration Scripts (Flyway)                               │
│  • Version Control (Git)                                    │
└──────────────────────┬──────────────────────────────────────┘
                       │ Manages
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                   MySQL 8.0 Databases                       │
│  ┌─────────────────┬─────────────────┬──────────────────┐  │
│  │  db_identity    │ db_1097_identity│    db_iemr       │  │
│  │  (Patient IDs)  │  (Helpline)     │ (Medical Records)│  │
│  └─────────────────┴─────────────────┴──────────────────┘  │
│  ┌─────────────────┐                                        │
│  │  db_reporting   │                                        │
│  │  (Analytics)    │                                        │
│  └─────────────────┘                                        │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Technology Stack

| Component | Technology | Version | Purpose |
|-----------|------------|---------|---------|
| **Language** | Java | 17 | Application runtime |
| **Framework** | Spring Boot | 3.3.2 | Application framework |
| **ORM** | Spring Data JPA / Hibernate | 6.x | Object-relational mapping |
| **Database** | MySQL | 8.0+ | Relational database |
| **Migration Tool** | Flyway | 9.x | Schema versioning & migration |
| **Build Tool** | Maven | 3.8+ | Dependency management & build |
| **Packaging** | WAR | 1.0.0 | Web application archive |
| **Server** | JBoss/WildFly | 26+ | Application server (deployment target) |

### 2.1 Key Dependencies

```xml
<!-- Core Spring Boot -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>

<!-- Flyway Migration -->
<dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-core</artifactId>
</dependency>
<dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-mysql</artifactId>
</dependency>

<!-- MySQL Driver -->
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <!-- Version: 8.3.0 (managed by Spring Boot) -->
</dependency>
```

---

## 3. Project Structure

### 3.1 Directory Layout

```
AMRIT-DB/
├── .github/                          GitHub workflows & CI/CD
│   └── workflows/
│       ├── build-on-pull-request.yml   PR validation
│       ├── pacakage.yml                Build & package workflow
│       └── sast.yml                    Security scanning
│
├── .mvn/                             Maven wrapper configuration
│   └── wrapper/
│
├── docs/                             📚 Documentation
│   ├── db-anonymization-uat-refresh-execution-plan.md
│   └── amrit-db-reference-guide.md (THIS FILE)
│
├── src/
│   ├── main/
│   │   ├── java/com/db/piramalswasthya/
│   │   │   ├── AmritDbApplication.java      Spring Boot main class
│   │   │   ├── ServletInitializer.java      WAR deployment initializer
│   │   │   ├── config/                      🔧 Configuration classes
│   │   │   │   ├── DataSourceConfig.java    Multi-database configuration
│   │   │   │   └── FlywayConfig.java        Flyway setup per database
│   │   │   ├── controller/                  REST endpoints (if any)
│   │   │   ├── data/                        Entity classes (if any)
│   │   │   └── service/                     Business logic (minimal)
│   │   │
│   │   ├── resources/
│   │   │   ├── application.properties       Main configuration file
│   │   │   │
│   │   │   └── db/migration/                🗂️ FLYWAY MIGRATION SCRIPTS
│   │   │       ├── dbidentity/              Identity & Registration DB
│   │   │       │   ├── V1__DB_IDENTITY.sql            [1595 lines] Base schema
│   │   │       │   ├── V2__ADD_FACE_EMBEDDING.sql     Biometric features
│   │   │       │   ├── V3__DB_IDENTITY.sql            Additional tables
│   │   │       │   ├── V4__FLW_ECD.sql                Frontline worker data
│   │   │       │   ├── V5__FLW_BENEFICARY_DEATH.sql   Death records
│   │   │       │   └── V6__identity_performanceindexchanges.sql
│   │   │       │
│   │   │       ├── db1097identity/          1097 Helpline DB
│   │   │       │   ├── V1__DB_1097_IDENTITY.sql
│   │   │       │   └── V2__ADD_FACE_EMBEDDING.sql
│   │   │       │
│   │   │       ├── dbiemr/                  EMR (Electronic Medical Records) DB
│   │   │       │   ├── V1__DB_IEMR.sql               [47000+ lines] Base schema
│   │   │       │   ├── V2__Performance_changes.sql
│   │   │       │   ├── V3__TM_Datasync.sql
│   │   │       │   ├── V4__Beneficiary_Image.sql
│   │   │       │   ├── V5__Ivrs_Outbound.sql
│   │   │       │   ├── V6__m_ProviderServiceAddMapping.sql
│   │   │       │   ├── V7__IEMR_MMU.sql
│   │   │       │   ├── ...
│   │   │       │   └── V28__AMM1959_DHIS_USER.sql    [Latest]
│   │   │       │
│   │   │       └── dbreporting/             Reporting & Analytics DB
│   │   │           ├── V1__DB_REPORTING.sql
│   │   │           └── V2__DB_REPORTING.sql
│   │   │
│   │   ├── environment/                    🌍 Environment-specific configs
│   │   │   ├── common_local.properties     Local development
│   │   │   ├── common_test.properties      Test environment
│   │   │   ├── common_ci.properties        CI/CD environment
│   │   │   └── common_example.properties   Template for new environments
│   │   │
│   │   └── webapp/WEB-INF/                JBoss deployment descriptors
│   │       ├── jboss-deployment-structure.xml
│   │       └── jboss-web.xml
│   │
│   └── test/java/                          Unit & integration tests
│
├── target/                                 Build output (gitignored)
│   ├── Amrit-DB-1.0.0.war                 Deployable artifact
│   └── classes/                           Compiled classes
│
├── pom.xml                                Maven project configuration
├── mvnw, mvnw.cmd                         Maven wrapper scripts
├── README.md                              Project documentation
├── LICENSE                                Apache 2.0 License
├── CODE_OF_CONDUCT.md                     Contributor guidelines
└── CONTRIBUTING.md                        Contribution guide
```

### 3.2 Key Files Reference

| File Path | Purpose | When to Modify |
|-----------|---------|----------------|
| `pom.xml` | Maven dependencies, build config | Adding new dependencies, version upgrades |
| `src/main/resources/application.properties` | Database connections, Flyway config | Setting up new environment |
| `src/main/java/.../config/DataSourceConfig.java` | Multi-DB datasource setup | Adding new database |
| `src/main/resources/db/migration/dbidentity/V*` | Identity DB migrations | Schema changes for patient registration |
| `src/main/resources/db/migration/dbiemr/V*` | EMR DB migrations | Clinical data schema changes |
| `src/main/environment/common_*.properties` | Environment overrides | Deploying to new environment |

---

## 4. Database Architecture

### 4.1 Multi-Database Design

AMRIT uses a **multi-database architecture** with functional separation:

```
┌─────────────────────────────────────────────────────────────┐
│                     AMRIT Platform                          │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
┌────────────────┐    ┌──────────────┐    ┌─────────────────┐
│  db_identity   │    │db_1097_...   │    │    db_iemr      │
│                │    │              │    │                 │
│ • Beneficiary  │    │• Call Center │    │• Consultations  │
│   Registration │    │  Interactions│    │• Prescriptions  │
│ • Demographics │    │• Helpline    │    │• Lab Results    │
│ • Contacts     │    │  Queries     │    │• Diagnoses      │
│ • Addresses    │    │              │    │• Visit Records  │
│ • Health IDs   │    │              │    │                 │
└────────┬───────┘    └──────┬───────┘    └────────┬────────┘
         │                   │                     │
         └───────────────────┼─────────────────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  db_reporting   │
                    │                 │
                    │• Aggregate Views│
                    │• KPI Dashboards │
                    │• Analytics      │
                    └─────────────────┘
```

### 4.2 Database Purposes

#### **db_identity** (Core Identity Management)
- **Purpose**: Single source of truth for beneficiary identity
- **Key Tables**: 
  - `i_beneficiarydetails` - Names, DOB, Gender
  - `i_beneficiarycontacts` - Phone, Email
  - `i_beneficiaryaddress` - Residential addresses
  - `i_beneficiaryidentity` - Govt IDs (Aadhar, etc.)
  - `i_beneficiaryhealthid` - ABHA, Health IDs
  - `i_beneficiarymapping` - Links to other systems
- **Primary Key**: `BenRegID` (Beneficiary Registration ID)
- **Data Sensitivity**: 🔴 **VERY HIGH** - Contains all PII

#### **db_1097_identity** (Helpline System)
- **Purpose**: 1097 National Health Helpline data
- **Key Tables**: Similar to db_identity but for helpline callers
- **Primary Key**: `BeneficiaryRegID` (links to db_identity)
- **Data Sensitivity**: 🔴 **HIGH** - Call logs, caller information

#### **db_iemr** (Electronic Medical Records)
- **Purpose**: Clinical and medical data
- **Key Tables**:
  - `t_bendemographics` - Demographics snapshot at visit
  - `t_patientvisit` - Visit records
  - `t_prescription` - Medication prescriptions
  - `t_labresults` - Lab test results
  - `t_chiefcomplaint` - Chief complaints
  - `t_nursenotes`, `t_doctornotes` - Clinical notes
  - `t_benflow` - Patient workflow tracking
- **Foreign Keys**: References `db_identity.i_beneficiarymapping.BenRegID`
- **Data Sensitivity**: 🔴 **CRITICAL** - Protected Health Information (PHI)

#### **db_reporting** (Analytics & Reporting)
- **Purpose**: Aggregated views and reports
- **Structure**: Primarily views/stored procedures referencing above DBs
- **Data Sensitivity**: 🟡 **MEDIUM** - Aggregated/anonymized data

### 4.3 Cross-Database Relationships

**Critical**: MySQL does not support true foreign keys across databases, so referential integrity is **application-enforced**.

```sql
-- Example: Cross-database relationship
-- db_identity.i_beneficiarymapping.BenRegID 
--   ↓ (application-level FK)
-- db_iemr.t_bendemographics.BeneficiaryRegID

-- Query example:
SELECT 
    i.FirstName, i.LastName,
    v.VisitDateTime, v.VisitCode
FROM db_identity.i_beneficiarydetails i
INNER JOIN db_identity.i_beneficiarymapping m 
    ON i.BeneficiaryDetailsID = m.BenDetailsId
INNER JOIN db_iemr.t_patientvisit v 
    ON m.BenRegID = v.BeneficiaryRegID
WHERE v.VisitDateTime > '2026-01-01';
```

**Implication for Anonymization**:
- Must maintain `BenRegID` consistency across all databases
- Option 1: Keep BenRegID unchanged (linking key)
- Option 2: Apply deterministic hashing to BenRegID in ALL databases
- Option 3: Create mapping table during anonymization

---

## 5. Flyway Migration System

### 5.1 Flyway Overview

**Flyway** is a version control system for databases. AMRIT-DB uses Flyway to:
- ✅ Track schema changes via versioned SQL scripts
- ✅ Apply migrations in correct order automatically
- ✅ Prevent accidental schema overwrites
- ✅ Enable rollback-safe deployments

### 5.2 Migration Naming Convention

```
V<VERSION>__<DESCRIPTION>.sql

Examples:
✅ V1__DB_IDENTITY.sql                   - Initial schema
✅ V2__ADD_FACE_EMBEDDING.sql            - Add biometric column
✅ V3__DB_IDENTITY.sql                   - Additional tables
✅ V28__AMM1959_DHIS_USER.sql            - Ticket-based change

❌ V1.1__update.sql                      - Invalid (use V2, not V1.1)
❌ add_column.sql                        - Invalid (missing V prefix)
```

**Naming Rules**:
- Prefix: `V` (uppercase, mandatory)
- Version: Integer (1, 2, 3...) - no decimals
- Separator: `__` (double underscore)
- Description: CamelCase or snake_case, alphanumeric + underscores

### 5.3 Flyway Configuration

**Location**: `src/main/resources/application.properties`

```properties
# Flyway Configuration
spring.flyway.locations=classpath:db/migration
spring.flyway.validateMigrationNaming=true
spring.flyway.enabled=true
spring.flyway.baseline-on-migrate=true
spring.flyway.migrate=true

logging.level.org.flywaydb=DEBUG
```

**Key Settings**:
- `locations`: Where to find migration scripts (subdirectories: dbidentity, db1097identity, dbiemr, dbreporting)
- `validateMigrationNaming`: Enforce naming conventions
- `baseline-on-migrate`: Allow Flyway on existing non-empty databases
- `migrate`: Automatically run pending migrations on startup

### 5.4 How Flyway Tracks Migrations

Flyway creates a metadata table in each database:

```sql
-- Table: flyway_schema_history (created automatically)
SELECT * FROM db_identity.flyway_schema_history;

+-----------+---------+---------------------------+--------+-------------+-------------+
| installed_rank | version | description      | type   | script                     | checksum    |
+----------------+---------+------------------+--------+----------------------------+-------------+
| 1              | 1       | DB IDENTITY      | SQL    | V1__DB_IDENTITY.sql        | 123456789   |
| 2              | 2       | ADD FACE EMBEDDING| SQL   | V2__ADD_FACE_EMBEDDING.sql | 987654321   |
+----------------+---------+------------------+--------+----------------------------+-------------+
```

**Important**:
- ⚠️ **NEVER** modify already-applied migrations (checksum validation will fail)
- ⚠️ **ALWAYS** create new V* files for schema changes
- ✅ Flyway applies migrations in order: V1 → V2 → V3 → ...

### 5.5 Migration Workflow

```
Developer creates:
   V29__ADD_ANONYMIZATION_AUDIT_LOG.sql
         ↓
Git commit & push
         ↓
Deploy AMRIT-DB service
         ↓
Spring Boot starts
         ↓
Flyway detects new migration (V29 not in flyway_schema_history)
         ↓
Executes V29__ADD_ANONYMIZATION_AUDIT_LOG.sql
         ↓
Inserts V29 into flyway_schema_history
         ↓
✅ Migration complete
```

### 5.6 Current Migration Status

| Database | Latest Version | Total Migrations | Last Updated |
|----------|---------------|------------------|--------------|
| db_identity | V6 | 6 files | V6__identity_performanceindexchanges.sql |
| db_1097_identity | V2 | 2 files | V2__ADD_FACE_EMBEDDING.sql |
| db_iemr | V28 | 28 files | V28__AMM1959_DHIS_USER.sql |
| db_reporting | V2 | 2 files | V2__DB_REPORTING.sql |

---

## 6. Configuration Management

### 6.1 Multi-Environment Strategy

AMRIT-DB supports multiple environments through property file substitution:

```
┌──────────────────────────────────────────────────────────┐
│  src/main/environment/                                   │
│  ├── common_local.properties    ← Local development     │
│  ├── common_test.properties     ← QA/Test environment   │
│  ├── common_ci.properties       ← CI/CD pipelines       │
│  └── common_example.properties  ← Template for new envs │
└──────────────────────────────────────────────────────────┘
                     ↓ (Maven build)
                     ↓ ENV_VAR=local
                     ↓
┌──────────────────────────────────────────────────────────┐
│  target/classes/application.properties (runtime config) │
└──────────────────────────────────────────────────────────┘
```

**Build Command**:
```bash
# Build for local environment
mvn clean package -DENV_VAR=local

# Build for test environment
mvn clean package -DENV_VAR=test

# Build for CI environment
mvn clean package -DENV_VAR=ci
```

### 6.2 Database Connection Configuration

**File**: `src/main/resources/application.properties`

```properties
# Database: db_identity
spring.datasource.dbidentity.url=jdbc:mysql://localhost:3306/db_identity?useSSL=false
spring.datasource.dbidentity.username=amrit_user
spring.datasource.dbidentity.password=changeme
spring.datasource.dbidentity.driver-class-name=com.mysql.cj.jdbc.Driver

# Database: db_1097_identity
spring.datasource.db1097identity.url=jdbc:mysql://localhost:3306/db_1097_identity?useSSL=false
spring.datasource.db1097identity.username=amrit_user
spring.datasource.db1097identity.password=changeme
spring.datasource.db1097identity.driver-class-name=com.mysql.cj.jdbc.Driver

# Database: db_iemr
spring.datasource.dbiemr.url=jdbc:mysql://localhost:3306/db_iemr?useSSL=false
spring.datasource.dbiemr.username=amrit_user
spring.datasource.dbiemr.password=changeme
spring.datasource.dbiemr.driver-class-name=com.mysql.cj.jdbc.Driver

# Database: db_reporting
spring.datasource.dbreporting.url=jdbc:mysql://localhost:3306/db_reporting?useSSL=false
spring.datasource.dbreporting.username=amrit_user
spring.datasource.dbreporting.password=changeme
spring.datasource.dbreporting.driver-class-name=com.mysql.cj.jdbc.Driver
```

### 6.3 Connection Pool Settings

```properties
# Tomcat JDBC Connection Pool
spring.datasource.tomcat.initial-size=5        # Initial connections
spring.datasource.tomcat.max-active=30         # Max active connections
spring.datasource.tomcat.max-idle=15           # Max idle connections
spring.datasource.tomcat.min-idle=5            # Min idle connections
spring.datasource.tomcat.remove-abandoned=true # Remove abandoned connections
spring.datasource.tomcat.remove-abandoned-timeout=600  # 10 minutes
```

**Recommendation for UAT Refresh**:
- Use separate read-only credentials for production backup
- Ensure connection pool settings don't overwhelm production

---

## 7. Build & Deployment

### 7.1 Build Lifecycle

```bash
# 1. Clean previous builds
mvn clean

# 2. Compile Java code
mvn compile

# 3. Run tests
mvn test

# 4. Package as WAR
mvn package -DENV_VAR=test

# 5. Output
ls target/Amrit-DB-1.0.0.war
```

### 7.2 Deployment Process

**Target Server**: JBoss/WildFly Application Server

**Deployment Steps**:
1. Copy `Amrit-DB-1.0.0.war` to JBoss deployments folder
2. JBoss auto-deploys the WAR
3. Spring Boot application starts
4. Flyway runs pending migrations
5. Application ready

**Manual Deployment**:
```bash
# Copy to JBoss
cp target/Amrit-DB-1.0.0.war /opt/jboss/standalone/deployments/

# Check logs
tail -f /opt/jboss/standalone/log/server.log
```

### 7.3 CI/CD Pipelines

Located in `.github/workflows/`:

**1. build-on-pull-request.yml**
- Trigger: On Pull Request to main branch
- Actions: Compile, test, build WAR
- Purpose: Validate PR before merge

**2. pacakage.yml** (sic - typo in filename)
- Trigger: Manual or on release tag
- Actions: Build, package, create GitHub release
- Purpose: Create deployable artifacts

**3. sast.yml**
- Trigger: On push to main
- Actions: Static Application Security Testing
- Purpose: Detect security vulnerabilities

---

## 8. Key Components

### 8.1 Main Application Class

**File**: `src/main/java/com/db/piramalswasthya/AmritDbApplication.java`

```java
@SpringBootApplication
public class AmritDbApplication {
    public static void main(String[] args) {
        SpringApplication.run(AmritDbApplication.class, args);
    }
}
```

### 8.2 WAR Deployment Initializer

**File**: `src/main/java/com/db/piramalswasthya/ServletInitializer.java`

```java
public class ServletInitializer extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AmritDbApplication.class);
    }
}
```

### 8.3 Multi-DataSource Configuration

**File**: `src/main/java/com/db/piramalswasthya/config/DataSourceConfig.java`

Configures 4 separate datasources:
- `dbIdentityDataSource()`
- `db1097IdentityDataSource()`
- `dbIemrDataSource()`
- `dbReportingDataSource()`

Each datasource gets its own:
- Connection pool
- EntityManagerFactory
- TransactionManager

### 8.4 Flyway Configuration Per Database

**File**: `src/main/java/com/db/piramalswasthya/config/FlywayConfig.java`

Creates 4 Flyway instances pointing to subdirectories:
- `classpath:db/migration/dbidentity`
- `classpath:db/migration/db1097identity`
- `classpath:db/migration/dbiemr`
- `classpath:db/migration/dbreporting`

---

## 9. Database Schema Summary

### 9.1 db_identity Key Tables

| Table Name | Primary Key | Purpose | PII Fields |
|------------|-------------|---------|------------|
| `i_beneficiarydetails` | BeneficiaryDetailsId | Core beneficiary info | FirstName, LastName, DOB, Gender |
| `i_beneficiarycontacts` | BenContactsID | Contact information | PhoneNo, EmailId |
| `i_beneficiaryaddress` | BenAddressID | Residential addresses | Address lines, PinCode |
| `i_beneficiaryidentity` | BenIdentityId | Government IDs | Aadhar, Voter ID, PAN |
| `i_beneficiaryaccount` | BenAccountID | Bank account info | AccountNo, IFSCCode |
| `i_beneficiaryhealthid` | HealthIDNo | ABHA Health IDs | HealthID, ABHANumber |
| `i_beneficiarymapping` | BenMapId | Cross-system linking | **BenRegID** (critical FK) |
| `datamigrationtable` | - | Legacy data migration | ben_phone_no, ben_name |

**Estimated Row Count** (Production): 5-10 million beneficiaries

### 9.2 db_iemr Key Tables (Subset)

| Table Name | Primary Key | Purpose | PII Fields |
|------------|-------------|---------|------------|
| `t_bendemographics` | BenDemographicsID | Demographics at visit | FirstName, LastName |
| `t_patientvisit` | VisitCode | Visit records | PatientName, PhoneNo |
| `t_prescription` | PrescriptionID | Prescriptions | Notes (may contain names) |
| `t_labresults` | LabResultID | Lab test results | Patient identifiers |
| `t_chiefcomplaint` | ID | Chief complaints | Free-text (may contain PII) |
| `t_nursenotes` | ID | Nursing notes | Free-text clinical notes |
| `t_doctornotes` | ID | Doctor notes | Free-text clinical notes |
| `t_benflow` | BenFlowID | Workflow tracking | Links to visits |

**Estimated Row Count** (Production): 50-100 million records (visits, prescriptions, etc.)

### 9.3 Schema Inspection Query

```sql
-- Get all tables in a database
SELECT 
    TABLE_NAME, 
    TABLE_ROWS, 
    DATA_LENGTH, 
    INDEX_LENGTH,
    ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024, 2) AS 'Size_MB'
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'db_identity'
ORDER BY (DATA_LENGTH + INDEX_LENGTH) DESC;

-- Get columns for a specific table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    COLUMN_KEY,
    COLUMN_COMMENT
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'db_identity' 
  AND TABLE_NAME = 'i_beneficiarydetails'
ORDER BY ORDINAL_POSITION;
```

---

## 10. Cross-Database Relationships

### 10.1 The BenRegID Problem

**Critical Understanding**: `BenRegID` is the **universal identifier** across all AMRIT databases.

```
db_identity.i_beneficiarymapping.BenRegID (Primary)
             ↓
             ├─→ db_iemr.t_bendemographics.BeneficiaryRegID
             ├─→ db_iemr.t_patientvisit.BeneficiaryRegID
             ├─→ db_1097_identity.[tables].BeneficiaryRegID
             └─→ db_reporting.[views].BeneficiaryRegID
```

**Anonymization Implications**:

1. **Option A: Keep BenRegID Unchanged**
   - ✅ Maintains referential integrity automatically
   - ❌ BenRegID itself might encode information (sequential IDs can leak registration timing)
   - ❌ If BenRegID is ever exposed with PII, can be linked

2. **Option B: Hash BenRegID Deterministically**
   ```sql
   -- Apply to ALL databases
   UPDATE db_identity.i_beneficiarymapping
   SET BenRegID = SHA2(CONCAT(BenRegID, 'SALT'), 256);
   
   UPDATE db_iemr.t_patientvisit
   SET BeneficiaryRegID = SHA2(CONCAT(BeneficiaryRegID, 'SALT'), 256);
   ```
   - ✅ Breaks linkage to original IDs
   - ✅ Maintains cross-database relationships (same hash)
   - ❌ Hash output is 64 characters, but BenRegID is BIGINT - **data type mismatch**
   - ❌ Would require schema change

3. **Option C: Create Mapping Table**
   ```sql
   CREATE TABLE temp_anonymization.benregid_mapping (
       original_benregid BIGINT,
       anonymized_benregid BIGINT,
       PRIMARY KEY (original_benregid)
   );
   
   -- Generate new sequential IDs
   INSERT INTO temp_anonymization.benregid_mapping
   SELECT BenRegID, @row_num := @row_num + 1
   FROM db_identity.i_beneficiarymapping
   CROSS JOIN (SELECT @row_num := 1000000) r;
   ```
   - ✅ Preserves data types
   - ✅ Maintains referential integrity
   - ❌ More complex to apply across all tables

**Recommendation**: Use Option C (mapping table) for production implementation.

### 10.2 Flyway Schema Sync Challenge

**Problem Statement**:
- Flyway migrations are version-controlled and applied sequentially
- New migrations (e.g., V7__ADD_COLUMN.sql) are added to `src/main/resources/db/migration/dbidentity/`
- If V7 is deployed to production but anonymization scripts are not updated, new column leaks PII to UAT

**Solution Strategy**:

1. **Pre-Migration Validation Hook**
   ```python
   # In anonymization pipeline
   def validate_schema_coverage(self):
       """Check if all columns are covered by anonymization scripts"""
       for db_name in self.config['databases']:
           # Query information_schema for all columns
           columns = self.get_all_columns(db_name)
           
           # Load anonymization script and extract UPDATE statements
           anon_script = self.parse_anonymization_script(db_name)
           covered_columns = anon_script.get_updated_columns()
           
           # Find columns not in anonymization script
           missing = set(columns) - set(covered_columns)
           
           if missing:
               raise Exception(f"Uncovered columns in {db_name}: {missing}")
   ```

2. **Flyway Callback Integration**
   - Register Flyway callback to trigger validation after migration
   - Auto-generate stub anonymization rules for new columns

3. **Documentation Requirement**
   - **POLICY**: Every Flyway migration adding PII columns MUST include:
     - Comment indicating PII status
     - Companion anonymization script update
     - Pull request template enforcing this

**Example PR Template**:
```markdown
## Database Migration Checklist

- [ ] Flyway migration file created (V*__*.sql)
- [ ] PII columns identified (list below)
- [ ] Anonymization scripts updated in `scripts/anonymization/`
- [ ] Migration tested on test database
- [ ] Anonymization tested with new schema

### PII Columns Added (if any):
- Table: [table_name], Column: [column_name], Strategy: [hash/mask/faker]
```

---

## 11. Development Workflow

### 11.1 Adding a New Database Migration

**Scenario**: Add new column `MiddleName` to `i_beneficiarydetails`

**Steps**:

1. **Create Migration Script**
   ```bash
   # File: src/main/resources/db/migration/dbidentity/V7__ADD_MIDDLE_NAME.sql
   
   USE db_identity;
   
   ALTER TABLE i_beneficiarydetails 
   ADD COLUMN MiddleName VARCHAR(50) NULL COMMENT 'PII: Middle name' 
   AFTER FirstName;
   
   -- Add index if needed
   CREATE INDEX idx_middlename ON i_beneficiarydetails(MiddleName);
   ```

2. **Update Anonymization Script**
   ```bash
   # File: scripts/anonymization/anonymize_db_identity.sql
   
   -- Update existing anonymization logic
   UPDATE i_beneficiarydetails
   SET 
       FirstName = generate_fake_name(FirstName, BeneficiaryDetailsId),
       MiddleName = generate_fake_name(MiddleName, BeneficiaryDetailsId + 5000), -- NEW
       LastName = generate_fake_name(LastName, BeneficiaryDetailsId + 1000);
   ```

3. **Test Locally**
   ```bash
   # Build and deploy
   mvn clean package -DENV_VAR=local
   
   # Deploy WAR to JBoss
   cp target/Amrit-DB-1.0.0.war /opt/jboss/standalone/deployments/
   
   # Verify migration applied
   mysql -u root -p -e "SELECT * FROM db_identity.flyway_schema_history WHERE version = 7;"
   ```

4. **Git Commit & Push**
   ```bash
   git add src/main/resources/db/migration/dbidentity/V7__ADD_MIDDLE_NAME.sql
   git add scripts/anonymization/anonymize_db_identity.sql
   git commit -m "feat(db): Add MiddleName column to i_beneficiarydetails"
   git push origin feature/add-middle-name
   ```

5. **Create Pull Request**
   - Fill out PII checklist in PR template
   - Request review from DBA and security team

### 11.2 Local Development Setup

**Prerequisites**:
- MySQL 8.0 installed locally
- Java 17 JDK
- Maven 3.8+
- IDE (IntelliJ IDEA / Eclipse)

**Setup Steps**:

```bash
# 1. Clone repository
git clone https://github.com/PSMRI/AMRIT-DB.git
cd AMRIT-DB

# 2. Create local databases
mysql -u root -p <<EOF
CREATE DATABASE db_identity;
CREATE DATABASE db_1097_identity;
CREATE DATABASE db_iemr;
CREATE DATABASE db_reporting;

CREATE USER 'amrit_user'@'localhost' IDENTIFIED BY 'changeme';
GRANT ALL PRIVILEGES ON db_identity.* TO 'amrit_user'@'localhost';
GRANT ALL PRIVILEGES ON db_1097_identity.* TO 'amrit_user'@'localhost';
GRANT ALL PRIVILEGES ON db_iemr.* TO 'amrit_user'@'localhost';
GRANT ALL PRIVILEGES ON db_reporting.* TO 'amrit_user'@'localhost';
FLUSH PRIVILEGES;
EOF

# 3. Configure application.properties
cp src/main/environment/common_example.properties src/main/environment/common_local.properties

# Edit common_local.properties with your MySQL credentials

# 4. Build and run
mvn clean package -DENV_VAR=local
mvn spring-boot:run

# 5. Verify Flyway migrations applied
mysql -u amrit_user -pchangeme -e "SELECT version, description FROM db_identity.flyway_schema_history;"
```

---

## 12. Reference Tables

### 12.1 Flyway Version History

| Database | Version | File | Description | Lines | Date Added |
|----------|---------|------|-------------|-------|------------|
| db_identity | V1 | V1__DB_IDENTITY.sql | Initial schema | 1595 | Baseline |
| db_identity | V2 | V2__ADD_FACE_EMBEDDING.sql | Biometric column | ~50 | 2024 |
| db_identity | V3 | V3__DB_IDENTITY.sql | Additional tables | ~500 | 2024 |
| db_identity | V4 | V4__FLW_ECD.sql | Frontline worker data | ~200 | 2024 |
| db_identity | V5 | V5__FLW_BENEFICARY_DEATH.sql | Death records | ~100 | 2025 |
| db_identity | V6 | V6__identity_performanceindexchanges.sql | Indexes | ~80 | 2025 |
| db_iemr | V1 | V1__DB_IEMR.sql | Initial EMR schema | 47000+ | Baseline |
| db_iemr | V2-V28 | Various | Incremental changes | Varies | 2024-2025 |

### 12.2 PII Field Categories

| Category | Fields | Anonymization Method | Priority |
|----------|--------|----------------------|----------|
| **Names** | FirstName, LastName, FatherName, MotherName | Faker library (Indian names) | Critical |
| **Contact** | PhoneNo, EmailId | Pattern-based (+91XXXXXXXXXX) | Critical |
| **Address** | AddrLine1/2/3, PinCode | Partial masking (keep state/district) | High |
| **Gov ID** | Aadhar, VoterID, PAN | SHA256 hash with salt | Critical |
| **Financial** | AccountNo, IFSCCode | Hash account, keep IFSC pattern | High |
| **Health ID** | HealthID, ABHANumber | UUID replacement | Critical |
| **Clinical Notes** | t_nursenotes, t_doctornotes | Regex-based name redaction | High |

### 12.3 Estimated Data Volumes (Production)

| Database | Tables | Estimated Rows | Disk Size | Backup Time (mysqldump) |
|----------|--------|---------------|-----------|------------------------|
| db_identity | ~20 | 10 million | 2-5 GB | 15-20 min |
| db_1097_identity | ~15 | 5 million | 1-3 GB | 10-15 min |
| db_iemr | ~150 | 100 million | 50-100 GB | 60-90 min |
| db_reporting | ~30 views | (references above) | 1-2 GB | 5-10 min |
| **TOTAL** | | | **55-110 GB** | **90-135 min** |

**Note**: These are estimates; actual values depend on deployment scale.

---

## 13. Quick Reference Commands

### 13.1 Database Inspection

```sql
-- List all databases
SHOW DATABASES;

-- Get table count per database
SELECT 
    TABLE_SCHEMA, 
    COUNT(*) AS table_count 
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA IN ('db_identity', 'db_1097_identity', 'db_iemr', 'db_reporting')
GROUP BY TABLE_SCHEMA;

-- Get columns with "phone" in name (PII hunting)
SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    COLUMN_NAME, 
    DATA_TYPE 
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA IN ('db_identity', 'db_iemr') 
  AND (COLUMN_NAME LIKE '%phone%' OR COLUMN_NAME LIKE '%email%' OR COLUMN_NAME LIKE '%name%')
ORDER BY TABLE_SCHEMA, TABLE_NAME, ORDINAL_POSITION;

-- Check foreign key relationships (within same DB)
SELECT 
    CONSTRAINT_NAME, 
    TABLE_NAME, 
    COLUMN_NAME, 
    REFERENCED_TABLE_NAME, 
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'db_identity' 
  AND REFERENCED_TABLE_NAME IS NOT NULL;
```

### 13.2 Flyway Commands

```bash
# Check Flyway migration history
mysql -u amrit_user -p db_identity -e "SELECT * FROM flyway_schema_history ORDER BY installed_rank;"

# Manually trigger Flyway migration (if not auto-running)
mvn flyway:migrate -Dflyway.url=jdbc:mysql://localhost:3306/db_identity

# Repair Flyway metadata (if checksums fail)
mvn flyway:repair -Dflyway.url=jdbc:mysql://localhost:3306/db_identity

# Baseline existing database (for initial Flyway setup)
mvn flyway:baseline -Dflyway.url=jdbc:mysql://localhost:3306/db_identity
```

### 13.3 Build & Deploy Commands

```bash
# Clean build
mvn clean package -DENV_VAR=test

# Skip tests (faster build)
mvn clean package -DskipTests -DENV_VAR=test

# Run specific test
mvn test -Dtest=AmritDbApplicationTests

# Generate dependency tree
mvn dependency:tree > dependencies.txt

# Check for security vulnerabilities
mvn verify -Psecurity
```

---

## 14. Troubleshooting

### 14.1 Common Issues

**Issue**: Flyway migration fails with checksum mismatch

```
Error: Validate failed: Migration checksum mismatch for migration version 3
```

**Solution**:
```bash
# Option 1: Repair metadata (if you're sure the file is correct)
mvn flyway:repair -Dflyway.url=jdbc:mysql://localhost/db_identity

# Option 2: Investigate what changed
git diff src/main/resources/db/migration/dbidentity/V3__DB_IDENTITY.sql
```

---

**Issue**: Cannot connect to database

```
Error: Communications link failure
```

**Solution**:
```bash
# Check MySQL is running
systemctl status mysql

# Test connection manually
mysql -h localhost -u amrit_user -pchangeme -e "SELECT 1;"

# Check application.properties has correct credentials
cat src/main/environment/common_local.properties | grep password
```

---

**Issue**: WAR deployment fails on JBoss

```
Error: ClassNotFoundException: com.mysql.cj.jdbc.Driver
```

**Solution**:
- Ensure MySQL connector is in `pom.xml` dependencies
- Check JBoss modules configuration in `webapp/WEB-INF/jboss-deployment-structure.xml`
- Rebuild WAR: `mvn clean package`

---

## 15. Security Considerations

### 15.1 Credentials Management

**⚠️ NEVER commit credentials to Git**

- Use environment variables: `${DB_PASSWORD}`
- Use encrypted properties files
- Rotate credentials regularly

### 15.2 Access Control

| Environment | Access Level | Who |
|-------------|--------------|-----|
| Production DB | Read-Only | Anonymization pipeline, Monitoring tools |
| Production DB | Read-Write | DBAs only, Change management process |
| UAT DB | Read-Write | Developers, QA, Anonymization pipeline |
| Dev DB | Full | Developers |

### 15.3 Audit Logging

All schema changes should be logged:
- Flyway tracks migrations in `flyway_schema_history`
- Git tracks SQL file changes
- Database audit logs (enable MySQL audit plugin)

---

## 16. Next Steps & Resources

### 16.1 For Anonymization Project

Before implementation, clarify:
1. ✅ Production database topology (read replica available?)
2. ✅ Actual data volumes (run sizing queries)
3. ✅ Flyway sync strategy (schema change notification process)
4. ✅ Cross-database FK handling (BenRegID mapping approach)
5. ✅ UAT refresh schedule (maintenance window constraints)

### 16.2 Documentation

- AMRIT GitHub: https://github.com/PSMRI/AMRIT-DB
- Spring Boot Docs: https://spring.io/projects/spring-boot
- Flyway Docs: https://flywaydb.org/documentation/
- MySQL 8.0 Ref: https://dev.mysql.com/doc/refman/8.0/en/

---

## Document Control

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-14 | Development Team | Initial reference guide |

---

**Quick Links**:
- [Back to Anonymization Execution Plan](db-anonymization-uat-refresh-execution-plan.md)
- [GitHub Issues](https://github.com/PSMRI/AMRIT-DB/issues)

---

*End of Reference Guide*
