USE db_iemr;

CREATE TABLE IF NOT EXISTS `maa_meeting` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `meeting_date` DATE,
    `place` VARCHAR(255),
    `participants` INT,
    `quarter` INT,
    `year` INT,
    `asha_id` INT,
    `meeting_images` LONGTEXT,
    `created_by` VARCHAR(255),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

