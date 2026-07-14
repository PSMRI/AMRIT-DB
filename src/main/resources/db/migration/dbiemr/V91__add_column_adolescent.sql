USE db_iemr;

SET @schema = 'db_iemr';

SET @table = 'adolescent_health';

SET @col = 'is_sanitary_napkin_used';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TINYINT(1) NOT NULL DEFAULT 0'),
    'SELECT "is_sanitary_napkin_used already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
