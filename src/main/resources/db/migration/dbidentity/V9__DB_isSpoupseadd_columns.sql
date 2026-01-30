USE db_identity;

-- i_beneficiarydetails_rmnch: add isSpouseAdded
SET @dbname = 'db_identity';
SET @tablename = 'i_beneficiarydetails_rmnch';

SET @columnname = 'isSpouseAdded';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TINYINT(1) DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
