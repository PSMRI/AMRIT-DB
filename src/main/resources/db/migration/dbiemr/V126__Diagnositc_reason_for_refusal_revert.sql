USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 'tb_diagnostic_order';

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
