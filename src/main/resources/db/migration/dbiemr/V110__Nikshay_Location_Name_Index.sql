USE db_iemr;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_nikshay_facility'
      AND index_name = 'idx_nikshay_facility_name_tu'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_nikshay_facility
     ADD INDEX idx_nikshay_facility_name_tu
     (FacilityName, NikshayTUID),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_nikshay_facility_name_tu already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_nikshay_tu'
      AND index_name = 'idx_nikshay_tu_name_district'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_nikshay_tu
     ADD INDEX idx_nikshay_tu_name_district
     (TUName, NikshayDistrictID),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_nikshay_tu_name_district already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_nikshay_district'
      AND index_name = 'idx_nikshay_district_name_state'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_nikshay_district
     ADD INDEX idx_nikshay_district_name_state
     (DistrictName, NikshayStateID),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_nikshay_district_name_state already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_nikshay_village'
      AND index_name = 'idx_nikshay_village_name_facility'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_nikshay_village
     ADD INDEX idx_nikshay_village_name_facility
     (VillageName, NikshayFacilityID),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_nikshay_village_name_facility already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
