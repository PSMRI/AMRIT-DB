USE db_iemr;

CREATE TABLE IF NOT EXISTS `malaria_follow_up` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `ben_id` BIGINT NOT NULL,
    `house_hold_details_id` BIGINT NOT NULL,
    `user_Id` INT,
    `disease_Id` BIGINT NOT NULL,
    `date_of_diagnosis` DATE NOT NULL,
    `treatment_start_date` DATE NOT NULL,
    `treatment_given` VARCHAR(255) NOT NULL,
    `days` VARCHAR(255) NOT NULL,
    `treatment_completion_date` DATE,
    `referral_date` DATE,
    PRIMARY KEY (`id`),
    INDEX `idx_malaria_follow_up_user_id` (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

