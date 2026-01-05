DELIMITER $$

CREATE DEFINER=`piramaldev`@`%` PROCEDURE `PR_FetchECDMotherOutboundWorklist`(v_AllocatedUserID int)
BEGIN
 declare v_NextAttemptPeriod int(11);
select distinct NextAttemptPeriod into v_NextAttemptPeriod from m_mctscallconfiguration
 where current_date() between effectivefrom and EffectiveUpto 
and OutboundCallType like '%ecd%' 
 and deleted is false;
 
-- select v_NextAttemptPeriod;
 
-- select date(ifnull(null,date_add(current_date(),interval v_NextAttemptPeriod day)));
 
 -- select lastmoddate,date_add(lastmoddate,interval 2 day) from t_mctsoutboundcalls order by 1 desc limit 2;
-- create temporary table temp_ecdmotherworklisty as
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
A.Age /* New column */ ,
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
left join (select t1.obcallid,max(t1.createddate) max_createddate from t_bencall t1
inner join t_MCTSOutboundCalls t2 on t1.obcallid=t2.obcallid where t1.CalledServiceID=1714 
and AllocatedUserID = v_AllocatedUserID and t1.callendtime is not null
group by t1.obcallid) b2 on b2.obcallid=mctsoutbou0_.obcallid
left join t_bencall b on b.obcallid=b2.obcallid and b.createddate=b2.max_createddate 
and  b.CalledServiceID=1714 and b.callendtime is not null
where mctsoutbou0_.AllocatedUserID = v_AllocatedUserID and  mctsoutbou0_.Deleted is false  -- added false check on 04042024
 and ((mctsoutbou0_.isFurtherCallRequired is null) or (mctsoutbou0_.isFurtherCallRequired is true)) and -- added for nofurthercall
(mctsoutbou0_.CallStatus <>'Completed' and  mctsoutbou0_.CallStatus<>'NA')
 and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_timestamp())
 AND  

 case  
 -- when  mctsoutbou0_.IsHighRisk  is true then date(calldateto)>=date(current_date())
 when 
 ((v_NextAttemptPeriod=0) or ( NoOfTrials=0)) then (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
   
 -- when v_NextAttemptPeriod>0 and mctsoutbou0_.IsHighRisk  is true then date(calldateto)>=date(current_date())
 -- mctsoutbou0_.nooftrials>0 and 
else
 v_NextAttemptPeriod>0 and
 -- date(mctsoutbou0_.lastmoddate)!=date(current_timestamp() ) and
  date(current_timestamp() )
  >=date(date_add(mctsoutbou0_.lastmoddate,interval v_NextAttemptPeriod day))
   and (current_timestamp() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo) end
) A

)
B)C  order by isCallDisconnected,sort_createddate asc;-- ,Createdate asc;


END

DELIMITER ;