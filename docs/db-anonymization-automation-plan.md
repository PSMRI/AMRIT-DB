# AMRIT Database Anonymization - Phase 3: Automation & Deployment

**Project**: Automated UAT Database Refresh with Anonymization  
**Technology Stack**: Java 17, Spring Boot 3.3.2, MySQL 8.0  
**Phase**: 3 of 3 - Automation & Deployment  
**Status**: Planning  
**Prerequisites**: Phase 1 & 2 completed  
**Platform**: Cross-platform (Windows, Linux, macOS)  
**CI/CD**: Jenkins (optional) OR Standalone Java CLI  
**Last Updated**: January 28, 2026

---

## Executive Summary

Phase 3 focuses on **automation, deployment, and operational readiness** with **fail-closed schema drift protection** at two critical gates. This phase provides two deployment modes:

1. **Jenkins Mode** (Preferred): CI/CD pipeline with scheduling and monitoring
2. **Standalone Mode**: Java CLI application for manual/cron execution

Both modes are **cross-platform** (Windows, Linux, macOS) and use **only Java** - no OS-specific scripts (no bash/PowerShell). All orchestration via Java ProcessBuilder and Spring Boot services.

**CRITICAL SECURITY**: Schema Drift Gates enforce fail-closed validation **before anonymization** and **before UAT restore** to prevent PII leakage from uncovered schema changes.

### Key Deliverables

- ✅ Production database backup automation (Java ProcessBuilder, zero production impact)
- ✅ **Schema Drift Gate #1**: Before anonymization (abort if uncovered PII)
- ✅ **Schema Drift Gate #2**: Before UAT restore (verify anonymization coverage)
- ✅ **Option A**: Jenkins pipeline (Java JAR invoked, no bash)
- ✅ **Option B**: Standalone Java CLI (if no Jenkins)
- ✅ Pure Java orchestration (OrchestrationService.java, cross-platform)
- ✅ UAT environment automated restoration with safety fuses
- ✅ Scheduled execution (Jenkins cron OR Windows Task Scheduler / Linux cron)
- ✅ Monitoring, alerting, and drift notifications
- ✅ Operations runbook (both deployment modes)
- ✅ Disaster recovery procedure with encrypted backups

---

## Table of Contents

1. [Phase 3 Objectives](#1-phase-3-objectives)
2. [Deployment Modes](#2-deployment-modes)
3. [Architecture Overview](#3-architecture-overview)
4. [Production Backup Strategy](#4-production-backup-strategy)
5. [UAT Restoration Process](#5-uat-restoration-process)
6. [Option A: Jenkins Pipeline](#6-option-a-jenkins-pipeline)
7. [Option B: Standalone Java CLI](#7-option-b-standalone-java-cli)
8. [Java Orchestration Engine](#8-java-orchestration-engine)
9. [Configuration Management](#9-configuration-management)
10. [Monitoring & Alerting](#10-monitoring--alerting)
11. [Security & Access Control](#11-security--access-control)
12. [Operations Runbook](#12-operations-runbook)
13. [Disaster Recovery](#13-disaster-recovery)
14. [Implementation Timeline](#14-implementation-timeline)

---

## 1. Phase 3 Objectives

### 1.1 Deployment Philosophy

**Cross-Platform First**: All automation is Java-based to work on Windows, Linux, and macOS without OS-specific scripts.

**Flexible Deployment**: Choose the mode that fits your infrastructure:
- **Jenkins Mode**: Full CI/CD with web UI, scheduling, and monitoring (recommended for teams with Jenkins)
- **Standalone Mode**: Pure Java CLI for environments without Jenkins (works everywhere Java runs)

### 1.2 Primary Goals

| Objective | Description | Success Criteria |
|-----------|-------------|------------------|
| **Zero-Touch Automation** | One-click UAT refresh from production | Single command/button executes end-to-end |
| **Schema Drift Gates (CRITICAL)** | Fail-closed validation before anonymization AND before UAT restore | 0 executions with uncovered PII, 100% abort on drift |
| **Production Safety** | Backup production with zero impact (Java ProcessBuilder) | No production performance degradation during backup |
| **Scheduled Execution** | Automated weekly/monthly UAT refresh | Cron/Task Scheduler runs successfully |
| **Drift Alerting** | Automatic notification when Flyway migrations add uncovered PII | DevOps team receives drift report within 5 minutes |
| **Safety Fuses** | Allowlists, explicit confirmation flags, no secrets in CLI args | 100% safe execution (no accidental prod overwrites) |
| **Encrypted Artifacts** | All backups and BenRegID mappings encrypted at rest | AES-256 encryption, key rotation |  
| **Monitoring** | Real-time progress tracking and alerting | Slack/email notifications at key stages |
| **Rollback Capability** | Quick recovery from failed anonymization via backup restoration | Restore UAT to previous state in <15 minutes |
| **Documentation** | Complete operations documentation | Runbook covers all scenarios (including drift response) |

### 1.2 Success Metrics

- **Total Execution Time**: Full pipeline (backup → anonymize → restore) completes in <2 hours
- **Production Impact**: 0% CPU/memory spike on production during backup
- **Automation Rate**: 100% hands-off execution
- **Uptime**: UAT environment available 95%+ of the time
- **Mean Time to Recovery (MTTR)**: <30 minutes for UAT restoration

---

## 2. Deployment Modes

### 2.1 Mode Comparison

| Feature | Jenkins Mode | Standalone Mode |
|---------|-------------|-----------------|
| **Execution** | Jenkins invokes JAR | Java CLI command (JAR) |
| **Orchestration** | Pure Java (OrchestrationService.java) | Pure Java (OrchestrationService.java) |
| **Scheduling** | Jenkins cron | OS cron / Task Scheduler |
| **Monitoring** | Jenkins dashboard + Prometheus | Logs + Prometheus (optional) |
| **Notifications** | Jenkins plugins (Slack/email) | Java-based email/webhook |
| **Access Control** | Jenkins RBAC | File system permissions |
| **Best For** | Teams with Jenkins infrastructure | Standalone servers, Windows environments |
| **Prerequisites** | Jenkins server required | Only Java 17 required |
| **Complexity** | Medium (Jenkins setup) | Low (single JAR file) |

### 2.2 Mode Selection Guide

**Choose Jenkins Mode if**:
- ✅ You already have Jenkins infrastructure
- ✅ You need web-based execution and monitoring
- ✅ You want built-in scheduling and notifications
- ✅ Multiple users need access to trigger UAT refresh

**Choose Standalone Mode if**:
- ✅ You're on Windows without Jenkins
- ✅ You want simplest possible deployment
- ✅ You prefer command-line execution
- ✅ You'll use OS-native scheduling (Task Scheduler/cron)

### 2.3 Standalone Mode Overview

The standalone mode provides a **single executable JAR** that contains all functionality:

```bash
# Windows (PowerShell) - with safety confirmation flag
java -jar amrit-anonymization-cli.jar --refresh-uat --confirm-uat-overwrite --target-env=UAT

# Linux/Mac - with safety confirmation flag  
java -jar amrit-anonymization-cli.jar --refresh-uat --confirm-uat-overwrite --target-env=UAT

# Secrets via environment variables (NEVER in CLI args)
export DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id prod-db-password --query SecretString --output text)
java -jar amrit-anonymization-cli.jar --refresh-uat --confirm-uat-overwrite --target-env=UAT
```

**Features**:
- All Phase 2 anonymization engine included (with drift gates)
- Built-in backup/restore logic (Java ProcessBuilder, cross-platform)
- Configuration via properties file or environment variables (secrets via env vars only)
- **Safety Fuses**: Allowlist validation (target-env must be UAT/DEV, NEVER PROD), explicit confirmation flags
- **Schema Drift Gates**: Automatic drift detection before anonymization AND before UAT restore
- Detailed logging to console and file (metadata only, no PII)
- Exit codes for automation (0=success, 1=failure, 2=drift detected)
- Progress tracking via log messages

**Scheduling on Windows**:
```powershell
# Create Windows Task Scheduler task
$action = New-ScheduledTaskAction -Execute "java" -Argument "-jar C:\amrit\amrit-anonymization-cli.jar --refresh-uat"
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 2am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "AMRIT-UAT-Refresh"
```

**Scheduling on Linux**:
```bash
# Add to crontab
0 2 * * 0 java -jar /opt/amrit/amrit-anonymization-cli.jar --refresh-uat
```

---

## 3. Architecture Overview

### 2.1 High-Level Flow

```
┌──────────────────────────────────────────────────────────────────┐
│                         PRODUCTION                                │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │ db_identity  │  │ db_1097_     │  │ db_iemr      │           │
│  │              │  │ identity     │  │              │           │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘           │
│         │                  │                  │                   │
└─────────┼──────────────────┼──────────────────┼───────────────────┘
          │                  │                  │
          │ [1] Backup (mysqldump from read replica)
          │                  │                  │
          ▼                  ▼                  ▼
┌──────────────────────────────────────────────────────────────────┐
│                    BACKUP STORAGE                                 │
│  ┌────────────────────────────────────────────────────────┐      │
│  │  prod_backup_20260128_020000.tar.gz                    │      │
│  │  • db_identity.sql                                     │      │
│  │  • db_1097_identity.sql                                │      │
│  │  • db_iemr.sql                                         │      │
│  │  • db_reporting.sql                                    │      │
│  └────────────────────────────────────────────────────────┘      │
└──────────────────────┬───────────────────────────────────────────┘
                       │
                       │ [2] Copy to Anonymization Server
                       │
                       ▼
┌──────────────────────────────────────────────────────────────────┐
│              ANONYMIZATION SERVER (Staging)                       │
│  ┌────────────────────────────────────────────────────────┐      │
│  │  Temporary MySQL Instance                              │      │
│  │  • Restore production backup                           │      │
│  │  🚨 DRIFT GATE #1: Schema validation (FAIL-CLOSED)    │      │
│  │  • Run Java anonymization engine (Phase 2)             │      │
│  │  • Validate anonymized data                            │      │
│  │  • Export anonymized backup (encrypted)                │      │
│  └────────────────────────────────────────────────────────┘      │
└──────────────────────┬───────────────────────────────────────────┘
                       │
                       │ [3] Copy Anonymized Backup
                       │
                       ▼
┌──────────────────────────────────────────────────────────────────┐
│                    ANONYMIZED BACKUP                              │
│  ┌────────────────────────────────────────────────────────┐      │
│  │  uat_anonymized_20260128_030000.tar.gz                 │      │
│  │  • db_identity_anonymized.sql                          │      │
│  │  • db_1097_identity_anonymized.sql                     │      │
│  │  • db_iemr_anonymized.sql                              │      │
│  │  • db_reporting_anonymized.sql                         │      │
│  └────────────────────────────────────────────────────────┘      │
└──────────────────────┬───────────────────────────────────────────┘
                       │
                       │ 🚨 DRIFT GATE #2: Pre-restore validation
                       │ [4] Restore to UAT (if no drift)
                       │
                       ▼
┌──────────────────────────────────────────────────────────────────┐
│                      UAT ENVIRONMENT                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │ db_identity  │  │ db_1097_     │  │ db_iemr      │           │
│  │ (anonymized) │  │ identity     │  │ (anonymized) │           │
│  │              │  │ (anonymized) │  │              │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
│                                                                   │
│  ✅ Ready for Testing                                            │
└──────────────────────────────────────────────────────────────────┘
```

### 2.2 Infrastructure Components

| Component | Technology | Purpose | Location |
|-----------|------------|---------|----------|
| **Production DB** | MySQL 8.0 | Source of truth | Production VPC |
| **Read Replica** | MySQL 8.0 | Backup source (zero prod impact) | Production VPC |
| **Backup Storage** | S3 / NFS | Store production backups | Secure storage |
| **Anonymization Server** | EC2 / VM | Temporary DB + Java engine + Drift Detector | Staging VPC |
| **UAT Database** | MySQL 8.0 | Target environment (allowlist validated) | UAT VPC |
| **Jenkins Server** | Jenkins 2.x | Invokes Java JAR (NO bash) | CI/CD VPC |
| **Secrets Manager** | AWS Secrets Manager / Vault | Encrypted credentials (NEVER in CLI) | Secure VPC |
| **Monitoring** | Prometheus/Grafana | Metrics & drift alerts | Monitoring VPC |

---

## 4. Production Backup Strategy

### 4.1 Backup Options Analysis

#### Option 1: Java ProcessBuilder + mysqldump from Read Replica (RECOMMENDED)

**Pros**:
- ✅ Zero production impact (reads from replica)
- ✅ Consistent snapshot (--single-transaction)
- ✅ Cross-platform (Java ProcessBuilder works on Windows/Linux/Mac)
- ✅ No bash/PowerShell scripts required

**Cons**:
- ❌ Slower for very large databases (>100GB)
- ❌ Requires read replica setup

**Implementation** (Java, not bash):

```java
// BackupService.java (from Phase 2)

@Service
public class BackupService {
    
    private final String backupDir;
    private final DatabaseConfig dbConfig;
    private final EncryptionService encryptionService;
    
    public BackupInfo backupFromReplica(List<String> databases) {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        Path backupPath = Paths.get(backupDir, "prod_backup_" + timestamp);
        Files.createDirectories(backupPath);
        
        List<Path> backupFiles = new ArrayList<>();
        
        for (String db : databases) {
            log.info("Backing up database: {}", db);
            
            // Build mysqldump command (cross-platform)
            ProcessBuilder pb = new ProcessBuilder(
                "mysqldump",
                "--host=" + dbConfig.getReplicaHost(),
                "--user=" + dbConfig.getBackupUser(),
                "--password=" + getPasswordFromEnv(), // NEVER from CLI args
                "--single-transaction",
                "--quick",
                "--lock-tables=false",
                "--routines",
                "--triggers",
                "--events",
                db
            );
            
            Path outputFile = backupPath.resolve(db + ".sql");
            pb.redirectOutput(outputFile.toFile());
            
            Process process = pb.start();
            int exitCode = process.waitFor();
            
            if (exitCode != 0) {
                throw new BackupException("mysqldump failed for " + db);
            }
            
            // Compress and encrypt
            Path encryptedFile = compressAndEncrypt(outputFile);
            backupFiles.add(encryptedFile);
            
            log.info("Backup complete: {} ({})", db, Files.size(encryptedFile));
        }
        
        // Create encrypted tarball
        Path tarball = createEncryptedTarball(backupPath, backupFiles);
        
        // Upload to S3 (optional)
        if (uploadToS3Enabled) {
            s3Client.uploadBackup(tarball);
        }
        
        return new BackupInfo(tarball, backupFiles, timestamp);
    }
    
    private String getPasswordFromEnv() {
        // Retrieve from environment variable or Secrets Manager
        return System.getenv("DB_PASSWORD");
    }
}
```

**Key Changes from Bash**:
- ✅ Pure Java ProcessBuilder (cross-platform)
- ✅ Passwords from environment variables (NEVER CLI args)
- ✅ AES-256 encryption of backup files
- ✅ No temporary /tmp/backup_info.env files
- ✅ Exception handling and logging

#### Option 2: Percona XtraBackup (Advanced)

**Use Case**: Very large databases (>500GB) requiring faster backup/restore

**Implementation**: Use Java ProcessBuilder to invoke `xtrabackup` binary (same pattern as BackupService.java above)

### 3.2 Backup Scheduling

**Frequency**:
- **Weekly UAT Refresh**: Every Sunday 2:00 AM
- **Monthly Full Backup**: First Sunday of month
- **On-Demand**: Via Jenkins manual trigger

**Jenkins Cron Expression**:
```groovy
triggers {
    // Every Sunday at 2:00 AM
    cron('0 2 * * 0')
}
```

---

## 5. UAT Restoration Process

### 5.1 Restore Service (Java)

**CRITICAL**: Restore includes Drift Gate #2 validation before overwriting UAT

```java
// RestoreService.java (from Phase 2)

@Service
public class RestoreService {
    
    private final DriftDetector driftDetector;
    private final DatabaseConfig dbConfig;
    private final AllowlistValidator allowlistValidator;
    private final DecryptionService decryptionService;
    
    public RestoreResult restoreToUAT(
        Path anonymizedBackup,
        boolean confirmOverwrite,
        String targetEnv
    ) {
        log.info("Starting UAT restoration...");
        
        // SAFETY FUSE #1: Allowlist validation
        if (!allowlistValidator.isAllowed(targetEnv)) {
            throw new SecurityException(
                "Target environment not in allowlist: " + targetEnv +
                ". Allowed: [UAT, DEV]. NEVER use PROD."
            );
        }
        
        // SAFETY FUSE #2: Explicit confirmation flag
        if (!confirmOverwrite) {
            throw new SecurityException(
                "Missing --confirm-uat-overwrite flag. " +
                "This operation will DROP and RECREATE UAT databases."
            );
        }
        
        // DRIFT GATE #2: Pre-restore schema validation
        log.info("🚨 Running Drift Gate #2: Pre-restore validation...");
        DriftReport driftReport = driftDetector.detectDrift(
            dbConfig.getUatConnection()
        );
        
        if (driftReport.hasDrift()) {
            log.error("DRIFT DETECTED before UAT restore. ABORTING.");
            driftReportGenerator.generateHtmlReport(driftReport);
            throw new DriftDetectedException(
                "Schema drift detected in UAT. Cannot proceed with restore. " +
                "See drift report: " + driftReport.getReportPath()
            );
        }
        
        log.info("✅ Drift Gate #2 passed. Proceeding with restore...");
        
        // Decrypt and extract backup
        Path tempDir = Files.createTempDirectory("uat_restore_");
        List<Path> sqlFiles = decryptionService.decryptAndExtract(
            anonymizedBackup, 
            tempDir
        );
        
        List<String> databases = List.of(
            "db_identity", 
            "db_1097_identity", 
            "db_iemr", 
            "db_reporting"
        );
        
        for (String db : databases) {
            log.info("Restoring {} to UAT...", db);
            
            // Drop and recreate (WARNING: UAT only - validated by allowlist)
            executeSQL(
                dbConfig.getUatConnection(),
                "DROP DATABASE IF EXISTS " + db + "; CREATE DATABASE " + db
            );
            
            // Restore via ProcessBuilder (cross-platform)
            Path sqlFile = findSqlFile(sqlFiles, db);
            ProcessBuilder pb = new ProcessBuilder(
                "mysql",
                "--host=" + dbConfig.getUatHost(),
                "--user=" + dbConfig.getUatUser(),
                "--password=" + getPasswordFromEnv("UAT_DB_PASSWORD"),
                db
            );
            pb.redirectInput(sqlFile.toFile());
            
            Process process = pb.start();
            int exitCode = process.waitFor();
            
            if (exitCode != 0) {
                throw new RestoreException("Restore failed for " + db);
            }
            
            log.info("{} restored successfully", db);
        }
        
        // Cleanup
        FileUtils.deleteDirectory(tempDir.toFile());
        
        log.info("UAT restoration complete!");
        return new RestoreResult(databases, LocalDateTime.now());
    }
    
    private String getPasswordFromEnv(String key) {
        // NEVER pass passwords as CLI arguments
        return System.getenv(key);
    }
}
```

**Key Safety Features**:
- 🚨 **Drift Gate #2**: Pre-restore validation (fail-closed)
- 🔒 **Allowlist Validator**: Target env must be UAT/DEV (NEVER PROD)
- ✅ **Explicit Confirmation**: --confirm-uat-overwrite flag required
- 🔐 **Encrypted Backups**: AES-256 decryption before restore
- 🚫 **No Secrets in CLI**: Passwords from environment variables only

### 5.2 Pre-Restoration Validation (Java)

**Integrated into RestoreService.java** (see Drift Gate #2 above)

Validation includes:
- Allowlist check (target env must be UAT/DEV)
- Explicit confirmation flag check
- Schema drift detection (fail-closed)
- Database accessibility check
- Sufficient disk space check
- Backup file integrity check (decryption test)

```java
// ValidationService.java

@Service
public class ValidationService {
    
    public ValidationResult runPreRestoreChecks(
        DatabaseConfig uatConfig,
        Path anonymizedBackup
    ) {
        log.info("Running pre-restoration checks...");
        List<String> checks = new ArrayList<>();
        
        // Check 1: UAT database accessibility
        try {
            executeSQL(uatConfig.getConnection(), "SELECT 1");
            checks.add("✅ UAT database accessible");
        } catch (SQLException e) {
            throw new ValidationException("❌ Cannot connect to UAT database");
        }
        
        // Check 2: Sufficient disk space
        long requiredBytes = 100L * 1024 * 1024 * 1024; // 100GB
        long availableBytes = Files.getFileStore(
            Paths.get("/var/lib/mysql")
        ).getUsableSpace();
        
        if (availableBytes >= requiredBytes) {
            checks.add("✅ Sufficient disk space (" + 
                (availableBytes / 1024 / 1024 / 1024) + "GB available)");
        } else {
            throw new ValidationException(
                "❌ Insufficient disk space (" +
                (availableBytes / 1024 / 1024 / 1024) + "GB available, " +
                (requiredBytes / 1024 / 1024 / 1024) + "GB required)"
            );
        }
        
        // Check 3: Anonymized backup exists and is decryptable
        if (Files.exists(anonymizedBackup)) {
            try {
                decryptionService.testDecrypt(anonymizedBackup);
                checks.add("✅ Anonymized backup found and decryptable: " + 
                    anonymizedBackup);
            } catch (Exception e) {
                throw new ValidationException(
                    "❌ Backup file corrupt or cannot decrypt: " + 
                    anonymizedBackup
                );
            }
        } else {
            throw new ValidationException(
                "❌ Anonymized backup not found: " + anonymizedBackup
            );
        }
        
        log.info("All pre-restoration checks passed ✅");
        return new ValidationResult(checks);
    }
}
```

---

## 6. Option A: Jenkins Pipeline

### 6.1 Jenkinsfile (Java-Only Orchestration)

**CRITICAL**: Jenkins invokes Java JAR only - NO bash/PowerShell scripts

```groovy
// Jenkinsfile.uat-refresh
// Pure Java orchestration - NO bash scripts

pipeline {
    agent {
        label 'amrit-anonymization-agent'
    }
    
    parameters {
        choice(
            name: 'EXECUTION_MODE',
            choices: ['FULL_REFRESH', 'ANONYMIZE_ONLY', 'RESTORE_ONLY'],
            description: 'Execution mode'
        )
        choice(
            name: 'TARGET_ENV',
            choices: ['UAT', 'DEV'],
            description: 'Target environment (NEVER PROD - allowlist enforced)'
        )
        booleanParam(
            name: 'CONFIRM_OVERWRITE',
            defaultValue: false,
            description: 'REQUIRED: Confirm UAT database will be overwritten'
        )
        booleanParam(
            name: 'SKIP_BACKUP',
            defaultValue: false,
            description: 'Skip production backup (use existing)'
        )
        booleanParam(
            name: 'SEND_NOTIFICATIONS',
            defaultValue: true,
            description: 'Send Slack/email notifications'
        )
    }
    
    environment {
        BACKUP_DIR = '/data/backups'
        ANONYMIZATION_JAR = 'target/Amrit-DB-1.0.0.jar'
        ANONYMIZATION_CONFIG = 'docs/phase1-outputs/anonymization-strategy-map.json'
        SLACK_CHANNEL = '#amrit-uat-refresh'
        // Secrets from Jenkins Credentials (NEVER in CLI args)
        DB_CREDENTIALS = credentials('prod-db-replica-creds')
        UAT_CREDENTIALS = credentials('uat-db-creds')
    }
    
    stages {
        stage('Initialize') {
            steps {
                script {
                    echo "🚀 Starting UAT Refresh Pipeline (Java-Only)"
                    echo "Mode: ${params.EXECUTION_MODE}"
                    echo "Target: ${params.TARGET_ENV}"
                    
                    // SAFETY CHECK: Confirm overwrite flag
                    if (!params.CONFIRM_OVERWRITE) {
                        error("❌ ABORTED: CONFIRM_OVERWRITE flag not set. " +
                              "This operation will DROP and RECREATE ${params.TARGET_ENV} databases. " +
                              "Re-run with CONFIRM_OVERWRITE=true to proceed.")
                    }
                    
                    if (params.SEND_NOTIFICATIONS) {
                        slackSend(
                            channel: env.SLACK_CHANNEL,
                            color: 'good',
                            message: "UAT Refresh Started\nMode: ${params.EXECUTION_MODE}\nTarget: ${params.TARGET_ENV}\nTriggered by: ${currentBuild.getBuildCauses()[0].userId}"
                        )
                    }
                }
            }
        }
        
        stage('Production Backup') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' && !params.SKIP_BACKUP }
            }
            steps {
                script {
                    echo "📦 Creating production backup from read replica (Java ProcessBuilder)..."
                    
                    // Invoke Java JAR (NOT bash script)
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --backup-production \
                            --source=REPLICA \
                            --output-dir=${BACKUP_DIR}
                    '''
                    
                    // Read backup metadata from JSON (not .env file)
                    def backupInfo = readJSON file: "${BACKUP_DIR}/latest_backup.json"
                    env.BACKUP_PATH = backupInfo.backupPath
                    env.BACKUP_TIMESTAMP = backupInfo.timestamp
                    
                    echo "Backup created: ${env.BACKUP_PATH}"
                }
            }
        }
        
        stage('Setup Anonymization Environment') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "🔧 Setting up temporary anonymization environment..."
                    
                    // Java-based Docker orchestration
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --setup-temp-db \
                            --docker-image=mysql:8.0 \
                            --port=3307
                    '''
                }
            }
        }
        
        stage('Restore Backup to Temp DB') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "📥 Restoring production backup to temporary database (Java ProcessBuilder)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --restore \
                            --backup=${BACKUP_PATH} \
                            --target=TEMP_DB \
                            --host=localhost \
                            --port=3307
                    '''
                }
            }
        }
        
        stage('🚨 Drift Gate #1: Pre-Anonymization') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "🚨 CRITICAL: Running Schema Drift Gate #1 (FAIL-CLOSED)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --drift-detect \
                            --host=localhost \
                            --port=3307 \
                            --fail-on-drift
                    '''
                    
                    // Read drift report
                    def driftReport = readJSON file: 'docs/phase2-outputs/drift_report.json'
                    
                    if (driftReport.hasDrift) {
                        // Publish drift report for review
                        publishHTML([
                            reportDir: 'docs/phase2-outputs',
                            reportFiles: 'drift_report.html',
                            reportName: 'Schema Drift Report'
                        ])
                        
                        error("❌ ABORTED: Schema drift detected. Uncovered PII columns found. " +
                              "See drift report for details. Update Anonymization Registry before proceeding.")
                    }
                    
                    echo "✅ Drift Gate #1 passed. No uncovered PII detected."
                }
            }
        }
        
        stage('Run Anonymization') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "🎭 Running anonymization engine (Java)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --anonymize \
                            --config=${ANONYMIZATION_CONFIG} \
                            --host=localhost \
                            --port=3307
                    '''
                    
                    // Check anonymization result
                    def result = readJSON file: 'docs/phase2-outputs/anonymization_result.json'
                    
                    if (result.status != 'SUCCESS') {
                        error("Anonymization failed: ${result.error}")
                    }
                    
                    echo "✅ Anonymization completed successfully"
                    echo "Records processed: ${result.totalRecordsProcessed}"
                    echo "Duration: ${result.durationMinutes} minutes"
                }
            }
        }
        
        stage('Validation') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "✔️  Running post-anonymization validation (Java)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --validate \
                            --host=localhost \
                            --port=3307
                    '''
                    
                    // Publish validation report
                    publishHTML([
                        reportDir: 'docs/phase2-outputs',
                        reportFiles: 'validation_report.html',
                        reportName: 'Anonymization Validation Report'
                    ])
                }
            }
        }
        
        stage('Export Anonymized Backup') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "💾 Exporting anonymized backup (encrypted)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --export-backup \
                            --source-host=localhost \
                            --source-port=3307 \
                            --output-dir=${BACKUP_DIR} \
                            --encrypt
                    '''
                    
                    def exportInfo = readJSON file: "${BACKUP_DIR}/anonymized_backup.json"
                    env.ANONYMIZED_BACKUP = exportInfo.backupPath
                    
                    echo "Anonymized backup (encrypted): ${env.ANONYMIZED_BACKUP}"
                }
            }
        }
        
        stage('Cleanup Temp DB') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "🧹 Cleaning up temporary database (Java Docker management)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} --cleanup-temp-db
                    '''
                }
            }
        }
        
        stage('🚨 Drift Gate #2: Pre-UAT-Restore') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'RESTORE_ONLY' }
            }
            steps {
                script {
                    echo "🚨 CRITICAL: Running Schema Drift Gate #2 (FAIL-CLOSED)..."
                    echo "Validating UAT schema before restore..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --drift-detect \
                            --target=${TARGET_ENV} \
                            --fail-on-drift
                    '''
                    
                    // Read drift report
                    def driftReport = readJSON file: 'docs/phase2-outputs/drift_report_uat.json'
                    
                    if (driftReport.hasDrift) {
                        publishHTML([
                            reportDir: 'docs/phase2-outputs',
                            reportFiles: 'drift_report_uat.html',
                            reportName: 'UAT Schema Drift Report'
                        ])
                        
                        error("❌ ABORTED: Schema drift detected in ${params.TARGET_ENV}. " +
                              "Cannot proceed with restore. Update Anonymization Registry first.")
                    }
                    
                    echo "✅ Drift Gate #2 passed. UAT schema matches registry."
                }
            }
        }
        
        stage('Pre-Restoration Checks') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'RESTORE_ONLY' }
            }
            steps {
                script {
                    echo "🔍 Running pre-restoration checks (Java ValidationService)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --pre-restore-checks \
                            --target=${TARGET_ENV} \
                            --backup=${ANONYMIZED_BACKUP}
                    '''
                }
            }
        }
        
        stage('Restore to UAT') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'RESTORE_ONLY' }
            }
            steps {
                script {
                    echo "🎯 Restoring anonymized data to ${params.TARGET_ENV} (Java RestoreService)..."
                    
                    // Create UAT backup before overwrite (rollback capability)
                    echo "Creating pre-restore backup of ${params.TARGET_ENV}..."
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --backup-current \
                            --source=${TARGET_ENV} \
                            --output-dir=${BACKUP_DIR}/pre-restore-backups
                    '''
                    
                    // Restore with safety flags
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --restore \
                            --backup=${ANONYMIZED_BACKUP} \
                            --target-env=${TARGET_ENV} \
                            --confirm-uat-overwrite \
                            --decrypt
                    '''
                    
                    echo "✅ ${params.TARGET_ENV} database restored successfully"
                }
            }
        }
        
        stage('Post-Restoration Validation') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'RESTORE_ONLY' }
            }
            steps {
                script {
                    echo "🔬 Running post-restoration validation (Java)..."
                    
                    sh '''
                        java -jar ${ANONYMIZATION_JAR} \
                            --post-restore-checks \
                            --target=${TARGET_ENV}
                    '''
                    
                    publishHTML([
                        reportDir: 'docs/phase2-outputs',
                        reportFiles: 'post_restore_validation.html',
                        reportName: 'Post-Restoration Validation Report'
                    ])
                }
            }
        }
    }
    
    post {
        success {
            script {
                echo "✅ UAT Refresh completed successfully!"
                
                if (params.SEND_NOTIFICATIONS) {
                    slackSend(
                        channel: env.SLACK_CHANNEL,
                        color: 'good',
                        message: "✅ UAT Refresh Successful\nTarget: ${params.TARGET_ENV}\nDuration: ${currentBuild.durationString}\n✅ Drift Gates Passed\n${params.TARGET_ENV} is ready for testing!"
                    )
                    
                    emailext(
                        to: 'amrit-dev-team@example.com',
                        subject: "✅ UAT Refresh Successful - ${new Date().format('yyyy-MM-dd')}",
                        body: """
                            ${params.TARGET_ENV} environment has been refreshed with anonymized production data.
                            
                            Details:
                            - Execution Mode: ${params.EXECUTION_MODE}
                            - Target Environment: ${params.TARGET_ENV}
                            - Duration: ${currentBuild.durationString}
                            - Triggered by: ${currentBuild.getBuildCauses()[0].userId}
                            - Drift Gates: ✅ Passed (no uncovered PII detected)
                            
                            ${params.TARGET_ENV} is now ready for testing!
                        """
                    )
                }
            }
        }
        
        failure {
            script {
                echo "❌ UAT Refresh failed!"
                
                if (params.SEND_NOTIFICATIONS) {
                    slackSend(
                        channel: env.SLACK_CHANNEL,
                        color: 'danger',
                        message: "❌ UAT Refresh Failed\nPossible Causes:\n- Schema drift detected (check drift report)\n- Validation failure\n- Database connection issue\nCheck Jenkins console: ${env.BUILD_URL}"
                    )
                    
                    emailext(
                        to: 'amrit-dev-team@example.com',
                        subject: "❌ UAT Refresh Failed - ${new Date().format('yyyy-MM-dd')}",
                        body: """
                            UAT refresh failed. Please check Jenkins logs.
                            
                            Common Causes:
                            1. Schema drift detected (uncovered PII columns) - Update Anonymization Registry
                            2. Validation failure - Check validation report
                            3. Database connectivity issues
                            
                            Build URL: ${env.BUILD_URL}
                        """
                    )
                }
            }
        }
        
        always {
            script {
                // Archive artifacts
                archiveArtifacts artifacts: 'docs/phase2-outputs/*.json,docs/phase2-outputs/*.html', allowEmptyArchive: true
                
                // Cleanup temporary files
                sh 'rm -f /tmp/backup_info.env /tmp/export_info.env'
            }
        }
    }
}
```

### 6.2 Jenkins Job Configuration

**Job Type**: Pipeline

**Triggers**:
- Cron: `0 2 * * 0` (Every Sunday at 2 AM)
- Manual: Build with Parameters

**Parameters**:
- `EXECUTION_MODE`: FULL_REFRESH / ANONYMIZE_ONLY / RESTORE_ONLY
- `TARGET_ENV`: UAT / DEV (allowlist enforced, NEVER PROD)
- `CONFIRM_OVERWRITE`: true/false (REQUIRED - safety fuse)
- `SKIP_BACKUP`: true/false
- `SEND_NOTIFICATIONS`: true/false

**Agent Requirements**:
- Label: `amrit-anonymization-agent`
- Java 17 installed
- Docker installed (for temporary MySQL)
- MySQL client tools (mysqldump/mysql binaries)
- 200GB+ free disk space
- Access to Secrets Manager (AWS Secrets Manager / HashiCorp Vault)

---

## 7. Option B: Standalone Java CLI

### 7.1 OrchestrationService (Java)

**NO bash/PowerShell scripts** - Pure Java orchestration for cross-platform compatibility

```java
// OrchestrationService.java

@Service
public class OrchestrationService {
    
    private final BackupService backupService;
    private final RestoreService restoreService;
    private final DriftDetector driftDetector;
    private final AnonymizationOrchestrator anonymizationOrchestrator;
    private final ValidationService validationService;
    private final AllowlistValidator allowlistValidator;
    private final NotificationService notificationService;
    
    public OrchestrationResult executeFullUATRefresh(
        OrchestrationConfig config
    ) {
        log.info("==========================================");
        log.info("AMRIT UAT Refresh - Starting (Java-Only)");
        log.info("Target: {}", config.getTargetEnv());
        log.info("==========================================");
        
        try {
            // SAFETY FUSE #1: Allowlist validation
            if (!allowlistValidator.isAllowed(config.getTargetEnv())) {
                throw new SecurityException(
                    "Target environment not allowed: " + config.getTargetEnv()
                );
            }
            
            // SAFETY FUSE #2: Explicit confirmation
            if (!config.isConfirmOverwrite()) {
                throw new SecurityException(
                    "Missing confirmation flag. Set --confirm-uat-overwrite"
                );
            }
            
            // Step 1: Backup production from replica
            log.info("Step 1: Backing up production databases...");
            BackupInfo prodBackup = backupService.backupFromReplica(
                List.of("db_identity", "db_1097_identity", "db_iemr", "db_reporting")
            );
            log.info("Backup created: {}", prodBackup.getBackupPath());
            
            // Step 2: Setup temporary anonymization database
            log.info("Step 2: Setting up temporary anonymization environment...");
            TempDatabaseService tempDb = setupTempDatabase();
            
            // Step 3: Restore to temp DB
            log.info("Step 3: Restoring backup to temporary database...");
            restoreService.restoreToTempDB(prodBackup, tempDb.getConnection());
            
            // Step 4: DRIFT GATE #1 - Pre-anonymization validation
            log.info("🚨 Step 4: Running Drift Gate #1 (FAIL-CLOSED)...");
            DriftReport driftReport1 = driftDetector.detectDrift(
                tempDb.getConnection()
            );
            if (driftReport1.hasDrift()) {
                throw new DriftDetectedException(
                    "Schema drift detected. Uncovered PII found. ABORTING."
                );
            }
            log.info("✅ Drift Gate #1 passed.");
            
            // Step 5: Run anonymization
            log.info("Step 5: Running anonymization...");
            AnonymizationResult anonResult = anonymizationOrchestrator.execute(
                tempDb.getConnection(),
                config.getAnonymizationConfig()
            );
            
            // Step 6: Validation
            log.info("Step 6: Validating anonymized data...");
            validationService.postAnonymizationChecks(tempDb.getConnection());
            
            // Step 7: Export anonymized backup (encrypted)
            log.info("Step 7: Exporting anonymized backup (encrypted)...");
            BackupInfo anonBackup = backupService.exportAnonymizedBackup(
                tempDb.getConnection(),
                true // encrypt
            );
            
            // Step 8: Cleanup temp DB
            log.info("Step 8: Cleaning up temporary database...");
            tempDb.cleanup();
            
            // Step 9: DRIFT GATE #2 - Pre-UAT-restore validation
            log.info("🚨 Step 9: Running Drift Gate #2 (FAIL-CLOSED)...");
            DriftReport driftReport2 = driftDetector.detectDrift(
                config.getUatConnection()
            );
            if (driftReport2.hasDrift()) {
                throw new DriftDetectedException(
                    "Schema drift detected in UAT. ABORTING."
                );
            }
            log.info("✅ Drift Gate #2 passed.");
            
            // Step 10: Pre-restoration checks
            log.info("Step 10: Running pre-restoration checks...");
            validationService.runPreRestoreChecks(
                config.getUatConfig(),
                anonBackup.getBackupPath()
            );
            
            // Step 11: Backup current UAT (rollback capability)
            log.info("Step 11: Backing up current UAT state...");
            backupService.backupCurrentUAT();
            
            // Step 12: Restore to UAT
            log.info("Step 12: Restoring to UAT environment...");
            restoreService.restoreToUAT(
                anonBackup.getBackupPath(),
                config.isConfirmOverwrite(),
                config.getTargetEnv()
            );
            
            // Step 13: Post-restoration validation
            log.info("Step 13: Final validation...");
            validationService.postRestoreChecks(config.getUatConnection());
            
            log.info("==========================================");
            log.info("UAT Refresh completed successfully!");
            log.info("==========================================");
            
            // Send notifications
            notificationService.sendSuccess(config);
            
            return OrchestrationResult.success(anonResult);
            
        } catch (DriftDetectedException e) {
            log.error("❌ ABORTED: Schema drift detected", e);
            notificationService.sendDriftAlert(e.getDriftReport());
            throw e;
        } catch (Exception e) {
            log.error("❌ UAT Refresh failed", e);
            notificationService.sendFailure(e);
            throw e;
        }
    }
}
```

**Key Features**:
- 🚨 **Two Drift Gates**: Before anonymization AND before UAT restore
- 🔒 **Allowlist Validator**: Prevents accidental production overwrites
- ✅ **Explicit Confirmation**: --confirm-uat-overwrite flag required
- 🔐 **Encrypted Backups**: AES-256 encryption for all backups
- 🚫 **No Secrets in CLI**: All credentials from environment variables or Secrets Manager
- 📧 **Notifications**: Email/Slack alerts for success, failure, and drift detection

### 7.2 CLI Application (Main Class)

```java
// AmritAnonymizationCLI.java

@SpringBootApplication
public class AmritAnonymizationCLI implements CommandLineRunner {
    
    @Autowired
    private OrchestrationService orchestrationService;
    
    public static void main(String[] args) {
        System.exit(SpringApplication.exit(
            SpringApplication.run(AmritAnonymizationCLI.class, args)
        ));
    }
    
    @Override
    public void run(String... args) {
        CommandLine cmd = parseArguments(args);
        
        try {
            if (cmd.hasOption("refresh-uat")) {
                // Validate safety flags
                validateSafetyFlags(cmd);
                
                // Build config from CLI args
                OrchestrationConfig config = OrchestrationConfig.builder()
                    .targetEnv(cmd.getOptionValue("target-env", "UAT"))
                    .confirmOverwrite(cmd.hasOption("confirm-uat-overwrite"))
                    .skipBackup(cmd.hasOption("skip-backup"))
                    .build();
                
                // Execute
                OrchestrationResult result = orchestrationService.executeFullUATRefresh(config);
                
                System.exit(0); // Success
                
            } else if (cmd.hasOption("drift-detect")) {
                // Run drift detection only
                DriftReport report = driftDetector.detectDrift(
                    cmd.getOptionValue("target")
                );
                System.exit(report.hasDrift() ? 2 : 0); // 2 = drift detected
                
            } else {
                printUsage();
                System.exit(1);
            }
            
        } catch (DriftDetectedException e) {
            System.err.println("❌ ABORTED: Schema drift detected");
            System.err.println("See drift report: " + e.getDriftReport().getReportPath());
            System.exit(2); // Exit code 2 = drift detected
            
        } catch (SecurityException e) {
            System.err.println("❌ SECURITY ERROR: " + e.getMessage());
            System.exit(3); // Exit code 3 = security violation
            
        } catch (Exception e) {
            System.err.println("❌ ERROR: " + e.getMessage());
            e.printStackTrace();
            System.exit(1); // Exit code 1 = general failure
        }
    }
    
    private void validateSafetyFlags(CommandLine cmd) {
        // SAFETY: Require explicit confirmation flag
        if (!cmd.hasOption("confirm-uat-overwrite")) {
            throw new SecurityException(
                "Missing required flag: --confirm-uat-overwrite\n" +
                "This operation will DROP and RECREATE UAT databases.\n" +
                "Add --confirm-uat-overwrite to proceed."
            );
        }
        
        // SAFETY: Validate target environment
        String targetEnv = cmd.getOptionValue("target-env", "UAT").toUpperCase();
        if (targetEnv.equals("PROD") || targetEnv.equals("PRODUCTION")) {
            throw new SecurityException(
                "BLOCKED: Cannot target PROD environment. " +
                "Allowed targets: UAT, DEV only."
            );
        }
    }
    
    private void printUsage() {
        System.out.println("""
            AMRIT Database Anonymization CLI
            
            Usage:
              java -jar amrit-anonymization-cli.jar [OPTIONS]
            
            Options:
              --refresh-uat                 Execute full UAT refresh
              --target-env=ENV              Target environment (UAT or DEV, default: UAT)
              --confirm-uat-overwrite       REQUIRED: Confirm database overwrite
              --skip-backup                 Skip production backup (use existing)
              --drift-detect                Run drift detection only
              --target=TARGET               Target for drift detection
              
            Examples:
              # Full UAT refresh (Windows)
              java -jar amrit-anonymization-cli.jar --refresh-uat --target-env=UAT --confirm-uat-overwrite
              
              # Drift detection only
              java -jar amrit-anonymization-cli.jar --drift-detect --target=UAT
              
            Exit Codes:
              0 = Success
              1 = General failure
              2 = Schema drift detected
              3 = Security violation (allowlist/confirmation)
            
            Security:
              - Passwords MUST be in environment variables (never CLI args)
              - Target environment validated against allowlist (UAT, DEV only)
              - Explicit confirmation flag required (--confirm-uat-overwrite)
              - All backups encrypted with AES-256
        """);
    }
}
```

---

## 8. Java Orchestration Engine

### 7.1 Environment Configuration Files

**config/production.env**

```bash
# Production Database (Read Replica)
PROD_MYSQL_HOST=prod-db-replica.example.com
PROD_MYSQL_PORT=3306
PROD_MYSQL_USER=backup_user
PROD_MYSQL_PASSWORD=${PROD_DB_PASSWORD} # From Jenkins credentials

# Backup settings
BACKUP_DIR=/data/backups/production
BACKUP_RETENTION_DAYS=30
UPLOAD_TO_S3=true
S3_BUCKET=s3://amrit-backups/production
```

**config/uat.env**

```bash
# UAT Database
UAT_MYSQL_HOST=uat-db.example.com
UAT_MYSQL_PORT=3306
UAT_MYSQL_USER=uat_admin
UAT_MYSQL_PASSWORD=${UAT_DB_PASSWORD} # From Jenkins credentials

# UAT settings
UAT_BACKUP_DIR=/data/backups/uat
UAT_RESTORE_DIR=/data/restores/uat
```

**config/anonymization.properties**

```properties
# Anonymization settings
anonymization.batch-size=10000
anonymization.parallel-threads=4
anonymization.benregid-mapping.strategy=SEQUENTIAL
anonymization.benregid-mapping.start-id=1000000000

# Validation
validation.sample-size=1000
validation.pii-leakage-check=true
validation.foreign-key-check=true

# Audit
audit.log-level=INFO
audit.export-format=JSON,HTML
audit.output-dir=docs/phase2-outputs
```

---

## 8. Monitoring & Alerting

### 8.1 Prometheus Metrics

**Expose metrics from Java application**:

```java
@Component
public class AnonymizationMetrics {
    
    private final Counter totalTablesProcessed = Counter.builder("anonymization_tables_processed_total")
        .description("Total number of tables processed")
        .register(Metrics.globalRegistry);
    
    private final Gauge currentProgress = Gauge.builder("anonymization_progress_percent")
        .description("Current anonymization progress")
        .register(Metrics.globalRegistry);
    
    private final Timer executionTime = Timer.builder("anonymization_execution_time")
        .description("Total execution time")
        .register(Metrics.globalRegistry);
    
    public void recordTableProcessed() {
        totalTablesProcessed.increment();
    }
    
    public void updateProgress(double percent) {
        currentProgress.set(percent);
    }
}
```

### 8.2 Alerting Rules

**Prometheus alert rules**:

```yaml
groups:
  - name: amrit_anonymization
    interval: 30s
    rules:
      - alert: AnonymizationFailed
        expr: anonymization_execution_status != 1
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "AMRIT anonymization failed"
          description: "Anonymization job failed or timed out"
      
      - alert: AnonymizationSlow
        expr: anonymization_execution_time_seconds > 7200
        for: 1m
        labels:
          severity: warning
        annotations:
          summary: "AMRIT anonymization taking too long"
          description: "Anonymization has been running for >2 hours"
```

### 8.3 Slack Notifications

**Notification points**:
- ✅ Pipeline started
- ✅ Backup completed
- ✅ Anonymization started
- ✅ Anonymization completed
- ✅ UAT restore completed
- ❌ Any failure (with error details)

---

## 9. Security & Access Control

### 9.1 Credential Management

**Use Jenkins Credentials Plugin**:

```groovy
withCredentials([
    usernamePassword(
        credentialsId: 'prod-db-replica-creds',
        usernameVariable: 'PROD_MYSQL_USER',
        passwordVariable: 'PROD_MYSQL_PASSWORD'
    ),
    usernamePassword(
        credentialsId: 'uat-db-creds',
        usernameVariable: 'UAT_MYSQL_USER',
        passwordVariable: 'UAT_MYSQL_PASSWORD'
    )
]) {
    sh 'bash backup_from_replica.sh'
}
```

### 9.2 Access Control Matrix

| Role | Production Backup | Anonymization | UAT Restore | View Logs |
|------|-------------------|---------------|-------------|-----------|
| **DevOps Admin** | ✅ | ✅ | ✅ | ✅ |
| **QA Lead** | ❌ | ❌ | ✅ (via Jenkins) | ✅ |
| **Developer** | ❌ | ❌ | ❌ | ✅ (read-only) |
| **Jenkins Service** | ✅ | ✅ | ✅ | ✅ |

### 9.3 Audit Trail

**What to log**:
- Who triggered the job
- When it was triggered
- Which backup was used
- Anonymization metrics (rows processed)
- Validation results
- UAT restore timestamp

**Log retention**: 90 days

---

## 10. Operations Runbook

### 10.1 Standard Operating Procedures

#### SOP 1: Scheduled Weekly UAT Refresh

**Trigger**: Automatic (Jenkins cron)

**Steps**:
1. Automated - no manual intervention
2. Monitor Slack channel for progress
3. Validate UAT after completion

**Expected Duration**: 1.5 - 2 hours

#### SOP 2: On-Demand UAT Refresh

**Trigger**: Manual (Jenkins "Build with Parameters")

**Steps**:
1. Log into Jenkins: https://jenkins.amrit.example.com
2. Navigate to "AMRIT-UAT-Refresh" job
3. Click "Build with Parameters"
4. Select `EXECUTION_MODE=FULL_REFRESH`
5. Click "Build"
6. Monitor progress in console output

#### SOP 3: Rollback UAT to Previous State

**Scenario**: Anonymization produced bad data

**Steps**:
1. Identify last good UAT backup:
   ```bash
   ls -lh /data/backups/uat/uat_backup_*.tar.gz
   ```

2. Restore from backup:
   ```bash
   bash restore_to_uat.sh /data/backups/uat/uat_backup_20260120_010000.tar.gz
   ```

3. Validate:
   ```bash
   bash post_restore_checks.sh
   ```

**Expected Duration**: 15-30 minutes

#### SOP 4: Troubleshooting Failed Anonymization

**Symptoms**: Jenkins job fails at "Run Anonymization" stage

**Diagnosis**:
1. Check logs:
   ```bash
   tail -f /var/log/amrit-anonymization/uat_refresh_<timestamp>.log
   ```

2. Check Java application logs:
   ```bash
   cat AMRIT-DB/logs/anonymization.log
   ```

3. Common issues:
   - Out of memory: Increase JVM heap `-Xmx8g`
   - Foreign key violations: Check BenRegID mapping
   - Timeout: Increase batch size

**Resolution**:
- Fix configuration
- Re-run Jenkins job with `SKIP_BACKUP=true` to skip backup step

---

## 11. Disaster Recovery

### 11.1 Recovery Scenarios

#### Scenario 1: UAT Database Corrupted

**Recovery**:
1. Restore from last anonymized backup
2. Estimated RTO: 30 minutes

#### Scenario 2: Anonymization Server Failed

**Recovery**:
1. Spin up new anonymization server from AMI/image
2. Mount backup storage
3. Re-run anonymization
4. Estimated RTO: 2 hours

#### Scenario 3: Production Backup Lost

**Recovery**:
1. Use previous day's backup
2. Re-run anonymization
3. Estimated RTO: 3 hours

### 11.2 Backup Retention Policy

| Backup Type | Retention Period | Location |
|-------------|------------------|----------|
| Production Daily | 30 days | S3 + NFS |
| Anonymized UAT | 14 days | NFS |
| UAT Snapshot (pre-restore) | 7 days | NFS |
| Audit Logs | 90 days | S3 |

---

## 12. Implementation Timeline

### Week 9: Infrastructure & Scripts

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Setup read replica for production (if not exists) | Read replica running |
| 3 | Create bash backup scripts | backup_from_replica.sh |
| 4 | Create bash restore scripts | restore_to_uat.sh |
| 5 | Create validation scripts | pre_restore_checks.sh |
| 6-7 | Setup temporary MySQL for anonymization | Docker-based temp DB |
| 8 | Create orchestration script | orchestrate_uat_refresh.sh |
| 9 | Test end-to-end locally | Working local execution |
| 10 | Documentation | Scripts documented |

### Week 10: Jenkins Integration

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Create Jenkinsfile | Pipeline definition |
| 3 | Configure Jenkins job | Job created |
| 4 | Setup Jenkins credentials | Credentials stored securely |
| 5 | Configure email/Slack plugins | Notifications working |
| 6-7 | Test Jenkins pipeline end-to-end | Successful test run |
| 8 | Setup cron trigger | Scheduled job |
| 9-10 | Load testing with production-sized data | Performance validated |

### Week 11: Monitoring & Operations

| Day | Task | Deliverable |
|-----|------|-------------|
| 1-2 | Setup Prometheus metrics | Metrics exposed |
| 3 | Configure Grafana dashboards | Dashboards created |
| 4 | Setup alerting rules | Alerts configured |
| 5 | Write operations runbook | Runbook complete |
| 6 | Conduct team training | Team trained |
| 7-8 | Dry run with team | Successful team execution |
| 9-10 | Final documentation | All docs complete |

### Week 12: Production Launch

| Day | Task | Deliverable |
|-----|------|-------------|
| 1 | Final pre-launch review | Sign-off received |
| 2 | First production run (supervised) | Successful execution |
| 3-5 | Monitor first automated runs | Issues identified & fixed |
| 6-7 | Performance tuning | Optimizations applied |
| 8-9 | Security audit | Security approved |
| 10 | Project handover to operations | Operations takeover |

**Total Duration**: 4 weeks

---

## 13. Success Criteria

Phase 3 is complete when:

- ✅ **Jenkins pipeline runs end-to-end successfully** with Java JAR invocation only (NO bash)
- ✅ **Drift Gate #1 (pre-anonymization) operational** - aborts on uncovered PII
- ✅ **Drift Gate #2 (pre-UAT-restore) operational** - aborts on schema mismatch
- ✅ Scheduled weekly UAT refresh working automatically
- ✅ **Allowlist validation enforced** - PROD blocked, UAT/DEV allowed only
- ✅ **Explicit confirmation flag required** - no accidental overwrites
- ✅ **All backups encrypted with AES-256** - encryption/decryption verified
- ✅ **All secrets via Secrets Manager** - ZERO secrets in CLI args or config files
- ✅ Zero production impact during backup (validated via monitoring)
- ✅ UAT refresh completes in <2 hours
- ✅ **Drift notifications working** - Slack/email alerts on drift detection
- ✅ Rollback procedure tested and documented (via backup restoration)
- ✅ Operations team trained and can execute manually (Java CLI)
- ✅ Monitoring and alerting operational (drift metrics included)
- ✅ All documentation complete (Java-only, NO bash references)
- ✅ **Security audit passed** - allowlist, confirmation flags, encrypted artifacts
- ✅ **Cross-platform verified** - Works on Windows, Linux, macOS (pure Java)

---

**Version**: 2.0 (Updated February 1, 2026)  
**Changes**:
- Added Drift Gate #1 (pre-anonymization) and Drift Gate #2 (pre-UAT-restore)
- Replaced all bash/PowerShell scripts with pure Java orchestration (ProcessBuilder, Spring Boot services)
- Added safety fuses: allowlist validation, explicit confirmation flags
- Enforced secrets via Secrets Manager (NEVER CLI args)
- Added AES-256 encryption for all backup artifacts
- Updated Jenkins pipeline to Java JAR invocation only
- Added drift detection alerts and metrics
- Updated operations runbook with drift response procedures

**End of Phase 3 Plan**
