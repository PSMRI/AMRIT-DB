USE db_iemr;

CREATE TABLE IF NOT EXISTS `cdtf_visit_details` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `beneficiary_id` bigint NOT NULL,
   `household_id` bigint NOT NULL,
   `form_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
   `version` int DEFAULT NULL,
   `visit_no` int DEFAULT NULL,
   `follow_up_no` int DEFAULT NULL,
   `diagnosis_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
   `treatment_start_date` date DEFAULT NULL,
   `form_data_json` json DEFAULT NULL,
   `user_id` int DEFAULT NULL,
   `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_by` int DEFAULT NULL,
   `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `follow_up_date` date DEFAULT NULL,
   PRIMARY KEY (`id`)
 );