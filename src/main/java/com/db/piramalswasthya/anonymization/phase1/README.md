# AMRIT Anonymization - Phase 1 Implementation

This directory contains **Phase 1: Analysis & Registry Bootstrapping** implementation for the AMRIT database anonymization project.

## Quick Start

### 1. Configure Database Connections

Set environment variables with your database credentials:

```powershell
# Windows PowerShell
$env:DB_IDENTITY_URL="jdbc:mysql://localhost:3306/db_identity"
$env:DB_IDENTITY_USER="readonly_user"
$env:DB_IDENTITY_PASSWORD="your_password"

# ... repeat for db_1097_identity, db_iemr, db_reporting
```

### 2. Run Phase 1 Analyzer

```bash
./mvnw spring-boot:run -Dspring-boot.run.profiles=analyzer
```

### 3. Review Generated Artifacts

Check `docs/phase1-outputs/` for:
- `anonymization-registry.json` (PRIMARY deliverable)
- `pii-field-inventory.csv`
- `schema-catalog.json`
- `anonymization-strategy-map.json`
- `constraint-dependency-graph.html`
- `pii-coverage-report.json`

## Documentation

📖 **Full Documentation:** [`docs/anonymization/phase1.md`](../../docs/anonymization/phase1.md)

## What Phase 1 Does

✅ Extracts schema metadata from all 4 AMRIT databases  
✅ Detects PII-risk fields using 40+ configurable YAML rules  
✅ Generates anonymization registry with canonical naming  
✅ Computes SHA-256 schema hashes for drift detection  
✅ Exports 6 Phase 1 artifacts for review

❌ Does NOT modify any database data (metadata-only analysis)

## Key Components

| Component | Purpose |
|-----------|---------|
| `model/` | POJOs for schema, PII categories, registry |
| `scan/DatabaseSchemaAnalyzer` | JDBC metadata extraction |
| `detect/PIIDetector` | PII field detection engine |
| `registry/RegistryGenerator` | Anonymization registry builder |
| `registry/SchemaHasher` | SHA-256 schema hashing |
| `export/ArtifactExporter` | JSON/CSV/HTML exporters |
| `cli/AnalyzerRunner` | CLI entrypoint |

## Configuration

**PII Detection Rules:** `src/main/resources/anonymization/pii-detection-rules.yml`  
**Analyzer Profile:** `src/main/resources/application-analyzer.properties`

Customize PII detection by editing the YAML file.

## Testing

Run unit tests:

```bash
./mvnw test -Dtest="**/anonymization/phase1/**/*Test"
```

## Next Steps

After Phase 1:
1. Review PII classifications in generated CSV
2. Validate 100% PII coverage in report
3. Get security team sign-off on registry
4. Commit `anonymization-registry.json` to version control
5. Proceed to Phase 2 implementation

## Security Notes

- **NO raw data values are exported** - metadata only
- **NO reversible mappings created** - privacy-safe
- Use read-only database credentials
- Never commit database passwords to Git

## Support

For issues or questions:
- Check [`docs/anonymization/phase1.md`](../../docs/anonymization/phase1.md)
- Review planning doc: [`docs/db-anonymization-phase1-analysis-plan.md`](../../docs/db-anonymization-phase1-analysis-plan.md)
- File issue with project team

---

**Version:** 1.0.0  
**Last Updated:** February 1, 2026  
**Maintainer:** AMRIT DevOps Team (I hope?)
