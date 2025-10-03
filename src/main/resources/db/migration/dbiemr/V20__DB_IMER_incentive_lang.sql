-- Migration: add incentive activity language and rank mapping tables

use db_iemr;

--
-- Table structure for table `m_incentive_activity_lang_mapping`
--
CREATE TABLE `m_incentive_activity_lang_mapping` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `created_date` datetime DEFAULT NULL,
   `activity_description` varchar(255) DEFAULT NULL,
   `group_name` varchar(255) DEFAULT NULL,
   `activity_name` varchar(255) DEFAULT NULL,
   `payment_parameter` varchar(255) DEFAULT NULL,
   `rate_per_activity` int DEFAULT NULL,
   `updated_date` datetime DEFAULT NULL,
   `location` varchar(200) DEFAULT NULL,
   `assame_activity_description` varchar(1000) DEFAULT NULL,
   `hindi_activity_description` varchar(1000) DEFAULT NULL,
   `activity_id` bigint DEFAULT NULL,
   `assame_group_name` varchar(200) DEFAULT NULL,
   `hindi_group_name` varchar(200) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `fk_activity` (`activity_id`),
   CONSTRAINT `fk_activity` FOREIGN KEY (`activity_id`) REFERENCES `m_incentive_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `m_incentive_activity_rank_mapping`
--

CREATE TABLE `m_incentive_activity_rank_mapping` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `activity_id` BIGINT NOT NULL,
   `state_code` INT NOT NULL,
   `is_active` TINYINT(1) DEFAULT b 1,
   `rank_order` INT NOT NULL DEFAULT 0,
   `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
   `updated_by` VARCHAR(255) DEFAULT NULL,
   `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),

   CONSTRAINT `uq_activity_state` UNIQUE (`activity_id`, `state_code`),
   CONSTRAINT `fk_activity_state_mapping`
       FOREIGN KEY (`activity_id`) REFERENCES `incentive_activity` (`id`)
       ON DELETE CASCADE ,
        KEY `idx_state_active_rank` (`state_code`,`is_active`,`rank_order`),
        CHECK (`rank_order` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `m_incentive_activity` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `created_by` varchar(255) DEFAULT NULL,
   `created_date` datetime DEFAULT NULL,
   `activity_description` varchar(255) DEFAULT NULL,
   `district_code` int DEFAULT NULL,
   `group_name` varchar(255) DEFAULT NULL,
   `is_deleted` bit(1) DEFAULT NULL,
   `activity_name` varchar(255) DEFAULT NULL,
   `payment_parameter` varchar(255) DEFAULT NULL,
   `rate_per_activity` int DEFAULT NULL,
   `state_code` int DEFAULT NULL,
   `updated_by` varchar(255) DEFAULT NULL,
   `updated_date` datetime DEFAULT NULL,
   `fmr_code` varchar(255) DEFAULT NULL,
   `fmr_code_old` varchar(255) DEFAULT NULL,
   `location` varchar(200) DEFAULT NULL,
   `state_activity_code` varchar(100) DEFAULT NULL,
   `role_id` varchar(100) DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3;


