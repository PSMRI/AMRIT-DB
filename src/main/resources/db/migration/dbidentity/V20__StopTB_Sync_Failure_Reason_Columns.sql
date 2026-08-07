USE db_identity;

-- ============================================================
-- Add SyncFailureReason to i_beneficiarydetails_rmnch, i_householddetails,
-- i_bornbirthdeatils. These 3 tables predate this Flyway-managed schema and
-- never got this column, unlike every other sync-tracked table. MMU-API's
-- updateProcessedFlagInVan() unconditionally writes to SyncFailureReason
-- after every sync attempt, regardless of table - without this column, that
-- write throws BadSqlGrammarException on every sync attempt for these 3
-- tables specifically.
-- ============================================================

SET @tbl_exists = (
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
);
SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'SyncFailureReason'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN SyncFailureReason VARCHAR(255) NULL',
'SELECT "Column SyncFailureReason already exists on i_beneficiarydetails_rmnch"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_exists = (
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
);
SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'SyncFailureReason'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN SyncFailureReason VARCHAR(255) NULL',
'SELECT "Column SyncFailureReason already exists on i_householddetails"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_exists = (
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'db_identity'
AND table_name = 'i_bornbirthdeatils'
);
SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_bornbirthdeatils'
AND column_name = 'SyncFailureReason'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_bornbirthdeatils ADD COLUMN SyncFailureReason VARCHAR(255) NULL',
'SELECT "Column SyncFailureReason already exists on i_bornbirthdeatils"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
