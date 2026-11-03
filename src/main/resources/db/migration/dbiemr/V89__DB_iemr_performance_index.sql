USE db_iemr;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_ben_activity_created'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE incentive_activity_record
     ADD INDEX idx_ben_activity_created
     (ben_id, activity_id, created_date),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_ben_activity_created already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_iar_asha_id_desc'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE incentive_activity_record
     ADD INDEX idx_iar_asha_id_desc
     (asha_id, id DESC),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_iar_asha_id_desc already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;