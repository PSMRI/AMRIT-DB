-- =============================================================================
-- Down-sync : CENTRAL setup
-- RUN ONCE ON THE CENTRAL DB (safe to rerun)
--
-- Central holds DownSynced / DownSyncDate / DownSyncFailureReason.
-- It does NOT need LastDownSyncDate or CentralID - those belong to a van.
--
-- Existing columns and indexes will be skipped.
-- =============================================================================


-- =============================================================================
-- 1. db_identity.i_beneficiarydetails
-- =============================================================================

SET @table_name = 'i_beneficiarydetails';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity'
       AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiarydetails.DownSynced'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity'
       AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiarydetails.DownSyncDate'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity'
       AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiarydetails.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity'
       AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiarydetails') = 0,
    'ALTER TABLE db_identity.i_beneficiarydetails ADD INDEX idx_downsync_i_beneficiarydetails (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiarydetails'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 2. db_identity.i_beneficiaryaddress
-- =============================================================================

SET @table_name = 'i_beneficiaryaddress';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiaryaddress.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiaryaddress.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaddress ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiaryaddress.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiaryaddress') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaddress ADD INDEX idx_downsync_i_beneficiaryaddress (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiaryaddress'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 3. db_identity.i_beneficiarycontacts
-- =============================================================================

SET @table_name = 'i_beneficiarycontacts';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiarycontacts.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiarycontacts.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiarycontacts ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiarycontacts.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiarycontacts') = 0,
    'ALTER TABLE db_identity.i_beneficiarycontacts ADD INDEX idx_downsync_i_beneficiarycontacts (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiarycontacts'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 4. db_identity.i_beneficiaryaccount
-- =============================================================================

SET @table_name = 'i_beneficiaryaccount';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiaryaccount.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiaryaccount.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaccount ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiaryaccount.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiaryaccount') = 0,
    'ALTER TABLE db_identity.i_beneficiaryaccount ADD INDEX idx_downsync_i_beneficiaryaccount (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiaryaccount'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 5. db_identity.i_beneficiaryconsent
-- =============================================================================

SET @table_name = 'i_beneficiaryconsent';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiaryconsent ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiaryconsent.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiaryconsent ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiaryconsent.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiaryconsent ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiaryconsent.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiaryconsent') = 0,
    'ALTER TABLE db_identity.i_beneficiaryconsent ADD INDEX idx_downsync_i_beneficiaryconsent (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiaryconsent'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 6. db_identity.i_beneficiaryimage
-- =============================================================================

SET @table_name = 'i_beneficiaryimage';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiaryimage.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiaryimage.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiaryimage ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiaryimage.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiaryimage') = 0,
    'ALTER TABLE db_identity.i_beneficiaryimage ADD INDEX idx_downsync_i_beneficiaryimage (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiaryimage'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 7. db_identity.i_beneficiarymapping
-- =============================================================================

SET @table_name = 'i_beneficiarymapping';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiarymapping.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiarymapping.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiarymapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiarymapping.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiarymapping') = 0,
    'ALTER TABLE db_identity.i_beneficiarymapping ADD INDEX idx_downsync_i_beneficiarymapping (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiarymapping'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 8. db_identity.i_beneficiaryfamilymapping
-- =============================================================================

SET @table_name = 'i_beneficiaryfamilymapping';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiaryfamilymapping.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiaryfamilymapping.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiaryfamilymapping.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiaryfamilymapping') = 0,
    'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD INDEX idx_downsync_i_beneficiaryfamilymapping (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiaryfamilymapping'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 9. db_identity.i_beneficiaryidentity
-- =============================================================================

SET @table_name = 'i_beneficiaryidentity';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: i_beneficiaryidentity.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: i_beneficiaryidentity.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.i_beneficiaryidentity ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: i_beneficiaryidentity.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_i_beneficiaryidentity') = 0,
    'ALTER TABLE db_identity.i_beneficiaryidentity ADD INDEX idx_downsync_i_beneficiaryidentity (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_i_beneficiaryidentity'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- 10. db_identity.m_beneficiaryregidmapping
-- =============================================================================

SET @table_name = 'm_beneficiaryregidmapping';

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipping existing column: m_beneficiaryregidmapping.DownSynced'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN DownSyncDate DATETIME NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipping existing column: m_beneficiaryregidmapping.DownSyncDate'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipping existing column: m_beneficiaryregidmapping.DownSyncFailureReason'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
     WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @table_name
       AND INDEX_NAME = 'idx_downsync_m_beneficiaryregidmapping') = 0,
    'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD INDEX idx_downsync_m_beneficiaryregidmapping (VanID, DownSynced)',
    'SELECT ''Skipping existing index: idx_downsync_m_beneficiaryregidmapping'''
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- =============================================================================
-- END OF CENTRAL DOWN-SYNC SETUP
-- =============================================================================