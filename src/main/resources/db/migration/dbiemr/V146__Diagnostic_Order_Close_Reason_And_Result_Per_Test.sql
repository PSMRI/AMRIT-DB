-- ==========================================================
-- V144: TB diagnostic per-test changes
--   Part A: tb_diagnostic_order  - per-test reason-to-close columns
--   Part B: tb_diagnostic_result - one result row per test (result_type)
-- ==========================================================

-- ##########################################################
-- Part A
-- ##########################################################
-- ==========================================================
-- tb_diagnostic_order (see V125, V129):
--   1. Adds one reason-to-close column per test (TEXT NULL). An MTB / MTB_PLUS order carries two
--      tests: MTB, then MDR RIF when MTB is positive.
--        reason_to_close_xray   <- XRAY_CHEST order closed
--        reason_to_close_mtb    <- MTB / MTB_PLUS order closed before a positive MTB result
--        reason_to_close_mdrrif <- MTB / MTB_PLUS order closed after a positive MTB result
--                                  (the MDR RIF test wasn't done)
--      The API now writes only the column for the test being closed; reason_to_close is left in
--      place (not dropped) but no longer written or read.
--   2. Backfills each existing row's reason_to_close into its column by the rule above; "positive"
--      is tb_diagnostic_result.result_summary = 'TB Positive' for the order's external_order_id.
--      The UPDATE does not change any column trg_scl_tb_diagnostic_order_au watches (V134),
--      so it adds nothing to t_sync_change_log.
--   3. Appends the three columns to the van<->central sync mapping (m_synctabledetail
--      ServerColumnName / VanColumnName) for tb_diagnostic_order. Both lists must carry the
--      same names (see V105, V129). Not dates, so no date_format(...) wrapping (see V118).
--   4. Recreates trg_scl_tb_diagnostic_order_au (V134) to watch the three new columns, since
--      reason_to_close no longer changes when an order is closed.
--
-- Idempotent: each ALTER is guarded by an information_schema check, the backfill only fills
-- NULL target columns, and every list edit by FIND_IN_SET.
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_diagnostic_order';

-- ----------------------------------------------------------
-- 1) ADD COLUMNS
-- ----------------------------------------------------------
SET @col_name = 'reason_to_close_xray';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' TEXT NULL AFTER reason_to_close'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'reason_to_close_mtb';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' TEXT NULL AFTER reason_to_close_xray'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'reason_to_close_mdrrif';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' TEXT NULL AFTER reason_to_close_mtb'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------
-- 2) BACKFILL reason_to_close -> column for the test that was closed
-- ----------------------------------------------------------
SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET sql_safe_updates = 0;

UPDATE tb_diagnostic_order
SET reason_to_close_xray = reason_to_close
WHERE order_type = 'XRAY_CHEST' AND reason_to_close IS NOT NULL AND reason_to_close_xray IS NULL;

-- MTB positive -> the MDR RIF test is the one that wasn't done
UPDATE tb_diagnostic_order o
JOIN tb_diagnostic_result r ON r.external_order_id = o.external_order_id AND r.deleted = 0
SET o.reason_to_close_mdrrif = o.reason_to_close
WHERE o.order_type IN ('MTB', 'MTB_PLUS') AND o.reason_to_close IS NOT NULL
  AND o.reason_to_close_mtb IS NULL AND o.reason_to_close_mdrrif IS NULL
  AND r.result_summary = 'TB Positive';

-- Anything else -> the MTB test itself
UPDATE tb_diagnostic_order
SET reason_to_close_mtb = reason_to_close
WHERE order_type IN ('MTB', 'MTB_PLUS') AND reason_to_close IS NOT NULL
  AND reason_to_close_mtb IS NULL AND reason_to_close_mdrrif IS NULL;

-- ==========================================================
-- 3) m_synctabledetail column mapping for tb_diagnostic_order
-- Skipped entirely if the table or the ServerColumnName / VanColumnName columns are missing.
-- ==========================================================
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail'
);
SET @col_server_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'ServerColumnName'
);
SET @col_van_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'VanColumnName'
);

-- reason_to_close_xray
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('reason_to_close_xray', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',reason_to_close_xray')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('reason_to_close_xray', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',reason_to_close_xray')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_order'
  AND (
      FIND_IN_SET('reason_to_close_xray', ServerColumnName) = 0
      OR FIND_IN_SET('reason_to_close_xray', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - reason_to_close_xray update skipped' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- reason_to_close_mtb
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('reason_to_close_mtb', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',reason_to_close_mtb')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('reason_to_close_mtb', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',reason_to_close_mtb')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_order'
  AND (
      FIND_IN_SET('reason_to_close_mtb', ServerColumnName) = 0
      OR FIND_IN_SET('reason_to_close_mtb', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - reason_to_close_mtb update skipped' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- reason_to_close_mdrrif
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('reason_to_close_mdrrif', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',reason_to_close_mdrrif')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('reason_to_close_mdrrif', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',reason_to_close_mdrrif')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_order'
  AND (
      FIND_IN_SET('reason_to_close_mdrrif', ServerColumnName) = 0
      OR FIND_IN_SET('reason_to_close_mdrrif', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - reason_to_close_mdrrif update skipped' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET sql_safe_updates = @old_safe_updates;
SET @tbl_exists := NULL, @col_server_exists := NULL, @col_van_exists := NULL, @sql := NULL,
    @old_safe_updates := NULL, @col_name := NULL, @col_exists := NULL;

-- ==========================================================
-- 4) Change-log trigger: watch the per-type close-reason columns
-- ==========================================================
DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_order_au`;
CREATE TRIGGER `trg_scl_tb_diagnostic_order_au` AFTER UPDATE ON `tb_diagnostic_order` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', NEW.id, 'U', NULL, NEW.beneficiary_id FROM DUAL
  WHERE NOT (NEW.status <=> OLD.status) OR NOT (NEW.error_message <=> OLD.error_message)
     OR NOT (NEW.reason_to_close_xray <=> OLD.reason_to_close_xray)
     OR NOT (NEW.reason_to_close_mtb <=> OLD.reason_to_close_mtb)
     OR NOT (NEW.reason_to_close_mdrrif <=> OLD.reason_to_close_mdrrif)
     OR NOT (NEW.deleted <=> OLD.deleted)
     OR NOT (NEW.beneficiary_id <=> OLD.beneficiary_id) OR NOT (NEW.visitCode <=> OLD.visitCode)
     OR NOT (NEW.order_type <=> OLD.order_type) OR NOT (NEW.external_order_id <=> OLD.external_order_id);

-- ##########################################################
-- Part B
-- ##########################################################
-- ==========================================================
-- tb_diagnostic_result (see V96, V103, V105):
--   One result row per TEST instead of one per order. An MTB / MTB_PLUS order carries two tests:
--   MTB itself, then MDR RIF after a positive MTB. Each now gets its own row.
--   1. Adds result_type VARCHAR(20) NULL: XRAY_CHEST / MTB / MTB_PLUS for the order's own test,
--      MDR_RIF for the RIF test on an MTB / MTB_PLUS order.
--   2. Fills result_type on existing rows from their order's order_type (no RIF rows are split
--      out: there is no existing RIF data to move).
--   3. Drops the single-column UNIQUE key on external_order_id (uk_diagnostic_result_external_order_id
--      from V103, or a Hibernate-named one on databases it created), which allowed only one row
--      per order.
--   4. Adds UNIQUE (external_order_id, result_type).
--   5. Appends result_type to the van<->central sync mapping (m_synctabledetail ServerColumnName /
--      VanColumnName) for tb_diagnostic_result. Both lists must carry the same names (see V105).
--   The change-log triggers (V135) map any result row to its order by external_order_id, so they
--   need no change: a new MDR_RIF row re-sends its order like any other result change.
--
-- Idempotent: the ALTERs are guarded by information_schema checks, the fill only touches NULL
-- result_type, and the list edit by FIND_IN_SET.
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_diagnostic_result';

-- ----------------------------------------------------------
-- 1) ADD COLUMN result_type
-- ----------------------------------------------------------
SET @col_name = 'result_type';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(20) NULL AFTER external_order_id'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------
-- 2) FILL result_type from the order
-- ----------------------------------------------------------
SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET sql_safe_updates = 0;

UPDATE tb_diagnostic_result r
JOIN tb_diagnostic_order o ON o.external_order_id = r.external_order_id
SET r.result_type = o.order_type
WHERE r.result_type IS NULL;

SET sql_safe_updates = @old_safe_updates;

-- ----------------------------------------------------------
-- 3) DROP the single-column UNIQUE key on external_order_id
--    Looked up by its columns, not its name. Run twice in case a database carries both the
--    V103 key and a Hibernate-created one.
-- ----------------------------------------------------------
SET @idx_name = (
    SELECT s.index_name FROM information_schema.statistics s
    WHERE s.table_schema = @schema_name AND s.table_name = @tbl_name
      AND s.non_unique = 0 AND s.index_name <> 'PRIMARY'
    GROUP BY s.index_name
    HAVING COUNT(*) = 1 AND MAX(s.column_name) = 'external_order_id'
    LIMIT 1
);
SET @sql = IF(@idx_name IS NOT NULL,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP INDEX `', @idx_name, '`'),
CONCAT('SELECT ''', @tbl_name, ': no single-column unique key on external_order_id'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_name = (
    SELECT s.index_name FROM information_schema.statistics s
    WHERE s.table_schema = @schema_name AND s.table_name = @tbl_name
      AND s.non_unique = 0 AND s.index_name <> 'PRIMARY'
    GROUP BY s.index_name
    HAVING COUNT(*) = 1 AND MAX(s.column_name) = 'external_order_id'
    LIMIT 1
);
SET @sql = IF(@idx_name IS NOT NULL,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP INDEX `', @idx_name, '`'),
CONCAT('SELECT ''', @tbl_name, ': no further single-column unique key on external_order_id'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------
-- 4) ADD UNIQUE (external_order_id, result_type)
-- ----------------------------------------------------------
SET @uk_name = 'uk_diagnostic_result_external_order_id_type';
SET @uk_exists = 0;
PREPARE chk_uk FROM 'SELECT COUNT(*) INTO @uk_exists FROM information_schema.statistics WHERE table_schema = ? AND table_name = ? AND index_name = ?';
EXECUTE chk_uk USING @schema_name, @tbl_name, @uk_name;
DEALLOCATE PREPARE chk_uk;
SET @sql = IF(@uk_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD CONSTRAINT ', @uk_name, ' UNIQUE (external_order_id, result_type)'),
CONCAT('SELECT ''', @tbl_name, '.', @uk_name, ' already exists'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- 5) m_synctabledetail column mapping for tb_diagnostic_result
-- Skipped entirely if the table or the ServerColumnName / VanColumnName columns are missing.
-- ==========================================================
SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET sql_safe_updates = 0;
SET @tbl_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail'
);
SET @col_server_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'ServerColumnName'
);
SET @col_van_exists := (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'm_synctabledetail' AND COLUMN_NAME = 'VanColumnName'
);

SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('result_type', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',result_type')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('result_type', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',result_type')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_result'
  AND (
      FIND_IN_SET('result_type', ServerColumnName) = 0
      OR FIND_IN_SET('result_type', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - result_type update skipped' AS message");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET sql_safe_updates = @old_safe_updates;
SET @tbl_exists := NULL, @col_server_exists := NULL, @col_van_exists := NULL, @sql := NULL,
    @old_safe_updates := NULL, @col_name := NULL, @col_exists := NULL, @idx_name := NULL,
    @uk_name := NULL, @uk_exists := NULL;
