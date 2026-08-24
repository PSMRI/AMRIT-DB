USE db_iemr;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_visit
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_visit'
              AND COLUMN_NAME  = 'last_mod_date'
        ),
        'SELECT ''db_iemr.tb_stoptb_visit.last_mod_date already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD COLUMN last_mod_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_form_response
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_form_response'
              AND COLUMN_NAME  = 'last_mod_date'
        ),
        'SELECT ''db_iemr.t_form_response.last_mod_date already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD COLUMN last_mod_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_section_response
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_section_response'
              AND COLUMN_NAME  = 'last_mod_date'
        ),
        'SELECT ''db_iemr.t_section_response.last_mod_date already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD COLUMN last_mod_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_question_response
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_question_response'
              AND COLUMN_NAME  = 'last_mod_date'
        ),
        'SELECT ''db_iemr.t_question_response.last_mod_date already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD COLUMN last_mod_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_document'
              AND COLUMN_NAME  = 'last_mod_date'
              AND EXTRA LIKE '%on update%'
        ),
        'SELECT ''db_iemr.tb_diagnostic_document.last_mod_date is already auto-maintained''',
        'ALTER TABLE db_iemr.tb_diagnostic_document MODIFY COLUMN last_mod_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_order'
              AND COLUMN_NAME  = 'last_mod_date'
              AND EXTRA LIKE '%on update%'
        ),
        'SELECT ''db_iemr.tb_diagnostic_order.last_mod_date is already auto-maintained''',
        'ALTER TABLE db_iemr.tb_diagnostic_order MODIFY COLUMN last_mod_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_result'
              AND COLUMN_NAME  = 'last_mod_date'
              AND EXTRA LIKE '%on update%'
        ),
        'SELECT ''db_iemr.tb_diagnostic_result.last_mod_date is already auto-maintained''',
        'ALTER TABLE db_iemr.tb_diagnostic_result MODIFY COLUMN last_mod_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

