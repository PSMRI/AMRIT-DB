-- ALTER TABLE m_user
-- ADD COLUMN IF NOT EXISTS lock_timestamp TIMESTAMP NULL DEFAULT NULL;
SET @column_exists = (
    SELECT COUNT(*) 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'm_user'
      AND COLUMN_NAME = 'lock_timestamp'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE m_user ADD COLUMN lock_timestamp TIMESTAMP NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
