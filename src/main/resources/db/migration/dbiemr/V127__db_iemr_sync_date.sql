USE db_iemr;

SET @schema_name = 'db_iemr';


-- ----- tb_suspected -----
SET @tbl_name = 'tb_suspected';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'modified_by';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'parkingPlaceID';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` INT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'processed';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT ''N'''),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'benRegId';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'created_date';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_by';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ----- tb_screening -----
SET @tbl_name = 'tb_screening';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'failure_to_gainWeight';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TINYINT(1) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'decreased_activity_playfulness';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TINYINT(1) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ----- malaria_follow_up -----
SET @tbl_name = 'malaria_follow_up';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'modified_by';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'last_mod_date';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ----- user_fcm_tokens -----
SET @tbl_name = 'user_fcm_tokens';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'synced_by';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` VARCHAR(255) DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'synced_date';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TIMESTAMP NULL DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- ----- m_otp_beneficiary -----
SET @tbl_name = 'm_otp_beneficiary';
SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = @schema_name AND table_name = @tbl_name);

SET @col_name = 'beneficiaryId';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` BIGINT DEFAULT NULL'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_name = 'isExpired';
SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @schema_name AND table_name = @tbl_name AND column_name = @col_name);
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
    CONCAT('ALTER TABLE `', @schema_name, '`.`', @tbl_name, '` ADD COLUMN `', @col_name, '` TINYINT(1) DEFAULT 0'),
    CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' skipped (table missing or column exists)'''));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;