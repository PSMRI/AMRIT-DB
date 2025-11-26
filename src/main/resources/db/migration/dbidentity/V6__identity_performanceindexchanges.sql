

-- create index if not EXISTS inx_address_permvillageid on i_beneficiaryaddress(permvillageid);

-- create index if not EXISTS inx_address_Lastmoddate on i_beneficiaryaddress(Lastmoddate);


-- create index if not EXISTS inx_mapping_Lastmoddate on i_beneficiarymapping(Lastmoddate);

-- create index if not EXISTS inx_contacts_Lastmoddate on i_beneficiarycontacts(Lastmoddate);


USE db_identity;

-- 1) i_beneficiaryaddress.permvillageid
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiaryaddress'
    AND index_name = 'inx_address_permvillageid'
);

SET @sql := IF(@exists = 0,
  'CREATE INDEX inx_address_permvillageid ON i_beneficiaryaddress(permvillageid);',
  'SELECT "Index inx_address_permvillageid already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- 2) i_beneficiaryaddress.Lastmoddate
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiaryaddress'
    AND index_name = 'inx_address_Lastmoddate'
);

SET @sql := IF(@exists = 0,
  'CREATE INDEX inx_address_Lastmoddate ON i_beneficiaryaddress(Lastmoddate);',
  'SELECT "Index inx_address_Lastmoddate already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- 3) i_beneficiarymapping.Lastmoddate
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarymapping'
    AND index_name = 'inx_mapping_Lastmoddate'
);

SET @sql := IF(@exists = 0,
  'CREATE INDEX inx_mapping_Lastmoddate ON i_beneficiarymapping(Lastmoddate);',
  'SELECT "Index inx_mapping_Lastmoddate already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- 4) i_beneficiarycontacts.Lastmoddate
SET @exists := (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = 'db_identity'
    AND table_name = 'i_beneficiarycontacts'
    AND index_name = 'inx_contacts_Lastmoddate'
);

SET @sql := IF(@exists = 0,
  'CREATE INDEX inx_contacts_Lastmoddate ON i_beneficiarycontacts(Lastmoddate);',
  'SELECT "Index inx_contacts_Lastmoddate already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
