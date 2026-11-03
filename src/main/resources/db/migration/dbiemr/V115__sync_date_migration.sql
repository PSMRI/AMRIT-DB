use db_iemr;

SET @schema_name = 'db_iemr';

SET @tbl_name = 'general_opd_entry';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_part1
-- ==========================
SET @tbl_name = 't_hbnc_part1';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_part2
-- ==========================
SET @tbl_name = 't_hbnc_part2';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_visit
-- ==========================
SET @tbl_name = 't_hbnc_visit';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_visit_card
-- ==========================
SET @tbl_name = 't_hbnc_visit_card';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbyc
-- ==========================
SET @tbl_name = 't_hbyc';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbyc_child_visits
-- ==========================
SET @tbl_name = 't_hbyc_child_visits';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: high_risk_assess
-- ==========================
SET @tbl_name = 'high_risk_assess';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_ifa_distribution
-- ==========================
SET @tbl_name = 't_ifa_distribution';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_ifa_distribution_data
-- ==========================
SET @tbl_name = 't_ifa_distribution_data';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: m_incentive_activity_lang_mapping
-- ==========================
SET @tbl_name = 'm_incentive_activity_lang_mapping';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: incentive_activity_record
-- ==========================
SET @tbl_name = 'incentive_activity_record';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: incentive_pending_activity
-- ==========================
SET @tbl_name = 'incentive_pending_activity';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_infant_register
-- ==========================
SET @tbl_name = 't_infant_register';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: irs_round
-- ==========================
SET @tbl_name = 'irs_round';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: leprosy_follow_up
-- ==========================
SET @tbl_name = 'leprosy_follow_up';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: maa_meeting
-- ==========================
SET @tbl_name = 'maa_meeting';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: malaria_follow_up
-- ==========================
SET @tbl_name = 'malaria_follow_up';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_mda_distribution_data
-- ==========================
SET @tbl_name = 't_mda_distribution_data';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_mdsr
-- ==========================
SET @tbl_name = 't_mdsr';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_micro_birth_plan
-- ==========================
SET @tbl_name = 't_micro_birth_plan';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: i_mobilization_mosquito_net
-- ==========================
SET @tbl_name = 'i_mobilization_mosquito_net';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: non_pregnant_high_risk_assess
-- ==========================
SET @tbl_name = 'non_pregnant_high_risk_assess';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: non_pregnant_high_risk_track
-- ==========================
SET @tbl_name = 'non_pregnant_high_risk_track';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: notification
-- ==========================
SET @tbl_name = 'notification';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_ors_distribution
-- ==========================
SET @tbl_name = 't_ors_distribution';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ==========================
-- Table: phc_review_meeting
-- ==========================
SET @tbl_name = 'phc_review_meeting';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_pmsma
-- ==========================
SET @tbl_name = 't_pmsma';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_pnc_visit
-- ==========================
SET @tbl_name = 't_pnc_visit';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: pregnant_high_risk_assess
-- ==========================
SET @tbl_name = 'pregnant_high_risk_assess';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: pregnant_high_risk_track
-- ==========================
SET @tbl_name = 'pregnant_high_risk_track';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_pregnant_woman_register
-- ==========================
SET @tbl_name = 't_pregnant_woman_register';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: campaign_pulse_polio
-- ==========================
SET @tbl_name = 'campaign_pulse_polio';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: sammelan_attachment
-- ==========================
SET @tbl_name = 'sammelan_attachment';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: sammelan_record
-- ==========================
SET @tbl_name = 'sammelan_record';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_sam_visit
-- ==========================
SET @tbl_name = 't_sam_visit';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_aesje
-- ==========================
SET @tbl_name = 'screening_aesje';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_filaria
-- ==========================
SET @tbl_name = 'screening_filaria';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_kala_azar
-- ==========================
SET @tbl_name = 'screening_kala_azar';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_leprosy
-- ==========================
SET @tbl_name = 'screening_leprosy';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_malaria
-- ==========================
SET @tbl_name = 'screening_malaria';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_diagnostics
-- ==========================
SET @tbl_name = 'tb_stoptb_diagnostics';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_general_examination
-- ==========================
SET @tbl_name = 'tb_stoptb_general_examination';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_general_opd
-- ==========================
SET @tbl_name = 'tb_stoptb_general_opd';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_confirmed_cases
-- ==========================
SET @tbl_name = 'tb_confirmed_cases';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @tbl_name = 'tb_diagnostic_order';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

-- synced_by
SET @col_name = 'synced_by';
SET @col_exists = 0;

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- synced_date
SET @col_name = 'synced_date';
SET @col_exists = 0;

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tbl_name = 'm_incentive_activity';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

-- synced_by
SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "m_incentive_activity.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- synced_date
SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "m_incentive_activity.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tbl_name = 't_cdr';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);


-- synced_by
SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "t_cdr.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- synced_date
SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "t_cdr.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



SET @tbl_name = 'anc_counselling_care';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);


SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "anc_counselling_care.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "anc_counselling_care.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_eligible_couple_register';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);


SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "t_eligible_couple_register.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "t_eligible_couple_register.synced_date already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
-- ==========================
-- Table: t_ors_distribution
-- ==========================
SET @tbl_name = 'campaign_ors';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @tbl_name = 'campaign_filariasis_mda';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = 0;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@col_exists = 0 AND @tbl_exists > 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @tbl_name = 'asha_profile';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "asha_profile.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "asha_profile.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tbl_name = 't_anc_visit';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "t_anc_visit.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "t_anc_visit.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_name = 't_eye_checkup';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);


-- synced_by
SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "t_eye_checkup.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- synced_date
SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "t_eye_checkup.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tbl_name = 'uwin_session_record';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

-- synced_by
SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "ELIGIBLE_COUPLE_TRACKING.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- synced_date
SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "ELIGIBLE_COUPLE_TRACKING.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tbl_name = 'ELIGIBLE_COUPLE_TRACKING';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

-- synced_by
SET @col_name = 'synced_by';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_by` VARCHAR(255) DEFAULT NULL'
    ),
    'SELECT "ELIGIBLE_COUPLE_TRACKING.synced_by already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- synced_date
SET @col_name = 'synced_date';

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = @schema_name
  AND table_name = @tbl_name
  AND column_name = @col_name;

SET @sql = IF(
    @col_exists = 0 AND @tbl_exists > 0,
    CONCAT(
        'ALTER TABLE `', @schema_name, '`.`', @tbl_name,
        '` ADD COLUMN `synced_date` TIMESTAMP NULL DEFAULT NULL'
    ),
    'SELECT "ELIGIBLE_COUPLE_TRACKING.synced_date already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

CREATE TABLE if not exists db_iemr.`tb_tpt_follow_up` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,

    `ben_id` BIGINT DEFAULT NULL,
    `household_id` BIGINT DEFAULT NULL,
    `regimen_type` VARCHAR(250) DEFAULT NULL,

    `treatment_start_date` TIMESTAMP NULL DEFAULT NULL,
    `expected_treatment_completion_date` TIMESTAMP NULL DEFAULT NULL,

    `follow_up_date` TIMESTAMP NULL DEFAULT NULL,
    `follow_up_month` VARCHAR(250) DEFAULT NULL,
    `adherence_to_medicines` VARCHAR(250) DEFAULT NULL,
    `any_discomfort` BIT(1) DEFAULT NULL,

    `treatment_completed` BIT(1) DEFAULT NULL,
    `actual_treatment_completion_date` TIMESTAMP NULL DEFAULT NULL,

    `tpt_outcome` VARCHAR(100) DEFAULT NULL,
    `date_of_death` TIMESTAMP NULL DEFAULT NULL,
    `place_of_death` VARCHAR(100) DEFAULT NULL,
    `reason_for_death` VARCHAR(255) DEFAULT NULL,

    `created_date` TIMESTAMP NULL DEFAULT NULL,
    `updated_date` TIMESTAMP NULL DEFAULT NULL,

    `created_by` VARCHAR(255) DEFAULT NULL,
    `updated_by` VARCHAR(255) DEFAULT NULL,
    `synced_by` VARCHAR(255) DEFAULT NULL,
    `user_id` INT DEFAULT NULL,

    PRIMARY KEY (`id`),

    KEY `idx_tb_tpt_follow_up_ben_id` (`ben_id`),
    KEY `idx_tb_tpt_follow_up_household_id` (`household_id`),
    KEY `idx_tb_tpt_follow_up_user_id` (`user_id`)

);