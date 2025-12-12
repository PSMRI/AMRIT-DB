-- Step 1: Insert the module if not already present
INSERT INTO db_iemr.form_module (module_name)
SELECT 'MDA'
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.form_module WHERE module_name = 'MDA'
);

-- Step 2: Fetch the module ID
SET @moduleId = (
    SELECT id FROM db_iemr.form_module WHERE module_name = 'MDA' LIMIT 1
);

-- Step 3: Insert into form_master using the dynamic ID
INSERT INTO db_iemr.form_master (form_id, form_name, module_id, version)
VALUES ('mda_distribution_form', 'MDA Distribution Form', @moduleId, 1);

INSERT INTO db_iemr.form_fields 
(form_id, section_title, field_id, label, type, is_required, default_value, placeholder, options, validation, conditional, sequence, is_visible)
VALUES 
('mda_distribution_form', 'MDA Distribution Details', 'mda_distribution_date', 'MDA Distribution Date', 'date', 1, NULL, 'Select distribution date', NULL, '{"maxDate":"today","frequency":"monthly"}', NULL, 1, 1);

INSERT INTO db_iemr.form_fields 
(form_id, section_title, field_id, label, type, is_required, default_value, placeholder, options, validation, conditional, sequence, is_visible)
VALUES 
('mda_distribution_form', 'MDA Distribution Details', 'is_medicine_distributed', 'Is Medicine Distributed', 'dropdown', 1, NULL, 'Select option', '["Yes","No"]', NULL, NULL, 2, 1);


CREATE TABLE IF NOT EXISTS db_iemr.`t_mda_distribution_data` (    
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
