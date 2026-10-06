USE db_iemr;

SET @schema = 'db_iemr';
SET @table = 'tb_diagnostic_document';

SET @col = 'docsProcessed';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(1) NOT NULL DEFAULT ''N'''),
    'SELECT "docsProcessed already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'docSyncedDate';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` DATETIME NULL'),
    'SELECT "docSyncedDate already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'docSyncFailureReason';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TEXT NULL'),
    'SELECT "docSyncFailureReason already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 's3_path';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(512) NULL'),
    'SELECT "s3_path already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================================================
-- ============================================================
-- Guarded UPDATE script for m_synctabledetail
-- Skips execution entirely if the table or the required columns
-- (ServerColumnName, VanColumnName) do not exist in the current
-- database (checked via INFORMATION_SCHEMA, schema()-scoped).
-- ============================================================

-- ------------------------------------------------------------
-- 1) docsProcessed
-- ------------------------------------------------------------

set sql_safe_updates=0;
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail'
);
SET @col_server_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'ServerColumnName'
);
SET @col_van_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'VanColumnName'
);

SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('docsProcessed', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',docsProcessed')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('docsProcessed', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',docsProcessed')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('docsProcessed', ServerColumnName) = 0
      OR FIND_IN_SET('docsProcessed', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - docsProcessed update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ------------------------------------------------------------
-- 2) docSyncedDate
-- ------------------------------------------------------------
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('docSyncedDate', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',docSyncedDate')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('docSyncedDate', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',docSyncedDate')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('docSyncedDate', ServerColumnName) = 0
      OR FIND_IN_SET('docSyncedDate', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - docSyncedDate update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ------------------------------------------------------------
-- 3) docSyncFailureReason
-- ------------------------------------------------------------
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('docSyncFailureReason', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',docSyncFailureReason')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('docSyncFailureReason', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',docSyncFailureReason')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('docSyncFailureReason', ServerColumnName) = 0
      OR FIND_IN_SET('docSyncFailureReason', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - docSyncFailureReason update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ------------------------------------------------------------
-- 4) s3_path
-- ------------------------------------------------------------
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('s3_path', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',s3_path')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('s3_path', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',s3_path')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('s3_path', ServerColumnName) = 0
      OR FIND_IN_SET('s3_path', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - s3_path update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET @tbl_exists := NULL, @col_server_exists := NULL, @col_van_exists := NULL, @sql := NULL;