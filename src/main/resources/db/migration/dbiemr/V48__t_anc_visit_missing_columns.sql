USE db_iemr;

SET @dbname = 'db_iemr';
SET @tablename = 't_anc_visit';

SET @columnname = 'file_path';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'serial_no';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'method_of_termination';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'method_of_termination_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'termination_done_by';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'termination_done_by_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'is_paiucd_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'is_paiucd';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'remarks';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(500);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'abortion_img1';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'abortion_img2';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'place_of_death';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'place_of_death_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'other_place_of_death';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'visit_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP NULL;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'lmp_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP NULL;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'is_YesOrNo';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' BOOLEAN;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'date_of_sterilisation';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP NULL;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

