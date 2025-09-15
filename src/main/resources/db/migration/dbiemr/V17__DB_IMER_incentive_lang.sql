### Summary
This PR introduces two new tables to support multi-language incentive activities
and maintain state-wise ranking for activities.

### Schema Changes

1. **m_incentive_activity_lang_mapping**
   - Stores translations of incentive activities in different languages.
   - Columns include `activity_name`, `group_name`, `activity_description`,
     `payment_parameter`, and `rate_per_activity`.
   - Foreign key `language_id` references `m_language.LanguageID` for language integrity.

2. **m_incentive_activity_rank_mapping**
   - Manages state-level ranking and activation of incentive activities.
   - Includes `rank_order` for display ordering and `is_active` for enabling/disabling activities.
   - Enforces uniqueness on `(activity_id, state_code)` to prevent duplicates.
   - Foreign key `activity_id` references `incentive_activity(id)` with `ON DELETE CASCADE`.


use db_iemr;
CREATE TABLE `m_incentive_activity_lang_mapping` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `activity_id` bigint NOT NULL,
   `language_id` int NOT NULL,
   `activity_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `activity_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `payment_parameter` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `rate_per_activity` int DEFAULT NULL,
   PRIMARY KEY (`id`),
   CONSTRAINT `fk_lang_mapping_language` FOREIGN KEY (`language_id`) REFERENCES `m_language` (`LanguageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `m_incentive_activity_rank_mapping` (
   `id` BIGINT NOT NULL AUTO_INCREMENT,
   `activity_id` BIGINT NOT NULL,
   `state_code` INT NOT NULL,
   `is_active` BIT(1) DEFAULT b'1',
   `rank_order` INT NOT NULL DEFAULT 0,
   `created_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
   `updated_by` VARCHAR(255) DEFAULT NULL,
   `updated_date` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),

   CONSTRAINT `uq_activity_state` UNIQUE (`activity_id`, `state_code`),
   CONSTRAINT `fk_activity_state_mapping`
       FOREIGN KEY (`activity_id`) REFERENCES `incentive_activity` (`id`)
       ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


