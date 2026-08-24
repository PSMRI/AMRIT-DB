USE db_identity;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiarydetails
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiarydetails.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarydetails.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiarydetails.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarydetails.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiaryaddress
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaddress'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiaryaddress.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaddress'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryaddress.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaddress'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiaryaddress.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaddress'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryaddress.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiarycontacts
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarycontacts'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiarycontacts.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarycontacts'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarycontacts.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarycontacts'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiarycontacts.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarycontacts'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarycontacts.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiaryaccount
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaccount'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiaryaccount.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaccount'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryaccount.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaccount'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiaryaccount.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaccount'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryaccount.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiarymapping
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarymapping'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiarymapping.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarymapping'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarymapping.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarymapping'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiarymapping.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarymapping'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarymapping.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiaryfamilymapping
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryfamilymapping'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiaryfamilymapping.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryfamilymapping'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryfamilymapping.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryfamilymapping'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiaryfamilymapping.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryfamilymapping'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryfamilymapping.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiaryidentity
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryidentity'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiaryidentity.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryidentity'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryidentity.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryidentity'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiaryidentity.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryidentity'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryidentity.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.m_beneficiaryregidmapping
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'm_beneficiaryregidmapping'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.m_beneficiaryregidmapping.DownSynced already exists''',
        'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'm_beneficiaryregidmapping'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.m_beneficiaryregidmapping.DownSyncDate already exists''',
        'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'm_beneficiaryregidmapping'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.m_beneficiaryregidmapping.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'm_beneficiaryregidmapping'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.m_beneficiaryregidmapping.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiaryimage
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryimage'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiaryimage.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryimage'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryimage.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryimage'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiaryimage.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryimage'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiaryimage.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_beneficiarydetails_rmnch
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails_rmnch'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_beneficiarydetails_rmnch.DownSynced already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails_rmnch'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarydetails_rmnch.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails_rmnch'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_beneficiarydetails_rmnch.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails_rmnch'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_beneficiarydetails_rmnch.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_bornbirthdeatils
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_bornbirthdeatils'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_bornbirthdeatils.DownSynced already exists''',
        'ALTER TABLE db_identity.i_bornbirthdeatils ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_bornbirthdeatils'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_bornbirthdeatils.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_bornbirthdeatils ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_bornbirthdeatils'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_bornbirthdeatils.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_bornbirthdeatils ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_bornbirthdeatils'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_bornbirthdeatils.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_bornbirthdeatils ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- db_identity.i_householddetails
-- ----------------------------------------------------------------------------

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_householddetails'
              AND COLUMN_NAME  = 'DownSynced'
        ),
        'SELECT ''db_identity.i_householddetails.DownSynced already exists''',
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'''
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_householddetails'
              AND COLUMN_NAME  = 'DownSyncDate'
        ),
        'SELECT ''db_identity.i_householddetails.DownSyncDate already exists''',
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN DownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_householddetails'
              AND COLUMN_NAME  = 'DownSyncFailureReason'
        ),
        'SELECT ''db_identity.i_householddetails.DownSyncFailureReason already exists''',
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_householddetails'
              AND COLUMN_NAME  = 'LastDownSyncDate'
        ),
        'SELECT ''db_identity.i_householddetails.LastDownSyncDate already exists''',
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN LastDownSyncDate DATETIME NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

