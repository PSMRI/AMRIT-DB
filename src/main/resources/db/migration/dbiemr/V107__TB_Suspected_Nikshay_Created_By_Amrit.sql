USE db_iemr;

-- ============================================================
-- tb_suspected: add nikshay_created_by_amrit
-- ============================================================

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_suspected';

SET @col_name = 'nikshay_created_by_amrit';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' TINYINT(1) NULL DEFAULT NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
