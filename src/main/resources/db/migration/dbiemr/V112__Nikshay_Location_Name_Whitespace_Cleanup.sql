USE db_iemr;

SET @tbl := 'm_nikshay_state';
SET @col := 'StateName';
SET @exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
SET @sql := IF(@exists > 0,
    CONCAT('UPDATE `', @tbl, '` SET `', @col, '` = TRIM(`', @col, '`) WHERE `', @col, '` <> TRIM(`', @col, '`)'),
    'DO 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_district';
SET @col := 'DistrictName';
SET @exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
SET @sql := IF(@exists > 0,
    CONCAT('UPDATE `', @tbl, '` SET `', @col, '` = TRIM(`', @col, '`) WHERE `', @col, '` <> TRIM(`', @col, '`)'),
    'DO 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_tu';
SET @col := 'TUName';
SET @exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
SET @sql := IF(@exists > 0,
    CONCAT('UPDATE `', @tbl, '` SET `', @col, '` = TRIM(`', @col, '`) WHERE `', @col, '` <> TRIM(`', @col, '`)'),
    'DO 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_facility';
SET @col := 'FacilityName';
SET @exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
SET @sql := IF(@exists > 0,
    CONCAT('UPDATE `', @tbl, '` SET `', @col, '` = TRIM(`', @col, '`) WHERE `', @col, '` <> TRIM(`', @col, '`)'),
    'DO 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_village';
SET @col := 'VillageName';
SET @exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
SET @sql := IF(@exists > 0,
    CONCAT('UPDATE `', @tbl, '` SET `', @col, '` = TRIM(`', @col, '`) WHERE `', @col, '` <> TRIM(`', @col, '`)'),
    'DO 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
