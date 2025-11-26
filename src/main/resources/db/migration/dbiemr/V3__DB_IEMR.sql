-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_iemr
-- ------------------------------------------------------
-- Server version	5.7.19-log
 use db_iemr;
--
-- Table structure for table `asha_profile`
--

CREATE TABLE IF NOT EXISTS `asha_profile` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `name` varchar(255) NOT NULL,
   `village` varchar(255) NOT NULL,
   `employee_id` varchar(100) NOT NULL,
   `dob` varchar(15) DEFAULT NULL,
   `mobile_number` varchar(10) NOT NULL CHECK (`mobile_number` regexp '^[6789][0-9]{9}$'),
   `alternate_mobile_number` varchar(10) DEFAULT NULL CHECK (`alternate_mobile_number` regexp '^[6789][0-9]{9}$'),
   `father_or_spouse_name` varchar(255) NOT NULL,
   `date_of_joining` varchar(15) DEFAULT NULL,
   `bank_account` varchar(18) NOT NULL CHECK (`bank_account` regexp '^[0-9]{9,18}$'),
   `ifsc` varchar(11) DEFAULT NULL CHECK (`ifsc` regexp '^[A-Z]{4}[0-9]{7}$'),
   `population_covered` int(11) NOT NULL CHECK (`population_covered` > 0),
   `cho_name` varchar(255) NOT NULL,
   `cho_mobile` varchar(10) NOT NULL CHECK (`cho_mobile` regexp '^[6789][0-9]{9}$'),
   `aww_name` varchar(255) NOT NULL,
   `aww_mobile` varchar(10) NOT NULL CHECK (`aww_mobile` regexp '^[6789][0-9]{9}$'),
   `anm1_name` varchar(255) NOT NULL,
   `anm1_mobile` varchar(10) NOT NULL CHECK (`anm1_mobile` regexp '^[6789][0-9]{9}$'),
   `anm2_name` varchar(255) NOT NULL,
   `anm2_mobile` varchar(10) NOT NULL CHECK (`anm2_mobile` regexp '^[6789][0-9]{9}$'),
   `abha_number` varchar(14) NOT NULL CHECK (`abha_number` regexp '^[A-Za-z0-9]{14}$'),
   `asha_household_registration` varchar(255) NOT NULL,
   `asha_family_member` varchar(255) NOT NULL,
   `ProviderServiceMapID` varchar(100) DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `employee_id` (`employee_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `m_otp_beneficiary`
--

CREATE TABLE IF NOT EXISTS `m_otp_beneficiary` (
   `Id` int(11) NOT NULL AUTO_INCREMENT,
   `phoneNumber` varchar(45) NOT NULL,
   `isOtpVerify` tinyint(1) DEFAULT 0,
   `otp` int(11) NOT NULL,
   `createdAt` timestamp NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`Id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `t_micro_birth_plan`
--

CREATE TABLE IF NOT EXISTS `t_micro_birth_plan` (
   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   `contact_no_1` varchar(10) DEFAULT NULL,
   `contact_no_2` varchar(10) DEFAULT NULL,
   `sc_hwc_tg_hosp` varchar(100) DEFAULT NULL,
   `block` varchar(100) DEFAULT NULL,
   `nearest_sc_hwc` varchar(100) DEFAULT NULL,
   `nearest_phc` varchar(100) DEFAULT NULL,
   `nearest_fru` varchar(100) DEFAULT NULL,
   `nearest_usg` varchar(100) DEFAULT NULL,
   `blood_group` varchar(10) DEFAULT NULL,
   `blood_donors` varchar(50) DEFAULT NULL,
   `birth_companion` varchar(50) DEFAULT NULL,
   `child_caretaker` varchar(50) DEFAULT NULL,
   `community_support` varchar(100) DEFAULT NULL,
   `transportation_mode` varchar(100) DEFAULT NULL,
   `user_id` bigint(20) NOT NULL,
   `community_support_contact` varchar(11) DEFAULT NULL,
   `ben_id` bigint(20) DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


-- ALTER TABLE eligible_couple_tracking 
-- ADD COLUMN  lmp_date VARCHAR(50) DEFAULT NULL;

-- ALTER TABLE t_eligible_couple_register 
-- ADD COLUMN  lmp_date VARCHAR(50) DEFAULT NULL;

-- ALTER TABLE t_anc_visit 
-- ADD COLUMN  file_path VARCHAR(500) DEFAULT NULL;

-- ALTER TABLE asha_profile 
-- ADD COLUMN  profileImage VARCHAR(1000) DEFAULT NULL;

-- ALTER TABLE asha_profile 
-- ADD COLUMN  supervisorName VARCHAR(225) DEFAULT NULL;

-- ALTER TABLE asha_profile 
-- ADD COLUMN  supervisorMobile VARCHAR(225) DEFAULT NULL;

-- ALTER TABLE asha_profile 
-- ADD COLUMN  isFatherOrSpouse TINYINT(1) DEFAULT NULL;
use db_iemr;



-- Function: Safely add a column if it does NOT exist
SET @run := '';

-- eligible_couple_tracking.lmp_date
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='eligible_couple_tracking' 
       AND COLUMN_NAME='lmp_date') = 0,
    'ALTER TABLE db_iemr.eligible_couple_tracking ADD COLUMN lmp_date VARCHAR(50) DEFAULT NULL;',
    'SELECT "eligible_couple_tracking.lmp_date already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- t_eligible_couple_register.lmp_date
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='t_eligible_couple_register' 
       AND COLUMN_NAME='lmp_date') = 0,
    'ALTER TABLE db_iemr.t_eligible_couple_register ADD COLUMN lmp_date VARCHAR(50) DEFAULT NULL;',
    'SELECT "t_eligible_couple_register.lmp_date already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- t_anc_visit.file_path
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='t_anc_visit' 
       AND COLUMN_NAME='file_path') = 0,
    'ALTER TABLE db_iemr.t_anc_visit ADD COLUMN file_path VARCHAR(500) DEFAULT NULL;',
    'SELECT "t_anc_visit.file_path already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- asha_profile.profileImage
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='asha_profile' 
       AND COLUMN_NAME='profileImage') = 0,
    'ALTER TABLE db_iemr.asha_profile ADD COLUMN profileImage VARCHAR(1000) DEFAULT NULL;',
    'SELECT "asha_profile.profileImage already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- asha_profile.supervisorName
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='asha_profile' 
       AND COLUMN_NAME='supervisorName') = 0,
    'ALTER TABLE db_iemr.asha_profile ADD COLUMN supervisorName VARCHAR(225) DEFAULT NULL;',
    'SELECT "asha_profile.supervisorName already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- asha_profile.supervisorMobile
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='asha_profile' 
       AND COLUMN_NAME='supervisorMobile') = 0,
    'ALTER TABLE db_iemr.asha_profile ADD COLUMN supervisorMobile VARCHAR(225) DEFAULT NULL;',
    'SELECT "asha_profile.supervisorMobile already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- asha_profile.isFatherOrSpouse
SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA='db_iemr' 
       AND TABLE_NAME='asha_profile' 
       AND COLUMN_NAME='isFatherOrSpouse') = 0,
    'ALTER TABLE db_iemr.asha_profile ADD COLUMN isFatherOrSpouse TINYINT(1) DEFAULT NULL;',
    'SELECT "asha_profile.isFatherOrSpouse already exists";'
) INTO @run;
PREPARE stmt FROM @run; EXECUTE stmt; DEALLOCATE PREPARE stmt;
