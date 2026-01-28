-- Date: 2026-01-27

USE db_iemr;

-- Set database name variable
SET @dbname = 'db_iemr';

-- ============================================================================
-- TABLE: screening_aesje
-- Description: Update column names and add new columns
-- ============================================================================

-- Rename houseHoldDetailsId to house_hold_details_Id
SET @tablename = 'screening_aesje';
SET @old_columnname = 'houseHoldDetailsId';
SET @new_columnname = 'house_hold_details_Id';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @old_columnname
  ) > 0,
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' CHANGE COLUMN ', @old_columnname, ' ', @new_columnname, ' BIGINT NOT NULL;'),
  'SELECT 1'
));
PREPARE alterIfExists FROM @preparedStatement;
EXECUTE alterIfExists;
DEALLOCATE PREPARE alterIfExists;

-- Rename userID to user_id
SET @old_columnname = 'userID';
SET @new_columnname = 'user_id';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @old_columnname
  ) > 0,
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' CHANGE COLUMN ', @old_columnname, ' ', @new_columnname, ' INT;'),
  'SELECT 1'
));
PREPARE alterIfExists FROM @preparedStatement;
EXECUTE alterIfExists;
DEALLOCATE PREPARE alterIfExists;

-- Rename diseaseTypeID to disease_type_id
SET @old_columnname = 'diseaseTypeID';
SET @new_columnname = 'disease_type_id';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @old_columnname
  ) > 0,
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' CHANGE COLUMN ', @old_columnname, ' ', @new_columnname, ' INT;'),
  'SELECT 1'
));
PREPARE alterIfExists FROM @preparedStatement;
EXECUTE alterIfExists;
DEALLOCATE PREPARE alterIfExists;

-- Add refer_to_name column if it doesn't exist
SET @columnname = 'refer_to_name';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100) DEFAULT NULL;')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add beneficiary_status_id column if it doesn't exist
SET @columnname = 'beneficiary_status_id';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT NULL;')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Modify id column to AUTO_INCREMENT
ALTER TABLE screening_aesje MODIFY COLUMN id BIGINT NOT NULL AUTO_INCREMENT;

-- ============================================================================
-- TABLE: t_cdr
-- Description: Add image and audit columns
-- ============================================================================
SET @tablename = 't_cdr';

-- Add cdr_image_1 column if it doesn't exist
SET @columnname = 'cdr_image_1';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add cdr_image_2 column if it doesn't exist
SET @columnname = 'cdr_image_2';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add death_cert_image_1 column if it doesn't exist
SET @columnname = 'death_cert_image_1';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add death_cert_image_2 column if it doesn't exist
SET @columnname = 'death_cert_image_2';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add updated_by column if it doesn't exist
SET @columnname = 'updated_by';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add updated_at column if it doesn't exist
SET @columnname = 'updated_at';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- ============================================================================
-- TABLE: t_mdsr
-- Description: Add file upload and audit columns
-- ============================================================================
SET @tablename = 't_mdsr';

-- Add updated_by column if it doesn't exist
SET @columnname = 'updated_by';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add mdsr1_file column if it doesn't exist
SET @columnname = 'mdsr1_file';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add mdsr2_file column if it doesn't exist
SET @columnname = 'mdsr2_file';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add mdsr_death_cert_file column if it doesn't exist
SET @columnname = 'mdsr_death_cert_file';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add updated_at column if it doesn't exist
SET @columnname = 'updated_at';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- ============================================================================
-- TABLE: maa_meeting
-- Description: Create new table for MAA meeting records
-- ============================================================================
CREATE TABLE IF NOT EXISTS maa_meeting (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    meeting_date DATE,
    place VARCHAR(255),
    participants INT,
    quarter INT,
    year INT,
    asha_id INT,
    meeting_images LONGTEXT,
    village_name VARCHAR(255),
    no_of_pragnent_women INT,
    no_of_lacting_mother INT,
    mitanin_activity_checkList VARCHAR(255),
    created_by VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: malaria_follow_up
-- Description: Create new table for malaria follow-up records
-- ============================================================================
CREATE TABLE IF NOT EXISTS malaria_follow_up (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ben_id BIGINT NOT NULL,
    house_hold_details_id BIGINT NOT NULL,
    user_id INT,
    disease_id BIGINT NOT NULL,
    date_of_diagnosis DATE NOT NULL,
    treatment_start_date DATE NOT NULL,
    treatment_given VARCHAR(255) NOT NULL,
    days VARCHAR(50) NOT NULL,
    treatment_completion_date DATE,
    referral_date DATE,
    treatment_days VARCHAR(10) DEFAULT NULL,
    case_status_id BIGINT DEFAULT NULL,
    disease_type_id INT DEFAULT NULL,
    visit_date DATE DEFAULT NULL,
    visit_id MEDIUMTEXT,
    malaria_slide_test_type VARCHAR(200) DEFAULT NULL,
    malaria_test_type VARCHAR(200) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY fk_disease_id_new (disease_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: t_anc_visit
-- Description: Add multiple columns for ANC visit tracking
-- ============================================================================
SET @tablename = 't_anc_visit';

-- Add file_path column if it doesn't exist
SET @columnname = 'file_path';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add serial_no column if it doesn't exist
SET @columnname = 'serial_no';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add method_of_termination column if it doesn't exist
SET @columnname = 'method_of_termination';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add method_of_termination_id column if it doesn't exist
SET @columnname = 'method_of_termination_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add termination_done_by column if it doesn't exist
SET @columnname = 'termination_done_by';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add termination_done_by_id column if it doesn't exist
SET @columnname = 'termination_done_by_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add is_paiucd column if it doesn't exist
SET @columnname = 'is_paiucd';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(50);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add is_paiucd_id column if it doesn't exist
SET @columnname = 'is_paiucd_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add remarks column if it doesn't exist
SET @columnname = 'remarks';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(500);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add abortion_img1 column if it doesn't exist
SET @columnname = 'abortion_img1';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add abortion_img2 column if it doesn't exist
SET @columnname = 'abortion_img2';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add place_of_death column if it doesn't exist
SET @columnname = 'place_of_death';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add place_of_death_id column if it doesn't exist
SET @columnname = 'place_of_death_id';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add other_place_of_death column if it doesn't exist
SET @columnname = 'other_place_of_death';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add visit_date column if it doesn't exist
SET @columnname = 'visit_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add lmp_date column if it doesn't exist
SET @columnname = 'lmp_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add is_YesOrNo column if it doesn't exist
SET @columnname = 'is_YesOrNo';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' BOOLEAN;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add date_of_sterilisation column if it doesn't exist
SET @columnname = 'date_of_sterilisation';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add place_of_anc column if it doesn't exist
SET @columnname = 'place_of_anc';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add place_of_ancId column if it doesn't exist
SET @columnname = 'place_of_ancId';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- ============================================================================
-- TABLE: anc_counselling_care
-- Description: Create new table for ANC counselling care records
-- ============================================================================
CREATE TABLE IF NOT EXISTS anc_counselling_care (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    beneficiary_id BIGINT NOT NULL,
    visit_date DATE,
    home_visit_date DATE NOT NULL,
    anc_visit_id BIGINT NOT NULL,
    user_id INT,
    created_by VARCHAR(100),
    updated_by VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    select_all BOOLEAN DEFAULT FALSE,
    swelling BOOLEAN DEFAULT FALSE,
    high_bp BOOLEAN DEFAULT FALSE,
    convulsions BOOLEAN DEFAULT FALSE,
    anemia BOOLEAN DEFAULT FALSE,
    reduced_fetal_movement BOOLEAN DEFAULT FALSE,
    age_risk BOOLEAN DEFAULT FALSE,
    child_gap BOOLEAN DEFAULT FALSE,
    short_height BOOLEAN DEFAULT FALSE,
    pre_preg_weight BOOLEAN DEFAULT FALSE,
    bleeding BOOLEAN DEFAULT FALSE,
    miscarriage_history BOOLEAN DEFAULT FALSE,
    four_plus_delivery BOOLEAN DEFAULT FALSE,
    first_delivery BOOLEAN DEFAULT FALSE,
    twin_pregnancy BOOLEAN DEFAULT FALSE,
    c_section_history BOOLEAN DEFAULT FALSE,
    pre_existing_disease BOOLEAN DEFAULT FALSE,
    fever_malaria BOOLEAN DEFAULT FALSE,
    jaundice BOOLEAN DEFAULT FALSE,
    sickle_cell BOOLEAN DEFAULT FALSE,
    prolonged_labor BOOLEAN DEFAULT FALSE,
    malpresentation BOOLEAN DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: t_delivery_outcome
-- Description: Add audit columns
-- ============================================================================
SET @tablename = 't_delivery_outcome';

-- Add updated_by column if it doesn't exist
SET @columnname = 'updated_by';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(100);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add created_date column if it doesn't exist
SET @columnname = 'created_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP DEFAULT CURRENT_TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add updated_date column if it doesn't exist
SET @columnname = 'updated_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- ============================================================================
-- TABLE: t_infant_register
-- Description: Add discharge summary image columns
-- ============================================================================
SET @tablename = 't_infant_register';

-- Add delivery_discharge_summary1 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary1';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary2 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary2';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary3 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary3';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary4 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary4';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add is_sncu column if it doesn't exist
SET @columnname = 'is_sncu';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(50);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- ============================================================================
-- TABLE: t_pnc_visit
-- Description: Add sterilization date and discharge summary images
-- ============================================================================
SET @tablename = 't_pnc_visit';

-- Add steilisation_date column if it doesn't exist
SET @columnname = 'steilisation_date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP;')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary_image1 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary_image1';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary_image2 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary_image2';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary_image3 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary_image3';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;

-- Add delivery_discharge_summary_image4 column if it doesn't exist
SET @columnname = 'delivery_discharge_summary_image4';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255);')
));
PREPARE alterIfNotExists FROM @preparedStatement; EXECUTE alterIfNotExists; DEALLOCATE PREPARE alterIfNotExists;