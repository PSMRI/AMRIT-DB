Drop procedure if exists PR_FetchECDChildOutboundWorklist;



DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `PR_FetchECDChildOutboundWorklist`(v_AllocatedUserID int)
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
-- create temporary table temp_ecdchildworklist as
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
left join (
-- select obcallid,max(createddate) max_createddate from t_bencall group by obcallid
select t1.obcallid,max(t1.createddate) max_createddate from t_bencall t1
inner join t_MCTSOutboundCalls t2 on t1.obcallid=t2.obcallid where t1.CalledServiceID=1714 and AllocatedUserID = v_AllocatedUserID
group by t1.obcallid
) b2 on b2.obcallid=mctsoutbou0_.obcallid
left join t_bencall b on b.obcallid=b2.obcallid and b.createddate=b2.max_createddate
where mctsoutbou0_.AllocatedUserID=v_AllocatedUserID and  mctsoutbou0_.deleted is false and
(mctsoutbou0_.CallStatus<>'Completed' and mctsoutbou0_.CallStatus<>'NA' )
and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_timestamp())
and ((mctsoutbou0_.isFurtherCallRequired is null) or (mctsoutbou0_.isFurtherCallRequired is true))  -- added for nofurthercall
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


END ;;
