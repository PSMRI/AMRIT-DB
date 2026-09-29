use db_iemr;

SET @schema_name = 'db_iemr';

SET @tbl_name = 'general_opd_entry';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_part1
-- ==========================
SET @tbl_name = 't_hbnc_part1';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_part2
-- ==========================
SET @tbl_name = 't_hbnc_part2';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_visit
-- ==========================
SET @tbl_name = 't_hbnc_visit';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbnc_visit_card
-- ==========================
SET @tbl_name = 't_hbnc_visit_card';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbyc
-- ==========================
SET @tbl_name = 't_hbyc';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_hbyc_child_visits
-- ==========================
SET @tbl_name = 't_hbyc_child_visits';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: high_risk_assess
-- ==========================
SET @tbl_name = 'high_risk_assess';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_ifa_distribution
-- ==========================
SET @tbl_name = 't_ifa_distribution';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_ifa_distribution_data
-- ==========================
SET @tbl_name = 't_ifa_distribution_data';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: m_incentive_activity_lang_mapping
-- ==========================
SET @tbl_name = 'm_incentive_activity_lang_mapping';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: incentive_activity_record
-- ==========================
SET @tbl_name = 'incentive_activity_record';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: incentive_pending_activity
-- ==========================
SET @tbl_name = 'incentive_pending_activity';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_infant_register
-- ==========================
SET @tbl_name = 't_infant_register';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: irs_round
-- ==========================
SET @tbl_name = 'irs_round';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: leprosy_follow_up
-- ==========================
SET @tbl_name = 'leprosy_follow_up';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: maa_meeting
-- ==========================
SET @tbl_name = 'maa_meeting';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: malaria_follow_up
-- ==========================
SET @tbl_name = 'malaria_follow_up';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_mda_distribution_data
-- ==========================
SET @tbl_name = 't_mda_distribution_data';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_mdsr
-- ==========================
SET @tbl_name = 't_mdsr';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_micro_birth_plan
-- ==========================
SET @tbl_name = 't_micro_birth_plan';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: i_mobilization_mosquito_net
-- ==========================
SET @tbl_name = 'i_mobilization_mosquito_net';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: non_pregnant_high_risk_assess
-- ==========================
SET @tbl_name = 'non_pregnant_high_risk_assess';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: non_pregnant_high_risk_track
-- ==========================
SET @tbl_name = 'non_pregnant_high_risk_track';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: notification
-- ==========================
SET @tbl_name = 'notification';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_ors_distribution
-- ==========================
SET @tbl_name = 't_ors_distribution';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ==========================
-- Table: phc_review_meeting
-- ==========================
SET @tbl_name = 'phc_review_meeting';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_pmsma
-- ==========================
SET @tbl_name = 't_pmsma';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_pnc_visit
-- ==========================
SET @tbl_name = 't_pnc_visit';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: pregnant_high_risk_assess
-- ==========================
SET @tbl_name = 'pregnant_high_risk_assess';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: pregnant_high_risk_track
-- ==========================
SET @tbl_name = 'pregnant_high_risk_track';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_pregnant_woman_register
-- ==========================
SET @tbl_name = 't_pregnant_woman_register';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: campaign_pulse_polio
-- ==========================
SET @tbl_name = 'campaign_pulse_polio';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: sammelan_attachment
-- ==========================
SET @tbl_name = 'sammelan_attachment';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: sammelan_record
-- ==========================
SET @tbl_name = 'sammelan_record';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: t_sam_visit
-- ==========================
SET @tbl_name = 't_sam_visit';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_aesje
-- ==========================
SET @tbl_name = 'screening_aesje';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_filaria
-- ==========================
SET @tbl_name = 'screening_filaria';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_kala_azar
-- ==========================
SET @tbl_name = 'screening_kala_azar';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_leprosy
-- ==========================
SET @tbl_name = 'screening_leprosy';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: screening_malaria
-- ==========================
SET @tbl_name = 'screening_malaria';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_diagnostics
-- ==========================
SET @tbl_name = 'tb_stoptb_diagnostics';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_general_examination
-- ==========================
SET @tbl_name = 'tb_stoptb_general_examination';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_general_opd
-- ==========================
SET @tbl_name = 'tb_stoptb_general_opd';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_stoptb_registration
-- ==========================
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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================
-- Table: tb_confirmed_cases
-- ==========================
SET @tbl_name = 'tb_confirmed_cases';

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
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP DEFAULT CURRENT_TIMESTAMP'), CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
