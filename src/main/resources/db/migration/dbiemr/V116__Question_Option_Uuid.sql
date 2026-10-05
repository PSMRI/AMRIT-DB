-- ==========================================================
-- t_question_option (see V87):
--   Adds optionUuid (VARCHAR(255) NULL) after optionId, a stable identifier for an option.
--   If the column already exists (e.g. created earlier as VARCHAR(36)), it is widened to
--   VARCHAR(255) instead.
--
-- Idempotent: guarded by an information_schema check; safe to run more than once.
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 't_question_option';

-- ----------------------------------------------------------
-- ADD COLUMN optionUuid
-- ----------------------------------------------------------
SET @col_name = 'optionUuid';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(255) NULL AFTER optionId'),
CONCAT('ALTER TABLE ', @tbl_name, ' MODIFY COLUMN ', @col_name, ' VARCHAR(255) NULL')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;