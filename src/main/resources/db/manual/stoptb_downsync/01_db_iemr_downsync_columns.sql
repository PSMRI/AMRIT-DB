-- =============================================================================
-- StopTB down-sync : the four down-sync columns on db_iemr
--
-- Run by hand, in file-number order, against the StopTB database only.
-- Not a Flyway migration - these scripts live outside db/migration on purpose.
--
-- Every statement is guarded: it checks information_schema first and prints
-- "already exists" instead of failing, so the whole file is safe to re-run.
--
-- 80 tables - every table configured for up-sync in
-- m_synctabledetail. DownSynced / DownSyncDate / DownSyncFailureReason are
-- written by central; LastDownSyncDate is written by the van. Both sides get
-- all four so neither has to care which end it is.
-- =============================================================================

USE db_iemr;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benvisitdetail
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benvisitdetail'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benvisitdetail.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benvisitdetail ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benvisitdetail'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benvisitdetail.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benvisitdetail ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benvisitdetail'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benvisitdetail.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benvisitdetail ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benvisitdetail'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benvisitdetail.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benvisitdetail ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_phy_anthropometry
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_anthropometry'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_phy_anthropometry.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_phy_anthropometry ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_phy_anthropometry'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_anthropometry.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_anthropometry ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_anthropometry'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_phy_anthropometry.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_phy_anthropometry ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_anthropometry'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_anthropometry.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_anthropometry ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_phy_vitals
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_vitals'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_phy_vitals.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_phy_vitals ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_phy_vitals'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_vitals.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_vitals ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_vitals'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_phy_vitals.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_phy_vitals ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_vitals'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_vitals.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_vitals ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benadherence
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benadherence'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benadherence.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benadherence ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benadherence'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benadherence.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benadherence ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benadherence'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benadherence.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benadherence ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benadherence'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benadherence.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benadherence ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_anccare
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_anccare'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_anccare.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_anccare ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_anccare'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_anccare.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_anccare ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_anccare'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_anccare.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_anccare ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_anccare'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_anccare.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_anccare ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_pnccare
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_pnccare'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_pnccare.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_pnccare ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_pnccare'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_pnccare.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_pnccare ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_pnccare'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_pnccare.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_pnccare ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_pnccare'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_pnccare.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_pnccare ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_ncdscreening
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ncdscreening'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_ncdscreening.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_ncdscreening ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_ncdscreening'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_ncdscreening.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ncdscreening ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ncdscreening'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_ncdscreening.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_ncdscreening ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ncdscreening'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_ncdscreening.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ncdscreening ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_ncdcare
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ncdcare'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_ncdcare.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_ncdcare ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_ncdcare'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_ncdcare.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ncdcare ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ncdcare'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_ncdcare.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_ncdcare ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ncdcare'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_ncdcare.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ncdcare ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_phy_generalexam
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_generalexam'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_phy_generalexam.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_phy_generalexam ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_phy_generalexam'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_generalexam.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_generalexam ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_generalexam'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_phy_generalexam.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_phy_generalexam ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_generalexam'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_generalexam.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_generalexam ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_phy_headtotoe
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_headtotoe'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_phy_headtotoe.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_phy_headtotoe ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_phy_headtotoe'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_headtotoe.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_headtotoe ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_headtotoe'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_phy_headtotoe.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_phy_headtotoe ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_phy_headtotoe'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_phy_headtotoe.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_phy_headtotoe ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_obstetric
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_obstetric'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_obstetric.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_obstetric ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_obstetric'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_obstetric.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_obstetric ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_obstetric'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_obstetric.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_obstetric ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_obstetric'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_obstetric.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_obstetric ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_gastrointestinal
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_gastrointestinal'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_gastrointestinal.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_gastrointestinal ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_gastrointestinal'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_gastrointestinal.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_gastrointestinal ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_gastrointestinal'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_gastrointestinal.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_gastrointestinal ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_gastrointestinal'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_gastrointestinal.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_gastrointestinal ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_cardiovascular
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_cardiovascular'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_cardiovascular.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_cardiovascular ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_cardiovascular'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_cardiovascular.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_cardiovascular ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_cardiovascular'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_cardiovascular.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_cardiovascular ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_cardiovascular'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_cardiovascular.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_cardiovascular ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_respiratory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_respiratory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_respiratory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_respiratory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_respiratory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_respiratory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_respiratory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_respiratory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_respiratory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_respiratory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_respiratory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_respiratory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_respiratory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_centralnervous
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_centralnervous'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_centralnervous.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_centralnervous ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_centralnervous'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_centralnervous.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_centralnervous ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_centralnervous'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_centralnervous.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_centralnervous ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_centralnervous'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_centralnervous.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_centralnervous ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_musculoskeletalsystem
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_musculoskeletalsystem'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_musculoskeletalsystem.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_musculoskeletalsystem ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_musculoskeletalsystem'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_musculoskeletalsystem.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_musculoskeletalsystem ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_musculoskeletalsystem'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_musculoskeletalsystem.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_musculoskeletalsystem ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_musculoskeletalsystem'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_musculoskeletalsystem.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_musculoskeletalsystem ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_sys_genitourinarysystem
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_genitourinarysystem'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_sys_genitourinarysystem.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_sys_genitourinarysystem ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_sys_genitourinarysystem'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_genitourinarysystem.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_genitourinarysystem ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_genitourinarysystem'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_sys_genitourinarysystem.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_sys_genitourinarysystem ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_sys_genitourinarysystem'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_sys_genitourinarysystem.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_sys_genitourinarysystem ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_ancdiagnosis
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ancdiagnosis'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_ancdiagnosis.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_ancdiagnosis ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_ancdiagnosis'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_ancdiagnosis.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ancdiagnosis ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ancdiagnosis'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_ancdiagnosis.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_ancdiagnosis ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ancdiagnosis'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_ancdiagnosis.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ancdiagnosis ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_ncddiagnosis
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ncddiagnosis'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_ncddiagnosis.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_ncddiagnosis ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_ncddiagnosis'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_ncddiagnosis.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ncddiagnosis ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ncddiagnosis'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_ncddiagnosis.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_ncddiagnosis ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ncddiagnosis'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_ncddiagnosis.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ncddiagnosis ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_pncdiagnosis
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_pncdiagnosis'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_pncdiagnosis.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_pncdiagnosis ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_pncdiagnosis'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_pncdiagnosis.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_pncdiagnosis ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_pncdiagnosis'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_pncdiagnosis.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_pncdiagnosis ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_pncdiagnosis'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_pncdiagnosis.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_pncdiagnosis ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benchiefcomplaint
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benchiefcomplaint'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benchiefcomplaint.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benchiefcomplaint ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benchiefcomplaint'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benchiefcomplaint.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benchiefcomplaint ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benchiefcomplaint'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benchiefcomplaint.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benchiefcomplaint ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benchiefcomplaint'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benchiefcomplaint.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benchiefcomplaint ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benclinicalobservation
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benclinicalobservation'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benclinicalobservation.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benclinicalobservation ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benclinicalobservation'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benclinicalobservation.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benclinicalobservation ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benclinicalobservation'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benclinicalobservation.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benclinicalobservation ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benclinicalobservation'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benclinicalobservation.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benclinicalobservation ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_prescription
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_prescription'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_prescription.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_prescription ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_prescription'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_prescription.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_prescription ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_prescription'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_prescription.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_prescription ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_prescription'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_prescription.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_prescription ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_prescribeddrug
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_prescribeddrug'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_prescribeddrug.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_prescribeddrug ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_prescribeddrug'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_prescribeddrug.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_prescribeddrug ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_prescribeddrug'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_prescribeddrug.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_prescribeddrug ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_prescribeddrug'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_prescribeddrug.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_prescribeddrug ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_lab_testorder
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_lab_testorder'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_lab_testorder.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_lab_testorder ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_lab_testorder'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_lab_testorder.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_lab_testorder ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_lab_testorder'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_lab_testorder.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_lab_testorder ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_lab_testorder'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_lab_testorder.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_lab_testorder ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benreferdetails
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benreferdetails'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benreferdetails.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benreferdetails ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benreferdetails'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benreferdetails.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benreferdetails ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benreferdetails'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benreferdetails.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benreferdetails ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benreferdetails'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benreferdetails.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benreferdetails ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_lab_testresult
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_lab_testresult'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_lab_testresult.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_lab_testresult ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_lab_testresult'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_lab_testresult.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_lab_testresult ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_lab_testresult'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_lab_testresult.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_lab_testresult ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_lab_testresult'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_lab_testresult.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_lab_testresult ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_physicalstockentry
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_physicalstockentry'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_physicalstockentry.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_physicalstockentry ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_physicalstockentry'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_physicalstockentry.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_physicalstockentry ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_physicalstockentry'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_physicalstockentry.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_physicalstockentry ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_physicalstockentry'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_physicalstockentry.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_physicalstockentry ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_patientissue
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_patientissue'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_patientissue.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_patientissue ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_patientissue'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_patientissue.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_patientissue ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_patientissue'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_patientissue.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_patientissue ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_patientissue'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_patientissue.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_patientissue ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_facilityconsumption
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_facilityconsumption'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_facilityconsumption.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_facilityconsumption ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_facilityconsumption'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_facilityconsumption.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_facilityconsumption ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_facilityconsumption'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_facilityconsumption.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_facilityconsumption ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_facilityconsumption'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_facilityconsumption.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_facilityconsumption ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_itemstockentry
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_itemstockentry'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_itemstockentry.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_itemstockentry'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_itemstockentry.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_itemstockentry'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_itemstockentry.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_itemstockentry'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_itemstockentry.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_itemstockexit
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_itemstockexit'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_itemstockexit.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_itemstockexit'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_itemstockexit.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_itemstockexit'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_itemstockexit.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_itemstockexit'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_itemstockexit.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benmedhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benmedhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benmedhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benmedhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benmedhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benmedhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benmedhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benmedhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benmedhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benmedhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benmedhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benmedhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benmedhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_femaleobstetrichistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_femaleobstetrichistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_femaleobstetrichistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_femaleobstetrichistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_femaleobstetrichistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_femaleobstetrichistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_femaleobstetrichistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_femaleobstetrichistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_femaleobstetrichistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_femaleobstetrichistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_femaleobstetrichistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_femaleobstetrichistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_femaleobstetrichistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benmenstrualdetails
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benmenstrualdetails'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benmenstrualdetails.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benmenstrualdetails ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benmenstrualdetails'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benmenstrualdetails.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benmenstrualdetails ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benmenstrualdetails'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benmenstrualdetails.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benmenstrualdetails ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benmenstrualdetails'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benmenstrualdetails.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benmenstrualdetails ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benpersonalhabit
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benpersonalhabit'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benpersonalhabit.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benpersonalhabit ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benpersonalhabit'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benpersonalhabit.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benpersonalhabit ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benpersonalhabit'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benpersonalhabit.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benpersonalhabit ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benpersonalhabit'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benpersonalhabit.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benpersonalhabit ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_childvaccinedetail1
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childvaccinedetail1'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail1.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail1 ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_childvaccinedetail1'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail1.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail1 ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childvaccinedetail1'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail1.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail1 ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childvaccinedetail1'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail1.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail1 ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_childvaccinedetail2
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childvaccinedetail2'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail2.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail2 ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_childvaccinedetail2'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail2.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail2 ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childvaccinedetail2'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail2.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail2 ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childvaccinedetail2'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_childvaccinedetail2.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail2 ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_childoptionalvaccinedetail
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childoptionalvaccinedetail'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_childoptionalvaccinedetail.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_childoptionalvaccinedetail ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_childoptionalvaccinedetail'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_childoptionalvaccinedetail.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childoptionalvaccinedetail ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childoptionalvaccinedetail'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_childoptionalvaccinedetail.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_childoptionalvaccinedetail ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childoptionalvaccinedetail'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_childoptionalvaccinedetail.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childoptionalvaccinedetail ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_ancwomenvaccinedetail
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ancwomenvaccinedetail'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_ancwomenvaccinedetail.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_ancwomenvaccinedetail ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_ancwomenvaccinedetail'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_ancwomenvaccinedetail.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ancwomenvaccinedetail ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ancwomenvaccinedetail'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_ancwomenvaccinedetail.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_ancwomenvaccinedetail ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_ancwomenvaccinedetail'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_ancwomenvaccinedetail.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_ancwomenvaccinedetail ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_childfeedinghistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childfeedinghistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_childfeedinghistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_childfeedinghistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_childfeedinghistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_childfeedinghistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childfeedinghistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childfeedinghistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_childfeedinghistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_childfeedinghistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_childfeedinghistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_childfeedinghistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_childfeedinghistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benallergyhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benallergyhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benallergyhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benallergyhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benallergyhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benallergyhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benallergyhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benallergyhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benallergyhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benallergyhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benallergyhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benallergyhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benallergyhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_bencomorbiditycondition
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_bencomorbiditycondition'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_bencomorbiditycondition.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_bencomorbiditycondition ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_bencomorbiditycondition'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_bencomorbiditycondition.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_bencomorbiditycondition ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_bencomorbiditycondition'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_bencomorbiditycondition.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_bencomorbiditycondition ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_bencomorbiditycondition'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_bencomorbiditycondition.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_bencomorbiditycondition ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benmedicationhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benmedicationhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benmedicationhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benmedicationhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benmedicationhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benmedicationhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benmedicationhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benmedicationhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benmedicationhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benmedicationhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benmedicationhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benmedicationhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benmedicationhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_benfamilyhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benfamilyhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_benfamilyhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_benfamilyhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_benfamilyhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_benfamilyhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benfamilyhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benfamilyhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_benfamilyhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_benfamilyhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_benfamilyhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_benfamilyhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_benfamilyhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_perinatalhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_perinatalhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_perinatalhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_perinatalhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_perinatalhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_perinatalhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_perinatalhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_perinatalhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_perinatalhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_perinatalhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_perinatalhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_perinatalhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_perinatalhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_developmenthistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_developmenthistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_developmenthistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_developmenthistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_developmenthistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_developmenthistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_developmenthistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_developmenthistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_developmenthistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_developmenthistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_developmenthistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_developmenthistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_developmenthistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerfamilyhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerfamilyhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerfamilyhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerfamilyhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerfamilyhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerfamilyhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerfamilyhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerfamilyhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerfamilyhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerfamilyhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerfamilyhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerfamilyhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerfamilyhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerpersonalhistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerpersonalhistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerpersonalhistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerpersonalhistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerpersonalhistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerpersonalhistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerpersonalhistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerpersonalhistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerpersonalhistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerpersonalhistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerpersonalhistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerpersonalhistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerpersonalhistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerdiethistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerdiethistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerdiethistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerdiethistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerdiethistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerdiethistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerdiethistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerdiethistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerdiethistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerdiethistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerdiethistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerdiethistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerdiethistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerobstetrichistory
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerobstetrichistory'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerobstetrichistory.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerobstetrichistory ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerobstetrichistory'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerobstetrichistory.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerobstetrichistory ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerobstetrichistory'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerobstetrichistory.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerobstetrichistory ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerobstetrichistory'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerobstetrichistory.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerobstetrichistory ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancervitals
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancervitals'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancervitals.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancervitals ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancervitals'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancervitals.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancervitals ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancervitals'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancervitals.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancervitals ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancervitals'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancervitals.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancervitals ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancersignandsymptoms
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancersignandsymptoms'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancersignandsymptoms.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancersignandsymptoms ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancersignandsymptoms'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancersignandsymptoms.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancersignandsymptoms ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancersignandsymptoms'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancersignandsymptoms.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancersignandsymptoms ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancersignandsymptoms'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancersignandsymptoms.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancersignandsymptoms ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerlymphnode
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerlymphnode'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerlymphnode.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerlymphnode ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerlymphnode'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerlymphnode.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerlymphnode ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerlymphnode'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerlymphnode.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerlymphnode ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerlymphnode'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerlymphnode.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerlymphnode ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_canceroralexamination
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_canceroralexamination'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_canceroralexamination.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_canceroralexamination ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_canceroralexamination'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_canceroralexamination.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_canceroralexamination ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_canceroralexamination'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_canceroralexamination.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_canceroralexamination ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_canceroralexamination'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_canceroralexamination.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_canceroralexamination ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerbreastexamination
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerbreastexamination'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerbreastexamination.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerbreastexamination ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerbreastexamination'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerbreastexamination.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerbreastexamination ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerbreastexamination'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerbreastexamination.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerbreastexamination ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerbreastexamination'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerbreastexamination.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerbreastexamination ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerabdominalexamination
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerabdominalexamination'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerabdominalexamination.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerabdominalexamination ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerabdominalexamination'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerabdominalexamination.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerabdominalexamination ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerabdominalexamination'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerabdominalexamination.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerabdominalexamination ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerabdominalexamination'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerabdominalexamination.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerabdominalexamination ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancergynecologicalexamination
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancergynecologicalexamination'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancergynecologicalexamination.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancergynecologicalexamination ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancergynecologicalexamination'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancergynecologicalexamination.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancergynecologicalexamination ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancergynecologicalexamination'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancergynecologicalexamination.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancergynecologicalexamination ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancergynecologicalexamination'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancergynecologicalexamination.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancergynecologicalexamination ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerdiagnosis
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerdiagnosis'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerdiagnosis.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerdiagnosis ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerdiagnosis'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerdiagnosis.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerdiagnosis ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerdiagnosis'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerdiagnosis.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerdiagnosis ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerdiagnosis'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerdiagnosis.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerdiagnosis ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_cancerimageannotation
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerimageannotation'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_cancerimageannotation.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_cancerimageannotation ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_cancerimageannotation'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerimageannotation.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerimageannotation ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerimageannotation'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_cancerimageannotation.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_cancerimageannotation ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_cancerimageannotation'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_cancerimageannotation.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_cancerimageannotation ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_stockadjustment
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_stockadjustment'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_stockadjustment.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_stockadjustment ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_stockadjustment'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_stockadjustment.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_stockadjustment ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_stockadjustment'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_stockadjustment.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_stockadjustment ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_stockadjustment'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_stockadjustment.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_stockadjustment ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_stocktransfer
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_stocktransfer'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_stocktransfer.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_stocktransfer ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_stocktransfer'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_stocktransfer.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_stocktransfer ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_stocktransfer'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_stocktransfer.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_stocktransfer ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_stocktransfer'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_stocktransfer.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_stocktransfer ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_patientreturn
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_patientreturn'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_patientreturn.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_patientreturn ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_patientreturn'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_patientreturn.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_patientreturn ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_patientreturn'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_patientreturn.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_patientreturn ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_patientreturn'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_patientreturn.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_patientreturn ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_indent
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_indent'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_indent.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_indent ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_indent'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_indent.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_indent ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_indent'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_indent.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_indent ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_indent'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_indent.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_indent ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_indentissue
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_indentissue'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_indentissue.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_indentissue ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_indentissue'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_indentissue.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_indentissue ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_indentissue'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_indentissue.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_indentissue ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_indentissue'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_indentissue.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_indentissue ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_indentorder
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_indentorder'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_indentorder.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_indentorder ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_indentorder'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_indentorder.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_indentorder ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_indentorder'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_indentorder.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_indentorder ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_indentorder'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_indentorder.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_indentorder ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.t_saitemmapping
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_saitemmapping'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_saitemmapping.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_saitemmapping'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_saitemmapping.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_saitemmapping'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_saitemmapping.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_saitemmapping'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_saitemmapping.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_general_opd
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_general_opd'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_opd.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_opd ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_stoptb_general_opd'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_opd.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_opd ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_general_opd'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_opd.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_opd ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_general_opd'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_opd.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_opd ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_general_examination
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_general_examination'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_examination.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_examination ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_stoptb_general_examination'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_examination.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_examination ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_general_examination'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_examination.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_examination ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_general_examination'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_general_examination.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_examination ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_screening
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_screening'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_screening.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_screening ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_screening'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_screening.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_screening ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_screening'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_screening.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_screening ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_screening'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_screening.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_screening ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_stoptb_diagnostics
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_diagnostics'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_stoptb_diagnostics.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_diagnostics ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_stoptb_diagnostics'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_diagnostics.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_diagnostics ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_diagnostics'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_stoptb_diagnostics.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_diagnostics ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_diagnostics'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_diagnostics.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_diagnostics ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_suspected
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_suspected'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_suspected.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_suspected ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_suspected'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_suspected.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_suspected ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_suspected'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_suspected.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_suspected ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_suspected'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_suspected.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_suspected ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_confirmed_cases
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_confirmed_cases'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_confirmed_cases.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_confirmed_cases ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_confirmed_cases'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_confirmed_cases.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_confirmed_cases ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_confirmed_cases'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_confirmed_cases.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_confirmed_cases ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_confirmed_cases'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_confirmed_cases.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_confirmed_cases ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_diagnostic_order
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_order'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_diagnostic_order.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_order ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_order.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_order ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_diagnostic_order.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_order ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_order.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_order ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_diagnostic_result
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_result'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_diagnostic_result.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_result ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_result.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_result ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_diagnostic_result.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_result ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_result.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_result ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_iemr.tb_diagnostic_document
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_document'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_diagnostic_document.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_document ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_document.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_document ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_diagnostic_document.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_document ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_diagnostic_document.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_document ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.tb_stoptb_visit.DownSynced already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 'tb_stoptb_visit'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_visit.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_visit'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.tb_stoptb_visit.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 'tb_stoptb_visit'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.tb_stoptb_visit.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_form_response.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_form_response'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_form_response.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_form_response'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_form_response.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_form_response'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_form_response.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_section_response.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_section_response'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_section_response.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_section_response'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_section_response.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_section_response'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_section_response.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_iemr.t_question_response.DownSynced already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
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
              AND TABLE_NAME   = 't_question_response'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_iemr.t_question_response.DownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_question_response'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_iemr.t_question_response.DownSyncFailureReason already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
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
              AND TABLE_NAME   = 't_question_response'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_iemr.t_question_response.LastDownSyncDate already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

