USE db_iemr;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_hbnc_visit_asha_id_id'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_hbnc_visit
     ADD INDEX idx_hbnc_visit_asha_id_id (asha_id, id),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_hbnc_visit_asha_id_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;