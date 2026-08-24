USE db_iemr;

-- LastModColumnName is the table's modification-time column. NULL means
-- LastModDate; the StopTB tables record last_mod_date instead. Central puts it in
-- the WHERE clause that decides which records to send, and the van uses it to
-- compare its copy against central's - a wrong value means edits made in central
-- are never delivered.
--
-- VanAutoIncColumnName is the real AUTO_INCREMENT primary key, NOT the literal
-- 'vanSerialNo' that m_synctabledetail holds for 16 of these tables.
--
-- The eight beneficiary identity tables are IsActive = 0 and must stay that way:
-- i_beneficiarymapping points at the primary keys of the other identity tables,
-- which are per-DB AUTO_INCREMENTs that differ between central and a van, so
-- copying them verbatim silently mis-links beneficiaries.

CREATE TABLE IF NOT EXISTS db_iemr.m_downsynctabledetail (
    DownSyncTableDetailID INT           NOT NULL AUTO_INCREMENT,
    SchemaName            VARCHAR(100)  NOT NULL COMMENT 'db_identity / db_iemr',
    TableName             VARCHAR(200)  NOT NULL COMMENT 'table to down-sync',
    ServerColumnName      TEXT          NULL     COMMENT 'columns to SELECT from central; NULL = resolve from information_schema',
    VanColumnName         TEXT          NULL     COMMENT 'columns in local, positionally mapped with ServerColumnName',
    VanAutoIncColumnName  VARCHAR(200)  NULL     COMMENT 'local auto-increment PK - skipped on INSERT so local generates its own value',
    LastModColumnName     VARCHAR(200)  NULL     COMMENT 'modification-time column; NULL = LastModDate',
    TableType             VARCHAR(20)   NOT NULL DEFAULT 'MASTER' COMMENT 'MASTER = full pull / TRANSACTIONAL = filter by VanID + DownSynced',
    SyncOrder             INT           NOT NULL DEFAULT 1000 COMMENT 'lower number syncs first - enforces the FK dependency chain',
    IsActive              BIT(1)        NOT NULL DEFAULT b'1',
    PRIMARY KEY (DownSyncTableDetailID),
    UNIQUE KEY uk_downsynctabledetail_table (SchemaName, TableName),
    KEY idx_downsynctabledetail_order (SyncOrder)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.COLUMNS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'm_downsynctabledetail'
              AND COLUMN_NAME  = 'LastModColumnName'
        ),
        'SELECT ''db_iemr.m_downsynctabledetail.LastModColumnName already exists''',
        'ALTER TABLE db_iemr.m_downsynctabledetail ADD COLUMN LastModColumnName VARCHAR(200) NULL DEFAULT NULL'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ----------------------------------------------------------------------------
-- master / reference data - full pull, no VanID filter
-- ----------------------------------------------------------------------------

INSERT INTO db_iemr.m_downsynctabledetail
    (SchemaName, TableName, VanAutoIncColumnName, LastModColumnName, TableType, SyncOrder, IsActive)
VALUES
    ('db_iemr', 'm_state', NULL, NULL, 'MASTER', 1, b'1'),
    ('db_iemr', 'm_district', NULL, NULL, 'MASTER', 2, b'1'),
    ('db_iemr', 'm_districtblock', NULL, NULL, 'MASTER', 3, b'1'),
    ('db_iemr', 'm_providerservicemapping', NULL, NULL, 'MASTER', 4, b'1'),
    ('db_iemr', 'm_vantype', NULL, NULL, 'MASTER', 5, b'1'),
    ('db_iemr', 'm_van', NULL, NULL, 'MASTER', 6, b'1'),
    ('db_iemr', 'm_parkingplace', NULL, NULL, 'MASTER', 7, b'1'),
    ('db_iemr', 'm_servicepoint', NULL, NULL, 'MASTER', 8, b'1'),
    ('db_iemr', 'm_servicepointvillagemap', NULL, NULL, 'MASTER', 9, b'1'),
    ('db_iemr', 'm_vanservicepointmap', NULL, NULL, 'MASTER', 10, b'1'),
    ('db_iemr', 'm_user', NULL, NULL, 'MASTER', 11, b'1'),
    ('db_iemr', 'm_uservanmapping', NULL, NULL, 'MASTER', 12, b'1'),
    ('db_iemr', 'm_userparkingplacemap', NULL, NULL, 'MASTER', 13, b'1')
ON DUPLICATE KEY UPDATE
    VanAutoIncColumnName = VALUES(VanAutoIncColumnName),
    LastModColumnName    = VALUES(LastModColumnName),
    TableType            = VALUES(TableType),
    SyncOrder            = VALUES(SyncOrder);

-- ----------------------------------------------------------------------------
-- transactional data - filtered by VanID and the DownSynced flag
-- ----------------------------------------------------------------------------

INSERT INTO db_iemr.m_downsynctabledetail
    (SchemaName, TableName, VanAutoIncColumnName, LastModColumnName, TableType, SyncOrder, IsActive)
VALUES
    ('db_identity', 'i_beneficiarydetails', 'BeneficiaryDetailsId', NULL, 'TRANSACTIONAL', 14, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryaddress', 'BenAddressID', NULL, 'TRANSACTIONAL', 15, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiarycontacts', 'BenContactsID', NULL, 'TRANSACTIONAL', 16, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryaccount', 'BenAccountID', NULL, 'TRANSACTIONAL', 17, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiarymapping', 'BenMapId', NULL, 'TRANSACTIONAL', 18, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryfamilymapping', 'BenFamilyMapId', NULL, 'TRANSACTIONAL', 19, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'i_beneficiaryidentity', 'BenIdentityId', NULL, 'TRANSACTIONAL', 20, b'0'),   -- identity graph: keep inactive
    ('db_identity', 'm_beneficiaryregidmapping', 'BenRegId', NULL, 'TRANSACTIONAL', 21, b'0'),   -- identity graph: keep inactive
    ('db_iemr', 't_benvisitdetail', 'BenVisitID', NULL, 'TRANSACTIONAL', 22, b'1'),
    ('db_iemr', 't_phy_anthropometry', 'ID', NULL, 'TRANSACTIONAL', 23, b'1'),
    ('db_iemr', 't_phy_vitals', 'ID', NULL, 'TRANSACTIONAL', 24, b'1'),
    ('db_iemr', 't_benadherence', 'ID', NULL, 'TRANSACTIONAL', 25, b'1'),
    ('db_iemr', 't_anccare', 'ID', NULL, 'TRANSACTIONAL', 26, b'1'),
    ('db_iemr', 't_pnccare', 'ID', NULL, 'TRANSACTIONAL', 27, b'1'),
    ('db_iemr', 't_ncdscreening', 'ID', NULL, 'TRANSACTIONAL', 28, b'1'),
    ('db_iemr', 't_ncdcare', 'ID', NULL, 'TRANSACTIONAL', 29, b'1'),
    ('db_iemr', 't_phy_generalexam', 'ID', NULL, 'TRANSACTIONAL', 30, b'1'),
    ('db_iemr', 't_phy_headtotoe', 'ID', NULL, 'TRANSACTIONAL', 31, b'1'),
    ('db_iemr', 't_sys_obstetric', 'ID', NULL, 'TRANSACTIONAL', 32, b'1'),
    ('db_iemr', 't_sys_gastrointestinal', 'ID', NULL, 'TRANSACTIONAL', 33, b'1'),
    ('db_iemr', 't_sys_cardiovascular', 'ID', NULL, 'TRANSACTIONAL', 34, b'1'),
    ('db_iemr', 't_sys_respiratory', 'ID', NULL, 'TRANSACTIONAL', 35, b'1'),
    ('db_iemr', 't_sys_centralnervous', 'ID', NULL, 'TRANSACTIONAL', 36, b'1'),
    ('db_iemr', 't_sys_musculoskeletalsystem', 'ID', NULL, 'TRANSACTIONAL', 37, b'1'),
    ('db_iemr', 't_sys_genitourinarysystem', 'ID', NULL, 'TRANSACTIONAL', 38, b'1'),
    ('db_iemr', 't_ancdiagnosis', 'ID', NULL, 'TRANSACTIONAL', 39, b'1'),
    ('db_iemr', 't_ncddiagnosis', 'ID', NULL, 'TRANSACTIONAL', 40, b'1'),
    ('db_iemr', 't_pncdiagnosis', 'ID', NULL, 'TRANSACTIONAL', 41, b'1'),
    ('db_iemr', 't_benchiefcomplaint', 'ID', NULL, 'TRANSACTIONAL', 42, b'1'),
    ('db_iemr', 't_benclinicalobservation', 'ClinicalObservationID', NULL, 'TRANSACTIONAL', 43, b'1'),
    ('db_iemr', 't_prescription', 'PrescriptionID', NULL, 'TRANSACTIONAL', 44, b'1'),
    ('db_iemr', 't_prescribeddrug', 'PrescribedDrugID', NULL, 'TRANSACTIONAL', 45, b'1'),
    ('db_iemr', 't_lab_testorder', 'ID', NULL, 'TRANSACTIONAL', 46, b'1'),
    ('db_iemr', 't_benreferdetails', 'benReferID', NULL, 'TRANSACTIONAL', 47, b'1'),
    ('db_iemr', 't_lab_testresult', 'ID', NULL, 'TRANSACTIONAL', 48, b'1'),
    ('db_iemr', 't_physicalstockentry', 'PhyEntryID', NULL, 'TRANSACTIONAL', 49, b'1'),
    ('db_iemr', 't_patientissue', 'PatientIssueID', NULL, 'TRANSACTIONAL', 50, b'1'),
    ('db_iemr', 't_facilityconsumption', 'ConsumptionID', NULL, 'TRANSACTIONAL', 51, b'1'),
    ('db_iemr', 't_itemstockentry', 'ItemStockEntryID', NULL, 'TRANSACTIONAL', 52, b'1'),
    ('db_iemr', 't_itemstockexit', 'ItemStockExitID', NULL, 'TRANSACTIONAL', 53, b'1'),
    ('db_iemr', 't_benmedhistory', 'BenMedHistoryID', NULL, 'TRANSACTIONAL', 54, b'1'),
    ('db_iemr', 't_femaleobstetrichistory', 'ObstetricHistoryID', NULL, 'TRANSACTIONAL', 55, b'1'),
    ('db_iemr', 't_benmenstrualdetails', 'BenMenstrualID', NULL, 'TRANSACTIONAL', 56, b'1'),
    ('db_iemr', 't_benpersonalhabit', 'BenPersonalHabitID', NULL, 'TRANSACTIONAL', 57, b'1'),
    ('db_iemr', 't_childvaccinedetail1', 'ID', NULL, 'TRANSACTIONAL', 58, b'1'),
    ('db_iemr', 't_childvaccinedetail2', 'ID', NULL, 'TRANSACTIONAL', 59, b'1'),
    ('db_iemr', 't_childoptionalvaccinedetail', 'ID', NULL, 'TRANSACTIONAL', 60, b'1'),
    ('db_iemr', 't_ancwomenvaccinedetail', 'ID', NULL, 'TRANSACTIONAL', 61, b'1'),
    ('db_iemr', 't_childfeedinghistory', 'ID', NULL, 'TRANSACTIONAL', 62, b'1'),
    ('db_iemr', 't_benallergyhistory', 'ID', NULL, 'TRANSACTIONAL', 63, b'1'),
    ('db_iemr', 't_bencomorbiditycondition', 'ID', NULL, 'TRANSACTIONAL', 64, b'1'),
    ('db_iemr', 't_benmedicationhistory', 'ID', NULL, 'TRANSACTIONAL', 65, b'1'),
    ('db_iemr', 't_benfamilyhistory', 'ID', NULL, 'TRANSACTIONAL', 66, b'1'),
    ('db_iemr', 't_perinatalhistory', 'ID', NULL, 'TRANSACTIONAL', 67, b'1'),
    ('db_iemr', 't_developmenthistory', 'ID', NULL, 'TRANSACTIONAL', 68, b'1'),
    ('db_iemr', 't_cancerfamilyhistory', 'ID', NULL, 'TRANSACTIONAL', 69, b'1'),
    ('db_iemr', 't_cancerpersonalhistory', 'ID', NULL, 'TRANSACTIONAL', 70, b'1'),
    ('db_iemr', 't_cancerdiethistory', 'ID', NULL, 'TRANSACTIONAL', 71, b'1'),
    ('db_iemr', 't_cancerobstetrichistory', 'ID', NULL, 'TRANSACTIONAL', 72, b'1'),
    ('db_iemr', 't_cancervitals', 'ID', NULL, 'TRANSACTIONAL', 73, b'1'),
    ('db_iemr', 't_cancersignandsymptoms', 'ID', NULL, 'TRANSACTIONAL', 74, b'1'),
    ('db_iemr', 't_cancerlymphnode', 'ID', NULL, 'TRANSACTIONAL', 75, b'1'),
    ('db_iemr', 't_canceroralexamination', 'ID', NULL, 'TRANSACTIONAL', 76, b'1'),
    ('db_iemr', 't_cancerbreastexamination', 'ID', NULL, 'TRANSACTIONAL', 77, b'1'),
    ('db_iemr', 't_cancerabdominalexamination', 'ID', NULL, 'TRANSACTIONAL', 78, b'1'),
    ('db_iemr', 't_cancergynecologicalexamination', 'ID', NULL, 'TRANSACTIONAL', 79, b'1'),
    ('db_iemr', 't_cancerdiagnosis', 'ID', NULL, 'TRANSACTIONAL', 80, b'1'),
    ('db_iemr', 't_cancerimageannotation', 'ID', NULL, 'TRANSACTIONAL', 81, b'1'),
    ('db_identity', 'i_beneficiaryimage', 'BenImageId', NULL, 'TRANSACTIONAL', 82, b'1'),
    ('db_iemr', 't_stockadjustment', 'StockAdjustmentID', NULL, 'TRANSACTIONAL', 83, b'1'),
    ('db_iemr', 't_stocktransfer', 'StockTransferID', NULL, 'TRANSACTIONAL', 84, b'1'),
    ('db_iemr', 't_patientreturn', 'PatientReturnID', NULL, 'TRANSACTIONAL', 85, b'1'),
    ('db_iemr', 't_indent', 'IndentID', NULL, 'TRANSACTIONAL', 86, b'1'),
    ('db_iemr', 't_indentissue', 'IndentIssueID', NULL, 'TRANSACTIONAL', 87, b'1'),
    ('db_iemr', 't_indentorder', 'IndentOrderID', NULL, 'TRANSACTIONAL', 88, b'1'),
    ('db_iemr', 't_saitemmapping', 'SAItemMapID', NULL, 'TRANSACTIONAL', 89, b'1'),
    ('db_iemr', 'tb_stoptb_general_opd', 'id', 'last_mod_date', 'TRANSACTIONAL', 90, b'1'),
    ('db_iemr', 'tb_stoptb_general_examination', 'id', 'last_mod_date', 'TRANSACTIONAL', 91, b'1'),
    ('db_iemr', 'tb_screening', 'id', 'last_mod_date', 'TRANSACTIONAL', 92, b'1'),
    ('db_iemr', 'tb_stoptb_diagnostics', 'id', 'last_mod_date', 'TRANSACTIONAL', 93, b'1'),
    ('db_iemr', 'tb_suspected', 'id', 'last_mod_date', 'TRANSACTIONAL', 94, b'1'),
    ('db_iemr', 'tb_confirmed_cases', 'id', 'last_mod_date', 'TRANSACTIONAL', 95, b'1'),
    ('db_iemr', 'tb_diagnostic_order', 'id', 'last_mod_date', 'TRANSACTIONAL', 96, b'1'),
    ('db_iemr', 'tb_diagnostic_result', 'id', 'last_mod_date', 'TRANSACTIONAL', 97, b'1'),
    ('db_iemr', 'tb_diagnostic_document', 'id', 'last_mod_date', 'TRANSACTIONAL', 98, b'1'),
    ('db_identity', 'i_beneficiarydetails_rmnch', 'beneficiaryDetails_RmnchId', NULL, 'TRANSACTIONAL', 99, b'1'),
    ('db_identity', 'i_bornbirthdeatils', 'BornBirthDeatilsId', NULL, 'TRANSACTIONAL', 100, b'1'),
    ('db_identity', 'i_householddetails', 'houseHoldDetailsId', NULL, 'TRANSACTIONAL', 101, b'1'),
    ('db_iemr', 'tb_stoptb_visit', 'id', 'last_mod_date', 'TRANSACTIONAL', 102, b'1'),
    ('db_iemr', 't_form_response', 'responseId', 'last_mod_date', 'TRANSACTIONAL', 103, b'1'),
    ('db_iemr', 't_section_response', 'sectionResponseId', 'last_mod_date', 'TRANSACTIONAL', 104, b'1'),
    ('db_iemr', 't_question_response', 'questionResponseId', 'last_mod_date', 'TRANSACTIONAL', 105, b'1')
ON DUPLICATE KEY UPDATE
    VanAutoIncColumnName = VALUES(VanAutoIncColumnName),
    LastModColumnName    = VALUES(LastModColumnName),
    TableType            = VALUES(TableType),
    SyncOrder            = VALUES(SyncOrder);
