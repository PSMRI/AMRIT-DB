-- ========================================
--  Migration: Create New Tables
-- ========================================
USE db_iemr;

-------------------------------------------------------------
-- form_module
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `form_module` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-------------------------------------------------------------
-- form_master
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `form_master` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `form_id` varchar(100) NOT NULL,
   `form_name` varchar(255) NOT NULL,
   `module_id` bigint DEFAULT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `version` int DEFAULT 1,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`form_id`),
   KEY `fk_module` (`module_id`),
   CONSTRAINT `fk_module` FOREIGN KEY (`module_id`) REFERENCES `form_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
--  form_fields
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `form_fields` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `form_id` varchar(100) NOT NULL,
   `section_title` varchar(255),
   `field_id` varchar(100) NOT NULL,
   `label` varchar(255),
   `type` varchar(100),
   `is_required` tinyint(1),
   `default_value` varchar(255),
   `placeholder` varchar(255),
   `options` longtext,
   `validation` longtext,
   `conditional` longtext,
   `sequence` int,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `is_visible` tinyint(1) DEFAULT 0,
   PRIMARY KEY (`id`),
   KEY `fk_form` (`form_id`),
   CONSTRAINT `fk_form` FOREIGN KEY (`form_id`) REFERENCES `form_master` (`form_id`) ON DELETE CASCADE,
   CONSTRAINT `form_fields_chk_1` CHECK (json_valid(`options`)),
   CONSTRAINT `form_fields_chk_2` CHECK (json_valid(`validation`)),
   CONSTRAINT `form_fields_chk_3` CHECK (json_valid(`conditional`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-------------------------------------------------------------
--  m_translation
-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `m_translation` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `label_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
   `english` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
   `hindi_translation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
   `is_active` tinyint(1) NOT NULL DEFAULT 1,
   `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `assamese_translation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `label_key` (`label_key`)
 ) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
