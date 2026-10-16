-- =============================================================================
-- Down-sync : CENTRAL setup (GUARDED / RE-RUN SAFE)
-- Run on the CENTRAL database.
--
-- Each column and index is checked independently:
--   * if missing, it is added;
--   * if already present, the operation is skipped;
--   * if the table (or an index's required columns) is missing, it is skipped.
-- Data backfills at the end run only when the required tables and columns exist.
-- =============================================================================

SET @OLD_SQL_SAFE_UPDATES = @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;

-- Guarded column: db_iemr.t_benvisitdetail.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benvisitdetail.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benvisitdetail.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benvisitdetail.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benvisitdetail.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benvisitdetail.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benvisitdetail.idx_downsync_t_benvisitdetail
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND INDEX_NAME = 'idx_downsync_t_benvisitdetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD INDEX `idx_downsync_t_benvisitdetail` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benvisitdetail.idx_downsync_t_benvisitdetail: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_anthropometry.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_phy_anthropometry.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_anthropometry.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_phy_anthropometry.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_anthropometry.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_phy_anthropometry.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_phy_anthropometry.idx_downsync_t_phy_anthropometry
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND INDEX_NAME = 'idx_downsync_t_phy_anthropometry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD INDEX `idx_downsync_t_phy_anthropometry` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_phy_anthropometry.idx_downsync_t_phy_anthropometry: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_vitals.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_phy_vitals.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_vitals.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_phy_vitals.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_vitals.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_phy_vitals.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_phy_vitals.idx_downsync_t_phy_vitals
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND INDEX_NAME = 'idx_downsync_t_phy_vitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_phy_vitals` ADD INDEX `idx_downsync_t_phy_vitals` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_phy_vitals.idx_downsync_t_phy_vitals: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benadherence.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benadherence.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benadherence.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benadherence.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benadherence.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benadherence.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benadherence.idx_downsync_t_benadherence
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND INDEX_NAME = 'idx_downsync_t_benadherence') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benadherence` ADD INDEX `idx_downsync_t_benadherence` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benadherence.idx_downsync_t_benadherence: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_anccare.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_anccare.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_anccare.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_anccare.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_anccare.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_anccare.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_anccare.idx_downsync_t_anccare
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND INDEX_NAME = 'idx_downsync_t_anccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_anccare` ADD INDEX `idx_downsync_t_anccare` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_anccare.idx_downsync_t_anccare: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_pnccare.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_pnccare.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_pnccare.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_pnccare.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_pnccare.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_pnccare.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_pnccare.idx_downsync_t_pnccare
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND INDEX_NAME = 'idx_downsync_t_pnccare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_pnccare` ADD INDEX `idx_downsync_t_pnccare` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_pnccare.idx_downsync_t_pnccare: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncdscreening.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_ncdscreening.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncdscreening.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_ncdscreening.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncdscreening.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_ncdscreening.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_ncdscreening.idx_downsync_t_ncdscreening
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND INDEX_NAME = 'idx_downsync_t_ncdscreening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_ncdscreening` ADD INDEX `idx_downsync_t_ncdscreening` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_ncdscreening.idx_downsync_t_ncdscreening: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncdcare.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_ncdcare.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncdcare.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_ncdcare.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncdcare.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_ncdcare.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_ncdcare.idx_downsync_t_ncdcare
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND INDEX_NAME = 'idx_downsync_t_ncdcare') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_ncdcare` ADD INDEX `idx_downsync_t_ncdcare` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_ncdcare.idx_downsync_t_ncdcare: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_generalexam.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_phy_generalexam.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_generalexam.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_phy_generalexam.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_generalexam.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_phy_generalexam.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_phy_generalexam.idx_downsync_t_phy_generalexam
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND INDEX_NAME = 'idx_downsync_t_phy_generalexam') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD INDEX `idx_downsync_t_phy_generalexam` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_phy_generalexam.idx_downsync_t_phy_generalexam: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_headtotoe.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_phy_headtotoe.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_headtotoe.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_phy_headtotoe.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_phy_headtotoe.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_phy_headtotoe.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_phy_headtotoe.idx_downsync_t_phy_headtotoe
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND INDEX_NAME = 'idx_downsync_t_phy_headtotoe') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD INDEX `idx_downsync_t_phy_headtotoe` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_phy_headtotoe.idx_downsync_t_phy_headtotoe: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_obstetric.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_obstetric.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_obstetric.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_obstetric.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_obstetric.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_obstetric.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_obstetric.idx_downsync_t_sys_obstetric
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND INDEX_NAME = 'idx_downsync_t_sys_obstetric') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD INDEX `idx_downsync_t_sys_obstetric` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_obstetric.idx_downsync_t_sys_obstetric: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_gastrointestinal.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_gastrointestinal.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_gastrointestinal.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_gastrointestinal.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_gastrointestinal.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_gastrointestinal.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_gastrointestinal.idx_downsync_t_sys_gastrointestinal
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND INDEX_NAME = 'idx_downsync_t_sys_gastrointestinal') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD INDEX `idx_downsync_t_sys_gastrointestinal` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_gastrointestinal.idx_downsync_t_sys_gastrointestinal: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_cardiovascular.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_cardiovascular.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_cardiovascular.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_cardiovascular.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_cardiovascular.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_cardiovascular.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_cardiovascular.idx_downsync_t_sys_cardiovascular
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND INDEX_NAME = 'idx_downsync_t_sys_cardiovascular') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD INDEX `idx_downsync_t_sys_cardiovascular` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_cardiovascular.idx_downsync_t_sys_cardiovascular: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_respiratory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_respiratory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_respiratory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_respiratory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_respiratory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_respiratory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_respiratory.idx_downsync_t_sys_respiratory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND INDEX_NAME = 'idx_downsync_t_sys_respiratory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD INDEX `idx_downsync_t_sys_respiratory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_respiratory.idx_downsync_t_sys_respiratory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_centralnervous.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_centralnervous.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_centralnervous.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_centralnervous.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_centralnervous.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_centralnervous.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_centralnervous.idx_downsync_t_sys_centralnervous
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND INDEX_NAME = 'idx_downsync_t_sys_centralnervous') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD INDEX `idx_downsync_t_sys_centralnervous` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_centralnervous.idx_downsync_t_sys_centralnervous: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_musculoskeletalsystem.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_musculoskeletalsystem.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_musculoskeletalsystem.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_musculoskeletalsystem.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_musculoskeletalsystem.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_musculoskeletalsystem.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_musculoskeletalsystem.idx_downsync_t_sys_musculoskeletalsystem
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND INDEX_NAME = 'idx_downsync_t_sys_musculoskeletalsystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD INDEX `idx_downsync_t_sys_musculoskeletalsystem` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_musculoskeletalsystem.idx_downsync_t_sys_musculoskeletalsystem: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_genitourinarysystem.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_sys_genitourinarysystem.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_genitourinarysystem.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_sys_genitourinarysystem.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_sys_genitourinarysystem.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_sys_genitourinarysystem.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_sys_genitourinarysystem.idx_downsync_t_sys_genitourinarysystem
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND INDEX_NAME = 'idx_downsync_t_sys_genitourinarysystem') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD INDEX `idx_downsync_t_sys_genitourinarysystem` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_sys_genitourinarysystem.idx_downsync_t_sys_genitourinarysystem: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ancdiagnosis.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_ancdiagnosis.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ancdiagnosis.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_ancdiagnosis.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ancdiagnosis.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_ancdiagnosis.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_ancdiagnosis.idx_downsync_t_ancdiagnosis
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND INDEX_NAME = 'idx_downsync_t_ancdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD INDEX `idx_downsync_t_ancdiagnosis` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_ancdiagnosis.idx_downsync_t_ancdiagnosis: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncddiagnosis.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_ncddiagnosis.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncddiagnosis.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_ncddiagnosis.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ncddiagnosis.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_ncddiagnosis.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_ncddiagnosis.idx_downsync_t_ncddiagnosis
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND INDEX_NAME = 'idx_downsync_t_ncddiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD INDEX `idx_downsync_t_ncddiagnosis` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_ncddiagnosis.idx_downsync_t_ncddiagnosis: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_pncdiagnosis.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_pncdiagnosis.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_pncdiagnosis.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_pncdiagnosis.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_pncdiagnosis.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_pncdiagnosis.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_pncdiagnosis.idx_downsync_t_pncdiagnosis
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND INDEX_NAME = 'idx_downsync_t_pncdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD INDEX `idx_downsync_t_pncdiagnosis` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_pncdiagnosis.idx_downsync_t_pncdiagnosis: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benchiefcomplaint.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benchiefcomplaint.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benchiefcomplaint.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benchiefcomplaint.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benchiefcomplaint.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benchiefcomplaint.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benchiefcomplaint.idx_downsync_t_benchiefcomplaint
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND INDEX_NAME = 'idx_downsync_t_benchiefcomplaint') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD INDEX `idx_downsync_t_benchiefcomplaint` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benchiefcomplaint.idx_downsync_t_benchiefcomplaint: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benclinicalobservation.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benclinicalobservation.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benclinicalobservation.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benclinicalobservation.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benclinicalobservation.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benclinicalobservation.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benclinicalobservation.idx_downsync_t_benclinicalobservation
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND INDEX_NAME = 'idx_downsync_t_benclinicalobservation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD INDEX `idx_downsync_t_benclinicalobservation` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benclinicalobservation.idx_downsync_t_benclinicalobservation: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_prescription.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_prescription.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_prescription.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_prescription.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_prescription.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_prescription.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_prescription.idx_downsync_t_prescription
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND INDEX_NAME = 'idx_downsync_t_prescription') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_prescription` ADD INDEX `idx_downsync_t_prescription` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_prescription.idx_downsync_t_prescription: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_prescribeddrug.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_prescribeddrug.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_prescribeddrug.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_prescribeddrug.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_prescribeddrug.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_prescribeddrug.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_prescribeddrug.idx_downsync_t_prescribeddrug
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND INDEX_NAME = 'idx_downsync_t_prescribeddrug') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD INDEX `idx_downsync_t_prescribeddrug` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_prescribeddrug.idx_downsync_t_prescribeddrug: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_lab_testorder.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_lab_testorder.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_lab_testorder.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_lab_testorder.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_lab_testorder.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_lab_testorder.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_lab_testorder.idx_downsync_t_lab_testorder
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND INDEX_NAME = 'idx_downsync_t_lab_testorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_lab_testorder` ADD INDEX `idx_downsync_t_lab_testorder` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_lab_testorder.idx_downsync_t_lab_testorder: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benreferdetails.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benreferdetails.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benreferdetails.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benreferdetails.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benreferdetails.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benreferdetails.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benreferdetails.idx_downsync_t_benreferdetails
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND INDEX_NAME = 'idx_downsync_t_benreferdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benreferdetails` ADD INDEX `idx_downsync_t_benreferdetails` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benreferdetails.idx_downsync_t_benreferdetails: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_lab_testresult.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_lab_testresult.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_lab_testresult.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_lab_testresult.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_lab_testresult.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_lab_testresult.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_lab_testresult.idx_downsync_t_lab_testresult
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND INDEX_NAME = 'idx_downsync_t_lab_testresult') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_lab_testresult` ADD INDEX `idx_downsync_t_lab_testresult` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_lab_testresult.idx_downsync_t_lab_testresult: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_physicalstockentry.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_physicalstockentry.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_physicalstockentry.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_physicalstockentry.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_physicalstockentry.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_physicalstockentry.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_physicalstockentry.idx_downsync_t_physicalstockentry
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND INDEX_NAME = 'idx_downsync_t_physicalstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD INDEX `idx_downsync_t_physicalstockentry` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_physicalstockentry.idx_downsync_t_physicalstockentry: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_patientissue.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_patientissue.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_patientissue.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_patientissue.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_patientissue.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_patientissue.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_patientissue.idx_downsync_t_patientissue
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND INDEX_NAME = 'idx_downsync_t_patientissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_patientissue` ADD INDEX `idx_downsync_t_patientissue` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_patientissue.idx_downsync_t_patientissue: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_facilityconsumption.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_facilityconsumption.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_facilityconsumption.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_facilityconsumption.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_facilityconsumption.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_facilityconsumption.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_facilityconsumption.idx_downsync_t_facilityconsumption
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND INDEX_NAME = 'idx_downsync_t_facilityconsumption') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD INDEX `idx_downsync_t_facilityconsumption` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_facilityconsumption.idx_downsync_t_facilityconsumption: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_itemstockentry.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_itemstockentry.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_itemstockentry.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_itemstockentry.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_itemstockentry.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_itemstockentry.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_itemstockentry.idx_downsync_t_itemstockentry
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND INDEX_NAME = 'idx_downsync_t_itemstockentry') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_itemstockentry` ADD INDEX `idx_downsync_t_itemstockentry` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_itemstockentry.idx_downsync_t_itemstockentry: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_itemstockexit.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_itemstockexit.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_itemstockexit.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_itemstockexit.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_itemstockexit.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_itemstockexit.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_itemstockexit.idx_downsync_t_itemstockexit
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND INDEX_NAME = 'idx_downsync_t_itemstockexit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_itemstockexit` ADD INDEX `idx_downsync_t_itemstockexit` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_itemstockexit.idx_downsync_t_itemstockexit: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmedhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benmedhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmedhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benmedhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmedhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benmedhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benmedhistory.idx_downsync_t_benmedhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND INDEX_NAME = 'idx_downsync_t_benmedhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benmedhistory` ADD INDEX `idx_downsync_t_benmedhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benmedhistory.idx_downsync_t_benmedhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_femaleobstetrichistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_femaleobstetrichistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_femaleobstetrichistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_femaleobstetrichistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_femaleobstetrichistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_femaleobstetrichistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_femaleobstetrichistory.idx_downsync_t_femaleobstetrichistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND INDEX_NAME = 'idx_downsync_t_femaleobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD INDEX `idx_downsync_t_femaleobstetrichistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_femaleobstetrichistory.idx_downsync_t_femaleobstetrichistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmenstrualdetails.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benmenstrualdetails.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmenstrualdetails.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benmenstrualdetails.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmenstrualdetails.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benmenstrualdetails.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benmenstrualdetails.idx_downsync_t_benmenstrualdetails
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND INDEX_NAME = 'idx_downsync_t_benmenstrualdetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD INDEX `idx_downsync_t_benmenstrualdetails` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benmenstrualdetails.idx_downsync_t_benmenstrualdetails: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benpersonalhabit.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benpersonalhabit.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benpersonalhabit.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benpersonalhabit.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benpersonalhabit.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benpersonalhabit.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benpersonalhabit.idx_downsync_t_benpersonalhabit
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND INDEX_NAME = 'idx_downsync_t_benpersonalhabit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD INDEX `idx_downsync_t_benpersonalhabit` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benpersonalhabit.idx_downsync_t_benpersonalhabit: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childvaccinedetail1.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_childvaccinedetail1.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childvaccinedetail1.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_childvaccinedetail1.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childvaccinedetail1.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_childvaccinedetail1.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_childvaccinedetail1.idx_downsync_t_childvaccinedetail1
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND INDEX_NAME = 'idx_downsync_t_childvaccinedetail1') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD INDEX `idx_downsync_t_childvaccinedetail1` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_childvaccinedetail1.idx_downsync_t_childvaccinedetail1: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childvaccinedetail2.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_childvaccinedetail2.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childvaccinedetail2.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_childvaccinedetail2.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childvaccinedetail2.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_childvaccinedetail2.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_childvaccinedetail2.idx_downsync_t_childvaccinedetail2
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND INDEX_NAME = 'idx_downsync_t_childvaccinedetail2') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD INDEX `idx_downsync_t_childvaccinedetail2` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_childvaccinedetail2.idx_downsync_t_childvaccinedetail2: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childoptionalvaccinedetail.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_childoptionalvaccinedetail.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childoptionalvaccinedetail.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_childoptionalvaccinedetail.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childoptionalvaccinedetail.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_childoptionalvaccinedetail.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_childoptionalvaccinedetail.idx_downsync_t_childoptionalvaccinedetail
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND INDEX_NAME = 'idx_downsync_t_childoptionalvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD INDEX `idx_downsync_t_childoptionalvaccinedetail` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_childoptionalvaccinedetail.idx_downsync_t_childoptionalvaccinedetail: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ancwomenvaccinedetail.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_ancwomenvaccinedetail.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ancwomenvaccinedetail.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_ancwomenvaccinedetail.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_ancwomenvaccinedetail.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_ancwomenvaccinedetail.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_ancwomenvaccinedetail.idx_downsync_t_ancwomenvaccinedetail
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND INDEX_NAME = 'idx_downsync_t_ancwomenvaccinedetail') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD INDEX `idx_downsync_t_ancwomenvaccinedetail` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_ancwomenvaccinedetail.idx_downsync_t_ancwomenvaccinedetail: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childfeedinghistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_childfeedinghistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childfeedinghistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_childfeedinghistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_childfeedinghistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_childfeedinghistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_childfeedinghistory.idx_downsync_t_childfeedinghistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND INDEX_NAME = 'idx_downsync_t_childfeedinghistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD INDEX `idx_downsync_t_childfeedinghistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_childfeedinghistory.idx_downsync_t_childfeedinghistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benallergyhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benallergyhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benallergyhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benallergyhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benallergyhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benallergyhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benallergyhistory.idx_downsync_t_benallergyhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND INDEX_NAME = 'idx_downsync_t_benallergyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD INDEX `idx_downsync_t_benallergyhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benallergyhistory.idx_downsync_t_benallergyhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_bencomorbiditycondition.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_bencomorbiditycondition.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_bencomorbiditycondition.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_bencomorbiditycondition.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_bencomorbiditycondition.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_bencomorbiditycondition.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_bencomorbiditycondition.idx_downsync_t_bencomorbiditycondition
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND INDEX_NAME = 'idx_downsync_t_bencomorbiditycondition') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD INDEX `idx_downsync_t_bencomorbiditycondition` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_bencomorbiditycondition.idx_downsync_t_bencomorbiditycondition: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmedicationhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benmedicationhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmedicationhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benmedicationhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benmedicationhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benmedicationhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benmedicationhistory.idx_downsync_t_benmedicationhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND INDEX_NAME = 'idx_downsync_t_benmedicationhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD INDEX `idx_downsync_t_benmedicationhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benmedicationhistory.idx_downsync_t_benmedicationhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benfamilyhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_benfamilyhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benfamilyhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_benfamilyhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_benfamilyhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_benfamilyhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_benfamilyhistory.idx_downsync_t_benfamilyhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND INDEX_NAME = 'idx_downsync_t_benfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD INDEX `idx_downsync_t_benfamilyhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_benfamilyhistory.idx_downsync_t_benfamilyhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_perinatalhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_perinatalhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_perinatalhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_perinatalhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_perinatalhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_perinatalhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_perinatalhistory.idx_downsync_t_perinatalhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND INDEX_NAME = 'idx_downsync_t_perinatalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD INDEX `idx_downsync_t_perinatalhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_perinatalhistory.idx_downsync_t_perinatalhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_developmenthistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_developmenthistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_developmenthistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_developmenthistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_developmenthistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_developmenthistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_developmenthistory.idx_downsync_t_developmenthistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND INDEX_NAME = 'idx_downsync_t_developmenthistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_developmenthistory` ADD INDEX `idx_downsync_t_developmenthistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_developmenthistory.idx_downsync_t_developmenthistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerfamilyhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerfamilyhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerfamilyhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerfamilyhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerfamilyhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerfamilyhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerfamilyhistory.idx_downsync_t_cancerfamilyhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND INDEX_NAME = 'idx_downsync_t_cancerfamilyhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD INDEX `idx_downsync_t_cancerfamilyhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerfamilyhistory.idx_downsync_t_cancerfamilyhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerpersonalhistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerpersonalhistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerpersonalhistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerpersonalhistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerpersonalhistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerpersonalhistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerpersonalhistory.idx_downsync_t_cancerpersonalhistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND INDEX_NAME = 'idx_downsync_t_cancerpersonalhistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD INDEX `idx_downsync_t_cancerpersonalhistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerpersonalhistory.idx_downsync_t_cancerpersonalhistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerdiethistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerdiethistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerdiethistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerdiethistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerdiethistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerdiethistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerdiethistory.idx_downsync_t_cancerdiethistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND INDEX_NAME = 'idx_downsync_t_cancerdiethistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD INDEX `idx_downsync_t_cancerdiethistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerdiethistory.idx_downsync_t_cancerdiethistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerobstetrichistory.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerobstetrichistory.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerobstetrichistory.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerobstetrichistory.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerobstetrichistory.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerobstetrichistory.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerobstetrichistory.idx_downsync_t_cancerobstetrichistory
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND INDEX_NAME = 'idx_downsync_t_cancerobstetrichistory') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD INDEX `idx_downsync_t_cancerobstetrichistory` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerobstetrichistory.idx_downsync_t_cancerobstetrichistory: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancervitals.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancervitals.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancervitals.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancervitals.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancervitals.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancervitals.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancervitals.idx_downsync_t_cancervitals
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND INDEX_NAME = 'idx_downsync_t_cancervitals') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancervitals` ADD INDEX `idx_downsync_t_cancervitals` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancervitals.idx_downsync_t_cancervitals: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancersignandsymptoms.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancersignandsymptoms.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancersignandsymptoms.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancersignandsymptoms.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancersignandsymptoms.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancersignandsymptoms.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancersignandsymptoms.idx_downsync_t_cancersignandsymptoms
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND INDEX_NAME = 'idx_downsync_t_cancersignandsymptoms') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD INDEX `idx_downsync_t_cancersignandsymptoms` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancersignandsymptoms.idx_downsync_t_cancersignandsymptoms: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerlymphnode.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerlymphnode.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerlymphnode.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerlymphnode.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerlymphnode.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerlymphnode.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerlymphnode.idx_downsync_t_cancerlymphnode
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND INDEX_NAME = 'idx_downsync_t_cancerlymphnode') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD INDEX `idx_downsync_t_cancerlymphnode` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerlymphnode.idx_downsync_t_cancerlymphnode: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_canceroralexamination.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_canceroralexamination.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_canceroralexamination.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_canceroralexamination.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_canceroralexamination.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_canceroralexamination.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_canceroralexamination.idx_downsync_t_canceroralexamination
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND INDEX_NAME = 'idx_downsync_t_canceroralexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD INDEX `idx_downsync_t_canceroralexamination` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_canceroralexamination.idx_downsync_t_canceroralexamination: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerbreastexamination.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerbreastexamination.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerbreastexamination.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerbreastexamination.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerbreastexamination.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerbreastexamination.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerbreastexamination.idx_downsync_t_cancerbreastexamination
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND INDEX_NAME = 'idx_downsync_t_cancerbreastexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD INDEX `idx_downsync_t_cancerbreastexamination` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerbreastexamination.idx_downsync_t_cancerbreastexamination: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerabdominalexamination.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerabdominalexamination.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerabdominalexamination.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerabdominalexamination.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerabdominalexamination.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerabdominalexamination.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerabdominalexamination.idx_downsync_t_cancerabdominalexamination
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND INDEX_NAME = 'idx_downsync_t_cancerabdominalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD INDEX `idx_downsync_t_cancerabdominalexamination` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerabdominalexamination.idx_downsync_t_cancerabdominalexamination: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancergynecologicalexamination.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancergynecologicalexamination.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancergynecologicalexamination.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancergynecologicalexamination.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancergynecologicalexamination.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancergynecologicalexamination.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancergynecologicalexamination.idx_downsync_t_cancergynecologicalexamination
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND INDEX_NAME = 'idx_downsync_t_cancergynecologicalexamination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD INDEX `idx_downsync_t_cancergynecologicalexamination` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancergynecologicalexamination.idx_downsync_t_cancergynecologicalexamination: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerdiagnosis.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerdiagnosis.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerdiagnosis.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerdiagnosis.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerdiagnosis.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerdiagnosis.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerdiagnosis.idx_downsync_t_cancerdiagnosis
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND INDEX_NAME = 'idx_downsync_t_cancerdiagnosis') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD INDEX `idx_downsync_t_cancerdiagnosis` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerdiagnosis.idx_downsync_t_cancerdiagnosis: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerimageannotation.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_cancerimageannotation.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerimageannotation.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_cancerimageannotation.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_cancerimageannotation.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_cancerimageannotation.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_cancerimageannotation.idx_downsync_t_cancerimageannotation
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND INDEX_NAME = 'idx_downsync_t_cancerimageannotation') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD INDEX `idx_downsync_t_cancerimageannotation` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_cancerimageannotation.idx_downsync_t_cancerimageannotation: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_stockadjustment.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_stockadjustment.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_stockadjustment.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_stockadjustment.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_stockadjustment.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_stockadjustment.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_stockadjustment.idx_downsync_t_stockadjustment
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND INDEX_NAME = 'idx_downsync_t_stockadjustment') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_stockadjustment` ADD INDEX `idx_downsync_t_stockadjustment` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_stockadjustment.idx_downsync_t_stockadjustment: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_stocktransfer.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_stocktransfer.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_stocktransfer.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_stocktransfer.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_stocktransfer.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_stocktransfer.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_stocktransfer.idx_downsync_t_stocktransfer
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND INDEX_NAME = 'idx_downsync_t_stocktransfer') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_stocktransfer` ADD INDEX `idx_downsync_t_stocktransfer` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_stocktransfer.idx_downsync_t_stocktransfer: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_patientreturn.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_patientreturn.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_patientreturn.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_patientreturn.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_patientreturn.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_patientreturn.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_patientreturn.idx_downsync_t_patientreturn
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND INDEX_NAME = 'idx_downsync_t_patientreturn') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_patientreturn` ADD INDEX `idx_downsync_t_patientreturn` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_patientreturn.idx_downsync_t_patientreturn: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indent.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_indent.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indent.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_indent.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indent.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_indent.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_indent.idx_downsync_t_indent
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND INDEX_NAME = 'idx_downsync_t_indent') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_indent` ADD INDEX `idx_downsync_t_indent` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_indent.idx_downsync_t_indent: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indentissue.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_indentissue.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indentissue.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_indentissue.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indentissue.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_indentissue.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_indentissue.idx_downsync_t_indentissue
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND INDEX_NAME = 'idx_downsync_t_indentissue') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_indentissue` ADD INDEX `idx_downsync_t_indentissue` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_indentissue.idx_downsync_t_indentissue: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indentorder.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_indentorder.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indentorder.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_indentorder.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_indentorder.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_indentorder.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_indentorder.idx_downsync_t_indentorder
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND INDEX_NAME = 'idx_downsync_t_indentorder') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_indentorder` ADD INDEX `idx_downsync_t_indentorder` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_indentorder.idx_downsync_t_indentorder: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_saitemmapping.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_saitemmapping.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_saitemmapping.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_saitemmapping.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_saitemmapping.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_saitemmapping.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_saitemmapping.idx_downsync_t_saitemmapping
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND INDEX_NAME = 'idx_downsync_t_saitemmapping') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_saitemmapping` ADD INDEX `idx_downsync_t_saitemmapping` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_saitemmapping.idx_downsync_t_saitemmapping: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_general_opd.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_stoptb_general_opd.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_general_opd.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_stoptb_general_opd.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_general_opd.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_stoptb_general_opd.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_stoptb_general_opd.idx_downsync_tb_stoptb_general_opd
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND INDEX_NAME = 'idx_downsync_tb_stoptb_general_opd') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD INDEX `idx_downsync_tb_stoptb_general_opd` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_stoptb_general_opd.idx_downsync_tb_stoptb_general_opd: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_general_examination.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_stoptb_general_examination.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_general_examination.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_stoptb_general_examination.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_general_examination.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_stoptb_general_examination.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_stoptb_general_examination.idx_downsync_tb_stoptb_general_examination
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND INDEX_NAME = 'idx_downsync_tb_stoptb_general_examination') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD INDEX `idx_downsync_tb_stoptb_general_examination` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_stoptb_general_examination.idx_downsync_tb_stoptb_general_examination: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_screening.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_screening.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_screening.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_screening.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_screening.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_screening.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_screening.vanID
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'vanID') = 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `vanID` INT          NULL COMMENT ''the van this record belongs to - the down-sync filters on it''',
    'SELECT ''Skipped db_iemr.tb_screening.vanID: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_screening.vanSerialNo
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'vanSerialNo') = 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `vanSerialNo` BIGINT       NULL COMMENT ''this row primary key on the van it came from''',
    'SELECT ''Skipped db_iemr.tb_screening.vanSerialNo: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_screening.last_mod_date
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'last_mod_date') = 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync''',
    'SELECT ''Skipped db_iemr.tb_screening.last_mod_date: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_screening.idx_downsync_tb_screening
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND INDEX_NAME = 'idx_downsync_tb_screening') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_screening` ADD INDEX `idx_downsync_tb_screening` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_screening.idx_downsync_tb_screening: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_diagnostics.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_stoptb_diagnostics.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_diagnostics.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_stoptb_diagnostics.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_diagnostics.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_stoptb_diagnostics.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_stoptb_diagnostics.idx_downsync_tb_stoptb_diagnostics
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND INDEX_NAME = 'idx_downsync_tb_stoptb_diagnostics') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD INDEX `idx_downsync_tb_stoptb_diagnostics` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_stoptb_diagnostics.idx_downsync_tb_stoptb_diagnostics: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_suspected.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_suspected.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_suspected.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_suspected.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_suspected.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_suspected.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_suspected.vanID
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'vanID') = 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `vanID` INT          NULL COMMENT ''the van this record belongs to - the down-sync filters on it''',
    'SELECT ''Skipped db_iemr.tb_suspected.vanID: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_suspected.vanSerialNo
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'vanSerialNo') = 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `vanSerialNo` BIGINT       NULL COMMENT ''this row primary key on the van it came from''',
    'SELECT ''Skipped db_iemr.tb_suspected.vanSerialNo: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_suspected.last_mod_date
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'last_mod_date') = 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync''',
    'SELECT ''Skipped db_iemr.tb_suspected.last_mod_date: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_suspected.idx_downsync_tb_suspected
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND INDEX_NAME = 'idx_downsync_tb_suspected') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_suspected` ADD INDEX `idx_downsync_tb_suspected` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_suspected.idx_downsync_tb_suspected: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_confirmed_cases.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_confirmed_cases.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_confirmed_cases.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_confirmed_cases.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_confirmed_cases.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_confirmed_cases.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_confirmed_cases.vanID
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'vanID') = 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `vanID` INT          NULL COMMENT ''the van this record belongs to - the down-sync filters on it''',
    'SELECT ''Skipped db_iemr.tb_confirmed_cases.vanID: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_confirmed_cases.vanSerialNo
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'vanSerialNo') = 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `vanSerialNo` BIGINT       NULL COMMENT ''this row primary key on the van it came from''',
    'SELECT ''Skipped db_iemr.tb_confirmed_cases.vanSerialNo: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_confirmed_cases.last_mod_date
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'last_mod_date') = 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync''',
    'SELECT ''Skipped db_iemr.tb_confirmed_cases.last_mod_date: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_confirmed_cases.idx_downsync_tb_confirmed_cases
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND INDEX_NAME = 'idx_downsync_tb_confirmed_cases') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD INDEX `idx_downsync_tb_confirmed_cases` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_confirmed_cases.idx_downsync_tb_confirmed_cases: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_order.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_order.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_order.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_order.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_order.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_order.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_diagnostic_order.idx_downsync_tb_diagnostic_order
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND INDEX_NAME = 'idx_downsync_tb_diagnostic_order') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD INDEX `idx_downsync_tb_diagnostic_order` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_diagnostic_order.idx_downsync_tb_diagnostic_order: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_result.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_result.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_result.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_result.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_result.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_result.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_diagnostic_result.idx_downsync_tb_diagnostic_result
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND INDEX_NAME = 'idx_downsync_tb_diagnostic_result') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD INDEX `idx_downsync_tb_diagnostic_result` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_diagnostic_result.idx_downsync_tb_diagnostic_result: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_document.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_document.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_document.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_document.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_diagnostic_document.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_diagnostic_document.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_diagnostic_document.idx_downsync_tb_diagnostic_document
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND INDEX_NAME = 'idx_downsync_tb_diagnostic_document') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD INDEX `idx_downsync_tb_diagnostic_document` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_diagnostic_document.idx_downsync_tb_diagnostic_document: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_identity.i_beneficiarydetails_rmnch.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_identity.i_beneficiarydetails_rmnch.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_identity.i_beneficiarydetails_rmnch.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_identity.i_beneficiarydetails_rmnch.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_identity.i_beneficiarydetails_rmnch.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_identity.i_beneficiarydetails_rmnch.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_identity.i_beneficiarydetails_rmnch.idx_downsync_i_beneficiarydetails_rmnch
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND INDEX_NAME = 'idx_downsync_i_beneficiarydetails_rmnch') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD INDEX `idx_downsync_i_beneficiarydetails_rmnch` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_identity.i_beneficiarydetails_rmnch.idx_downsync_i_beneficiarydetails_rmnch: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_identity.i_householddetails.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_identity.i_householddetails.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_identity.i_householddetails.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_identity.i_householddetails.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_identity.i_householddetails.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_identity.i_householddetails.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_identity.i_householddetails.idx_downsync_i_householddetails
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND INDEX_NAME = 'idx_downsync_i_householddetails') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'VanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_identity`.`i_householddetails` ADD INDEX `idx_downsync_i_householddetails` (`VanID`, `DownSynced`)',
    'SELECT ''Skipped index db_identity.i_householddetails.idx_downsync_i_householddetails: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_visit.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.tb_stoptb_visit.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_visit.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.tb_stoptb_visit.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_visit.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.tb_stoptb_visit.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.tb_stoptb_visit.last_mod_date
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'last_mod_date') = 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync''',
    'SELECT ''Skipped db_iemr.tb_stoptb_visit.last_mod_date: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.tb_stoptb_visit.idx_downsync_tb_stoptb_visit
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND INDEX_NAME = 'idx_downsync_tb_stoptb_visit') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD INDEX `idx_downsync_tb_stoptb_visit` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.tb_stoptb_visit.idx_downsync_tb_stoptb_visit: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_form_response.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_form_response.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_form_response.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_form_response.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_form_response.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_form_response.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_form_response.LastModDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'LastModDate') = 0,
    'ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `LastModDate` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept''',
    'SELECT ''Skipped db_iemr.t_form_response.LastModDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_form_response.idx_downsync_t_form_response
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND INDEX_NAME = 'idx_downsync_t_form_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_form_response` ADD INDEX `idx_downsync_t_form_response` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_form_response.idx_downsync_t_form_response: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_section_response.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_section_response.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_section_response.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_section_response.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_section_response.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_section_response.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_section_response.LastModDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'LastModDate') = 0,
    'ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `LastModDate` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept''',
    'SELECT ''Skipped db_iemr.t_section_response.LastModDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_section_response.idx_downsync_t_section_response
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND INDEX_NAME = 'idx_downsync_t_section_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_section_response` ADD INDEX `idx_downsync_t_section_response` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_section_response.idx_downsync_t_section_response: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_question_response.DownSynced
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSynced') = 0,
    'ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT ''N'' COMMENT ''N never sent / P delivered / U update pending / F conflict''',
    'SELECT ''Skipped db_iemr.t_question_response.DownSynced: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_question_response.DownSyncDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSyncDate') = 0,
    'ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `DownSyncDate` DATETIME     NULL COMMENT ''when last delivered to a van''',
    'SELECT ''Skipped db_iemr.t_question_response.DownSyncDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_question_response.DownSyncFailureReason
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSyncFailureReason') = 0,
    'ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL COMMENT ''CONFLICT, or the failure detail''',
    'SELECT ''Skipped db_iemr.t_question_response.DownSyncFailureReason: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded column: db_iemr.t_question_response.LastModDate
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'LastModDate') = 0,
    'ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `LastModDate` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept''',
    'SELECT ''Skipped db_iemr.t_question_response.LastModDate: table missing or column already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded index: db_iemr.t_question_response.idx_downsync_t_question_response
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response') > 0 AND NOT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND INDEX_NAME = 'idx_downsync_t_question_response') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'vanID') > 0 AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSynced') > 0,
    'ALTER TABLE `db_iemr`.`t_question_response` ADD INDEX `idx_downsync_t_question_response` (`vanID`, `DownSynced`)',
    'SELECT ''Skipped index db_iemr.t_question_response.idx_downsync_t_question_response: table/required column missing or index already exists'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Guarded data backfills
-- Backfill t_form_response.LastModDate from updatedAt/createdAt
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response' AND COLUMN_NAME='LastModDate') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response' AND COLUMN_NAME='updatedAt') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response' AND COLUMN_NAME='createdAt') > 0,
    'UPDATE `db_iemr`.`t_form_response` SET `LastModDate` = COALESCE(`updatedAt`, `createdAt`) WHERE `LastModDate` IS NULL',
    'SELECT ''Skipped t_form_response backfill: required table/columns missing'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Backfill t_section_response.LastModDate from savedAt
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_section_response') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_section_response' AND COLUMN_NAME='LastModDate') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_section_response' AND COLUMN_NAME='savedAt') > 0,
    'UPDATE `db_iemr`.`t_section_response` SET `LastModDate` = `savedAt` WHERE `LastModDate` IS NULL AND `savedAt` IS NOT NULL',
    'SELECT ''Skipped t_section_response backfill: required table/columns missing'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Backfill t_question_response.LastModDate from t_section_response
SET @sql = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_question_response') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_section_response') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_question_response' AND COLUMN_NAME='LastModDate') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_question_response' AND COLUMN_NAME='sectionResponseId') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_section_response' AND COLUMN_NAME='sectionResponseId') > 0
         AND (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_section_response' AND COLUMN_NAME='LastModDate') > 0,
    'UPDATE `db_iemr`.`t_question_response` AS q JOIN `db_iemr`.`t_section_response` AS s ON s.`sectionResponseId` = q.`sectionResponseId` SET q.`LastModDate` = s.`LastModDate` WHERE q.`LastModDate` IS NULL AND s.`LastModDate` IS NOT NULL',
    'SELECT ''Skipped t_question_response backfill: required table/columns missing'' AS Message'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET SQL_SAFE_UPDATES = @OLD_SQL_SAFE_UPDATES;