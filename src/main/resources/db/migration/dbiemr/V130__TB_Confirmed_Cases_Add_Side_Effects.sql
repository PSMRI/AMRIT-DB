USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_confirmed_cases';

SET @col_name = 'side_effects';
SET @tbl_exists = 0;
SET @col_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' TEXT NULL'),
IF(@tbl_exists = 0,
CONCAT('SELECT ''', @tbl_name, ' does not exist'''),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
