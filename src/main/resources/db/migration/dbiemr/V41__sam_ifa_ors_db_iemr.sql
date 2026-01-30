USE db_iemr;

CREATE TABLE IF NOT EXISTS `t_sam_visit` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `user_id` int DEFAULT NULL,
   `beneficiary_id` bigint DEFAULT NULL,
   `household_id` bigint DEFAULT NULL,
   `visit_date` date DEFAULT NULL,
   `visit_label` varchar(255) DEFAULT NULL,
   `muac` varchar(50) DEFAULT NULL,
   `weight_for_height_status` varchar(255) DEFAULT NULL,
   `is_child_referred_nrc` varchar(10) DEFAULT NULL,
   `is_child_admitted_nrc` varchar(10) DEFAULT NULL,
   `nrc_admission_date` varchar(50) DEFAULT NULL,
   `is_child_discharged_nrc` varchar(10) DEFAULT NULL,
   `nrc_discharge_date` varchar(50) DEFAULT NULL,
   `follow_up_visit_date` longtext,
   `sam_status` varchar(255) DEFAULT NULL,
   `discharge_summary` longtext,
   `view_discharge_docs` longtext,
   `created_by` varchar(255) DEFAULT NULL,
   `created_date` datetime DEFAULT NULL,
   `updated_date` datetime DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS`t_ifa_distribution` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `beneficiary_id` bigint DEFAULT NULL,
   `user_id` int DEFAULT NULL,
   `house_hold_id` bigint DEFAULT NULL,
   `form_id` varchar(255) DEFAULT NULL,
   `visit_date` varchar(100) DEFAULT NULL,
   `ifa_provision_date` date DEFAULT NULL,
   `mcp_card_upload` text,
   `ifa_bottle_count` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


 CREATE TABLE IF NOT EXISTS `t_ors_distribution` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `household_id` bigint DEFAULT NULL,
    `beneficiary_id` bigint DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    `visit_date` date DEFAULT NULL,
    `child_count` varchar(50) DEFAULT NULL,
    `num_ors_packets` varchar(50) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;








