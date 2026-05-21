USE db_iemr;

-- FLW/common column indexes indexing4 (online DDL, idempotent)


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



USE db_iemr;

-- FLW/common column indexes part 3 (online DDL, idempotent)


-- ahd_form
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_ahd_form_created_by ON ahd_form (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_ahd_form_CreatedBy ON ahd_form (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_ahd_form_Created_By ON ahd_form (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_ahd_form_updated_by ON ahd_form (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_ahd_form_UpdatedBy ON ahd_form (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_ahd_form_Updated_By ON ahd_form (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_ahd_form_ModifiedBy ON ahd_form (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_ahd_form_Modified_By ON ahd_form (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_ahd_form_modified_by ON ahd_form (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_ahd_form_user_id ON ahd_form (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_ahd_form_userID ON ahd_form (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_ahd_form_UserID ON ahd_form (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_ahd_form_UserId ON ahd_form (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_ahd_form_asha_id ON ahd_form (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_ahd_form_ASHA_ID ON ahd_form (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_ahd_form_AshaId ON ahd_form (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_ahd_form_AshaID ON ahd_form (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_ahd_form_form_id ON ahd_form (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_ahd_form_FormId ON ahd_form (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_ahd_form_formId ON ahd_form (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_ahd_form_ben_id ON ahd_form (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_ahd_form_benId ON ahd_form (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_ahd_form_BenId ON ahd_form (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_ahd_form_BeneficiaryRegID ON ahd_form (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_ahd_form_BeneficiaryRegId ON ahd_form (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_ahd_form_beneficiary_reg_id ON ahd_form (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_ahd_form_beneficiary_id ON ahd_form (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_ahd_form_beneficiaryId ON ahd_form (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_ahd_form_BeneficiaryId ON ahd_form (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'ahd_form'
      AND index_name = 'idx_ahd_form_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'ahd_form' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_ahd_form_CreatedDate ON ahd_form (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_ahd_form_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- deworming_form
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_deworming_form_created_by ON deworming_form (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_deworming_form_CreatedBy ON deworming_form (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_deworming_form_Created_By ON deworming_form (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_deworming_form_updated_by ON deworming_form (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_deworming_form_UpdatedBy ON deworming_form (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_deworming_form_Updated_By ON deworming_form (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_deworming_form_ModifiedBy ON deworming_form (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_deworming_form_Modified_By ON deworming_form (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_deworming_form_modified_by ON deworming_form (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_deworming_form_user_id ON deworming_form (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_deworming_form_userID ON deworming_form (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_deworming_form_UserID ON deworming_form (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_deworming_form_UserId ON deworming_form (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_deworming_form_asha_id ON deworming_form (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_deworming_form_ASHA_ID ON deworming_form (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_deworming_form_AshaId ON deworming_form (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_deworming_form_AshaID ON deworming_form (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_deworming_form_form_id ON deworming_form (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_deworming_form_FormId ON deworming_form (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_deworming_form_formId ON deworming_form (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_deworming_form_ben_id ON deworming_form (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_deworming_form_benId ON deworming_form (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_deworming_form_BenId ON deworming_form (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_deworming_form_BeneficiaryRegID ON deworming_form (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_deworming_form_BeneficiaryRegId ON deworming_form (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_deworming_form_beneficiary_reg_id ON deworming_form (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_deworming_form_beneficiary_id ON deworming_form (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_deworming_form_beneficiaryId ON deworming_form (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_deworming_form_BeneficiaryId ON deworming_form (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'deworming_form'
      AND index_name = 'idx_deworming_form_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'deworming_form' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_deworming_form_CreatedDate ON deworming_form (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_deworming_form_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



