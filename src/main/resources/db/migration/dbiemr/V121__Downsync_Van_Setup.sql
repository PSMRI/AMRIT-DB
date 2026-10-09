USE db_iemr;

SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;

-- =============================================================================
-- Down-sync: VAN setup (guarded / rerunnable)
-- For every table, existing columns and indexes are skipped; missing ones are added.
-- Each operation checks INFORMATION_SCHEMA and skips if the target table is absent.
-- =============================================================================

-- db_iemr.t_benvisitdetail.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benvisitdetail.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benvisitdetail.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benvisitdetail.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benvisitdetail.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benvisitdetail.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benvisitdetail.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benvisitdetail.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benvisitdetail.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benvisitdetail.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benvisitdetail.idx_downsync_centralid_t_benvisitdetail
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benvisitdetail' AND INDEX_NAME = 'idx_downsync_centralid_t_benvisitdetail');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benvisitdetail` ADD INDEX `idx_downsync_centralid_t_benvisitdetail` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benvisitdetail.idx_downsync_centralid_t_benvisitdetail table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_anthropometry.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_phy_anthropometry.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_anthropometry.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_anthropometry.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_anthropometry.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_anthropometry.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_anthropometry.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_phy_anthropometry.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_anthropometry.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_phy_anthropometry.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_phy_anthropometry.idx_downsync_centralid_t_phy_anthropometry
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_anthropometry' AND INDEX_NAME = 'idx_downsync_centralid_t_phy_anthropometry');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_anthropometry` ADD INDEX `idx_downsync_centralid_t_phy_anthropometry` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_phy_anthropometry.idx_downsync_centralid_t_phy_anthropometry table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_vitals.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_phy_vitals.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_vitals.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_vitals.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_vitals.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_vitals.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_vitals.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_phy_vitals.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_vitals.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_vitals` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_phy_vitals.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_phy_vitals.idx_downsync_centralid_t_phy_vitals
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_vitals' AND INDEX_NAME = 'idx_downsync_centralid_t_phy_vitals');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_vitals` ADD INDEX `idx_downsync_centralid_t_phy_vitals` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_phy_vitals.idx_downsync_centralid_t_phy_vitals table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benadherence.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benadherence.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benadherence.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benadherence.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benadherence.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benadherence.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benadherence.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benadherence.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benadherence.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benadherence` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benadherence.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benadherence.idx_downsync_centralid_t_benadherence
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benadherence' AND INDEX_NAME = 'idx_downsync_centralid_t_benadherence');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benadherence` ADD INDEX `idx_downsync_centralid_t_benadherence` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benadherence.idx_downsync_centralid_t_benadherence table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_anccare.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_anccare.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_anccare.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_anccare.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_anccare.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_anccare.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_anccare.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_anccare.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_anccare.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_anccare` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_anccare.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_anccare.idx_downsync_centralid_t_anccare
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_anccare' AND INDEX_NAME = 'idx_downsync_centralid_t_anccare');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_anccare` ADD INDEX `idx_downsync_centralid_t_anccare` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_anccare.idx_downsync_centralid_t_anccare table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_pnccare.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_pnccare.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pnccare.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_pnccare.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pnccare.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_pnccare.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pnccare.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_pnccare.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pnccare.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pnccare` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_pnccare.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_pnccare.idx_downsync_centralid_t_pnccare
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pnccare' AND INDEX_NAME = 'idx_downsync_centralid_t_pnccare');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_pnccare` ADD INDEX `idx_downsync_centralid_t_pnccare` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_pnccare.idx_downsync_centralid_t_pnccare table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdscreening.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_ncdscreening.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdscreening.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_ncdscreening.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdscreening.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_ncdscreening.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdscreening.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_ncdscreening.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdscreening.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdscreening` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_ncdscreening.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_ncdscreening.idx_downsync_centralid_t_ncdscreening
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdscreening' AND INDEX_NAME = 'idx_downsync_centralid_t_ncdscreening');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdscreening` ADD INDEX `idx_downsync_centralid_t_ncdscreening` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_ncdscreening.idx_downsync_centralid_t_ncdscreening table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdcare.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_ncdcare.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdcare.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_ncdcare.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdcare.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_ncdcare.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdcare.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_ncdcare.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncdcare.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdcare` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_ncdcare.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_ncdcare.idx_downsync_centralid_t_ncdcare
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncdcare' AND INDEX_NAME = 'idx_downsync_centralid_t_ncdcare');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncdcare` ADD INDEX `idx_downsync_centralid_t_ncdcare` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_ncdcare.idx_downsync_centralid_t_ncdcare table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_generalexam.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_phy_generalexam.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_generalexam.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_generalexam.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_generalexam.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_generalexam.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_generalexam.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_phy_generalexam.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_generalexam.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_phy_generalexam.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_phy_generalexam.idx_downsync_centralid_t_phy_generalexam
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_generalexam' AND INDEX_NAME = 'idx_downsync_centralid_t_phy_generalexam');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_generalexam` ADD INDEX `idx_downsync_centralid_t_phy_generalexam` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_phy_generalexam.idx_downsync_centralid_t_phy_generalexam table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_headtotoe.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_phy_headtotoe.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_headtotoe.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_headtotoe.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_headtotoe.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_phy_headtotoe.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_headtotoe.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_phy_headtotoe.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_phy_headtotoe.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_phy_headtotoe.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_phy_headtotoe.idx_downsync_centralid_t_phy_headtotoe
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_phy_headtotoe' AND INDEX_NAME = 'idx_downsync_centralid_t_phy_headtotoe');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_phy_headtotoe` ADD INDEX `idx_downsync_centralid_t_phy_headtotoe` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_phy_headtotoe.idx_downsync_centralid_t_phy_headtotoe table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_obstetric.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_obstetric.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_obstetric.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_obstetric.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_obstetric.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_obstetric.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_obstetric.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_obstetric.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_obstetric.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_obstetric.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_obstetric.idx_downsync_centralid_t_sys_obstetric
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_obstetric' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_obstetric');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_obstetric` ADD INDEX `idx_downsync_centralid_t_sys_obstetric` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_obstetric.idx_downsync_centralid_t_sys_obstetric table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_gastrointestinal.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_gastrointestinal.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_gastrointestinal.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_gastrointestinal.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_gastrointestinal.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_gastrointestinal.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_gastrointestinal.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_gastrointestinal.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_gastrointestinal.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_gastrointestinal.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_gastrointestinal.idx_downsync_centralid_t_sys_gastrointestinal
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_gastrointestinal' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_gastrointestinal');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_gastrointestinal` ADD INDEX `idx_downsync_centralid_t_sys_gastrointestinal` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_gastrointestinal.idx_downsync_centralid_t_sys_gastrointestinal table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_cardiovascular.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_cardiovascular.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_cardiovascular.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_cardiovascular.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_cardiovascular.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_cardiovascular.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_cardiovascular.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_cardiovascular.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_cardiovascular.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_cardiovascular.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_cardiovascular.idx_downsync_centralid_t_sys_cardiovascular
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_cardiovascular' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_cardiovascular');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_cardiovascular` ADD INDEX `idx_downsync_centralid_t_sys_cardiovascular` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_cardiovascular.idx_downsync_centralid_t_sys_cardiovascular table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_respiratory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_respiratory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_respiratory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_respiratory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_respiratory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_respiratory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_respiratory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_respiratory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_respiratory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_respiratory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_respiratory.idx_downsync_centralid_t_sys_respiratory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_respiratory' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_respiratory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_respiratory` ADD INDEX `idx_downsync_centralid_t_sys_respiratory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_respiratory.idx_downsync_centralid_t_sys_respiratory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_centralnervous.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_centralnervous.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_centralnervous.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_centralnervous.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_centralnervous.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_centralnervous.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_centralnervous.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_centralnervous.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_centralnervous.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_centralnervous.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_centralnervous.idx_downsync_centralid_t_sys_centralnervous
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_centralnervous' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_centralnervous');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_centralnervous` ADD INDEX `idx_downsync_centralid_t_sys_centralnervous` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_centralnervous.idx_downsync_centralid_t_sys_centralnervous table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_musculoskeletalsystem.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_musculoskeletalsystem.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_musculoskeletalsystem.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_musculoskeletalsystem.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_musculoskeletalsystem.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_musculoskeletalsystem.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_musculoskeletalsystem.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_musculoskeletalsystem.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_musculoskeletalsystem.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_musculoskeletalsystem.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_musculoskeletalsystem.idx_downsync_centralid_t_sys_musculoskeletalsystem
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_musculoskeletalsystem' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_musculoskeletalsystem');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_musculoskeletalsystem` ADD INDEX `idx_downsync_centralid_t_sys_musculoskeletalsystem` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_musculoskeletalsystem.idx_downsync_centralid_t_sys_musculoskeletalsystem table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_genitourinarysystem.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_sys_genitourinarysystem.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_genitourinarysystem.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_genitourinarysystem.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_genitourinarysystem.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_sys_genitourinarysystem.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_genitourinarysystem.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_sys_genitourinarysystem.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_sys_genitourinarysystem.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_sys_genitourinarysystem.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_sys_genitourinarysystem.idx_downsync_centralid_t_sys_genitourinarysystem
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_sys_genitourinarysystem' AND INDEX_NAME = 'idx_downsync_centralid_t_sys_genitourinarysystem');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_sys_genitourinarysystem` ADD INDEX `idx_downsync_centralid_t_sys_genitourinarysystem` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_sys_genitourinarysystem.idx_downsync_centralid_t_sys_genitourinarysystem table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_ancdiagnosis.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_ancdiagnosis.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancdiagnosis.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_ancdiagnosis.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancdiagnosis.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_ancdiagnosis.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancdiagnosis.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_ancdiagnosis.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancdiagnosis.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_ancdiagnosis.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_ancdiagnosis.idx_downsync_centralid_t_ancdiagnosis
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancdiagnosis' AND INDEX_NAME = 'idx_downsync_centralid_t_ancdiagnosis');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancdiagnosis` ADD INDEX `idx_downsync_centralid_t_ancdiagnosis` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_ancdiagnosis.idx_downsync_centralid_t_ancdiagnosis table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_ncddiagnosis.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_ncddiagnosis.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncddiagnosis.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_ncddiagnosis.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncddiagnosis.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_ncddiagnosis.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncddiagnosis.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_ncddiagnosis.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ncddiagnosis.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_ncddiagnosis.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_ncddiagnosis.idx_downsync_centralid_t_ncddiagnosis
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ncddiagnosis' AND INDEX_NAME = 'idx_downsync_centralid_t_ncddiagnosis');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_ncddiagnosis` ADD INDEX `idx_downsync_centralid_t_ncddiagnosis` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_ncddiagnosis.idx_downsync_centralid_t_ncddiagnosis table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_pncdiagnosis.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_pncdiagnosis.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pncdiagnosis.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_pncdiagnosis.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pncdiagnosis.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_pncdiagnosis.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pncdiagnosis.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_pncdiagnosis.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_pncdiagnosis.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_pncdiagnosis.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_pncdiagnosis.idx_downsync_centralid_t_pncdiagnosis
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_pncdiagnosis' AND INDEX_NAME = 'idx_downsync_centralid_t_pncdiagnosis');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_pncdiagnosis` ADD INDEX `idx_downsync_centralid_t_pncdiagnosis` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_pncdiagnosis.idx_downsync_centralid_t_pncdiagnosis table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benchiefcomplaint.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benchiefcomplaint.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benchiefcomplaint.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benchiefcomplaint.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benchiefcomplaint.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benchiefcomplaint.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benchiefcomplaint.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benchiefcomplaint.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benchiefcomplaint.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benchiefcomplaint.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benchiefcomplaint.idx_downsync_centralid_t_benchiefcomplaint
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benchiefcomplaint' AND INDEX_NAME = 'idx_downsync_centralid_t_benchiefcomplaint');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benchiefcomplaint` ADD INDEX `idx_downsync_centralid_t_benchiefcomplaint` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benchiefcomplaint.idx_downsync_centralid_t_benchiefcomplaint table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benclinicalobservation.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benclinicalobservation.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benclinicalobservation.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benclinicalobservation.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benclinicalobservation.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benclinicalobservation.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benclinicalobservation.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benclinicalobservation.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benclinicalobservation.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benclinicalobservation.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benclinicalobservation.idx_downsync_centralid_t_benclinicalobservation
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benclinicalobservation' AND INDEX_NAME = 'idx_downsync_centralid_t_benclinicalobservation');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benclinicalobservation` ADD INDEX `idx_downsync_centralid_t_benclinicalobservation` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benclinicalobservation.idx_downsync_centralid_t_benclinicalobservation table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_prescription.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_prescription.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescription.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_prescription.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescription.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_prescription.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescription.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_prescription.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescription.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescription` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_prescription.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_prescription.idx_downsync_centralid_t_prescription
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescription' AND INDEX_NAME = 'idx_downsync_centralid_t_prescription');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescription` ADD INDEX `idx_downsync_centralid_t_prescription` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_prescription.idx_downsync_centralid_t_prescription table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_prescribeddrug.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_prescribeddrug.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescribeddrug.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_prescribeddrug.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescribeddrug.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_prescribeddrug.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescribeddrug.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_prescribeddrug.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_prescribeddrug.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_prescribeddrug.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_prescribeddrug.idx_downsync_centralid_t_prescribeddrug
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_prescribeddrug' AND INDEX_NAME = 'idx_downsync_centralid_t_prescribeddrug');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_prescribeddrug` ADD INDEX `idx_downsync_centralid_t_prescribeddrug` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_prescribeddrug.idx_downsync_centralid_t_prescribeddrug table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testorder.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_lab_testorder.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testorder.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_lab_testorder.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testorder.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_lab_testorder.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testorder.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_lab_testorder.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testorder.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testorder` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_lab_testorder.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_lab_testorder.idx_downsync_centralid_t_lab_testorder
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testorder' AND INDEX_NAME = 'idx_downsync_centralid_t_lab_testorder');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testorder` ADD INDEX `idx_downsync_centralid_t_lab_testorder` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_lab_testorder.idx_downsync_centralid_t_lab_testorder table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benreferdetails.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benreferdetails.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benreferdetails.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benreferdetails.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benreferdetails.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benreferdetails.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benreferdetails.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benreferdetails.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benreferdetails.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benreferdetails` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benreferdetails.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benreferdetails.idx_downsync_centralid_t_benreferdetails
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benreferdetails' AND INDEX_NAME = 'idx_downsync_centralid_t_benreferdetails');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benreferdetails` ADD INDEX `idx_downsync_centralid_t_benreferdetails` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benreferdetails.idx_downsync_centralid_t_benreferdetails table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testresult.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_lab_testresult.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testresult.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_lab_testresult.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testresult.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_lab_testresult.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testresult.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_lab_testresult.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_lab_testresult.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testresult` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_lab_testresult.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_lab_testresult.idx_downsync_centralid_t_lab_testresult
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_lab_testresult' AND INDEX_NAME = 'idx_downsync_centralid_t_lab_testresult');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_lab_testresult` ADD INDEX `idx_downsync_centralid_t_lab_testresult` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_lab_testresult.idx_downsync_centralid_t_lab_testresult table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_physicalstockentry.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_physicalstockentry.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_physicalstockentry.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_physicalstockentry.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_physicalstockentry.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_physicalstockentry.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_physicalstockentry.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_physicalstockentry.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_physicalstockentry.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_physicalstockentry.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_physicalstockentry.idx_downsync_centralid_t_physicalstockentry
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_physicalstockentry' AND INDEX_NAME = 'idx_downsync_centralid_t_physicalstockentry');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_physicalstockentry` ADD INDEX `idx_downsync_centralid_t_physicalstockentry` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_physicalstockentry.idx_downsync_centralid_t_physicalstockentry table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_patientissue.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_patientissue.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientissue.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_patientissue.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientissue.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_patientissue.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientissue.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_patientissue.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientissue.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientissue` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_patientissue.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_patientissue.idx_downsync_centralid_t_patientissue
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientissue' AND INDEX_NAME = 'idx_downsync_centralid_t_patientissue');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientissue` ADD INDEX `idx_downsync_centralid_t_patientissue` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_patientissue.idx_downsync_centralid_t_patientissue table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_facilityconsumption.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_facilityconsumption.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_facilityconsumption.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_facilityconsumption.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_facilityconsumption.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_facilityconsumption.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_facilityconsumption.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_facilityconsumption.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_facilityconsumption.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_facilityconsumption.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_facilityconsumption.idx_downsync_centralid_t_facilityconsumption
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_facilityconsumption' AND INDEX_NAME = 'idx_downsync_centralid_t_facilityconsumption');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_facilityconsumption` ADD INDEX `idx_downsync_centralid_t_facilityconsumption` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_facilityconsumption.idx_downsync_centralid_t_facilityconsumption table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockentry.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_itemstockentry.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockentry.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_itemstockentry.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockentry.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_itemstockentry.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockentry.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_itemstockentry.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockentry.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockentry` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_itemstockentry.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_itemstockentry.idx_downsync_centralid_t_itemstockentry
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockentry' AND INDEX_NAME = 'idx_downsync_centralid_t_itemstockentry');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockentry` ADD INDEX `idx_downsync_centralid_t_itemstockentry` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_itemstockentry.idx_downsync_centralid_t_itemstockentry table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockexit.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_itemstockexit.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockexit.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_itemstockexit.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockexit.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_itemstockexit.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockexit.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_itemstockexit.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_itemstockexit.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockexit` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_itemstockexit.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_itemstockexit.idx_downsync_centralid_t_itemstockexit
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_itemstockexit' AND INDEX_NAME = 'idx_downsync_centralid_t_itemstockexit');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_itemstockexit` ADD INDEX `idx_downsync_centralid_t_itemstockexit` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_itemstockexit.idx_downsync_centralid_t_itemstockexit table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benmedhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benmedhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benmedhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benmedhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benmedhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benmedhistory.idx_downsync_centralid_t_benmedhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_benmedhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedhistory` ADD INDEX `idx_downsync_centralid_t_benmedhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benmedhistory.idx_downsync_centralid_t_benmedhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_femaleobstetrichistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_femaleobstetrichistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_femaleobstetrichistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_femaleobstetrichistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_femaleobstetrichistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_femaleobstetrichistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_femaleobstetrichistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_femaleobstetrichistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_femaleobstetrichistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_femaleobstetrichistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_femaleobstetrichistory.idx_downsync_centralid_t_femaleobstetrichistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_femaleobstetrichistory' AND INDEX_NAME = 'idx_downsync_centralid_t_femaleobstetrichistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_femaleobstetrichistory` ADD INDEX `idx_downsync_centralid_t_femaleobstetrichistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_femaleobstetrichistory.idx_downsync_centralid_t_femaleobstetrichistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benmenstrualdetails.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benmenstrualdetails.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmenstrualdetails.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benmenstrualdetails.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmenstrualdetails.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benmenstrualdetails.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmenstrualdetails.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benmenstrualdetails.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmenstrualdetails.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benmenstrualdetails.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benmenstrualdetails.idx_downsync_centralid_t_benmenstrualdetails
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmenstrualdetails' AND INDEX_NAME = 'idx_downsync_centralid_t_benmenstrualdetails');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmenstrualdetails` ADD INDEX `idx_downsync_centralid_t_benmenstrualdetails` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benmenstrualdetails.idx_downsync_centralid_t_benmenstrualdetails table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benpersonalhabit.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benpersonalhabit.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benpersonalhabit.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benpersonalhabit.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benpersonalhabit.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benpersonalhabit.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benpersonalhabit.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benpersonalhabit.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benpersonalhabit.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benpersonalhabit.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benpersonalhabit.idx_downsync_centralid_t_benpersonalhabit
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benpersonalhabit' AND INDEX_NAME = 'idx_downsync_centralid_t_benpersonalhabit');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benpersonalhabit` ADD INDEX `idx_downsync_centralid_t_benpersonalhabit` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benpersonalhabit.idx_downsync_centralid_t_benpersonalhabit table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail1.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail1.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail1.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail1.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail1.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail1.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail1.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail1.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail1.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail1.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_childvaccinedetail1.idx_downsync_centralid_t_childvaccinedetail1
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail1' AND INDEX_NAME = 'idx_downsync_centralid_t_childvaccinedetail1');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail1` ADD INDEX `idx_downsync_centralid_t_childvaccinedetail1` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail1.idx_downsync_centralid_t_childvaccinedetail1 table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail2.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail2.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail2.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail2.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail2.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail2.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail2.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail2.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childvaccinedetail2.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail2.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_childvaccinedetail2.idx_downsync_centralid_t_childvaccinedetail2
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childvaccinedetail2' AND INDEX_NAME = 'idx_downsync_centralid_t_childvaccinedetail2');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_childvaccinedetail2` ADD INDEX `idx_downsync_centralid_t_childvaccinedetail2` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_childvaccinedetail2.idx_downsync_centralid_t_childvaccinedetail2 table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_childoptionalvaccinedetail.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_childoptionalvaccinedetail.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childoptionalvaccinedetail.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_childoptionalvaccinedetail.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childoptionalvaccinedetail.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_childoptionalvaccinedetail.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childoptionalvaccinedetail.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_childoptionalvaccinedetail.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childoptionalvaccinedetail.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_childoptionalvaccinedetail.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_childoptionalvaccinedetail.idx_downsync_centralid_t_childoptionalvaccinedetail
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childoptionalvaccinedetail' AND INDEX_NAME = 'idx_downsync_centralid_t_childoptionalvaccinedetail');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_childoptionalvaccinedetail` ADD INDEX `idx_downsync_centralid_t_childoptionalvaccinedetail` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_childoptionalvaccinedetail.idx_downsync_centralid_t_childoptionalvaccinedetail table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_ancwomenvaccinedetail.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_ancwomenvaccinedetail.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancwomenvaccinedetail.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_ancwomenvaccinedetail.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancwomenvaccinedetail.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_ancwomenvaccinedetail.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancwomenvaccinedetail.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_ancwomenvaccinedetail.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_ancwomenvaccinedetail.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_ancwomenvaccinedetail.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_ancwomenvaccinedetail.idx_downsync_centralid_t_ancwomenvaccinedetail
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_ancwomenvaccinedetail' AND INDEX_NAME = 'idx_downsync_centralid_t_ancwomenvaccinedetail');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_ancwomenvaccinedetail` ADD INDEX `idx_downsync_centralid_t_ancwomenvaccinedetail` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_ancwomenvaccinedetail.idx_downsync_centralid_t_ancwomenvaccinedetail table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_childfeedinghistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_childfeedinghistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childfeedinghistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_childfeedinghistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childfeedinghistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_childfeedinghistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childfeedinghistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_childfeedinghistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_childfeedinghistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_childfeedinghistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_childfeedinghistory.idx_downsync_centralid_t_childfeedinghistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_childfeedinghistory' AND INDEX_NAME = 'idx_downsync_centralid_t_childfeedinghistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_childfeedinghistory` ADD INDEX `idx_downsync_centralid_t_childfeedinghistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_childfeedinghistory.idx_downsync_centralid_t_childfeedinghistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benallergyhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benallergyhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benallergyhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benallergyhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benallergyhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benallergyhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benallergyhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benallergyhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benallergyhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benallergyhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benallergyhistory.idx_downsync_centralid_t_benallergyhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benallergyhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_benallergyhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benallergyhistory` ADD INDEX `idx_downsync_centralid_t_benallergyhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benallergyhistory.idx_downsync_centralid_t_benallergyhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_bencomorbiditycondition.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_bencomorbiditycondition.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_bencomorbiditycondition.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_bencomorbiditycondition.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_bencomorbiditycondition.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_bencomorbiditycondition.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_bencomorbiditycondition.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_bencomorbiditycondition.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_bencomorbiditycondition.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_bencomorbiditycondition.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_bencomorbiditycondition.idx_downsync_centralid_t_bencomorbiditycondition
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_bencomorbiditycondition' AND INDEX_NAME = 'idx_downsync_centralid_t_bencomorbiditycondition');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_bencomorbiditycondition` ADD INDEX `idx_downsync_centralid_t_bencomorbiditycondition` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_bencomorbiditycondition.idx_downsync_centralid_t_bencomorbiditycondition table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedicationhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benmedicationhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedicationhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benmedicationhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedicationhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benmedicationhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedicationhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benmedicationhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benmedicationhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benmedicationhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benmedicationhistory.idx_downsync_centralid_t_benmedicationhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benmedicationhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_benmedicationhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benmedicationhistory` ADD INDEX `idx_downsync_centralid_t_benmedicationhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benmedicationhistory.idx_downsync_centralid_t_benmedicationhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_benfamilyhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_benfamilyhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benfamilyhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_benfamilyhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benfamilyhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_benfamilyhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benfamilyhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_benfamilyhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_benfamilyhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_benfamilyhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_benfamilyhistory.idx_downsync_centralid_t_benfamilyhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_benfamilyhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_benfamilyhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_benfamilyhistory` ADD INDEX `idx_downsync_centralid_t_benfamilyhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_benfamilyhistory.idx_downsync_centralid_t_benfamilyhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_perinatalhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_perinatalhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_perinatalhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_perinatalhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_perinatalhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_perinatalhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_perinatalhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_perinatalhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_perinatalhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_perinatalhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_perinatalhistory.idx_downsync_centralid_t_perinatalhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_perinatalhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_perinatalhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_perinatalhistory` ADD INDEX `idx_downsync_centralid_t_perinatalhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_perinatalhistory.idx_downsync_centralid_t_perinatalhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_developmenthistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_developmenthistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_developmenthistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_developmenthistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_developmenthistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_developmenthistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_developmenthistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_developmenthistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_developmenthistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_developmenthistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_developmenthistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_developmenthistory.idx_downsync_centralid_t_developmenthistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_developmenthistory' AND INDEX_NAME = 'idx_downsync_centralid_t_developmenthistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_developmenthistory` ADD INDEX `idx_downsync_centralid_t_developmenthistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_developmenthistory.idx_downsync_centralid_t_developmenthistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerfamilyhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerfamilyhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerfamilyhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerfamilyhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerfamilyhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerfamilyhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerfamilyhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerfamilyhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerfamilyhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerfamilyhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerfamilyhistory.idx_downsync_centralid_t_cancerfamilyhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerfamilyhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerfamilyhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerfamilyhistory` ADD INDEX `idx_downsync_centralid_t_cancerfamilyhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerfamilyhistory.idx_downsync_centralid_t_cancerfamilyhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerpersonalhistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerpersonalhistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerpersonalhistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerpersonalhistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerpersonalhistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerpersonalhistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerpersonalhistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerpersonalhistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerpersonalhistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerpersonalhistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerpersonalhistory.idx_downsync_centralid_t_cancerpersonalhistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerpersonalhistory' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerpersonalhistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerpersonalhistory` ADD INDEX `idx_downsync_centralid_t_cancerpersonalhistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerpersonalhistory.idx_downsync_centralid_t_cancerpersonalhistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiethistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerdiethistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiethistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerdiethistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiethistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerdiethistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiethistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerdiethistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiethistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerdiethistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerdiethistory.idx_downsync_centralid_t_cancerdiethistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiethistory' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerdiethistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiethistory` ADD INDEX `idx_downsync_centralid_t_cancerdiethistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerdiethistory.idx_downsync_centralid_t_cancerdiethistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerobstetrichistory.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerobstetrichistory.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerobstetrichistory.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerobstetrichistory.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerobstetrichistory.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerobstetrichistory.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerobstetrichistory.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerobstetrichistory.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerobstetrichistory.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerobstetrichistory.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerobstetrichistory.idx_downsync_centralid_t_cancerobstetrichistory
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerobstetrichistory' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerobstetrichistory');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerobstetrichistory` ADD INDEX `idx_downsync_centralid_t_cancerobstetrichistory` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerobstetrichistory.idx_downsync_centralid_t_cancerobstetrichistory table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancervitals.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancervitals.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancervitals.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancervitals.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancervitals.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancervitals.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancervitals.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancervitals.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancervitals.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancervitals` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancervitals.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancervitals.idx_downsync_centralid_t_cancervitals
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancervitals' AND INDEX_NAME = 'idx_downsync_centralid_t_cancervitals');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancervitals` ADD INDEX `idx_downsync_centralid_t_cancervitals` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancervitals.idx_downsync_centralid_t_cancervitals table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancersignandsymptoms.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancersignandsymptoms.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancersignandsymptoms.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancersignandsymptoms.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancersignandsymptoms.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancersignandsymptoms.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancersignandsymptoms.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancersignandsymptoms.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancersignandsymptoms.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancersignandsymptoms.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancersignandsymptoms.idx_downsync_centralid_t_cancersignandsymptoms
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancersignandsymptoms' AND INDEX_NAME = 'idx_downsync_centralid_t_cancersignandsymptoms');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancersignandsymptoms` ADD INDEX `idx_downsync_centralid_t_cancersignandsymptoms` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancersignandsymptoms.idx_downsync_centralid_t_cancersignandsymptoms table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerlymphnode.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerlymphnode.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerlymphnode.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerlymphnode.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerlymphnode.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerlymphnode.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerlymphnode.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerlymphnode.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerlymphnode.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerlymphnode.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerlymphnode.idx_downsync_centralid_t_cancerlymphnode
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerlymphnode' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerlymphnode');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerlymphnode` ADD INDEX `idx_downsync_centralid_t_cancerlymphnode` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerlymphnode.idx_downsync_centralid_t_cancerlymphnode table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_canceroralexamination.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_canceroralexamination.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_canceroralexamination.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_canceroralexamination.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_canceroralexamination.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_canceroralexamination.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_canceroralexamination.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_canceroralexamination.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_canceroralexamination.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_canceroralexamination.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_canceroralexamination.idx_downsync_centralid_t_canceroralexamination
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_canceroralexamination' AND INDEX_NAME = 'idx_downsync_centralid_t_canceroralexamination');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_canceroralexamination` ADD INDEX `idx_downsync_centralid_t_canceroralexamination` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_canceroralexamination.idx_downsync_centralid_t_canceroralexamination table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerbreastexamination.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerbreastexamination.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerbreastexamination.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerbreastexamination.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerbreastexamination.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerbreastexamination.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerbreastexamination.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerbreastexamination.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerbreastexamination.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerbreastexamination.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerbreastexamination.idx_downsync_centralid_t_cancerbreastexamination
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerbreastexamination' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerbreastexamination');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerbreastexamination` ADD INDEX `idx_downsync_centralid_t_cancerbreastexamination` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerbreastexamination.idx_downsync_centralid_t_cancerbreastexamination table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerabdominalexamination.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerabdominalexamination.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerabdominalexamination.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerabdominalexamination.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerabdominalexamination.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerabdominalexamination.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerabdominalexamination.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerabdominalexamination.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerabdominalexamination.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerabdominalexamination.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerabdominalexamination.idx_downsync_centralid_t_cancerabdominalexamination
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerabdominalexamination' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerabdominalexamination');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerabdominalexamination` ADD INDEX `idx_downsync_centralid_t_cancerabdominalexamination` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerabdominalexamination.idx_downsync_centralid_t_cancerabdominalexamination table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancergynecologicalexamination.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancergynecologicalexamination.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancergynecologicalexamination.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancergynecologicalexamination.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancergynecologicalexamination.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancergynecologicalexamination.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancergynecologicalexamination.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancergynecologicalexamination.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancergynecologicalexamination.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancergynecologicalexamination.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancergynecologicalexamination.idx_downsync_centralid_t_cancergynecologicalexamination
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancergynecologicalexamination' AND INDEX_NAME = 'idx_downsync_centralid_t_cancergynecologicalexamination');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancergynecologicalexamination` ADD INDEX `idx_downsync_centralid_t_cancergynecologicalexamination` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancergynecologicalexamination.idx_downsync_centralid_t_cancergynecologicalexamination table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiagnosis.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerdiagnosis.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiagnosis.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerdiagnosis.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiagnosis.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerdiagnosis.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiagnosis.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerdiagnosis.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerdiagnosis.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerdiagnosis.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerdiagnosis.idx_downsync_centralid_t_cancerdiagnosis
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerdiagnosis' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerdiagnosis');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerdiagnosis` ADD INDEX `idx_downsync_centralid_t_cancerdiagnosis` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerdiagnosis.idx_downsync_centralid_t_cancerdiagnosis table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerimageannotation.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_cancerimageannotation.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerimageannotation.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerimageannotation.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerimageannotation.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_cancerimageannotation.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerimageannotation.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_cancerimageannotation.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_cancerimageannotation.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_cancerimageannotation.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_cancerimageannotation.idx_downsync_centralid_t_cancerimageannotation
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_cancerimageannotation' AND INDEX_NAME = 'idx_downsync_centralid_t_cancerimageannotation');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_cancerimageannotation` ADD INDEX `idx_downsync_centralid_t_cancerimageannotation` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_cancerimageannotation.idx_downsync_centralid_t_cancerimageannotation table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_stockadjustment.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_stockadjustment.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stockadjustment.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_stockadjustment.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stockadjustment.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_stockadjustment.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stockadjustment.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_stockadjustment.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stockadjustment.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stockadjustment` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_stockadjustment.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_stockadjustment.idx_downsync_centralid_t_stockadjustment
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stockadjustment' AND INDEX_NAME = 'idx_downsync_centralid_t_stockadjustment');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_stockadjustment` ADD INDEX `idx_downsync_centralid_t_stockadjustment` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_stockadjustment.idx_downsync_centralid_t_stockadjustment table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_stocktransfer.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_stocktransfer.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stocktransfer.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_stocktransfer.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stocktransfer.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_stocktransfer.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stocktransfer.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_stocktransfer.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_stocktransfer.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_stocktransfer` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_stocktransfer.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_stocktransfer.idx_downsync_centralid_t_stocktransfer
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_stocktransfer' AND INDEX_NAME = 'idx_downsync_centralid_t_stocktransfer');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_stocktransfer` ADD INDEX `idx_downsync_centralid_t_stocktransfer` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_stocktransfer.idx_downsync_centralid_t_stocktransfer table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_patientreturn.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_patientreturn.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientreturn.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_patientreturn.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientreturn.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_patientreturn.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientreturn.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_patientreturn.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_patientreturn.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientreturn` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_patientreturn.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_patientreturn.idx_downsync_centralid_t_patientreturn
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_patientreturn' AND INDEX_NAME = 'idx_downsync_centralid_t_patientreturn');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_patientreturn` ADD INDEX `idx_downsync_centralid_t_patientreturn` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_patientreturn.idx_downsync_centralid_t_patientreturn table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_indent.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_indent.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indent.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_indent.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indent.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_indent.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indent.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_indent.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indent.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indent` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_indent.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_indent.idx_downsync_centralid_t_indent
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indent' AND INDEX_NAME = 'idx_downsync_centralid_t_indent');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_indent` ADD INDEX `idx_downsync_centralid_t_indent` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_indent.idx_downsync_centralid_t_indent table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_indentissue.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_indentissue.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentissue.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_indentissue.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentissue.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_indentissue.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentissue.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_indentissue.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentissue.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentissue` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_indentissue.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_indentissue.idx_downsync_centralid_t_indentissue
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentissue' AND INDEX_NAME = 'idx_downsync_centralid_t_indentissue');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentissue` ADD INDEX `idx_downsync_centralid_t_indentissue` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_indentissue.idx_downsync_centralid_t_indentissue table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_indentorder.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_indentorder.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentorder.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_indentorder.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentorder.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_indentorder.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentorder.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_indentorder.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_indentorder.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentorder` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_indentorder.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_indentorder.idx_downsync_centralid_t_indentorder
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_indentorder' AND INDEX_NAME = 'idx_downsync_centralid_t_indentorder');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_indentorder` ADD INDEX `idx_downsync_centralid_t_indentorder` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_indentorder.idx_downsync_centralid_t_indentorder table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_saitemmapping.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_saitemmapping.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_saitemmapping.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_saitemmapping.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_saitemmapping.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_saitemmapping.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_saitemmapping.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_saitemmapping.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_saitemmapping.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_saitemmapping` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_saitemmapping.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.t_saitemmapping.idx_downsync_centralid_t_saitemmapping
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_saitemmapping' AND INDEX_NAME = 'idx_downsync_centralid_t_saitemmapping');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`t_saitemmapping` ADD INDEX `idx_downsync_centralid_t_saitemmapping` (CentralID, VanID)",
"SELECT 'SKIPPED: db_iemr.t_saitemmapping.idx_downsync_centralid_t_saitemmapping table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_opd.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_opd.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_opd.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_opd.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_opd.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_opd.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_opd.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_opd.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_opd.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_opd.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_stoptb_general_opd.idx_downsync_centralid_tb_stoptb_general_opd
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_opd' AND INDEX_NAME = 'idx_downsync_centralid_tb_stoptb_general_opd');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_opd` ADD INDEX `idx_downsync_centralid_tb_stoptb_general_opd` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_opd.idx_downsync_centralid_tb_stoptb_general_opd table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_examination.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_examination.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_examination.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_examination.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_examination.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_examination.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_examination.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_examination.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_general_examination.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_examination.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_stoptb_general_examination.idx_downsync_centralid_tb_stoptb_general_examination
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_general_examination' AND INDEX_NAME = 'idx_downsync_centralid_tb_stoptb_general_examination');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_general_examination` ADD INDEX `idx_downsync_centralid_tb_stoptb_general_examination` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_general_examination.idx_downsync_centralid_tb_stoptb_general_examination table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_screening.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_screening.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_screening.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_screening.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_screening.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.vanID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'vanID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `vanID` INT          NULL COMMENT 'the van this record belongs to - the down-sync filters on it'",
"SELECT 'SKIPPED: db_iemr.tb_screening.vanID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.vanSerialNo
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'vanSerialNo');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `vanSerialNo` BIGINT       NULL COMMENT 'this row primary key on the van it came from'",
"SELECT 'SKIPPED: db_iemr.tb_screening.vanSerialNo table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_screening.last_mod_date
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND COLUMN_NAME = 'last_mod_date');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync'",
"SELECT 'SKIPPED: db_iemr.tb_screening.last_mod_date table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_screening.idx_downsync_centralid_tb_screening
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_screening' AND INDEX_NAME = 'idx_downsync_centralid_tb_screening');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_screening` ADD INDEX `idx_downsync_centralid_tb_screening` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_screening.idx_downsync_centralid_tb_screening table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_diagnostics.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_diagnostics.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_diagnostics.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_diagnostics.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_diagnostics.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_diagnostics.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_diagnostics.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_diagnostics.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_diagnostics.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_diagnostics.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_stoptb_diagnostics.idx_downsync_centralid_tb_stoptb_diagnostics
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_diagnostics' AND INDEX_NAME = 'idx_downsync_centralid_tb_stoptb_diagnostics');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_diagnostics` ADD INDEX `idx_downsync_centralid_tb_stoptb_diagnostics` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_diagnostics.idx_downsync_centralid_tb_stoptb_diagnostics table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_suspected.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_suspected.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_suspected.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_suspected.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_suspected.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.vanID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'vanID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `vanID` INT          NULL COMMENT 'the van this record belongs to - the down-sync filters on it'",
"SELECT 'SKIPPED: db_iemr.tb_suspected.vanID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.vanSerialNo
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'vanSerialNo');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `vanSerialNo` BIGINT       NULL COMMENT 'this row primary key on the van it came from'",
"SELECT 'SKIPPED: db_iemr.tb_suspected.vanSerialNo table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_suspected.last_mod_date
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND COLUMN_NAME = 'last_mod_date');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync'",
"SELECT 'SKIPPED: db_iemr.tb_suspected.last_mod_date table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_suspected.idx_downsync_centralid_tb_suspected
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_suspected' AND INDEX_NAME = 'idx_downsync_centralid_tb_suspected');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_suspected` ADD INDEX `idx_downsync_centralid_tb_suspected` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_suspected.idx_downsync_centralid_tb_suspected table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.vanID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'vanID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `vanID` INT          NULL COMMENT 'the van this record belongs to - the down-sync filters on it'",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.vanID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.vanSerialNo
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'vanSerialNo');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `vanSerialNo` BIGINT       NULL COMMENT 'this row primary key on the van it came from'",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.vanSerialNo table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_confirmed_cases.last_mod_date
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND COLUMN_NAME = 'last_mod_date');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync'",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.last_mod_date table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_confirmed_cases.idx_downsync_centralid_tb_confirmed_cases
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_confirmed_cases' AND INDEX_NAME = 'idx_downsync_centralid_tb_confirmed_cases');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_confirmed_cases` ADD INDEX `idx_downsync_centralid_tb_confirmed_cases` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_confirmed_cases.idx_downsync_centralid_tb_confirmed_cases table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_order.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_order.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_order.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_order.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_order.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_order.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_order.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_order.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_order.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_order.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_diagnostic_order.idx_downsync_centralid_tb_diagnostic_order
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_order' AND INDEX_NAME = 'idx_downsync_centralid_tb_diagnostic_order');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_order` ADD INDEX `idx_downsync_centralid_tb_diagnostic_order` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_order.idx_downsync_centralid_tb_diagnostic_order table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_result.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_result.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_result.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_result.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_result.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_result.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_result.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_result.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_result.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_result.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_diagnostic_result.idx_downsync_centralid_tb_diagnostic_result
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_result' AND INDEX_NAME = 'idx_downsync_centralid_tb_diagnostic_result');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_result` ADD INDEX `idx_downsync_centralid_tb_diagnostic_result` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_result.idx_downsync_centralid_tb_diagnostic_result table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_document.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_document.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_document.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_document.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_document.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_document.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_document.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_document.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_diagnostic_document.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_document.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_diagnostic_document.idx_downsync_centralid_tb_diagnostic_document
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_diagnostic_document' AND INDEX_NAME = 'idx_downsync_centralid_tb_diagnostic_document');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_diagnostic_document` ADD INDEX `idx_downsync_centralid_tb_diagnostic_document` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_diagnostic_document.idx_downsync_centralid_tb_diagnostic_document table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_identity.i_beneficiarydetails_rmnch.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_identity.i_beneficiarydetails_rmnch.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_beneficiarydetails_rmnch.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_identity.i_beneficiarydetails_rmnch.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_beneficiarydetails_rmnch.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_identity.i_beneficiarydetails_rmnch.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_beneficiarydetails_rmnch.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_identity.i_beneficiarydetails_rmnch.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_beneficiarydetails_rmnch.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_identity.i_beneficiarydetails_rmnch.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_identity.i_beneficiarydetails_rmnch.idx_downsync_centralid_i_beneficiarydetails_rmnch
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_beneficiarydetails_rmnch' AND INDEX_NAME = 'idx_downsync_centralid_i_beneficiarydetails_rmnch');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_identity`.`i_beneficiarydetails_rmnch` ADD INDEX `idx_downsync_centralid_i_beneficiarydetails_rmnch` (CentralID, VanID)",
"SELECT 'SKIPPED: db_identity.i_beneficiarydetails_rmnch.idx_downsync_centralid_i_beneficiarydetails_rmnch table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_identity.i_householddetails.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_identity.i_householddetails.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_householddetails.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_identity.i_householddetails.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_householddetails.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_identity.i_householddetails.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_householddetails.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_identity.i_householddetails.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_identity.i_householddetails.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_identity`.`i_householddetails` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_identity.i_householddetails.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_identity.i_householddetails.idx_downsync_centralid_i_householddetails
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'i_householddetails' AND INDEX_NAME = 'idx_downsync_centralid_i_householddetails');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_identity`.`i_householddetails` ADD INDEX `idx_downsync_centralid_i_householddetails` (CentralID, VanID)",
"SELECT 'SKIPPED: db_identity.i_householddetails.idx_downsync_centralid_i_householddetails table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_visit.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_visit.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_visit.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_visit.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_visit.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.tb_stoptb_visit.last_mod_date
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND COLUMN_NAME = 'last_mod_date');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD COLUMN `last_mod_date` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync'",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.last_mod_date table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- Index db_iemr.tb_stoptb_visit.idx_downsync_centralid_tb_stoptb_visit
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit');
SET @idx_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'tb_stoptb_visit' AND INDEX_NAME = 'idx_downsync_centralid_tb_stoptb_visit');
SET @sql := IF(@tbl_exists = 1 AND @idx_exists = 0,
"ALTER TABLE `db_iemr`.`tb_stoptb_visit` ADD INDEX `idx_downsync_centralid_tb_stoptb_visit` (CentralID, vanID)",
"SELECT 'SKIPPED: db_iemr.tb_stoptb_visit.idx_downsync_centralid_tb_stoptb_visit table/index missing or index already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @idx_exists := NULL, @sql := NULL;

-- db_iemr.t_form_response.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_form_response.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_form_response.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_form_response.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_form_response.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_form_response.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_form_response.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_form_response.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_form_response.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_form_response.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_form_response.LastModDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_form_response' AND COLUMN_NAME = 'LastModDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_form_response` ADD COLUMN `LastModDate` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync",
"SELECT 'SKIPPED: db_iemr.t_form_response.LastModDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_section_response.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_section_response.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_section_response.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_section_response.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_section_response.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_section_response.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_section_response.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_section_response.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_section_response.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_section_response.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_section_response.LastModDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_section_response' AND COLUMN_NAME = 'LastModDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_section_response` ADD COLUMN `LastModDate` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync",
"SELECT 'SKIPPED: db_iemr.t_section_response.LastModDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_question_response.DownSynced
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSynced');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `DownSynced` CHAR(1)      NOT NULL DEFAULT 'N'",
"SELECT 'SKIPPED: db_iemr.t_question_response.DownSynced table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_question_response.DownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `DownSyncDate` DATETIME     NULL",
"SELECT 'SKIPPED: db_iemr.t_question_response.DownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_question_response.DownSyncFailureReason
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'DownSyncFailureReason');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL",
"SELECT 'SKIPPED: db_iemr.t_question_response.DownSyncFailureReason table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_question_response.LastDownSyncDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'LastDownSyncDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `LastDownSyncDate` DATETIME     NULL COMMENT 'when this row was last received from central'",
"SELECT 'SKIPPED: db_iemr.t_question_response.LastDownSyncDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_question_response.CentralID
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'CentralID');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `CentralID` BIGINT       NULL COMMENT 'primary key of this row in the central DB'",
"SELECT 'SKIPPED: db_iemr.t_question_response.CentralID table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;

-- db_iemr.t_question_response.LastModDate
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response');
SET @col_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 't_question_response' AND COLUMN_NAME = 'LastModDate');
SET @sql := IF(@tbl_exists = 1 AND @col_exists = 0,
"ALTER TABLE `db_iemr`.`t_question_response` ADD COLUMN `LastModDate` DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync",
"SELECT 'SKIPPED: db_iemr.t_question_response.LastModDate table/column missing or column already exists' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @tbl_exists := NULL, @col_exists := NULL, @sql := NULL;


-- Data backfills are also guarded so absent tables/columns are skipped.
SET @ok := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_form_response');
SET @c1 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_form_response' AND COLUMN_NAME='LastModDate');
SET @c2 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_form_response' AND COLUMN_NAME='updatedAt');
SET @c3 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_form_response' AND COLUMN_NAME='createdAt');
SET @sql := IF(@ok=1 AND @c1=1 AND @c2=1 AND @c3=1, "UPDATE db_iemr.t_form_response SET LastModDate = COALESCE(updatedAt, createdAt) WHERE LastModDate IS NULL", "SELECT 'SKIPPED: t_form_response LastModDate backfill - table/columns not found' AS message");
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ok := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_section_response');
SET @c1 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_section_response' AND COLUMN_NAME='LastModDate');
SET @c2 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_section_response' AND COLUMN_NAME='savedAt');
SET @sql := IF(@ok=1 AND @c1=1 AND @c2=1, "UPDATE db_iemr.t_section_response SET LastModDate = savedAt WHERE LastModDate IS NULL AND savedAt IS NOT NULL", "SELECT 'SKIPPED: t_section_response LastModDate backfill - table/columns not found' AS message");
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @t1 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_question_response');
SET @t2 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_section_response');
SET @q1 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_question_response' AND COLUMN_NAME='LastModDate');
SET @q2 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_question_response' AND COLUMN_NAME='sectionResponseId');
SET @s1 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_section_response' AND COLUMN_NAME='sectionResponseId');
SET @s2 := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='t_section_response' AND COLUMN_NAME='LastModDate');
SET @sql := IF(@t1=1 AND @t2=1 AND @q1=1 AND @q2=1 AND @s1=1 AND @s2=1, "UPDATE db_iemr.t_question_response q JOIN db_iemr.t_section_response s ON s.sectionResponseId = q.sectionResponseId SET q.LastModDate = s.LastModDate WHERE q.LastModDate IS NULL AND s.LastModDate IS NOT NULL", "SELECT 'SKIPPED: t_question_response LastModDate backfill - table/columns not found' AS message");
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Rename last_mod_date only when the old column exists and LastModDate does not.
SET @tbl_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response');
SET @old_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response' AND COLUMN_NAME='last_mod_date');
SET @new_exists := (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='db_iemr' AND TABLE_NAME='t_form_response' AND COLUMN_NAME='LastModDate');
SET @sql := IF(@tbl_exists=1 AND @old_exists=1 AND @new_exists=0, "ALTER TABLE db_iemr.t_form_response CHANGE last_mod_date LastModDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP", "SELECT 'SKIPPED: t_form_response last_mod_date rename - table/old column missing or new column already exists' AS message");
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET SQL_SAFE_UPDATES = @old_safe_updates;
SET @tbl_exists := NULL, @old_exists := NULL, @new_exists := NULL, @t1 := NULL, @t2 := NULL, @q1 := NULL, @q2 := NULL, @s1 := NULL, @s2 := NULL, @ok := NULL, @c1 := NULL, @c2 := NULL, @c3 := NULL, @sql := NULL, @old_safe_updates := NULL;