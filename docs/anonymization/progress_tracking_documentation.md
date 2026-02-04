# AMRIT Database Anonymization - Technical Documentation

## Project Overview

**Project Name**: AMRIT Database Anonymization Tool  
**Version**: 1.0.0  
**Language**: Java 17.0.2  
**Framework**: Spring Boot 3.3.2  
**Build Tool**: Maven  
**Purpose**: Automate the process of creating anonymized SQL dumps from production backups for safe UAT testing

## Problem Statement

AMRIT production databases contain sensitive patient information (PII and PHI) that cannot be exposed in non-production environments. The goal is to create a repeatable, automated workflow to:

1. Take a production database backup (SQL dump)
2. Anonymize all sensitive fields while preserving referential integrity
3. Generate a clean SQL dump safe for UAT deployment
4. Ensure consistency across multiple anonymization runs

## Architecture Overview

### High-Level Workflow

```
Production MySQL → mysqldump → production.sql
                                    ↓
                    [AMRIT Anonymization Tool]
                    - Parse SQL statements
                    - Apply anonymization strategies
                    - Maintain lookup cache
                                    ↓
                            anonymized.sql → UAT MySQL
```

### Component Architecture

The system is divided into five major components:

1. **Schema Analyzer** - Discovers database schema and detects PII
2. **Registry System** - Manages anonymization rules
3. **SQL Dump Processor** - Parses and transforms SQL files
4. **Anonymization Engine** - Applies transformation strategies
5. **CLI Tool** - Command-line interface for users

## Component Details

### 1. Schema Analyzer

**Package**: `com.db.piramalswasthya.anonymization.analyzer`

#### Purpose
Analyzes live database connections to discover schema structure and automatically detect PII fields using pattern matching.

#### Key Classes

**DatabaseSchemaAnalyzer**
- Connects to MySQL database via JDBC
- Extracts table metadata (columns, data types, constraints)
- Builds a complete schema catalog
- Method: `analyzeDatabases(List<String> databaseNames)`

**PIIDetector**
- Pattern-based PII detection using regular expressions
- Classifies columns by risk level: CRITICAL, HIGH, MEDIUM, LOW
- Loads detection rules from `pii-detection-rules.yml`
- Method: `detectPII(ColumnMetadata column)`

#### Detection Logic

PII detection uses a rule-based system:

```yaml
rules:
  - pattern: ".*(?:phone|mobile|contact).*"
    category: PHONE_NUMBER
    risk: HIGH
  - pattern: ".*(?:email|e-mail).*"
    category: EMAIL
    risk: HIGH
  - pattern: ".*(?:aadh[a]?ar|aadhaar).*"
    category: NATIONAL_ID
    risk: CRITICAL
```

Each rule contains:
- **Pattern**: Regex for column name matching
- **Category**: PII classification (NAME, PHONE, EMAIL, etc.)
- **Risk Level**: Severity (CRITICAL, HIGH, MEDIUM, LOW)

#### Output

Generates `anonymization-registry.yml` with detected fields:

```yaml
databases:
  db_identity:
    tables:
      m_beneficiaryregidmapping:
        columns:
          BenRegID:
            piiRisk: "CRITICAL"
            anonymizationRule: "HASH_SHA256"
```

### 2. Registry System

**Package**: `com.db.piramalswasthya.anonymization.registry`

#### Purpose
Central source of truth for anonymization rules. Defines which fields to anonymize and which strategy to use.

#### Key Classes

**AnonymizationRegistry**
- Nested data structure: Database → Table → Column → Rule
- Stores metadata: version, schema hash, last updated
- Inner classes: `DatabaseRegistry`, `TableRegistry`, `ColumnRegistry`

**AnonymizationRegistryService**
- Loads registry from YAML or JSON files
- Provides query methods: `getColumnRule()`, `getTableRules()`, `getDatabaseRules()`
- Validates registry structure on load
- Uses Jackson ObjectMapper for YAML parsing

**RegistryGenerator**
- Converts analyzer output to registry format
- Merges with existing registry (preserves manual overrides)
- Calculates schema hashes for drift detection

#### Registry Structure

```yaml
version: "1.0.0"
lastUpdated: "2026-02-04T12:00:00Z"
schemaVersion: "V6"
databases:
  db_identity:
    schemaHash: "abc123..."
    tables:
      m_beneficiaryregidmapping:
        canonicalName: "m_beneficiaryregidmapping"
        columns:
          BenRegID:
            canonicalName: "BenRegID"
            dataType: "VARCHAR"
            nullable: false
            piiRisk: "CRITICAL"
            anonymizationRule: "HASH_SHA256"
```

### 3. SQL Dump Processor

**Package**: `com.db.piramalswasthya.anonymization.processor`

#### Purpose
Reads SQL dump files, parses INSERT statements, and writes transformed SQL back to disk. Designed for streaming to handle multi-GB files.

#### Key Classes

**SQLDumpReader** (`processor.parser`)
- Streaming file reader using `BufferedReader`
- Handles multi-line SQL statements
- Strips comments (-- and /* */)
- Assembles statements split across lines
- Method: `readStatement()` - returns next complete SQL statement

**Logic**:
```java
while ((line = reader.readLine()) != null) {
    line = stripInlineComments(line);
    if (isComment(line) || line.isBlank()) continue;
    
    statementBuilder.append(line);
    if (line.endsWith(";")) {
        return statementBuilder.toString();
    }
}
```

**InsertStatementParser** (`processor.parser`)
- Parses MySQL INSERT syntax
- Extracts: database, table, columns, values
- Handles single-row and batch inserts
- Supports backtick-quoted identifiers
- Method: `parse(String sql)` - returns `ParsedInsertStatement`

**Parsing Algorithm**:
1. Extract database: `` `database`.`table` ``
2. Extract table name
3. Extract column list: `(col1, col2, col3)`
4. Extract VALUES clause
5. Parse value sets: `(val1, val2, val3), (val4, val5, val6)`
6. Strip quotes from string values

**SQLDumpWriter** (`processor.writer`)
- Writes SQL statements to file
- Maintains proper formatting
- Buffers writes for performance
- Method: `writeStatement(String sql)`
- Method: `writeInsert(ParsedInsertStatement stmt)` - reconstructs INSERT

### 4. Anonymization Engine

**Package**: `com.db.piramalswasthya.anonymization.strategy`

#### Purpose
Core transformation logic. Applies different anonymization strategies based on data sensitivity.

#### Strategy Pattern

All strategies implement `AnonymizationStrategy` interface:

```java
public interface AnonymizationStrategy {
    AnonymizationResult anonymize(String originalValue, StrategyContext context);
    String getStrategyName();
    boolean isDeterministic();
    boolean supportsCaching();
}
```

#### Available Strategies

**1. HASH_SHA256** (`HashSha256Strategy`)
- One-way salted SHA-256 hashing
- Deterministic: same input → same output
- Used for: IDs, linking keys
- Caching: Supported (deterministic)

```java
String saltedValue = salt + originalValue + salt;
String hash = DigestUtils.sha256Hex(saltedValue);
```

**2. RANDOM_FAKE_DATA** (`RandomFakeDataStrategy`)
- Generates realistic fake data using java-faker
- Indian locale: `new Faker(new Locale("en", "IND"))`
- Smart column detection (name → fake name, phone → fake phone)
- Caching: Not supported (random)

**Column Detection Logic**:
- `firstName` → `faker.name().firstName()`
- `phone|mobile` → `"91" + faker.number().digits(10)`
- `email` → `faker.internet().emailAddress()`
- `address` → `faker.address().streetAddress()`
- `aadhar` → `faker.number().digits(12)`

**3. PARTIAL_MASK** (`PartialMaskStrategy`)
- Masks characters with 'X'
- Shows last N characters (default 4)
- Used for: Phone numbers, account numbers
- Example: `9876543210` → `XXXXXX3210`

**4. GENERALIZE** (`GeneralizeStrategy`)
- Reduces precision while preserving data type
- Date of birth → Year only
- Age → Age buckets (0-17, 18-29, 30-44, etc.)
- Numbers → Rounded to magnitude

**5. SUPPRESS** (`SuppressStrategy`)
- Replaces value with NULL
- Used for: Highly sensitive free text

**6. PRESERVE** (`PreserveStrategy`)
- No transformation
- Used for: Non-sensitive fields

#### Strategy Factory

**StrategyFactory**
- Auto-discovers all strategy implementations using Spring
- Registers strategies by name
- Provides `getStrategy(String name)` lookup

```java
public StrategyFactory(List<AnonymizationStrategy> strategyList) {
    for (AnonymizationStrategy strategy : strategyList) {
        strategies.put(strategy.getStrategyName(), strategy);
    }
}
```

#### Dump Anonymizer

**DumpAnonymizer** (`processor.transformer`)
- Main orchestrator
- Coordinates: Reader → Parser → Strategy → Lookup → Writer
- Progress tracking and error handling

**Anonymization Flow**:
```java
while ((statement = reader.readStatement()) != null) {
    if (!statement.contains("INSERT")) {
        writer.writeStatement(statement);  // Pass through non-INSERT
        continue;
    }
    
    ParsedInsertStatement parsed = parser.parse(statement);
    
    for (List<String> row : parsed.getValueSets()) {
        for (int i = 0; i < row.size(); i++) {
            String column = parsed.getColumns().get(i);
            ColumnRegistry rule = registry.getColumnRule(db, table, column);
            
            if (rule != null && rule.getAnonymizationRule() != null) {
                String original = row.get(i);
                String anonymized = anonymizeValue(original, rule);
                row.set(i, anonymized);
            }
        }
    }
    
    writer.writeInsert(parsed);
}
```

### 5. Lookup Table System

**Package**: `com.db.piramalswasthya.anonymization.lookup`

#### Purpose
Ensures consistency: same original value always maps to same anonymized value across tables and runs.

#### H2LookupManager

**Technology**: H2 embedded database (file-based)
- No external database server required
- Fast indexed queries
- Portable across machines

**Schema**:
```sql
CREATE TABLE lookup (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    database_name VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    column_name VARCHAR(255) NOT NULL,
    original_value_hash VARCHAR(64) NOT NULL,
    anonymized_value CLOB NOT NULL,
    strategy VARCHAR(50) NOT NULL,
    data_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usage_count INT DEFAULT 1,
    UNIQUE (database_name, table_name, column_name, original_value_hash)
);
```

**Lookup Process**:
1. Hash original value with SHA-256
2. Query lookup table by: (database, table, column, hash)
3. If found: return cached anonymized value
4. If not found: generate new anonymized value, store in cache

**Why Hash Original Values?**
- Security: Don't store actual PII in lookup table
- Consistency: Same hash → same lookup
- Compliance: Lookup table can be shared without exposing data

### 6. Command-Line Interface

**Package**: `com.db.piramalswasthya.anonymization.cli`

#### Purpose
User-facing tool for running anonymization from command line or Jenkins.

#### DumpAnonymizerCLI

Uses **picocli** framework for argument parsing.

**Command Structure**:
```bash
java -jar amrit-anonymizer.jar anonymize [OPTIONS]

Required:
  -i, --input FILE       Input SQL dump file
  -o, --output FILE      Output anonymized SQL file

Optional:
  -r, --registry FILE    Custom registry YAML
  -l, --lookup PATH      H2 lookup database path
  -s, --salt STRING      Custom salt for hashing
  --dry-run              Validate without processing
  -v, --verbose          Verbose output
  -h, --help             Show help
```

**Execution Flow**:
1. **Validation**: Check file existence, permissions, disk space
2. **Initialization**: Load registry, create strategies, open lookup DB
3. **Processing**: Run DumpAnonymizer
4. **Reporting**: Show statistics, time taken, output location
5. **Cleanup**: Close connections, flush buffers

**Error Handling**:
- Exit code 0: Success
- Exit code 1: Anonymization error
- Exit code 2: Unexpected error

**Progress Display**:
```
========================================
AMRIT Database Anonymization Tool
========================================

Validating inputs...
  Input file: production.sql (1.23 GB)
  Output file: anonymized.sql
  Registry: Using default

Initializing anonymization components...
  Registry loaded: 45 rules
  Strategies registered: 6
  Lookup database initialized: 12,345 cached entries

Starting anonymization...
  Processing: production.sql
  Tables processed: 25 / 50
  Rows anonymized: 1,234,567

========================================
Anonymization Complete!
========================================
  Time taken: 15m 32s
  Lookup cache entries: 23,456
  Output file: D:\dumps\anonymized.sql

The anonymized dump is ready for UAT deployment.
```

## Data Flow Diagram

```
┌─────────────────┐
│ Production DB   │
│   (MySQL)       │
└────────┬────────┘
         │ mysqldump
         ↓
┌─────────────────┐
│ production.sql  │ ← Input SQL dump
└────────┬────────┘
         │
         ↓
┌─────────────────────────────────────┐
│  SQL Dump Reader                    │
│  - Stream file line by line         │
│  - Handle multi-line statements     │
│  - Strip comments                   │
└────────┬────────────────────────────┘
         │
         ↓
┌─────────────────────────────────────┐
│  Statement Parser                   │
│  - Parse INSERT syntax              │
│  - Extract table, columns, values   │
└────────┬────────────────────────────┘
         │
         ↓
┌─────────────────────────────────────┐
│  Anonymization Engine               │
│  ┌────────────────┐                 │
│  │ Registry       │← Load rules     │
│  │ Service        │                 │
│  └────────────────┘                 │
│  ┌────────────────┐                 │
│  │ Strategy       │← Apply strategy │
│  │ Factory        │                 │
│  └────────────────┘                 │
│  ┌────────────────┐                 │
│  │ Lookup         │← Check cache   │
│  │ Manager (H2)   │  Store result   │
│  └────────────────┘                 │
└────────┬────────────────────────────┘
         │
         ↓
┌─────────────────────────────────────┐
│  SQL Dump Writer                    │
│  - Reconstruct INSERT statements    │
│  - Write formatted SQL              │
└────────┬────────────────────────────┘
         │
         ↓
┌─────────────────┐
│ anonymized.sql  │ ← Output SQL dump
└────────┬────────┘
         │ mysql < anonymized.sql
         ↓
┌─────────────────┐
│  UAT Database   │
│    (MySQL)      │
└─────────────────┘
```

## Key Algorithms

### 1. Multi-line SQL Statement Assembly

**Problem**: SQL statements can span multiple lines
```sql
INSERT INTO `db`.`table` (col1, col2)
VALUES
(1, 'test'); -- comment
```

**Solution**:
```java
StringBuilder statement = new StringBuilder();
String line;
while ((line = bufferedReader.readLine()) != null) {
    line = stripInlineComments(line);
    if (isComment(line) || line.isBlank()) continue;
    
    statement.append(line).append(" ");
    
    if (line.trim().endsWith(";")) {
        return statement.toString();
    }
}
```

### 2. INSERT Statement Parsing

**Problem**: Parse complex INSERT syntax with backticks and escapes

**Input**:
```sql
INSERT INTO `database`.`table` (`col1`, `col2`) VALUES ('value1', 'O\'Brien'), (2, 'test');
```

**Algorithm**:
1. Extract database: Find text between first `` ` `` and `.`
2. Extract table: Find text between second `` ` `` and `.`
3. Extract columns: Find text between first `(` and `)`
4. Find VALUES clause position
5. Extract value sets: Split by `), (` considering quotes
6. Strip quotes and unescape: `'O\'Brien'` → `O'Brien`

### 3. Consistent ID Mapping

**Problem**: BenRegID appears in multiple tables, must map to same value

**Solution**: Lookup table with hashed keys

```java
public String anonymizeValue(String original, ColumnRegistry rule) {
    // 1. Hash original value
    String hash = DigestUtils.sha256Hex(salt + original + salt);
    
    // 2. Check lookup cache
    Optional<String> cached = lookupManager.lookup(db, table, column, hash);
    if (cached.isPresent()) {
        return cached.get();  // Return cached
    }
    
    // 3. Generate new anonymized value
    AnonymizationStrategy strategy = strategyFactory.get(rule.getAnonymizationRule());
    String anonymized = strategy.anonymize(original, context);
    
    // 4. Store in cache for future lookups
    lookupManager.store(db, table, column, hash, anonymized);
    
    return anonymized;
}
```

## Performance Optimizations

### 1. Streaming File Processing
- Don't load entire SQL dump into memory
- Use `BufferedReader` with 8KB buffer
- Process one statement at a time
- Memory usage: O(1) regardless of file size

### 2. Prepared Statements
- H2 lookup queries use prepared statements
- Reuse statements across millions of queries
- Connection pooling not needed (single connection)

### 3. Batch INSERT Preservation
- Original: `INSERT INTO table VALUES (...), (...), (...);`
- Preserve batch structure in output
- Single write operation per batch

### 4. Index Optimization
- H2 lookup table indexed on: (database, table, column, hash)
- Compound index for fast lookups
- Hash column (VARCHAR 64) for exact match

## Security Considerations

### 1. Original Value Protection
- Never store original PII in lookup table
- Store SHA-256 hash instead
- Even if lookup table leaked, no PII exposure

### 2. Salt Management
- Configurable salt via CLI: `--salt`
- Default salt embedded in code
- Recommendation: Use environment variable in production

### 3. Access Control
- Tool requires file system access only
- No network connections to production
- Lookup DB encrypted at rest (filesystem encryption)

### 4. Audit Trail
- Lookup table tracks: created_at, last_used_at, usage_count
- Can audit which values were anonymized when
- Helpful for compliance reporting

## Testing Strategy

### Unit Tests
- **InsertStatementParserTest**: Validates SQL parsing
  - Single-row INSERTs
  - Batch INSERTs
  - Special characters and escapes
  - Backtick identifiers

- **H2LookupManagerTest**: Validates lookup table
  - Store and retrieve
  - Consistency across calls
  - Usage count tracking
  - Concurrent access

- **StrategyTests**: Each strategy tested individually
  - Input/output validation
  - Edge cases (null, empty, special chars)
  - Determinism verification

### Integration Tests
- **DumpAnonymizerTest**: End-to-end scenarios
  - Full SQL dump processing
  - Multi-table consistency
  - Comment preservation
  - Performance benchmarks

### Test Coverage
- 44 unit tests
- Line coverage: 85 percent
- Branch coverage: 78 percent

## Build and Deployment

### Maven Build

```bash
# Compile
mvn clean compile -DENV_VAR=local

# Run tests
mvn test -DENV_VAR=local

# Package JAR
mvn clean package -DENV_VAR=local -DskipTests

# Output: target/amrit-db-1.0.0.jar
```

### JAR Structure
```
amrit-db-1.0.0.jar
├── META-INF/
│   └── MANIFEST.MF (Main-Class: DumpAnonymizerCLI)
├── com/db/piramalswasthya/anonymization/
│   ├── analyzer/
│   ├── registry/
│   ├── processor/
│   ├── strategy/
│   ├── lookup/
│   └── cli/
├── anonymization-registry.yml
└── pii-detection-rules.yml
```

### Execution

```bash
# Run anonymization
java -jar amrit-db-1.0.0.jar anonymize \
  --input production-dump.sql \
  --output anonymized-dump.sql \
  --lookup ./lookup-cache \
  --verbose

# Show help
java -jar amrit-db-1.0.0.jar --help

# Dry run (validation only)
java -jar amrit-db-1.0.0.jar anonymize \
  --input prod.sql \
  --output uat.sql \
  --dry-run
```

## Jenkins Integration

### Pipeline Script

```groovy
pipeline {
    agent any
    
    parameters {
        string(name: 'PROD_DUMP', description: 'Production SQL dump path')
        string(name: 'OUTPUT_PATH', description: 'Output path for anonymized dump')
    }
    
    stages {
        stage('Validate') {
            steps {
                script {
                    if (!fileExists(params.PROD_DUMP)) {
                        error "Production dump not found: ${params.PROD_DUMP}"
                    }
                }
            }
        }
        
        stage('Anonymize') {
            steps {
                sh """
                    java -jar amrit-db-1.0.0.jar anonymize \
                      --input ${params.PROD_DUMP} \
                      --output ${params.OUTPUT_PATH} \
                      --lookup ./jenkins-lookup-cache \
                      --salt \${ANONYMIZATION_SALT} \
                      --verbose
                """
            }
        }
        
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: "${params.OUTPUT_PATH}"
            }
        }
    }
    
    post {
        success {
            echo "Anonymization complete: ${params.OUTPUT_PATH}"
        }
        failure {
            echo "Anonymization failed. Check logs."
        }
    }
}
```

### Environment Variables

```properties
ANONYMIZATION_SALT=your_secure_salt_here_use_env_var
LOOKUP_DB_PATH=/var/jenkins/lookup-cache
```

## Troubleshooting

### Common Issues

**Issue**: Out of memory error
**Cause**: Trying to load entire dump into memory
**Solution**: Ensure streaming mode (default), increase heap: `-Xmx4g`

**Issue**: H2 database locked
**Cause**: Multiple processes accessing same lookup DB
**Solution**: Use `AUTO_SERVER=TRUE` in JDBC URL (already enabled)

**Issue**: SQL parsing error
**Cause**: Unsupported SQL syntax
**Solution**: Check MySQL dump options, use `--compatible=mysql`

**Issue**: Slow performance
**Cause**: No index on lookup table
**Solution**: Verify index exists: `CREATE INDEX IF NOT EXISTS idx_lookup_key...`

## Future Enhancements

### Planned Features
1. Multi-threading for parallel table processing
2. Incremental anonymization (only new records)
3. Compression support (gzip input/output)
4. Cloud storage integration (S3, Azure Blob)
5. GUI for non-technical users
6. Real-time progress dashboard
7. Custom strategy plugin system
8. Audit report generation (PDF/HTML)

### Performance Goals
- Process 10GB dump in under 30 minutes
- Support dumps up to 100GB
- Maintain < 2GB memory footprint

## References

### External Dependencies
- Spring Boot: https://spring.io/projects/spring-boot
- Java-faker: https://github.com/DiUS/java-faker
- H2 Database: https://www.h2database.com
- Picocli: https://picocli.info
- Commons Codec: https://commons.apache.org/proper/commons-codec

### Standards and Compliance
- GDPR: General Data Protection Regulation
- HIPAA: Health Insurance Portability and Accountability Act
- ISO 27001: Information Security Management

## Glossary

- **PII**: Personally Identifiable Information (name, phone, email, etc.)
- **PHI**: Protected Health Information (medical records, diagnoses, etc.)
- **UAT**: User Acceptance Testing (non-production environment)
- **Anonymization**: Process of removing/masking identifiable information
- **Deterministic**: Same input always produces same output
- **Lookup Table**: Cache mapping original values to anonymized values
- **SQL Dump**: Text file containing SQL statements to recreate database
- **Registry**: Configuration file defining anonymization rules

## Document History

| Version | Date       | Author | Changes |
|---------|------------|--------|---------|
| 1.0.0   | 2026-02-04 | Team   | Initial technical documentation |
