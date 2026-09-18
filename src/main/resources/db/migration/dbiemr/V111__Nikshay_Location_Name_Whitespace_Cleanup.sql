USE db_iemr;

UPDATE m_nikshay_state    SET StateName    = TRIM(StateName)    WHERE StateName    <> TRIM(StateName);
UPDATE m_nikshay_district SET DistrictName = TRIM(DistrictName) WHERE DistrictName <> TRIM(DistrictName);
UPDATE m_nikshay_tu       SET TUName       = TRIM(TUName)       WHERE TUName       <> TRIM(TUName);
UPDATE m_nikshay_facility SET FacilityName = TRIM(FacilityName) WHERE FacilityName <> TRIM(FacilityName);
UPDATE m_nikshay_village  SET VillageName  = TRIM(VillageName)  WHERE VillageName  <> TRIM(VillageName);
