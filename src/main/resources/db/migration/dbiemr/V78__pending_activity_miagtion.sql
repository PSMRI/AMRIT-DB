USE db_iemr;

SET @column_exists = (

    SELECT COUNT(*) 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_pending_activity'
      AND COLUMN_NAME = 'm_incentive_id'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_pending_activity ADD COLUMN m_incentive_id long NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
