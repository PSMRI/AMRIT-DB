USE db_iemr;
 
-- ============================================================
-- Add key_population_risk_factor_ids
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'key_population_risk_factor_ids'
);
 
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN key_population_risk_factor_ids TEXT DEFAULT NULL;',
    'SELECT "Column key_population_risk_factor_ids already exists";'
);
 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
 
-- ============================================================
-- Add key_population_risk_factors
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'key_population_risk_factors'
);
 
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN key_population_risk_factors TEXT DEFAULT NULL;',
    'SELECT "Column key_population_risk_factors already exists";'
);
 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
 
-- ============================================================
-- Add hiv_status_id
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'hiv_status_id'
);
 
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN hiv_status_id INT DEFAULT NULL;',
    'SELECT "Column hiv_status_id already exists";'
);
 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
 
-- ============================================================
-- Add hiv_status
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'hiv_status'
);
 
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE tb_screening ADD COLUMN hiv_status VARCHAR(50) DEFAULT NULL;',
    'SELECT "Column hiv_status already exists";'
);
 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
 
-- ============================================================
-- Add isEditable to t_form_section
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_form_section'
      AND column_name = 'isEditable'
);
 
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE t_form_section ADD COLUMN isEditable BIT NOT NULL DEFAULT 0;',
    'SELECT "Column isEditable already exists";'
);
 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;