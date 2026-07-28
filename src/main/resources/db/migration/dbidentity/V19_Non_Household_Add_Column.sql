-- ==========================================================
-- Add place of current living related columns to beneficiary
-- and household tables.
--
-- Safe to execute multiple times.
-- Each column is added only if it does not already exist.
-- MODIFY statements execute only if the target column exists.
-- ==========================================================

USE db_identity;

-- ==========================================================
-- i_beneficiarydetails
-- ==========================================================

-- placeOfCurrentLiving
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails ADD COLUMN placeOfCurrentLiving VARCHAR(255) NULL;',
        'SELECT ''placeOfCurrentLiving already exists in i_beneficiarydetails'';')
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
        'SELECT ''otherPlaceOfCurrentLiving already exists in i_beneficiarydetails'';')
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
        'SELECT ''institutionName already exists in i_beneficiarydetails'';')
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
        'SELECT ''placeOfCurrentLiving already exists in i_beneficiarydetails_rmnch'';')
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
        'SELECT ''otherPlaceOfCurrentLiving already exists in i_beneficiarydetails_rmnch'';')
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
        'SELECT ''institutionName already exists in i_beneficiarydetails_rmnch'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails_rmnch'
      AND COLUMN_NAME = 'institutionName'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- i_householddetails
-- ==========================================================

-- address
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN address VARCHAR(500) NULL;',
        'SELECT ''address already exists in i_householddetails'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_householddetails'
      AND COLUMN_NAME = 'address'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- totalHhMembers
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN totalHhMembers INT NULL;',
        'SELECT ''totalHhMembers already exists in i_householddetails'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_householddetails'
      AND COLUMN_NAME = 'totalHhMembers'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- registeredAtCampSite
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN registeredAtCampSite VARCHAR(255) NULL;',
        'SELECT ''registeredAtCampSite already exists in i_householddetails'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_householddetails'
      AND COLUMN_NAME = 'registeredAtCampSite'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- registeredAtCampSiteId
SET @sql = (
    SELECT IF(COUNT(*) = 0,
        'ALTER TABLE db_identity.i_householddetails ADD COLUMN registeredAtCampSiteId INT NULL;',
        'SELECT ''registeredAtCampSiteId already exists in i_householddetails'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_householddetails'
      AND COLUMN_NAME = 'registeredAtCampSiteId'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- Modify isGpsUnavailable in i_beneficiarydetails_rmnch
-- ==========================================================

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch MODIFY COLUMN isGpsUnavailable TINYINT(1) NULL DEFAULT 0;',
        'SELECT ''isGpsUnavailable does not exist in i_beneficiarydetails_rmnch'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails_rmnch'
      AND COLUMN_NAME = 'isGpsUnavailable'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- Modify isGpsUnavailable in i_householddetails
-- ==========================================================

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        'ALTER TABLE db_identity.i_householddetails MODIFY COLUMN isGpsUnavailable TINYINT(1) NULL DEFAULT 0;',
        'SELECT ''isGpsUnavailable does not exist in i_householddetails'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_householddetails'
      AND COLUMN_NAME = 'isGpsUnavailable'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ==========================================================
-- Modify isGpsUnavailable in i_beneficiaryaddress
-- ==========================================================

SET @sql = (
    SELECT IF(COUNT(*) = 1,
        'ALTER TABLE db_identity.i_beneficiaryaddress MODIFY COLUMN isGpsUnavailable TINYINT(1) NULL DEFAULT 0;',
        'SELECT ''isGpsUnavailable does not exist in i_beneficiaryaddress'';')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiaryaddress'
      AND COLUMN_NAME = 'isGpsUnavailable'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;