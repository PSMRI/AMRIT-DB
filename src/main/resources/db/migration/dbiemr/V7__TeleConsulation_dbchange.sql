
use db_iemr;

alter table m_userservicerolemapping change isSanjeevani   teleConsultation varchar(100);

USE `db_iemr`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    
VIEW `v_userservicerolemapping` AS
    SELECT 
        `usr`.`UserID` AS `UserID`,
        `usrm`.`USRMappingID` AS `USRMappingID`,
        CONCAT(COALESCE(`usr`.`FirstName`, ''),
                ' ',
                COALESCE(`usr`.`MiddleName`, ''),
                ' ',
                COALESCE(`usr`.`LastName`, '')) AS `Name`,
        `usr`.`UserName` AS `UserName`,
        `psm`.`ServiceID` AS `ServiceID`,
        `sm`.`ServiceName` AS `ServiceName`,
        `sm`.`IsNational` AS `IsNational`,
        `psm`.`StateID` AS `StateID`,
        `st`.`StateName` AS `StateName`,
        `psam`.`DistrictID` AS `WorkingDistrictID`,
        `dist`.`DistrictName` AS `WorkingDistrictName`,
        `usrm`.`WorkingLocationID` AS `WorkingLocationID`,
        `usrm`.`ServiceProviderID` AS `ServiceProviderID`,
        `psam`.`LocationName` AS `LocationName`,
        `psam`.`Address` AS `WorkingLocationAddress`,
        `usrm`.`RoleID` AS `RoleID`,
        `rol`.`RoleName` AS `RoleName`,
        `usrm`.`ProviderServiceMapID` AS `ProviderServiceMapID`,
        `usrm`.`AgentID` AS `AgentID`,
        `psm`.`StatusID` AS `PSMStatusID`,
        `sta`.`Status` AS `PSMStatus`,
        `usrm`.`Deleted` AS `UserServciceRoleDeleted`,
        `usr`.`Deleted` AS `UserDeleted`,
        `sp`.`Deleted` AS `ServiceProviderDeleted`,
        `rol`.`Deleted` AS `RoleDeleted`,
        `psm`.`Deleted` AS `ProviderServiceMappingDeleted`,
        `usrm`.`isInbound` AS `isInbound`,
        `usrm`.`isOutbound` AS `isOutbound`,
        `usrm`.`Blockid` AS `blockid`,
        `usrm`.`BlockName` AS `blockname`,
        `usrm`.`Villageid` AS `villageid`,
        `usrm`.`VillageName` AS `villagename`,
        `usrm`.`teleConsultation` AS `teleConsultation`
      
    FROM
        (((((((((`m_userservicerolemapping` `usrm`
        LEFT JOIN `m_user` `usr` ON ((`usrm`.`UserID` = `usr`.`UserID`)))
        LEFT JOIN `m_role` `rol` ON ((`usrm`.`RoleID` = `rol`.`RoleID`)))
        LEFT JOIN `m_providerservicemapping` `psm` ON ((`usrm`.`ProviderServiceMapID` = `psm`.`ProviderServiceMapID`)))
        LEFT JOIN `m_providerserviceaddmapping` `psam` ON ((`usrm`.`WorkingLocationID` = `psam`.`PSAddMapID`)))
        LEFT JOIN `m_district` `dist` ON ((`psam`.`DistrictID` = `dist`.`DistrictID`)))
        LEFT JOIN `m_state` `st` ON ((`psm`.`StateID` = `st`.`StateID`)))
        LEFT JOIN `m_serviceprovider` `sp` ON ((`psm`.`ServiceProviderID` = `sp`.`ServiceProviderID`)))
        LEFT JOIN `m_servicemaster` `sm` ON ((`psm`.`ServiceID` = `sm`.`ServiceID`)))
        LEFT JOIN `m_status` `sta` ON ((`psm`.`StatusID` = `sta`.`StatusID`)));
