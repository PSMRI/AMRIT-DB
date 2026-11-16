-- ==========================================================
-- tb_stoptb_diagnostics (see V93):
--   Widens the three result text columns from VARCHAR(20) to VARCHAR(255). Saves were failing with
--   "Data too long for column 'digital_chest_xray_result'"; truenat_result and liquid_culture_result
--   carry the same 20-char limit and the same kind of value.
--
-- Idempotent: each column is changed only while it is a VARCHAR shorter than 255.
-- Widening a VARCHAR keeps existing data and does not touch the trg_scl_* triggers (V132).
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_stoptb_diagnostics';

-- digital_chest_xray_result
SET @col_name = 'digital_chest_xray_result';
SET @col_len = NULL;
PREPARE chk_col FROM 'SELECT CHARACTER_MAXIMUM_LENGTH INTO @col_len FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ? AND DATA_TYPE = ''varchar''';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_len IS NOT NULL AND @col_len < 255,
CONCAT('ALTER TABLE ', @tbl_name, ' MODIFY COLUMN ', @col_name, ' VARCHAR(255) NULL DEFAULT NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' not changed (length ', IFNULL(@col_len, 'n/a'), ')'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- truenat_result
SET @col_name = 'truenat_result';
SET @col_len = NULL;
PREPARE chk_col FROM 'SELECT CHARACTER_MAXIMUM_LENGTH INTO @col_len FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ? AND DATA_TYPE = ''varchar''';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_len IS NOT NULL AND @col_len < 255,
CONCAT('ALTER TABLE ', @tbl_name, ' MODIFY COLUMN ', @col_name, ' VARCHAR(255) NULL DEFAULT NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' not changed (length ', IFNULL(@col_len, 'n/a'), ')'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- liquid_culture_result
SET @col_name = 'liquid_culture_result';
SET @col_len = NULL;
PREPARE chk_col FROM 'SELECT CHARACTER_MAXIMUM_LENGTH INTO @col_len FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ? AND DATA_TYPE = ''varchar''';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_len IS NOT NULL AND @col_len < 255,
CONCAT('ALTER TABLE ', @tbl_name, ' MODIFY COLUMN ', @col_name, ' VARCHAR(255) NULL DEFAULT NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' not changed (length ', IFNULL(@col_len, 'n/a'), ')'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name := NULL, @col_len := NULL, @sql := NULL;
