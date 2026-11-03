-- ==========================================================
-- t_section_question.requiresBackFill
-- Marks a question the client must make sure has a value at least once
-- after a new form version is sent (e.g. a field added in that version
-- for beneficiaries whose earlier responses never captured it).
-- Defaults to 0, so every existing question stays unflagged.
-- ==========================================================

USE db_iemr;

SET @schema = 'db_iemr';
SET @table = 't_section_question';
SET @col = 'requiresBackFill';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 0'),
        'SELECT "t_section_question.requiresBackFill already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================================================
-- t_section_question.editableAfterSubmit
-- Marks a question whose answer the client lets the user change
-- after the form has been submitted (e.g. to continue a follow-up).
-- Defaults to 0, so every existing question stays read-only after submit.
-- ==========================================================

SET @col = 'editableAfterSubmit';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 0'),
        'SELECT "t_section_question.editableAfterSubmit already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;