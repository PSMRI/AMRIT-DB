USE dbiemr;


-- 1️ Parent Table: m_incentive_activity

CREATE TABLE if not exists `m_incentive_activity` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `created_by` VARCHAR(255) DEFAULT NULL,
   `created_date` DATETIME DEFAULT NULL,
   `activity_description` VARCHAR(255) DEFAULT NULL,
   `district_code` INT DEFAULT NULL,
   `group_name` VARCHAR(255) DEFAULT NULL,
   `is_deleted` BIT(1) DEFAULT NULL,
   `activity_name` VARCHAR(255) DEFAULT NULL,
   `payment_parameter` VARCHAR(255) DEFAULT NULL,
   `rate_per_activity` INT DEFAULT NULL,
   `state_code` INT DEFAULT NULL,
   `updated_by` VARCHAR(255) DEFAULT NULL,
   `updated_date` DATETIME DEFAULT NULL,
   `fmr_code` VARCHAR(255) DEFAULT NULL,
   `fmr_code_old` VARCHAR(255) DEFAULT NULL,
   `location` VARCHAR(200) DEFAULT NULL,
   `state_activity_code` VARCHAR(100) DEFAULT NULL,
   `role_id` VARCHAR(100) DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3;

-- 2️ Language Mapping Table

CREATE TABLE if not exists `m_incentive_activity_lang_mapping` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `created_date` DATETIME DEFAULT NULL,
   `activity_description` VARCHAR(255) DEFAULT NULL,
   `group_name` VARCHAR(255) DEFAULT NULL,
   `activity_name` VARCHAR(255) DEFAULT NULL,
   `payment_parameter` VARCHAR(255) DEFAULT NULL,
   `rate_per_activity` INT DEFAULT NULL,
   `updated_date` DATETIME DEFAULT NULL,
   `location` VARCHAR(200) DEFAULT NULL,
   `assame_activity_description` VARCHAR(1000) DEFAULT NULL,
   `hindi_activity_description` VARCHAR(1000) DEFAULT NULL,
   `activity_id` BIGINT DEFAULT NULL,
   `assame_group_name` VARCHAR(200) DEFAULT NULL,
   `hindi_group_name` VARCHAR(200) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `fk_activity` (`activity_id`),
   CONSTRAINT `fk_activity`
      FOREIGN KEY (`activity_id`)
      REFERENCES `m_incentive_activity` (`id`)
      ON DELETE CASCADE
      ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;

-- 3️ Rank Mapping Table

CREATE TABLE if not exists `m_incentive_activity_rank_mapping` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `activity_id` BIGINT NOT NULL,
   `state_code` INT NOT NULL,
   `is_active` TINYINT(1) DEFAULT NULL,
   `rank_order` INT NOT NULL,
   `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
   `updated_by` VARCHAR(255) DEFAULT NULL,
   `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),

   CONSTRAINT `uq_activity_state` UNIQUE (`activity_id`, `state_code`),
   CONSTRAINT `fk_activity_state_mapping`
       FOREIGN KEY (`activity_id`)
       REFERENCES `m_incentive_activity` (`id`)
       ON DELETE CASCADE,
   KEY `idx_state_active_rank` (`state_code`, `is_active`, `rank_order`),
   CHECK (`rank_order` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
