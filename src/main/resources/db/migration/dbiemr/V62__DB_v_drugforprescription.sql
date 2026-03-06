Use db_iemr;

Drop VIEW if Exists v_drugforprescription;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `db_iemr`.`v_drugforprescription` AS
    SELECT 
        `mifm`.`ItemFacilityMapID` AS `id`,
        `mi`.`ItemID` AS `itemID`,
        `mi`.`ItemName` AS `itemName`,
        `mi`.`Strength` AS `Strength`,
        `mu`.`UOMName` AS `unitOfMeasurement`,
        CAST(SUM(IFNULL(GREATEST(`tise`.`QuantityInHand`, 0), 0))
            AS UNSIGNED) AS `quantityInHand`,
        `mi`.`ItemFormID` AS `itemFormID`,
        `mi`.`RouteID` AS `routeID`,
        `mifm`.`FacilityID` AS `facilityID`,
        `mi`.`Sctcode` AS `Sctcode`,
        `mi`.`SctTerm` AS `SctTerm`,
        `mi`.`Composition` AS `composition`,
        `mi`.`isEDL` AS `isedl`
    FROM
        (((`db_iemr`.`m_itemfacilitymapping` `mifm`
        JOIN `db_iemr`.`m_item` `mi` ON (((`mifm`.`ItemID` = `mi`.`ItemID`)
            AND (`mifm`.`ProviderServiceMapID` = `mi`.`ProviderServiceMapID`)
            AND ((0 <> `mi`.`Deleted`) IS FALSE))))
        LEFT JOIN `db_iemr`.`t_itemstockentry` `tise` ON (((`mifm`.`FacilityID` = `tise`.`FacilityID`)
            AND (`mifm`.`ItemID` = `tise`.`ItemID`)
            AND ((0 <> `tise`.`Deleted`) IS FALSE))))
        LEFT JOIN `db_iemr`.`m_uom` `mu` ON (((`mi`.`UOMID` = `mu`.`UOMID`)
            AND ((0 <> `mu`.`Deleted`) IS FALSE))))
    WHERE
        (((0 <> `mifm`.`Deleted`) IS FALSE)
            AND (`mi`.`ItemFormID` IS NOT NULL)
            AND ((`tise`.`ExpiryDate` > CURDATE())
            OR (`tise`.`ExpiryDate` IS NULL)))
    GROUP BY `mifm`.`FacilityID` , `mi`.`ItemID`