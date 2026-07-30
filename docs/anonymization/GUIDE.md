# AMRIT Database Anonymization — User Guide

## Overview

The anonymizer creates a **full anonymized replica** of production data for UAT:

```
DB1 (production read replica)  →  anonymizer CLI  →  DB2 (UAT)
        read-only                 registry rules       schemas reset + rewritten
```

- **Every base table** in each configured schema is copied (full-copy model).
- `anonymization-registry.yml` is the **single source of truth for PII**: columns
  listed there are anonymized with their configured strategy; everything else is
  copied as-is with full type fidelity. **Developers must add new PII tables or
  columns to the registry when they add them to a schema.**
- Deterministic: the same input always produces the same anonymized output
  (HMAC-keyed hashing, seeded fake data), so IDs stay linkable across tables
  and reruns are reproducible.
- Streaming: keyset pagination on numeric primary keys (auto-detected), or a
  streaming full scan for tables with composite/non-numeric/no primary keys.
  Constant memory, no OFFSET queries.
- Views are cloned (with `DEFINER` stripped); a view that fails to clone is
  skipped with a warning — views carry no data.

### What this tool does NOT do

- No SQL dump files — direct restore only.
- No automatic PII pattern detection — the registry is authoritative.
- No connection to the production master — point the source at a read replica.

## Quick start (local)

```bash
# 1. Configure source/target/safety (see Configuration below)
cp src/main/environment/common_example.properties src/main/environment/common_local.properties
# edit common_local.properties

# 2. Secret for deterministic HMAC anonymization
export ANONYMIZATION_SECRET="$(openssl rand -hex 32)"

# 3. Validate without writing
./mvnw compile exec:java -Dexec.mainClass=com.db.piramalswasthya.anonymizer.AmritDbAnonymizer \
  -Dexec.args="run -c src/main/environment/common_local.properties --dry-run"

# 4. Run (interactive confirmation; use --yes for cron/CI)
./mvnw exec:java -Dexec.mainClass=com.db.piramalswasthya.anonymizer.AmritDbAnonymizer \
  -Dexec.args="run -c src/main/environment/common_local.properties"
```

## Configuration

Properties (`anonymizer.*` namespace) or a YAML file can be passed via `-c`.
The datasource entries used by the Spring Boot migration app are **not** used
to configure the anonymizer target.

```properties
# Source: production READ REPLICA
anonymizer.source.host=replica-host.example.internal
anonymizer.source.port=3306
anonymizer.source.schemas=db_iemr,db_identity,db_reporting,db_1097_identity
anonymizer.source.username=readonly_user
anonymizer.source.password=...

# Target: UAT. The schemas above are DROPPED (table by table) and re-created here.
anonymizer.target.host=uat-host.example.internal
anonymizer.target.port=3306
anonymizer.target.username=uat_user
anonymizer.target.password=...
anonymizer.target.readOnly=false

# Safety: ENFORCED allowlist. Both hosts must be listed. Hosts are compared by
# resolved IP address, so DNS aliases cannot bypass the check.
anonymizer.safety.enabled=true
anonymizer.safety.allowedHosts=replica-host.example.internal,uat-host.example.internal

anonymizer.rulesFile=src/main/resources/anonymizer/anonymization-registry.yml
anonymizer.performance.batchSize=1000
```

Secrets: set `ANONYMIZATION_SECRET` (min 32 chars) in the environment.
`anonymizer.hmacSecretKey` in properties is accepted for local testing only.

## Maintaining the registry (developers)

`src/main/resources/anonymizer/anonymization-registry.yml` maps
`database → table → column → strategy`. When you add a table or column that
holds PII, add it to the registry in the same PR. Strategies:

| Strategy | Effect |
|---|---|
| `HMAC_HASH` | Keyed deterministic hash; numeric columns get a derived stable number |
| `HASH_SHA256` | Unkeyed deterministic hash |
| `FAKE_FULLNAME`, `FAKE_FIRSTNAME`, `FAKE_LASTNAME`, `FAKE_EMAIL`, `FAKE_PHONE`, `FAKE_ADDRESS`, `FAKE_CITY`, `FAKE_ZIP`, `FAKE_USERNAME` | Deterministic fake values |
| `RANDOM_FAKE_DATA` | Fake value chosen by column-name heuristics |
| `PARTIAL_MASK` | Mask all but the last digits (phone/pincode aware) |
| `GENERALIZE` | Dates → year (anchored Jan 1st on DATE/DATETIME columns); coordinates → 2 decimals; anything else is suppressed |
| `SUPPRESS` | NULL (`''`/`0` on NOT NULL columns) |
| `PRESERVE` | Copy unchanged |

A typo'd or unknown strategy **fails the run** — it is never silently preserved.

Optional per-table key `primaryKey` overrides pagination; otherwise the primary
key is auto-detected from JDBC metadata.

## Safety model

1. **Host allowlist** (`anonymizer.safety.allowedHosts`) — enforced for both
   source and target, compared by resolved IPs. Empty allowlist with safety
   enabled refuses to run.
2. **Source ≠ target** — same server (by IP + port) with overlapping schema
   names refuses to run: the target reset would destroy the source.
3. **Read-only source** — source connections are opened read-only.
4. **Run confirmation** — the CLI prints what will be reset and requires a
   typed `yes`. Non-interactive runs must pass `--yes` explicitly.
5. **PII-safe logging** — errors are sanitized; logs contain counts and
   timings, not row data.

## Operational notes

- **Transactionality**: MySQL DDL commits implicitly, so schema reset is not
  transactional. Data is committed **per table**; a crashed run leaves
  completed tables intact and at most one partial table, which the next run's
  reset re-creates. Do not point applications at the target mid-run.
- **Foreign keys**: disabled on the writer session for the duration of the run
  (copy order is arbitrary), restored on close.
- **Scheduling**: run from cron/CI with `--yes`. Exit code 0 = success.
- **diff-schema**: `diff-schema` compares a live schema against the registry to
  spot columns the registry doesn't cover — useful in review, not enforced at
  runtime.

## Troubleshooting

| Symptom | Cause / fix |
|---|---|
| `... host '<h>' is not in the allowed hosts list` | Add the host to `anonymizer.safety.allowedHosts` (deliberate, audited change) |
| `Source and target resolve to the same server ...` | You pointed both at one server with the same schema names — configure a real UAT target |
| `Unknown anonymization strategy '<s>' on column ...` | Fix the typo in the registry; valid strategies listed above |
| `Non-interactive session and --yes not supplied` | Pass `--yes` for cron/CI runs |
| `anonymizer.target.host is required in properties mode` | Configure the target explicitly; it is never derived from `spring.datasource.*` |
| View clone warnings | Expected for views referencing other schemas or definers; views carry no data |
