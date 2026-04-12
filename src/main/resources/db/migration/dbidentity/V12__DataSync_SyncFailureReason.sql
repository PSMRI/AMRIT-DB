USE db_identity;

-- i_beneficiaryaccount
SET @tbl := 'i_beneficiaryaccount';
SET @col := 'SyncFailureReason';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiaryaddress
SET @tbl := 'i_beneficiaryaddress';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiarycontacts
SET @tbl := 'i_beneficiarycontacts';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiaryconsent
SET @tbl := 'i_beneficiaryconsent';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiarydetails
SET @tbl := 'i_beneficiarydetails';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiaryfamilymapping
SET @tbl := 'i_beneficiaryfamilymapping';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiaryidentity
SET @tbl := 'i_beneficiaryidentity';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiaryimage
SET @tbl := 'i_beneficiaryimage';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiarymapping
SET @tbl := 'i_beneficiarymapping';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- i_beneficiaryservicemapping
SET @tbl := 'i_beneficiaryservicemapping';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- m_beneficiaryregidmapping
SET @tbl := 'm_beneficiaryregidmapping';
SET @sql := (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE db_identity.', @tbl, ' ADD COLUMN ', @col, ' VARCHAR(500);'),
        CONCAT('SELECT "Column ', @col, ' already exists in ', @tbl, '";')
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = @tbl AND COLUMN_NAME = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
