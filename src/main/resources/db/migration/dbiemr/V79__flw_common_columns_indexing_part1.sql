USE db_iemr;

-- FLW/common column indexes part 1 (online DDL, idempotent)

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



