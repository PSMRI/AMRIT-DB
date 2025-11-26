USE `db_reporting`;

DROP procedure IF EXISTS `Pr_ECDCallDetailsReport`;

USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDCallDetailsReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDCallDetailsReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin



select * from (
select distinct 
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks",
fb.iscallanswered,fb.iscalldisconnected,fb.isWrongNumber

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks",
fb.iscallanswered,fb.iscalldisconnected,fb.isWrongNumber

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
        
            
end$$

DELIMITER ;
;



USE `db_reporting`;
DROP procedure IF EXISTS `Pr_ECDCallUniqueDetailsReport`;

USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDCallUniqueDetailsReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDCallUniqueDetailsReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin


 drop table if exists temp_UniqueDetailsReport;
 create temporary table temp_UniqueDetailsReport as
select * from (
select distinct fb.bencallid,
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks",
fb.iscallanswered,fb.iscalldisconnected,fb.isWrongNumber

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.bencallid, fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks",
fb.iscallanswered,fb.iscalldisconnected,fb.isWrongNumber
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
     -- select * from temp_UniqueDetailsReport;   
     
       drop temporary table if exists temp_UniqueDetailsReport2;
	create temporary table temp_UniqueDetailsReport2 as
select * from temp_UniqueDetailsReport;    

 -- select * from temp_UniqueDetailsReport2; 
  
  select `User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,t1.`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`, `edd/dob`,
 t1.`RegistrationNO`,`CallCategory`,`Call status`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks` from temp_UniqueDetailsReport t1 inner join (
select max(bencallid) max_bencallid,`Phone Number`
from temp_UniqueDetailsReport2
group by `Phone Number`)t2 on t1.bencallid=t2.max_bencallid and t1.`Phone Number`=t2.`Phone Number`;
       
   
            
end$$

DELIMITER ;
;





USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDCallSummaryReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDCallSummaryReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),
v_role varchar(50))
begin

select `Date`,count(callid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",
sum(`Number Busy/No reply/Out of Reach/Switched off/Not Connnected`) "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
sum(`Invalid Number/Out of order/Wrong number/Other Numbers`) "Invalid Number/Out of order/Wrong number/Other Numbers",
-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16",
sum(`ECD-17`) "17",sum(`ECD-18`) "18",sum(`ECD-19`) "19",sum(`ECD-20`) "20",sum(`ECD-21`) "21",
sum(`Miscarriage/Abortion/still birth/Baby died etc`) "Miscarriage/Abortion/still birth/Baby died etc" 
from (
select 
distinct  date(fb.CreatedDate) as "Date",
fb.BenCallID "CallId",
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end as "Answeredcalls",

case when fb.reasonForCallNotAnswered in('Number busy','No reply','Out of Reach','Switched off','Call not connected')
and fb.isCallAnswered is not true	 then 1 else 0 end "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
case when fb.reasonForCallNotAnswered in('Invalid number','Out of service')
	and fb.isCallAnswered is not true then 1 else 0 end "Invalid Number/Out of order/Wrong number/Other Numbers",
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' then  1 else 0 end "ECD-0",
case when fo.outboundcalltype='ECD1'  and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2'  and fo.callstatus='completed'  and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4'  and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5'  and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-10",
case when fo.outboundcalltype='ECD11'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-11",
case when fo.outboundcalltype='ECD12'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0  end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-15",
case when fo.outboundcalltype='ECD16'  and fo.callstatus='completed'  and fb.isverified is true  then  1 else 0  end "ECD-16",

case when fo.outboundcalltype='ECD17'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-17",
case when fo.outboundcalltype='ECD18'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-18",
case when fo.outboundcalltype='ECD19'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-19",
case when fo.outboundcalltype='ECD20'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-20",
case when fo.outboundcalltype='ECD21'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-21",
-- case when fo.outboundcalltype='ECD17' then  1 else 0  end "ECD-17",
-- case when fo.outboundcalltype='ECD18' then  1 else 0  end "ECD-18",
-- case when fo.outboundcalltype='ECD19' then  1 else 0  end "ECD-19",
-- case when fo.outboundcalltype='ECD20' then  1 else 0  end "ECD-20",
-- case when fo.outboundcalltype='ECD21' then  1 else 0  end "ECD-21",

case when fb.reasonForNoFurtherCalls in('Mother has abortion','Still birth','Dead','Reallocate to different state')
	 then 1 else 0 end "Miscarriage/Abortion/still birth/Baby died etc"
 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and callendtime is not null
	and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
	and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
	and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
    and fb.ReceivedRoleName=v_role  and fb.CallEndTime is not null
  union all
select 
distinct  date(fb.CreatedDate) as "Date",
fb.BenCallID "CallId",

/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end as "Answeredcalls",

case when fb.reasonForCallNotAnswered in('Number busy','No reply','Out of Reach','Switched off','Call not connected')
	 then 1 else 0 end "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
case when fb.reasonForCallNotAnswered in('Invalid number','Out of service')
	 then 1 else 0 end "Invalid Number/Out of order/Wrong number/Other Numbers",
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' then  1 else 0 end "ECD-0",
case when fo.outboundcalltype='ECD1'  and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-8",
case when fo.outboundcalltype='ECD9'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-9",
case when fo.outboundcalltype='ECD10'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-10",
case when fo.outboundcalltype='ECD11'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0  end "ECD-11",
case when fo.outboundcalltype='ECD12'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0  end "ECD-12",
case when fo.outboundcalltype='ECD13'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-13",
case when fo.outboundcalltype='ECD14'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-14",
case when fo.outboundcalltype='ECD15'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-15",
case when fo.outboundcalltype='ECD16'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-16",
case when fo.outboundcalltype='ECD17'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-17",
case when fo.outboundcalltype='ECD18'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-18",
case when fo.outboundcalltype='ECD19'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-19",
case when fo.outboundcalltype='ECD20'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-20",
case when fo.outboundcalltype='ECD21'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-21",

-- case when fo.outboundcalltype='ECD17' then  1 else 0  end "ECD-17",
-- case when fo.outboundcalltype='ECD18' then  1 else 0  end "ECD-18",
-- case when fo.outboundcalltype='ECD19' then  1 else 0  end "ECD-19",
-- case when fo.outboundcalltype='ECD20' then  1 else 0  end "ECD-20",
-- case when fo.outboundcalltype='ECD21' then  1 else 0  end "ECD-21",

case when fb.reasonForNoFurtherCalls in('Mother has abortion','Still birth','Dead','Reallocate to different state')
	 then 1 else 0 end "Miscarriage/Abortion/still birth/Baby died etc"

  from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null)a group by `Date`;
end$$

DELIMITER ;
;





USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDCumulativeDistrictReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDCumulativeDistrictReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),v_role varchar(50))
begin



select District,count(bencallid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",

-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16" ,
sum(`ECD-17`) "17",sum(`ECD-18`) "18",sum(`ECD-19`) "19",sum(`ECD-20`) "20",sum(`ECD-21`) "21"

from (
select 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16",

case when fo.outboundcalltype='ECD17'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-17",
case when fo.outboundcalltype='ECD18'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-18",
case when fo.outboundcalltype='ECD19'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-19",
case when fo.outboundcalltype='ECD20'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-20",
case when fo.outboundcalltype='ECD21'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-21"
/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
fm.Husband_Name "Husband Name",'' Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            union all
select distinct 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,

-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16",

case when fo.outboundcalltype='ECD17'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-17",
case when fo.outboundcalltype='ECD18'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-18",
case when fo.outboundcalltype='ECD19'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-19",
case when fo.outboundcalltype='ECD20'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-20",
case when fo.outboundcalltype='ECD21'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-21"
/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
'' "Husband Name",fm.Mother_Name,
'' "LMP Date",
'' edd,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            )a group by District;
            
        
            
end$$

DELIMITER ;
;


USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDAashaHomeVisitGapReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE PROCEDURE `Pr_ECDAashaHomeVisitGapReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
fb.Remarks,
null 'District Feedback'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Still birth'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(304) and  fr.answer='NO'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr.Remarks,
null 'District Feedback'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Still birth'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(304) and fr.answer='NO';
end$$

DELIMITER ;
;




USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDAbortionReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDAbortionReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

drop temporary table if exists temp_ECDAbortionReport;
create temporary table temp_ECDAbortionReport as
select distinct `Call Date`,`RCH ID`,`Phone No`,`Beneficiary Name`,`District Name`,`Block Name`,LMP,EDD,`Reason of incident`,`Period of occurrence`
from (

select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
-- fr2.Answer    Remarks
case when fr2.questionid=283 then fr2.Answer   end "Reason of incident",
case when fr2.questionid=284 then fr2.Answer   end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer like '%Abortion%')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr2.questionid in(283,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
case when fr2.questionid=283 then fr2.Answer   end "Reason of incident",
case when fr2.questionid=284 then fr2.Answer   end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370,295)  and answer like '%Abortion%')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null)a;
             
                 drop temporary table if exists temp_ECDAbortionReport_2;
 create temporary table temp_ECDAbortionReport_2
 select * from temp_ECDAbortionReport;
 

 select distinct t1.`Call Date`,t1.`RCH ID`,t1.`Phone No`,t1.`Beneficiary Name`,t1.`District Name`,
 t1.`Block Name`,t1.LMP,t1.EDD,t1.`Reason of incident`,t2.`Period of occurrence` from temp_ECDAbortionReport t1
 inner join temp_ECDAbortionReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`RCH ID`=t2.`RCH ID`
 and t1.`Phone No`=t2.`Phone No`
 where t2.`Period of occurrence` is not null and t1.`Reason of incident` is not null ;
 
 drop temporary table if exists temp_ECDMiscarriageReport;
  drop temporary table if exists temp_ECDMiscarriageReport_2;

end$$

DELIMITER ;
;


USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDBabyDeathReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDBabyDeathReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDBabyDeathReport;
create temporary table temp_ECDBabyDeathReport as
select distinct `CALL Date`,`Registration No`,`PhoneNo of Beneficiary`,MotherName,`District`,`Block`,LMP,edd,
`Reason of incident`,`Period of occurrence` from (
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer like '%Infant Death%')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Baby Died'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer Remarks

case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer like '%Infant Death%')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Baby Died '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null)a;
             
             drop temporary table if exists temp_ECDBabyDeathReport_2;
 create temporary table temp_ECDBabyDeathReport_2
 select * from temp_ECDBabyDeathReport;
 
 select * from temp_ECDBabyDeathReport;
 select t1.`CALL Date`,t1.`Registration No`,t1.`PhoneNo of Beneficiary`,
t1.MotherName,t1.District,t1.`Block`,t1.LMP,t1.edd,
t1.`Reason of incident`,
t2.`Period of occurrence` from temp_ECDBabyDeathReport t1
 inner join temp_ECDBabyDeathReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`Registration No`=t2.`Registration No`
 and t1.`PhoneNo of Beneficiary`=t2.`PhoneNo of Beneficiary`
 where t2.`Period of occurrence` is not null and t1.`Reason of incident` is not null ;
 
 drop temporary table if exists temp_ECDBabyDeathReport;
  drop temporary table if exists temp_ECDBabyDeathReport_2;
 
            
            
end$$

DELIMITER ;
;



USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDDeliveryStatusReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDDeliveryStatusReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDDeliveryStatusReport;
create temporary table temp_ECDDeliveryStatusReport as

select distinct `Call Date`,`RCH ID`,`Phone No`,`Beneficiary Name`,`District Name`,`Block Name`,LMP,EDD,`Place of Delivery`,`Mode of Delivery`
from (
select date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
-- fr.Remarks
case when fr.questionid=372 then fr.Answer end "Place of Delivery",
case when fr.questionid=373 then fr.Answer end "Mode of Delivery"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(372,373) and fr.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,-- need to cross check once
fm.dob ,
-- fr.Remarks

case when fr.questionid=372 then fr.Answer end "Place of Delivery",
case when fr.questionid=373 then fr.Answer end "Mode of Delivery"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(372,373) and fr.answer is not null)a;
             
             drop temporary table if exists temp_ECDDeliveryStatusReport_2;
 create temporary table temp_ECDDeliveryStatusReport_2
 select * from temp_ECDDeliveryStatusReport;
 

 select t1.`Call Date`,t1.`RCH ID`,t1.`Phone No`,t1.`Beneficiary Name`,t1.`District Name`,
 t1.`Block Name`,t1.LMP,t1.EDD,t1.`Place of Delivery`,t2.`Mode of Delivery` from temp_ECDDeliveryStatusReport t1
 inner join temp_ECDDeliveryStatusReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`RCH ID`=t2.`RCH ID`
 and t1.`Phone No`=t2.`Phone No`
 where t2.`Mode of Delivery` is not null and t1.`Place of Delivery` is not null ;
 
 drop temporary table if exists temp_ECDDeliveryStatusReport;
  drop temporary table if exists temp_ECDDeliveryStatusReport_2;
end$$

DELIMITER ;
;




USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDMiscarriageReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDMiscarriageReport`(v_starttime datetime,v_endtime datetime,
 v_Agentid int(11),v_psmid int(11))
begin
 
  drop temporary table if exists temp_ECDMiscarriageReport;
 create temporary table temp_ECDMiscarriageReport as
 select `Call Date`,`RCH ID`,`Phone No`,`Beneficiary Name`,`District Name`,`Block Name`,LMP,EDD,`Causes of Miscarriage`,`Period of occurrence`
 from (
 select distinct 
 date(fb.CreatedDate) 'Call Date',
 fm.MCTSID_no 'RCH ID',-- new column
 fm.Whom_PhoneNo 'Phone No',
 fm.Name 'Beneficiary Name',
 District_Name 'District Name',
 Block_Name 'Block Name',
 fm.LMP_Date LMP,
 fm.edd EDD,
 
 case when fr2.questionid=281 then fr2.Answer end "Causes of Miscarriage",
 case when fr2.questionid=284 then fr2.Answer end "Period of occurrence"
 from fact_bencall fb
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
 inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid-- new join required
 inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
 where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
 and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
 			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr2.questionid in(281,284) and fr2.answer is not null
 union 
 select distinct  
 date(fb.CreatedDate) 'Call Date',
 fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
 fm.Phone_No 'Phone No',
 fm.Child_Name ChildName,
 District_Name 'District Name',
 Block_Name 'Block Name',
 null LMP,
 fm.dob ,
 -- reasonForNoFurtherCalls 'Baby's Birth Status',
 -- fr2.Answer Remarks
 
 case when fr2.questionid=281 then fr2.Answer end "Causes of Miscarriage",
 case when fr2.questionid=284 then fr2.Answer end "Period of occurrence"
 
 from fact_bencall fb
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
 inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid-- new join required
 inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
 where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
 and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
 			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
              and fr2.questionid in(281,284) and fr2.answer is not null)a;
              
                  drop temporary table if exists temp_ECDMiscarriageReport_2;
  create temporary table temp_ECDMiscarriageReport_2
  select * from temp_ECDMiscarriageReport;
  
 
  select t1.`Call Date`,t1.`RCH ID`,t1.`Phone No`,t1.`Beneficiary Name`,t1.`District Name`,
  t1.`Block Name`,t1.LMP,t1.EDD,t1.`Causes of Miscarriage`,t2.`Period of occurrence` from temp_ECDMiscarriageReport t1
  inner join temp_ECDMiscarriageReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`RCH ID`=t2.`RCH ID`
  and t1.`Phone No`=t2.`Phone No`
  where t2.`Period of occurrence` is not null and t1.`Causes of Miscarriage` is not null ;
  
  drop temporary table if exists temp_ECDMiscarriageReport;
   drop temporary table if exists temp_ECDMiscarriageReport_2;
 end$$

DELIMITER ;
;



USE `db_reporting`;
DROP procedure IF EXISTS `db_reporting`.`Pr_ECDStillBirthReport`;
;

DELIMITER $$
USE `db_reporting`$$
CREATE  PROCEDURE `Pr_ECDStillBirthReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDStillBirthReport;
create temporary table temp_ECDStillBirthReport as
select `CALL Date`,`Registration No`,`PhoneNo of Beneficiary`,
MotherName,District,`Block`,LMP,edd,
`Reason of incident`,
case when `Period of occurrence` is not null then `Period of occurrence` end `Period of occurrence` from (
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer    Remarks

case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer like '%Still birth%')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
              and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer    Remarks

case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer like '%Still birth%')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null)a ;
          --   where (`Reason of incident` is not null and `Period of occurrence` is not null)
   --     group by `CALL Date`,`Registration No`,`PhoneNo of Beneficiary`,
 -- MotherName,District,`Block`,LMP,edd,`Reason of incident`,`Period of occurrence` ;
 
 drop temporary table if exists temp_ECDStillBirthReport_2;
 create temporary table temp_ECDStillBirthReport_2
 select * from temp_ECDStillBirthReport;
 

 select t1.`CALL Date`,t1.`Registration No`,t1.`PhoneNo of Beneficiary`,
t1.MotherName,t1.District,t1.`Block`,t1.LMP,t1.edd,
t1.`Reason of incident`,
t2.`Period of occurrence` from temp_ECDStillBirthReport t1
 inner join temp_ECDStillBirthReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`Registration No`=t2.`Registration No`
 and t1.`PhoneNo of Beneficiary`=t2.`PhoneNo of Beneficiary`
 where t2.`Period of occurrence` is not null and t1.`Reason of incident` is not null ;
 
 drop temporary table if exists temp_ECDStillBirthReport;
  drop temporary table if exists temp_ECDStillBirthReport_2;
 
            
            
end$$

DELIMITER ;
;


