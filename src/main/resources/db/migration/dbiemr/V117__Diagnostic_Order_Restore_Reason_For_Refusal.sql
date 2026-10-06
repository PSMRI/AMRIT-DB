-- ==========================================================
-- tb_diagnostic_order (reverts the column rename done in V114):
--   Renames reason_to_close -> reason_for_refusal (TEXT NULL).
--   FLW-API 3.8.x / 3.9.x and the tb_diagnostic_order m_synctabledetail row still use
--   reason_for_refusal; with the V114 name in place, FLW-API fails on every diagnostic-order
--   read/write and van->server sync fails with "Unknown column 'reason_for_refusal'".
--   Only the rename is reverted -- the columns V114 added (cancel_response_json,
--   manually_entered_by) and the dropped uk_diagnostic_order_ben_visit_type key are left as-is.
--   The release that moves to reason_to_close must add its own forward rename together with
--   the matching m_synctabledetail update.
--
-- Idempotent: the rename only runs when reason_to_close exists and reason_for_refusal does not
-- (no-op where the column was never renamed or was already renamed back by hand).
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_diagnostic_order';

-- ----------------------------------------------------------
-- RENAME COLUMN reason_to_close -> reason_for_refusal
-- ----------------------------------------------------------
SET @old_col_name = 'reason_to_close';
SET @new_col_name = 'reason_for_refusal';
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
