use db_identity;

USE db_identity;

-- i_beneficiaryfamilymapping
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryfamilymapping'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiaryfamilymapping'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiarydetails
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarydetails'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiarydetails'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiarymapping
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarymapping'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarymapping
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiarymapping'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiaryidentity
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryidentity'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryidentity
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiaryidentity'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiaryimage
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryimage'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryimage
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiaryimage'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiaryservicemapping
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryservicemapping'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryservicemapping
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiaryservicemapping'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- m_beneficiaryregidmapping
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'm_beneficiaryregidmapping'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on m_beneficiaryregidmapping'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiarycontacts
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarycontacts'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarycontacts
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiarycontacts'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- i_beneficiaryconsent
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryconsent'
      AND index_name = 'idx_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryconsent
     ADD INDEX idx_CreatedBy (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_CreatedBy already exists on i_beneficiaryconsent'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;