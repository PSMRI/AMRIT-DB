-- =============================================================================
-- StopTB down-sync : the columns the sync itself requires
--
-- Run by hand, in file-number order, against the StopTB database only.
-- Not a Flyway migration - these scripts live outside db/migration on purpose.
--
-- Every statement is guarded: it checks information_schema first and prints
-- "already exists" instead of failing, so the whole file is safe to re-run.
--
-- The down-sync reads VanID, VanSerialNo, Processed and LastModDate by those
-- exact names - they are written into the SQL text in
-- DataSyncRepositoryCentralDownload and DataSyncRepository, so a table without
-- one of them fails the sync with "Unknown column".
--
-- READ THIS BEFORE RUNNING: nine of these tables already track modification
-- time as last_mod_date. Adding LastModDate gives them a SECOND such column.
-- Both carry ON UPDATE CURRENT_TIMESTAMP so they stay in step, and this is what
-- the previous branch did - but if you would rather not duplicate, the
-- alternative is a code change so the sync resolves the column name per table.
-- The tables affected are marked below.
-- =============================================================================

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

