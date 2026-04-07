USE db_iemr;

CREATE TABLE IF NOT EXISTS `form_field_options` (
   `id` int NOT NULL AUTO_INCREMENT,
   `option_key` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
   `value` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
   `label_en` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
   `label_hi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
   `label_as` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
   `sort_order` int DEFAULT '0',
   PRIMARY KEY (`id`)
 );

 SET @schema = 'db_iemr';

 SET @table = 'form_fields';

 SET @col = 'option_key';
 SET @sql = (
   SELECT IF(COUNT(*) = 0,
     CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(250) NULL DEFAULT NULL'),
     'SELECT "option_key already exists"')
   FROM INFORMATION_SCHEMA.COLUMNS
   WHERE TABLE_SCHEMA = @schema
     AND TABLE_NAME   = @table
     AND COLUMN_NAME  = @col
 );
 PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;