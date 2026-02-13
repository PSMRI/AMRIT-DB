USE db_iemr;

SET @dbname = 'db_iemr';

SET @tablename = 'screening_kala_azar';

SET @preparedStatement = (
SELECT IF(
 (SELECT EXTRA
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname
  AND TABLE_NAME=@tablename
  AND COLUMN_NAME='id') LIKE '%auto_increment%',
 'SELECT 1',
 CONCAT('ALTER TABLE ', @dbname, '.', @tablename,
        ' MODIFY id BIGINT(20) NOT NULL AUTO_INCREMENT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tablename = 'screening_filaria';

SET @preparedStatement = (
SELECT IF(
 (SELECT EXTRA
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname
  AND TABLE_NAME=@tablename
  AND COLUMN_NAME='id') LIKE '%auto_increment%',
 'SELECT 1',
 CONCAT('ALTER TABLE ', @dbname, '.', @tablename,
        ' MODIFY id BIGINT(20) NOT NULL AUTO_INCREMENT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @tablename = 'screening_aesje';

SET @preparedStatement = (
SELECT IF(
 (SELECT EXTRA
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname
  AND TABLE_NAME=@tablename
  AND COLUMN_NAME='id') LIKE '%auto_increment%',
 'SELECT 1',
 CONCAT('ALTER TABLE ', @dbname, '.', @tablename,
        ' MODIFY id BIGINT(20) NOT NULL AUTO_INCREMENT;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
