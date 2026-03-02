USE db_iemr;

CREATE TABLE IF NOT EXISTS m_outbound_call_activity (
    ActivityID BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ActivityName VARCHAR(100) NOT NULL UNIQUE,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedBy VARCHAR(50),
    CreatedDate DATETIME,
    ModifiedBy VARCHAR(50),
    LastModDate DATETIME
);

-- Add index on CreatedDate and IsActive for m_outbound_call_activity
CREATE INDEX IF NOT EXISTS idx_outbound_activity_created_date 
    ON m_outbound_call_activity (CreatedDate);

CREATE INDEX IF NOT EXISTS idx_outbound_activity_is_active 
    ON m_outbound_call_activity (IsActive);

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

-- Add FK constraint on ActivityID if not already present
SET @constraintname = 'fk_outbound_call_activity';

SET @preparedStatement = (
SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   WHERE CONSTRAINT_SCHEMA = @dbname
   AND TABLE_NAME = @tablename
   AND CONSTRAINT_NAME = @constraintname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename,
         ' ADD CONSTRAINT ', @constraintname,
         ' FOREIGN KEY (ActivityID)',
         ' REFERENCES ', @dbname, '.m_outbound_call_activity(ActivityID);')
));

PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Add index on ActivityID for FK performance
SET @indexname = 'idx_outbound_call_activity_id';

SET @preparedStatement = (
SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
   WHERE TABLE_SCHEMA = @dbname
   AND TABLE_NAME = @tablename
   AND INDEX_NAME = @indexname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename,
         ' ADD INDEX ', @indexname, ' (ActivityID);')
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
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' MODIFY COLUMN CzentrixCallID VARCHAR(30);'),
 'SELECT 1'
));

PREPARE stmt FROM @preparedStatement; 
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

SET @columnname = 'BeneficiaryPhoneNumber';

SET @preparedStatement = (
SELECT IF(
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@dbname 
  AND TABLE_NAME=@tablename 
  AND COLUMN_NAME=@columnname) > 0,
 'SELECT 1',
 CONCAT('ALTER TABLE ',@dbname,'.',@tablename,
        ' ADD COLUMN BeneficiaryPhoneNumber VARCHAR(255) DEFAULT NULL;')
));

PREPARE stmt FROM @preparedStatement; 
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;