USE db_identity;

-- =========================================================
-- i_beneficiaryaddress (MBeneficiaryaddress)
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
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiaryaddress ADD COLUMN gpsLatitude DOUBLE NULL',
'SELECT ''i_beneficiaryaddress.gpsLatitude skipped'''
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
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiaryaddress ADD COLUMN gpsLongitude DOUBLE NULL',
'SELECT ''i_beneficiaryaddress.gpsLongitude skipped'''
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
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiaryaddress ADD COLUMN digipin VARCHAR(255) NULL',
'SELECT ''i_beneficiaryaddress.digipin skipped'''
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
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiaryaddress ADD COLUMN gpsTimestamp DATETIME NULL',
'SELECT ''i_beneficiaryaddress.gpsTimestamp skipped'''
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
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiaryaddress ADD COLUMN isGpsUnavailable TINYINT(1) NOT NULL DEFAULT 0',
'SELECT ''i_beneficiaryaddress.isGpsUnavailable skipped'''
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
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiaryaddress ADD COLUMN gpsUnavailableReason VARCHAR(255) NULL',
'SELECT ''i_beneficiaryaddress.gpsUnavailableReason skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- =========================================================
-- i_beneficiarydetails_rmnch (RMNCHBeneficiaryDetailsRmnch)
-- =========================================================

SET @tbl_exists = (
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
);

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'gpsLatitude'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN gpsLatitude DOUBLE NULL',
'SELECT ''i_beneficiarydetails_rmnch.gpsLatitude skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'gpsLongitude'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN gpsLongitude DOUBLE NULL',
'SELECT ''i_beneficiarydetails_rmnch.gpsLongitude skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'digipin'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN digipin VARCHAR(255) NULL',
'SELECT ''i_beneficiarydetails_rmnch.digipin skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'gpsTimestamp'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN gpsTimestamp DATETIME NULL',
'SELECT ''i_beneficiarydetails_rmnch.gpsTimestamp skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'isGpsUnavailable'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN isGpsUnavailable TINYINT(1) NOT NULL DEFAULT 0',
'SELECT ''i_beneficiarydetails_rmnch.isGpsUnavailable skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_beneficiarydetails_rmnch'
AND column_name = 'gpsUnavailableReason'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_beneficiarydetails_rmnch ADD COLUMN gpsUnavailableReason VARCHAR(255) NULL',
'SELECT ''i_beneficiarydetails_rmnch.gpsUnavailableReason skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- =========================================================
-- i_householddetails (RMNCHHouseHoldDetails)
-- =========================================================

SET @tbl_exists = (
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
);

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'gpsLatitude'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN gpsLatitude DOUBLE NULL',
'SELECT ''i_householddetails.gpsLatitude skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'gpsLongitude'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN gpsLongitude DOUBLE NULL',
'SELECT ''i_householddetails.gpsLongitude skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'digipin'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN digipin VARCHAR(255) NULL',
'SELECT ''i_householddetails.digipin skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'gpsTimestamp'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN gpsTimestamp DATETIME NULL',
'SELECT ''i_householddetails.gpsTimestamp skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'isGpsUnavailable'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN isGpsUnavailable TINYINT(1) NOT NULL DEFAULT 0',
'SELECT ''i_householddetails.isGpsUnavailable skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_identity'
AND table_name = 'i_householddetails'
AND column_name = 'gpsUnavailableReason'
);
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
'ALTER TABLE i_householddetails ADD COLUMN gpsUnavailableReason VARCHAR(255) NULL',
'SELECT ''i_householddetails.gpsUnavailableReason skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
