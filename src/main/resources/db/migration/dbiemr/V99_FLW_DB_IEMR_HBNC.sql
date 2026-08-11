USE db_iemr;

SET @schema = 'db_iemr';

SET @table = 't_hbnc_visit';

SET @col = 'is_admitted_in_sncu';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TINYINT(1) NOT NULL DEFAULT 0'),
    'SELECT "is_admitted_in_sncu already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @schema = 'db_iemr';

SET @table = 't_ors_distribution';

SET @col = 'is_rehydration_solution_provided';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TINYINT(1) NOT NULL DEFAULT 0'),
    'SELECT "is_rehydration_solution_provided already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;