SET @sync_tbl_exists = (SELECT COUNT(*) FROM information_schema.tables
                        WHERE table_schema = 'db_iemr' AND table_name = 'm_synctabledetail');

SET @sql = IF(@sync_tbl_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName = REPLACE(VanColumnName, ',SputumCollectionDate',
                                ',date_format(SputumCollectionDate,''%Y-%m-%d %H:%i:%s'')')
  WHERE TableName = 'tb_stoptb_diagnostics'
    AND CONCAT(',', VanColumnName, ',') LIKE '%,SputumCollectionDate,%'",
"SELECT 'm_synctabledetail does not exist - SputumCollectionDate format skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'fatigue');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',fatigue'),
        ServerColumnName = CONCAT(ServerColumnName, ',fatigue')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_screening'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,fatigue,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,fatigue,%'",
"SELECT 'tb_screening.fatigue: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'chest_pain');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',chest_pain'),
        ServerColumnName = CONCAT(ServerColumnName, ',chest_pain')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_screening'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,chest_pain,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,chest_pain,%'",
"SELECT 'tb_screening.chest_pain: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'shortness_of_breath');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',shortness_of_breath'),
        ServerColumnName = CONCAT(ServerColumnName, ',shortness_of_breath')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_screening'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,shortness_of_breath,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,shortness_of_breath,%'",
"SELECT 'tb_screening.shortness_of_breath: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'failure_to_gain_weight');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',failure_to_gain_weight'),
        ServerColumnName = CONCAT(ServerColumnName, ',failure_to_gain_weight')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_screening'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,failure_to_gain_weight,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,failure_to_gain_weight,%'",
"SELECT 'tb_screening.failure_to_gain_weight: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'decreased_activity_or_playfulness');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',decreased_activity_or_playfulness'),
        ServerColumnName = CONCAT(ServerColumnName, ',decreased_activity_or_playfulness')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_screening'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,decreased_activity_or_playfulness,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,decreased_activity_or_playfulness,%'",
"SELECT 'tb_screening.decreased_activity_or_playfulness: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'others');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',others'),
        ServerColumnName = CONCAT(ServerColumnName, ',others')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_screening'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,others,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,others,%'",
"SELECT 'tb_screening.others: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_suspected' AND column_name = 'visitCode');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',visitCode'),
        ServerColumnName = CONCAT(ServerColumnName, ',visitCode')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_suspected'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,visitcode,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,visitcode,%'",
"SELECT 'tb_suspected.visitCode: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_iemr' AND table_name = 'tb_confirmed_cases' AND column_name = 'visitCode');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',visitCode'),
        ServerColumnName = CONCAT(ServerColumnName, ',visitCode')
  WHERE SchemaName = 'db_iemr' AND TableName = 'tb_confirmed_cases'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,visitcode,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,visitcode,%'",
"SELECT 'tb_confirmed_cases.visitCode: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'economicStatus');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',economicStatus'),
        ServerColumnName = CONCAT(ServerColumnName, ',economicStatus')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,economicstatus,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,economicstatus,%'",
"SELECT 'i_beneficiarydetails.economicStatus: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'economicStatusId');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',economicStatusId'),
        ServerColumnName = CONCAT(ServerColumnName, ',economicStatusId')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,economicstatusid,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,economicstatusid,%'",
"SELECT 'i_beneficiarydetails.economicStatusId: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'residentialArea');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',residentialArea'),
        ServerColumnName = CONCAT(ServerColumnName, ',residentialArea')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,residentialarea,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,residentialarea,%'",
"SELECT 'i_beneficiarydetails.residentialArea: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'residentialAreaId');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',residentialAreaId'),
        ServerColumnName = CONCAT(ServerColumnName, ',residentialAreaId')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,residentialareaid,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,residentialareaid,%'",
"SELECT 'i_beneficiarydetails.residentialAreaId: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'placeOfCurrentLiving');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',placeOfCurrentLiving'),
        ServerColumnName = CONCAT(ServerColumnName, ',placeOfCurrentLiving')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,placeofcurrentliving,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,placeofcurrentliving,%'",
"SELECT 'i_beneficiarydetails.placeOfCurrentLiving: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'otherPlaceOfCurrentLiving');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',otherPlaceOfCurrentLiving'),
        ServerColumnName = CONCAT(ServerColumnName, ',otherPlaceOfCurrentLiving')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,otherplaceofcurrentliving,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,otherplaceofcurrentliving,%'",
"SELECT 'i_beneficiarydetails.otherPlaceOfCurrentLiving: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'institutionName');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',institutionName'),
        ServerColumnName = CONCAT(ServerColumnName, ',institutionName')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,institutionname,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,institutionname,%'",
"SELECT 'i_beneficiarydetails.institutionName: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (SELECT COUNT(*) FROM information_schema.columns
                   WHERE table_schema = 'db_identity' AND table_name = 'i_beneficiarydetails' AND column_name = 'familyid');
SET @sql = IF(@sync_tbl_exists > 0 AND @col_exists > 0,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',familyid'),
        ServerColumnName = CONCAT(ServerColumnName, ',familyid')
  WHERE SchemaName = 'db_identity' AND TableName = 'i_beneficiarydetails'
    AND CONCAT(',', LOWER(VanColumnName), ',')    NOT LIKE '%,familyid,%'
    AND CONCAT(',', LOWER(ServerColumnName), ',') NOT LIKE '%,familyid,%'",
"SELECT 'i_beneficiarydetails.familyid: column or m_synctabledetail missing - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
