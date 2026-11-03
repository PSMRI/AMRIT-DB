USE db_iemr;

-- ============================================================
-- Guarded UPDATE script for m_synctabledetail
-- V107 added docSyncedDate to VanColumnName as a plain DATETIME,
-- which van-to-server cannot serialize (java.time.LocalDateTime).
-- Wrap it in date_format(...) like every other synced date column
-- (see V16 / V27). ServerColumnName stays as plain docSyncedDate.
-- Skips execution entirely if the table or the required column
-- (VanColumnName) does not exist in the current database
-- (checked via INFORMATION_SCHEMA, schema()-scoped).
-- ============================================================

-- ------------------------------------------------------------
-- 1) docSyncedDate
-- ------------------------------------------------------------

SET @old_safe_updates := @@SQL_SAFE_UPDATES;
set sql_safe_updates=0;
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail'
);
SET @col_van_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'VanColumnName'
);

SET @sql := IF(@tbl_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET VanColumnName = TRIM(BOTH ',' FROM REPLACE(
        CONCAT(',', VanColumnName, ','),
        ',docSyncedDate,',
        ',date_format(docSyncedDate,''%Y-%m-%d %H:%i:%s''),'))
WHERE TableName = 'tb_diagnostic_document'
  AND FIND_IN_SET('docSyncedDate', VanColumnName) > 0",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - docSyncedDate format update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET sql_safe_updates = @old_safe_updates;
SET @tbl_exists := NULL, @col_van_exists := NULL, @sql := NULL, @old_safe_updates := NULL;
