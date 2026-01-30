USE db_iemr;

SET @dbname = 'db_iemr';
SET @tablename = 't_hbnc_visit';
SET @columnname = 'asha_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

