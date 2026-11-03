# Consent Manager demo content (manual, DEV/DEMO ONLY)

`01_consent_demo_seed.sql` loads **placeholder** notice and purpose text for the MMU consent
demo (Consent-API feature `002-mmu-consent-capture`). Every text value is prefixed
`[DEMO – TODO-LEGAL]`; Legal/DPO-approved text replaces it later as a new notice version.

- It is **not** a Flyway migration and is on no Flyway location path. Never move it into
  `db/migration`.
- Apply it by hand, only to dev/demo `db_identity` databases, after `V30__Consent_Manager_Capture.sql`:
  `mysql db_identity < src/main/resources/db/consent_demo/01_consent_demo_seed.sql`
- It is re-runnable: every insert is guarded by an existence check.
