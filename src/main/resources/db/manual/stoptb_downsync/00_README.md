# StopTB down-sync — manual SQL scripts

Everything the down-sync (central → local) needs, as plain SQL to run by hand
against the StopTB database. **Not Flyway migrations** — they live outside
`db/migration` deliberately, because this change goes to one database rather
than to every environment.

No stored procedures. Every statement is guarded in the `SET @sql` /
`PREPARE` / `EXECUTE` style: it checks `information_schema` first and prints
`… already exists` instead of failing, so **every file is safe to re-run**.

## Run order

| # | File | What | Statements |
| --- | --- | --- | --- |
| 01 | `01_db_iemr_downsync_columns.sql` | the four down-sync columns on the 80 `db_iemr` tables | 320 |
| 02 | `02_db_identity_downsync_columns.sql` | the same on the 12 `db_identity` tables | 48 |
| 03 | `03_db_iemr_sync_columns.sql` | `VanID` / `VanSerialNo` / `Processed` / `LastModDate` where missing — **read the warning below** | 13 tables |
| 04 | `04_indexes.sql` | `(VanID, DownSynced)` on every table that has `VanID` | 92 |
| 05 | `05_m_downsynctabledetail.sql` | the config table + its 105 rows, `SyncOrder` 1…105 | 1 create, 2 inserts |
| 06 | `06_backfill.sql` | mark already-up-synced rows as delivered — **run once** | 92 |
| 07 | `07_verify.sql` | read-only checks; run on both sides and compare | — |

```bash
for f in 01_* 02_* 03_* 04_* 05_* 06_*; do
  echo "=== $f"; mysql -h <host> -u <user> -p < "$f" || break
done
mysql -h <host> -u <user> -p --force --table < 07_verify.sql > verify_<host>.txt
```

`07_verify.sql` needs `--force`: a check that runs before its object exists
fails with *doesn't exist*, and the client would otherwise stop at the first one.

Run 01–06 on **both** central and the laptop — both sides carry all the columns,
and each side ignores the ones it does not own. Run 06 **once per database**, on
first setup only.

## Before you start

Take a dump. `03` adds columns to tables that already hold data, and dropping a
column afterwards is not reversible.

```bash
mysqldump -h <host> -u <user> -p --single-transaction \
  --databases db_iemr db_identity > before_downsync_$(date +%F).sql
```

## The one decision to make — script 03

The down-sync reads `VanID`, `VanSerialNo`, `Processed` and `LastModDate` **by
those exact names**; they are written into the SQL text in
`DataSyncRepositoryCentralDownload` and `DataSyncRepository`, so a table without
one of them fails with *Unknown column*.

Thirteen `db_iemr` tables are short of something, and **nine of them already
track modification time as `last_mod_date`**:

```
tb_screening        tb_suspected             tb_confirmed_cases
tb_diagnostic_order tb_diagnostic_result     tb_diagnostic_document
tb_stoptb_visit *   tb_stoptb_diagnostics    tb_stoptb_general_opd
tb_stoptb_general_examination
t_form_response *   t_section_response *     t_question_response *
```

`*` = no modification-time column at all; those four need one regardless.

For the other nine, script 03 as written adds `LastModDate` **alongside** the
existing `last_mod_date`. Both carry `ON UPDATE CURRENT_TIMESTAMP`, so they stay
in step and nothing breaks — but it is a duplicate column, and a DBA is entitled
to object.

The alternative is a code change: have the sync resolve the modification-time
column per table (`LastModDate`, else `last_mod_date`) instead of hard-coding the
name. That touches two queries in MMU-API and avoids the duplication. **Decide
this before running 03** — it is the only script whose shape depends on the
answer.

## What is deliberately left inactive

Eight rows in `05` are registered with `IsActive = 0`, and must stay that way:

```
i_beneficiarydetails   i_beneficiaryaddress   i_beneficiarycontacts
i_beneficiaryaccount   i_beneficiarymapping   i_beneficiaryfamilymapping
i_beneficiaryidentity  m_beneficiaryregidmapping
```

`i_beneficiarymapping` points at the primary keys of the other identity tables
(`BenDetailsId`, `BenAddressId`, `BenImageId`, `BenContactsId`, `BenConsentId`,
`BenAccountID`, `BenSecureStackId`). Those are per-database `AUTO_INCREMENT`
values that do not agree between central and a van, and the down-sync mints a
fresh local id on insert — so copying the pointers verbatim leaves them
addressing central's rows. Activating these tables does not fail loudly; it
silently mis-links beneficiaries. `BenRegId` is safe: it comes from the
provisioned pool and is globally unique.

Until that is solved, the down-sync delivers records **of beneficiaries the van
already knows**. A beneficiary first registered in central — the phone
registration case — needs this resolved first.

## Notes on the configuration in script 05

`VanAutoIncColumnName` is each table's **real** `AUTO_INCREMENT` primary key,
read from `information_schema` — *not* the value `m_synctabledetail` holds, which
is the literal string `vanSerialNo` for 16 of these tables. The down-sync omits
the primary key on `INSERT` so the local database mints its own id, so the wrong
name breaks it.

`SyncOrder` is 1, 2, 3 … in the order the up-sync already uses
(`SyncTableGroupID`, then `SyncTableDetailID`): masters first, then the
beneficiary identity tables, then the clinical tables. Only the relative order
matters — the van reads `ORDER BY SyncOrder, DownSyncTableDetailID`, and central
never reads it at all.

The numbers do **not** have to match between central and the laptop. What *must*
match is the **active set** — check `4c` in `07_verify.sql` prints a fingerprint
of it. If the laptop has a table active that central does not, central rejects
the request with *… is not configured for down-sync in m_downsynctabledetail*
and that table fails on every run.

## After running

Read `07_verify.sql`'s output on both sides:

* check 1 — every configured table has all four columns
* check 3 — **must return no rows**; anything listed is an active table that
  will fail with *Unknown column*
* check 4b — `SyncOrder` is dense, 1…105
* check 4c — the active-set fingerprint is identical on central and laptop
* check 5 — each table's `column_list_hash` is identical on both sides; a
  difference is schema drift and breaks that table's down-sync
* check 6 — nothing sits at `'N'` while carrying a `VanSerialNo`
* check 7b — **must return no rows** before any `CreatedBy → VanID` backfill; a
  login on several VANs makes that update non-deterministic
