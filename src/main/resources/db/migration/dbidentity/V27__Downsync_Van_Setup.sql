-- =============================================================================
-- Down-sync : VAN setup
-- RUN ON EACH LAPTOP / VAN DB
--
-- Adds missing columns and indexes only.
-- Skips existing columns/indexes and missing tables.
--
-- Van-specific columns:
--   LastDownSyncDate - when this row was last received from central
--   CentralID        - primary key of this row in the central DB
--
-- Index:
--   (CentralID, VanID)
-- =============================================================================


-- ============================================================
-- 1) i_beneficiarydetails
-- ============================================================

SET @tbl := 'i_beneficiarydetails';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiarydetails.DownSynced already exists or table not found'' AS message');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiarydetails.DownSyncDate already exists or table not found'' AS message');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiarydetails.DownSyncFailureReason already exists or table not found'' AS message');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiarydetails.LastDownSyncDate already exists or table not found'' AS message');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiarydetails.CentralID already exists or table not found'' AS message');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiarydetails'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD INDEX idx_downsync_centralid_i_beneficiarydetails (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiarydetails already exists or table not found'' AS message');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- ============================================================
-- 2) i_beneficiaryaddress
-- ============================================================

SET @tbl := 'i_beneficiaryaddress';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiaryaddress.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiaryaddress.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiaryaddress.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiaryaddress.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiaryaddress.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiaryaddress'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD INDEX idx_downsync_centralid_i_beneficiaryaddress (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiaryaddress already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 3) i_beneficiarycontacts
-- ============================================================

SET @tbl := 'i_beneficiarycontacts';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiarycontacts.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiarycontacts.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiarycontacts.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiarycontacts.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiarycontacts.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiarycontacts'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD INDEX idx_downsync_centralid_i_beneficiarycontacts (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiarycontacts already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 4) i_beneficiaryaccount
-- ============================================================

SET @tbl := 'i_beneficiaryaccount';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiaryaccount.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiaryaccount.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiaryaccount.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiaryaccount.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiaryaccount.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiaryaccount'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD INDEX idx_downsync_centralid_i_beneficiaryaccount (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiaryaccount already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 5) i_beneficiaryconsent
-- ============================================================

SET @tbl := 'i_beneficiaryconsent';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiaryconsent.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiaryconsent.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiaryconsent.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiaryconsent.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiaryconsent.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiaryconsent'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD INDEX idx_downsync_centralid_i_beneficiaryconsent (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiaryconsent already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 6) i_beneficiaryimage
-- ============================================================

SET @tbl := 'i_beneficiaryimage';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiaryimage.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiaryimage.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiaryimage.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiaryimage.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiaryimage.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiaryimage'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD INDEX idx_downsync_centralid_i_beneficiaryimage (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiaryimage already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 7) i_beneficiarymapping
-- ============================================================

SET @tbl := 'i_beneficiarymapping';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiarymapping.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiarymapping.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiarymapping.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiarymapping.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiarymapping.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiarymapping'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD INDEX idx_downsync_centralid_i_beneficiarymapping (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiarymapping already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 8) i_beneficiaryfamilymapping
-- ============================================================

SET @tbl := 'i_beneficiaryfamilymapping';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiaryfamilymapping.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiaryfamilymapping.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiaryfamilymapping.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiaryfamilymapping.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiaryfamilymapping.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiaryfamilymapping'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping ADD INDEX idx_downsync_centralid_i_beneficiaryfamilymapping (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiaryfamilymapping already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 9) i_beneficiaryidentity
-- ============================================================

SET @tbl := 'i_beneficiaryidentity';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryidentity ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: i_beneficiaryidentity.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryidentity ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: i_beneficiaryidentity.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryidentity ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: i_beneficiaryidentity.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryidentity ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: i_beneficiaryidentity.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE i_beneficiaryidentity ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: i_beneficiaryidentity.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiaryidentity'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE i_beneficiaryidentity ADD INDEX idx_downsync_centralid_i_beneficiaryidentity (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_i_beneficiaryidentity already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- 10) m_beneficiaryregidmapping
-- ============================================================

SET @tbl := 'm_beneficiaryregidmapping';

SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
);

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSynced'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD COLUMN DownSynced CHAR(1) NOT NULL DEFAULT ''N''',
    'SELECT ''SKIPPED: m_beneficiaryregidmapping.DownSynced already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD COLUMN DownSyncDate DATETIME NULL',
    'SELECT ''SKIPPED: m_beneficiaryregidmapping.DownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'DownSyncFailureReason'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL',
    'SELECT ''SKIPPED: m_beneficiaryregidmapping.DownSyncFailureReason already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'LastDownSyncDate'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD COLUMN LastDownSyncDate DATETIME NULL COMMENT ''when this row was last received from central''',
    'SELECT ''SKIPPED: m_beneficiaryregidmapping.LastDownSyncDate already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl AND COLUMN_NAME = 'CentralID'
);

SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD COLUMN CentralID BIGINT NULL COMMENT ''primary key of this row in the central DB''',
    'SELECT ''SKIPPED: m_beneficiaryregidmapping.CentralID already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tbl
      AND INDEX_NAME = 'idx_downsync_centralid_m_beneficiaryregidmapping'
);

SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD INDEX idx_downsync_centralid_m_beneficiaryregidmapping (CentralID, VanID)',
    'SELECT ''SKIPPED: idx_downsync_centralid_m_beneficiaryregidmapping already exists or table not found'' AS message');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ============================================================
-- Cleanup
-- ============================================================

SET @tbl := NULL,
    @tbl_exists := NULL,
    @col_exists := NULL,
    @idx_exists := NULL,
    @sql := NULL;

-- =============================================================================
-- END OF VAN DOWN-SYNC SETUP
-- =============================================================================