USE db_iemr;

SET @schema = 'db_iemr';


-- =========================================================
-- t_hbnc_visit.is_admitted_in_sncu
-- =========================================================

SET @table = 't_hbnc_visit';
SET @col = 'is_admitted_in_sncu';

SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT(
            'ALTER TABLE `', @schema, '`.`', @table,
            '` ADD COLUMN `', @col, '` TINYINT(1) DEFAULT NULL'
        ),
        'SELECT "is_admitted_in_sncu already exists"'
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
-- t_cbacdetails.SyncedDate
-- Set DEFAULT CURRENT_TIMESTAMP
-- =========================================================

SET SQL_SAFE_UPDATES = 0;

UPDATE db_iemr.t_cbacdetails
SET SyncedBy = CreatedBy
WHERE SyncedBy IS NULL
   OR TRIM(SyncedBy) = '';

SET SQL_SAFE_UPDATES = 1;

SET @table = 't_cbacdetails';
SET @col = 'SyncedDate';

SET @sql = (
    SELECT IF(COUNT(*) > 0,
        CONCAT(
            'ALTER TABLE `', @schema, '`.`', @table,
            '` MODIFY COLUMN `', @col,
            '` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP'
        ),
        'SELECT "SyncedDate column does not exist"'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME = @table
      AND COLUMN_NAME = @col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;