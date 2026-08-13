
USE db_identity;

-- =========================================================
-- i_beneficiaryaddress (MBeneficiaryaddress)
-- gpsLatitude / gpsLongitude / digipin / gpsTimestamp /
-- isGpsUnavailable / gpsUnavailableReason removed: never
-- updated after registration (IdentityEditMapper never
-- mapped them), so edited beneficiaries always end up with
-- NULL here anyway.
-- =========================================================

SET @tbl_exists = (
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
);

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
AND column_name = 'gpsLatitude'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'ALTER TABLE i_beneficiaryaddress DROP COLUMN gpsLatitude',
'SELECT ''i_beneficiaryaddress.gpsLatitude drop skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
AND column_name = 'gpsLongitude'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'ALTER TABLE i_beneficiaryaddress DROP COLUMN gpsLongitude',
'SELECT ''i_beneficiaryaddress.gpsLongitude drop skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
AND column_name = 'digipin'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'ALTER TABLE i_beneficiaryaddress DROP COLUMN digipin',
'SELECT ''i_beneficiaryaddress.digipin drop skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
AND column_name = 'gpsTimestamp'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'ALTER TABLE i_beneficiaryaddress DROP COLUMN gpsTimestamp',
'SELECT ''i_beneficiaryaddress.gpsTimestamp drop skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
AND column_name = 'isGpsUnavailable'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'ALTER TABLE i_beneficiaryaddress DROP COLUMN isGpsUnavailable',
'SELECT ''i_beneficiaryaddress.isGpsUnavailable drop skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiaryaddress'
AND column_name = 'gpsUnavailableReason'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'ALTER TABLE i_beneficiaryaddress DROP COLUMN gpsUnavailableReason',
'SELECT ''i_beneficiaryaddress.gpsUnavailableReason drop skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
