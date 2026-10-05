USE db_iemr;

-- ============================================================
-- Add optionUuid
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_question_option'
      AND column_name = 'optionUuid'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE t_question_option ADD COLUMN optionUuid VARCHAR(255) DEFAULT NULL;',
    'SELECT "Column optionUuid already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
