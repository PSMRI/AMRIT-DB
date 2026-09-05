# CLAUDE.md

Guidance for Claude Code when working in the AMRIT-DB repository.

## What this repo is

AMRIT-DB is a Spring Boot 3.3 / Java 17 application whose *only real job at
runtime* is to apply Flyway migrations to the four AMRIT MySQL 8 schemas. It
also ships a standalone anonymizer CLI used to build an anonymized UAT copy of
production data. Packaging is `war` (`com.db:Amrit-DB:1.0.0`), main class
`com.db.piramalswasthya.AmritDbApplication`.

The four target databases (must already exist before the app starts):

| Datasource bean prefix               | Database          | Migration folder                  |
|--------------------------------------|-------------------|-----------------------------------|
| `spring.datasource.dbiemr`           | `db_iemr`         | `db/migration/dbiemr`             |
| `spring.datasource.dbidentity`       | `db_identity`     | `db/migration/dbidentity`         |
| `spring.datasource.dbreporting`      | `db_reporting`    | `db/migration/dbreporting`        |
| `spring.datasource.db1097identity`   | `db_1097_identity`| `db/migration/db1097identity`     |

## Layout

```
src/main/java/com/db/piramalswasthya/
  AmritDbApplication.java      # entry point; EXCLUDES the anonymizer package from component scan
  config/DatasourceConfig.java # one @ConfigurationProperties DataSource per schema
  config/FlywayConfig.java     # one Flyway bean per schema, pinned to its own locations
  config/FlywayMigrator.java   # @PostConstruct: repair() then migrate() on all four
  controller/, service/        # /health and /version endpoints only
  anonymizer/                  # standalone picocli CLI (NOT part of the Spring app or the war)
src/main/resources/db/migration/<schema>/   # Flyway-managed versioned SQL
src/main/resources/db/stoptb_downsync/      # MANUAL scripts, not Flyway-managed
src/main/resources/anonymizer/              # anonymization-registry.yml (PII rules)
src/main/environment/common_<env>.properties# per-env config, merged into application.properties at build
docs/anonymization/GUIDE.md                 # anonymizer user guide
```

## Build and run

The build **requires** `ENV_VAR`. `maven-resources-plugin` filters
`src/main/environment/common_${ENV_VAR}.properties` into `target/classes/`,
`maven-antrun-plugin` concatenates it onto `target/classes/application.properties`,
then deletes the copy. Building without `-DENV_VAR=...` produces an app with no
datasource credentials.

```bash
./mvnw clean install -DENV_VAR=local      # build
./mvnw spring-boot:run -DENV_VAR=local    # run + migrate
./mvnw test -DENV_VAR=local               # tests
```

Available envs: `local`, `ci`, `docker`, `test`, `example` (template).
`common_local.properties` is gitignored — copy `common_example.properties` and fill it in.
Swagger UI: http://localhost:8080/swagger-ui.html

CI (`.github/workflows/build-on-pull-request.yml`) runs `mvn clean install` on
JDK 17 for PRs to `main`/`develop`; CodeQL SAST runs on the same branches.

## Writing migrations — the rules that matter

1. **Put the file in the right schema folder.** Each Flyway bean only reads its
   own folder, and each database has its own `flyway_schema_history`.
2. **Never edit or delete a migration that has already been applied anywhere.**
   Flyway checksums are validated; a changed file breaks every existing
   environment. Fix forward with a new version instead.
3. **Pick the next version above the current highest in that folder**, not the
   next unused gap. Version numbers are not contiguous (e.g. `dbiemr` has 98
   files but reaches `V101`). Check with:
   `ls src/main/resources/db/migration/dbiemr | sed 's/__.*//' | sort -V | tail -1`
4. Naming: `V<n>__<Description>.sql` — two underscores, `validateMigrationNaming=true`.
5. **Write idempotent SQL.** These scripts run against long-lived production
   schemas: `DROP VIEW IF EXISTS`, `CREATE TABLE IF NOT EXISTS`, and the
   `information_schema` + `PREPARE`/`EXECUTE` guard pattern used in the existing
   scripts for `ADD COLUMN` / `ADD INDEX` (MySQL 8 has no `ADD COLUMN IF NOT EXISTS`).
6. Statements are MySQL 8 dialect. Qualify with `USE <db>;` or fully-qualified
   names when the script is ambiguous.
7. `FlywayMigrator` calls `repair()` before `migrate()`, so checksum mismatches
   are silently realigned at startup — do not rely on that as a substitute for
   rule 2.

### `db/stoptb_downsync/` is different

These numbered scripts (`01_…` … `09_…`) are **manual, not Flyway-managed** and
are not on any Flyway location path. They are applied by hand, in numeric order,
via the MySQL client. They must be re-runnable — always guard with the
`information_schema` existence check. Do not convert them to `V<n>__` files or
move them into a migration folder unless explicitly asked.

## Anonymizer

Separate from the Spring app: excluded from component scan in
`AmritDbApplication` and from war packaging in `maven-war-plugin`. Entry point
`com.db.piramalswasthya.anonymizer.AmritDbAnonymizer` (picocli: `run`, `diff-schema`).

```bash
export ANONYMIZATION_SECRET="$(openssl rand -hex 32)"
./mvnw compile exec:java -Dexec.mainClass=com.db.piramalswasthya.anonymizer.AmritDbAnonymizer \
  -Dexec.args="run -c src/main/environment/common_local.properties --dry-run"
```

Key invariants — read `docs/anonymization/GUIDE.md` before touching this code:
- Source must be a production **read replica**, never the master. Target schemas
  are dropped and rewritten.
- `anonymizer.safety.allowedHosts` is enforced by resolved IP for both hosts.
  Do not weaken or bypass `SafetyGuard`.
- `src/main/resources/anonymizer/anonymization-registry.yml` is the single source
  of truth for PII. **If a migration adds a PII column or table, add it to the
  registry in the same change.**
- Anonymization is deterministic (HMAC-keyed); don't introduce unseeded randomness.

## Conventions

- GPLv3 header comment on every new `.java` file — copy from an existing file.
- Javadoc class comment with an `@author` tag on new classes; add yourself as
  `@author` when you substantially modify one.
- Commit messages follow Conventional Commits as used in history:
  `feat(stoptb): …`, `fix(build): …`, `chore(stoptb): …`.
- Branch off `main`, PR into `main` or `develop`.
- Never commit real credentials. `common_local.properties` stays gitignored;
  `common_example.properties` keeps placeholders only.
- `target/` and `logs/` are build output — never edit files there.
