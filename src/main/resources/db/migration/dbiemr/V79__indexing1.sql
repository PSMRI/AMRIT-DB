USE db_iemr;

-- FLW/common column indexes indexing1 (online DDL, idempotent)

-- t_anccare
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_anccare_created_by ON t_anccare (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_anccare_CreatedBy ON t_anccare (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_anccare_Created_By ON t_anccare (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_anccare_updated_by ON t_anccare (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_anccare_UpdatedBy ON t_anccare (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_anccare_Updated_By ON t_anccare (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_anccare_ModifiedBy ON t_anccare (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_anccare_Modified_By ON t_anccare (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_anccare_modified_by ON t_anccare (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_anccare_user_id ON t_anccare (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_anccare_userID ON t_anccare (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_anccare_UserID ON t_anccare (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_anccare_UserId ON t_anccare (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_anccare_asha_id ON t_anccare (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_anccare_ASHA_ID ON t_anccare (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_anccare_AshaId ON t_anccare (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_anccare_AshaID ON t_anccare (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_anccare_form_id ON t_anccare (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_anccare_FormId ON t_anccare (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_anccare_formId ON t_anccare (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_anccare_ben_id ON t_anccare (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_anccare_benId ON t_anccare (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_anccare_BenId ON t_anccare (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_anccare_BeneficiaryRegID ON t_anccare (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_anccare_BeneficiaryRegId ON t_anccare (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_anccare_beneficiary_reg_id ON t_anccare (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_anccare_beneficiary_id ON t_anccare (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_anccare_beneficiaryId ON t_anccare (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_anccare_BeneficiaryId ON t_anccare (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND index_name = 'idx_t_anccare_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anccare') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anccare' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_anccare_CreatedDate ON t_anccare (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anccare_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_anc_visit
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_anc_visit_created_by ON t_anc_visit (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_anc_visit_CreatedBy ON t_anc_visit (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_anc_visit_Created_By ON t_anc_visit (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_anc_visit_updated_by ON t_anc_visit (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_anc_visit_UpdatedBy ON t_anc_visit (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_anc_visit_Updated_By ON t_anc_visit (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_anc_visit_ModifiedBy ON t_anc_visit (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_anc_visit_Modified_By ON t_anc_visit (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_anc_visit_modified_by ON t_anc_visit (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_anc_visit_user_id ON t_anc_visit (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_anc_visit_userID ON t_anc_visit (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_anc_visit_UserID ON t_anc_visit (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_anc_visit_UserId ON t_anc_visit (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_anc_visit_asha_id ON t_anc_visit (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_anc_visit_ASHA_ID ON t_anc_visit (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_anc_visit_AshaId ON t_anc_visit (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_anc_visit_AshaID ON t_anc_visit (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_anc_visit_form_id ON t_anc_visit (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_anc_visit_FormId ON t_anc_visit (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_anc_visit_formId ON t_anc_visit (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_anc_visit_ben_id ON t_anc_visit (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_anc_visit_benId ON t_anc_visit (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_anc_visit_BenId ON t_anc_visit (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_anc_visit_BeneficiaryRegID ON t_anc_visit (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_anc_visit_BeneficiaryRegId ON t_anc_visit (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_anc_visit_beneficiary_reg_id ON t_anc_visit (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_anc_visit_beneficiary_id ON t_anc_visit (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_anc_visit_beneficiaryId ON t_anc_visit (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_anc_visit_BeneficiaryId ON t_anc_visit (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND index_name = 'idx_t_anc_visit_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_anc_visit' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_anc_visit_CreatedDate ON t_anc_visit (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_anc_visit_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_hbyc
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_hbyc_created_by ON t_hbyc (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_hbyc_CreatedBy ON t_hbyc (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_hbyc_Created_By ON t_hbyc (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_hbyc_updated_by ON t_hbyc (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_hbyc_UpdatedBy ON t_hbyc (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_hbyc_Updated_By ON t_hbyc (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_hbyc_ModifiedBy ON t_hbyc (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_hbyc_Modified_By ON t_hbyc (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_hbyc_modified_by ON t_hbyc (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_hbyc_user_id ON t_hbyc (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_hbyc_userID ON t_hbyc (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_hbyc_UserID ON t_hbyc (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_hbyc_UserId ON t_hbyc (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_hbyc_asha_id ON t_hbyc (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_hbyc_ASHA_ID ON t_hbyc (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_hbyc_AshaId ON t_hbyc (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_hbyc_AshaID ON t_hbyc (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_hbyc_form_id ON t_hbyc (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_hbyc_FormId ON t_hbyc (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_hbyc_formId ON t_hbyc (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_hbyc_ben_id ON t_hbyc (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_hbyc_benId ON t_hbyc (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_hbyc_BenId ON t_hbyc (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_hbyc_BeneficiaryRegID ON t_hbyc (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_hbyc_BeneficiaryRegId ON t_hbyc (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_hbyc_beneficiary_reg_id ON t_hbyc (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_hbyc_beneficiary_id ON t_hbyc (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_hbyc_beneficiaryId ON t_hbyc (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_hbyc_BeneficiaryId ON t_hbyc (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc'
      AND index_name = 'idx_t_hbyc_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_hbyc_CreatedDate ON t_hbyc (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_hbnc_visit
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_hbnc_visit_created_by ON t_hbnc_visit (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_visit_CreatedBy ON t_hbnc_visit (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_hbnc_visit_Created_By ON t_hbnc_visit (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_hbnc_visit_updated_by ON t_hbnc_visit (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_visit_UpdatedBy ON t_hbnc_visit (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_hbnc_visit_Updated_By ON t_hbnc_visit (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_hbnc_visit_ModifiedBy ON t_hbnc_visit (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_hbnc_visit_Modified_By ON t_hbnc_visit (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_hbnc_visit_modified_by ON t_hbnc_visit (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_user_id ON t_hbnc_visit (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_userID ON t_hbnc_visit (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_UserID ON t_hbnc_visit (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_UserId ON t_hbnc_visit (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_asha_id ON t_hbnc_visit (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_ASHA_ID ON t_hbnc_visit (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_AshaId ON t_hbnc_visit (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_AshaID ON t_hbnc_visit (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_form_id ON t_hbnc_visit (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_FormId ON t_hbnc_visit (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_formId ON t_hbnc_visit (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_ben_id ON t_hbnc_visit (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_benId ON t_hbnc_visit (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_BenId ON t_hbnc_visit (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_BeneficiaryRegID ON t_hbnc_visit (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_BeneficiaryRegId ON t_hbnc_visit (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_beneficiary_reg_id ON t_hbnc_visit (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_beneficiary_id ON t_hbnc_visit (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_beneficiaryId ON t_hbnc_visit (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_BeneficiaryId ON t_hbnc_visit (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit'
      AND index_name = 'idx_t_hbnc_visit_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_hbnc_visit_CreatedDate ON t_hbnc_visit (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_hbnc_part1
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_hbnc_part1_created_by ON t_hbnc_part1 (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_part1_CreatedBy ON t_hbnc_part1 (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_hbnc_part1_Created_By ON t_hbnc_part1 (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_hbnc_part1_updated_by ON t_hbnc_part1 (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_part1_UpdatedBy ON t_hbnc_part1 (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_hbnc_part1_Updated_By ON t_hbnc_part1 (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_hbnc_part1_ModifiedBy ON t_hbnc_part1 (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_hbnc_part1_Modified_By ON t_hbnc_part1 (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_hbnc_part1_modified_by ON t_hbnc_part1 (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_hbnc_part1_user_id ON t_hbnc_part1 (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_hbnc_part1_userID ON t_hbnc_part1 (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_hbnc_part1_UserID ON t_hbnc_part1 (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_UserId ON t_hbnc_part1 (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_hbnc_part1_asha_id ON t_hbnc_part1 (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_hbnc_part1_ASHA_ID ON t_hbnc_part1 (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_AshaId ON t_hbnc_part1 (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_hbnc_part1_AshaID ON t_hbnc_part1 (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_hbnc_part1_form_id ON t_hbnc_part1 (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_FormId ON t_hbnc_part1 (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_formId ON t_hbnc_part1 (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_hbnc_part1_ben_id ON t_hbnc_part1 (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_benId ON t_hbnc_part1 (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_BenId ON t_hbnc_part1 (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_hbnc_part1_BeneficiaryRegID ON t_hbnc_part1 (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_BeneficiaryRegId ON t_hbnc_part1 (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_hbnc_part1_beneficiary_reg_id ON t_hbnc_part1 (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_hbnc_part1_beneficiary_id ON t_hbnc_part1 (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_beneficiaryId ON t_hbnc_part1 (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_part1_BeneficiaryId ON t_hbnc_part1 (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part1'
      AND index_name = 'idx_t_hbnc_part1_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part1' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_hbnc_part1_CreatedDate ON t_hbnc_part1 (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part1_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_hbnc_part2
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_hbnc_part2_created_by ON t_hbnc_part2 (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_part2_CreatedBy ON t_hbnc_part2 (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_hbnc_part2_Created_By ON t_hbnc_part2 (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_hbnc_part2_updated_by ON t_hbnc_part2 (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_part2_UpdatedBy ON t_hbnc_part2 (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_hbnc_part2_Updated_By ON t_hbnc_part2 (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_hbnc_part2_ModifiedBy ON t_hbnc_part2 (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_hbnc_part2_Modified_By ON t_hbnc_part2 (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_hbnc_part2_modified_by ON t_hbnc_part2 (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_hbnc_part2_user_id ON t_hbnc_part2 (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_hbnc_part2_userID ON t_hbnc_part2 (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_hbnc_part2_UserID ON t_hbnc_part2 (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_UserId ON t_hbnc_part2 (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_hbnc_part2_asha_id ON t_hbnc_part2 (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_hbnc_part2_ASHA_ID ON t_hbnc_part2 (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_AshaId ON t_hbnc_part2 (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_hbnc_part2_AshaID ON t_hbnc_part2 (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_hbnc_part2_form_id ON t_hbnc_part2 (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_FormId ON t_hbnc_part2 (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_formId ON t_hbnc_part2 (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_hbnc_part2_ben_id ON t_hbnc_part2 (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_benId ON t_hbnc_part2 (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_BenId ON t_hbnc_part2 (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_hbnc_part2_BeneficiaryRegID ON t_hbnc_part2 (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_BeneficiaryRegId ON t_hbnc_part2 (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_hbnc_part2_beneficiary_reg_id ON t_hbnc_part2 (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_hbnc_part2_beneficiary_id ON t_hbnc_part2 (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_beneficiaryId ON t_hbnc_part2 (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_part2_BeneficiaryId ON t_hbnc_part2 (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_part2'
      AND index_name = 'idx_t_hbnc_part2_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_part2' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_hbnc_part2_CreatedDate ON t_hbnc_part2 (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_part2_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_hbnc_visit_card
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_created_by ON t_hbnc_visit_card (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_CreatedBy ON t_hbnc_visit_card (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_Created_By ON t_hbnc_visit_card (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_updated_by ON t_hbnc_visit_card (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_UpdatedBy ON t_hbnc_visit_card (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_Updated_By ON t_hbnc_visit_card (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_ModifiedBy ON t_hbnc_visit_card (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_Modified_By ON t_hbnc_visit_card (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_modified_by ON t_hbnc_visit_card (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_user_id ON t_hbnc_visit_card (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_userID ON t_hbnc_visit_card (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_UserID ON t_hbnc_visit_card (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_UserId ON t_hbnc_visit_card (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_asha_id ON t_hbnc_visit_card (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_ASHA_ID ON t_hbnc_visit_card (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_AshaId ON t_hbnc_visit_card (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_AshaID ON t_hbnc_visit_card (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_form_id ON t_hbnc_visit_card (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_FormId ON t_hbnc_visit_card (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_formId ON t_hbnc_visit_card (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_ben_id ON t_hbnc_visit_card (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_benId ON t_hbnc_visit_card (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_BenId ON t_hbnc_visit_card (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_BeneficiaryRegID ON t_hbnc_visit_card (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_BeneficiaryRegId ON t_hbnc_visit_card (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_beneficiary_reg_id ON t_hbnc_visit_card (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_beneficiary_id ON t_hbnc_visit_card (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_beneficiaryId ON t_hbnc_visit_card (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_BeneficiaryId ON t_hbnc_visit_card (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbnc_visit_card'
      AND index_name = 'idx_t_hbnc_visit_card_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbnc_visit_card' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_hbnc_visit_card_CreatedDate ON t_hbnc_visit_card (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbnc_visit_card_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_hbyc_child_visits
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_created_by ON t_hbyc_child_visits (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_CreatedBy ON t_hbyc_child_visits (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_Created_By ON t_hbyc_child_visits (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_updated_by ON t_hbyc_child_visits (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_UpdatedBy ON t_hbyc_child_visits (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_Updated_By ON t_hbyc_child_visits (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_ModifiedBy ON t_hbyc_child_visits (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_Modified_By ON t_hbyc_child_visits (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_modified_by ON t_hbyc_child_visits (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_user_id ON t_hbyc_child_visits (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_userID ON t_hbyc_child_visits (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_UserID ON t_hbyc_child_visits (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_UserId ON t_hbyc_child_visits (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_asha_id ON t_hbyc_child_visits (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_ASHA_ID ON t_hbyc_child_visits (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_AshaId ON t_hbyc_child_visits (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_AshaID ON t_hbyc_child_visits (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_form_id ON t_hbyc_child_visits (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_FormId ON t_hbyc_child_visits (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_formId ON t_hbyc_child_visits (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_ben_id ON t_hbyc_child_visits (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_benId ON t_hbyc_child_visits (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_BenId ON t_hbyc_child_visits (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_BeneficiaryRegID ON t_hbyc_child_visits (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_BeneficiaryRegId ON t_hbyc_child_visits (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_beneficiary_reg_id ON t_hbyc_child_visits (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_beneficiary_id ON t_hbyc_child_visits (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_beneficiaryId ON t_hbyc_child_visits (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_BeneficiaryId ON t_hbyc_child_visits (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_hbyc_child_visits'
      AND index_name = 'idx_t_hbyc_child_visits_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_hbyc_child_visits' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_hbyc_child_visits_CreatedDate ON t_hbyc_child_visits (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_hbyc_child_visits_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- anc_counselling_care
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_anc_counselling_care_created_by ON anc_counselling_care (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_anc_counselling_care_CreatedBy ON anc_counselling_care (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_anc_counselling_care_Created_By ON anc_counselling_care (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_anc_counselling_care_updated_by ON anc_counselling_care (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_anc_counselling_care_UpdatedBy ON anc_counselling_care (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_anc_counselling_care_Updated_By ON anc_counselling_care (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_anc_counselling_care_ModifiedBy ON anc_counselling_care (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_anc_counselling_care_Modified_By ON anc_counselling_care (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_anc_counselling_care_modified_by ON anc_counselling_care (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_anc_counselling_care_user_id ON anc_counselling_care (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_anc_counselling_care_userID ON anc_counselling_care (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_anc_counselling_care_UserID ON anc_counselling_care (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_anc_counselling_care_UserId ON anc_counselling_care (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_anc_counselling_care_asha_id ON anc_counselling_care (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_anc_counselling_care_ASHA_ID ON anc_counselling_care (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_anc_counselling_care_AshaId ON anc_counselling_care (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_anc_counselling_care_AshaID ON anc_counselling_care (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_anc_counselling_care_form_id ON anc_counselling_care (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_anc_counselling_care_FormId ON anc_counselling_care (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_anc_counselling_care_formId ON anc_counselling_care (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_anc_counselling_care_ben_id ON anc_counselling_care (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_anc_counselling_care_benId ON anc_counselling_care (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_anc_counselling_care_BenId ON anc_counselling_care (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_anc_counselling_care_BeneficiaryRegID ON anc_counselling_care (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_anc_counselling_care_BeneficiaryRegId ON anc_counselling_care (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_anc_counselling_care_beneficiary_reg_id ON anc_counselling_care (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_anc_counselling_care_beneficiary_id ON anc_counselling_care (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_anc_counselling_care_beneficiaryId ON anc_counselling_care (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_anc_counselling_care_BeneficiaryId ON anc_counselling_care (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'anc_counselling_care'
      AND index_name = 'idx_anc_counselling_care_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'anc_counselling_care' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_anc_counselling_care_CreatedDate ON anc_counselling_care (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_anc_counselling_care_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



