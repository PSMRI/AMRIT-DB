USE db_iemr;

CREATE TABLE IF NOT EXISTS `m_procedure_fields` (
   `id` int NOT NULL AUTO_INCREMENT,
   `ProcedureID` int DEFAULT NULL,
   `field_type` varchar(50) DEFAULT NULL,
   `min_value` float DEFAULT NULL,
   `max_value` float DEFAULT NULL,
   `is_required` bit(1) DEFAULT NULL,
   `unit` varchar(20) DEFAULT NULL,
   `display_name` varchar(100) DEFAULT NULL,
   `display_label` varchar(100) DEFAULT NULL,
   `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `ProcedureID` (`ProcedureID`),
   CONSTRAINT `m_procedure_fields_ibfk_1` FOREIGN KEY (`ProcedureID`) REFERENCES `m_procedure` (`ProcedureID`)
 ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci