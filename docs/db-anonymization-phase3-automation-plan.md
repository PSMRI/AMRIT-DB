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

Phase 3 focuses on **automation, deployment, and operational readiness**. This phase provides two deployment modes:

1. **Jenkins Mode** (Preferred): CI/CD pipeline with scheduling and monitoring
2. **Standalone Mode**: Java CLI application for manual/cron execution

Both modes are **cross-platform** (Windows, Linux, macOS) and use only Java - no OS-specific scripts.

### Key Deliverables

- ✅ Production database backup automation (Java-based, zero production impact)
- ✅ **Option A**: Jenkins pipeline (if Jenkins available)
- ✅ **Option B**: Standalone Java CLI (if no Jenkins)
- ✅ Java-based orchestration (cross-platform)
- ✅ UAT environment automated restoration
- ✅ Scheduled execution (Jenkins cron OR Windows Task Scheduler / Linux cron)
- ✅ Monitoring, alerting, and notifications
- ✅ Operations runbook (both deployment modes)
- ✅ Disaster recovery procedure

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
| **Production Safety** | Backup production with zero impact | No production performance degradation during backup |
| **Scheduled Execution** | Automated weekly/monthly UAT refresh | Cron/Task Scheduler runs successfully |
| **Monitoring** | Real-time progress tracking and alerting | Slack/email notifications at key stages |
| **Rollback Capability** | Quick recovery from failed anonymization | Restore UAT to previous state in <15 minutes |
| **Documentation** | Complete operations documentation | Runbook covers all scenarios |

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
| **Execution** | Jenkins web UI + API | Java CLI command |
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
# Windows (PowerShell)
java -jar amrit-anonymization-cli.jar --refresh-uat

# Linux/Mac
java -jar amrit-anonymization-cli.jar --refresh-uat
```

**Features**:
- All Phase 2 anonymization engine included
- Built-in backup/restore logic
- Configuration via properties file or environment variables
- Detailed logging to console and file
- Exit codes for automation (0=success, 1=failure)
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
│  │  • Run Java anonymization engine (Phase 2)             │      │
│  │  • Validate anonymized data                            │      │
│  │  • Export anonymized backup                            │      │
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
                       │ [4] Restore to UAT
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
| **Anonymization Server** | EC2 / VM | Temporary DB + Java engine | Staging VPC |
| **UAT Database** | MySQL 8.0 | Target environment | UAT VPC |
| **Jenkins Server** | Jenkins 2.x | Orchestration & scheduling | CI/CD VPC |
| **Monitoring** | Prometheus/Grafana | Metrics & alerts | Monitoring VPC |

---

## 3. Production Backup Strategy

### 3.1 Backup Options Analysis

#### Option 1: mysqldump from Read Replica (RECOMMENDED)

**Pros**:
- ✅ Zero production impact (reads from replica)
- ✅ Consistent snapshot (--single-transaction)
- ✅ Simple to implement

**Cons**:
- ❌ Slower for very large databases (>100GB)
- ❌ Requires read replica setup

**Implementation**:

```bash
#!/bin/bash
# scripts/backup/backup_from_replica.sh

set -e

BACKUP_DIR="/data/backups/production"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_PATH="${BACKUP_DIR}/prod_backup_${TIMESTAMP}"

# MySQL connection details (read replica)
MYSQL_HOST="${REPLICA_HOST:-prod-db-replica.example.com}"
MYSQL_USER="${MYSQL_USER:-backup_user}"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"

DATABASES=("db_identity" "db_1097_identity" "db_iemr" "db_reporting")

echo "[$(date)] Starting production backup from replica..."

mkdir -p "${BACKUP_PATH}"

for db in "${DATABASES[@]}"; do
    echo "[$(date)] Backing up ${db}..."
    
    mysqldump \
        --host="${MYSQL_HOST}" \
        --user="${MYSQL_USER}" \
        --password="${MYSQL_PASSWORD}" \
        --single-transaction \
        --quick \
        --lock-tables=false \
        --routines \
        --triggers \
        --events \
        "${db}" > "${BACKUP_PATH}/${db}.sql"
    
    # Compress
    gzip "${BACKUP_PATH}/${db}.sql"
    
    echo "[$(date)] ${db} backup complete ($(du -h ${BACKUP_PATH}/${db}.sql.gz | cut -f1))"
done

# Create tarball
tar -czf "${BACKUP_PATH}.tar.gz" -C "${BACKUP_DIR}" "prod_backup_${TIMESTAMP}"
rm -rf "${BACKUP_PATH}"

echo "[$(date)] Backup complete: ${BACKUP_PATH}.tar.gz"
echo "[$(date)] Total size: $(du -h ${BACKUP_PATH}.tar.gz | cut -f1)"

# Upload to S3 (optional)
if [ "${UPLOAD_TO_S3}" == "true" ]; then
    aws s3 cp "${BACKUP_PATH}.tar.gz" "s3://amrit-backups/production/"
    echo "[$(date)] Uploaded to S3"
fi

# Output backup path for Jenkins
echo "BACKUP_PATH=${BACKUP_PATH}.tar.gz" > /tmp/backup_info.env
```

#### Option 2: Percona XtraBackup (Advanced)

**Use Case**: Very large databases (>500GB) requiring faster backup/restore

```bash
#!/bin/bash
# scripts/backup/xtrabackup.sh

xtrabackup --backup \
    --target-dir=/data/backups/xtra_${TIMESTAMP} \
    --user=backup_user \
    --password=${MYSQL_PASSWORD} \
    --slave-info
```

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

## 4. UAT Restoration Process

### 4.1 Restore Script

```bash
#!/bin/bash
# scripts/restore/restore_to_uat.sh

set -e

ANONYMIZED_BACKUP="$1"

if [ -z "${ANONYMIZED_BACKUP}" ]; then
    echo "Error: No backup file specified"
    echo "Usage: $0 <anonymized_backup.tar.gz>"
    exit 1
fi

# UAT MySQL connection
UAT_MYSQL_HOST="${UAT_MYSQL_HOST:-uat-db.example.com}"
UAT_MYSQL_USER="${UAT_MYSQL_USER:-uat_admin}"
UAT_MYSQL_PASSWORD="${UAT_MYSQL_PASSWORD}"

echo "[$(date)] Starting UAT restoration..."

# Extract backup
TEMP_DIR="/tmp/uat_restore_$$"
mkdir -p "${TEMP_DIR}"
tar -xzf "${ANONYMIZED_BACKUP}" -C "${TEMP_DIR}"

DATABASES=("db_identity" "db_1097_identity" "db_iemr" "db_reporting")

for db in "${DATABASES[@]}"; do
    echo "[$(date)] Restoring ${db} to UAT..."
    
    # Drop existing database (WARNING: UAT only!)
    mysql \
        --host="${UAT_MYSQL_HOST}" \
        --user="${UAT_MYSQL_USER}" \
        --password="${UAT_MYSQL_PASSWORD}" \
        -e "DROP DATABASE IF EXISTS ${db}; CREATE DATABASE ${db};"
    
    # Restore
    gunzip -c "${TEMP_DIR}/${db}.sql.gz" | mysql \
        --host="${UAT_MYSQL_HOST}" \
        --user="${UAT_MYSQL_USER}" \
        --password="${UAT_MYSQL_PASSWORD}" \
        "${db}"
    
    echo "[$(date)] ${db} restored successfully"
done

# Cleanup
rm -rf "${TEMP_DIR}"

echo "[$(date)] UAT restoration complete!"
```

### 4.2 Pre-Restoration Validation

```bash
#!/bin/bash
# scripts/validation/pre_restore_checks.sh

set -e

echo "[$(date)] Running pre-restoration checks..."

# Check 1: UAT database is accessible
mysql --host="${UAT_MYSQL_HOST}" --user="${UAT_MYSQL_USER}" --password="${UAT_MYSQL_PASSWORD}" -e "SELECT 1" > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ UAT database accessible"
else
    echo "❌ Cannot connect to UAT database"
    exit 1
fi

# Check 2: Sufficient disk space
REQUIRED_SPACE_GB=100
AVAILABLE_SPACE_GB=$(df -BG /var/lib/mysql | tail -1 | awk '{print $4}' | sed 's/G//')

if [ "${AVAILABLE_SPACE_GB}" -ge "${REQUIRED_SPACE_GB}" ]; then
    echo "✅ Sufficient disk space (${AVAILABLE_SPACE_GB}GB available)"
else
    echo "❌ Insufficient disk space (${AVAILABLE_SPACE_GB}GB available, ${REQUIRED_SPACE_GB}GB required)"
    exit 1
fi

# Check 3: Anonymized backup file exists
if [ -f "${ANONYMIZED_BACKUP}" ]; then
    echo "✅ Anonymized backup found: ${ANONYMIZED_BACKUP}"
else
    echo "❌ Anonymized backup not found: ${ANONYMIZED_BACKUP}"
    exit 1
fi

echo "[$(date)] All pre-restoration checks passed ✅"
```

---

## 5. Jenkins Pipeline Design

### 5.1 Jenkinsfile

```groovy
// Jenkinsfile.uat-refresh

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
        ANONYMIZATION_CONFIG = 'docs/phase1-outputs/anonymization-strategy-map.json'
        SLACK_CHANNEL = '#amrit-uat-refresh'
    }
    
    stages {
        stage('Initialize') {
            steps {
                script {
                    echo "🚀 Starting UAT Refresh Pipeline"
                    echo "Mode: ${params.EXECUTION_MODE}"
                    
                    if (params.SEND_NOTIFICATIONS) {
                        slackSend(
                            channel: env.SLACK_CHANNEL,
                            color: 'good',
                            message: "UAT Refresh Started\nMode: ${params.EXECUTION_MODE}\nTriggered by: ${currentBuild.getBuildCauses()[0].userId}"
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
                    echo "📦 Creating production backup from read replica..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/backup
                        bash backup_from_replica.sh
                    '''
                    
                    // Load backup path
                    def backupInfo = readProperties file: '/tmp/backup_info.env'
                    env.BACKUP_PATH = backupInfo.BACKUP_PATH
                    
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
                    
                    sh '''
                        # Start temporary MySQL instance in Docker
                        docker run -d \
                            --name amrit-anonymization-db \
                            -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
                            -v ${BACKUP_DIR}:/backups \
                            -p 3307:3306 \
                            mysql:8.0
                        
                        # Wait for MySQL to be ready
                        sleep 30
                        
                        docker exec amrit-anonymization-db \
                            mysql -uroot -p${MYSQL_ROOT_PASSWORD} \
                            -e "SELECT 1"
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
                    echo "📥 Restoring production backup to temporary database..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/restore
                        bash restore_to_temp_db.sh ${BACKUP_PATH}
                    '''
                }
            }
        }
        
        stage('Run Anonymization') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "🎭 Running anonymization engine..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB
                        
                        # Run Java anonymization application
                        ./mvnw spring-boot:run \
                            -Dspring-boot.run.profiles=anonymization \
                            -Dspring-boot.run.arguments="--anonymize \
                                --config=${ANONYMIZATION_CONFIG} \
                                --host=localhost \
                                --port=3307"
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
                    echo "✔️  Running post-anonymization validation..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/validation
                        bash post_anonymization_checks.sh
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
                    echo "💾 Exporting anonymized backup..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/backup
                        bash export_anonymized_backup.sh
                    '''
                    
                    def exportInfo = readProperties file: '/tmp/export_info.env'
                    env.ANONYMIZED_BACKUP = exportInfo.ANONYMIZED_BACKUP
                    
                    echo "Anonymized backup: ${env.ANONYMIZED_BACKUP}"
                }
            }
        }
        
        stage('Cleanup Temp DB') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'ANONYMIZE_ONLY' }
            }
            steps {
                script {
                    echo "🧹 Cleaning up temporary database..."
                    
                    sh '''
                        docker stop amrit-anonymization-db
                        docker rm amrit-anonymization-db
                    '''
                }
            }
        }
        
        stage('Pre-Restoration Checks') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'RESTORE_ONLY' }
            }
            steps {
                script {
                    echo "🔍 Running pre-restoration checks..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/validation
                        bash pre_restore_checks.sh
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
                    echo "🎯 Restoring anonymized data to UAT..."
                    
                    // Create UAT backup before overwrite (rollback capability)
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/backup
                        bash backup_uat_current.sh
                    '''
                    
                    // Restore
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/restore
                        bash restore_to_uat.sh ${ANONYMIZED_BACKUP}
                    '''
                    
                    echo "✅ UAT database restored successfully"
                }
            }
        }
        
        stage('Post-Restoration Validation') {
            when {
                expression { params.EXECUTION_MODE == 'FULL_REFRESH' || params.EXECUTION_MODE == 'RESTORE_ONLY' }
            }
            steps {
                script {
                    echo "🔬 Running post-restoration validation..."
                    
                    sh '''
                        cd ${WORKSPACE}/AMRIT-DB/scripts/validation
                        bash post_restore_checks.sh
                    '''
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
                        message: "✅ UAT Refresh Successful\nDuration: ${currentBuild.durationString}\nUAT is ready for testing!"
                    )
                    
                    emailext(
                        to: 'amrit-dev-team@example.com',
                        subject: "✅ UAT Refresh Successful - ${new Date().format('yyyy-MM-dd')}",
                        body: """
                            UAT environment has been refreshed with anonymized production data.
                            
                            Details:
                            - Execution Mode: ${params.EXECUTION_MODE}
                            - Duration: ${currentBuild.durationString}
                            - Triggered by: ${currentBuild.getBuildCauses()[0].userId}
                            
                            UAT is now ready for testing!
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
                        message: "❌ UAT Refresh Failed\nCheck Jenkins console: ${env.BUILD_URL}"
                    )
                    
                    emailext(
                        to: 'amrit-dev-team@example.com',
                        subject: "❌ UAT Refresh Failed - ${new Date().format('yyyy-MM-dd')}",
                        body: """
                            UAT refresh failed. Please check Jenkins logs.
                            
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

### 5.2 Jenkins Job Configuration

**Job Type**: Pipeline

**Triggers**:
- Cron: `0 2 * * 0` (Every Sunday at 2 AM)
- Manual: Build with Parameters

**Parameters**:
- `EXECUTION_MODE`: FULL_REFRESH / ANONYMIZE_ONLY / RESTORE_ONLY
- `SKIP_BACKUP`: true/false
- `SEND_NOTIFICATIONS`: true/false

**Agent Requirements**:
- Label: `amrit-anonymization-agent`
- Java 17 installed
- Docker installed (for temporary MySQL)
- MySQL client tools
- 200GB+ free disk space

---

## 6. Bash Orchestration Scripts

### 6.1 Master Orchestration Script

```bash
#!/bin/bash
# scripts/orchestrate_uat_refresh.sh

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="/data/backups"
LOG_DIR="/var/log/amrit-anonymization"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="${LOG_DIR}/uat_refresh_${TIMESTAMP}.log"

# Load environment variables
source "${SCRIPT_DIR}/../config/production.env"
source "${SCRIPT_DIR}/../config/uat.env"

# Functions
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "${LOG_FILE}"
}

error_exit() {
    log "ERROR: $1"
    exit 1
}

# Main execution
main() {
    log "========================================="
    log "AMRIT UAT Refresh - Starting"
    log "========================================="
    
    # Step 1: Backup production
    log "Step 1: Backing up production databases..."
    bash "${SCRIPT_DIR}/backup/backup_from_replica.sh" || error_exit "Production backup failed"
    source /tmp/backup_info.env
    log "Backup created: ${BACKUP_PATH}"
    
    # Step 2: Setup anonymization environment
    log "Step 2: Setting up anonymization environment..."
    bash "${SCRIPT_DIR}/setup/setup_temp_db.sh" || error_exit "Setup failed"
    
    # Step 3: Restore to temp DB
    log "Step 3: Restoring backup to temporary database..."
    bash "${SCRIPT_DIR}/restore/restore_to_temp_db.sh" "${BACKUP_PATH}" || error_exit "Restore failed"
    
    # Step 4: Run anonymization
    log "Step 4: Running anonymization..."
    cd "${SCRIPT_DIR}/../.."
    ./mvnw spring-boot:run \
        -Dspring-boot.run.profiles=anonymization \
        -Dspring-boot.run.arguments="--anonymize --config=${ANONYMIZATION_CONFIG}" \
        || error_exit "Anonymization failed"
    
    # Step 5: Validation
    log "Step 5: Validating anonymized data..."
    bash "${SCRIPT_DIR}/validation/post_anonymization_checks.sh" || error_exit "Validation failed"
    
    # Step 6: Export anonymized backup
    log "Step 6: Exporting anonymized backup..."
    bash "${SCRIPT_DIR}/backup/export_anonymized_backup.sh" || error_exit "Export failed"
    source /tmp/export_info.env
    log "Anonymized backup: ${ANONYMIZED_BACKUP}"
    
    # Step 7: Cleanup temp DB
    log "Step 7: Cleaning up temporary database..."
    bash "${SCRIPT_DIR}/setup/cleanup_temp_db.sh"
    
    # Step 8: Restore to UAT
    log "Step 8: Restoring to UAT environment..."
    bash "${SCRIPT_DIR}/restore/restore_to_uat.sh" "${ANONYMIZED_BACKUP}" || error_exit "UAT restore failed"
    
    # Step 9: Post-restoration validation
    log "Step 9: Final validation..."
    bash "${SCRIPT_DIR}/validation/post_restore_checks.sh" || error_exit "Final validation failed"
    
    log "========================================="
    log "UAT Refresh completed successfully!"
    log "========================================="
}

# Execute
mkdir -p "${LOG_DIR}"
main 2>&1 | tee -a "${LOG_FILE}"
```

---

## 7. Configuration Management

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

- ✅ Jenkins pipeline runs end-to-end successfully
- ✅ Scheduled weekly UAT refresh working automatically
- ✅ Zero production impact during backup (validated via monitoring)
- ✅ UAT refresh completes in <2 hours
- ✅ Rollback procedure tested and documented
- ✅ Operations team trained and can execute manually
- ✅ Monitoring and alerting operational
- ✅ All documentation complete
- ✅ Security audit passed

---

**End of Phase 3 Plan**
