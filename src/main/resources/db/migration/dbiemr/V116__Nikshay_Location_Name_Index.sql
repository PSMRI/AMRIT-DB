USE db_iemr;

SET @tbl := 'm_nikshay_facility';
SET @idx := 'idx_nikshay_facility_name_tu';
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);
SET @idx_exists := (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = DATABASE() AND table_name = @tbl AND index_name = @idx
);
SET @sql := IF(@tbl_exists = 0, 'DO 0',
    IF(@idx_exists = 0,
        'ALTER TABLE m_nikshay_facility ADD INDEX idx_nikshay_facility_name_tu (FacilityName, NikshayTUID), ALGORITHM=INPLACE, LOCK=NONE',
        'DO 0'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_tu';
SET @idx := 'idx_nikshay_tu_name_district';
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);
SET @idx_exists := (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = DATABASE() AND table_name = @tbl AND index_name = @idx
);
SET @sql := IF(@tbl_exists = 0, 'DO 0',
    IF(@idx_exists = 0,
        'ALTER TABLE m_nikshay_tu ADD INDEX idx_nikshay_tu_name_district (TUName, NikshayDistrictID), ALGORITHM=INPLACE, LOCK=NONE',
        'DO 0'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_district';
SET @idx := 'idx_nikshay_district_name_state';
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);
SET @idx_exists := (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = DATABASE() AND table_name = @tbl AND index_name = @idx
);
SET @sql := IF(@tbl_exists = 0, 'DO 0',
    IF(@idx_exists = 0,
        'ALTER TABLE m_nikshay_district ADD INDEX idx_nikshay_district_name_state (DistrictName, NikshayStateID), ALGORITHM=INPLACE, LOCK=NONE',
        'DO 0'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl := 'm_nikshay_village';
SET @idx := 'idx_nikshay_village_name_facility';
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);
SET @idx_exists := (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = DATABASE() AND table_name = @tbl AND index_name = @idx
);
SET @sql := IF(@tbl_exists = 0, 'DO 0',
    IF(@idx_exists = 0,
        'ALTER TABLE m_nikshay_village ADD INDEX idx_nikshay_village_name_facility (VillageName, NikshayFacilityID), ALGORITHM=INPLACE, LOCK=NONE',
        'DO 0'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
