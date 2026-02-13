

CREATE TABLE IF NOT EXISTS `form_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `form_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_id` varchar(100) NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `module_id` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `version` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id` (`form_id`),
  KEY `fk_module` (`module_id`),
  CONSTRAINT `fk_module` FOREIGN KEY (`module_id`) REFERENCES `form_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `form_fields` (

  `id` bigint NOT NULL AUTO_INCREMENT,

  `form_id` varchar(100) NOT NULL,

  `section_title` varchar(255) DEFAULT NULL,

  `field_id` varchar(100) NOT NULL,

  `label` varchar(255) DEFAULT NULL,

  `type` varchar(100) DEFAULT NULL,

  `is_required` tinyint(1) DEFAULT NULL,

  `default_value` varchar(255) DEFAULT NULL,

  `placeholder` varchar(255) DEFAULT NULL,

  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,

  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,

  `conditional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,

  `sequence` int DEFAULT NULL,

  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,

  `is_visible` tinyint(1) DEFAULT '0',

  PRIMARY KEY (`id`),

  KEY `fk_form` (`form_id`),

  CONSTRAINT `fk_form` FOREIGN KEY (`form_id`) REFERENCES `form_master` (`form_id`) ON DELETE CASCADE,

  CONSTRAINT `form_fields_chk_1` CHECK (json_valid(`options`)),

  CONSTRAINT `form_fields_chk_2` CHECK (json_valid(`validation`)),

  CONSTRAINT `form_fields_chk_3` CHECK (json_valid(`conditional`))
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





CREATE TABLE IF NOT EXISTS dbiemr.`t_mda_distribution_data` (    
   `ID` BIGINT NOT NULL AUTO_INCREMENT,    
   `BeneficiaryId` BIGINT DEFAULT NULL, 
   `HouseHoldId` BIGINT NOT NULL,    
   `FormId` VARCHAR(100) DEFAULT NULL,    
   `AshaId` INT NOT NULL,  
   `VisitDate` TIMESTAMP DEFAULT NULL,    
   `UserName` VARCHAR(100) DEFAULT NULL,    
   `MdaDistributionDate` TIMESTAMP DEFAULT NULL,    
   `IsMedicineDistributed` VARCHAR(10) DEFAULT NULL,    
    
   -- Audit fields    
   `CreatedBy` VARCHAR(100) DEFAULT NULL,    
   `CreatedDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    
   `ModifiedBy` VARCHAR(100) DEFAULT NULL,    
   `LastModDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    
   PRIMARY KEY (`ID`)    
);