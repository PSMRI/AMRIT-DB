-- ==========================================================
-- tb_diagnostic_order (see V96):
--   1. Renames reason_for_refusal -> reason_to_close (TEXT NULL). The column now holds the
--      reason an order was closed (refused, cancelled, etc.), not only refusals.
--   2. Adds cancel_response_json (LONGTEXT NULL) after push_response_json, to store the raw
--      provider response returned when an order is cancelled.
--   3. Adds manually_entered_by (VARCHAR(100) NULL) after modified_by, to record which user
--      directly acted on the order (manual result entry, or a manual refusal/close) -- distinct
--      from modified_by, which is left unset by automated writes (e.g. the poll scheduler).
--   4. Drops the uk_diagnostic_order_ben_visit_type unique key (beneficiary_id, visitCode,
--      order_type). A beneficiary can now have more than one row for the same visit+orderType --
--      a FAILED or CLOSED order is never overwritten, a fresh push always creates a new row
--      instead -- so "the active one" is resolved by application logic (the latest row not in a
--      terminal status), not a DB constraint. external_order_id keeps its own unique index.
--
-- Idempotent: every ALTER is guarded by an information_schema check and skipped (with a
-- "SELECT '... already exists'"/"'... does not exist'" no-op) when already applied.
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

-- ----------------------------------------------------------
-- ADD COLUMN cancel_response_json
-- ----------------------------------------------------------
SET @col_name = 'cancel_response_json';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' LONGTEXT NULL AFTER push_response_json'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------
-- ADD COLUMN manually_entered_by
-- ----------------------------------------------------------
SET @col_name = 'manually_entered_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(100) NULL AFTER modified_by'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------
-- DROP unique key uk_diagnostic_order_ben_visit_type (beneficiary_id, visitCode, order_type)
-- ----------------------------------------------------------
SET @idx_name = 'uk_diagnostic_order_ben_visit_type';
SET @idx_exists = 0;
PREPARE chk_idx FROM 'SELECT COUNT(*) INTO @idx_exists FROM information_schema.STATISTICS WHERE table_schema = ? AND table_name = ? AND index_name = ?';
EXECUTE chk_idx USING @schema_name, @tbl_name, @idx_name;
DEALLOCATE PREPARE chk_idx;
SET @sql = IF(@idx_exists > 0,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP INDEX ', @idx_name),
CONCAT('SELECT ''', @tbl_name, '.', @idx_name, ' does not exist''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
