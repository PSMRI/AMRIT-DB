USE db_iemr;

SET @schema = 'db_iemr';

SET @table = 'form_fields';

SET @col = 'state_code';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT "state_code already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'is_editable';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT "is_editable already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table = 'campaign_filariasis_mda';

SET @col = 'mda_photos';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` JSON NULL DEFAULT NULL'),
    'SELECT "mda_photos already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @constraint_exists = (
  SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = 'screening_aesje'
    AND CONSTRAINT_NAME = 'screening_aesje_chk_1'
);
SET @drop_sql = IF(@constraint_exists > 0,
  'ALTER TABLE screening_aesje DROP CHECK screening_aesje_chk_1',
  'SELECT 1'
);
PREPARE stmt FROM @drop_sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

ALTER TABLE screening_aesje
MODIFY follow_up_point INT DEFAULT NULL;


ALTER TABLE t_anc_visit
MODIFY lmp_date DATETIME NULL DEFAULT NULL;


SET @constraint_exists = (
  SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = 'asha_profile'
    AND CONSTRAINT_NAME = 'asha_profile_chk_10'
);
SET @drop_sql = IF(@constraint_exists > 0,
  'ALTER TABLE asha_profile DROP CONSTRAINT asha_profile_chk_10',
  'SELECT 1'
);
PREPARE stmt FROM @drop_sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @constraint_exists = (
  SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = 'asha_profile'
    AND CONSTRAINT_NAME = 'chk_abha_number'
);
SET @add_sql = IF(@constraint_exists = 0,
  'ALTER TABLE asha_profile ADD CONSTRAINT chk_abha_number CHECK (`abha_number` REGEXP ''^[0-9]{14}$'')',
  'SELECT 1'
);
PREPARE stmt FROM @add_sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;