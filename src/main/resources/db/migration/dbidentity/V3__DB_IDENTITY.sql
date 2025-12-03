USE db_identity;

-- Add column: i_beneficiarydetails.isConsent
SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'isConsent'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN isConsent VARCHAR(50) DEFAULT NULL;',
    'SELECT "Column isConsent already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;




-- Add column: i_bornbirthdeatils.birthCertificateFileFrontView

SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_bornbirthdeatils'
      AND COLUMN_NAME = 'birthCertificateFileFrontView'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE db_identity.i_bornbirthdeatils ADD COLUMN birthCertificateFileFrontView VARCHAR(500) DEFAULT NULL;',
    'SELECT "Column birthCertificateFileFrontView already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;




-- Add column: i_bornbirthdeatils.birthCertificateFileBackView

SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_bornbirthdeatils'
      AND COLUMN_NAME = 'birthCertificateFileBackView'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE db_identity.i_bornbirthdeatils ADD COLUMN birthCertificateFileBackView VARCHAR(500) DEFAULT NULL;',
    'SELECT "Column birthCertificateFileBackView already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
