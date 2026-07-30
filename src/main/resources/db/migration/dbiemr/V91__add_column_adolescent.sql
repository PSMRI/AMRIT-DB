USE db_iemr;

SET @schema = 'db_iemr';

SET @table = 'adolescent_health';

SET @col = 'is_sanitary_napkin_used';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TINYINT(1) NOT NULL DEFAULT 0'),
    'SELECT "is_sanitary_napkin_used already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

alter table db_iemr.elderly_health_assessment add column referral_priority varchar(250);
alter table db_iemr.mental_health_screening add column case_status varchar(250);
alter table db_iemr.mental_health_screening add column date_of_death timestamp;

CREATE TABLE IF NOT EXISTS user_fcm_tokens (
    id BIGINT  NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    token VARCHAR(500) NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_user_id (user_id)
);

CREATE TABLE IF NOT EXISTS `notification` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `app_type` varchar(50) DEFAULT NULL,
   `sender_user_id` int DEFAULT NULL,
   `receiver_user_id` int NOT NULL,
   `title` varchar(255) DEFAULT NULL,
   `body` text,
   `notification_type` varchar(100) DEFAULT NULL,
   `nav_id` varchar(100) DEFAULT NULL,
   `redirect` varchar(255) DEFAULT NULL,
   `priority` varchar(20) DEFAULT NULL,
   `is_read` tinyint(1) NOT NULL DEFAULT '0',
   `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `read_date` timestamp NULL DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `idx_receiver_user_id` (`receiver_user_id`),
   KEY `idx_sender_user_id` (`sender_user_id`),
   KEY `idx_is_read` (`is_read`),
   KEY `idx_created_date` (`created_date`)
 );