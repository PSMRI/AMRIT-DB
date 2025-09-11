use db_identity;
-- add  beneficiary death column
ALTER TABLE i_beneficiarydetails_rmnch
ADD COLUMN `is_death` TINYINT(1) DEFAULT NULL,
ADD COLUMN `is_death_value` TINYINT(1) DEFAULT NULL,
ADD COLUMN `date_of_death` VARCHAR(200) DEFAULT NULL,
ADD COLUMN `time_of_death` VARCHAR(200) DEFAULT NULL,
ADD COLUMN `reason_of_death_id` INT(11) DEFAULT 0,
ADD COLUMN `place_of_death` VARCHAR(200) DEFAULT NULL,
ADD COLUMN `place_of_death_id` INT(11) DEFAULT 0,
ADD COLUMN `other_place_of_death` VARCHAR(200) DEFAULT NULL;
