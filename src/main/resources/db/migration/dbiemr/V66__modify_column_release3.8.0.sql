USE db_iemr;

ALTER TABLE screening_aesje
MODIFY follow_up_point INT(11) DEFAULT NULL;

ALTER TABLE screening_filaria
MODIFY medicine_side_effect varchar(500) DEFAULT NULL;

ALTER TABLE screening_filaria
MODIFY dose_status varchar(255) DEFAULT NULL;

ALTER TABLE asha_profile
MODIFY dob VARCHAR(15) NULL,
MODIFY mobile_number VARCHAR(10) NULL,
MODIFY alternate_mobile_number VARCHAR(10) NULL,
MODIFY father_or_spouse_name VARCHAR(255) NULL,
MODIFY date_of_joining VARCHAR(15) NULL,
MODIFY bank_account VARCHAR(18) NULL,
MODIFY ifsc VARCHAR(11) NULL,
MODIFY population_covered INT NULL,
MODIFY cho_name VARCHAR(255) NULL,
MODIFY cho_mobile VARCHAR(10) NULL,
MODIFY aww_name VARCHAR(255) NULL,
MODIFY aww_mobile VARCHAR(10) NULL,
MODIFY anm1_name VARCHAR(255) NULL,
MODIFY anm1_mobile VARCHAR(10) NULL,
MODIFY anm2_name VARCHAR(255) NULL,
MODIFY anm2_mobile VARCHAR(10) NULL,
MODIFY abha_number VARCHAR(14) NULL,
MODIFY asha_household_registration VARCHAR(255) NULL,
MODIFY asha_family_member VARCHAR(255) NULL,
MODIFY ProviderServiceMapID VARCHAR(100) NULL,
MODIFY profileImage VARCHAR(1000) NULL,
MODIFY supervisorName VARCHAR(50) NULL,
MODIFY supervisorMobile VARCHAR(50) NULL,
MODIFY isFatherOrSpouse TINYINT(1) NULL;

ALTER TABLE t_anc_visit
MODIFY date_of_sterilisation DATETIME NULL DEFAULT NULL;

SET @schema = 'db_iemr';
SET @table  = 'tb_screening';

-- Helper pattern: check + add via dynamic SQL

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

