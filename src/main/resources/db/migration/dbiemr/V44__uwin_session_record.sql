USE dbiemr;

CREATE TABLE IF NOT EXISTS `uwin_session_record` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `asha_id` INT NOT NULL,
    `session_date` TIMESTAMP NOT NULL,
    `place` VARCHAR(255) NOT NULL,
    `participants` INT NOT NULL,
    `attachments_json` LONGTEXT,
    `created_by` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
