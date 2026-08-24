USE db_iemr;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_general_opd   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_general_opd'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_opd.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_opd ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_general_examination   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_general_examination'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_examination.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_examination ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_screening   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_screening'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_screening.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_screening ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_diagnostics   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_diagnostics'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_diagnostics.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_diagnostics ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_suspected   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_suspected'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_suspected.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_suspected ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_confirmed_cases   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_confirmed_cases'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_confirmed_cases.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_confirmed_cases ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_diagnostic_order   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_order'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_order.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_order ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_diagnostic_result   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_result'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_result.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_result ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_diagnostic_document   <-- already has last_mod_date; LastModDate would be a DUPLICATE
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_document'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_document.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_document ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_visit
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_visit'
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_visit.LastModDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
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
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.t_form_response.LastModDate already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
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
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.t_section_response.LastModDate already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
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
              AND COLUMN_NAME  = 'LastModDate'
        ),
        'SELECT ''db_iemr.t_question_response.LastModDate already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD COLUMN LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

