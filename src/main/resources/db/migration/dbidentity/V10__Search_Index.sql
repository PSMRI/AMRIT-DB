-- Index on i_beneficiarymapping for joins
CREATE INDEX idx_benmap_details_van ON db_identity.i_beneficiarymapping(BenDetailsId, VanID);
CREATE INDEX idx_benmap_address_van ON db_identity.i_beneficiarymapping(BenAddressId, VanID);
CREATE INDEX idx_benmap_vanserial_van ON db_identity.i_beneficiarymapping(VanSerialNo, VanID);
 
-- Index on i_beneficiarydetails for search criteria
CREATE INDEX idx_bendetail_vanserial_van ON db_identity.i_beneficiarydetails(VanSerialNo, VanID);
CREATE INDEX idx_bendetail_firstname ON db_identity.i_beneficiarydetails(FirstName(50));
CREATE INDEX idx_bendetail_lastname ON db_identity.i_beneficiarydetails(LastName(50));
CREATE INDEX idx_bendetail_gender ON db_identity.i_beneficiarydetails(GenderId);
CREATE INDEX idx_bendetail_dob ON db_identity.i_beneficiarydetails(DOB);
CREATE INDEX idx_bendetail_father ON db_identity.i_beneficiarydetails(FatherName(50));
  
-- Index on i_beneficiaryaddress for location search
CREATE INDEX idx_benadd_vanserial_van ON db_identity.i_beneficiaryaddress(VanSerialNo, VanID);
