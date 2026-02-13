USE `dbiemr`;
DROP procedure IF EXISTS `Pr_GetCallHistory`;
 
USE `dbiemr`;
DROP procedure IF EXISTS `dbiemr`.`Pr_GetCallHistory`;
;
 
DELIMITER $$
USE `dbiemr`$$
CREATE PROCEDURE `Pr_GetCallHistory`(v_obcallid int(11))
begin
select t1.callid,t2.MotherID,t3.Name,null Child_id,null child_name,
t1.PhoneNo,t3.ASHA_Name,t1.ReceivedRoleName,t3.LMP_Date,null dob,
t1.calltime,t2.OutboundCallType "ECD CallType",t1.TypeOfComplaint ,
t1.complaintRemarks,t1.Remarks "AdviceProvided" from 
(select * from t_bencall t1 where obcallid=ifnull(v_obcallid,t1.obcallid))t1
inner join t_mctsoutboundcalls t2 on t1.obcallid=t2.obcallid
inner join t_mothervalidrecord t3 on t2.motherID=t3.MCTSID_no
where t1.obcallid=ifnull(v_obcallid,t1.obcallid)
union
select t1.callid,t2.MotherID,t3.Mother_Name,t3.MCTSID_no_Child_ID Child_id,t3.Child_Name child_name,
t1.PhoneNo,t3.ASHA_Name,t1.ReceivedRoleName,null LMP_Date,t3.DOB dob,
t1.calltime,t2.OutboundCallType "ECD CallType",t1.TypeOfComplaint ,
t1.complaintRemarks,t1.Remarks "AdviceProvided" from 
(select * from t_bencall t1 where obcallid=ifnull(v_obcallid,t1.obcallid)) t1
inner join t_mctsoutboundcalls t2 on t1.obcallid=t2.obcallid
inner join t_childvaliddata t3 on t2.childID=t3.MCTSID_no_Child_ID
where t1.obcallid=ifnull(v_obcallid,t1.obcallid);
end$$
 
DELIMITER ;
;