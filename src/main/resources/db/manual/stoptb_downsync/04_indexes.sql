-- =============================================================================
-- StopTB down-sync : indexes
--
-- Run by hand, in file-number order, against the StopTB database only.
-- Not a Flyway migration - these scripts live outside db/migration on purpose.
--
-- Every statement is guarded: it checks information_schema first and prints
-- "already exists" instead of failing, so the whole file is safe to re-run.
--
-- (VanID, DownSynced) serves the down-sync select, (VanID, Processed) the
-- up-sync select. Only the tables that actually carry both columns.
-- =============================================================================

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails'
              AND INDEX_NAME   = 'idx_i_beneficiarydetails_downsync'
        ),
        'SELECT ''idx_i_beneficiarydetails_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails ADD KEY idx_i_beneficiarydetails_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaddress'
              AND INDEX_NAME   = 'idx_i_beneficiaryaddress_downsync'
        ),
        'SELECT ''idx_i_beneficiaryaddress_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaddress ADD KEY idx_i_beneficiaryaddress_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarycontacts'
              AND INDEX_NAME   = 'idx_i_beneficiarycontacts_downsync'
        ),
        'SELECT ''idx_i_beneficiarycontacts_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiarycontacts ADD KEY idx_i_beneficiarycontacts_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryaccount'
              AND INDEX_NAME   = 'idx_i_beneficiaryaccount_downsync'
        ),
        'SELECT ''idx_i_beneficiaryaccount_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiaryaccount ADD KEY idx_i_beneficiaryaccount_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarymapping'
              AND INDEX_NAME   = 'idx_i_beneficiarymapping_downsync'
        ),
        'SELECT ''idx_i_beneficiarymapping_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiarymapping ADD KEY idx_i_beneficiarymapping_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryfamilymapping'
              AND INDEX_NAME   = 'idx_i_beneficiaryfamilymapping_downsync'
        ),
        'SELECT ''idx_i_beneficiaryfamilymapping_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiaryfamilymapping ADD KEY idx_i_beneficiaryfamilymapping_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryidentity'
              AND INDEX_NAME   = 'idx_i_beneficiaryidentity_downsync'
        ),
        'SELECT ''idx_i_beneficiaryidentity_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiaryidentity ADD KEY idx_i_beneficiaryidentity_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'm_beneficiaryregidmapping'
              AND INDEX_NAME   = 'idx_m_beneficiaryregidmapping_downsync'
        ),
        'SELECT ''idx_m_beneficiaryregidmapping_downsync already exists''',
        'ALTER TABLE db_identity.m_beneficiaryregidmapping ADD KEY idx_m_beneficiaryregidmapping_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benvisitdetail'
              AND INDEX_NAME   = 'idx_t_benvisitdetail_downsync'
        ),
        'SELECT ''idx_t_benvisitdetail_downsync already exists''',
        'ALTER TABLE db_iemr.t_benvisitdetail ADD KEY idx_t_benvisitdetail_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_anthropometry'
              AND INDEX_NAME   = 'idx_t_phy_anthropometry_downsync'
        ),
        'SELECT ''idx_t_phy_anthropometry_downsync already exists''',
        'ALTER TABLE db_iemr.t_phy_anthropometry ADD KEY idx_t_phy_anthropometry_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_vitals'
              AND INDEX_NAME   = 'idx_t_phy_vitals_downsync'
        ),
        'SELECT ''idx_t_phy_vitals_downsync already exists''',
        'ALTER TABLE db_iemr.t_phy_vitals ADD KEY idx_t_phy_vitals_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benadherence'
              AND INDEX_NAME   = 'idx_t_benadherence_downsync'
        ),
        'SELECT ''idx_t_benadherence_downsync already exists''',
        'ALTER TABLE db_iemr.t_benadherence ADD KEY idx_t_benadherence_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_anccare'
              AND INDEX_NAME   = 'idx_t_anccare_downsync'
        ),
        'SELECT ''idx_t_anccare_downsync already exists''',
        'ALTER TABLE db_iemr.t_anccare ADD KEY idx_t_anccare_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_pnccare'
              AND INDEX_NAME   = 'idx_t_pnccare_downsync'
        ),
        'SELECT ''idx_t_pnccare_downsync already exists''',
        'ALTER TABLE db_iemr.t_pnccare ADD KEY idx_t_pnccare_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ncdscreening'
              AND INDEX_NAME   = 'idx_t_ncdscreening_downsync'
        ),
        'SELECT ''idx_t_ncdscreening_downsync already exists''',
        'ALTER TABLE db_iemr.t_ncdscreening ADD KEY idx_t_ncdscreening_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ncdcare'
              AND INDEX_NAME   = 'idx_t_ncdcare_downsync'
        ),
        'SELECT ''idx_t_ncdcare_downsync already exists''',
        'ALTER TABLE db_iemr.t_ncdcare ADD KEY idx_t_ncdcare_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_generalexam'
              AND INDEX_NAME   = 'idx_t_phy_generalexam_downsync'
        ),
        'SELECT ''idx_t_phy_generalexam_downsync already exists''',
        'ALTER TABLE db_iemr.t_phy_generalexam ADD KEY idx_t_phy_generalexam_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_phy_headtotoe'
              AND INDEX_NAME   = 'idx_t_phy_headtotoe_downsync'
        ),
        'SELECT ''idx_t_phy_headtotoe_downsync already exists''',
        'ALTER TABLE db_iemr.t_phy_headtotoe ADD KEY idx_t_phy_headtotoe_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_obstetric'
              AND INDEX_NAME   = 'idx_t_sys_obstetric_downsync'
        ),
        'SELECT ''idx_t_sys_obstetric_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_obstetric ADD KEY idx_t_sys_obstetric_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_gastrointestinal'
              AND INDEX_NAME   = 'idx_t_sys_gastrointestinal_downsync'
        ),
        'SELECT ''idx_t_sys_gastrointestinal_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_gastrointestinal ADD KEY idx_t_sys_gastrointestinal_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_cardiovascular'
              AND INDEX_NAME   = 'idx_t_sys_cardiovascular_downsync'
        ),
        'SELECT ''idx_t_sys_cardiovascular_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_cardiovascular ADD KEY idx_t_sys_cardiovascular_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_respiratory'
              AND INDEX_NAME   = 'idx_t_sys_respiratory_downsync'
        ),
        'SELECT ''idx_t_sys_respiratory_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_respiratory ADD KEY idx_t_sys_respiratory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_centralnervous'
              AND INDEX_NAME   = 'idx_t_sys_centralnervous_downsync'
        ),
        'SELECT ''idx_t_sys_centralnervous_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_centralnervous ADD KEY idx_t_sys_centralnervous_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_musculoskeletalsystem'
              AND INDEX_NAME   = 'idx_t_sys_musculoskeletalsystem_downsync'
        ),
        'SELECT ''idx_t_sys_musculoskeletalsystem_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_musculoskeletalsystem ADD KEY idx_t_sys_musculoskeletalsystem_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_sys_genitourinarysystem'
              AND INDEX_NAME   = 'idx_t_sys_genitourinarysystem_downsync'
        ),
        'SELECT ''idx_t_sys_genitourinarysystem_downsync already exists''',
        'ALTER TABLE db_iemr.t_sys_genitourinarysystem ADD KEY idx_t_sys_genitourinarysystem_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ancdiagnosis'
              AND INDEX_NAME   = 'idx_t_ancdiagnosis_downsync'
        ),
        'SELECT ''idx_t_ancdiagnosis_downsync already exists''',
        'ALTER TABLE db_iemr.t_ancdiagnosis ADD KEY idx_t_ancdiagnosis_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ncddiagnosis'
              AND INDEX_NAME   = 'idx_t_ncddiagnosis_downsync'
        ),
        'SELECT ''idx_t_ncddiagnosis_downsync already exists''',
        'ALTER TABLE db_iemr.t_ncddiagnosis ADD KEY idx_t_ncddiagnosis_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_pncdiagnosis'
              AND INDEX_NAME   = 'idx_t_pncdiagnosis_downsync'
        ),
        'SELECT ''idx_t_pncdiagnosis_downsync already exists''',
        'ALTER TABLE db_iemr.t_pncdiagnosis ADD KEY idx_t_pncdiagnosis_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benchiefcomplaint'
              AND INDEX_NAME   = 'idx_t_benchiefcomplaint_downsync'
        ),
        'SELECT ''idx_t_benchiefcomplaint_downsync already exists''',
        'ALTER TABLE db_iemr.t_benchiefcomplaint ADD KEY idx_t_benchiefcomplaint_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benclinicalobservation'
              AND INDEX_NAME   = 'idx_t_benclinicalobservation_downsync'
        ),
        'SELECT ''idx_t_benclinicalobservation_downsync already exists''',
        'ALTER TABLE db_iemr.t_benclinicalobservation ADD KEY idx_t_benclinicalobservation_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_prescription'
              AND INDEX_NAME   = 'idx_t_prescription_downsync'
        ),
        'SELECT ''idx_t_prescription_downsync already exists''',
        'ALTER TABLE db_iemr.t_prescription ADD KEY idx_t_prescription_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_prescribeddrug'
              AND INDEX_NAME   = 'idx_t_prescribeddrug_downsync'
        ),
        'SELECT ''idx_t_prescribeddrug_downsync already exists''',
        'ALTER TABLE db_iemr.t_prescribeddrug ADD KEY idx_t_prescribeddrug_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_lab_testorder'
              AND INDEX_NAME   = 'idx_t_lab_testorder_downsync'
        ),
        'SELECT ''idx_t_lab_testorder_downsync already exists''',
        'ALTER TABLE db_iemr.t_lab_testorder ADD KEY idx_t_lab_testorder_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benreferdetails'
              AND INDEX_NAME   = 'idx_t_benreferdetails_downsync'
        ),
        'SELECT ''idx_t_benreferdetails_downsync already exists''',
        'ALTER TABLE db_iemr.t_benreferdetails ADD KEY idx_t_benreferdetails_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_lab_testresult'
              AND INDEX_NAME   = 'idx_t_lab_testresult_downsync'
        ),
        'SELECT ''idx_t_lab_testresult_downsync already exists''',
        'ALTER TABLE db_iemr.t_lab_testresult ADD KEY idx_t_lab_testresult_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_physicalstockentry'
              AND INDEX_NAME   = 'idx_t_physicalstockentry_downsync'
        ),
        'SELECT ''idx_t_physicalstockentry_downsync already exists''',
        'ALTER TABLE db_iemr.t_physicalstockentry ADD KEY idx_t_physicalstockentry_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_patientissue'
              AND INDEX_NAME   = 'idx_t_patientissue_downsync'
        ),
        'SELECT ''idx_t_patientissue_downsync already exists''',
        'ALTER TABLE db_iemr.t_patientissue ADD KEY idx_t_patientissue_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_facilityconsumption'
              AND INDEX_NAME   = 'idx_t_facilityconsumption_downsync'
        ),
        'SELECT ''idx_t_facilityconsumption_downsync already exists''',
        'ALTER TABLE db_iemr.t_facilityconsumption ADD KEY idx_t_facilityconsumption_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_itemstockentry'
              AND INDEX_NAME   = 'idx_t_itemstockentry_downsync'
        ),
        'SELECT ''idx_t_itemstockentry_downsync already exists''',
        'ALTER TABLE db_iemr.t_itemstockentry ADD KEY idx_t_itemstockentry_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_itemstockexit'
              AND INDEX_NAME   = 'idx_t_itemstockexit_downsync'
        ),
        'SELECT ''idx_t_itemstockexit_downsync already exists''',
        'ALTER TABLE db_iemr.t_itemstockexit ADD KEY idx_t_itemstockexit_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benmedhistory'
              AND INDEX_NAME   = 'idx_t_benmedhistory_downsync'
        ),
        'SELECT ''idx_t_benmedhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_benmedhistory ADD KEY idx_t_benmedhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_femaleobstetrichistory'
              AND INDEX_NAME   = 'idx_t_femaleobstetrichistory_downsync'
        ),
        'SELECT ''idx_t_femaleobstetrichistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_femaleobstetrichistory ADD KEY idx_t_femaleobstetrichistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benmenstrualdetails'
              AND INDEX_NAME   = 'idx_t_benmenstrualdetails_downsync'
        ),
        'SELECT ''idx_t_benmenstrualdetails_downsync already exists''',
        'ALTER TABLE db_iemr.t_benmenstrualdetails ADD KEY idx_t_benmenstrualdetails_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benpersonalhabit'
              AND INDEX_NAME   = 'idx_t_benpersonalhabit_downsync'
        ),
        'SELECT ''idx_t_benpersonalhabit_downsync already exists''',
        'ALTER TABLE db_iemr.t_benpersonalhabit ADD KEY idx_t_benpersonalhabit_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childvaccinedetail1'
              AND INDEX_NAME   = 'idx_t_childvaccinedetail1_downsync'
        ),
        'SELECT ''idx_t_childvaccinedetail1_downsync already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail1 ADD KEY idx_t_childvaccinedetail1_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childvaccinedetail2'
              AND INDEX_NAME   = 'idx_t_childvaccinedetail2_downsync'
        ),
        'SELECT ''idx_t_childvaccinedetail2_downsync already exists''',
        'ALTER TABLE db_iemr.t_childvaccinedetail2 ADD KEY idx_t_childvaccinedetail2_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childoptionalvaccinedetail'
              AND INDEX_NAME   = 'idx_t_childoptionalvaccinedetail_downsync'
        ),
        'SELECT ''idx_t_childoptionalvaccinedetail_downsync already exists''',
        'ALTER TABLE db_iemr.t_childoptionalvaccinedetail ADD KEY idx_t_childoptionalvaccinedetail_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_ancwomenvaccinedetail'
              AND INDEX_NAME   = 'idx_t_ancwomenvaccinedetail_downsync'
        ),
        'SELECT ''idx_t_ancwomenvaccinedetail_downsync already exists''',
        'ALTER TABLE db_iemr.t_ancwomenvaccinedetail ADD KEY idx_t_ancwomenvaccinedetail_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_childfeedinghistory'
              AND INDEX_NAME   = 'idx_t_childfeedinghistory_downsync'
        ),
        'SELECT ''idx_t_childfeedinghistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_childfeedinghistory ADD KEY idx_t_childfeedinghistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benallergyhistory'
              AND INDEX_NAME   = 'idx_t_benallergyhistory_downsync'
        ),
        'SELECT ''idx_t_benallergyhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_benallergyhistory ADD KEY idx_t_benallergyhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_bencomorbiditycondition'
              AND INDEX_NAME   = 'idx_t_bencomorbiditycondition_downsync'
        ),
        'SELECT ''idx_t_bencomorbiditycondition_downsync already exists''',
        'ALTER TABLE db_iemr.t_bencomorbiditycondition ADD KEY idx_t_bencomorbiditycondition_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benmedicationhistory'
              AND INDEX_NAME   = 'idx_t_benmedicationhistory_downsync'
        ),
        'SELECT ''idx_t_benmedicationhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_benmedicationhistory ADD KEY idx_t_benmedicationhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_benfamilyhistory'
              AND INDEX_NAME   = 'idx_t_benfamilyhistory_downsync'
        ),
        'SELECT ''idx_t_benfamilyhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_benfamilyhistory ADD KEY idx_t_benfamilyhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_perinatalhistory'
              AND INDEX_NAME   = 'idx_t_perinatalhistory_downsync'
        ),
        'SELECT ''idx_t_perinatalhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_perinatalhistory ADD KEY idx_t_perinatalhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_developmenthistory'
              AND INDEX_NAME   = 'idx_t_developmenthistory_downsync'
        ),
        'SELECT ''idx_t_developmenthistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_developmenthistory ADD KEY idx_t_developmenthistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerfamilyhistory'
              AND INDEX_NAME   = 'idx_t_cancerfamilyhistory_downsync'
        ),
        'SELECT ''idx_t_cancerfamilyhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerfamilyhistory ADD KEY idx_t_cancerfamilyhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerpersonalhistory'
              AND INDEX_NAME   = 'idx_t_cancerpersonalhistory_downsync'
        ),
        'SELECT ''idx_t_cancerpersonalhistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerpersonalhistory ADD KEY idx_t_cancerpersonalhistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerdiethistory'
              AND INDEX_NAME   = 'idx_t_cancerdiethistory_downsync'
        ),
        'SELECT ''idx_t_cancerdiethistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerdiethistory ADD KEY idx_t_cancerdiethistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerobstetrichistory'
              AND INDEX_NAME   = 'idx_t_cancerobstetrichistory_downsync'
        ),
        'SELECT ''idx_t_cancerobstetrichistory_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerobstetrichistory ADD KEY idx_t_cancerobstetrichistory_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancervitals'
              AND INDEX_NAME   = 'idx_t_cancervitals_downsync'
        ),
        'SELECT ''idx_t_cancervitals_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancervitals ADD KEY idx_t_cancervitals_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancersignandsymptoms'
              AND INDEX_NAME   = 'idx_t_cancersignandsymptoms_downsync'
        ),
        'SELECT ''idx_t_cancersignandsymptoms_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancersignandsymptoms ADD KEY idx_t_cancersignandsymptoms_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerlymphnode'
              AND INDEX_NAME   = 'idx_t_cancerlymphnode_downsync'
        ),
        'SELECT ''idx_t_cancerlymphnode_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerlymphnode ADD KEY idx_t_cancerlymphnode_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_canceroralexamination'
              AND INDEX_NAME   = 'idx_t_canceroralexamination_downsync'
        ),
        'SELECT ''idx_t_canceroralexamination_downsync already exists''',
        'ALTER TABLE db_iemr.t_canceroralexamination ADD KEY idx_t_canceroralexamination_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerbreastexamination'
              AND INDEX_NAME   = 'idx_t_cancerbreastexamination_downsync'
        ),
        'SELECT ''idx_t_cancerbreastexamination_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerbreastexamination ADD KEY idx_t_cancerbreastexamination_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerabdominalexamination'
              AND INDEX_NAME   = 'idx_t_cancerabdominalexamination_downsync'
        ),
        'SELECT ''idx_t_cancerabdominalexamination_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerabdominalexamination ADD KEY idx_t_cancerabdominalexamination_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancergynecologicalexamination'
              AND INDEX_NAME   = 'idx_t_cancergynecologicalexamination_downsync'
        ),
        'SELECT ''idx_t_cancergynecologicalexamination_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancergynecologicalexamination ADD KEY idx_t_cancergynecologicalexamination_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerdiagnosis'
              AND INDEX_NAME   = 'idx_t_cancerdiagnosis_downsync'
        ),
        'SELECT ''idx_t_cancerdiagnosis_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerdiagnosis ADD KEY idx_t_cancerdiagnosis_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_cancerimageannotation'
              AND INDEX_NAME   = 'idx_t_cancerimageannotation_downsync'
        ),
        'SELECT ''idx_t_cancerimageannotation_downsync already exists''',
        'ALTER TABLE db_iemr.t_cancerimageannotation ADD KEY idx_t_cancerimageannotation_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiaryimage'
              AND INDEX_NAME   = 'idx_i_beneficiaryimage_downsync'
        ),
        'SELECT ''idx_i_beneficiaryimage_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiaryimage ADD KEY idx_i_beneficiaryimage_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_stockadjustment'
              AND INDEX_NAME   = 'idx_t_stockadjustment_downsync'
        ),
        'SELECT ''idx_t_stockadjustment_downsync already exists''',
        'ALTER TABLE db_iemr.t_stockadjustment ADD KEY idx_t_stockadjustment_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_stocktransfer'
              AND INDEX_NAME   = 'idx_t_stocktransfer_downsync'
        ),
        'SELECT ''idx_t_stocktransfer_downsync already exists''',
        'ALTER TABLE db_iemr.t_stocktransfer ADD KEY idx_t_stocktransfer_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_patientreturn'
              AND INDEX_NAME   = 'idx_t_patientreturn_downsync'
        ),
        'SELECT ''idx_t_patientreturn_downsync already exists''',
        'ALTER TABLE db_iemr.t_patientreturn ADD KEY idx_t_patientreturn_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_indent'
              AND INDEX_NAME   = 'idx_t_indent_downsync'
        ),
        'SELECT ''idx_t_indent_downsync already exists''',
        'ALTER TABLE db_iemr.t_indent ADD KEY idx_t_indent_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_indentissue'
              AND INDEX_NAME   = 'idx_t_indentissue_downsync'
        ),
        'SELECT ''idx_t_indentissue_downsync already exists''',
        'ALTER TABLE db_iemr.t_indentissue ADD KEY idx_t_indentissue_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_indentorder'
              AND INDEX_NAME   = 'idx_t_indentorder_downsync'
        ),
        'SELECT ''idx_t_indentorder_downsync already exists''',
        'ALTER TABLE db_iemr.t_indentorder ADD KEY idx_t_indentorder_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_saitemmapping'
              AND INDEX_NAME   = 'idx_t_saitemmapping_downsync'
        ),
        'SELECT ''idx_t_saitemmapping_downsync already exists''',
        'ALTER TABLE db_iemr.t_saitemmapping ADD KEY idx_t_saitemmapping_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_general_opd'
              AND INDEX_NAME   = 'idx_tb_stoptb_general_opd_downsync'
        ),
        'SELECT ''idx_tb_stoptb_general_opd_downsync already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_opd ADD KEY idx_tb_stoptb_general_opd_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_general_examination'
              AND INDEX_NAME   = 'idx_tb_stoptb_general_examination_downsync'
        ),
        'SELECT ''idx_tb_stoptb_general_examination_downsync already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_general_examination ADD KEY idx_tb_stoptb_general_examination_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_screening'
              AND INDEX_NAME   = 'idx_tb_screening_downsync'
        ),
        'SELECT ''idx_tb_screening_downsync already exists''',
        'ALTER TABLE db_iemr.tb_screening ADD KEY idx_tb_screening_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_diagnostics'
              AND INDEX_NAME   = 'idx_tb_stoptb_diagnostics_downsync'
        ),
        'SELECT ''idx_tb_stoptb_diagnostics_downsync already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_diagnostics ADD KEY idx_tb_stoptb_diagnostics_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_suspected'
              AND INDEX_NAME   = 'idx_tb_suspected_downsync'
        ),
        'SELECT ''idx_tb_suspected_downsync already exists''',
        'ALTER TABLE db_iemr.tb_suspected ADD KEY idx_tb_suspected_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_confirmed_cases'
              AND INDEX_NAME   = 'idx_tb_confirmed_cases_downsync'
        ),
        'SELECT ''idx_tb_confirmed_cases_downsync already exists''',
        'ALTER TABLE db_iemr.tb_confirmed_cases ADD KEY idx_tb_confirmed_cases_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_order'
              AND INDEX_NAME   = 'idx_tb_diagnostic_order_downsync'
        ),
        'SELECT ''idx_tb_diagnostic_order_downsync already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_order ADD KEY idx_tb_diagnostic_order_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_result'
              AND INDEX_NAME   = 'idx_tb_diagnostic_result_downsync'
        ),
        'SELECT ''idx_tb_diagnostic_result_downsync already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_result ADD KEY idx_tb_diagnostic_result_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_diagnostic_document'
              AND INDEX_NAME   = 'idx_tb_diagnostic_document_downsync'
        ),
        'SELECT ''idx_tb_diagnostic_document_downsync already exists''',
        'ALTER TABLE db_iemr.tb_diagnostic_document ADD KEY idx_tb_diagnostic_document_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_beneficiarydetails_rmnch'
              AND INDEX_NAME   = 'idx_i_beneficiarydetails_rmnch_downsync'
        ),
        'SELECT ''idx_i_beneficiarydetails_rmnch_downsync already exists''',
        'ALTER TABLE db_identity.i_beneficiarydetails_rmnch ADD KEY idx_i_beneficiarydetails_rmnch_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_bornbirthdeatils'
              AND INDEX_NAME   = 'idx_i_bornbirthdeatils_downsync'
        ),
        'SELECT ''idx_i_bornbirthdeatils_downsync already exists''',
        'ALTER TABLE db_identity.i_bornbirthdeatils ADD KEY idx_i_bornbirthdeatils_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_identity'
              AND TABLE_NAME   = 'i_householddetails'
              AND INDEX_NAME   = 'idx_i_householddetails_downsync'
        ),
        'SELECT ''idx_i_householddetails_downsync already exists''',
        'ALTER TABLE db_identity.i_householddetails ADD KEY idx_i_householddetails_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 'tb_stoptb_visit'
              AND INDEX_NAME   = 'idx_tb_stoptb_visit_downsync'
        ),
        'SELECT ''idx_tb_stoptb_visit_downsync already exists''',
        'ALTER TABLE db_iemr.tb_stoptb_visit ADD KEY idx_tb_stoptb_visit_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_form_response'
              AND INDEX_NAME   = 'idx_t_form_response_downsync'
        ),
        'SELECT ''idx_t_form_response_downsync already exists''',
        'ALTER TABLE db_iemr.t_form_response ADD KEY idx_t_form_response_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_section_response'
              AND INDEX_NAME   = 'idx_t_section_response_downsync'
        ),
        'SELECT ''idx_t_section_response_downsync already exists''',
        'ALTER TABLE db_iemr.t_section_response ADD KEY idx_t_section_response_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (
    SELECT IF(
        EXISTS (
            SELECT 1 FROM information_schema.STATISTICS
            WHERE TABLE_SCHEMA = 'db_iemr'
              AND TABLE_NAME   = 't_question_response'
              AND INDEX_NAME   = 'idx_t_question_response_downsync'
        ),
        'SELECT ''idx_t_question_response_downsync already exists''',
        'ALTER TABLE db_iemr.t_question_response ADD KEY idx_t_question_response_downsync (VanID, DownSynced)'
    )
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

