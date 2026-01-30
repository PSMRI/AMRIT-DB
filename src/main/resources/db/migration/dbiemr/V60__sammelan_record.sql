
 USE db_iemr;

 CREATE TABLE IF NOT EXISTS `sammelan_record` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `asha_id` int NOT NULL,
    `place` varchar(255) NOT NULL,
    `participants` int NOT NULL,
    `remarks` text,
    `created_by` varchar(255) DEFAULT NULL,
    `created_date` timestamp NULL DEFAULT NULL,
    `attachments` longtext,
    `meeting_date` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_asha_month` (`asha_id`)
  ) ENGINE=InnoDB AUTO_INCREMFENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET @dbname = 'db_iemr';
SET @tablename = 'uwin_session_record';
SET @columnname = 'date';
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' DATE DEFAULT NULL;')
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
