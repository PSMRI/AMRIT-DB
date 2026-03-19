USE db_iemr;

SET @schema = 'db_iemr';
SET @table  = 'form_fields';

-- Helper pattern: check + add via dynamic SQL

-- user_id
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.form_fields ADD COLUMN user_id INT;',
    'SELECT "state_code exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='state_code'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'is_editable';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;