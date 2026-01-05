USE db_iemr;

CREATE TABLE IF NOT EXISTS `anc_counselling_care` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `beneficiary_id` bigint NOT NULL,
   `visit_date` date DEFAULT NULL,
   `home_visit_date` date NOT NULL,
   `anc_visit_id` bigint NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `select_all` tinyint(1) DEFAULT 0,
   `swelling` tinyint(1) DEFAULT 0,
   `high_bp` tinyint(1) DEFAULT 0,
   `convulsions` tinyint(1) DEFAULT 0,
   `anemia` tinyint(1) DEFAULT 0,
   `reduced_fetal_movement` tinyint(1) DEFAULT 0,
   `age_risk` tinyint(1) DEFAULT 0,
   `child_gap` tinyint(1) DEFAULT 0,
   `short_height` tinyint(1) DEFAULT 0,
   `pre_preg_weight` tinyint(1) DEFAULT 0,
   `bleeding` tinyint(1) DEFAULT 0,
   `miscarriage_history` tinyint(1) DEFAULT 0,
   `four_plus_delivery` tinyint(1) DEFAULT 0,
   `first_delivery` tinyint(1) DEFAULT 0,
   `twin_pregnancy` tinyint(1) DEFAULT 0,
   `c_section_history` tinyint(1) DEFAULT 0,
   `pre_existing_disease` tinyint(1) DEFAULT 0,
   `fever_malaria` tinyint(1) DEFAULT 0,
   `jaundice` tinyint(1) DEFAULT 0,
   `sickle_cell` tinyint(1) DEFAULT 0,
   `prolonged_labor` tinyint(1) DEFAULT 0,
   `malpresentation` tinyint(1) DEFAULT 0,
   `user_id` int DEFAULT NULL,
   `created_by` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `updated_by` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
