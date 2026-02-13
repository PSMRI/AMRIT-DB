USE dbiemr;

CREATE TABLE IF NOT EXISTS `t_eye_checkup` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` INT DEFAULT NULL,
    `beneficiary_id` BIGINT DEFAULT NULL,
    `household_id` BIGINT DEFAULT NULL,
    `visit_date` DATE DEFAULT NULL,
    `symptoms_observed` VARCHAR(255) DEFAULT NULL,
    `eye_affected` VARCHAR(255) DEFAULT NULL,
    `referred_to` VARCHAR(255) DEFAULT NULL,
    `follow_up_status` VARCHAR(255) DEFAULT NULL,
    `date_of_surgery` VARCHAR(255) DEFAULT NULL,
    `created_by` VARCHAR(255) DEFAULT NULL,
    `discharge_summary_upload` VARCHAR(255) DEFAULT NULL,
    `created_date` DATETIME DEFAULT NULL,
    `updated_date` DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
