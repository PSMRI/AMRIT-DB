# Consent Manager demo content (manual, DEV/DEMO ONLY)

`01_consent_demo_seed.sql` loads **placeholder** notice and purpose text for the MMU consent
demo (Consent-API feature `002-mmu-consent-capture`). Every text value is prefixed
`[DEMO – TODO-LEGAL]`; Legal/DPO-approved text replaces it later as a new notice version.

- It is **not** a Flyway migration and is on no Flyway location path. Never move it into
  `db/migration`.
- Apply it by hand, only to dev/demo `db_identity` databases, after `V33__Consent_Manager_Capture.sql` (and, for the feature 004 section,
  `V35__Consent_Capture_Review.sql`):
  `mysql db_identity < src/main/resources/db/consent_demo/01_consent_demo_seed.sql`
- It is re-runnable: every insert is guarded by an existence check.

Feature 004 section (Consent-API `004-capture-review-changes`):

- adds a grievance contact to the central notices and patient / representative declarations
  to their translations (only where not set yet);
- adds project 3's own REGISTRATION notice `MMU-REGISTRATION-P3` (`project_id = 3`; purposes
  P-REG, P-TRT, P-REM; English and Hindi) to try `projectId=3` on APIs 2 and 3.
