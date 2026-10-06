USE db_iemr;

SET @schema = 'db_iemr';


-- =========================================================
-- t_infant_register.is_sncu
-- =========================================================

SET @table = 't_infant_register';
SET @col = 'is_sncu';

SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT(
            'ALTER TABLE `', @schema, '`.`', @table,
            '` ADD COLUMN `', @col, '` VARCHAR(255) DEFAULT NULL'
        ),
        'SELECT "is_sncu already exists"'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME = @table
      AND COLUMN_NAME = @col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- =========================================================
-- t_infant_register.is_Referred_higher_facility
-- =========================================================

SET @table = 't_infant_register';
SET @col = 'is_Referred_higher_facility';

SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT(
            'ALTER TABLE `', @schema, '`.`', @table,
            '` ADD COLUMN `', @col, '` TINYINT(1) DEFAULT NULL'
        ),
        'SELECT "is_Referred_higher_facility already exists"'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME = @table
      AND COLUMN_NAME = @col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- =========================================================
-- Set DEFAULT CURRENT_TIMESTAMP
-- =========================================================


SET @table = 'incentive_activity_record';
SET @col = 'is_approved';

SET @sql = (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT(
            'ALTER TABLE `', @schema, '`.`', @table,
            '` ADD COLUMN `', @col,
            '` TINYINT(1) NOT NULL DEFAULT 0'
        ),
        'SELECT "is_approved already exists"'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME = @table
      AND COLUMN_NAME = @col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;