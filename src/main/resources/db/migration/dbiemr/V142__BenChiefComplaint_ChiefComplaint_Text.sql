USE db_iemr;

SET @schema_name = 'db_iemr';
SET @tbl_name = 't_benchiefcomplaint';
SET @col_name = 'ChiefComplaint';

SET @col_type = NULL;
PREPARE chk_col FROM 'SELECT DATA_TYPE INTO @col_type FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;

SET @sql = IF(@col_type = 'varchar',
CONCAT('ALTER TABLE ', @tbl_name, ' MODIFY COLUMN ', @col_name, ' TEXT NULL DEFAULT NULL'),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' is ', IFNULL(@col_type, 'missing'), ', not changed'''));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
