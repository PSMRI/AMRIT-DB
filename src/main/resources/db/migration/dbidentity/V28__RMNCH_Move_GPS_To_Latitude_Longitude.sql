USE db_identity;

-- =========================================================
-- i_beneficiarydetails_rmnch (RMNCHBeneficiaryDetailsRmnch)
-- GPS coordinates are now stored in latitude / longitude
-- instead of gpsLatitude / gpsLongitude.
--
-- 1. Widen latitude / longitude from FLOAT(20,5) to DECIMAL(10,7):
--    FLOAT keeps only ~7 significant digits, so copying the
--    DOUBLE gps values into it as-is would lose precision.
--    DECIMAL also matches the BigDecimal fields in the entities.
-- 2. Backfill latitude / longitude from gpsLatitude / gpsLongitude,
--    only where latitude / longitude is NULL and the gps value is
--    NOT NULL. Existing latitude / longitude values are kept.
-- 3. Drop gpsLatitude / gpsLongitude: no entity maps them on
--    this table, and their data now lives in latitude / longitude.
-- =========================================================

SET @old_safe_updates := @@SQL_SAFE_UPDATES;
set sql_safe_updates=0;

SET @schema_name = 'db_identity';
SET @tbl_name = 'i_beneficiarydetails_rmnch';

SET @tbl_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;

SET @sql = IF(@tbl_exists = 1,
'ALTER TABLE i_beneficiarydetails_rmnch MODIFY COLUMN latitude DECIMAL(10,7) NULL, MODIFY COLUMN longitude DECIMAL(10,7) NULL',
'SELECT ''i_beneficiarydetails_rmnch latitude/longitude widen skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'gpsLatitude';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'UPDATE i_beneficiarydetails_rmnch SET latitude = gpsLatitude WHERE latitude IS NULL AND gpsLatitude IS NOT NULL',
'SELECT ''i_beneficiarydetails_rmnch.latitude backfill skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'gpsLongitude';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
'UPDATE i_beneficiarydetails_rmnch SET longitude = gpsLongitude WHERE longitude IS NULL AND gpsLongitude IS NOT NULL',
'SELECT ''i_beneficiarydetails_rmnch.longitude backfill skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Drop the old gps columns (only after both backfills above have run)
SET @col_name = 'gpsLatitude';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP COLUMN ', @col_name),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' drop skipped''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'gpsLongitude';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists = 1 AND @col_exists = 1,
CONCAT('ALTER TABLE ', @tbl_name, ' DROP COLUMN ', @col_name),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' drop skipped''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Cleanup
SET sql_safe_updates = @old_safe_updates;
SET @old_safe_updates := NULL, @sql := NULL;
