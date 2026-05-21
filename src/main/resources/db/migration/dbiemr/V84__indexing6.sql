USE db_iemr;

-- FLW/common column indexes indexing6 (online DDL, idempotent)


-- campaign_ors
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_campaign_ors_created_by ON campaign_ors (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_campaign_ors_CreatedBy ON campaign_ors (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_campaign_ors_Created_By ON campaign_ors (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_campaign_ors_updated_by ON campaign_ors (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_campaign_ors_UpdatedBy ON campaign_ors (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_campaign_ors_Updated_By ON campaign_ors (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_campaign_ors_ModifiedBy ON campaign_ors (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_campaign_ors_Modified_By ON campaign_ors (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_campaign_ors_modified_by ON campaign_ors (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_campaign_ors_user_id ON campaign_ors (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_campaign_ors_userID ON campaign_ors (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_campaign_ors_UserID ON campaign_ors (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_campaign_ors_UserId ON campaign_ors (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_campaign_ors_asha_id ON campaign_ors (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_campaign_ors_ASHA_ID ON campaign_ors (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_campaign_ors_AshaId ON campaign_ors (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_campaign_ors_AshaID ON campaign_ors (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_campaign_ors_form_id ON campaign_ors (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_campaign_ors_FormId ON campaign_ors (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_campaign_ors_formId ON campaign_ors (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_campaign_ors_ben_id ON campaign_ors (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_campaign_ors_benId ON campaign_ors (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_campaign_ors_BenId ON campaign_ors (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_campaign_ors_BeneficiaryRegID ON campaign_ors (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_campaign_ors_BeneficiaryRegId ON campaign_ors (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_campaign_ors_beneficiary_reg_id ON campaign_ors (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_campaign_ors_beneficiary_id ON campaign_ors (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_campaign_ors_beneficiaryId ON campaign_ors (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_campaign_ors_BeneficiaryId ON campaign_ors (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_ors'
      AND index_name = 'idx_campaign_ors_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_ors' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_campaign_ors_CreatedDate ON campaign_ors (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_ors_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- campaign_pulse_polio
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_created_by ON campaign_pulse_polio (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_CreatedBy ON campaign_pulse_polio (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_Created_By ON campaign_pulse_polio (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_updated_by ON campaign_pulse_polio (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_UpdatedBy ON campaign_pulse_polio (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_Updated_By ON campaign_pulse_polio (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_ModifiedBy ON campaign_pulse_polio (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_Modified_By ON campaign_pulse_polio (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_modified_by ON campaign_pulse_polio (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_user_id ON campaign_pulse_polio (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_userID ON campaign_pulse_polio (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_UserID ON campaign_pulse_polio (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_UserId ON campaign_pulse_polio (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_asha_id ON campaign_pulse_polio (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_ASHA_ID ON campaign_pulse_polio (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_AshaId ON campaign_pulse_polio (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_AshaID ON campaign_pulse_polio (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_form_id ON campaign_pulse_polio (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_FormId ON campaign_pulse_polio (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_formId ON campaign_pulse_polio (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_ben_id ON campaign_pulse_polio (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_benId ON campaign_pulse_polio (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_BenId ON campaign_pulse_polio (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_BeneficiaryRegID ON campaign_pulse_polio (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_BeneficiaryRegId ON campaign_pulse_polio (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_beneficiary_reg_id ON campaign_pulse_polio (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_beneficiary_id ON campaign_pulse_polio (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_beneficiaryId ON campaign_pulse_polio (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_BeneficiaryId ON campaign_pulse_polio (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_pulse_polio'
      AND index_name = 'idx_campaign_pulse_polio_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_pulse_polio' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_campaign_pulse_polio_CreatedDate ON campaign_pulse_polio (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_pulse_polio_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- campaign_filariasis_mda
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_created_by ON campaign_filariasis_mda (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_CreatedBy ON campaign_filariasis_mda (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_Created_By ON campaign_filariasis_mda (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_updated_by ON campaign_filariasis_mda (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_UpdatedBy ON campaign_filariasis_mda (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_Updated_By ON campaign_filariasis_mda (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_ModifiedBy ON campaign_filariasis_mda (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_Modified_By ON campaign_filariasis_mda (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_modified_by ON campaign_filariasis_mda (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_user_id ON campaign_filariasis_mda (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_userID ON campaign_filariasis_mda (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_UserID ON campaign_filariasis_mda (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_UserId ON campaign_filariasis_mda (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_asha_id ON campaign_filariasis_mda (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_ASHA_ID ON campaign_filariasis_mda (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_AshaId ON campaign_filariasis_mda (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_AshaID ON campaign_filariasis_mda (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_form_id ON campaign_filariasis_mda (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_FormId ON campaign_filariasis_mda (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_formId ON campaign_filariasis_mda (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_ben_id ON campaign_filariasis_mda (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_benId ON campaign_filariasis_mda (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_BenId ON campaign_filariasis_mda (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_BeneficiaryRegID ON campaign_filariasis_mda (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_BeneficiaryRegId ON campaign_filariasis_mda (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_beneficiary_reg_id ON campaign_filariasis_mda (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_beneficiary_id ON campaign_filariasis_mda (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_beneficiaryId ON campaign_filariasis_mda (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_BeneficiaryId ON campaign_filariasis_mda (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'campaign_filariasis_mda'
      AND index_name = 'idx_campaign_filariasis_mda_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'campaign_filariasis_mda' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_campaign_filariasis_mda_CreatedDate ON campaign_filariasis_mda (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_campaign_filariasis_mda_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- cdtf_visit_details
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_cdtf_visit_details_created_by ON cdtf_visit_details (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_cdtf_visit_details_CreatedBy ON cdtf_visit_details (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_cdtf_visit_details_Created_By ON cdtf_visit_details (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_cdtf_visit_details_updated_by ON cdtf_visit_details (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_cdtf_visit_details_UpdatedBy ON cdtf_visit_details (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_cdtf_visit_details_Updated_By ON cdtf_visit_details (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_cdtf_visit_details_ModifiedBy ON cdtf_visit_details (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_cdtf_visit_details_Modified_By ON cdtf_visit_details (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_cdtf_visit_details_modified_by ON cdtf_visit_details (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_cdtf_visit_details_user_id ON cdtf_visit_details (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_cdtf_visit_details_userID ON cdtf_visit_details (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_cdtf_visit_details_UserID ON cdtf_visit_details (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_UserId ON cdtf_visit_details (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_cdtf_visit_details_asha_id ON cdtf_visit_details (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_cdtf_visit_details_ASHA_ID ON cdtf_visit_details (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_AshaId ON cdtf_visit_details (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_cdtf_visit_details_AshaID ON cdtf_visit_details (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_cdtf_visit_details_form_id ON cdtf_visit_details (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_FormId ON cdtf_visit_details (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_formId ON cdtf_visit_details (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_cdtf_visit_details_ben_id ON cdtf_visit_details (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_benId ON cdtf_visit_details (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_BenId ON cdtf_visit_details (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_cdtf_visit_details_BeneficiaryRegID ON cdtf_visit_details (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_BeneficiaryRegId ON cdtf_visit_details (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_cdtf_visit_details_beneficiary_reg_id ON cdtf_visit_details (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_cdtf_visit_details_beneficiary_id ON cdtf_visit_details (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_beneficiaryId ON cdtf_visit_details (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_cdtf_visit_details_BeneficiaryId ON cdtf_visit_details (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'cdtf_visit_details'
      AND index_name = 'idx_cdtf_visit_details_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'cdtf_visit_details' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_cdtf_visit_details_CreatedDate ON cdtf_visit_details (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_cdtf_visit_details_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;





