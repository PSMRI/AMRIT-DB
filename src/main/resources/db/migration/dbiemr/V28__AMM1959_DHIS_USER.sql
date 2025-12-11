SET @col_exists := (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 'm_user'
      AND COLUMN_NAME = 'dhistoken'
);
 
-- Dynamically add column only if it doesn't exist
SET @sql := IF(@col_exists = 0,
               'ALTER TABLE db_iemr.m_user ADD COLUMN dhistoken VARCHAR(255);',
               'SELECT "Column dhistoken already exists";');
 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;