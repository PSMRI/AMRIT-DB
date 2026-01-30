USE db_iemr;

CREATE TABLE IF NOT EXISTS `t_ifa_distribution_data` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `beneficiary_id` BIGINT NOT NULL,
    `household_id` BIGINT DEFAULT NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `visit_date` VARCHAR(255) DEFAULT NULL,
    `form_id` VARCHAR(255) DEFAULT NULL,
    `ifa_provided` VARCHAR(255) DEFAULT NULL,
    `ifa_quantity` VARCHAR(255) DEFAULT NULL,
    `created_at` DATETIME DEFAULT NULL,
    `updated_at` DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

