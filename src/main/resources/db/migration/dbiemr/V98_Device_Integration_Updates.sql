USE db_iemr;

SET @schema = 'db_iemr';
SET @ben_reg_id = 'ben_reg_id';
SET @beneficiary_id = 'beneficiary_id';

-- ============================================================
-- tb_diagnostic_document: ben_reg_id -> beneficiary_id
-- ============================================================
SET @table = 'tb_diagnostic_document';

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` RENAME COLUMN `', @ben_reg_id, '` TO `', @beneficiary_id, '`'),
        CONCAT('SELECT "Column ', @ben_reg_id, ' does not exist on ', @table, '"'))
    FROM information_schema.columns
    WHERE table_schema = @schema
      AND table_name = @table
      AND column_name = @ben_reg_id
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_document: rename index idx_diagnostic_document_ben_reg_id
-- ============================================================
SET @old_idx = 'idx_diagnostic_document_ben_reg_id';
SET @new_idx = 'idx_diagnostic_document_beneficiary_id';

SET @sql = (
    SELECT IF(COUNT(*) > 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` RENAME INDEX `', @old_idx, '` TO `', @new_idx, '`'),
        CONCAT('SELECT "Index ', @old_idx, ' does not exist on ', @table, '"'))
    FROM information_schema.statistics
    WHERE table_schema = @schema
      AND table_name = @table
      AND index_name = @old_idx
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_order: ben_reg_id -> beneficiary_id
-- ============================================================
SET @table = 'tb_diagnostic_order';

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` RENAME COLUMN `', @ben_reg_id, '` TO `', @beneficiary_id, '`'),
        CONCAT('SELECT "Column ', @ben_reg_id, ' does not exist on ', @table, '"'))
    FROM information_schema.columns
    WHERE table_schema = @schema
      AND table_name = @table
      AND column_name = @ben_reg_id
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_order: test_completed_at -> retried_at
-- ============================================================
SET @old_col = 'test_completed_at';
SET @new_col = 'retried_at';

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` RENAME COLUMN `', @old_col, '` TO `', @new_col, '`'),
        CONCAT('SELECT "Column ', @old_col, ' does not exist on ', @table, '"'))
    FROM information_schema.columns
    WHERE table_schema = @schema
      AND table_name = @table
      AND column_name = @old_col
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ============================================================
-- tb_diagnostic_result: ben_reg_id -> beneficiary_id
-- ============================================================
SET @table = 'tb_diagnostic_result';

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` RENAME COLUMN `', @ben_reg_id, '` TO `', @beneficiary_id, '`'),
        CONCAT('SELECT "Column ', @ben_reg_id, ' does not exist on ', @table, '"'))
    FROM information_schema.columns
    WHERE table_schema = @schema
      AND table_name = @table
      AND column_name = @ben_reg_id
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;