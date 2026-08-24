USE db_iemr;

-- The modification-time column is NOT forced to one name: 79 tables call it
-- LastModDate, 9 StopTB tables call it last_mod_date, and both are left as they
-- are. Script 05 records which name each table uses, in
-- m_downsynctabledetail.LastModColumnName. No duplicate column is created.
--
-- Only the four tables below have no modification-time column at all. They get
-- last_mod_date, matching their StopTB siblings - the sync needs a modification
-- time to detect an edit made in central and to spot a conflict.
--
-- The last section repairs three tables whose last_mod_date exists but is NOT
-- auto-maintained. Without ON UPDATE CURRENT_TIMESTAMP the timestamp never moves
-- when a record is edited, so central's "edited since delivery" test
-- (last_mod_date > DownSyncDate) is never true and the edit is never delivered.

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

-- ----------------------------------------------------------------------------
-- last_mod_date exists but is not auto-maintained - add ON UPDATE.
--
-- MODIFY COLUMN keeps the existing values; rows already holding NULL stay NULL,
-- which reads as "never edited in central" and is correct.
-- ----------------------------------------------------------------------------

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

