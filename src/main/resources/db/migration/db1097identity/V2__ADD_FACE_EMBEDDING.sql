use db_1097_identity;

-- ALTER TABLE i_beneficiarydetails ADD COLUMN IF NOT EXISTS ExtraFields JSON AFTER `Others`;

-- ALTER TABLE i_beneficiarydetails ADD COLUMN IF NOT EXISTS faceEmbedding LONGTEXT AFTER `Others`;

USE db_1097_identity;

-- ================================
-- Add ExtraFields (JSON)
-- ================================
SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_1097_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'ExtraFields'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE db_1097_identity.i_beneficiarydetails ADD COLUMN ExtraFields JSON AFTER `Others`;',
    'SELECT "Column ExtraFields already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- ================================
-- Add faceEmbedding (LONGTEXT)
-- ================================
SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_1097_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'faceEmbedding'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE db_1097_identity.i_beneficiarydetails ADD COLUMN faceEmbedding LONGTEXT AFTER `Others`;',
    'SELECT "Column faceEmbedding already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;




CREATE 
OR REPLACE VIEW `db_1097_identity`.`v_benadvancesearch` AS
    SELECT 
        `benmap`.`BenMapId` AS `BenMapId`,
        `benmap`.`BenRegId` AS `BenRegId`,
        `benmap`.`BenDetailsId` AS `BenDetailsId`,
        `benmap`.`BenAddressId` AS `BenAddressId`,
        `benmap`.`BenImageId` AS `BenImageId`,
        `benmap`.`BenContactsId` AS `BenContactsId`,
        `benmap`.`BenConsentId` AS `BenConsentId`,
        `benmap`.`BenAccountID` AS `BenAccountID`,
        `benmap`.`BenSecureStackId` AS `BenSecureStackId`,
        `benmap`.`VanSerialNo` AS `VanSerialNo`,
        `benmap`.`VanID` AS `VanID`,
        `benadd`.`CurrStateId` AS `CurrStateId`,
        `benadd`.`CurrDistrictId` AS `CurrDistrictId`,
        `benadd`.`CurrSubDistrictId` AS `CurrSubDistrictId`,
        `benadd`.`CurrVillageId` AS `CurrVillageId`,
        `bendetail`.`FirstName` AS `FirstName`,
        `bendetail`.`MiddleName` AS `MiddleName`,
        `bendetail`.`LastName` AS `LastName`,
        `bendetail`.`GenderId` AS `GenderId`,
        `bendetail`.`FatherName` AS `fathername`,
        `bendetail`.`DOB` AS `DOB`,
        `bendetailr`.`houseoldId` AS `houseoldId`,
        `bendetailr`.`guidelineid` AS `guidelineid`,
        `bendetailr`.`rchid` AS `rchid`
    FROM
        (((`db_1097_identity`.`i_beneficiarymapping` `benmap`
        JOIN `db_1097_identity`.`i_beneficiarydetails` `bendetail` ON (((`benmap`.`BenDetailsId` = `bendetail`.`VanSerialNo`)
            AND (`benmap`.`VanID` = `bendetail`.`VanID`))))
        JOIN `db_1097_identity`.`i_beneficiaryaddress` `benadd` ON (((`benmap`.`BenAddressId` = `benadd`.`VanSerialNo`)
            AND (`benmap`.`VanID` = `benadd`.`VanID`))))
        LEFT JOIN `db_1097_identity`.`i_beneficiarydetails_rmnch` `bendetailr` ON ((`benmap`.`BenRegId` = `bendetailr`.`BeneficiaryRegID`)));