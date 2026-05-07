USE db_iemr;

SET @schema = 'db_iemr';
SET @table  = 't_bencall';
SET @col    = 'IsDispositionSentToCTI';

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT(
      'ALTER TABLE `', @schema, '`.`', @table, '` ',
      'ADD COLUMN `', @col, '` BIT(1) DEFAULT 0 AFTER `CDICallStatus`'
    ),
    'SELECT "IsDispositionSentToCTI already exists"'
  )
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;