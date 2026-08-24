USE db_iemr;

CREATE TABLE IF NOT EXISTS db_iemr.m_downsynctabledetail (
    DownSyncTableDetailID INT           NOT NULL AUTO_INCREMENT,
    SchemaName            VARCHAR(100)  NOT NULL COMMENT 'db_identity / db_iemr',
    TableName             VARCHAR(200)  NOT NULL COMMENT 'table to down-sync',
    ServerColumnName      TEXT          NULL     COMMENT 'columns to SELECT from central; NULL = resolve from information_schema',
    VanColumnName         TEXT          NULL     COMMENT 'columns in local, positionally mapped with ServerColumnName',
    VanAutoIncColumnName  VARCHAR(200)  NULL     COMMENT 'local auto-increment PK - skipped on INSERT so local generates its own value',
    TableType             VARCHAR(20)   NOT NULL DEFAULT 'MASTER' COMMENT 'MASTER = full pull, no VanID filter / TRANSACTIONAL = filter by VanID + DownSynced',
    SyncOrder             INT           NOT NULL DEFAULT 1000 COMMENT 'lower number syncs first - enforces the FK dependency chain',
    IsActive              BIT(1)        NOT NULL DEFAULT b'1',
    PRIMARY KEY (DownSyncTableDetailID),
    UNIQUE KEY uk_downsynctabledetail_table (SchemaName, TableName),
    KEY idx_downsynctabledetail_order (SyncOrder)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -----------------------------------------------------------------------------
-- Master / reference data - full pull, central authoritative, no VanID filter.
-- -----------------------------------------------------------------------------
INSERT INTO db_iemr.m_downsynctabledetail
    (SchemaName, TableName, VanAutoIncColumnName, TableType, SyncOrder, IsActive)
VALUES
    ('db_iemr', 'm_state', NULL, 'MASTER', 1, b'1'),
    ('db_iemr', 'm_district', NULL, 'MASTER', 2, b'1'),
    ('db_iemr', 'm_districtblock', NULL, 'MASTER', 3, b'1'),
    ('db_iemr', 'm_providerservicemapping', NULL, 'MASTER', 4, b'1'),
    ('db_iemr', 'm_vantype', NULL, 'MASTER', 5, b'1'),
    ('db_iemr', 'm_van', NULL, 'MASTER', 6, b'1'),
    ('db_iemr', 'm_parkingplace', NULL, 'MASTER', 7, b'1'),
    ('db_iemr', 'm_servicepoint', NULL, 'MASTER', 8, b'1'),
    ('db_iemr', 'm_servicepointvillagemap', NULL, 'MASTER', 9, b'1'),
    ('db_iemr', 'm_vanservicepointmap', NULL, 'MASTER', 10, b'1'),
    ('db_iemr', 'm_user', NULL, 'MASTER', 11, b'1'),
    ('db_iemr', 'm_uservanmapping', NULL, 'MASTER', 12, b'1'),
    ('db_iemr', 'm_userparkingplacemap', NULL, 'MASTER', 13, b'1')
ON DUPLICATE KEY UPDATE
    VanAutoIncColumnName = VALUES(VanAutoIncColumnName),
    TableType            = VALUES(TableType),
    SyncOrder            = VALUES(SyncOrder);

-- -----------------------------------------------------------------------------
-- Transactional data - filtered by VanID and the DownSynced flag.
-- -----------------------------------------------------------------------------
INSERT INTO db_iemr.m_downsynctabledetail
    (SchemaName, TableName, VanAutoIncColumnName, TableType, SyncOrder, IsActive)
VALUES
    ('db_identity', 'i_beneficiarydetails', 'BeneficiaryDetailsId', 'TRANSACTIONAL', 14, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryaddress', 'BenAddressID', 'TRANSACTIONAL', 15, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiarycontacts', 'BenContactsID', 'TRANSACTIONAL', 16, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryaccount', 'BenAccountID', 'TRANSACTIONAL', 17, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiarymapping', 'BenMapId', 'TRANSACTIONAL', 18, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryfamilymapping', 'BenFamilyMapId', 'TRANSACTIONAL', 19, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryidentity', 'BenIdentityId', 'TRANSACTIONAL', 20, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'm_beneficiaryregidmapping', 'BenRegId', 'TRANSACTIONAL', 21, b'0'),   -- identity graph: keep inactive
    ('db_iemr', 't_benvisitdetail', 'BenVisitID', 'TRANSACTIONAL', 22, b'1'),
    ('db_iemr', 't_phy_anthropometry', 'ID', 'TRANSACTIONAL', 23, b'1'),
    ('db_iemr', 't_phy_vitals', 'ID', 'TRANSACTIONAL', 24, b'1'),
    ('db_iemr', 't_benadherence', 'ID', 'TRANSACTIONAL', 25, b'1'),
    ('db_iemr', 't_anccare', 'ID', 'TRANSACTIONAL', 26, b'1'),
    ('db_iemr', 't_pnccare', 'ID', 'TRANSACTIONAL', 27, b'1'),
    ('db_iemr', 't_ncdscreening', 'ID', 'TRANSACTIONAL', 28, b'1'),
    ('db_iemr', 't_ncdcare', 'ID', 'TRANSACTIONAL', 29, b'1'),
    ('db_iemr', 't_phy_generalexam', 'ID', 'TRANSACTIONAL', 30, b'1'),
    ('db_iemr', 't_phy_headtotoe', 'ID', 'TRANSACTIONAL', 31, b'1'),
    ('db_iemr', 't_sys_obstetric', 'ID', 'TRANSACTIONAL', 32, b'1'),
    ('db_iemr', 't_sys_gastrointestinal', 'ID', 'TRANSACTIONAL', 33, b'1'),
    ('db_iemr', 't_sys_cardiovascular', 'ID', 'TRANSACTIONAL', 34, b'1'),
    ('db_iemr', 't_sys_respiratory', 'ID', 'TRANSACTIONAL', 35, b'1'),
    ('db_iemr', 't_sys_centralnervous', 'ID', 'TRANSACTIONAL', 36, b'1'),
    ('db_iemr', 't_sys_musculoskeletalsystem', 'ID', 'TRANSACTIONAL', 37, b'1'),
    ('db_iemr', 't_sys_genitourinarysystem', 'ID', 'TRANSACTIONAL', 38, b'1'),
    ('db_iemr', 't_ancdiagnosis', 'ID', 'TRANSACTIONAL', 39, b'1'),
    ('db_iemr', 't_ncddiagnosis', 'ID', 'TRANSACTIONAL', 40, b'1'),
    ('db_iemr', 't_pncdiagnosis', 'ID', 'TRANSACTIONAL', 41, b'1'),
    ('db_iemr', 't_benchiefcomplaint', 'ID', 'TRANSACTIONAL', 42, b'1'),
    ('db_iemr', 't_benclinicalobservation', 'ClinicalObservationID', 'TRANSACTIONAL', 43, b'1'),
    ('db_iemr', 't_prescription', 'PrescriptionID', 'TRANSACTIONAL', 44, b'1'),
    ('db_iemr', 't_prescribeddrug', 'PrescribedDrugID', 'TRANSACTIONAL', 45, b'1'),
    ('db_iemr', 't_lab_testorder', 'ID', 'TRANSACTIONAL', 46, b'1'),
    ('db_iemr', 't_benreferdetails', 'benReferID', 'TRANSACTIONAL', 47, b'1'),
    ('db_iemr', 't_lab_testresult', 'ID', 'TRANSACTIONAL', 48, b'1'),
    ('db_iemr', 't_physicalstockentry', 'PhyEntryID', 'TRANSACTIONAL', 49, b'1'),
    ('db_iemr', 't_patientissue', 'PatientIssueID', 'TRANSACTIONAL', 50, b'1'),
    ('db_iemr', 't_facilityconsumption', 'ConsumptionID', 'TRANSACTIONAL', 51, b'1'),
    ('db_iemr', 't_itemstockentry', 'ItemStockEntryID', 'TRANSACTIONAL', 52, b'1'),
    ('db_iemr', 't_itemstockexit', 'ItemStockExitID', 'TRANSACTIONAL', 53, b'1'),
    ('db_iemr', 't_benmedhistory', 'BenMedHistoryID', 'TRANSACTIONAL', 54, b'1'),
    ('db_iemr', 't_femaleobstetrichistory', 'ObstetricHistoryID', 'TRANSACTIONAL', 55, b'1'),
    ('db_iemr', 't_benmenstrualdetails', 'BenMenstrualID', 'TRANSACTIONAL', 56, b'1'),
    ('db_iemr', 't_benpersonalhabit', 'BenPersonalHabitID', 'TRANSACTIONAL', 57, b'1'),
    ('db_iemr', 't_childvaccinedetail1', 'ID', 'TRANSACTIONAL', 58, b'1'),
    ('db_iemr', 't_childvaccinedetail2', 'ID', 'TRANSACTIONAL', 59, b'1'),
    ('db_iemr', 't_childoptionalvaccinedetail', 'ID', 'TRANSACTIONAL', 60, b'1'),
    ('db_iemr', 't_ancwomenvaccinedetail', 'ID', 'TRANSACTIONAL', 61, b'1'),
    ('db_iemr', 't_childfeedinghistory', 'ID', 'TRANSACTIONAL', 62, b'1'),
    ('db_iemr', 't_benallergyhistory', 'ID', 'TRANSACTIONAL', 63, b'1'),
    ('db_iemr', 't_bencomorbiditycondition', 'ID', 'TRANSACTIONAL', 64, b'1'),
    ('db_iemr', 't_benmedicationhistory', 'ID', 'TRANSACTIONAL', 65, b'1'),
    ('db_iemr', 't_benfamilyhistory', 'ID', 'TRANSACTIONAL', 66, b'1'),
    ('db_iemr', 't_perinatalhistory', 'ID', 'TRANSACTIONAL', 67, b'1'),
    ('db_iemr', 't_developmenthistory', 'ID', 'TRANSACTIONAL', 68, b'1'),
    ('db_iemr', 't_cancerfamilyhistory', 'ID', 'TRANSACTIONAL', 69, b'1'),
    ('db_iemr', 't_cancerpersonalhistory', 'ID', 'TRANSACTIONAL', 70, b'1'),
    ('db_iemr', 't_cancerdiethistory', 'ID', 'TRANSACTIONAL', 71, b'1'),
    ('db_iemr', 't_cancerobstetrichistory', 'ID', 'TRANSACTIONAL', 72, b'1'),
    ('db_iemr', 't_cancervitals', 'ID', 'TRANSACTIONAL', 73, b'1'),
    ('db_iemr', 't_cancersignandsymptoms', 'ID', 'TRANSACTIONAL', 74, b'1'),
    ('db_iemr', 't_cancerlymphnode', 'ID', 'TRANSACTIONAL', 75, b'1'),
    ('db_iemr', 't_canceroralexamination', 'ID', 'TRANSACTIONAL', 76, b'1'),
    ('db_iemr', 't_cancerbreastexamination', 'ID', 'TRANSACTIONAL', 77, b'1'),
    ('db_iemr', 't_cancerabdominalexamination', 'ID', 'TRANSACTIONAL', 78, b'1'),
    ('db_iemr', 't_cancergynecologicalexamination', 'ID', 'TRANSACTIONAL', 79, b'1'),
    ('db_iemr', 't_cancerdiagnosis', 'ID', 'TRANSACTIONAL', 80, b'1'),
    ('db_iemr', 't_cancerimageannotation', 'ID', 'TRANSACTIONAL', 81, b'1'),
    ('db_identity', 'i_beneficiaryimage', 'BenImageId', 'TRANSACTIONAL', 82, b'1'),
    ('db_iemr', 't_stockadjustment', 'StockAdjustmentID', 'TRANSACTIONAL', 83, b'1'),
    ('db_iemr', 't_stocktransfer', 'StockTransferID', 'TRANSACTIONAL', 84, b'1'),
    ('db_iemr', 't_patientreturn', 'PatientReturnID', 'TRANSACTIONAL', 85, b'1'),
    ('db_iemr', 't_indent', 'IndentID', 'TRANSACTIONAL', 86, b'1'),
    ('db_iemr', 't_indentissue', 'IndentIssueID', 'TRANSACTIONAL', 87, b'1'),
    ('db_iemr', 't_indentorder', 'IndentOrderID', 'TRANSACTIONAL', 88, b'1'),
    ('db_iemr', 't_saitemmapping', 'SAItemMapID', 'TRANSACTIONAL', 89, b'1'),
    ('db_iemr', 'tb_stoptb_general_opd', 'id', 'TRANSACTIONAL', 90, b'1'),
    ('db_iemr', 'tb_stoptb_general_examination', 'id', 'TRANSACTIONAL', 91, b'1'),
    ('db_iemr', 'tb_screening', 'id', 'TRANSACTIONAL', 92, b'1'),
    ('db_iemr', 'tb_stoptb_diagnostics', 'id', 'TRANSACTIONAL', 93, b'1'),
    ('db_iemr', 'tb_suspected', 'id', 'TRANSACTIONAL', 94, b'1'),
    ('db_iemr', 'tb_confirmed_cases', 'id', 'TRANSACTIONAL', 95, b'1'),
    ('db_iemr', 'tb_diagnostic_order', 'id', 'TRANSACTIONAL', 96, b'1'),
    ('db_iemr', 'tb_diagnostic_result', 'id', 'TRANSACTIONAL', 97, b'1'),
    ('db_iemr', 'tb_diagnostic_document', 'id', 'TRANSACTIONAL', 98, b'1'),
    ('db_identity', 'i_beneficiarydetails_rmnch', 'beneficiaryDetails_RmnchId', 'TRANSACTIONAL', 99, b'1'),
    ('db_identity', 'i_bornbirthdeatils', 'BornBirthDeatilsId', 'TRANSACTIONAL', 100, b'1'),
    ('db_identity', 'i_householddetails', 'houseHoldDetailsId', 'TRANSACTIONAL', 101, b'1'),
    ('db_iemr', 'tb_stoptb_visit', 'id', 'TRANSACTIONAL', 102, b'1'),
    ('db_iemr', 't_form_response', 'responseId', 'TRANSACTIONAL', 103, b'1'),
    ('db_iemr', 't_section_response', 'sectionResponseId', 'TRANSACTIONAL', 104, b'1'),
    ('db_iemr', 't_question_response', 'questionResponseId', 'TRANSACTIONAL', 105, b'1')
ON DUPLICATE KEY UPDATE
    VanAutoIncColumnName = VALUES(VanAutoIncColumnName),
    TableType            = VALUES(TableType),
    SyncOrder            = VALUES(SyncOrder);
