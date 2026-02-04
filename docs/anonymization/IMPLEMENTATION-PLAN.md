# AMRIT Database Anonymization - Implementation Plan

## Goal
Automate the process of creating anonymized SQL dumps from production backups for safe UAT testing.

## Workflow
```
Production DB → SQL Dump → Anonymization Engine → Anonymized SQL Dump → UAT DB
```

## Architecture Components

### 1. Schema Analyzer (COMPLETED)
- **Purpose**: Discover database schema and detect PII columns
- **Input**: Live database connection
- **Output**: `anonymization-registry.yml` with detected PII fields
- **Status**: ✓ Implemented in `analyzer/` package

### 2. Registry Manager (COMPLETED)
- **Purpose**: Store and load anonymization rules
- **Files**: 
  - `anonymization-registry.yml` - source of truth for rules
  - `pii-detection-rules.yml` - pattern-based PII detection
- **Status**: ✓ Implemented in `registry/` package

### 3. SQL Dump Processor (NEEDS IMPLEMENTATION)
- **Purpose**: Read SQL dump, anonymize data, write new dump
- **Components**:
  - **SQL Parser**: Parse INSERT statements from dump
  - **Data Anonymizer**: Apply strategies to extracted values
  - **SQL Writer**: Generate anonymized INSERT statements
- **Status**: ✗ Not implemented (current executor is for live DB)

### 4. Anonymization Strategies (COMPLETED)
- **Available Strategies**:
  - `HASH_SHA256` - One-way hash (for IDs)
  - `RANDOM_FAKE_DATA` - Java-faker realistic data
  - `PARTIAL_MASK` - Mask characters
  - `GENERALIZE` - Reduce precision
  - `SUPPRESS` - Replace with NULL
  - `PRESERVE` - Keep original
- **Status**: ✓ Implemented in `strategy/` package

### 5. Lookup Table (NEEDS REVISION)
- **Purpose**: Ensure same input → same output across multiple runs
- **Current Issue**: Built for MySQL storage, need file-based for portability
- **Proposed**: Use H2 embedded database or JSON file
- **Status**: ⚠ Needs modification

### 6. CLI Tool (NEEDS REDESIGN)
- **Command**: `java -jar amrit-anonymizer.jar anonymize --input dump.sql --output anonymized.sql`
- **Options**:
  - `--input` - Path to SQL dump file
  - `--output` - Path to output anonymized dump
  - `--registry` - Path to registry YAML
  - `--lookup` - Path to lookup database
  - `--batch-size` - Records per transaction
- **Status**: ✗ Needs complete redesign

## Implementation Phases

### Phase 1: SQL Dump Processing (PRIORITY)
**Goal**: Read and write SQL dumps without anonymization

Tasks:
1. Create `processor.parser.SQLDumpReader` - line-by-line SQL file reader
2. Create `processor.parser.InsertStatementParser` - extract table/columns/values
3. Create `processor.writer.SQLDumpWriter` - write SQL statements to file
4. Test with sample dump file (read → write identity transformation)

**Acceptance Criteria**:
- Can read multi-GB SQL dump files efficiently (streaming)
- Can parse MySQL INSERT statements (single row and batch inserts)
- Can write properly formatted SQL dump
- Memory usage stays constant (streaming, not loading entire file)

### Phase 2: Data Anonymization Integration
**Goal**: Apply anonymization during dump processing

Tasks:
1. Create `processor.transformer.DumpAnonymizer` - orchestrates anonymization
2. Integrate existing `StrategyFactory` and strategies
3. Implement lookup table as embedded H2 database (file-based)
4. Handle batch INSERT statements (multiple rows in one statement)

**Acceptance Criteria**:
- All PII fields defined in registry are anonymized
- Lookup table ensures consistency (same BenRegID → same anonymized value)
- Foreign key relationships preserved (same ID in different tables)
- Progress reporting (rows processed, time remaining)

### Phase 3: CLI and Automation
**Goal**: Single command to anonymize dumps

Tasks:
1. Create `DumpAnonymizerCLI` main class
2. Add command-line argument parsing
3. Create PowerShell script `anonymize-db.ps1` for Windows
4. Create shell script `anonymize-db.sh` for Linux
5. Add Jenkins pipeline configuration

**Acceptance Criteria**:
- Command: `java -jar amrit-anonymizer.jar anonymize --input prod.sql --output uat.sql`
- Shows progress bar during processing
- Logs summary (tables processed, rows anonymized, time taken)
- Exit code 0 on success, non-zero on error

### Phase 4: Testing and Documentation
**Goal**: Validate and document the solution

Tasks:
1. Test with production-sized dump (multi-GB)
2. Verify anonymization (manual spot checks)
3. Load anonymized dump into UAT and test application
4. Write user guide and technical documentation
5. Create video walkthrough

**Acceptance Criteria**:
- Processes 10GB dump in < 2 hours
- All sensitive fields anonymized
- UAT application works with anonymized data
- Documentation complete and reviewed

## Directory Structure

```
AMRIT-DB/
├── src/main/java/com/db/piramalswasthya/anonymization/
│   ├── analyzer/              # Schema discovery (DONE)
│   │   ├── DatabaseSchemaAnalyzer.java
│   │   └── PIIDetector.java
│   ├── registry/              # Rule management (DONE)
│   │   ├── AnonymizationRegistryService.java
│   │   └── RegistryGenerator.java
│   ├── processor/             # SQL dump processing (NEW)
│   │   ├── parser/
│   │   │   ├── SQLDumpReader.java
│   │   │   ├── InsertStatementParser.java
│   │   │   └── SQLStatement.java
│   │   ├── transformer/
│   │   │   ├── DumpAnonymizer.java
│   │   │   └── BatchProcessor.java
│   │   └── writer/
│   │       ├── SQLDumpWriter.java
│   │       └── ProgressReporter.java
│   ├── strategy/              # Anonymization strategies (DONE)
│   │   ├── AnonymizationStrategy.java
│   │   ├── StrategyFactory.java
│   │   └── impl/
│   │       ├── HashSha256Strategy.java
│   │       ├── RandomFakeDataStrategy.java
│   │       └── ... (others)
│   ├── lookup/                # Lookup table (REVISE)
│   │   ├── LookupManager.java
│   │   └── H2LookupDatabase.java
│   ├── cli/                   # Command line (NEW)
│   │   └── DumpAnonymizerCLI.java
│   └── model/                 # Shared models
│       └── AnonymizationRegistry.java
├── scripts/
│   ├── anonymize-db.ps1       # Windows automation
│   ├── anonymize-db.sh        # Linux automation
│   └── jenkins/
│       └── Jenkinsfile
├── docs/anonymization/
│   ├── IMPLEMENTATION-PLAN.md (this file)
│   ├── USER-GUIDE.md
│   ├── TECHNICAL-DESIGN.md
│   └── TROUBLESHOOTING.md
└── src/test/resources/
    └── sample-dump.sql        # Test fixture
```

## Technology Stack

- **Language**: Java 17.0.2
- **Framework**: Spring Boot 3.3.2 (for dependency injection only)
- **Libraries**:
  - `java-faker 1.0.2` - Realistic fake data
  - `commons-codec` - SHA-256 hashing
  - `h2database` - Embedded lookup table
  - `picocli` or `commons-cli` - Command-line parsing
  - `jackson-dataformat-yaml` - YAML parsing
- **Build**: Maven
- **OS Support**: Windows (PowerShell), Linux (Bash)

## CLI Usage Examples

```powershell
# Full anonymization
java -jar amrit-anonymizer.jar anonymize \
  --input production-dump.sql \
  --output uat-dump.sql \
  --registry anonymization-registry.yml \
  --lookup lookup-cache.db

# With custom settings
java -jar amrit-anonymizer.jar anonymize \
  --input prod.sql \
  --output uat.sql \
  --batch-size 10000 \
  --progress \
  --log-level INFO

# Test mode (dry run)
java -jar amrit-anonymizer.jar anonymize \
  --input prod.sql \
  --output uat.sql \
  --dry-run \
  --show-samples

# Jenkins integration
./scripts/anonymize-db.ps1 -InputDump prod.sql -OutputDump uat.sql
```

## Jenkins Pipeline (Proposed)

```groovy
pipeline {
    agent any
    
    parameters {
        string(name: 'PROD_DUMP_PATH', description: 'Path to production SQL dump')
        string(name: 'OUTPUT_PATH', description: 'Path for anonymized dump')
    }
    
    stages {
        stage('Validate Input') {
            steps {
                script {
                    if (!fileExists(params.PROD_DUMP_PATH)) {
                        error "Production dump not found: ${params.PROD_DUMP_PATH}"
                    }
                }
            }
        }
        
        stage('Anonymize Dump') {
            steps {
                sh """
                    java -jar amrit-anonymizer.jar anonymize \
                      --input ${params.PROD_DUMP_PATH} \
                      --output ${params.OUTPUT_PATH} \
                      --registry anonymization-registry.yml \
                      --lookup lookup-cache.db \
                      --progress
                """
            }
        }
        
        stage('Verify Output') {
            steps {
                script {
                    if (!fileExists(params.OUTPUT_PATH)) {
                        error "Anonymized dump not created"
                    }
                }
            }
        }
        
        stage('Archive Dump') {
            steps {
                archiveArtifacts artifacts: "${params.OUTPUT_PATH}", fingerprint: true
            }
        }
    }
    
    post {
        success {
            echo "Anonymization completed successfully!"
        }
        failure {
            echo "Anonymization failed. Check logs."
        }
    }
}
```

## Next Steps

1. **Immediate**: Implement Phase 1 (SQL dump reading/writing)
2. **This Week**: Integrate anonymization (Phase 2)
3. **Next Week**: CLI tool and automation (Phase 3)
4. **Testing**: Phase 4 with real production dump

## Open Questions

1. **Dump Size**: Expected size of production dumps? (For memory planning)
2. **Compression**: Should we support gzipped dumps? (.sql.gz)
3. **Restore Testing**: Who tests the anonymized dump in UAT?
4. **Frequency**: How often will this run? (Daily, weekly, on-demand?)
5. **Storage**: Where are dumps stored during processing?

## Success Metrics

- **Performance**: Process 1GB dump in < 10 minutes
- **Accuracy**: 100% of PII fields anonymized per registry
- **Consistency**: Same input ID → same output ID across runs
- **Reliability**: Zero data loss, valid SQL output
- **Usability**: Single command, clear progress, good error messages
