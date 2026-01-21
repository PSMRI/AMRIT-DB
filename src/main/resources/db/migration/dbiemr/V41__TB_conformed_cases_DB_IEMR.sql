USE db_iemr;

CREATE TABLE IF NOT EXISTS `tb_confirmed_cases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ben_id` BIGINT NOT NULL,
  `regimen_type` VARCHAR(100) DEFAULT NULL,
  `treatment_start_date` DATE NOT NULL,
  `expected_treatment_completion_date` DATE DEFAULT NULL,
  `follow_up_date` DATE DEFAULT NULL,
  `monthly_follow_up_done` VARCHAR(20) DEFAULT NULL,
  `adherence_to_medicines` VARCHAR(20) DEFAULT NULL,
  `any_discomfort` TINYINT(1) DEFAULT NULL,
  `treatment_completed` TINYINT(1) DEFAULT NULL,
  `actual_treatment_completion_date` DATE DEFAULT NULL,
  `treatment_outcome` VARCHAR(100) DEFAULT NULL,
  `date_of_death` DATE DEFAULT NULL,
  `place_of_death` VARCHAR(100) DEFAULT NULL,
  `reason_for_death` VARCHAR(100) DEFAULT NULL,
  `reason_for_not_completing` VARCHAR(255) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT DEFAULT NULL,

  PRIMARY KEY (`id`),
  INDEX `idx_ben_id` (`ben_id`),
  INDEX `idx_treatment_start_date` (`treatment_start_date`),
  INDEX `idx_follow_up_date` (`follow_up_date`),
  INDEX `idx_user_id` (`user_id`)

) ENGINE=InnoDB
  AUTO_INCREMENT=1
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci
  COMMENT='TB Confirmed Cases Treatment Tracking';