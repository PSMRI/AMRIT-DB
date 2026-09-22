USE db_iemr;

-- ============================================================
-- Add chest_pain
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'chest_pain'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN chest_pain TINYINT(1) DEFAULT NULL;',
    'SELECT "Column chest_pain already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- Add shortness_of_breath
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'shortness_of_breath'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN shortness_of_breath TINYINT(1) DEFAULT NULL;',
    'SELECT "Column shortness_of_breath already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- Add fatigue
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'fatigue'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN fatigue TINYINT(1) DEFAULT NULL;',
    'SELECT "Column fatigue already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- Add failure_to_gain_weight
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'failure_to_gain_weight'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN failure_to_gain_weight TINYINT(1) DEFAULT NULL;',
    'SELECT "Column failure_to_gain_weight already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- Add decreased_activity_or_playfulness
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'decreased_activity_or_playfulness'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN decreased_activity_or_playfulness TINYINT(1) DEFAULT NULL;',
    'SELECT "Column decreased_activity_or_playfulness already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- Add others
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'others'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN others TINYINT(1) DEFAULT NULL;',
    'SELECT "Column others already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
