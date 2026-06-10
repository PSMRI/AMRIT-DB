-- Fix: Registration Report showing very less count due to isOutbound NULL filter issue
-- Issue: isOutbound is NULL for 99% of fact_bencall records because the system never populates it during normal call flow
-- Fix: Changed "c.isoutbound is false" to "c.isoutbound IS NOT TRUE" to include NULL records

DROP PROCEDURE IF EXISTS `Pr_104BeneficiaryReport`;

DELIMITER ;;

CREATE PROCEDURE `Pr_104BeneficiaryReport`(v_starttime datetime, v_endtime datetime, v_Agentid int(11), v_psmid int(11))
BEGIN
    SELECT b.beneficiaryID "Beneficiary ID", b.title "Title",
        b.firstName "First Name", b.MiddleName "Middle Name", b.lastName "Last Name",
        b.dob "Dob",
        b.gender "Gender", b.community "Community",
        b.education "Education", b.fathername "Father Name",
        b.maritalStatus "Marital Status", b.healthCareWorker "Health Care Worker",
        b.PreferredPhoneNum "Phone Number",
        b.PhoneNum1 "Phone Num1",
        b.PhoneNum2 "Phone Num2",
        b.PhoneNum3 "Phone Num3",
        b.PhoneNum4 "Phone Num4",
        b.emergencyRegistration "Emergency Registration",
        b.PreferredPhoneNum "Preferred Phone Num",
        b.permDistrict "Perm District",
        b.permSubDistrict "Perm Sub District",
        b.permVillage "Perm Village",
        c.callTypeName "Call Type",
        c.callSubTypeName "Call Sub Type",
        c.callReceivedUserID "Call Received User ID",
        c.callEndUserID "Call End User ID",
        b.createdDate "Date",
        c.ReceivedAgentID "Agent ID", user.firstName "Agent Name"
    FROM fact_bencall c
    LEFT JOIN dim_beneficiary b ON c.beneficiaryRegID = b.beneficiaryRegID
    LEFT JOIN dim_user user ON c.CallReceivedUserID = user.UserID
    WHERE c.providerServiceMapID = ifnull(v_psmid, c.providerServiceMapID)
        AND c.isCalledEarlier IS FALSE
        AND c.beneficiaryRegID IS NOT NULL
        AND c.ReceivedAgentID = ifnull(v_Agentid, c.ReceivedAgentID)
        AND b.createdDate >= v_starttime AND b.createdDate <= v_endtime
        AND c.isoutbound IS NOT TRUE
    GROUP BY b.beneficiaryID
    ORDER BY b.beneficiaryID DESC;
END ;;

DELIMITER ;
