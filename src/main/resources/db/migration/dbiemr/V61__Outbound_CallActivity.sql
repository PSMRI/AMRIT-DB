USE db_iemr;

CREATE TABLE IF NOT EXISTS m_outbound_call_activity (  
    ActivityID BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    ActivityName VARCHAR(100) NOT NULL,  
    IsActive BOOLEAN DEFAULT TRUE,  
    CreatedBy VARCHAR(50),  
    CreatedDate DATETIME,  
    ModifiedBy VARCHAR(50),  
    LastModDate DATETIME  
);

SET @dbname = 'db_iemr';
SET @tablename = 't_104CoMoOutboundCallDetails';
SET @columnname = 'ActivityID';

SET @preparedStatement = (
SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname 
  AND TABLE_NAME=@tablename 
  AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN ActivityID BIGINT(20) DEFAULT NULL;')
));

PREPARE stmt FROM @preparedStatement; 
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

SET @columnname = 'CallStatus';

SET @preparedStatement = (
SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname 
  AND TABLE_NAME=@tablename 
  AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN CallStatus VARCHAR(50) DEFAULT NULL;')
));

PREPARE stmt FROM @preparedStatement; 
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

SET @columnname = 'CallRemarks';

SET @preparedStatement = (
SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname 
  AND TABLE_NAME=@tablename 
  AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN CallRemarks VARCHAR(500) DEFAULT NULL;')
));

PREPARE stmt FROM @preparedStatement; 
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

SET @columnname = 'CzentrixCallID';

SET @preparedStatement = (
SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname 
  AND TABLE_NAME=@tablename 
  AND COLUMN_NAME=@columnname) > 0,
 'ALTER TABLE db_iemr.t_104CoMoOutboundCallDetails MODIFY COLUMN CzentrixCallID VARCHAR(30);',
 'SELECT 1'
));

PREPARE stmt FROM @preparedStatement; 
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

