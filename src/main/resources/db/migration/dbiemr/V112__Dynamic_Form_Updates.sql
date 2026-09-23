-- ==========================================================
-- Tracks applied FormStructureMigrations so that
-- DynamicFormMigrationRunner can skip ones already run.
-- One row per migration, keyed by its stable migrationId.
-- ==========================================================

USE db_iemr;

CREATE TABLE IF NOT EXISTS t_dynamic_form_migration_log (
    migrationId VARCHAR(50) NOT NULL,
    appliedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (migrationId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- isActive flag on dynamic form tables
-- ==========================================================

SET @schema = 'db_iemr';

-- t_question_option.isActive
SET @table = 't_question_option';
SET @col = 'isActive';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 1'),
        'SELECT "t_question_option.isActive already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- t_section_question.isActive
SET @table = 't_section_question';
SET @col = 'isActive';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 1'),
        'SELECT "t_section_question.isActive already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- t_form_section.isActive
SET @table = 't_form_section';
SET @col = 'isActive';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 1'),
        'SELECT "t_form_section.isActive already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- t_question_validation.isActive
SET @table = 't_question_validation';
SET @col = 'isActive';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 1'),
        'SELECT "t_question_validation.isActive already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- t_form_version.isActive
SET @table = 't_form_version';
SET @col = 'isActive';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 1'),
        'SELECT "t_form_version.isActive already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- t_option_condition.isActive
SET @table = 't_option_condition';
SET @col = 'isActive';
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` BIT(1) NOT NULL DEFAULT 1'),
        'SELECT "t_option_condition.isActive already exists"')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schema
      AND TABLE_NAME   = @table
      AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
