-- Fleet V5: diagnostic document upload counts per laptop.
--  * device_sync.docs_*: document files MMU-API's diagnostic document push has not got to central yet
--    (tb_diagnostic_document.docsProcessed N) and files central refused (F, with docSyncFailureReason),
--    from the heartbeat's sync.documents block. NULL docs_pending = the console did not report documents
--    (a console before 1.4.6, or a camp DB without the document push columns).
-- All DATETIME columns are UTC.

USE db_fleet;

-- device_sync.docs_* (guarded: MySQL 8 has no ADD COLUMN IF NOT EXISTS). docs_reasons: [{reason, count, lastTried}], top 5
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
SET @schema_name = 'db_fleet', @tbl_name = 'device_sync', @col_name = 'docs_pending';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    'ALTER TABLE device_sync ADD COLUMN docs_pending INT NULL',
    'SELECT ''device_sync.docs_pending already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
SET @schema_name = 'db_fleet', @tbl_name = 'device_sync', @col_name = 'docs_failed';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    'ALTER TABLE device_sync ADD COLUMN docs_failed INT NULL',
    'SELECT ''device_sync.docs_failed already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
SET @schema_name = 'db_fleet', @tbl_name = 'device_sync', @col_name = 'docs_oldest_pending_at';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    'ALTER TABLE device_sync ADD COLUMN docs_oldest_pending_at DATETIME NULL',
    'SELECT ''device_sync.docs_oldest_pending_at already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
SET @schema_name = 'db_fleet', @tbl_name = 'device_sync', @col_name = 'docs_last_synced_at';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    'ALTER TABLE device_sync ADD COLUMN docs_last_synced_at DATETIME NULL',
    'SELECT ''device_sync.docs_last_synced_at already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
SET @schema_name = 'db_fleet', @tbl_name = 'device_sync', @col_name = 'docs_reasons';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    'ALTER TABLE device_sync ADD COLUMN docs_reasons JSON NULL',
    'SELECT ''device_sync.docs_reasons already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
SET @schema_name = 'db_fleet', @tbl_name = 'device_sync', @col_name = 'docs_error';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
    'ALTER TABLE device_sync ADD COLUMN docs_error VARCHAR(500) NULL',
    'SELECT ''device_sync.docs_error already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

INSERT IGNORE INTO query_template (name, description, sql_text, max_rows, created_by, created_at) VALUES
('Documents not uploaded',
 'Diagnostic document files not on central yet (N = waiting, F = refused, with the reason).',
 'SELECT id, beneficiary_id, order_type, document_type, docsProcessed, docSyncFailureReason, created_date, last_mod_date\nFROM db_iemr.tb_diagnostic_document\nWHERE docsProcessed IN (''N'', ''F'')\nORDER BY created_date',
 5000, 'system', UTC_TIMESTAMP());
