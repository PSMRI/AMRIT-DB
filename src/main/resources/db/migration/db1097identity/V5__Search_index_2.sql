use db_1097_identity

-- Flyway migration friendly script for MySQL
-- Creates indexes only if they do not already exist

-- idx_contact_phones
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiarycontacts'
      AND index_name = 'idx_contact_phones'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD INDEX idx_contact_phones (PreferredPhoneNum, PhoneNum1, PhoneNum2, PhoneNum3, PhoneNum4, PhoneNum5, EmergencyContactNum)',
    'SELECT ''idx_contact_phones already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_mapping_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiarymapping'
      AND index_name = 'idx_mapping_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD INDEX idx_mapping_van (VanSerialNo, VanID)',
    'SELECT ''idx_mapping_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_address_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiaryaddress'
      AND index_name = 'idx_address_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryaddress ADD INDEX idx_address_van (VanSerialNo, VanID)',
    'SELECT ''idx_address_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_consent_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiaryconsent'
      AND index_name = 'idx_consent_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryconsent ADD INDEX idx_consent_van (VanSerialNo, VanID)',
    'SELECT ''idx_consent_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_contact_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiarycontacts'
      AND index_name = 'idx_contact_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarycontacts ADD INDEX idx_contact_van (VanSerialNo, VanID)',
    'SELECT ''idx_contact_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_detail_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiarydetails'
      AND index_name = 'idx_detail_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD INDEX idx_detail_van (VanSerialNo, VanID)',
    'SELECT ''idx_detail_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_regid_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'm_beneficiaryregidmapping'
      AND index_name = 'idx_regid_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping ADD INDEX idx_regid_van (VanSerialNo, VanID)',
    'SELECT ''idx_regid_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_account_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiaryaccount'
      AND index_name = 'idx_account_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryaccount ADD INDEX idx_account_van (VanSerialNo, VanID)',
    'SELECT ''idx_account_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_image_van
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiaryimage'
      AND index_name = 'idx_image_van'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryimage ADD INDEX idx_image_van (VanSerialNo, VanID)',
    'SELECT ''idx_image_van already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- idx_mapping_contact
SET @idx_exists = (
    SELECT COUNT(1)
    FROM information_schema.statistics
    WHERE table_schema = DATABASE()
      AND table_name = 'i_beneficiarymapping'
      AND index_name = 'idx_mapping_contact'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarymapping ADD INDEX idx_mapping_contact (BenContactsId)',
    'SELECT ''idx_mapping_contact already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;