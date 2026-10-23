SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_userservicerolemapping'
      AND column_name = 'VanID'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE m_userservicerolemapping ADD COLUMN VanID INT NULL;',
    'SELECT "Column VanID already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_userservicerolemapping'
      AND index_name = 'idx_usrm_vanid'
);

SET @sql = IF(
    @idx_exists = 0,
    'CREATE INDEX idx_usrm_vanid ON m_userservicerolemapping (VanID);',
    'SELECT "Index idx_usrm_vanid already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @needs_widen = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_userservicerolemapping'
      AND column_name IN ('Villageid', 'VillageName')
      AND data_type IN ('varchar', 'tinytext', 'text')
);

SET @sql = IF(
    @needs_widen > 0,
    'ALTER TABLE m_userservicerolemapping MODIFY Villageid MEDIUMTEXT NULL, MODIFY VillageName MEDIUMTEXT NULL;',
    'SELECT "Villageid and VillageName already MEDIUMTEXT";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
