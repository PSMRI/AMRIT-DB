USE db_iemr;

CREATE TABLE IF NOT EXISTS `incentive_pending_activity` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `activity_id` bigint NOT NULL,
   `record_id` bigint NOT NULL,
   `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `user_id` int NOT NULL,
   `m_incentive_id` int DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `idx_module_record` (`record_id`),
   KEY `idx_dates` (`created_date`,`updated_date`)
 );

SET @schema = 'db_iemr';
SET @table  = 'incentive_activity_record';

-- 1. approval_status
SET @col = 'approval_status';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` INT DEFAULT 101'),
    'SELECT "approval_status already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 2. verifiedBy_userId
SET @col = 'verifiedBy_userId';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT "verifiedBy_userId already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 3. verifiedBy_userName
SET @col = 'verifiedBy_userName';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(250) NULL DEFAULT NULL'),
    'SELECT "verifiedBy_userName already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 4. reason
SET @col = 'reason';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(5000) NULL DEFAULT NULL'),
    'SELECT "reason already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 5. other_reason
SET @col = 'other_reason';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(2000) NULL DEFAULT NULL'),
    'SELECT "other_reason already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 6. is_claimed
SET @col = 'is_claimed';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TINYINT(1) DEFAULT 0'),
    'SELECT "is_claimed already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 7. approval_date
SET @col = 'approval_date';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` DATETIME NULL DEFAULT NULL'),
    'SELECT "approval_date already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 8. calimed_date
SET @col = 'calimed_date';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` DATETIME NULL DEFAULT NULL'),
    'SELECT "calimed_date already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 9. is_default_activity default fix (NULL -> '0')
SET @col = 'is_default_activity';
SET @sql = (
  SELECT IF(COUNT(*) > 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ALTER COLUMN `', @col, '` SET DEFAULT 0'),
    'SELECT "is_default_activity column not found"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;