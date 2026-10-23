-- ==========================================================
-- tb_diagnostic_order (see V96, V114):
--   1. Renames reason_for_refusal -> reason_to_close (TEXT NULL) again. V114/V125 made this
--      rename and V117/V126 reverted it; reason_to_close holds the reason an order was closed
--      (refused, cancelled, etc.), not only refusals.
--   2. Keeps the van<->central sync mapping (m_synctabledetail.ServerColumnName /
--      VanColumnName) for tb_diagnostic_order in step with the table:
--        - reason_for_refusal is replaced by reason_to_close in both lists (or just removed
--          when reason_to_close is already listed);
--        - cancel_response_json and manually_entered_by (added to the table by V114) are
--          appended to both lists.
--      Both lists must carry the same names: the central side binds values by NAME, and a name
--      missing from VanColumnName is written to central as NULL with no error (see V105).
--      None of these columns are dates, so no date_format(...) wrapping is needed (see V118).
--      The m_synctabledetail row for tb_diagnostic_order is not seeded by any migration; on a
--      server without one, the UPDATEs match no rows and the migration moves on.
--
-- Idempotent: the ALTER is guarded by an information_schema check, and every list edit by
-- FIND_IN_SET, so re-running only touches what is not already in place.
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_diagnostic_order';

-- ----------------------------------------------------------
-- RENAME COLUMN reason_for_refusal -> reason_to_close
-- ----------------------------------------------------------
SET @old_col_name = 'reason_for_refusal';
SET @new_col_name = 'reason_to_close';
SET @old_col_exists = 0;
SET @new_col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @old_col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @old_col_name;
DEALLOCATE PREPARE chk_col;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @new_col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @new_col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@old_col_exists > 0 AND @new_col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' CHANGE COLUMN ', @old_col_name, ' ', @new_col_name, ' TEXT NULL'),
IF(@new_col_exists > 0,
CONCAT('SELECT ''', @tbl_name, '.', @new_col_name, ' already exists'''),
CONCAT('SELECT ''', @tbl_name, '.', @old_col_name, ' does not exist''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- m_synctabledetail column mapping for tb_diagnostic_order
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

-- ------------------------------------------------------------
-- 1) reason_for_refusal -> reason_to_close
-- ------------------------------------------------------------
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('reason_for_refusal', ServerColumnName) = 0
        THEN ServerColumnName
        WHEN FIND_IN_SET('reason_to_close', ServerColumnName) = 0
        THEN TRIM(BOTH ',' FROM REPLACE(CONCAT(',', ServerColumnName, ','), ',reason_for_refusal,', ',reason_to_close,'))
        ELSE TRIM(BOTH ',' FROM REPLACE(CONCAT(',', ServerColumnName, ','), ',reason_for_refusal,', ','))
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('reason_for_refusal', VanColumnName) = 0
        THEN VanColumnName
        WHEN FIND_IN_SET('reason_to_close', VanColumnName) = 0
        THEN TRIM(BOTH ',' FROM REPLACE(CONCAT(',', VanColumnName, ','), ',reason_for_refusal,', ',reason_to_close,'))
        ELSE TRIM(BOTH ',' FROM REPLACE(CONCAT(',', VanColumnName, ','), ',reason_for_refusal,', ','))
    END
WHERE TableName = 'tb_diagnostic_order'
  AND (
      FIND_IN_SET('reason_for_refusal', ServerColumnName) > 0
      OR FIND_IN_SET('reason_for_refusal', VanColumnName) > 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - reason_to_close update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ------------------------------------------------------------
-- 2) cancel_response_json
-- ------------------------------------------------------------
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('cancel_response_json', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',cancel_response_json')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('cancel_response_json', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',cancel_response_json')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_order'
  AND (
      FIND_IN_SET('cancel_response_json', ServerColumnName) = 0
      OR FIND_IN_SET('cancel_response_json', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - cancel_response_json update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ------------------------------------------------------------
-- 3) manually_entered_by
-- ------------------------------------------------------------
SET @sql := IF(@tbl_exists = 1 AND @col_server_exists = 1 AND @col_van_exists = 1,
"UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('manually_entered_by', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',manually_entered_by')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('manually_entered_by', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',manually_entered_by')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_order'
  AND (
      FIND_IN_SET('manually_entered_by', ServerColumnName) = 0
      OR FIND_IN_SET('manually_entered_by', VanColumnName) = 0
  )",
"SELECT 'SKIPPED: m_synctabledetail table/columns not found - manually_entered_by update skipped' AS message");

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET sql_safe_updates = @old_safe_updates;
SET @tbl_exists := NULL, @col_server_exists := NULL, @col_van_exists := NULL, @sql := NULL, @old_safe_updates := NULL;
