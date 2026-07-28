-- ==========================================================
-- Add place of current living related columns to beneficiary
-- tables.
--
-- Safe to execute multiple times. Each column is added only
-- if it does not already exist.
-- ==========================================================

USE db_identity;

-- ==========================================================
-- i_beneficiarydetails
-- ==========================================================

-- placeOfCurrentLiving
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN placeOfCurrentLiving VARCHAR(255) NULL;',
        'SELECT "placeOfCurrentLiving already exists in i_beneficiarydetails";')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'placeOfCurrentLiving'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- otherPlaceOfCurrentLiving
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN otherPlaceOfCurrentLiving VARCHAR(255) NULL;',
        'SELECT "otherPlaceOfCurrentLiving already exists in i_beneficiarydetails";')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'otherPlaceOfCurrentLiving'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- institutionName
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN institutionName VARCHAR(255) NULL;',
        'SELECT "institutionName already exists in i_beneficiarydetails";')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'institutionName'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- i_beneficiarydetails_rmnch
-- ==========================================================

-- placeOfCurrentLiving
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN placeOfCurrentLiving VARCHAR(255) NULL;',
        'SELECT "placeOfCurrentLiving already exists in i_beneficiarydetails_rmnch";')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails_rmnch'
      AND COLUMN_NAME = 'placeOfCurrentLiving'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- otherPlaceOfCurrentLiving
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN otherPlaceOfCurrentLiving VARCHAR(255) NULL;',
        'SELECT "otherPlaceOfCurrentLiving already exists in i_beneficiarydetails_rmnch";')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails_rmnch'
      AND COLUMN_NAME = 'otherPlaceOfCurrentLiving'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- institutionName
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN institutionName VARCHAR(255) NULL;',
        'SELECT "institutionName already exists in i_beneficiarydetails_rmnch";')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails_rmnch'
      AND COLUMN_NAME = 'institutionName'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;