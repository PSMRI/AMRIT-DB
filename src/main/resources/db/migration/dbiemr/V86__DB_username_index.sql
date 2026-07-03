use db_iemr;

USE db_iemr;

-- t_pregnant_woman_register
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pregnant_woman_register'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pregnant_woman_register
     ADD INDEX idx_CreatedBy (created_By),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_pregnant_woman_register'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_cbacdetails
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_cbacdetails
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_cbacdetails'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_eligible_couple_register
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eligible_couple_register'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_eligible_couple_register
     ADD INDEX idx_CreatedBy (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_eligible_couple_register'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_delivery_outcome
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_delivery_outcome'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_delivery_outcome
     ADD INDEX idx_CreatedBy (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_delivery_outcome'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_infant_register
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_infant_register'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_infant_register
     ADD INDEX idx_CreatedBy (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_infant_register'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_anccare
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_anccare
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_anccare'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_pnc_visit
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pnc_visit'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pnc_visit
     ADD INDEX idx_CreatedBy (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_pnc_visit'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_benvisitdetail
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benvisitdetail'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_benvisitdetail
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_benvisitdetail'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- t_pmsma
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pmsma'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pmsma
     ADD INDEX idx_CreatedBy (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on t_pmsma'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;