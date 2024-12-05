
use db_iemr;


CREATE TABLE if not exists  `m_fieldtypes` (
   `AnswerTypeID` int NOT NULL AUTO_INCREMENT,
   `AnswerType` varchar(30) DEFAULT NULL,
   `AnswerTypeDesc` varchar(50) DEFAULT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) NOT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`AnswerTypeID`)
 ) ;

CREATE TABLE if not exists `m_registrationsections` (
   `SectionID` int NOT NULL AUTO_INCREMENT,
   `SectionName` varchar(50) NOT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) NOT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`SectionID`)
 );

CREATE TABLE if not exists `m_registrationprojects` (
   `ProjectID` int NOT NULL AUTO_INCREMENT,
   `ProjectName` varchar(50) NOT NULL,
   `ServiceProviderID` int NOT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) DEFAULT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`ProjectID`)
 ) ;


CREATE TABLE if not exists `t_mapsectionprojects` (
   `ID` int NOT NULL AUTO_INCREMENT,
   `ProjectID` int NOT NULL,
   `ProjectName` varchar(50) NOT NULL,
   `SectionID` int NOT NULL,
   `SectionName` varchar(50) NOT NULL,
   `serviceProviderId` int NOT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) NOT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`ID`),
   KEY `FK_t_Mapsectionprojects_ProjectID` (`ProjectID`),
   KEY `FK_t_Mapsectionprojects_SectionID` (`SectionID`),
   CONSTRAINT `FK_t_Mapsectionprojects_ProjectID` FOREIGN KEY (`ProjectID`) REFERENCES `m_registrationprojects` (`ProjectID`),
   CONSTRAINT `FK_t_Mapsectionprojects_SectionID` FOREIGN KEY (`SectionID`) REFERENCES `m_registrationsections` (`SectionID`)
 ) ;

CREATE TABLE if not exists `t_registrationfields` (
   `ID` int NOT NULL AUTO_INCREMENT,
   `SectionID` int DEFAULT NULL,
   `FieldName` varchar(50) NOT NULL,
   `FieldTitle` varchar(50) DEFAULT NULL,
   `FieldTypeID` int DEFAULT NULL,
   `FieldType` varchar(50) NOT NULL,
   `AllowMin` int DEFAULT NULL,
   `AllowMax` int DEFAULT NULL,
   `Rank` int NOT NULL,
   `AllowText` varchar(50) DEFAULT NULL,
   `IsRequired` bit(1) DEFAULT b'0',
   `Options` varchar(100) DEFAULT NULL,
   `IsEditable` bit(1) DEFAULT b'1',
   `Placeholder` varchar(100) DEFAULT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) NOT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `ServiceProviderID` int DEFAULT NULL,
   PRIMARY KEY (`ID`),
   KEY `FK_t_registrationsections_SectionID` (`SectionID`),
   CONSTRAINT `FK_t_registrationsections_SectionID` FOREIGN KEY (`SectionID`) REFERENCES `m_registrationsections` (`SectionID`)
 ) ;

CREATE TABLE if not exists `t_projectservicelinemapping` (
   `ID` int NOT NULL AUTO_INCREMENT,
   `ServiceLineId` int NOT NULL,
   `ServiceLine` varchar(45) NOT NULL,
   `StateId` int NOT NULL,
   `StateName` varchar(45) NOT NULL,
   `DistrictID` int NOT NULL,
   `DistrictName` varchar(50) NOT NULL,
   `BlockID` int NOT NULL,
   `BlockName` varchar(50) NOT NULL,
   `ProjectID` int NOT NULL,
   `ProjectName` varchar(50) NOT NULL,
   `ServiceProviderID` int NOT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) NOT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`ID`),
   KEY `ProjectID` (`ProjectID`),
   KEY `DistrictID` (`DistrictID`),
   KEY `StateId` (`StateId`),
   KEY `BlockID` (`BlockID`),
   CONSTRAINT `t_projectservicelinemapping_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `m_registrationprojects` (`ProjectID`),
   CONSTRAINT `t_projectservicelinemapping_ibfk_2` FOREIGN KEY (`DistrictID`) REFERENCES `m_district` (`DistrictID`),
   CONSTRAINT `t_projectservicelinemapping_ibfk_3` FOREIGN KEY (`StateId`) REFERENCES `m_state` (`StateID`),
   CONSTRAINT `t_projectservicelinemapping_ibfk_4` FOREIGN KEY (`BlockID`) REFERENCES `m_districtblock` (`BlockID`)
 ) ;

USE `db_iemr`;
CREATE 
    
 OR REPLACE VIEW `db_iemr`.`v_customizationdatafields` AS
    SELECT 
        UUID() AS `uuid`,
        `a`.`ServiceLineId` AS `ServiceLineId`,
        `a`.`ServiceLine` AS `ServiceLine`,
        `a`.`stateid` AS `stateid`,
        `a`.`StateName` AS `StateName`,
        `a`.`DistrictID` AS `DistrictID`,
        `a`.`DistrictName` AS `DistrictName`,
        `a`.`BlockID` AS `BlockID`,
        `a`.`BlockName` AS `BlockName`,
        `a`.`ProjectID` AS `ProjectID`,
        `a`.`ProjectName` AS `ProjectName`,
        `a`.`ServiceProviderID` AS `ServiceProviderID`,
        `a`.`SectionID` AS `SectionID`,
        `a`.`SectionName` AS `SectionName`,
        `a`.`FieldName` AS `FieldName`,
        `a`.`Placeholder` AS `Placeholder`,
        `a`.`FieldTypeID` AS `FieldTypeID`,
        `a`.`FieldType` AS `FieldType`,
        `a`.`Options` AS `Options`,
        `a`.`AllowMin` AS `AllowMin`,
        `a`.`AllowMax` AS `AllowMax`,
        `a`.`IsRequired` AS `IsRequired`,
        `a`.`FieldTitle` AS `FieldTitle`,
        `a`.`Rank` AS `Rank`,
        `a`.`AllowText` AS `AllowText`,
        `a`.`IsEditable` AS `IsEditable`
    FROM
        (SELECT DISTINCT
            `t1`.`ServiceLineId` AS `ServiceLineId`,
                `t1`.`ServiceLine` AS `ServiceLine`,
                `t1`.`StateId` AS `stateid`,
                `t1`.`StateName` AS `StateName`,
                `t1`.`DistrictID` AS `DistrictID`,
                `t1`.`DistrictName` AS `DistrictName`,
                `t1`.`BlockID` AS `BlockID`,
                `t1`.`BlockName` AS `BlockName`,
                `t1`.`ProjectID` AS `ProjectID`,
                `t1`.`ProjectName` AS `ProjectName`,
                `t1`.`ServiceProviderID` AS `ServiceProviderID`,
                `t2`.`SectionID` AS `SectionID`,
                `t2`.`SectionName` AS `SectionName`,
                `t3`.`FieldName` AS `FieldName`,
                `t3`.`Placeholder` AS `Placeholder`,
                `t3`.`FieldTypeID` AS `FieldTypeID`,
                `t3`.`FieldType` AS `FieldType`,
                `t3`.`Options` AS `Options`,
                `t3`.`AllowMin` AS `AllowMin`,
                `t3`.`AllowMax` AS `AllowMax`,
                `t3`.`IsRequired` AS `IsRequired`,
                `t3`.`FieldTitle` AS `FieldTitle`,
                `t3`.`Rank` AS `Rank`,
                `t3`.`AllowText` AS `AllowText`,
                `t3`.`IsEditable` AS `IsEditable`
        FROM
            (((`db_iemr`.`t_projectservicelinemapping` `t1`
        LEFT JOIN (SELECT 
            `db_iemr`.`t_mapsectionprojects`.`ID` AS `ID`,
                `db_iemr`.`t_mapsectionprojects`.`ProjectID` AS `ProjectID`,
                `db_iemr`.`t_mapsectionprojects`.`ProjectName` AS `ProjectName`,
                `db_iemr`.`t_mapsectionprojects`.`SectionID` AS `SectionID`,
                `db_iemr`.`t_mapsectionprojects`.`SectionName` AS `SectionName`,
                `db_iemr`.`t_mapsectionprojects`.`serviceProviderId` AS `serviceProviderId`,
                `db_iemr`.`t_mapsectionprojects`.`Deleted` AS `Deleted`,
                `db_iemr`.`t_mapsectionprojects`.`Processed` AS `Processed`,
                `db_iemr`.`t_mapsectionprojects`.`CreatedBy` AS `CreatedBy`,
                `db_iemr`.`t_mapsectionprojects`.`CreatedDate` AS `CreatedDate`,
                `db_iemr`.`t_mapsectionprojects`.`ModifiedBy` AS `ModifiedBy`,
                `db_iemr`.`t_mapsectionprojects`.`LastModDate` AS `LastModDate`
        FROM
            `db_iemr`.`t_mapsectionprojects`
        WHERE
            ((0 <> `db_iemr`.`t_mapsectionprojects`.`Deleted`)
                IS FALSE)) `t4` ON ((`t4`.`ProjectID` = `t1`.`ProjectID`)))
        LEFT JOIN `db_iemr`.`m_registrationsections` `t2` ON ((`t4`.`SectionID` = `t2`.`SectionID`)))
        LEFT JOIN `db_iemr`.`t_registrationfields` `t3` ON (((`t3`.`SectionID` = `t2`.`SectionID`)
            AND (`t1`.`ServiceProviderID` = `t3`.`ServiceProviderID`)
            AND ((0 <> `t3`.`Deleted`) IS FALSE)
            AND ((0 <> `t4`.`Deleted`) IS FALSE)))) UNION SELECT DISTINCT
            `t1`.`ServiceLineId` AS `ServiceLineId`,
                `t1`.`ServiceLine` AS `ServiceLine`,
                `t1`.`StateId` AS `stateid`,
                `t1`.`StateName` AS `StateName`,
                `t1`.`DistrictID` AS `DistrictID`,
                `t1`.`DistrictName` AS `DistrictName`,
                `t1`.`BlockID` AS `BlockID`,
                `t1`.`BlockName` AS `BlockName`,
                `t1`.`ProjectID` AS `ProjectID`,
                `t1`.`ProjectName` AS `ProjectName`,
                `t1`.`ServiceProviderID` AS `ServiceProviderID`,
                `t2`.`SectionID` AS `SectionID`,
                `t2`.`SectionName` AS `SectionName`,
                `t3`.`FieldName` AS `FieldName`,
                `t3`.`Placeholder` AS `Placeholder`,
                `t3`.`FieldTypeID` AS `FieldTypeID`,
                `t3`.`FieldType` AS `FieldType`,
                `t3`.`Options` AS `Options`,
                `t3`.`AllowMin` AS `AllowMin`,
                `t3`.`AllowMax` AS `AllowMax`,
                `t3`.`IsRequired` AS `IsRequired`,
                `t3`.`FieldTitle` AS `FieldTitle`,
                `t3`.`Rank` AS `Rank`,
                `t3`.`AllowText` AS `AllowText`,
                `t3`.`IsEditable` AS `IsEditable`
        FROM
            (((`db_iemr`.`t_projectservicelinemapping` `t1`
        LEFT JOIN (SELECT 
            `db_iemr`.`t_mapsectionprojects`.`ID` AS `ID`,
                `db_iemr`.`t_mapsectionprojects`.`ProjectID` AS `ProjectID`,
                `db_iemr`.`t_mapsectionprojects`.`ProjectName` AS `ProjectName`,
                `db_iemr`.`t_mapsectionprojects`.`SectionID` AS `SectionID`,
                `db_iemr`.`t_mapsectionprojects`.`SectionName` AS `SectionName`,
                `db_iemr`.`t_mapsectionprojects`.`serviceProviderId` AS `serviceProviderId`,
                `db_iemr`.`t_mapsectionprojects`.`Deleted` AS `Deleted`,
                `db_iemr`.`t_mapsectionprojects`.`Processed` AS `Processed`,
                `db_iemr`.`t_mapsectionprojects`.`CreatedBy` AS `CreatedBy`,
                `db_iemr`.`t_mapsectionprojects`.`CreatedDate` AS `CreatedDate`,
                `db_iemr`.`t_mapsectionprojects`.`ModifiedBy` AS `ModifiedBy`,
                `db_iemr`.`t_mapsectionprojects`.`LastModDate` AS `LastModDate`
        FROM
            `db_iemr`.`t_mapsectionprojects`
        WHERE
            ((0 <> `db_iemr`.`t_mapsectionprojects`.`Deleted`)
                IS FALSE)) `t4` ON ((`t4`.`ProjectID` = `t1`.`ProjectID`)))
        LEFT JOIN `db_iemr`.`m_registrationsections` `t2` ON ((`t4`.`SectionID` = `t2`.`SectionID`)))
        LEFT JOIN `db_iemr`.`t_registrationfields` `t3` ON (((`t3`.`SectionID` = `t2`.`SectionID`)
            AND ((0 <> `t3`.`Deleted`) IS FALSE)
            AND ((0 <> `t4`.`Deleted`) IS FALSE))))
        WHERE
            (`t3`.`ServiceProviderID` = 0)) `a`
    WHERE
        (`a`.`Rank` IS NOT NULL);


USE `db_iemr`;
CREATE 
    
 OR REPLACE VIEW `v_get_prkngplc_dist_zone_state_from_spid` AS
    SELECT 
        `m_sp`.`ProviderServiceMapID` AS `ProviderServiceMapID`,
        `m_sp`.`ServicePointID` AS `ServicePointID`,
        `m_sp`.`ParkingPlaceID` AS `ParkingPlaceID`,
        `m_pp`.`ParkingPlaceName` AS `ParkingPlaceName`,
        `m_ppsdm`.`DistrictID` AS `DistrictID`,
        `m_d`.`DistrictName` AS `DistrictName`,
        `m_zdm`.`ZoneID` AS `ZoneID`,
        `m_z`.`ZoneName` AS `ZoneName`,
        `m_d`.`StateID` AS `StateID`,
        `m_s`.`StateName` AS `StateName`,
        `m_b`.`BlockID` AS `blockid`,
        `m_b`.`BlockName` AS `blockname`
    FROM
        ((((((((`m_servicepoint` `m_sp`
        JOIN `m_parkingplacesubdistrictmap` `m_ppsdm` ON (((`m_sp`.`ParkingPlaceID` = `m_ppsdm`.`ParkingPlaceID`)
            AND (`m_sp`.`ProviderServiceMapID` = `m_ppsdm`.`ProviderServiceMapID`)
            AND ((0 <> `m_ppsdm`.`Deleted`) IS FALSE))))
        JOIN `m_zonedistrictmap` `m_zdm` ON (((`m_zdm`.`DistrictID` = `m_ppsdm`.`DistrictID`)
            AND (`m_zdm`.`ProviderServiceMapID` = `m_ppsdm`.`ProviderServiceMapID`)
            AND ((0 <> `m_zdm`.`Deleted`) IS FALSE))))
        JOIN `m_parkingplace` `m_pp` ON (((`m_sp`.`ParkingPlaceID` = `m_pp`.`ParkingPlaceID`)
            AND ((0 <> `m_pp`.`Deleted`) IS FALSE))))
        JOIN `m_district` `m_d` ON (((`m_d`.`DistrictID` = `m_zdm`.`DistrictID`)
            AND ((0 <> `m_d`.`Deleted`) IS FALSE))))
        JOIN `m_districtblock` `m_b` ON ((`m_b`.`DistrictID` = `m_d`.`DistrictID`)))
        JOIN `m_userservicerolemapping` `usrm` ON ((`usrm`.`Blockid` = `m_b`.`BlockID`)))
        JOIN `m_zone` `m_z` ON (((`m_zdm`.`ZoneID` = `m_z`.`ZoneID`)
            AND ((0 <> `m_z`.`Deleted`) IS FALSE))))
        JOIN `m_state` `m_s` ON (((`m_d`.`StateID` = `m_s`.`StateID`)
            AND ((0 <> `m_s`.`Deleted`) IS FALSE))))
    WHERE
        ((0 <> `m_sp`.`Deleted`) IS FALSE);

use db_iemr;

alter table m_providerserviceaddmapping add AbdmFacilityID VARCHAR(20)  DEFAULT NULL;

alter table m_providerserviceaddmapping add AbdmFacilityName VARCHAR(100)  DEFAULT NULL;

alter table t_benvisitdetail add AbdmFacilityID varchar(20)  DEFAULT NULL after CarecontextLinkDate;



USE `db_iemr`;
CREATE 
    
 OR REPLACE VIEW `showofficedetails` AS
    SELECT 
        `psam`.`PSAddMapID` AS `PSAddMapID`,
        `psam`.`ProviderServiceMapID` AS `ProviderServiceMapID`,
        `psm`.`ServiceProviderID` AS `ServiceProviderID`,
        `sp`.`ServiceProviderName` AS `ServiceProviderName`,
        `psm`.`StateID` AS `StateID`,
        `st`.`StateName` AS `StateName`,
        `psm`.`ServiceID` AS `ServiceID`,
        `sm`.`ServiceName` AS `ServiceName`,
        `sm`.`IsNational` AS `IsNational`,
        `psam`.`DistrictID` AS `DistrictID`,
        `dis`.`DistrictName` AS `DistrictName`,
        `psam`.`LocationName` AS `LocationName`,
        `psam`.`Address` AS `Address`,
        `psam`.`Deleted` AS `Deleted`,
        `psam`.`CreatedBy` AS `CreatedBy`,
        `psam`.`CreatedDate` AS `CreatedDate`,
        `psam`.`ModifiedBy` AS `ModifiedBy`,
        `psam`.`LastModDate` AS `LastModDate`,
        `psam`.`AbdmFacilityID` AS `AbdmFacilityId`,
        `psam`.`AbdmFacilityName` AS `AbdmFacilityName`
    FROM
        (((((`m_providerserviceaddmapping` `psam`
        LEFT JOIN `m_providerservicemapping` `psm` ON ((`psam`.`ProviderServiceMapID` = `psm`.`ProviderServiceMapID`)))
        LEFT JOIN `m_district` `dis` ON ((`psam`.`DistrictID` = `dis`.`DistrictID`)))
        LEFT JOIN `m_serviceprovider` `sp` ON ((`psm`.`ServiceProviderID` = `sp`.`ServiceProviderID`)))
        LEFT JOIN `m_state` `st` ON ((`psm`.`StateID` = `st`.`StateID`)))
        LEFT JOIN `m_servicemaster` `sm` ON ((`psm`.`ServiceID` = `sm`.`ServiceID`)));


USE `db_iemr`;
DROP procedure IF EXISTS `PR_FetchECDChildOutboundWorklist`;

USE `db_iemr`;
DROP procedure IF EXISTS `db_iemr`.`PR_FetchECDChildOutboundWorklist`;
;

DELIMITER $$
USE `db_iemr`$$
CREATE PROCEDURE `PR_FetchECDChildOutboundWorklist`(v_AllocatedUserID int)
BEGIN

 declare v_NextAttemptPeriod int(11);
select distinct NextAttemptPeriod into v_NextAttemptPeriod from m_mctscallconfiguration where current_date() between effectivefrom and EffectiveUpto 
and OutboundCallType like '%ecd%' 
 and deleted is false;
 
 /*select
distinct B.BeneficiaryRegID,
B.OutboundCallType,
B.DisplayOBCallType,
B.CallDateFrom,
B.NoOfTrials,
B.MCTSID_no_Child_ID,
B.Child_Name,
B.Mother_ID,
B.Mother_Name,
B.Phone_No_of,
B.Phone_No,
B.OBCallID,
B.Address,B.healthblock,B.PHC_Name ,
B.subfacility,
B.ASHA_Name,B.ANM_Name,B.dob,
B.nextcalldate,B.ishrni,
B.lapsetime,B.CreatedDate recorduploaddate,
fatherName,
gender,
stateId,
stateName,
districtId,
districtName,
blockId,
blockName,
districtBranchId,
districtBranchName,
alternatePhoneNo,
ashaPhoneNo,
anmPhoneNo,isCallDisconnected,sort_createddate

from
(SELECT MIN(A.OutboundCallType) OutboundCallType,
A.childID,
A.BeneficiaryRegID,
A.DisplayOBCallType,A.CallDateFrom,
A.NoOfTrials,
A.MCTSID_no_Child_ID,
A.Child_Name,
A.Mother_ID,
A.Mother_Name,
A.Phone_No_of,
A.Phone_No,
A.OBCallID,
A.Address,A.healthblock,A.PHC_Name ,
A.subfacility,
A.ASHA_Name,A.ANM_Name,A.dob,
A.nextcalldate,A.ishrni,A.CreatedDate,
A.lapsetime,
fatherName,
gender,
stateId,
stateName,
districtId,
districtName,
blockId,
blockName,
districtBranchId,
districtBranchName,
alternatePhoneNo,
ashaPhoneNo,
anmPhoneNo,isCallDisconnected,A.sort_createddate
FROM
(select mctsoutbou0_.childID, mctsoutbou0_.OutboundCallType,
mctsoutbou0_.DisplayOBCallType,
mctsoutbou0_.CallDateFrom,
mctsoutbou0_.NoOfTrials,
mctsoutbou0_.OBCallID,
mctsdatare1_.MCTSID_no_Child_ID,
mctsdatare1_.BeneficiaryRegID,
mctsdatare1_.Child_Name,
mctsdatare1_.Mother_ID,
mctsdatare1_.Mother_Name,
mctsdatare1_.Phone_No_of,
mctsdatare1_.Phone_No,
mctsdatare1_.Address,mctsdatare1_.Block_Name healthblock,mctsdatare1_.PHC_Name ,
mctsdatare1_.SubCenter_Name subfacility,
mctsdatare1_.ASHA_Name,mctsdatare1_.ANM_Name,mctsdatare1_.dob,
mctsoutbou0_.PrefferedCallDate nextcalldate,mctsoutbou0_.ishrni,mctsdatare1_.CreatedDate,
datediff(current_date(),mctsdatare1_.CreatedDate) lapsetime,
mctsdatare1_.Father_Name fatherName,
mctsdatare1_.Gender gender,
mctsdatare1_.State_ID stateId,
mctsdatare1_.State_Name stateName,
mctsdatare1_.District_ID districtId,
mctsdatare1_.District_Name districtName,
mctsdatare1_.Block_ID blockId,
mctsdatare1_.Block_Name blockName,
mctsdatare1_.Village_ID districtBranchId,
mctsdatare1_.Village_Name districtBranchName,
null alternatePhoneNo,
mctsdatare1_.ASHA_Phone_No ashaPhoneNo,
mctsdatare1_.ANM_Phone_No anmPhoneNo
,case when b.isCallDisconnected is null then 0 when b.isCallDisconnected is false then 1 
 when b.isCallDisconnected is true then 2 end isCallDisconnected,
b.createddate sort_createddate 
from t_MCTSOutboundCalls mctsoutbou0_
inner join t_childvaliddata mctsdatare1_ on mctsoutbou0_.childID=mctsdatare1_.MCTSID_no_Child_ID
left join (select obcallid,max(createddate) max_createddate from t_bencall group by obcallid) b2 on b2.obcallid=mctsoutbou0_.obcallid
left join t_bencall b on b.obcallid=b2.obcallid and b.createddate=b2.max_createddate
where mctsoutbou0_.AllocatedUserID=v_AllocatedUserID and  mctsoutbou0_.deleted is false and
(mctsoutbou0_.CallStatus<>'Completed' and mctsoutbou0_.CallStatus<>'NA' )
and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_timestamp())
-- AND(current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)

AND  case when ((v_NextAttemptPeriod=0) or ( NoOfTrials=0))   then (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
 else
 -- mctsoutbou0_.nooftrials>0 and 
 v_NextAttemptPeriod>0 and
 -- ((v_NextAttemptPeriod=0) or ( NoOfTrials=0)) and-- need to crosscheck
 -- date(mctsoutbou0_.lastmoddate)!=date(current_timestamp() ) and
  date(current_timestamp() )
  >=date(date_add(mctsoutbou0_.lastmoddate,interval v_NextAttemptPeriod day))
   and (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo) end
) A
group by A.childID)B
*/
-- UNION

 select
distinct B.BeneficiaryRegID,
B.OutboundCallType,
B.DisplayOBCallType,
B.CallDateFrom,
B.NoOfTrials,
B.MCTSID_no_Child_ID,
B.Child_Name,
B.Mother_ID,
B.Mother_Name,
B.Phone_No_of,
B.Phone_No,
B.OBCallID,
B.Address,B.healthblock,B.PHC_Name ,
B.subfacility,
B.ASHA_Name,B.ANM_Name,B.dob,
B.nextcalldate,B.ishrni,
B.lapsetime,B.CreatedDate recorduploaddate,
fatherName,
gender,
stateId,
stateName,
districtId,
districtName,
blockId,
blockName,
districtBranchId,
districtBranchName,
alternatePhoneNo,
ashaPhoneNo,
anmPhoneNo,isCallDisconnected,sort_createddate

from
(SELECT 
  CONCAT( MAX(case when  A.OutboundCallType='introductory' then 'introductory' when length(A.OutboundCallType)=4 then concat('ECD',right(A.OutboundCallType,1))
else concat('ECD',right(A.OutboundCallType,2)) end )) AS OutboundCallType,
A.childID,
A.BeneficiaryRegID,
A.DisplayOBCallType,
A.CallDateFrom,
A.NoOfTrials,
A.MCTSID_no_Child_ID,
A.Child_Name,
A.Mother_ID,
A.Mother_Name,
A.Phone_No_of,
A.Phone_No,
A.OBCallID,
A.Address,A.healthblock,A.PHC_Name ,
A.subfacility,
A.ASHA_Name,A.ANM_Name,A.dob,
A.nextcalldate,A.ishrni,A.CreatedDate,
A.lapsetime,
fatherName,
gender,
stateId,
stateName,
districtId,
districtName,
blockId,
blockName,
districtBranchId,
districtBranchName,
alternatePhoneNo,
ashaPhoneNo,
anmPhoneNo,isCallDisconnected,sort_createddate
FROM
(select mctsoutbou0_.childID, mctsoutbou0_.OutboundCallType,
mctsoutbou0_.DisplayOBCallType,
mctsoutbou0_.CallDateFrom,
mctsoutbou0_.NoOfTrials,
mctsoutbou0_.OBCallID,
mctsdatare1_.MCTSID_no_Child_ID,
mctsdatare1_.BeneficiaryRegID,
mctsdatare1_.Child_Name,
mctsdatare1_.Mother_ID,
mctsdatare1_.Mother_Name,
mctsdatare1_.Phone_No_of,
mctsdatare1_.Phone_No,
mctsdatare1_.Address,mctsdatare1_.Block_Name healthblock,mctsdatare1_.PHC_Name ,
mctsdatare1_.SubCenter_Name subfacility,
mctsdatare1_.ASHA_Name,mctsdatare1_.ANM_Name,mctsdatare1_.dob,
mctsoutbou0_.PrefferedCallDate nextcalldate,mctsoutbou0_.ishrni,mctsdatare1_.CreatedDate,
datediff(current_date(),mctsdatare1_.CreatedDate) lapsetime,
mctsdatare1_.Father_Name fatherName,
mctsdatare1_.Gender gender,
mctsdatare1_.State_ID stateId,
mctsdatare1_.State_Name stateName,
mctsdatare1_.District_ID districtId,
mctsdatare1_.District_Name districtName,
mctsdatare1_.Block_ID blockId,
mctsdatare1_.Block_Name blockName,
mctsdatare1_.Village_ID districtBranchId,
mctsdatare1_.Village_Name districtBranchName,
null alternatePhoneNo,
mctsdatare1_.ASHA_Phone_No ashaPhoneNo,
mctsdatare1_.ANM_Phone_No anmPhoneNo
,case when b.isCallDisconnected is null then 0 when b.isCallDisconnected is false then 1 
 when b.isCallDisconnected is true then 2 end isCallDisconnected,
b.createddate sort_createddate 
from t_MCTSOutboundCalls mctsoutbou0_
inner join t_childvaliddata mctsdatare1_ on mctsoutbou0_.childID=mctsdatare1_.MCTSID_no_Child_ID
left join (select obcallid,max(createddate) max_createddate from t_bencall group by obcallid) b2 on b2.obcallid=mctsoutbou0_.obcallid
left join t_bencall b on b.obcallid=b2.obcallid and b.createddate=b2.max_createddate
where mctsoutbou0_.AllocatedUserID=v_AllocatedUserID and  mctsoutbou0_.deleted is false and
(mctsoutbou0_.CallStatus<>'Completed' and mctsoutbou0_.CallStatus<>'NA' )
and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_timestamp())
-- AND(current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)

AND  case when ((v_NextAttemptPeriod=0) or ( NoOfTrials=0))   then (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
 else
 -- mctsoutbou0_.nooftrials>0 and 
 v_NextAttemptPeriod>0 and
 -- ((v_NextAttemptPeriod=0) or ( NoOfTrials=0)) and-- need to crosscheck
 -- date(mctsoutbou0_.lastmoddate)!=date(current_timestamp() ) and
  date(current_timestamp() )
  >=date(date_add(mctsoutbou0_.lastmoddate,interval v_NextAttemptPeriod day))
   and (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo) end
) A
group by A.childID)B  order by isCallDisconnected,sort_createddate asc;-- ,Createdate asc;



END$$

DELIMITER ;
;


USE `db_iemr`;
DROP procedure IF EXISTS `PR_FetchECDMotherOutboundWorklist`;

USE `db_iemr`;
DROP procedure IF EXISTS `db_iemr`.`PR_FetchECDMotherOutboundWorklist`;
;

DELIMITER $$
USE `db_iemr`$$
CREATE  PROCEDURE `PR_FetchECDMotherOutboundWorklist`(v_AllocatedUserID int)
BEGIN
 declare v_NextAttemptPeriod int(11);
select distinct NextAttemptPeriod into v_NextAttemptPeriod from m_mctscallconfiguration
 where current_date() between effectivefrom and EffectiveUpto 
and OutboundCallType like '%ecd%' 
 and deleted is false;
 
-- select v_NextAttemptPeriod;
 
-- select date(ifnull(null,date_add(current_date(),interval v_NextAttemptPeriod day)));
 
 -- select lastmoddate,date_add(lastmoddate,interval 2 day) from t_mctsoutboundcalls order by 1 desc limit 2;
select * from (
select 
distinct B.OBCallID,B.BeneficiaryRegID BeneficiaryRegID,
B.AllocatedUserID,
B.ProviderServiceMapID,
B.OutboundCallType OutboundCallType,B.CallDateFrom,B.NoOfTrials,
B.DisplayOBCallType,
B.Name,
B.MCTSID_no,
B.PhoneNo_Of_Whom,
B.Whom_PhoneNo,
B.High_Risk,
B.Husband_Name,B.Address,B.Block_Name,
B.PHC_Name,B.subfacility,B.LMP_Date,
B.ASHA_Name,B.ANM_Name,B.nextcalldate,
B.lapsetime,B.recorduploaddate,edd,
B.gender,
B.stateId,
B.stateName,
B.districtId,
B.districtName,
B.blockId,
B.blockName,
B.districtBranchId,
B.districtBranchName,
B.alternatePhoneNo,
B.ashaPhoneNo,
B.anmPhoneNo,
B.Age /* New column */
,B.isCallDisconnected
,B.sort_createddate

from 
(SELECT distinct A.OutboundCallType OutboundCallType, 
A.motherID,
A.OBCallID,
A.ChildID,
A.AllocatedUserID,
A.ProviderServiceMapID,
A.DisplayOBCallType,
A.CallDateFrom,
A.NoOfTrials,
A.BeneficiaryRegID,
A.MCTSID_no,
A.Name,
A.PhoneNo_Of_Whom,
A.Whom_PhoneNo,
A.High_Risk,
A.Husband_Name,A.Address,A.Block_Name,
A.PHC_Name,A.subfacility,A.LMP_Date,
A.ASHA_Name,A.ANM_Name,A.nextcalldate,
A.lapsetime,A.recorduploaddate,edd,
A.gender,
A.stateId,
A.stateName,
A.districtId,
A.districtName,
A.blockId,
A.blockName,
A.districtBranchId,
A.districtBranchName,
A.alternatePhoneNo,
A.ashaPhoneNo,
A.anmPhoneNo,
A.Age /* New column */,
A.isCallDisconnected,A.sort_createddate
FROM
(select distinct mctsoutbou0_.motherID, mctsoutbou0_.OutboundCallType,
mctsoutbou0_.OBCallID,
mctsoutbou0_.ChildID,
mctsoutbou0_.AllocatedUserID,
mctsoutbou0_.ProviderServiceMapID,
mctsoutbou0_.DisplayOBCallType,
mctsoutbou0_.CallDateFrom,
mctsoutbou0_.NoOfTrials,

mctsdatare1_.BeneficiaryRegID,
mctsdatare1_.MCTSID_no,
mctsdatare1_.Name,
mctsdatare1_.PhoneNo_Of_Whom,
mctsdatare1_.Whom_PhoneNo,
mctsdatare1_.High_Risk,
mctsdatare1_.Husband_Name,mctsdatare1_.Address,mctsdatare1_.Block_Name,
mctsdatare1_.PHC_Name,mctsdatare1_.Facility_Name subfacility,mctsdatare1_.LMP_Date,
mctsdatare1_.ASHA_Name,mctsdatare1_.ANM_Name,mctsoutbou0_.PrefferedCallDate nextcalldate,
datediff(current_date(),mctsdatare1_.CreatedDate) lapsetime,mctsdatare1_.CreatedDate "recorduploaddate",
mctsdatare1_.edd,
'Female' gender,
mctsdatare1_.State_ID stateId,
mctsdatare1_.State_Name stateName,
mctsdatare1_.District_ID districtId,
mctsdatare1_.District_Name districtName,
mctsdatare1_.Block_ID blockId,
mctsdatare1_.Block_Name blockName,
mctsdatare1_.Village_ID districtBranchId,
mctsdatare1_.Village_Name districtBranchName,
null alternatePhoneNo,
mctsdatare1_.ASHA_Ph ashaPhoneNo,
mctsdatare1_.ANM_Ph anmPhoneNo,
mctsdatare1_.Age /* New column */
,case when b.isCallDisconnected is null then 0 when b.isCallDisconnected is false then 1 
 when b.isCallDisconnected is true then 2 end isCallDisconnected,
b.createddate sort_createddate 
from t_MCTSOutboundCalls mctsoutbou0_
inner join t_mothervalidrecord mctsdatare1_ on mctsoutbou0_.motherID=mctsdatare1_.MCTSID_no
left join (select obcallid,max(createddate) max_createddate from t_bencall group by obcallid) b2 on b2.obcallid=mctsoutbou0_.obcallid
left join t_bencall b on b.obcallid=b2.obcallid and b.createddate=b2.max_createddate
where mctsoutbou0_.AllocatedUserID = v_AllocatedUserID and  mctsoutbou0_.Deleted is false and -- added false check on 04042024
(mctsoutbou0_.CallStatus <>'Completed' and  mctsoutbou0_.CallStatus<>'NA')
 and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_timestamp())
 AND  case when ((v_NextAttemptPeriod=0) or ( NoOfTrials=0)) then (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
 else 
 -- mctsoutbou0_.nooftrials>0 and 
 v_NextAttemptPeriod>0 and
 -- date(mctsoutbou0_.lastmoddate)!=date(current_timestamp() ) and
  date(current_timestamp() )
  >=date(date_add(mctsoutbou0_.lastmoddate,interval v_NextAttemptPeriod day))
   and (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo) end
) A

)
B)C  order by isCallDisconnected,sort_createddate asc;-- ,Createdate asc;

END$$

DELIMITER ;
;



