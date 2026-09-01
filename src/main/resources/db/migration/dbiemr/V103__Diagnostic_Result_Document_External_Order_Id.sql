-- ==========================================================
-- Adds external_order_id to tb_diagnostic_result / tb_diagnostic_document, alongside the
-- existing diagnostic_order_id column (kept, not dropped, not backfilled/migrated here).
--
-- Why: diagnostic_order_id is a local, per-van AUTO_INCREMENT FK to tb_diagnostic_order.id,
-- which collides once orders from multiple offline (van) servers meet centrally. The app now
-- links tb_diagnostic_result/tb_diagnostic_document to their parent order via
-- tb_diagnostic_order.external_order_id (a stable business key) instead, and no longer
-- populates diagnostic_order_id on new inserts.
--
-- tb_diagnostic_result.diagnostic_order_id is currently NOT NULL (see V96), so it must be
-- relaxed to nullable here -- otherwise every new insert from the updated app code (which never
-- sets it) would fail outright on that NOT NULL constraint. tb_diagnostic_document.
-- diagnostic_order_id is already nullable, so no equivalent change is needed there.
--
-- The old FK/unique constraints on diagnostic_order_id (fk_diagnostic_result_order,
-- uk_diagnostic_result_order_id, fk_diagnostic_document_order,
-- uk_diagnostic_document_order_doctype -- all from V96) are dropped below: they enforced
-- invariants (one result per order, one document per order+type, valid parent order) that no
-- longer hold once new rows stop populating diagnostic_order_id, so they'd either block new
-- inserts outright or simply go stale. The column itself is kept, unconstrained, as a
-- read-only historical reference to whatever it held before this migration.
--
-- Idempotent: every ALTER is guarded by an information_schema check and skipped (with a
-- "SELECT '... already exists'"/"'... does not exist'" no-op) when already applied.
-- ==========================================================

USE db_iemr;

SET @schema_name = 'db_iemr';

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------
SET @tbl_name = 'tb_diagnostic_result';

-- ADD COLUMN external_order_id
SET @col_name = 'external_order_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(100) NULL AFTER diagnostic_order_id'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- DROP FOREIGN KEY fk_diagnostic_result_order
SET @fk_name = 'fk_diagnostic_result_order';
SET @fk_exists = 0;
PREPARE chk_fk FROM 'SELECT COUNT(*) INTO @fk_exists FROM information_schema.table_constraints WHERE table_schema = ? AND table_name = ? AND constraint_name = ? AND constraint_type = ''FOREIGN KEY''';
EXECUTE chk_fk USING @schema_name, @tbl_name, @fk_name;
DEALLOCATE PREPARE chk_fk;
SET @sql = IF(@fk_exists > 0,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP FOREIGN KEY ', @fk_name),
CONCAT('SELECT ''', @tbl_name, '.', @fk_name, ' does not exist''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- DROP INDEX uk_diagnostic_result_order_id
SET @idx_name = 'uk_diagnostic_result_order_id';
SET @idx_exists = 0;
PREPARE chk_idx FROM 'SELECT COUNT(*) INTO @idx_exists FROM information_schema.statistics WHERE table_schema = ? AND table_name = ? AND index_name = ?';
EXECUTE chk_idx USING @schema_name, @tbl_name, @idx_name;
DEALLOCATE PREPARE chk_idx;
SET @sql = IF(@idx_exists > 0,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP INDEX ', @idx_name),
CONCAT('SELECT ''', @tbl_name, '.', @idx_name, ' does not exist''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Relax NOT NULL so new rows (which no longer set diagnostic_order_id) can still be inserted
SET @col_name = 'diagnostic_order_id';
SET @is_nullable = '';
PREPARE chk_null FROM 'SELECT IS_NULLABLE INTO @is_nullable FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_null USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_null;
SET @sql = IF(@is_nullable = 'NO',
CONCAT('ALTER TABLE ', @tbl_name, ' MODIFY COLUMN ', @col_name, ' BIGINT NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already nullable''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ADD CONSTRAINT uk_diagnostic_result_external_order_id UNIQUE (external_order_id)
SET @uk_name = 'uk_diagnostic_result_external_order_id';
SET @uk_exists = 0;
PREPARE chk_uk FROM 'SELECT COUNT(*) INTO @uk_exists FROM information_schema.statistics WHERE table_schema = ? AND table_name = ? AND index_name = ?';
EXECUTE chk_uk USING @schema_name, @tbl_name, @uk_name;
DEALLOCATE PREPARE chk_uk;
SET @sql = IF(@uk_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD CONSTRAINT ', @uk_name, ' UNIQUE (external_order_id)'),
CONCAT('SELECT ''', @tbl_name, '.', @uk_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------
SET @tbl_name = 'tb_diagnostic_document';

-- ADD COLUMN external_order_id
SET @col_name = 'external_order_id';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(100) NULL AFTER diagnostic_order_id'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- DROP FOREIGN KEY fk_diagnostic_document_order
SET @fk_name = 'fk_diagnostic_document_order';
SET @fk_exists = 0;
PREPARE chk_fk FROM 'SELECT COUNT(*) INTO @fk_exists FROM information_schema.table_constraints WHERE table_schema = ? AND table_name = ? AND constraint_name = ? AND constraint_type = ''FOREIGN KEY''';
EXECUTE chk_fk USING @schema_name, @tbl_name, @fk_name;
DEALLOCATE PREPARE chk_fk;
SET @sql = IF(@fk_exists > 0,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP FOREIGN KEY ', @fk_name),
CONCAT('SELECT ''', @tbl_name, '.', @fk_name, ' does not exist''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- DROP INDEX uk_diagnostic_document_order_doctype
SET @idx_name = 'uk_diagnostic_document_order_doctype';
SET @idx_exists = 0;
PREPARE chk_idx FROM 'SELECT COUNT(*) INTO @idx_exists FROM information_schema.statistics WHERE table_schema = ? AND table_name = ? AND index_name = ?';
EXECUTE chk_idx USING @schema_name, @tbl_name, @idx_name;
DEALLOCATE PREPARE chk_idx;
SET @sql = IF(@idx_exists > 0,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP INDEX ', @idx_name),
CONCAT('SELECT ''', @tbl_name, '.', @idx_name, ' does not exist''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ADD CONSTRAINT uk_diagnostic_document_external_order_id_doctype UNIQUE (external_order_id, document_type)
SET @uk_name = 'uk_diagnostic_document_external_order_id_doctype';
SET @uk_exists = 0;
PREPARE chk_uk FROM 'SELECT COUNT(*) INTO @uk_exists FROM information_schema.statistics WHERE table_schema = ? AND table_name = ? AND index_name = ?';
EXECUTE chk_uk USING @schema_name, @tbl_name, @uk_name;
DEALLOCATE PREPARE chk_uk;
SET @sql = IF(@uk_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD CONSTRAINT ', @uk_name, ' UNIQUE (external_order_id, document_type)'),
CONCAT('SELECT ''', @tbl_name, '.', @uk_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;