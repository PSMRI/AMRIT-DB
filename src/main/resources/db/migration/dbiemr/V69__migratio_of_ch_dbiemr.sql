USE db_iemr;

SET @dbname = 'db_iemr';
SET @tablename = 'sammelan_record';

-- Drop index if exists
SET @indexname = 'uk_asha_month';
SET @preparedStatement = (
  SELECT IF(
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = @dbname
       AND TABLE_NAME = @tablename
       AND INDEX_NAME = @indexname) > 0,
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' DROP INDEX ', @indexname),
    'SELECT 1'
  )
);
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Add unique index if not exists
SET @indexname = 'uk_asha_month';
SET @preparedStatement = (
  SELECT IF(
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = @dbname
       AND TABLE_NAME = @tablename
       AND INDEX_NAME = @indexname) > 0,
    'SELECT 1',
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename,
           ' ADD UNIQUE KEY uk_asha_month (asha_id, meeting_date)')
  )
);
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;