-- Changes in table definition for t_idrsdetails

ALTER TABLE t_idrsdetails 
MODIFY COLUMN DiseaseQuestionType LONGTEXT;


ALTER TABLE t_idrsdetails 
 MODIFY COLUMN Question LONGTEXT;


 Drop procedure if exists FHIR_R_Practitioner;

 DELIMITER $$

CREATE PROCEDURE `FHIR_R_Practitioner`(
    IN visitCode_IN BIGINT
)
BEGIN
    SELECT 
        b.BenVisitID,
        u.UserID,

        -- Full name
        CONCAT(
            IFNULL(u.FirstName, ''), ' ',
            IFNULL(u.MiddleName, ''), ' ',
            IFNULL(u.LastName, '')
        ) AS FullName,

        -- Basic details
        u.DOB,
        u.EmployeeID,

        -- Contact details
        u.ContactNo,
        u.EmailID,

        -- Qualification (from master)
        q.Name AS QualificationName,

        -- Designation (from master)
        d.DesignationName,

        -- Gender (from lookup)
        g.GenderName,

        -- Other details
        u.GenderID,
        u.ServiceProviderID,

        -- Visit info
        b.VisitCode,
        b.CreatedBy AS CreatedBy,
        b.CreatedDate AS CreatedDate
       
    FROM t_benvisitdetail b
    LEFT JOIN m_user u 
        ON u.UserName = b.CreatedBy
    LEFT JOIN m_designation d 
        ON d.DesignationID = u.DesignationID
    LEFT JOIN m_userqualification q 
        ON q.QualificationID = u.QualificationID
    LEFT JOIN m_gender g
        ON g.GenderID = u.GenderID

    WHERE b.VisitCode = visitCode_IN
    ORDER BY b.BenVisitID DESC;
END$$

DELIMITER ;






Drop procedure if exists FHIR_R_OrganizationDetails;

DELIMITER $$

CREATE PROCEDURE `FHIR_R_OrganizationDetails`(
    IN visitCode_IN BIGINT
)
BEGIN
    SELECT  
        b.BenVisitID,
        sod.ServiceProviderID,
        sod.ServiceProviderName,
        sod.StateID,
        sod.StateName,
        sod.DistrictID,
        sod.DistrictName,
        sod.LocationName,
        sod.Address,
        sod.ServiceID,
        sod.ServiceName,
        sod.IsNational,
        sod.AbdmFacilityId,
        sod.AbdmFacilityName,
        sod.PSAddMapID,
    sod.ProviderServiceMapID
    FROM t_benvisitdetail b
    INNER JOIN m_user u 
        ON u.UserName = b.CreatedBy
    INNER JOIN showofficedetails sod
        ON sod.ServiceProviderID = u.ServiceProviderID
    WHERE b.VisitCode = visitCode_IN;
END$$

DELIMITER ;



Drop procedure if exists FHIR_R_MedicalHistoryDetails;


DELIMITER $$

CREATE PROCEDURE `FHIR_R_MedicalHistoryDetails`(
    IN visitCode_IN BIGINT
)
BEGIN
    SELECT 
        ID,
        ProviderServiceMapID,
        CurrentMedication AS CurrentMedication,
        Year AS CurrentMedYear,
        CreatedBy,
        CreatedDate
    FROM t_benmedicationhistory med
    WHERE Deleted = 0
      AND VisitCode = visitCode_IN;
END$$

DELIMITER ;

