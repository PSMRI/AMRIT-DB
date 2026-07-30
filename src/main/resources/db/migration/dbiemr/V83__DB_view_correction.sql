DROP VIEW IF EXISTS v_fetchfacility;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `piramaldev`@`%` 
    SQL SECURITY DEFINER
VIEW `v_fetchfacility` AS
    SELECT 
        `mf`.`FacilityID` AS `FacilityID`,
        `mf`.`FacilityName` AS `FacilityName`,
        `mf`.`FacilityDesc` AS `FacilityDesc`,
        `mf`.`FacilityCode` AS `FacilityCode`,
        `mf`.`FacilityTypeID` AS `FacilityTypeID`,
        `mf`.`Location` AS `Location`,
        `mf`.`PhysicalLocation` AS `PhysicalLocation`,
        `mf`.`StoreType` AS `StoreType`,
        `mf`.`Status` AS `Status`,
        `mf`.`ProviderServiceMapID` AS `ProviderServiceMapID`,
        `mf`.`IsMainFacility` AS `IsMainFacility`,
        `mf`.`MainFacilityID` AS `MainFacilityID`,
        `mf`.`Deleted` AS `FacilityDeleted`,
        `mf`.`CreatedBy` AS `FacilityCreatedBy`,
        `mf`.`CreatedDate` AS `FacilityCreatedDate`,
        `mf`.`ModifiedBy` AS `FacilityModifiedBy`,
        `mf`.`LastModDate` AS `FacilityLastModDate`,
        `mp`.`ParkingPlaceID` AS `ParkingPlaceID`,
        `mp`.`ParkingPlaceName` AS `ParkingPlaceName`,
        `mp`.`ParkingPlaceDesc` AS `ParkingPlaceDesc`,
        `mp`.`AreaHQAddress` AS `AreaHQAddress`,
        `mp`.`Deleted` AS `PPDeleted`,
        `mv`.`VanID` AS `VanID`,
        `mv`.`VanName` AS `VanName`,
        `mv`.`VehicalNo` AS `VehicalNo`,
        `mv`.`VanTypeID` AS `VanTypeID`,
        `mv`.`ParkingPlaceID` AS `VanParkingPlaceID`,
        `mv`.`Deleted` AS `VanDeleted`
    FROM
        ((`m_facility` `mf`
        LEFT JOIN `m_van` `mv` ON ((`mv`.`FacilityID` = `mf`.`FacilityID`)))
        LEFT JOIN `m_parkingplace` `mp` ON ((`mp`.`FacilityID` = `mf`.`FacilityID`)))
    ORDER BY `mf`.`FacilityID`