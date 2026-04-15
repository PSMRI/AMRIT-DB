USE db_iemr;

SET @schema = 'db_iemr';
SET @table  = 'tb_screening';

-- user_id
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN user_id INT;',
    'SELECT "user_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='user_id'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ben_id
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN ben_id BIGINT;',
    'SELECT "ben_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='ben_id'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- visit_date
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN visit_date TIMESTAMP NULL DEFAULT NULL;',
    'SELECT "visit_date exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='visit_date'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- cough_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN cough_check BOOLEAN;',
    'SELECT "cough_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='cough_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- blood_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN blood_check BOOLEAN;',
    'SELECT "blood_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='blood_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- fever_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN fever_check BOOLEAN;',
    'SELECT "fever_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='fever_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- weight_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN weight_check BOOLEAN;',
    'SELECT "weight_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='weight_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- sweats_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN sweats_check BOOLEAN;',
    'SELECT "sweats_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='sweats_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- history_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN history_check BOOLEAN;',
    'SELECT "history_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='history_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- drugs_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN drugs_check BOOLEAN;',
    'SELECT "drugs_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='drugs_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- family_check
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN family_check BOOLEAN;',
    'SELECT "family_check exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='family_check'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- rise_of_fever
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN rise_of_fever BOOLEAN;',
    'SELECT "rise_of_fever exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='rise_of_fever'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- loss_of_appetite
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN loss_of_appetite BOOLEAN;',
    'SELECT "loss_of_appetite exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='loss_of_appetite'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- age (INT as discussed)
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN age INT;',
    'SELECT "age exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='age'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- diabetic
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN diabetic BOOLEAN;',
    'SELECT "diabetic exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='diabetic'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- tobacco_user
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN tobacco_user BOOLEAN;',
    'SELECT "tobacco_user exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='tobacco_user'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- bmi
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN bmi BOOLEAN;',
    'SELECT "bmi exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='bmi'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- contact_with_tb_patient
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN contact_with_tb_patient BOOLEAN;',
    'SELECT "contact_with_tb_patient exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='contact_with_tb_patient'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- history_of_tb_in_last_five_yrs
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN history_of_tb_in_last_five_yrs BOOLEAN;',
    'SELECT "history_of_tb_in_last_five_yrs exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='history_of_tb_in_last_five_yrs'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- sympotomatic
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN sympotomatic VARCHAR(255);',
    'SELECT "sympotomatic exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='sympotomatic'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- asymptomatic
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN asymptomatic VARCHAR(255);',
    'SELECT "asymptomatic exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='asymptomatic'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- recommandate_test
SET @sql = (
  SELECT IF(COUNT(*)=0,
    'ALTER TABLE db_iemr.tb_screening ADD COLUMN recommandate_test VARCHAR(255);',
    'SELECT "recommandate_test exists";')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='recommandate_test'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


SET @dbname = 'db_iemr';
SET @tablename = 't_anc_visit';

SET @col1 = 'place_of_anc';
SET @preparedStatement1 = (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col1, '` VARCHAR(500) NULL DEFAULT NULL'),
        'SELECT 1'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col1
);
PREPARE stmt1 FROM @preparedStatement1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

SET @col2 = 'place_of_ancId';
SET @preparedStatement2 = (
    SELECT IF(
        COUNT(*) = 0,
        CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col2, '` INT NULL DEFAULT NULL'),
        'SELECT 1'
    )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col2
);
PREPARE stmt2 FROM @preparedStatement2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;


SET @dbname = 'db_iemr';
SET @tablename = 'VHND_form';

-- 1. vhnd_place_id
SET @col = 'vhnd_place_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. pregnant_women_anc
SET @col = 'pregnant_women_anc';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 3. lactating_mothers_pnc
SET @col = 'lactating_mothers_pnc';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 4. children_immunization
SET @col = 'children_immunization';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 5. select_all_education
SET @col = 'select_all_education';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 6. knowledge_balanced_diet
SET @col = 'knowledge_balanced_diet';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 7. care_during_pregnancy
SET @col = 'care_during_pregnancy';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 8. importance_breastfeeding
SET @col = 'importance_breastfeeding';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 9. complementary_feeding
SET @col = 'complementary_feeding';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 10. hygiene_sanitation
SET @col = 'hygiene_sanitation';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 11. family_planning_healthcare
SET @col = 'family_planning_healthcare';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


SET @dbname = 'db_iemr';
SET @tablename = 'vhnc_form';

-- 1. village_name
SET @col = 'village_name';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. anm
SET @col = 'anm';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 3. aww
SET @col = 'aww';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 4. no_of_pragnent_women
SET @col = 'no_of_pragnent_women';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 5. no_of_lacting_mother
SET @col = 'no_of_lacting_mother';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 6. no_of_committee
SET @col = 'no_of_committee';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 7. followup_previous
SET @col = 'followup_previous';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


SET @dbname = 'db_iemr';
SET @tablename = 'tb_suspected';

-- 1. visit_label
SET @col = 'visit_label';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. type_of_tb_case
SET @col = 'type_of_tb_case';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 3. reason_for_suspicion (length = 500)
SET @col = 'reason_for_suspicion';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(500) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 4. is_chest_xray_done
SET @col = 'is_chest_xray_done';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 5. chest_xray_result (length = 100)
SET @col = 'chest_xray_result';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(100) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 6. referral_facility (length = 200)
SET @col = 'referral_facility';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(200) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 7. is_tb_confirmed
SET @col = 'is_tb_confirmed';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 8. is_drtb_confirmed
SET @col = 'is_drtb_confirmed';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 9. provider_service_map_id
SET @col = 'provider_service_map_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 10. is_confirmed
SET @col = 'is_confirmed';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


SET @dbname = 'db_iemr';
SET @tablename = 'screening_leprosy';

-- 1. recurrent_ulceration_id
SET @col = 'recurrent_ulceration_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. recurrent_tingling_id
SET @col = 'recurrent_tingling_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 3. hypopigmented_patch_id
SET @col = 'hypopigmented_patch_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 4. thickened_skin_id
SET @col = 'thickened_skin_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 5. skin_nodules_id
SET @col = 'skin_nodules_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 6. skin_patch_discoloration_id
SET @col = 'skin_patch_discoloration_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 7. recurrent_numbness_id
SET @col = 'recurrent_numbness_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 8. clawing_fingers_id
SET @col = 'clawing_fingers_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 9. tingling_numbness_extremities_id
SET @col = 'tingling_numbness_extremities_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 10. inability_close_eyelid_id
SET @col = 'inability_close_eyelid_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 11. difficulty_holding_objects_id
SET @col = 'difficulty_holding_objects_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 12. weakness_feet_id
SET @col = 'weakness_feet_id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 13. recurrent_ulceration
SET @col = 'recurrent_ulceration';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 14. recurrent_tingling
SET @col = 'recurrent_tingling';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 15. hypopigmented_patch
SET @col = 'hypopigmented_patch';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 16. thickened_skin
SET @col = 'thickened_skin';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 17. skin_nodules
SET @col = 'skin_nodules';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 18. skin_patch_discoloration
SET @col = 'skin_patch_discoloration';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 19. recurrent_numbness
SET @col = 'recurrent_numbness';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 20. clawing_fingers
SET @col = 'clawing_fingers';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 21. tingling_numbness_extremities
SET @col = 'tingling_numbness_extremities';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 22. inability_close_eyelid
SET @col = 'inability_close_eyelid';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 23. difficulty_holding_objects
SET @col = 'difficulty_holding_objects';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 24. weakness_feet
SET @col = 'weakness_feet';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


SET @dbname = 'db_iemr';
SET @tablename = 'phc_review_meeting';

-- 1. village_name
SET @col = 'village_name';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. mitanin_history
SET @col = 'mitanin_history';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 3. mitanin_activity_checkList
SET @col = 'mitanin_activity_checkList';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 4. place_Id
SET @col = 'place_Id';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


SET @dbname = 'db_iemr';
SET @tablename = 'maa_meeting';

-- 1. village_name
SET @col = 'village_name';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(255) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. no_of_pragnent_women
SET @col = 'no_of_pragnent_women';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 3. no_of_lacting_mother
SET @col = 'no_of_lacting_mother';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` INT NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 4. mitanin_activity_checkList
SET @col = 'mitanin_activity_checkList';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` VARCHAR(5000) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


SET @dbname = 'db_iemr';
SET @tablename = 'incentive_activity_record';

-- 1. is_eligible
SET @col = 'is_eligible';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;

-- 2. is_default_activity
SET @col = 'is_default_activity';
SET @stmt = (SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @dbname, '`.`', @tablename, '` ADD COLUMN `', @col, '` TINYINT(1) NULL DEFAULT NULL'),
    'SELECT 1') FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @col);
PREPARE s FROM @stmt; EXECUTE s; DEALLOCATE PREPARE s;


CREATE TABLE IF NOT EXISTS `tb_confirmed_cases` (
   `id` int NOT NULL AUTO_INCREMENT,
   `ben_id` bigint NOT NULL,
   `regimen_type` varchar(225) DEFAULT NULL,
   `treatment_start_date` date NOT NULL,
   `expected_treatment_completion_date` date DEFAULT NULL,
   `follow_up_date` date DEFAULT NULL,
   `monthly_follow_up_done` varchar(225) DEFAULT NULL,
   `adherence_to_medicines` varchar(225) DEFAULT NULL,
   `any_discomfort` tinyint(1) DEFAULT NULL,
   `treatment_completed` tinyint(1) DEFAULT NULL,
   `actual_treatment_completion_date` date DEFAULT NULL,
   `treatment_outcome` varchar(100) DEFAULT NULL,
   `date_of_death` date DEFAULT NULL,
   `place_of_death` varchar(225) DEFAULT NULL,
   `reason_for_death` varchar(225) DEFAULT 'Tuberculosis',
   `reason_for_not_completing` varchar(255) DEFAULT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `user_id` int DEFAULT NULL,
   PRIMARY KEY (`id`)
 );


 CREATE TABLE IF NOT EXISTS `anc_counselling_care` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `beneficiary_id` bigint NOT NULL,
    `visit_date` date DEFAULT NULL,
    `home_visit_date` date NOT NULL,
    `anc_visit_id` bigint NOT NULL,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `select_all` tinyint(1) DEFAULT '0',
    `swelling` tinyint(1) DEFAULT '0',
    `high_bp` tinyint(1) DEFAULT '0',
    `convulsions` tinyint(1) DEFAULT '0',
    `anemia` tinyint(1) DEFAULT '0',
    `reduced_fetal_movement` tinyint(1) DEFAULT '0',
    `age_risk` tinyint(1) DEFAULT '0',
    `child_gap` tinyint(1) DEFAULT '0',
    `short_height` tinyint(1) DEFAULT '0',
    `pre_preg_weight` tinyint(1) DEFAULT '0',
    `bleeding` tinyint(1) DEFAULT '0',
    `miscarriage_history` tinyint(1) DEFAULT '0',
    `four_plus_delivery` tinyint(1) DEFAULT '0',
    `first_delivery` tinyint(1) DEFAULT '0',
    `twin_pregnancy` tinyint(1) DEFAULT '0',
    `c_section_history` tinyint(1) DEFAULT '0',
    `pre_existing_disease` tinyint(1) DEFAULT '0',
    `fever_malaria` tinyint(1) DEFAULT '0',
    `jaundice` tinyint(1) DEFAULT '0',
    `sickle_cell` tinyint(1) DEFAULT '0',
    `prolonged_labor` tinyint(1) DEFAULT '0',
    `malpresentation` tinyint(1) DEFAULT '0',
    `user_id` int DEFAULT NULL,
    `created_by` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `updated_by` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
  );

