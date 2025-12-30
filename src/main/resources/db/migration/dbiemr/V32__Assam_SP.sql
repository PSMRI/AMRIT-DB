DROP PROCEDURE IF EXISTS Pr_GetCallHistory;



DELIMITER $$

CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_GetCallHistory`(
    IN v_obcallid INT
)
BEGIN

    SELECT
        t1.callid,
        t2.MotherID,
        t3.Name,
        NULL AS Child_id,
        NULL AS child_name,
        t1.PhoneNo,
        t3.ASHA_Name,
        t1.ReceivedRoleName,
        t3.LMP_Date,
        NULL AS dob,
        t1.calltime,
        t2.OutboundCallType AS `ECD CallType`,
        t1.TypeOfComplaint,
        t1.complaintRemarks,
        t1.Remarks AS AdviceProvided
    FROM t_bencall t1
    INNER JOIN t_mctsoutboundcalls t2
        ON t1.obcallid = t2.obcallid
    INNER JOIN t_mothervalidrecord t3
        ON t2.MotherID = t3.MCTSID_no
    WHERE
        (v_obcallid IS NULL OR t1.obcallid = v_obcallid)

    UNION ALL

    SELECT
        t1.callid,
        t2.MotherID,
        t3.Mother_Name,
        t3.MCTSID_no_Child_ID AS Child_id,
        t3.Child_Name AS child_name,
        t1.PhoneNo,
        t3.ASHA_Name,
        t1.ReceivedRoleName,
        NULL AS LMP_Date,
        t3.DOB AS dob,
        t1.calltime,
        t2.OutboundCallType AS `ECD CallType`,
        t1.TypeOfComplaint,
        t1.complaintRemarks,
        t1.Remarks AS AdviceProvided
    FROM t_bencall t1
    INNER JOIN t_mctsoutboundcalls t2
        ON t1.obcallid = t2.obcallid
    INNER JOIN t_childvaliddata t3
        ON t2.childID = t3.MCTSID_no_Child_ID
    WHERE
        (v_obcallid IS NULL OR t1.obcallid = v_obcallid);

END$$

DELIMITER ;
