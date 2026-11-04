USE db_iemr;


SET @schema_name = 'db_iemr';

SET @tbl_name = 'form_field_options';
SET @col_name = 'owner_module';
SET @col_def = 'VARCHAR(250) NULL';
SET @tbl_exists = 0;
SET @col_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' ', @col_def),
IF(@tbl_exists = 0,
CONCAT('SELECT ''', @tbl_name, ' does not exist'''),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_suspected';
SET @col_name = 'is_recommended_for_tpt';
SET @col_def = 'TINYINT(1) NULL DEFAULT NULL';
SET @tbl_exists = 0;
SET @col_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' ', @col_def),
IF(@tbl_exists = 0,
CONCAT('SELECT ''', @tbl_name, ' does not exist'''),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


CREATE TABLE IF NOT EXISTS `general_check_up` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `ben_id` bigint DEFAULT NULL,
   `household_id` bigint DEFAULT NULL,
   `checkup_date` date NOT NULL,
   `problem_type` varchar(200) DEFAULT NULL,
   `problems` json DEFAULT NULL,
   `other_text` varchar(250) DEFAULT NULL,
   `priority` varchar(20) DEFAULT NULL,
   `referral_reason` varchar(500) DEFAULT NULL,
   `referral_date` date DEFAULT NULL,
   `created_by` varchar(100) DEFAULT NULL,
   `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `synced_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `asha_id` int DEFAULT NULL,
   `checkup_id` varchar(1000) DEFAULT NULL,
   `problem_type_label` varchar(500) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `idx_general_checkup_asha_date` (`checkup_date`),
   KEY `idx_general_checkup_ben_id` (`ben_id`)
 );

ALTER TABLE phc_review_meeting
MODIFY COLUMN image1 LONGBLOB,
MODIFY COLUMN image2 LONGBLOB;

ALTER TABLE VHND_form
MODIFY COLUMN image1 LONGBLOB,
MODIFY COLUMN image2 LONGBLOB;


ALTER TABLE vhnc_form
MODIFY COLUMN image1 LONGBLOB,
MODIFY COLUMN image2 LONGBLOB;


ALTER TABLE deworming_form
MODIFY COLUMN image1 LONGBLOB,
MODIFY COLUMN image2 LONGBLOB;

ALTER TABLE ahd_form
MODIFY COLUMN image1 LONGBLOB,
MODIFY COLUMN image2 LONGBLOB;

CREATE TABLE IF NOT EXISTS `general_checkup_followup` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `ben_id` bigint DEFAULT NULL,
   `household_id` bigint DEFAULT NULL,
   `follow_up_date` timestamp NULL DEFAULT NULL,
   `created_date` timestamp NULL DEFAULT NULL,
   `updated_date` timestamp NULL DEFAULT NULL,
   `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `synced_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `user_id` int DEFAULT NULL,
   `synced_date` timestamp NULL DEFAULT NULL,
   `followup_status` varchar(100) DEFAULT NULL,
   `referred_to` varchar(100) DEFAULT NULL,
   `asha_id` int DEFAULT NULL,
   `referralReason` varchar(250) DEFAULT NULL,
   `referredOnDate` timestamp NULL DEFAULT NULL,
   `referred_on_date` varchar(250) DEFAULT NULL,
   `referral_reason` varchar(250) DEFAULT NULL,
   `other_follow_up` varchar(500) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `idx_tb_tpt_follow_up_ben_id` (`ben_id`),
   KEY `idx_tb_tpt_follow_up_household_id` (`household_id`),
   KEY `idx_tb_tpt_follow_up_user_id` (`user_id`)
 );
