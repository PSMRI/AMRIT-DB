USE db_iemr;

SET @schema = 'db_iemr';
SET @table = 'tb_diagnostic_document';

SET @col = 'docsProcessed';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(1) NOT NULL DEFAULT ''N'''),
    'SELECT "docsProcessed already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'docSyncedDate';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` DATETIME NULL'),
    'SELECT "docSyncedDate already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'docSyncFailureReason';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TEXT NULL'),
    'SELECT "docSyncFailureReason already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 's3_path';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(512) NULL'),
    'SELECT "s3_path already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
