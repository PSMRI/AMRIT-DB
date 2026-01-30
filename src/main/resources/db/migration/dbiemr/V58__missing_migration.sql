USE db_iemr;

CREATE TABLE IF NOT EXISTS `i_mobilization_mosquito_net` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `beneficiary_id` bigint DEFAULT NULL,
   `household_id` bigint DEFAULT NULL,
   `visit_date` date DEFAULT NULL,
   `user_name` varchar(255) DEFAULT NULL,
   `user_id` int DEFAULT NULL,
   `is_net_distributed` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 CREATE TABLE IF NOT EXISTS `t_hbyc_child_visits` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `beneficiary_id` bigint NOT NULL,
    `hbyc_due_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `hbyc_visit_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_baby_alive` tinyint(1) DEFAULT '1',
    `date_of_death` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `reason_for_death` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `place_of_death` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `other_place_of_death` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `baby_weight` decimal(3,1) DEFAULT NULL,
    `is_child_sick` tinyint(1) DEFAULT NULL,
    `is_exclusive_breastfeeding` tinyint(1) DEFAULT NULL,
    `is_mother_counseled_exbf` tinyint(1) DEFAULT NULL,
    `has_child_started_complementary_feeding` tinyint(1) DEFAULT NULL,
    `is_mother_counseled_cf` tinyint(1) DEFAULT NULL,
    `is_weight_recorded_by_aww` tinyint(1) DEFAULT NULL,
    `is_developmental_delay` tinyint(1) DEFAULT NULL,
    `is_measles_vaccine_given` tinyint(1) DEFAULT NULL,
    `is_vitamin_a_given` tinyint(1) DEFAULT NULL,
    `is_ors_available` tinyint(1) DEFAULT NULL,
    `is_ifa_syrup_available` tinyint(1) DEFAULT NULL,
    `is_ors_given` tinyint(1) DEFAULT NULL,
    `is_ifa_syrup_given` tinyint(1) DEFAULT NULL,
    `is_handwashing_counseling_given` tinyint(1) DEFAULT NULL,
    `is_parenting_counseling_given` tinyint(1) DEFAULT NULL,
    `is_family_planning_counseling_given` tinyint(1) DEFAULT NULL,
    `diarrhoea_episode` tinyint(1) DEFAULT NULL,
    `pneumonia_symptoms` tinyint(1) DEFAULT NULL,
    `temperature` decimal(4,1) DEFAULT NULL,
    `mcp_card_images` json DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    `household_id` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `visit_day` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_complementary_feeding` tinyint(1) DEFAULT NULL,
    `is_breathing_difficulty` tinyint(1) DEFAULT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


  -- t_pnc_visit: add missing columns for PNCVisit entity (safe: add only if not exists)
  SET @dbname = 'db_iemr';
  SET @tablename = 't_pnc_visit';

  SET @columnname = 'steilisation_date';
  SET @preparedStatement = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
    'SELECT 1',
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TIMESTAMP NULL;')
  ));
  PREPARE stmt FROM @preparedStatement;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  SET @columnname = 'delivery_discharge_summary_image1';
  SET @preparedStatement = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
    'SELECT 1',
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255) DEFAULT NULL;')
  ));
  PREPARE stmt FROM @preparedStatement;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  SET @columnname = 'delivery_discharge_summary_image2';
  SET @preparedStatement = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
    'SELECT 1',
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255) DEFAULT NULL;')
  ));
  PREPARE stmt FROM @preparedStatement;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  SET @columnname = 'delivery_discharge_summary_image3';
  SET @preparedStatement = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
    'SELECT 1',
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255) DEFAULT NULL;')
  ));
  PREPARE stmt FROM @preparedStatement;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  SET @columnname = 'delivery_discharge_summary_image4';
  SET @preparedStatement = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
    'SELECT 1',
    CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255) DEFAULT NULL;')
  ));
  PREPARE stmt FROM @preparedStatement;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;