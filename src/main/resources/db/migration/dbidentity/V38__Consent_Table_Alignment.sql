USE db_identity;

-- Consent Manager (DPDPA): standard AMRIT audit and sync columns on every cm_ table (Consent-API feature 009).
-- Same pattern as V8: each table is altered only if its new columns are not there yet, so the script can be
-- run again safely. Nothing is dropped or renamed, and no personal data is added.
--
-- 1. All 14 cm_ tables get Processed, VanSerialNo, VanID, VehicalNo, ParkingPlaceID, SyncedBy, SyncedDate
--    (same types as i_beneficiaryconsent).
-- 2. cm_consent, cm_consent_purpose and cm_audit_log also get CreatedBy, CreatedDate, ModifiedBy, LastModDate,
--    Deleted (the other cm_ tables already have them).
-- 3. Existing rows of those three tables are filled in, then CreatedBy is made NOT NULL.
-- The cm_audit_log hash does not use any of these columns, so the hash chain is not affected.
-- Run as the migration user (the cm_audit_log grant script only blocks UPDATE for the application user).

SET @dbname = 'db_identity';

-- 1. Van/sync columns on all cm_ tables

-- cm_purpose
SET @tablename = 'cm_purpose';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_notice
SET @tablename = 'cm_notice';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_notice_translation
SET @tablename = 'cm_notice_translation';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_notice_purpose
SET @tablename = 'cm_notice_purpose';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_consent
SET @tablename = 'cm_consent';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_consent_purpose
SET @tablename = 'cm_consent_purpose';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_consent_evidence
SET @tablename = 'cm_consent_evidence';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_guardian_link
SET @tablename = 'cm_guardian_link';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_audit_log
SET @tablename = 'cm_audit_log';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_access_grant
SET @tablename = 'cm_access_grant';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_consent_notification
SET @tablename = 'cm_consent_notification';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_notice_request
SET @tablename = 'cm_notice_request';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_legacy_batch
SET @tablename = 'cm_legacy_batch';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_legacy_row
SET @tablename = 'cm_legacy_row';
SET @columnname = 'Processed';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN Processed CHAR(4) NOT NULL DEFAULT ''N'', ADD COLUMN VanSerialNo BIGINT NULL, ADD COLUMN VanID INT NULL, ADD COLUMN VehicalNo VARCHAR(30) NULL, ADD COLUMN ParkingPlaceID INT NULL, ADD COLUMN SyncedBy VARCHAR(30) NULL, ADD COLUMN SyncedDate DATETIME NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 2. Audit columns on the append-only tables

-- cm_consent
SET @tablename = 'cm_consent';
SET @columnname = 'CreatedBy';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN CreatedBy VARCHAR(50) NULL, ADD COLUMN CreatedDate DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3), ADD COLUMN ModifiedBy VARCHAR(50) NULL, ADD COLUMN LastModDate DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3), ADD COLUMN Deleted BIT(1) NOT NULL DEFAULT b''0''')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_consent_purpose
SET @tablename = 'cm_consent_purpose';
SET @columnname = 'CreatedBy';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN CreatedBy VARCHAR(50) NULL, ADD COLUMN CreatedDate DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3), ADD COLUMN ModifiedBy VARCHAR(50) NULL, ADD COLUMN LastModDate DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3), ADD COLUMN Deleted BIT(1) NOT NULL DEFAULT b''0''')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- cm_audit_log
SET @tablename = 'cm_audit_log';
SET @columnname = 'CreatedBy';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN CreatedBy VARCHAR(50) NULL, ADD COLUMN CreatedDate DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3), ADD COLUMN ModifiedBy VARCHAR(50) NULL, ADD COLUMN LastModDate DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3), ADD COLUMN Deleted BIT(1) NOT NULL DEFAULT b''0''')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 3. Fill in existing rows (only rows without CreatedBy, so a second run changes nothing).
--    LastModDate is set too, so it keeps the original time instead of the migration time.
UPDATE cm_consent
SET CreatedBy = CAST(captured_by AS CHAR),
    CreatedDate = server_received_at,
    LastModDate = server_received_at
WHERE CreatedBy IS NULL;

UPDATE cm_consent_purpose p
JOIN cm_consent c ON c.consent_id = p.consent_id
SET p.CreatedBy = c.CreatedBy,
    p.CreatedDate = c.server_received_at,
    p.LastModDate = c.server_received_at
WHERE p.CreatedBy IS NULL;

UPDATE cm_audit_log
SET CreatedBy = COALESCE(CAST(initiator AS CHAR), 'consent-system'),
    CreatedDate = created_at,
    LastModDate = created_at
WHERE CreatedBy IS NULL;

-- Every row now has CreatedBy: make it NOT NULL, as on the other cm_ tables.
ALTER TABLE cm_consent MODIFY CreatedBy VARCHAR(50) NOT NULL;
ALTER TABLE cm_consent_purpose MODIFY CreatedBy VARCHAR(50) NOT NULL;
ALTER TABLE cm_audit_log MODIFY CreatedBy VARCHAR(50) NOT NULL;
