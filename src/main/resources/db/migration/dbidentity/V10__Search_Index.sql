USE db_identity;
 
 
-- 1) i_beneficiarymapping (BenDetailsId, VanID)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarymapping'
    AND index_name = 'idx_benmap_details_van'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_benmap_details_van ON i_beneficiarymapping(BenDetailsId, VanID);',
  'SELECT "Index idx_benmap_details_van already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 2) i_beneficiarymapping (BenAddressId, VanID)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarymapping'
    AND index_name = 'idx_benmap_address_van'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_benmap_address_van ON i_beneficiarymapping(BenAddressId, VanID);',
  'SELECT "Index idx_benmap_address_van already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 3) i_beneficiarymapping (VanSerialNo, VanID)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarymapping'
    AND index_name = 'idx_benmap_vanserial_van'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_benmap_vanserial_van ON i_beneficiarymapping(VanSerialNo, VanID);',
  'SELECT "Index idx_benmap_vanserial_van already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 4) i_beneficiarydetails (VanSerialNo, VanID)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarydetails'
    AND index_name = 'idx_bendetail_vanserial_van'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_bendetail_vanserial_van ON i_beneficiarydetails(VanSerialNo, VanID);',
  'SELECT "Index idx_bendetail_vanserial_van already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 5) i_beneficiarydetails (FirstName)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarydetails'
    AND index_name = 'idx_bendetail_firstname'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_bendetail_firstname ON i_beneficiarydetails(FirstName(50));',
  'SELECT "Index idx_bendetail_firstname already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 6) i_beneficiarydetails (LastName)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarydetails'
    AND index_name = 'idx_bendetail_lastname'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_bendetail_lastname ON i_beneficiarydetails(LastName(50));',
  'SELECT "Index idx_bendetail_lastname already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 7) i_beneficiarydetails (GenderId)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarydetails'
    AND index_name = 'idx_bendetail_gender'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_bendetail_gender ON i_beneficiarydetails(GenderId);',
  'SELECT "Index idx_bendetail_gender already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 8) i_beneficiarydetails (DOB)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarydetails'
    AND index_name = 'idx_bendetail_dob'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_bendetail_dob ON i_beneficiarydetails(DOB);',
  'SELECT "Index idx_bendetail_dob already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 9) i_beneficiarydetails (FatherName)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarydetails'
    AND index_name = 'idx_bendetail_father'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_bendetail_father ON i_beneficiarydetails(FatherName(50));',
  'SELECT "Index idx_bendetail_father already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
 
 
-- 10) i_beneficiaryaddress (VanSerialNo, VanID)
 
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiaryaddress'
    AND index_name = 'idx_benadd_vanserial_van'
);
 
SET @sql := IF(@exists = 0,
  'CREATE INDEX idx_benadd_vanserial_van ON i_beneficiaryaddress(VanSerialNo, VanID);',
  'SELECT "Index idx_benadd_vanserial_van already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;