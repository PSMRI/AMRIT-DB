USE db_iemr;

ALTER TABLE screening_kala_azar
MODIFY id BIGINT(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE screening_filaria
MODIFY id BIGINT(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE screening_aesje
MODIFY id BIGINT(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE irs_round
MODIFY COLUMN round_number INT NULL,
MODIFY COLUMN round_date TIMESTAMP NULL,
MODIFY COLUMN updated_by VARCHAR(200) NULL;

SET @dbname = 'db_iemr';
SET @tablename = 'irs_round';

SET @columnname = 'irs_date';
SET @preparedStatement = (SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname AND TABLE_NAME=@tablename AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN irs_date DATE DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @columnname = 'round';
SET @preparedStatement = (SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname AND TABLE_NAME=@tablename AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN round INT DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @columnname = 'householdId';
SET @preparedStatement = (SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname AND TABLE_NAME=@tablename AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN householdId BIGINT DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @columnname = 'created_by';
SET @preparedStatement = (SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname AND TABLE_NAME=@tablename AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN created_by VARCHAR(255) DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @columnname = 'user_id';
SET @preparedStatement = (SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname AND TABLE_NAME=@tablename AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN user_id INT DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;