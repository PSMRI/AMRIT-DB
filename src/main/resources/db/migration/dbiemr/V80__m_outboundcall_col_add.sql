

SET @dbname = DATABASE();

-- ProviderServiceMapID
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = @dbname
      AND TABLE_NAME = 'm_outbound_call_activity'
      AND COLUMN_NAME = 'ProviderServiceMapID'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE m_outbound_call_activity ADD COLUMN ProviderServiceMapID INT NULL',
    'SELECT "Column ProviderServiceMapID already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Deleted
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = @dbname
      AND TABLE_NAME = 'm_outbound_call_activity'
      AND COLUMN_NAME = 'Deleted'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE m_outbound_call_activity ADD COLUMN Deleted TINYINT(1) NULL DEFAULT 0',
    'SELECT "Column Deleted already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Processed
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = @dbname
      AND TABLE_NAME = 'm_outbound_call_activity'
      AND COLUMN_NAME = 'Processed'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE m_outbound_call_activity ADD COLUMN Processed VARCHAR(1) NULL',
    'SELECT "Column Processed already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;