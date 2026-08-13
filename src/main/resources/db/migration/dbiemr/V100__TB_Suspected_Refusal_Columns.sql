
USE db_iemr;

-- ============================================================
-- tb_suspected: add reason-for-refusal columns + mdr_rif_result
-- ============================================================

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_suspected';

SET @col_name = 'reason_for_refusal_xray';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(255) NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'reason_for_refusal_mtb';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(255) NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'reason_for_refusal_mdrrif';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(255) NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'reason_for_refusal_sputum';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(255) NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_name = 'mdr_rif_result';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' VARCHAR(255) NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;