use db_1097_identity;

alter table i_beneficiarydetails add ExtraFields JSON after `Others`;
 
alter table i_beneficiarydetails add faceEmbedding longtext after Others;

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