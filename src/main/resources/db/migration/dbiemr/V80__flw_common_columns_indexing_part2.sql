USE db_iemr;

-- FLW/common column indexes part 2 (online DDL, idempotent)

-- m_smstemplate
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_m_smstemplate_created_by ON m_smstemplate (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_m_smstemplate_CreatedBy ON m_smstemplate (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_m_smstemplate_Created_By ON m_smstemplate (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_m_smstemplate_updated_by ON m_smstemplate (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_m_smstemplate_UpdatedBy ON m_smstemplate (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_m_smstemplate_Updated_By ON m_smstemplate (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_m_smstemplate_ModifiedBy ON m_smstemplate (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_m_smstemplate_Modified_By ON m_smstemplate (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_m_smstemplate_modified_by ON m_smstemplate (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_m_smstemplate_user_id ON m_smstemplate (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_m_smstemplate_userID ON m_smstemplate (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_m_smstemplate_UserID ON m_smstemplate (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_m_smstemplate_UserId ON m_smstemplate (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_m_smstemplate_asha_id ON m_smstemplate (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_m_smstemplate_ASHA_ID ON m_smstemplate (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_m_smstemplate_AshaId ON m_smstemplate (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_m_smstemplate_AshaID ON m_smstemplate (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_m_smstemplate_form_id ON m_smstemplate (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_m_smstemplate_FormId ON m_smstemplate (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_m_smstemplate_formId ON m_smstemplate (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_m_smstemplate_ben_id ON m_smstemplate (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_m_smstemplate_benId ON m_smstemplate (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_m_smstemplate_BenId ON m_smstemplate (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_m_smstemplate_BeneficiaryRegID ON m_smstemplate (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_m_smstemplate_BeneficiaryRegId ON m_smstemplate (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_m_smstemplate_beneficiary_reg_id ON m_smstemplate (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_m_smstemplate_beneficiary_id ON m_smstemplate (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_m_smstemplate_beneficiaryId ON m_smstemplate (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_m_smstemplate_BeneficiaryId ON m_smstemplate (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_smstemplate'
      AND index_name = 'idx_m_smstemplate_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_smstemplate' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_m_smstemplate_CreatedDate ON m_smstemplate (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_smstemplate_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- m_incentive_activity
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_m_incentive_activity_created_by ON m_incentive_activity (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_m_incentive_activity_CreatedBy ON m_incentive_activity (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_m_incentive_activity_Created_By ON m_incentive_activity (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_m_incentive_activity_updated_by ON m_incentive_activity (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_m_incentive_activity_UpdatedBy ON m_incentive_activity (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_m_incentive_activity_Updated_By ON m_incentive_activity (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_m_incentive_activity_ModifiedBy ON m_incentive_activity (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_m_incentive_activity_Modified_By ON m_incentive_activity (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_m_incentive_activity_modified_by ON m_incentive_activity (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_m_incentive_activity_user_id ON m_incentive_activity (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_m_incentive_activity_userID ON m_incentive_activity (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_m_incentive_activity_UserID ON m_incentive_activity (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_m_incentive_activity_UserId ON m_incentive_activity (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_m_incentive_activity_asha_id ON m_incentive_activity (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_m_incentive_activity_ASHA_ID ON m_incentive_activity (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_m_incentive_activity_AshaId ON m_incentive_activity (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_m_incentive_activity_AshaID ON m_incentive_activity (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_m_incentive_activity_form_id ON m_incentive_activity (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_m_incentive_activity_FormId ON m_incentive_activity (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_m_incentive_activity_formId ON m_incentive_activity (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_m_incentive_activity_ben_id ON m_incentive_activity (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_m_incentive_activity_benId ON m_incentive_activity (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_m_incentive_activity_BenId ON m_incentive_activity (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_m_incentive_activity_BeneficiaryRegID ON m_incentive_activity (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_m_incentive_activity_BeneficiaryRegId ON m_incentive_activity (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_m_incentive_activity_beneficiary_reg_id ON m_incentive_activity (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_m_incentive_activity_beneficiary_id ON m_incentive_activity (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_m_incentive_activity_beneficiaryId ON m_incentive_activity (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_m_incentive_activity_BeneficiaryId ON m_incentive_activity (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_incentive_activity'
      AND index_name = 'idx_m_incentive_activity_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_incentive_activity' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_m_incentive_activity_CreatedDate ON m_incentive_activity (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_incentive_activity_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- incentive_activity_record
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_incentive_activity_record_created_by ON incentive_activity_record (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_incentive_activity_record_CreatedBy ON incentive_activity_record (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_incentive_activity_record_Created_By ON incentive_activity_record (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_incentive_activity_record_updated_by ON incentive_activity_record (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_incentive_activity_record_UpdatedBy ON incentive_activity_record (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_incentive_activity_record_Updated_By ON incentive_activity_record (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_incentive_activity_record_ModifiedBy ON incentive_activity_record (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_incentive_activity_record_Modified_By ON incentive_activity_record (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_incentive_activity_record_modified_by ON incentive_activity_record (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_incentive_activity_record_user_id ON incentive_activity_record (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_incentive_activity_record_userID ON incentive_activity_record (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_incentive_activity_record_UserID ON incentive_activity_record (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_incentive_activity_record_UserId ON incentive_activity_record (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_incentive_activity_record_asha_id ON incentive_activity_record (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_incentive_activity_record_ASHA_ID ON incentive_activity_record (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_incentive_activity_record_AshaId ON incentive_activity_record (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_incentive_activity_record_AshaID ON incentive_activity_record (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_incentive_activity_record_form_id ON incentive_activity_record (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_incentive_activity_record_FormId ON incentive_activity_record (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_incentive_activity_record_formId ON incentive_activity_record (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_incentive_activity_record_ben_id ON incentive_activity_record (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_incentive_activity_record_benId ON incentive_activity_record (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_incentive_activity_record_BenId ON incentive_activity_record (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_incentive_activity_record_BeneficiaryRegID ON incentive_activity_record (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_incentive_activity_record_BeneficiaryRegId ON incentive_activity_record (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_incentive_activity_record_beneficiary_reg_id ON incentive_activity_record (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_incentive_activity_record_beneficiary_id ON incentive_activity_record (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_incentive_activity_record_beneficiaryId ON incentive_activity_record (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_incentive_activity_record_BeneficiaryId ON incentive_activity_record (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'incentive_activity_record'
      AND index_name = 'idx_incentive_activity_record_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'incentive_activity_record' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_incentive_activity_record_CreatedDate ON incentive_activity_record (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_incentive_activity_record_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- t_mda_distribution_data
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_created_by ON t_mda_distribution_data (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_CreatedBy ON t_mda_distribution_data (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_Created_By ON t_mda_distribution_data (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_updated_by ON t_mda_distribution_data (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_UpdatedBy ON t_mda_distribution_data (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_Updated_By ON t_mda_distribution_data (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_ModifiedBy ON t_mda_distribution_data (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_Modified_By ON t_mda_distribution_data (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_modified_by ON t_mda_distribution_data (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_user_id ON t_mda_distribution_data (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_userID ON t_mda_distribution_data (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_UserID ON t_mda_distribution_data (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_UserId ON t_mda_distribution_data (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_asha_id ON t_mda_distribution_data (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_ASHA_ID ON t_mda_distribution_data (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_AshaId ON t_mda_distribution_data (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_AshaID ON t_mda_distribution_data (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_form_id ON t_mda_distribution_data (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_FormId ON t_mda_distribution_data (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_formId ON t_mda_distribution_data (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_ben_id ON t_mda_distribution_data (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_benId ON t_mda_distribution_data (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_BenId ON t_mda_distribution_data (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_BeneficiaryRegID ON t_mda_distribution_data (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_BeneficiaryRegId ON t_mda_distribution_data (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_beneficiary_reg_id ON t_mda_distribution_data (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_beneficiary_id ON t_mda_distribution_data (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_beneficiaryId ON t_mda_distribution_data (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_BeneficiaryId ON t_mda_distribution_data (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mda_distribution_data'
      AND index_name = 'idx_t_mda_distribution_data_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mda_distribution_data' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_mda_distribution_data_CreatedDate ON t_mda_distribution_data (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mda_distribution_data_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- i_ben_flow_outreach
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_created_by ON i_ben_flow_outreach (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_CreatedBy ON i_ben_flow_outreach (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_Created_By ON i_ben_flow_outreach (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_updated_by ON i_ben_flow_outreach (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_UpdatedBy ON i_ben_flow_outreach (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_Updated_By ON i_ben_flow_outreach (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_ModifiedBy ON i_ben_flow_outreach (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_Modified_By ON i_ben_flow_outreach (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_modified_by ON i_ben_flow_outreach (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_user_id ON i_ben_flow_outreach (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_userID ON i_ben_flow_outreach (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_UserID ON i_ben_flow_outreach (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_UserId ON i_ben_flow_outreach (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_asha_id ON i_ben_flow_outreach (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_ASHA_ID ON i_ben_flow_outreach (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_AshaId ON i_ben_flow_outreach (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_AshaID ON i_ben_flow_outreach (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_form_id ON i_ben_flow_outreach (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_FormId ON i_ben_flow_outreach (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_formId ON i_ben_flow_outreach (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_ben_id ON i_ben_flow_outreach (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_benId ON i_ben_flow_outreach (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_BenId ON i_ben_flow_outreach (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_BeneficiaryRegID ON i_ben_flow_outreach (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_BeneficiaryRegId ON i_ben_flow_outreach (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_beneficiary_reg_id ON i_ben_flow_outreach (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_beneficiary_id ON i_ben_flow_outreach (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_beneficiaryId ON i_ben_flow_outreach (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_BeneficiaryId ON i_ben_flow_outreach (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'i_ben_flow_outreach'
      AND index_name = 'idx_i_ben_flow_outreach_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'i_ben_flow_outreach' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_i_ben_flow_outreach_CreatedDate ON i_ben_flow_outreach (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_i_ben_flow_outreach_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- screening_malaria
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_screening_malaria_created_by ON screening_malaria (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_screening_malaria_CreatedBy ON screening_malaria (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_screening_malaria_Created_By ON screening_malaria (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_screening_malaria_updated_by ON screening_malaria (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_screening_malaria_UpdatedBy ON screening_malaria (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_screening_malaria_Updated_By ON screening_malaria (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_screening_malaria_ModifiedBy ON screening_malaria (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_screening_malaria_Modified_By ON screening_malaria (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_screening_malaria_modified_by ON screening_malaria (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_screening_malaria_user_id ON screening_malaria (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_screening_malaria_userID ON screening_malaria (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_screening_malaria_UserID ON screening_malaria (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_screening_malaria_UserId ON screening_malaria (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_screening_malaria_asha_id ON screening_malaria (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_screening_malaria_ASHA_ID ON screening_malaria (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_screening_malaria_AshaId ON screening_malaria (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_screening_malaria_AshaID ON screening_malaria (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_screening_malaria_form_id ON screening_malaria (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_screening_malaria_FormId ON screening_malaria (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_screening_malaria_formId ON screening_malaria (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_screening_malaria_ben_id ON screening_malaria (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_screening_malaria_benId ON screening_malaria (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_screening_malaria_BenId ON screening_malaria (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_screening_malaria_BeneficiaryRegID ON screening_malaria (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_screening_malaria_BeneficiaryRegId ON screening_malaria (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_screening_malaria_beneficiary_reg_id ON screening_malaria (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_screening_malaria_beneficiary_id ON screening_malaria (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_screening_malaria_beneficiaryId ON screening_malaria (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_screening_malaria_BeneficiaryId ON screening_malaria (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_malaria'
      AND index_name = 'idx_screening_malaria_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_malaria' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_screening_malaria_CreatedDate ON screening_malaria (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_malaria_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- screening_leprosy
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_screening_leprosy_created_by ON screening_leprosy (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_screening_leprosy_CreatedBy ON screening_leprosy (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_screening_leprosy_Created_By ON screening_leprosy (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_screening_leprosy_updated_by ON screening_leprosy (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_screening_leprosy_UpdatedBy ON screening_leprosy (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_screening_leprosy_Updated_By ON screening_leprosy (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_screening_leprosy_ModifiedBy ON screening_leprosy (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_screening_leprosy_Modified_By ON screening_leprosy (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_screening_leprosy_modified_by ON screening_leprosy (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_screening_leprosy_user_id ON screening_leprosy (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_screening_leprosy_userID ON screening_leprosy (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_screening_leprosy_UserID ON screening_leprosy (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_screening_leprosy_UserId ON screening_leprosy (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_screening_leprosy_asha_id ON screening_leprosy (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_screening_leprosy_ASHA_ID ON screening_leprosy (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_screening_leprosy_AshaId ON screening_leprosy (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_screening_leprosy_AshaID ON screening_leprosy (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_screening_leprosy_form_id ON screening_leprosy (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_screening_leprosy_FormId ON screening_leprosy (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_screening_leprosy_formId ON screening_leprosy (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_screening_leprosy_ben_id ON screening_leprosy (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_screening_leprosy_benId ON screening_leprosy (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_screening_leprosy_BenId ON screening_leprosy (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_screening_leprosy_BeneficiaryRegID ON screening_leprosy (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_screening_leprosy_BeneficiaryRegId ON screening_leprosy (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_screening_leprosy_beneficiary_reg_id ON screening_leprosy (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_screening_leprosy_beneficiary_id ON screening_leprosy (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_screening_leprosy_beneficiaryId ON screening_leprosy (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_screening_leprosy_BeneficiaryId ON screening_leprosy (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_leprosy'
      AND index_name = 'idx_screening_leprosy_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_leprosy' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_screening_leprosy_CreatedDate ON screening_leprosy (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_leprosy_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- screening_kala_azar
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_screening_kala_azar_created_by ON screening_kala_azar (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_screening_kala_azar_CreatedBy ON screening_kala_azar (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_screening_kala_azar_Created_By ON screening_kala_azar (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_screening_kala_azar_updated_by ON screening_kala_azar (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_screening_kala_azar_UpdatedBy ON screening_kala_azar (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_screening_kala_azar_Updated_By ON screening_kala_azar (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_screening_kala_azar_ModifiedBy ON screening_kala_azar (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_screening_kala_azar_Modified_By ON screening_kala_azar (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_screening_kala_azar_modified_by ON screening_kala_azar (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_screening_kala_azar_user_id ON screening_kala_azar (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_screening_kala_azar_userID ON screening_kala_azar (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_screening_kala_azar_UserID ON screening_kala_azar (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_screening_kala_azar_UserId ON screening_kala_azar (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_screening_kala_azar_asha_id ON screening_kala_azar (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_screening_kala_azar_ASHA_ID ON screening_kala_azar (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_screening_kala_azar_AshaId ON screening_kala_azar (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_screening_kala_azar_AshaID ON screening_kala_azar (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_screening_kala_azar_form_id ON screening_kala_azar (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_screening_kala_azar_FormId ON screening_kala_azar (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_screening_kala_azar_formId ON screening_kala_azar (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_screening_kala_azar_ben_id ON screening_kala_azar (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_screening_kala_azar_benId ON screening_kala_azar (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_screening_kala_azar_BenId ON screening_kala_azar (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_screening_kala_azar_BeneficiaryRegID ON screening_kala_azar (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_screening_kala_azar_BeneficiaryRegId ON screening_kala_azar (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_screening_kala_azar_beneficiary_reg_id ON screening_kala_azar (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_screening_kala_azar_beneficiary_id ON screening_kala_azar (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_screening_kala_azar_beneficiaryId ON screening_kala_azar (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_screening_kala_azar_BeneficiaryId ON screening_kala_azar (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_kala_azar'
      AND index_name = 'idx_screening_kala_azar_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_kala_azar' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_screening_kala_azar_CreatedDate ON screening_kala_azar (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_kala_azar_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- screening_filaria
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_screening_filaria_created_by ON screening_filaria (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_screening_filaria_CreatedBy ON screening_filaria (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_screening_filaria_Created_By ON screening_filaria (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_screening_filaria_updated_by ON screening_filaria (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_screening_filaria_UpdatedBy ON screening_filaria (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_screening_filaria_Updated_By ON screening_filaria (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_screening_filaria_ModifiedBy ON screening_filaria (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_screening_filaria_Modified_By ON screening_filaria (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_screening_filaria_modified_by ON screening_filaria (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_screening_filaria_user_id ON screening_filaria (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_screening_filaria_userID ON screening_filaria (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_screening_filaria_UserID ON screening_filaria (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_screening_filaria_UserId ON screening_filaria (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_screening_filaria_asha_id ON screening_filaria (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_screening_filaria_ASHA_ID ON screening_filaria (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_screening_filaria_AshaId ON screening_filaria (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_screening_filaria_AshaID ON screening_filaria (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_screening_filaria_form_id ON screening_filaria (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_screening_filaria_FormId ON screening_filaria (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_screening_filaria_formId ON screening_filaria (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_screening_filaria_ben_id ON screening_filaria (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_screening_filaria_benId ON screening_filaria (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_screening_filaria_BenId ON screening_filaria (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_screening_filaria_BeneficiaryRegID ON screening_filaria (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_screening_filaria_BeneficiaryRegId ON screening_filaria (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_screening_filaria_beneficiary_reg_id ON screening_filaria (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_screening_filaria_beneficiary_id ON screening_filaria (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_screening_filaria_beneficiaryId ON screening_filaria (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_screening_filaria_BeneficiaryId ON screening_filaria (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_filaria'
      AND index_name = 'idx_screening_filaria_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_filaria' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_screening_filaria_CreatedDate ON screening_filaria (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_filaria_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- screening_aesje
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_screening_aesje_created_by ON screening_aesje (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_screening_aesje_CreatedBy ON screening_aesje (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_screening_aesje_Created_By ON screening_aesje (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_screening_aesje_updated_by ON screening_aesje (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_screening_aesje_UpdatedBy ON screening_aesje (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_screening_aesje_Updated_By ON screening_aesje (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_screening_aesje_ModifiedBy ON screening_aesje (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_screening_aesje_Modified_By ON screening_aesje (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_screening_aesje_modified_by ON screening_aesje (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_screening_aesje_user_id ON screening_aesje (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_screening_aesje_userID ON screening_aesje (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_screening_aesje_UserID ON screening_aesje (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_screening_aesje_UserId ON screening_aesje (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_screening_aesje_asha_id ON screening_aesje (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_screening_aesje_ASHA_ID ON screening_aesje (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_screening_aesje_AshaId ON screening_aesje (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_screening_aesje_AshaID ON screening_aesje (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_screening_aesje_form_id ON screening_aesje (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_screening_aesje_FormId ON screening_aesje (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_screening_aesje_formId ON screening_aesje (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_screening_aesje_ben_id ON screening_aesje (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_screening_aesje_benId ON screening_aesje (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_screening_aesje_BenId ON screening_aesje (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_screening_aesje_BeneficiaryRegID ON screening_aesje (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_screening_aesje_BeneficiaryRegId ON screening_aesje (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_screening_aesje_beneficiary_reg_id ON screening_aesje (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_screening_aesje_beneficiary_id ON screening_aesje (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_screening_aesje_beneficiaryId ON screening_aesje (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_screening_aesje_BeneficiaryId ON screening_aesje (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'screening_aesje'
      AND index_name = 'idx_screening_aesje_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'screening_aesje' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_screening_aesje_CreatedDate ON screening_aesje (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_screening_aesje_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- tb_screening
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_tb_screening_created_by ON tb_screening (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_tb_screening_CreatedBy ON tb_screening (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_tb_screening_Created_By ON tb_screening (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_tb_screening_updated_by ON tb_screening (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_tb_screening_UpdatedBy ON tb_screening (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_tb_screening_Updated_By ON tb_screening (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_tb_screening_ModifiedBy ON tb_screening (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_tb_screening_Modified_By ON tb_screening (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_tb_screening_modified_by ON tb_screening (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_tb_screening_user_id ON tb_screening (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_tb_screening_userID ON tb_screening (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_tb_screening_UserID ON tb_screening (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_tb_screening_UserId ON tb_screening (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_tb_screening_asha_id ON tb_screening (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_tb_screening_ASHA_ID ON tb_screening (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_tb_screening_AshaId ON tb_screening (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_tb_screening_AshaID ON tb_screening (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_tb_screening_form_id ON tb_screening (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_tb_screening_FormId ON tb_screening (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_tb_screening_formId ON tb_screening (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_tb_screening_ben_id ON tb_screening (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_tb_screening_benId ON tb_screening (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_tb_screening_BenId ON tb_screening (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_tb_screening_BeneficiaryRegID ON tb_screening (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_tb_screening_BeneficiaryRegId ON tb_screening (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_tb_screening_beneficiary_reg_id ON tb_screening (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_tb_screening_beneficiary_id ON tb_screening (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_tb_screening_beneficiaryId ON tb_screening (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_tb_screening_BeneficiaryId ON tb_screening (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND index_name = 'idx_tb_screening_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_screening' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_tb_screening_CreatedDate ON tb_screening (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_screening_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- tb_stoptb_registration
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_created_by ON tb_stoptb_registration (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_CreatedBy ON tb_stoptb_registration (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_Created_By ON tb_stoptb_registration (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_updated_by ON tb_stoptb_registration (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_UpdatedBy ON tb_stoptb_registration (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_Updated_By ON tb_stoptb_registration (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_ModifiedBy ON tb_stoptb_registration (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_Modified_By ON tb_stoptb_registration (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_modified_by ON tb_stoptb_registration (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_user_id ON tb_stoptb_registration (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_userID ON tb_stoptb_registration (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_UserID ON tb_stoptb_registration (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_UserId ON tb_stoptb_registration (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_asha_id ON tb_stoptb_registration (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_ASHA_ID ON tb_stoptb_registration (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_AshaId ON tb_stoptb_registration (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_AshaID ON tb_stoptb_registration (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_form_id ON tb_stoptb_registration (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_FormId ON tb_stoptb_registration (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_formId ON tb_stoptb_registration (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_ben_id ON tb_stoptb_registration (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_benId ON tb_stoptb_registration (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_BenId ON tb_stoptb_registration (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_BeneficiaryRegID ON tb_stoptb_registration (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_BeneficiaryRegId ON tb_stoptb_registration (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_beneficiary_reg_id ON tb_stoptb_registration (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_beneficiary_id ON tb_stoptb_registration (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_beneficiaryId ON tb_stoptb_registration (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_BeneficiaryId ON tb_stoptb_registration (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_registration'
      AND index_name = 'idx_tb_stoptb_registration_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_registration' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_tb_stoptb_registration_CreatedDate ON tb_stoptb_registration (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_registration_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- tb_stoptb_general_opd
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_created_by ON tb_stoptb_general_opd (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_CreatedBy ON tb_stoptb_general_opd (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_Created_By ON tb_stoptb_general_opd (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_updated_by ON tb_stoptb_general_opd (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_UpdatedBy ON tb_stoptb_general_opd (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_Updated_By ON tb_stoptb_general_opd (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_ModifiedBy ON tb_stoptb_general_opd (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_Modified_By ON tb_stoptb_general_opd (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_modified_by ON tb_stoptb_general_opd (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_user_id ON tb_stoptb_general_opd (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_userID ON tb_stoptb_general_opd (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_UserID ON tb_stoptb_general_opd (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_UserId ON tb_stoptb_general_opd (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_asha_id ON tb_stoptb_general_opd (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_ASHA_ID ON tb_stoptb_general_opd (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_AshaId ON tb_stoptb_general_opd (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_AshaID ON tb_stoptb_general_opd (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_form_id ON tb_stoptb_general_opd (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_FormId ON tb_stoptb_general_opd (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_formId ON tb_stoptb_general_opd (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_ben_id ON tb_stoptb_general_opd (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_benId ON tb_stoptb_general_opd (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_BenId ON tb_stoptb_general_opd (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_BeneficiaryRegID ON tb_stoptb_general_opd (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_BeneficiaryRegId ON tb_stoptb_general_opd (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_beneficiary_reg_id ON tb_stoptb_general_opd (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_beneficiary_id ON tb_stoptb_general_opd (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_beneficiaryId ON tb_stoptb_general_opd (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_BeneficiaryId ON tb_stoptb_general_opd (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_opd'
      AND index_name = 'idx_tb_stoptb_general_opd_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_opd' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_tb_stoptb_general_opd_CreatedDate ON tb_stoptb_general_opd (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_opd_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- tb_stoptb_general_examination
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_created_by ON tb_stoptb_general_examination (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_CreatedBy ON tb_stoptb_general_examination (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_Created_By ON tb_stoptb_general_examination (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_updated_by ON tb_stoptb_general_examination (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_UpdatedBy ON tb_stoptb_general_examination (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_Updated_By ON tb_stoptb_general_examination (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_ModifiedBy ON tb_stoptb_general_examination (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_Modified_By ON tb_stoptb_general_examination (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_modified_by ON tb_stoptb_general_examination (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_user_id ON tb_stoptb_general_examination (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_userID ON tb_stoptb_general_examination (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_UserID ON tb_stoptb_general_examination (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_UserId ON tb_stoptb_general_examination (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_asha_id ON tb_stoptb_general_examination (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_ASHA_ID ON tb_stoptb_general_examination (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_AshaId ON tb_stoptb_general_examination (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_AshaID ON tb_stoptb_general_examination (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_form_id ON tb_stoptb_general_examination (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_FormId ON tb_stoptb_general_examination (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_formId ON tb_stoptb_general_examination (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_ben_id ON tb_stoptb_general_examination (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_benId ON tb_stoptb_general_examination (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_BenId ON tb_stoptb_general_examination (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_BeneficiaryRegID ON tb_stoptb_general_examination (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_BeneficiaryRegId ON tb_stoptb_general_examination (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_beneficiary_reg_id ON tb_stoptb_general_examination (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_beneficiary_id ON tb_stoptb_general_examination (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_beneficiaryId ON tb_stoptb_general_examination (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_BeneficiaryId ON tb_stoptb_general_examination (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_general_examination'
      AND index_name = 'idx_tb_stoptb_general_examination_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_tb_stoptb_general_examination_CreatedDate ON tb_stoptb_general_examination (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_general_examination_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- tb_stoptb_diagnostics
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_created_by ON tb_stoptb_diagnostics (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_CreatedBy ON tb_stoptb_diagnostics (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_Created_By ON tb_stoptb_diagnostics (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_updated_by ON tb_stoptb_diagnostics (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_UpdatedBy ON tb_stoptb_diagnostics (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_Updated_By ON tb_stoptb_diagnostics (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_ModifiedBy ON tb_stoptb_diagnostics (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_Modified_By ON tb_stoptb_diagnostics (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_modified_by ON tb_stoptb_diagnostics (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_user_id ON tb_stoptb_diagnostics (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_userID ON tb_stoptb_diagnostics (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_UserID ON tb_stoptb_diagnostics (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_UserId ON tb_stoptb_diagnostics (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_asha_id ON tb_stoptb_diagnostics (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_ASHA_ID ON tb_stoptb_diagnostics (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_AshaId ON tb_stoptb_diagnostics (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_AshaID ON tb_stoptb_diagnostics (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_form_id ON tb_stoptb_diagnostics (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_FormId ON tb_stoptb_diagnostics (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_formId ON tb_stoptb_diagnostics (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_ben_id ON tb_stoptb_diagnostics (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_benId ON tb_stoptb_diagnostics (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_BenId ON tb_stoptb_diagnostics (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_BeneficiaryRegID ON tb_stoptb_diagnostics (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_BeneficiaryRegId ON tb_stoptb_diagnostics (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_beneficiary_reg_id ON tb_stoptb_diagnostics (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_beneficiary_id ON tb_stoptb_diagnostics (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_beneficiaryId ON tb_stoptb_diagnostics (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_BeneficiaryId ON tb_stoptb_diagnostics (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_stoptb_diagnostics'
      AND index_name = 'idx_tb_stoptb_diagnostics_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_diagnostics' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_tb_stoptb_diagnostics_CreatedDate ON tb_stoptb_diagnostics (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_tb_stoptb_diagnostics_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- leprosy_follow_up
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_leprosy_follow_up_created_by ON leprosy_follow_up (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_leprosy_follow_up_CreatedBy ON leprosy_follow_up (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_leprosy_follow_up_Created_By ON leprosy_follow_up (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_leprosy_follow_up_updated_by ON leprosy_follow_up (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_leprosy_follow_up_UpdatedBy ON leprosy_follow_up (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_leprosy_follow_up_Updated_By ON leprosy_follow_up (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_leprosy_follow_up_ModifiedBy ON leprosy_follow_up (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_leprosy_follow_up_Modified_By ON leprosy_follow_up (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_leprosy_follow_up_modified_by ON leprosy_follow_up (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_leprosy_follow_up_user_id ON leprosy_follow_up (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_leprosy_follow_up_userID ON leprosy_follow_up (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_leprosy_follow_up_UserID ON leprosy_follow_up (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_UserId ON leprosy_follow_up (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_leprosy_follow_up_asha_id ON leprosy_follow_up (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_leprosy_follow_up_ASHA_ID ON leprosy_follow_up (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_AshaId ON leprosy_follow_up (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_leprosy_follow_up_AshaID ON leprosy_follow_up (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_leprosy_follow_up_form_id ON leprosy_follow_up (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_FormId ON leprosy_follow_up (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_formId ON leprosy_follow_up (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_leprosy_follow_up_ben_id ON leprosy_follow_up (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_benId ON leprosy_follow_up (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_BenId ON leprosy_follow_up (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_leprosy_follow_up_BeneficiaryRegID ON leprosy_follow_up (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_BeneficiaryRegId ON leprosy_follow_up (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_leprosy_follow_up_beneficiary_reg_id ON leprosy_follow_up (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_leprosy_follow_up_beneficiary_id ON leprosy_follow_up (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_beneficiaryId ON leprosy_follow_up (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_leprosy_follow_up_BeneficiaryId ON leprosy_follow_up (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'leprosy_follow_up'
      AND index_name = 'idx_leprosy_follow_up_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'leprosy_follow_up' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_leprosy_follow_up_CreatedDate ON leprosy_follow_up (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_leprosy_follow_up_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- asha_profile
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_asha_profile_created_by ON asha_profile (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_asha_profile_CreatedBy ON asha_profile (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_asha_profile_Created_By ON asha_profile (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_asha_profile_updated_by ON asha_profile (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_asha_profile_UpdatedBy ON asha_profile (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_asha_profile_Updated_By ON asha_profile (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_asha_profile_ModifiedBy ON asha_profile (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_asha_profile_Modified_By ON asha_profile (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_asha_profile_modified_by ON asha_profile (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_asha_profile_user_id ON asha_profile (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_asha_profile_userID ON asha_profile (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_asha_profile_UserID ON asha_profile (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_asha_profile_UserId ON asha_profile (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_asha_profile_asha_id ON asha_profile (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_asha_profile_ASHA_ID ON asha_profile (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_asha_profile_AshaId ON asha_profile (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_asha_profile_AshaID ON asha_profile (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_asha_profile_form_id ON asha_profile (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_asha_profile_FormId ON asha_profile (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_asha_profile_formId ON asha_profile (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_asha_profile_ben_id ON asha_profile (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_asha_profile_benId ON asha_profile (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_asha_profile_BenId ON asha_profile (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_asha_profile_BeneficiaryRegID ON asha_profile (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_asha_profile_BeneficiaryRegId ON asha_profile (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_asha_profile_beneficiary_reg_id ON asha_profile (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_asha_profile_beneficiary_id ON asha_profile (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_asha_profile_beneficiaryId ON asha_profile (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_asha_profile_BeneficiaryId ON asha_profile (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'asha_profile'
      AND index_name = 'idx_asha_profile_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'asha_profile' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_asha_profile_CreatedDate ON asha_profile (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_asha_profile_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


