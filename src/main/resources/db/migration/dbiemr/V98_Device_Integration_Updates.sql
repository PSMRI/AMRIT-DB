USE db_iemr;

-- ============================================================
-- tb_diagnostic_document: ben_reg_id -> beneficiary_id
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_diagnostic_document'
      AND column_name = 'ben_reg_id'
);

SET @sql = IF(
    @col_exists = 1,
    'ALTER TABLE tb_diagnostic_document RENAME COLUMN ben_reg_id TO beneficiary_id;',
    'SELECT "Column ben_reg_id does not exist on tb_diagnostic_document";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_document: rename index idx_diagnostic_document_ben_reg_id
-- ============================================================
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_diagnostic_document'
      AND index_name = 'idx_diagnostic_document_ben_reg_id'
);

SET @sql = IF(
    @idx_exists > 0,
    'ALTER TABLE tb_diagnostic_document RENAME INDEX idx_diagnostic_document_ben_reg_id TO idx_diagnostic_document_beneficiary_id;',
    'SELECT "Index idx_diagnostic_document_ben_reg_id does not exist on tb_diagnostic_document";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_order: ben_reg_id -> beneficiary_id
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_diagnostic_order'
      AND column_name = 'ben_reg_id'
);

SET @sql = IF(
    @col_exists = 1,
    'ALTER TABLE tb_diagnostic_order RENAME COLUMN ben_reg_id TO beneficiary_id;',
    'SELECT "Column ben_reg_id does not exist on tb_diagnostic_order";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_order: test_completed_at -> retried_at
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_diagnostic_order'
      AND column_name = 'test_completed_at'
);

SET @sql = IF(
    @col_exists = 1,
    'ALTER TABLE tb_diagnostic_order RENAME COLUMN test_completed_at TO retried_at;',
    'SELECT "Column test_completed_at does not exist on tb_diagnostic_order";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_result: ben_reg_id -> beneficiary_id
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_diagnostic_result'
      AND column_name = 'ben_reg_id'
);

SET @sql = IF(
    @col_exists = 1,
    'ALTER TABLE tb_diagnostic_result RENAME COLUMN ben_reg_id TO beneficiary_id;',
    'SELECT "Column ben_reg_id does not exist on tb_diagnostic_result";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;