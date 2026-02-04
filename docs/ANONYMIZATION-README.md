# AMRIT Database Anonymization System

Complete anonymization solution for AMRIT databases, ensuring PII compliance for UAT/development environments.

## Architecture

### 1. **Analyzer** (Discovery & Registry Generation)
- Scans database schemas via JDBC metadata
- Detects sensitive fields using pattern-based rules
- Generates anonymization registry (source of truth)
- Produces audit reports and dependency graphs

### 2. **Executor** (Data Transformation)
- Reads anonymization registry
- Applies transformation strategies
- Uses java-faker for realistic Indian fake data
- Maintains lookup tables for consistency

---

## Quick Start

### Prerequisites
```bash
- Java 17+
- Maven 3.6+
- MySQL 8.0+
- Access to source AMRIT databases
```

### 1. Run Analyzer (Discovery)

```bash
# Analyze all databases
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer -DENV_VAR=local

# Analyze specific databases only
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer \
  -Dspring-boot.run.arguments="--dbs=db_identity,db_iemr" \
  -DENV_VAR=local

# Custom output directory
./mvnw spring-boot.run -Dspring-boot.run.profiles=analyzer \
  -Dspring-boot.run.arguments="--output-dir=reports/analysis-2026-02-04" \
  -DENV_VAR=local
```

**Outputs** (in `docs/analyzer-outputs/`):
- `schema-catalog.json` - Complete schema metadata
- `pii-field-inventory.csv` - List of all sensitive fields
- `anonymization-strategy-map.json` - Proposed strategies per column
- `anonymization-registry.json` - **Main registry file**
- `constraint-dependency-graph.html` - Visual FK relationships
- `pii-coverage-report.json` - 100% coverage validation

### 2. Review & Commit Registry

```bash
# Security team reviews the generated registry
vi src/main/resources/anonymization-registry.yml

# Edit strategies as needed (table -> column -> strategy)
# Commit to version control as source of truth
git add src/main/resources/anonymization-registry.yml
git commit -m "feat: add anonymization registry for UAT refresh"
```

### 3. Run Executor (Transformation)

```bash
# Test strategies first
./mvnw spring-boot:run -Dspring-boot.run.profiles=executor \
  -Dspring-boot.run.arguments="--test-strategies" \
  -DENV_VAR=local

# Check lookup table stats
./mvnw spring-boot:run -Dspring-boot.run.profiles=executor \
  -Dspring-boot.run.arguments="--lookup-stats" \
  -DENV_VAR=local

# Full anonymization (TODO: implement batch processing)
./mvnw spring-boot:run -Dspring-boot.run.profiles=executor \
  -Dspring-boot.run.arguments="--job-id=uat-refresh-2026-02-04" \
  -DENV_VAR=local
```

---

## Anonymization Strategies

| Strategy | Description | Example | Use Case |
|----------|-------------|---------|----------|
| `HASH_SHA256` | Deterministic SHA-256 hash | `BenRegID: 12345` → `sha256_abc123...` | Linking keys (maintain FK relationships) |
| `RANDOM_UUID` | Fake data via java-faker | `FirstName: "Raj"` → `"Amit"` | Names, emails, usernames |
| `PARTIAL_MASK` | Show last N characters | `Phone: 9876543210` → `XXXXXX3210` | Phone numbers, partial IDs |
| `SUPPRESS` | Replace with NULL | `Password: "secret"` → `NULL` | Passwords, tokens, secrets |
| `GENERALIZE` | Reduce precision | `DOB: 1990-05-15` → `1990` | Dates, ages, addresses |
| `PRESERVE` | Keep unchanged | `Gender: "Male"` → `"Male"` | Non-sensitive aggregation fields |

---

## Registry Format

**File**: `src/main/resources/anonymization-registry.yml`

```yaml
databases:
  db_identity:
    m_beneficiaryregidmapping:
      BenRegID: HASH_SHA256          # Linking key - deterministic
      FirstName: RANDOM_UUID         # Fake Indian name
      PhoneNo: PARTIAL_MASK          # Show last 4 digits
      AadhaarNo: HASH_SHA256         # Government ID - hash
      EmailID: SUPPRESS              # Not needed
      DateOfBirth: GENERALIZE        # Year only
      Gender: PRESERVE               # Keep for analytics

# Global pattern-based rules (fallback)
global_rules:
  ".*BenRegID$": HASH_SHA256
  ".*Password.*": SUPPRESS
  ".*Phone.*": PARTIAL_MASK
```

---

## Lookup Tables

**Purpose**: Ensure consistency - same real value always maps to same fake value.

**Table**: `anonymization_lookup` (created in `db_iemr` automatically)

**Schema**:
```sql
CREATE TABLE anonymization_lookup (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    database_name VARCHAR(100),
    table_name VARCHAR(100),
    column_name VARCHAR(100),
    original_value_hash VARCHAR(64),  -- SHA-256 of real value (never stores PII)
    anonymized_value TEXT,            -- Fake value to reuse
    strategy VARCHAR(50),
    created_at TIMESTAMP,
    last_used_at TIMESTAMP,
    usage_count INT,
    UNIQUE KEY (database_name, table_name, column_name, original_value_hash)
);
```

**Example**:
```
Real: "Rajesh Kumar" 
Hash: sha256("Rajesh Kumar") = "abc123..."
Fake: "Amit Sharma" (from java-faker)

Every occurrence of "Rajesh Kumar" across all tables → "Amit Sharma"
```

---

## Java-Faker Integration

Generates realistic Indian fake data:

```java
// Indian names
faker.name().firstName()  → "Amit", "Priya", "Rahul"
faker.name().lastName()   → "Sharma", "Patel", "Singh"

// Indian addresses
faker.address().city()    → "Mumbai", "Delhi", "Bangalore"
faker.address().state()   → "Maharashtra", "Karnataka"

// Indian phone numbers
faker.phoneNumber().phoneNumber() → "9876543210"

// Generic emails
faker.internet().emailAddress() → "amit.sharma@example.com"
```

**Locale**: Configured as `en-IND` in strategies.

---

## Configuration Files

| File | Purpose |
|------|---------|
| `application-analyzer.properties` | Analyzer mode (discovery) |
| `application-executor.properties` | Executor mode (transformation) |
| `anonymization-registry.yml` | Source of truth (human-editable) |
| `anonymization-registry.json` | Machine-readable version |
| `anonymization/pii-detection-rules.yml` | 40+ pattern rules for PII detection |

---

## Package Structure

```
com.db.piramalswasthya.anonymization/
├── model/              # Data models (metadata, registry)
├── scan/               # Schema scanner (JDBC metadata)
├── detect/             # PII detection (pattern matching)
├── registry/           # Registry generator + schema hasher
├── export/             # Artifact exporters (JSON/CSV/HTML)
├── cli/                # Analyzer CLI runner
├── executor/           # Execution engine
│   ├── model/          # LookupEntry, AnonymizationJob
│   ├── strategy/       # Strategy interface + factory
│   │   └── impl/       # 6 concrete strategies
│   └── lookup/         # Lookup table manager
└── exception/          # Custom exceptions
```

---

## Security Considerations

- Never logs or writes raw PII values  
- Lookup tables store hashed keys only (SHA-256)  
- Registry version-controlled and security-reviewed  
- Deterministic hashing for referential integrity  
- Salted hashes (table + column context)  
- Audit trail: usage_count, last_used_at in lookup tables  
---

## Testing

```bash
# Run all tests
./mvnw test -DENV_VAR=local

# Test specific strategies
./mvnw spring-boot:run -Dspring-boot.run.profiles=executor \
  -Dspring-boot.run.arguments="--test-strategies"

# Verify lookup table functionality
./mvnw spring-boot:run -Dspring-boot.run.profiles=executor \
  -Dspring-boot.run.arguments="--lookup-stats"
```

---

## Dependencies

Added to `pom.xml`:

```xml
<!-- Java Faker for realistic fake data -->
<dependency>
    <groupId>com.github.javafaker</groupId>
    <artifactId>javafaker</artifactId>
    <version>1.0.2</version>
</dependency>

<!-- Apache Commons Codec for hashing -->
<dependency>
    <groupId>commons-codec</groupId>
    <artifactId>commons-codec</artifactId>
</dependency>
```

---

## Roadmap

- [done] Analyzer (schema scan + PII detection)
- [done] Registry format (YAML/JSON)
- [done] Strategy implementations (6 strategies)
- [done] Lookup table manager
- [done] Java-faker integration
- [done] Executor CLI runner
- [todo] Batch processing (1000 rows/batch)
- [todo] Progress tracking UI
- [todo] Resume failed jobs
- [todo] Data validation post-anonymization
- [todo] Performance optimization (parallel processing)

---

## Support

For issues or questions:
- Check analyzer outputs in `docs/analyzer-outputs/`
- Review lookup table: `SELECT * FROM anonymization_lookup`
- Check logs: `logging.level.com.db.piramalswasthya.anonymization=DEBUG`

---

**Version**: 1.0.0  
**Last Updated**: 2026-02-04  
**Security Review**: Required before UAT deployment
