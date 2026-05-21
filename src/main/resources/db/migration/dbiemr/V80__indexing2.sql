USE db_iemr;

-- FLW/common column indexes indexing2 (online DDL, idempotent)

-- high_risk_assess
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_high_risk_assess_created_by ON high_risk_assess (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_high_risk_assess_CreatedBy ON high_risk_assess (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_high_risk_assess_Created_By ON high_risk_assess (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_high_risk_assess_updated_by ON high_risk_assess (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_high_risk_assess_UpdatedBy ON high_risk_assess (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_high_risk_assess_Updated_By ON high_risk_assess (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_high_risk_assess_ModifiedBy ON high_risk_assess (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_high_risk_assess_Modified_By ON high_risk_assess (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_high_risk_assess_modified_by ON high_risk_assess (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_high_risk_assess_user_id ON high_risk_assess (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_high_risk_assess_userID ON high_risk_assess (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_high_risk_assess_UserID ON high_risk_assess (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_high_risk_assess_UserId ON high_risk_assess (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_high_risk_assess_asha_id ON high_risk_assess (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_high_risk_assess_ASHA_ID ON high_risk_assess (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_high_risk_assess_AshaId ON high_risk_assess (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_high_risk_assess_AshaID ON high_risk_assess (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_high_risk_assess_form_id ON high_risk_assess (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_high_risk_assess_FormId ON high_risk_assess (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_high_risk_assess_formId ON high_risk_assess (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_high_risk_assess_ben_id ON high_risk_assess (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_high_risk_assess_benId ON high_risk_assess (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_high_risk_assess_BenId ON high_risk_assess (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_high_risk_assess_BeneficiaryRegID ON high_risk_assess (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_high_risk_assess_BeneficiaryRegId ON high_risk_assess (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_high_risk_assess_beneficiary_reg_id ON high_risk_assess (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_high_risk_assess_beneficiary_id ON high_risk_assess (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_high_risk_assess_beneficiaryId ON high_risk_assess (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_high_risk_assess_BeneficiaryId ON high_risk_assess (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'high_risk_assess'
      AND index_name = 'idx_high_risk_assess_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'high_risk_assess' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_high_risk_assess_CreatedDate ON high_risk_assess (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_high_risk_assess_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_cdr
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_cdr_created_by ON t_cdr (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_cdr_CreatedBy ON t_cdr (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_cdr_Created_By ON t_cdr (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_cdr_updated_by ON t_cdr (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_cdr_UpdatedBy ON t_cdr (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_cdr_Updated_By ON t_cdr (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_cdr_ModifiedBy ON t_cdr (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_cdr_Modified_By ON t_cdr (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_cdr_modified_by ON t_cdr (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_cdr_user_id ON t_cdr (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_cdr_userID ON t_cdr (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_cdr_UserID ON t_cdr (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_cdr_UserId ON t_cdr (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_cdr_asha_id ON t_cdr (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_cdr_ASHA_ID ON t_cdr (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_cdr_AshaId ON t_cdr (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_cdr_AshaID ON t_cdr (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_cdr_form_id ON t_cdr (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_cdr_FormId ON t_cdr (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_cdr_formId ON t_cdr (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_cdr_ben_id ON t_cdr (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_cdr_benId ON t_cdr (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_cdr_BenId ON t_cdr (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_cdr_BeneficiaryRegID ON t_cdr (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_cdr_BeneficiaryRegId ON t_cdr (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_cdr_beneficiary_reg_id ON t_cdr (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_cdr_beneficiary_id ON t_cdr (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_cdr_beneficiaryId ON t_cdr (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_cdr_BeneficiaryId ON t_cdr (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cdr'
      AND index_name = 'idx_t_cdr_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cdr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cdr' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_cdr_CreatedDate ON t_cdr (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cdr_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_mdsr
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_mdsr_created_by ON t_mdsr (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_mdsr_CreatedBy ON t_mdsr (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_mdsr_Created_By ON t_mdsr (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_mdsr_updated_by ON t_mdsr (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_mdsr_UpdatedBy ON t_mdsr (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_mdsr_Updated_By ON t_mdsr (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_mdsr_ModifiedBy ON t_mdsr (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_mdsr_Modified_By ON t_mdsr (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_mdsr_modified_by ON t_mdsr (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_mdsr_user_id ON t_mdsr (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_mdsr_userID ON t_mdsr (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_mdsr_UserID ON t_mdsr (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_mdsr_UserId ON t_mdsr (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_mdsr_asha_id ON t_mdsr (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_mdsr_ASHA_ID ON t_mdsr (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_mdsr_AshaId ON t_mdsr (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_mdsr_AshaID ON t_mdsr (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_mdsr_form_id ON t_mdsr (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_mdsr_FormId ON t_mdsr (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_mdsr_formId ON t_mdsr (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_mdsr_ben_id ON t_mdsr (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_mdsr_benId ON t_mdsr (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_mdsr_BenId ON t_mdsr (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_mdsr_BeneficiaryRegID ON t_mdsr (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_mdsr_BeneficiaryRegId ON t_mdsr (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_mdsr_beneficiary_reg_id ON t_mdsr (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_mdsr_beneficiary_id ON t_mdsr (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_mdsr_beneficiaryId ON t_mdsr (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_mdsr_BeneficiaryId ON t_mdsr (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_mdsr'
      AND index_name = 'idx_t_mdsr_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_mdsr' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_mdsr_CreatedDate ON t_mdsr (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_mdsr_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_benreferdetails
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_benreferdetails_created_by ON t_benreferdetails (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_benreferdetails_CreatedBy ON t_benreferdetails (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_benreferdetails_Created_By ON t_benreferdetails (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_benreferdetails_updated_by ON t_benreferdetails (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_benreferdetails_UpdatedBy ON t_benreferdetails (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_benreferdetails_Updated_By ON t_benreferdetails (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_benreferdetails_ModifiedBy ON t_benreferdetails (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_benreferdetails_Modified_By ON t_benreferdetails (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_benreferdetails_modified_by ON t_benreferdetails (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_benreferdetails_user_id ON t_benreferdetails (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_benreferdetails_userID ON t_benreferdetails (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_benreferdetails_UserID ON t_benreferdetails (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_benreferdetails_UserId ON t_benreferdetails (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_benreferdetails_asha_id ON t_benreferdetails (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_benreferdetails_ASHA_ID ON t_benreferdetails (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_benreferdetails_AshaId ON t_benreferdetails (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_benreferdetails_AshaID ON t_benreferdetails (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_benreferdetails_form_id ON t_benreferdetails (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_benreferdetails_FormId ON t_benreferdetails (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_benreferdetails_formId ON t_benreferdetails (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_benreferdetails_ben_id ON t_benreferdetails (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_benreferdetails_benId ON t_benreferdetails (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_benreferdetails_BenId ON t_benreferdetails (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_benreferdetails_BeneficiaryRegID ON t_benreferdetails (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_benreferdetails_BeneficiaryRegId ON t_benreferdetails (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_benreferdetails_beneficiary_reg_id ON t_benreferdetails (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_benreferdetails_beneficiary_id ON t_benreferdetails (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_benreferdetails_beneficiaryId ON t_benreferdetails (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_benreferdetails_BeneficiaryId ON t_benreferdetails (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benreferdetails'
      AND index_name = 'idx_t_benreferdetails_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_benreferdetails' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_benreferdetails_CreatedDate ON t_benreferdetails (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_benreferdetails_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_childvaccinedetail1
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_created_by ON t_childvaccinedetail1 (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_CreatedBy ON t_childvaccinedetail1 (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_Created_By ON t_childvaccinedetail1 (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_updated_by ON t_childvaccinedetail1 (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_UpdatedBy ON t_childvaccinedetail1 (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_Updated_By ON t_childvaccinedetail1 (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_ModifiedBy ON t_childvaccinedetail1 (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_Modified_By ON t_childvaccinedetail1 (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_modified_by ON t_childvaccinedetail1 (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_user_id ON t_childvaccinedetail1 (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_userID ON t_childvaccinedetail1 (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_UserID ON t_childvaccinedetail1 (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_UserId ON t_childvaccinedetail1 (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_asha_id ON t_childvaccinedetail1 (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_ASHA_ID ON t_childvaccinedetail1 (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_AshaId ON t_childvaccinedetail1 (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_AshaID ON t_childvaccinedetail1 (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_form_id ON t_childvaccinedetail1 (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_FormId ON t_childvaccinedetail1 (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_formId ON t_childvaccinedetail1 (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_ben_id ON t_childvaccinedetail1 (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_benId ON t_childvaccinedetail1 (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_BenId ON t_childvaccinedetail1 (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_BeneficiaryRegID ON t_childvaccinedetail1 (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_BeneficiaryRegId ON t_childvaccinedetail1 (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_beneficiary_reg_id ON t_childvaccinedetail1 (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_beneficiary_id ON t_childvaccinedetail1 (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_beneficiaryId ON t_childvaccinedetail1 (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_BeneficiaryId ON t_childvaccinedetail1 (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND index_name = 'idx_t_childvaccinedetail1_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail1' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_childvaccinedetail1_CreatedDate ON t_childvaccinedetail1 (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_childvaccinedetail2
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_created_by ON t_childvaccinedetail2 (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_CreatedBy ON t_childvaccinedetail2 (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_Created_By ON t_childvaccinedetail2 (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_updated_by ON t_childvaccinedetail2 (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_UpdatedBy ON t_childvaccinedetail2 (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_Updated_By ON t_childvaccinedetail2 (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_ModifiedBy ON t_childvaccinedetail2 (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_Modified_By ON t_childvaccinedetail2 (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_modified_by ON t_childvaccinedetail2 (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_user_id ON t_childvaccinedetail2 (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_userID ON t_childvaccinedetail2 (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_UserID ON t_childvaccinedetail2 (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_UserId ON t_childvaccinedetail2 (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_asha_id ON t_childvaccinedetail2 (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_ASHA_ID ON t_childvaccinedetail2 (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_AshaId ON t_childvaccinedetail2 (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_AshaID ON t_childvaccinedetail2 (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_form_id ON t_childvaccinedetail2 (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_FormId ON t_childvaccinedetail2 (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_formId ON t_childvaccinedetail2 (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_ben_id ON t_childvaccinedetail2 (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_benId ON t_childvaccinedetail2 (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_BenId ON t_childvaccinedetail2 (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_BeneficiaryRegID ON t_childvaccinedetail2 (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_BeneficiaryRegId ON t_childvaccinedetail2 (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_beneficiary_reg_id ON t_childvaccinedetail2 (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_beneficiary_id ON t_childvaccinedetail2 (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_beneficiaryId ON t_childvaccinedetail2 (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_BeneficiaryId ON t_childvaccinedetail2 (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail2'
      AND index_name = 'idx_t_childvaccinedetail2_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_childvaccinedetail2' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_childvaccinedetail2_CreatedDate ON t_childvaccinedetail2 (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail2_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- m_immunizationservicevaccination
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_created_by ON m_immunizationservicevaccination (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_CreatedBy ON m_immunizationservicevaccination (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_Created_By ON m_immunizationservicevaccination (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_updated_by ON m_immunizationservicevaccination (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_UpdatedBy ON m_immunizationservicevaccination (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_Updated_By ON m_immunizationservicevaccination (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_ModifiedBy ON m_immunizationservicevaccination (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_Modified_By ON m_immunizationservicevaccination (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_modified_by ON m_immunizationservicevaccination (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_user_id ON m_immunizationservicevaccination (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_userID ON m_immunizationservicevaccination (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_UserID ON m_immunizationservicevaccination (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_UserId ON m_immunizationservicevaccination (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_asha_id ON m_immunizationservicevaccination (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_ASHA_ID ON m_immunizationservicevaccination (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_AshaId ON m_immunizationservicevaccination (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_AshaID ON m_immunizationservicevaccination (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_form_id ON m_immunizationservicevaccination (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_FormId ON m_immunizationservicevaccination (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_formId ON m_immunizationservicevaccination (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_ben_id ON m_immunizationservicevaccination (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_benId ON m_immunizationservicevaccination (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_BenId ON m_immunizationservicevaccination (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_BeneficiaryRegID ON m_immunizationservicevaccination (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_BeneficiaryRegId ON m_immunizationservicevaccination (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_beneficiary_reg_id ON m_immunizationservicevaccination (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_beneficiary_id ON m_immunizationservicevaccination (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_beneficiaryId ON m_immunizationservicevaccination (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_BeneficiaryId ON m_immunizationservicevaccination (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'm_immunizationservicevaccination'
      AND index_name = 'idx_m_immunizationservicevaccination_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'm_immunizationservicevaccination' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_m_immunizationservicevaccination_CreatedDate ON m_immunizationservicevaccination (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_m_immunizationservicevaccination_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_cbacdetails
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_cbacdetails_created_by ON t_cbacdetails (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_cbacdetails_CreatedBy ON t_cbacdetails (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_cbacdetails_Created_By ON t_cbacdetails (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_cbacdetails_updated_by ON t_cbacdetails (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_cbacdetails_UpdatedBy ON t_cbacdetails (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_cbacdetails_Updated_By ON t_cbacdetails (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_cbacdetails_ModifiedBy ON t_cbacdetails (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_cbacdetails_Modified_By ON t_cbacdetails (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_cbacdetails_modified_by ON t_cbacdetails (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_cbacdetails_user_id ON t_cbacdetails (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_cbacdetails_userID ON t_cbacdetails (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_cbacdetails_UserID ON t_cbacdetails (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_cbacdetails_UserId ON t_cbacdetails (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_cbacdetails_asha_id ON t_cbacdetails (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_cbacdetails_ASHA_ID ON t_cbacdetails (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_cbacdetails_AshaId ON t_cbacdetails (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_cbacdetails_AshaID ON t_cbacdetails (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_cbacdetails_form_id ON t_cbacdetails (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_cbacdetails_FormId ON t_cbacdetails (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_cbacdetails_formId ON t_cbacdetails (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_cbacdetails_ben_id ON t_cbacdetails (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_cbacdetails_benId ON t_cbacdetails (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_cbacdetails_BenId ON t_cbacdetails (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_cbacdetails_BeneficiaryRegID ON t_cbacdetails (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_cbacdetails_BeneficiaryRegId ON t_cbacdetails (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_cbacdetails_beneficiary_reg_id ON t_cbacdetails (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_cbacdetails_beneficiary_id ON t_cbacdetails (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_cbacdetails_beneficiaryId ON t_cbacdetails (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_cbacdetails_BeneficiaryId ON t_cbacdetails (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND index_name = 'idx_t_cbacdetails_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_cbacdetails' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_cbacdetails_CreatedDate ON t_cbacdetails (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



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



