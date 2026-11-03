
USE db_identity;

-- =========================================================
-- i_beneficiaryaddress (MBeneficiaryaddress)
-- gpsLatitude / gpsLongitude / digipin / gpsTimestamp /
-- isGpsUnavailable / gpsUnavailableReason removed: never
-- updated after registration (IdentityEditMapper never
-- mapped them), so edited beneficiaries always end up with
-- NULL here anyway.
-- =========================================================

SET @schema_name = 'db_identity';
SET @tbl_name = 'i_beneficiaryaddress';

SET @tbl_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;

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

SET @col_name = 'digipin';
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

SET @col_name = 'gpsTimestamp';
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

SET @col_name = 'isGpsUnavailable';
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

SET @col_name = 'gpsUnavailableReason';
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