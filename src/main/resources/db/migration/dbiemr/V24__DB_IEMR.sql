-- ========================================
--  Migration: Create New Tables
-- ========================================
USE db_iemr;

-- ===========================
-- 1. t_eye_checkup
-- ===========================
CREATE TABLE IF NOT EXISTS `t_eye_checkup` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `user_id` INT DEFAULT NULL,
   `beneficiary_id` BIGINT DEFAULT NULL,
   `household_id` BIGINT DEFAULT NULL,
   `visit_date` DATE DEFAULT NULL,
   `symptoms_observed` VARCHAR(255) DEFAULT NULL,
   `eye_affected` VARCHAR(50) DEFAULT NULL,
   `referred_to` VARCHAR(50) DEFAULT NULL,
   `follow_up_status` VARCHAR(100) DEFAULT NULL,
   `date_of_surgery` VARCHAR(20) DEFAULT NULL,
   `created_by` VARCHAR(100) DEFAULT NULL,
   `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
   `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `discharge_summary_upload` LONGTEXT,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===========================
-- 2. t_ors_distribution
-- ===========================
CREATE TABLE IF NOT EXISTS `t_ors_distribution` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `visit_date` DATE DEFAULT NULL,
   `user_id` INT DEFAULT NULL,
   `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `num_ors_packets` VARCHAR(100) DEFAULT NULL,
   `child_count` VARCHAR(100) DEFAULT NULL,
   `household_id` BIGINT DEFAULT NULL,
   `beneficiary_id` BIGINT DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===========================
-- 3. i_mobilization_mosquito_net
-- ===========================
CREATE TABLE IF NOT EXISTS `i_mobilization_mosquito_net` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `beneficiary_id` BIGINT DEFAULT NULL,
   `household_id` BIGINT DEFAULT NULL,
   `visit_date` DATE DEFAULT NULL,
   `user_name` VARCHAR(255) DEFAULT NULL,
   `user_id` INT DEFAULT NULL,
   `is_net_distributed` VARCHAR(50) DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===========================
-- 4. t_mda_distribution_data
-- ===========================
CREATE TABLE IF NOT EXISTS `t_mda_distribution_data` (
   `ID` BIGINT NOT NULL AUTO_INCREMENT,
   `BeneficiaryId` BIGINT DEFAULT NULL,
   `HouseHoldId` BIGINT DEFAULT NULL,
   `FormId` VARCHAR(255) DEFAULT NULL,
   `VisitDate` TIMESTAMP NULL DEFAULT NULL,
   `UserName` VARCHAR(255) DEFAULT NULL,
   `MdaDistributionDate` TIMESTAMP NULL DEFAULT NULL,
   `IsMedicineDistributed` VARCHAR(255) DEFAULT NULL,
   `CreatedBy` VARCHAR(255) DEFAULT NULL,
   `CreatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` VARCHAR(255) DEFAULT NULL,
   `LastModDate` TIMESTAMP NULL DEFAULT NULL,
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===========================
-- 5. maa_meeting
-- ===========================
CREATE TABLE IF NOT EXISTS `maa_meeting` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `meeting_date` DATE DEFAULT NULL,
   `place` VARCHAR(255) DEFAULT NULL,
   `participants` INT DEFAULT NULL,
   `quarter` INT DEFAULT NULL,
   `year` INT DEFAULT NULL,
   `asha_id` INT DEFAULT NULL,
   `meeting_images` LONGTEXT,
   `created_by` VARCHAR(255) DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-------------------------------------------------------------
-- 6. t_sam_visit
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `t_sam_visit` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `user_id` int DEFAULT NULL,
   `beneficiary_id` bigint DEFAULT NULL,
   `household_id` bigint DEFAULT NULL,
   `visit_date` date DEFAULT NULL,
   `visit_label` varchar(255),
   `muac` varchar(50),
   `weight_for_height_status` varchar(255),
   `is_child_referred_nrc` varchar(10),
   `is_child_admitted_nrc` varchar(10),
   `nrc_admission_date` varchar(50),
   `is_child_discharged_nrc` varchar(10),
   `nrc_discharge_date` varchar(50),
   `follow_up_visit_date` longtext,
   `sam_status` varchar(255),
   `discharge_summary` longtext,
   `view_discharge_docs` longtext,
   `created_by` varchar(255),
   `created_date` datetime DEFAULT NULL,
   `updated_date` datetime DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
-- 7. t_hbyc_child_visits
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `t_hbyc_child_visits` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `beneficiary_id` bigint NOT NULL,
   `hbyc_due_date` varchar(100),
   `hbyc_visit_date` varchar(100) NOT NULL,
   `is_baby_alive` tinyint(1) DEFAULT 1,
   `date_of_death` varchar(100),
   `reason_for_death` varchar(255),
   `place_of_death` varchar(50),
   `other_place_of_death` varchar(100),
   `baby_weight` decimal(3,1),
   `is_child_sick` tinyint(1),
   `is_exclusive_breastfeeding` tinyint(1),
   `is_mother_counseled_exbf` tinyint(1),
   `has_child_started_complementary_feeding` tinyint(1),
   `is_mother_counseled_cf` tinyint(1),
   `is_weight_recorded_by_aww` tinyint(1),
   `is_developmental_delay` tinyint(1),
   `is_measles_vaccine_given` tinyint(1),
   `is_vitamin_a_given` tinyint(1),
   `is_ors_available` tinyint(1),
   `is_ifa_syrup_available` tinyint(1),
   `is_ors_given` tinyint(1),
   `is_ifa_syrup_given` tinyint(1),
   `is_handwashing_counseling_given` tinyint(1),
   `is_parenting_counseling_given` tinyint(1),
   `is_family_planning_counseling_given` tinyint(1),
   `diarrhoea_episode` tinyint(1),
   `pneumonia_symptoms` tinyint(1),
   `temperature` decimal(4,1),
   `mcp_card_images` json,
   `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
   `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `created_by` varchar(200),
   `user_id` int DEFAULT NULL,
   `household_id` mediumtext,
   `visit_day` varchar(200),
   `is_complementary_feeding` tinyint(1),
   `is_breathing_difficulty` tinyint(1),
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
-- 8. form_module
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `form_module` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `module_name` varchar(255) NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
-- 9. form_master
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `form_master` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `form_id` varchar(100) NOT NULL,
   `form_name` varchar(255) NOT NULL,
   `module_id` bigint DEFAULT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `version` int DEFAULT 1,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`form_id`),
   KEY `fk_module` (`module_id`),
   CONSTRAINT `fk_module` FOREIGN KEY (`module_id`) REFERENCES `form_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
-- 10. form_fields
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `form_fields` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `form_id` varchar(100) NOT NULL,
   `section_title` varchar(255),
   `field_id` varchar(100) NOT NULL,
   `label` varchar(255),
   `type` varchar(100),
   `is_required` tinyint(1),
   `default_value` varchar(255),
   `placeholder` varchar(255),
   `options` longtext,
   `validation` longtext,
   `conditional` longtext,
   `sequence` int,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `is_visible` tinyint(1) DEFAULT 0,
   PRIMARY KEY (`id`),
   KEY `fk_form` (`form_id`),
   CONSTRAINT `fk_form` FOREIGN KEY (`form_id`) REFERENCES `form_master` (`form_id`) ON DELETE CASCADE,
   CONSTRAINT `form_fields_chk_1` CHECK (json_valid(`options`)),
   CONSTRAINT `form_fields_chk_2` CHECK (json_valid(`validation`)),
   CONSTRAINT `form_fields_chk_3` CHECK (json_valid(`conditional`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
-- 13. t_hbnc_visit
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `t_hbnc_visit` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `baby_alive` bit(1),
   `baby_weight` float,
   `baby_temp` float,
   `baby_yellow` tinyint(1),
   `baby_cry_continuously` tinyint(1) DEFAULT 0,
   `all_limbs_limp` tinyint(1) DEFAULT 0,
   `baby_fed_properly` tinyint(1),
   `baby_kept_warm` tinyint(1),
   `baby_immunization_status` varchar(255),
   `baby_discharged_from_sncu` bit(1) DEFAULT 0,
   `discharge_summary_image` varchar(255),
   `urine_passed` bit(1),
   `stool_passed` bit(1),
   `diarrhoea` bit(1),
   `vomiting` bit(1),
   `convulsions` bit(1),
   `activity` varchar(255),
   `sucking` varchar(255),
   `breathing` varchar(255),
   `chest_indrawing` varchar(255),
   `breath_fast` tinyint(1),
   `chest_drawing` tinyint(1),
   `cold_on_touch` tinyint(1),
   `crt_weak_stopped` tinyint(1),
   `bloated_stomach` tinyint(1),
   `jaundice` bit(1),
   `umbilical_stump_condition` varchar(255),
   `pus_navel` tinyint(1),
   `foul_discharge` tinyint(1),
   `baby_referred` tinyint(1),
   `baby_referral_date` date,
   `baby_referral_place` varchar(255),
   `baby_referral_place_other` varchar(255),
   `mother_referred` tinyint(1),
   `mother_referral_date` date,
   `mother_referral_place` varchar(255),
   `mother_referral_place_other` varchar(255),
   `mother_temp` float,
   `mother_breast_problem` tinyint(1),
   `mother_less_no_milk` tinyint(1),
   `mother_speaks_abnormally` tinyint(1),
   `num_pad_changed` int,
   `num_times_full_meal` int,
   `feeding_less_stopped` tinyint(1),
   `place_of_death` varchar(255),
   `other_place_of_death` varchar(255),
   `date_of_death` varchar(20),
   `reason_for_death` varchar(200) DEFAULT 'Ttest',
   `hbnc_visit_day` varchar(10),
   `visit_no` int,
   `visit_date` varchar(20),
   `hbnc_due_date` varchar(20),
   `household_id` mediumtext,
   `ben_id` bigint,
   `created_by` varchar(255),
   `created_date` datetime,
   `updated_by` varchar(255),
   `updated_date` datetime,
   `supervisor` varchar(255),
   `supervisor_name` varchar(255),
   `supervisor_comment` text,
   `supervisor_sign_date` date,
   `temperature` varchar(20),
   `asha_id` int,
   `baby_eyes_swollen` tinyint(1),
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-------------------------------------------------------------
-- 14. uwin_session_record
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `uwin_session_record` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `asha_id` int NOT NULL,
   `date` timestamp NOT NULL,
   `place` varchar(255) NOT NULL,
   `participants` int NOT NULL,
   `attachments_json` longtext,
   `created_by` varchar(255),
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `m_translation` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `label_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
   `english` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
   `hindi_translation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
   `is_active` tinyint(1) NOT NULL DEFAULT '1' ,
   `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `assamese_translation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `label_key` (`label_key`)
 ) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-------------------------------------------------------------
-- 11. ALTER ELIGIBLE_COUPLE_TRACKING
-------------------------------------------------------------
ALTER TABLE `ELIGIBLE_COUPLE_TRACKING`
ADD COLUMN `antra_dose` VARCHAR(500),
ADD COLUMN `date_of_antra_injection` TIMESTAMP NULL,
ADD COLUMN `due_date_of_antra_injection` VARCHAR(255),
ADD COLUMN `mpa_file` VARCHAR(255),
ADD COLUMN `antra_dose` VARCHAR(255),
ADD COLUMN `discharge_summary1` VARCHAR(255),
ADD COLUMN `discharge_summary2` VARCHAR(255);




-------------------------------------------------------------
-- 12. ALTER t_eligible_couple_register
-------------------------------------------------------------
ALTER TABLE `t_eligible_couple_register`
ADD COLUMN `is_kit_handed_over` TINYINT(1),
ADD COLUMN `is_kit_handed_over_date` VARCHAR(255),
ADD COLUMN `kit_photo1` LONGTEXT,
ADD COLUMN `kit_photo2` LONGTEXT;

