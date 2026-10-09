USE db_iemr;

SET @schema_name = 'db_iemr';

SET @tbl_name = 'asha_supervisor_mapping';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_phy_anthropometry';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_benchiefcomplaint';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'i_ben_flow_outreach';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @tbl_name = 't_phy_vitals';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_benreferdetails';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @tbl_name = 't_benvisitdetail';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @tbl_name = 't_cbacdetails';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_child_register';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'cdtf_visit_details';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_delivery_outcome';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_diagnostic_document';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_diagnostic_provider_token';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_diagnostic_result';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_option_condition';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'm_otp_beneficiary';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_Phy_GeneralExam';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_pnccare';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_prescribeddrug';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_prescription';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_question_option';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_question_response';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_question_validation';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_stoptb_registration';

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_confirmed_cases';

-- modified_by
SET @col_name = 'modified_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- last_mod_date
SET @col_name = 'last_mod_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- vanID
SET @col_name = 'vanID';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- parkingPlaceID
SET @col_name = 'parkingPlaceID';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- processed
SET @col_name = 'processed';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT ''N'''), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- vanSerialNo
SET @col_name = 'vanSerialNo';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- benRegID
SET @col_name = 'benRegID';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- providerServiceMapID
SET @col_name = 'providerServiceMapID';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- created_by
SET @col_name = 'created_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

CREATE TABLE if not exists `tb_referral_follow_up` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `ben_id` bigint DEFAULT NULL,
   `household_id` bigint DEFAULT NULL,
   `referred_on_date` timestamp NULL DEFAULT NULL,
   `follow_up_date` timestamp NULL DEFAULT NULL,
   `follow_up_status` varchar(250) DEFAULT NULL,
   `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `created_by` varchar(100) DEFAULT NULL,
   `updated_by` varchar(100) DEFAULT NULL,
   `synced_by` varchar(100) DEFAULT NULL,
   `user_id` int DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `idx_tb_referral_follow_up_ben_id` (`ben_id`),
   KEY `idx_tb_referral_follow_up_household_id` (`household_id`),
   KEY `idx_tb_referral_follow_up_user_id` (`user_id`)
 );

 SET @tbl_name = 'm_immunizationservicevaccination';

 SET @col_name = 'synced_by';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 SET @col_name = 'synced_date';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 -- ==========================
 -- Table: VHND_form
 -- ==========================

 SET @tbl_name = 'VHND_form';

 SET @col_name = 'synced_by';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 SET @col_name = 'synced_date';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


 -- ==========================
 -- Table: ahd_form
 -- ==========================

 SET @tbl_name = 'ahd_form';

 SET @col_name = 'synced_by';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 SET @col_name = 'synced_date';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 -- ==========================
 -- Table: deworming_form
 -- ==========================

 SET @tbl_name = 'deworming_form';

 SET @col_name = 'synced_by';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 SET @col_name = 'synced_date';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


 -- ==========================
 -- Table: adolescent_health
 -- ==========================

 SET @tbl_name = 'adolescent_health';

 SET @col_name = 'synced_by';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

 SET @col_name = 'synced_date';
 SET @col_exists = 0;
 PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
 EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
 DEALLOCATE PREPARE chk_col;
 SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- ==========================
-- Table: tb_suspected
-- ==========================
SET @tbl_name = 'tb_suspected';

SET @col_name = 'created_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;




