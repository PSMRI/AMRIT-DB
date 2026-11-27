USE db_identity;

-- Consent Manager (DPDPA): why a consent was withdrawn (Consent-API API 11).
-- A WITHDRAWAL event in cm_consent stores the reason code the user picked and their remarks.
-- withdrawal_remarks is free text and may hold personal data, so Consent-API stores it encrypted
-- (FieldEncryptor, AES-256-GCM, Base64). Both columns are NULL on every other event type.
-- Additive and idempotent: each column is added only when missing. Nothing is dropped or renamed.

SET @dbname = 'db_identity';
SET @tablename = 'cm_consent';

SET @columnname = 'withdrawal_reason';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(50) NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @columnname = 'withdrawal_remarks';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TEXT NULL')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
