USE db_iemr;

SET @schema = 'db_iemr';
SET @table = 'm_incentive_activity';
SET @col = 'group_category_name';

SET @sql = (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT(
            'ALTER TABLE `', @schema, '`.`', @table,
            '` ADD COLUMN `', @col, '` VARCHAR(255) DEFAULT NULL'
        ),
        CONCAT(
            'SELECT "', @col, ' already exists"'
        )
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME = @table
      AND COLUMN_NAME = @col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
