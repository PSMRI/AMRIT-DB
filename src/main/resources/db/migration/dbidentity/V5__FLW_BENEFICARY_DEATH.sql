use db_identity;
-- add  beneficiary death column

ALTER TABLE i_beneficiarydetails_rmnch;
ADD COLUMN `isDeath` TINYINT(1) DEFAULT NULL,
ADD COLUMN `isDeathValue` TINYINT(1) DEFAULT NULL,
ADD COLUMN `dateOfDeath` VARCHAR(200) DEFAULT NULL,
ADD COLUMN `timeOfDeath` VARCHAR(200) DEFAULT NULL,
ADD COLUMN `reasonOfDeathId` INT(11) DEFAULT 0,
ADD COLUMN `placeOfDeath` VARCHAR(200) DEFAULT NULL,
ADD COLUMN `placeOfDeathId` INT(11) DEFAULT 0,
ADD COLUMN `otherPlaceOfDeath` VARCHAR(200) DEFAULT NULL;