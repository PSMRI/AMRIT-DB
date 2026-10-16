USE db_identity;

-- =========================================================
-- i_beneficiarydetails_rmnch (RMNCHBeneficiaryDetailsRmnch)
-- Reverts the column drop done in V28: gpsLatitude / gpsLongitude
-- are needed again on this table.
--
-- Re-adds gpsLatitude / gpsLongitude as DOUBLE NULL (same
-- definition as V17). The columns come back empty - no data is
-- copied from latitude / longitude, which are left untouched.
-- =========================================================

SET @schema_name = 'db_identity';
SET @tbl_name = 'i_beneficiarydetails_rmnch';

SET @tbl_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;

-- Re-add the gps columns
SET @col_name = 'gpsLatitude';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' DOUBLE NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' add skipped''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'gpsLongitude';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' DOUBLE NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' add skipped''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET @sql := NULL;
