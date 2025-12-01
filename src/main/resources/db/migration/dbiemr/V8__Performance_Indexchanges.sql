
use db_iemr;


-- create index  inx_IsHighRisk on t_mctsoutboundcalls(IsHighRisk);
-- create index  inx_isFurtherCallRequired on t_mctsoutboundcalls(isFurtherCallRequired);
-- create index  inx_DisplayOBCallType on t_mctsoutboundcalls(DisplayOBCallType);
-- create index  inx_iszerocall on t_bencall(iszerocall);

USE db_iemr;

-----------------------------------------------------------
-- 1️⃣ Index: inx_IsHighRisk ON t_mctsoutboundcalls(IsHighRisk)
-----------------------------------------------------------
SET @idx1 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 't_mctsoutboundcalls'
      AND INDEX_NAME = 'inx_IsHighRisk'
);

SET @sql1 := IF(
    @idx1 = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD INDEX inx_IsHighRisk (IsHighRisk);',
    'SELECT "Index inx_IsHighRisk already exists";'
);

PREPARE stmt1 FROM @sql1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;


-----------------------------------------------------------
-- 2️⃣ Index: inx_isFurtherCallRequired (isFurtherCallRequired)
-----------------------------------------------------------
SET @idx2 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 't_mctsoutboundcalls'
      AND INDEX_NAME = 'inx_isFurtherCallRequired'
);

SET @sql2 := IF(
    @idx2 = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD INDEX inx_isFurtherCallRequired (isFurtherCallRequired);',
    'SELECT "Index inx_isFurtherCallRequired already exists";'
);

PREPARE stmt2 FROM @sql2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;


-----------------------------------------------------------
-- 3️⃣ Index: inx_DisplayOBCallType (DisplayOBCallType)
-----------------------------------------------------------
SET @idx3 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 't_mctsoutboundcalls'
      AND INDEX_NAME = 'inx_DisplayOBCallType'
);

SET @sql3 := IF(
    @idx3 = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD INDEX inx_DisplayOBCallType (DisplayOBCallType);',
    'SELECT "Index inx_DisplayOBCallType already exists";'
);

PREPARE stmt3 FROM @sql3;
EXECUTE stmt3;
DEALLOCATE PREPARE stmt3;


-----------------------------------------------------------
-- 4️⃣ Index: inx_iszerocall ON t_bencall(iszerocall)
-----------------------------------------------------------
SET @idx4 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 't_bencall'
      AND INDEX_NAME = 'inx_iszerocall'
);

SET @sql4 := IF(
    @idx4 = 0,
    'ALTER TABLE t_bencall ADD INDEX inx_iszerocall (iszerocall);',
    'SELECT "Index inx_iszerocall already exists";'
);

PREPARE stmt4 FROM @sql4;
EXECUTE stmt4;
DEALLOCATE PREPARE stmt4;






use db_iemr;
CREATE TABLE if not exists `t_grievanceworklist` (
   `gwid` bigint NOT NULL AUTO_INCREMENT,
   `Grievanceid` bigint NOT NULL,
   `BeneficiaryRegID` bigint DEFAULT NULL,
   `Bencallid` bigint DEFAULT NULL,
   `ProviderServiceMapID` int DEFAULT NULL,
   `complaintID` varchar(100) NOT NULL,
   `subjectOfComplaint` varchar(100) DEFAULT NULL,
   `Complaint` longtext,
   `PrimaryNumber` varchar(20) DEFAULT NULL,
   `Severety` varchar(30) NOT NULL,
   `Level` int NOT NULL,
   `State` varchar(100) NOT NULL,
   `isRegistered` bit(1) DEFAULT b'0',
   `userid` int DEFAULT NULL,
   `isAllocated` bit(1) DEFAULT b'0',
   `retryNeeded` bit(1) DEFAULT b'1',
   `callCounter` int DEFAULT '0',
   `preferredLanguage` varchar(45) DEFAULT NULL,
   `preferredLanguageId` int DEFAULT NULL,
   `ComplaintResolution` varchar(300) DEFAULT NULL,
   `Remarks` varchar(5000) DEFAULT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) NOT NULL DEFAULT 'N',
   `CreatedBy` varchar(50) NOT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `VanSerialNo` bigint DEFAULT NULL,
   `VanID` int DEFAULT NULL,
   `VehicalNo` varchar(30) DEFAULT NULL,
   `ParkingPlaceID` int DEFAULT NULL,
   `SyncedBy` varchar(30) DEFAULT NULL,
   `SyncedDate` datetime DEFAULT NULL,
   `isCompleted` bit(1) DEFAULT b'0',
   PRIMARY KEY (`gwid`),
   KEY `inx_BeneficiaryRegID` (`BeneficiaryRegID`),
   KEY `inx_Bencallid` (`Bencallid`),
   KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`)
 ) ;

CREATE TABLE if not exists `t_grievancetransaction` (
   `gtid` bigint NOT NULL AUTO_INCREMENT,
   `gwid` bigint NOT NULL,
   `Grievanceid` bigint NOT NULL,
   `FileName` varchar(500) DEFAULT NULL,
   `FileType` varchar(500) DEFAULT NULL,
   `Redressed` varchar(20) DEFAULT NULL,
   `createdAt` datetime NOT NULL,
   `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `Comments` varchar(500) DEFAULT NULL,
   `ProviderServiceMapID` int DEFAULT NULL,
   `Deleted` bit(1) DEFAULT b'0',
   `Processed` char(4) DEFAULT NULL,
   `CreatedBy` varchar(50) DEFAULT NULL,
   `CreatedDate` datetime DEFAULT NULL,
   `ModifiedBy` varchar(50) DEFAULT NULL,
   `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `actionTakenBy` varchar(100) DEFAULT NULL,
   `status` varchar(100) DEFAULT NULL,
   PRIMARY KEY (`gtid`),
   KEY `inx_gwid` (`gwid`),
   KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
   CONSTRAINT `t_grievancetransaction_gtid` FOREIGN KEY (`gwid`) REFERENCES `t_grievanceworklist` (`gwid`),
   CONSTRAINT `t_grievancetransaction_ProviderServiceMapID` FOREIGN KEY (`ProviderServiceMapID`) REFERENCES `m_providerservicemapping` (`ProviderServiceMapID`)
 ) ;



USE `db_iemr`;
DROP procedure IF EXISTS `db_iemr`.`Pr_Grievanceworklist`;
;

DELIMITER $$
USE `db_iemr`$$
CREATE  PROCEDURE `Pr_Grievanceworklist`(Userid int(11))
begin
select distinct t1.complaintID,t1.grievanceid,
ft.feedbacktypename "SubjectOfComplaint",t3.feedback as Complaint,t1.BeneficiaryRegID,t1.ProviderServiceMapID,
PrimaryNumber,
-- FileName, FileType,redressed,createdAt,updatedAt,t2.Comments,
Severety,state,t1.userid,
t1.deleted,t1.createdBy,t1.createdDate,t1.lastModDate,isCompleted,
firstname,lastname, gender,ba.permdistrict  district,
beneficiaryID,cast(DATE_FORMAT(FROM_DAYS(DATEDIFF(CURDATE(),dob)), '%Y')+0 as SIGNED)   age,
retryNeeded,callCounter
-- t2.actionTakenBy,t2.status
-- ,lastCall
from t_grievanceworklist t1
inner join t_grievancetransaction t2 on t1.gwid=t2.gwid
left join t_feedback t3 on  t3.requestid=t1.complaintID
LEFT JOIN db_identity.i_beneficiarymapping BM ON BM.benregid = t1.beneficiaryregid
left join db_identity.i_BeneficiaryDetails BD ON BM.BenDetailsId = BD.BeneficiaryDetailsId
-- LEFT JOIN db_identity.i_BeneficiaryContacts BC ON BC.BenContactsID = BM.BenContactsId
LEFT JOIN db_identity.i_beneficiaryaddress BA ON BA.BenAddressID = BM.BenAddressId
LEFT JOIN db_identity.m_beneficiaryregidmapping BR ON BR.BenRegId = BM.BenRegId
left join m_feedbacktype ft on ft.feedbacktypeid=t3.feedbacktypeid
-- left join db_iemr.m_districtbranchmapping md on md.DistrictBranchID=BA.PermVillageID
where t1.callcounter<3 and t1.iscompleted is false and
-- t1.providerServiceMapId=ifnull(null,t1.providerServiceMapId)
 t1.userid=ifnull(Userid,t1.userid);
end$$

DELIMITER ;
;



USE `db_iemr`;
DROP procedure IF EXISTS `db_iemr`.`Pr_QualityAuditorWorklist`;
;

DELIMITER $$
USE `db_iemr`$$
CREATE  PROCEDURE `Pr_QualityAuditorWorklist`(v_fromdate datetime,v_todate datetime,v_psmrid int(11),
v_languageid int(11),v_agentid int(11),v_roleid int(11),v_isvalid bit(1),
v_cycle int(11),v_Prfromdate datetime,v_Prtodate datetime)
begin

declare v_anc int(11);
declare v_pnc int(11);

declare v_anccount int(11);

declare v_pnccount int(11);

declare v_ancpnc int(11);

declare v_rolename varchar(100);
declare v_intrcount int(11);
select distinct ANC_SampleSize into v_anc from m_samplesize where CycleID=v_cycle and ProviderServiceMapID=v_psmrid 
 and deleted is false limit 1;
-- into v_anc
select distinct PNC_SampleSize into v_pnc from m_samplesize where CycleID=v_cycle and ProviderServiceMapID=v_psmrid 
 and deleted is false limit 1;

select count(1) into v_intrcount from t_bencall t1
inner join t_mctsoutboundcalls t2 on t1.obcallid=t2.obcallid
 where t1.CreatedDate>=v_Prfromdate 
 and t1.CreatedDate<=v_Prtodate
  and t1.callreceiveduserid=v_agentid
  and t2.DisplayOBCallType like '%introductory%' and t1.calledserviceid=1714
 and iszerocall is true;

select count(1) into v_anccount from t_bencall t1
inner join t_mctsoutboundcalls t2 on t1.obcallid=t2.obcallid
 where t1.CreatedDate>=v_Prfromdate 
 and t1.CreatedDate<=v_Prtodate
  and t1.callreceiveduserid=v_agentid
  and t2.DisplayOBCallType like '%anc%' and t1.calledserviceid=1714
 and iszerocall is true;
 

 /*
 select count(1) into v_pnccount from t_bencall t1
inner join t_mctsoutboundcalls t2 on t1.obcallid=t2.obcallid
 where date(t1.CreatedDate)>=v_Prfromdate and date(t1.CreatedDate)<=v_Prtodate
   and t1.callreceiveduserid=v_agentid
  and t2.DisplayOBCallType like '%pnc%' and t2.providerservicemapid=1714
 and iszerocall is true;*/
 
  select count(1) into v_pnccount from t_bencall t1
inner join t_mctsoutboundcalls t2 on t1.obcallid=t2.obcallid
 where t1.CreatedDate>=v_Prfromdate and t1.CreatedDate<=v_Prtodate
   and t1.callreceiveduserid=v_agentid
  and t2.DisplayOBCallType like '%pnc%' and t1.calledserviceid=1714
 and iszerocall is true;
 

select rolename into v_rolename from m_role r2 
where roleid=v_roleid and 
providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid) limit 1;

-- select v_anc,v_anccount,v_pnc,v_pnccount;


if(v_anccount>0) then
set v_anc=v_anc+1;
end if;
if(v_pnccount>0) then
set v_pnc=v_pnc+1;
end if;
set v_ancpnc=v_anc+v_pnc;

-- select v_anc,v_pnc,v_ancpnc;

if(v_intrcount>0) then
set v_ancpnc=v_ancpnc+1;
end if;

if((v_rolename='Associate') and (v_isvalid is true)) then
select distinct br.beneficiaryid,concat(ifnull(bd.firstname,''),' ',ifnull(bd.lastname,'')) Beneficiaryname,
t.PhoneNo,t.receivedagentid Agentid,concat(ifnull(u.FirstName,''),' ',ifnull(u.LastName,'')) Agetname,ct.calltype,
t.bencallid,t.isCallAudited,  o.OutboundCallType,r.roleid,r.rolename,t.callid
from (select * from t_bencall where CreatedDate between v_fromdate and v_todate
and IsVerified is true and isCallAnswered is true 
and isCallDisconnected is false
) t
inner join t_mctsoutboundcalls o on o.obcallid=t.obcallid
inner join db_identity.i_beneficiarymapping bm on bm.benregid=t.BeneficiaryRegID
inner join db_identity.i_beneficiarydetails bd on bd.BeneficiaryDetailsId =bm.BenDetailsId
inner join db_identity.m_beneficiaryregidmapping br on br.benregid=bm.benregid
inner join (select * from m_role r2 
where providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid))r
 on r.rolename=t.receivedrolename
left join m_userlangmapping ulm on ulm.userid=t.callreceiveduserid
left join m_user u on u.userid=t.CallReceivedUserID
left join m_calltype ct on ct.CallTypeID=t.CallTypeID
where 
-- t.CreatedDate between v_fromdate and v_todate and 
t.CalledServiceID=ifnull(v_psmrid,t.CalledServiceID)
 and r.roleid=ifnull(v_roleid,r.roleid)
 and ulm.languageid=ifnull(v_languageid,ulm.languageid)
  and t.callreceiveduserid=ifnull(v_agentid,t.callreceiveduserid)
  and o.DisplayOBCallType like '%introductory%' order by t.createddate limit v_ancpnc;

end if;

if((v_rolename='Associate') and (v_isvalid is false)) then
select distinct br.beneficiaryid,concat(ifnull(bd.firstname,''),' ',ifnull(bd.lastname,'')) Beneficiaryname,
t.PhoneNo,t.receivedagentid Agentid,concat(ifnull(u.FirstName,''),' ',ifnull(u.LastName,'')) Agetname,ct.calltype,
t.bencallid,t.isCallAudited,  o.OutboundCallType,r.roleid,r.rolename,t.callid
from (select * from t_bencall where CreatedDate between v_fromdate and v_todate
and ((IsVerified is false) or (isCallAnswered is false)
or (isCallDisconnected is true))
) t
inner join t_mctsoutboundcalls o on o.obcallid=t.obcallid
inner join db_identity.i_beneficiarymapping bm on bm.benregid=t.BeneficiaryRegID
inner join db_identity.i_beneficiarydetails bd on bd.BeneficiaryDetailsId =bm.BenDetailsId
inner join db_identity.m_beneficiaryregidmapping br on br.benregid=bm.benregid
inner join (select * from m_role r2 
where providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid))r
 on r.rolename=t.receivedrolename
left join m_userlangmapping ulm on ulm.userid=t.callreceiveduserid
left join m_user u on u.userid=t.CallReceivedUserID
left join m_calltype ct on ct.CallTypeID=t.CallTypeID
where 
-- t.CreatedDate between v_fromdate and v_todate and 
t.CalledServiceID=ifnull(v_psmrid,t.CalledServiceID)
 and r.roleid=ifnull(v_roleid,r.roleid)
 and ulm.languageid=ifnull(v_languageid,ulm.languageid)
  and t.callreceiveduserid=ifnull(v_agentid,t.callreceiveduserid)
  and o.DisplayOBCallType like '%introductory%' order by t.createddate limit v_ancpnc;

end if;
if((v_rolename!='Associate') and (v_isvalid is true)) then
drop temporary table if exists temp_ancvalid;
create temporary table temp_ancvalid as
select distinct br.beneficiaryid,concat(ifnull(bd.firstname,''),' ',ifnull(bd.lastname,'')) Beneficiaryname,
t.PhoneNo,t.receivedagentid Agentid,concat(ifnull(u.FirstName,''),' ',ifnull(u.LastName,'')) Agetname,ct.calltype,
t.bencallid,t.isCallAudited,  o.OutboundCallType,r.roleid,r.rolename,t.callid
from (select * from t_bencall where CreatedDate between v_fromdate and v_todate
and IsVerified is true and isCallAnswered is true 
and isCallDisconnected is false
) t
inner join t_mctsoutboundcalls o on o.obcallid=t.obcallid
inner join db_identity.i_beneficiarymapping bm on bm.benregid=t.BeneficiaryRegID
inner join db_identity.i_beneficiarydetails bd on bd.BeneficiaryDetailsId =bm.BenDetailsId
inner join db_identity.m_beneficiaryregidmapping br on br.benregid=bm.benregid
inner join (select * from m_role r2 
where providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid))r
 on r.rolename=t.receivedrolename
left join m_userlangmapping ulm on ulm.userid=t.callreceiveduserid
left join m_user u on u.userid=t.CallReceivedUserID
left join m_calltype ct on ct.CallTypeID=t.CallTypeID
where 
-- t.CreatedDate between v_fromdate and v_todate and 
t.CalledServiceID=ifnull(v_psmrid,t.CalledServiceID)
 and r.roleid=ifnull(v_roleid,r.roleid)
 and ulm.languageid=ifnull(v_languageid,ulm.languageid)
  and t.callreceiveduserid=ifnull(v_agentid,t.callreceiveduserid)
  and o.DisplayOBCallType like '%anc%' order by t.createddate limit v_anc;
  
  
drop temporary table if exists temp_pncvalid;
create temporary table temp_pncvalid as
select distinct br.beneficiaryid,concat(ifnull(bd.firstname,''),' ',ifnull(bd.lastname,'')) Beneficiaryname,
t.PhoneNo,t.receivedagentid Agentid,concat(ifnull(u.FirstName,''),' ',ifnull(u.LastName,'')) Agetname,ct.calltype,
t.bencallid,t.isCallAudited,  o.OutboundCallType,r.roleid,r.rolename,t.callid
from (select * from t_bencall where CreatedDate between v_fromdate and v_todate
and IsVerified is true and isCallAnswered is true 
and isCallDisconnected is false
) t
inner join t_mctsoutboundcalls o on o.obcallid=t.obcallid
inner join db_identity.i_beneficiarymapping bm on bm.benregid=t.BeneficiaryRegID
inner join db_identity.i_beneficiarydetails bd on bd.BeneficiaryDetailsId =bm.BenDetailsId
inner join db_identity.m_beneficiaryregidmapping br on br.benregid=bm.benregid
inner join (select * from m_role r2 
where providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid))r
 on r.rolename=t.receivedrolename
left join m_userlangmapping ulm on ulm.userid=t.callreceiveduserid
left join m_user u on u.userid=t.CallReceivedUserID
left join m_calltype ct on ct.CallTypeID=t.CallTypeID
where 
-- t.CreatedDate between v_fromdate and v_todate and 
t.CalledServiceID=ifnull(v_psmrid,t.CalledServiceID)
 and r.roleid=ifnull(v_roleid,r.roleid)
 and ulm.languageid=ifnull(v_languageid,ulm.languageid)
  and t.callreceiveduserid=ifnull(v_agentid,t.callreceiveduserid)
  and o.DisplayOBCallType like '%pnc%' order by t.createddate limit v_pnc;
  
  select * from temp_ancvalid
  union all
  select * from temp_pncvalid;
--    and t.iscallanswered =ifnull(v_isvalid,t.iscallanswered);
end if;
if((v_rolename!='Associate') and (v_isvalid is false)) then


drop temporary table if exists temp_ancinvalid;
create temporary table temp_ancinvalid as
select distinct br.beneficiaryid,concat(ifnull(bd.firstname,''),' ',ifnull(bd.lastname,'')) Beneficiaryname,
t.PhoneNo,t.receivedagentid Agentid,concat(ifnull(u.FirstName,''),' ',ifnull(u.LastName,'')) Agetname,ct.calltype,
t.bencallid,t.isCallAudited,  o.OutboundCallType,r.roleid,r.rolename,t.callid
from (select * from t_bencall where CreatedDate between v_fromdate and v_todate
and ((IsVerified is false) or (isCallAnswered is false)
or (isCallDisconnected is true))
) t
inner join t_mctsoutboundcalls o on o.obcallid=t.obcallid
inner join db_identity.i_beneficiarymapping bm on bm.benregid=t.BeneficiaryRegID
inner join db_identity.i_beneficiarydetails bd on bd.BeneficiaryDetailsId =bm.BenDetailsId
inner join db_identity.m_beneficiaryregidmapping br on br.benregid=bm.benregid
inner join (select * from m_role r2 
where providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid))r
 on r.rolename=t.receivedrolename
left join m_userlangmapping ulm on ulm.userid=t.callreceiveduserid
left join m_user u on u.userid=t.CallReceivedUserID
left join m_calltype ct on ct.CallTypeID=t.CallTypeID
where 
-- t.CreatedDate between v_fromdate and v_todate and 
t.CalledServiceID=ifnull(v_psmrid,t.CalledServiceID)
 and r.roleid=ifnull(v_roleid,r.roleid)
 and ulm.languageid=ifnull(v_languageid,ulm.languageid)
  and t.callreceiveduserid=ifnull(v_agentid,t.callreceiveduserid)
  and o.DisplayOBCallType like '%anc%' order by t.createddate limit v_anc;

drop temporary table if exists temp_pncinvalid;
create temporary table temp_pncinvalid as
select distinct br.beneficiaryid,concat(ifnull(bd.firstname,''),' ',ifnull(bd.lastname,'')) Beneficiaryname,
t.PhoneNo,t.receivedagentid Agentid,concat(ifnull(u.FirstName,''),' ',ifnull(u.LastName,'')) Agetname,ct.calltype,
t.bencallid,t.isCallAudited,  o.OutboundCallType,r.roleid,r.rolename,t.callid
from (select * from t_bencall where CreatedDate between v_fromdate and v_todate
and ((IsVerified is false) or (isCallAnswered is false)
or (isCallDisconnected is true))
) t
inner join t_mctsoutboundcalls o on o.obcallid=t.obcallid
inner join db_identity.i_beneficiarymapping bm on bm.benregid=t.BeneficiaryRegID
inner join db_identity.i_beneficiarydetails bd on bd.BeneficiaryDetailsId =bm.BenDetailsId
inner join db_identity.m_beneficiaryregidmapping br on br.benregid=bm.benregid
inner join (select * from m_role r2 
where providerservicemapid=ifnull(v_psmrid,r2.providerservicemapid))r
 on r.rolename=t.receivedrolename
left join m_userlangmapping ulm on ulm.userid=t.callreceiveduserid
left join m_user u on u.userid=t.CallReceivedUserID
left join m_calltype ct on ct.CallTypeID=t.CallTypeID
where 
-- t.CreatedDate between v_fromdate and v_todate and 
t.CalledServiceID=ifnull(v_psmrid,t.CalledServiceID)
 and r.roleid=ifnull(v_roleid,r.roleid)
 and ulm.languageid=ifnull(v_languageid,ulm.languageid)
  and t.callreceiveduserid=ifnull(v_agentid,t.callreceiveduserid)
  and o.DisplayOBCallType like '%pnc%' order by t.createddate limit v_pnc;
  
    select * from temp_ancinvalid
  union all
  select * from temp_pncinvalid;
--    and t.iscallanswered =ifnull(v_isvalid,t.iscallanswered);
end if;
end$$

DELIMITER ;
;


