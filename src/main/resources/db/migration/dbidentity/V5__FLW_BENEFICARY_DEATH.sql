-- use db_identity;
-- -- add beneficiary death column (make idempotent: add only if not exists)
-- alter table i_beneficiarydetails_rmnch add column if not exists isDeath TINYINT(1) DEFAULT 0;
-- alter table i_beneficiarydetails_rmnch add column if not exists isDeathValue VARCHAR(50) DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists timeOfDeath VARCHAR(20) DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists reasonOfDeath VARCHAR(255) DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists reasonOfDeathId INT DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists placeOfDeath VARCHAR(255) DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists placeOfDeathId INT DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists otherPlaceOfDeath VARCHAR(255) DEFAULT NULL;
-- alter table i_beneficiarydetails_rmnch add column if not exists dateOfDeath VARCHAR(200) DEFAULT NULL;





USE db_identity;

-- Function to safely add columns
SET @tbl := 'i_beneficiarydetails_rmnch';

-- isDeath
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN isDeath TINYINT(1) DEFAULT 0;',
        'SELECT "Column isDeath already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'isDeath'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- isDeathValue
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN isDeathValue VARCHAR(50) DEFAULT NULL;',
        'SELECT "Column isDeathValue already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'isDeathValue'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- timeOfDeath
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN timeOfDeath VARCHAR(20) DEFAULT NULL;',
        'SELECT "Column timeOfDeath already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'timeOfDeath'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- reasonOfDeath
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN reasonOfDeath VARCHAR(255) DEFAULT NULL;',
        'SELECT "Column reasonOfDeath already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'reasonOfDeath'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- reasonOfDeathId
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN reasonOfDeathId INT DEFAULT NULL;',
        'SELECT "Column reasonOfDeathId already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'reasonOfDeathId'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- placeOfDeath
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN placeOfDeath VARCHAR(255) DEFAULT NULL;',
        'SELECT "Column placeOfDeath already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'placeOfDeath'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- placeOfDeathId
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN placeOfDeathId INT DEFAULT NULL;',
        'SELECT "Column placeOfDeathId already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'placeOfDeathId'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- otherPlaceOfDeath
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN otherPlaceOfDeath VARCHAR(255) DEFAULT NULL;',
        'SELECT "Column otherPlaceOfDeath already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'otherPlaceOfDeath'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- dateOfDeath
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD COLUMN dateOfDeath VARCHAR(200) DEFAULT NULL;',
        'SELECT "Column dateOfDeath already exists";'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = @tbl
      AND COLUMN_NAME = 'dateOfDeath'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
