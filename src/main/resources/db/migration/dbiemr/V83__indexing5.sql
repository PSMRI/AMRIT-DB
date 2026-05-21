USE db_iemr;

-- FLW/common column indexes indexing5 (online DDL, idempotent)


-- phc_review_meeting
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_phc_review_meeting_created_by ON phc_review_meeting (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_phc_review_meeting_CreatedBy ON phc_review_meeting (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_phc_review_meeting_Created_By ON phc_review_meeting (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_phc_review_meeting_updated_by ON phc_review_meeting (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_phc_review_meeting_UpdatedBy ON phc_review_meeting (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_phc_review_meeting_Updated_By ON phc_review_meeting (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_phc_review_meeting_ModifiedBy ON phc_review_meeting (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_phc_review_meeting_Modified_By ON phc_review_meeting (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_phc_review_meeting_modified_by ON phc_review_meeting (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_phc_review_meeting_user_id ON phc_review_meeting (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_phc_review_meeting_userID ON phc_review_meeting (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_phc_review_meeting_UserID ON phc_review_meeting (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_phc_review_meeting_UserId ON phc_review_meeting (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_phc_review_meeting_asha_id ON phc_review_meeting (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_phc_review_meeting_ASHA_ID ON phc_review_meeting (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_phc_review_meeting_AshaId ON phc_review_meeting (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_phc_review_meeting_AshaID ON phc_review_meeting (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_phc_review_meeting_form_id ON phc_review_meeting (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_phc_review_meeting_FormId ON phc_review_meeting (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_phc_review_meeting_formId ON phc_review_meeting (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_phc_review_meeting_ben_id ON phc_review_meeting (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_phc_review_meeting_benId ON phc_review_meeting (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_phc_review_meeting_BenId ON phc_review_meeting (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_phc_review_meeting_BeneficiaryRegID ON phc_review_meeting (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_phc_review_meeting_BeneficiaryRegId ON phc_review_meeting (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_phc_review_meeting_beneficiary_reg_id ON phc_review_meeting (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_phc_review_meeting_beneficiary_id ON phc_review_meeting (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_phc_review_meeting_beneficiaryId ON phc_review_meeting (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_phc_review_meeting_BeneficiaryId ON phc_review_meeting (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'phc_review_meeting'
      AND index_name = 'idx_phc_review_meeting_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'phc_review_meeting' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_phc_review_meeting_CreatedDate ON phc_review_meeting (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_phc_review_meeting_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- vhnc_form
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_vhnc_form_created_by ON vhnc_form (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_vhnc_form_CreatedBy ON vhnc_form (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_vhnc_form_Created_By ON vhnc_form (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_vhnc_form_updated_by ON vhnc_form (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_vhnc_form_UpdatedBy ON vhnc_form (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_vhnc_form_Updated_By ON vhnc_form (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_vhnc_form_ModifiedBy ON vhnc_form (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_vhnc_form_Modified_By ON vhnc_form (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_vhnc_form_modified_by ON vhnc_form (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_vhnc_form_user_id ON vhnc_form (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_vhnc_form_userID ON vhnc_form (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_vhnc_form_UserID ON vhnc_form (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_vhnc_form_UserId ON vhnc_form (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_vhnc_form_asha_id ON vhnc_form (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_vhnc_form_ASHA_ID ON vhnc_form (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_vhnc_form_AshaId ON vhnc_form (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_vhnc_form_AshaID ON vhnc_form (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_vhnc_form_form_id ON vhnc_form (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_vhnc_form_FormId ON vhnc_form (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_vhnc_form_formId ON vhnc_form (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_vhnc_form_ben_id ON vhnc_form (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_vhnc_form_benId ON vhnc_form (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_vhnc_form_BenId ON vhnc_form (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_vhnc_form_BeneficiaryRegID ON vhnc_form (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_vhnc_form_BeneficiaryRegId ON vhnc_form (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_vhnc_form_beneficiary_reg_id ON vhnc_form (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_vhnc_form_beneficiary_id ON vhnc_form (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_vhnc_form_beneficiaryId ON vhnc_form (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_vhnc_form_BeneficiaryId ON vhnc_form (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnc_form'
      AND index_name = 'idx_vhnc_form_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnc_form' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_vhnc_form_CreatedDate ON vhnc_form (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnc_form_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- vhnd_form
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_vhnd_form_created_by ON vhnd_form (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_vhnd_form_CreatedBy ON vhnd_form (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_vhnd_form_Created_By ON vhnd_form (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_vhnd_form_updated_by ON vhnd_form (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_vhnd_form_UpdatedBy ON vhnd_form (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_vhnd_form_Updated_By ON vhnd_form (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_vhnd_form_ModifiedBy ON vhnd_form (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_vhnd_form_Modified_By ON vhnd_form (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_vhnd_form_modified_by ON vhnd_form (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_vhnd_form_user_id ON vhnd_form (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_vhnd_form_userID ON vhnd_form (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_vhnd_form_UserID ON vhnd_form (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_vhnd_form_UserId ON vhnd_form (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_vhnd_form_asha_id ON vhnd_form (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_vhnd_form_ASHA_ID ON vhnd_form (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_vhnd_form_AshaId ON vhnd_form (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_vhnd_form_AshaID ON vhnd_form (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_vhnd_form_form_id ON vhnd_form (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_vhnd_form_FormId ON vhnd_form (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_vhnd_form_formId ON vhnd_form (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_vhnd_form_ben_id ON vhnd_form (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_vhnd_form_benId ON vhnd_form (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_vhnd_form_BenId ON vhnd_form (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_vhnd_form_BeneficiaryRegID ON vhnd_form (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_vhnd_form_BeneficiaryRegId ON vhnd_form (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_vhnd_form_beneficiary_reg_id ON vhnd_form (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_vhnd_form_beneficiary_id ON vhnd_form (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_vhnd_form_beneficiaryId ON vhnd_form (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_vhnd_form_BeneficiaryId ON vhnd_form (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'vhnd_form'
      AND index_name = 'idx_vhnd_form_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'vhnd_form' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_vhnd_form_CreatedDate ON vhnd_form (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_vhnd_form_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- irs_round
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_irs_round_created_by ON irs_round (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_irs_round_CreatedBy ON irs_round (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_irs_round_Created_By ON irs_round (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_irs_round_updated_by ON irs_round (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_irs_round_UpdatedBy ON irs_round (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_irs_round_Updated_By ON irs_round (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_irs_round_ModifiedBy ON irs_round (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_irs_round_Modified_By ON irs_round (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_irs_round_modified_by ON irs_round (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_irs_round_user_id ON irs_round (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_irs_round_userID ON irs_round (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_irs_round_UserID ON irs_round (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_irs_round_UserId ON irs_round (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_irs_round_asha_id ON irs_round (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_irs_round_ASHA_ID ON irs_round (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_irs_round_AshaId ON irs_round (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_irs_round_AshaID ON irs_round (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_irs_round_form_id ON irs_round (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_irs_round_FormId ON irs_round (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_irs_round_formId ON irs_round (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_irs_round_ben_id ON irs_round (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_irs_round_benId ON irs_round (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_irs_round_BenId ON irs_round (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_irs_round_BeneficiaryRegID ON irs_round (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_irs_round_BeneficiaryRegId ON irs_round (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_irs_round_beneficiary_reg_id ON irs_round (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_irs_round_beneficiary_id ON irs_round (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_irs_round_beneficiaryId ON irs_round (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_irs_round_BeneficiaryId ON irs_round (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'irs_round'
      AND index_name = 'idx_irs_round_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'irs_round') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'irs_round' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_irs_round_CreatedDate ON irs_round (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_irs_round_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_eye_checkup
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_eye_checkup_created_by ON t_eye_checkup (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_eye_checkup_CreatedBy ON t_eye_checkup (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_eye_checkup_Created_By ON t_eye_checkup (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_eye_checkup_updated_by ON t_eye_checkup (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_eye_checkup_UpdatedBy ON t_eye_checkup (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_eye_checkup_Updated_By ON t_eye_checkup (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_eye_checkup_ModifiedBy ON t_eye_checkup (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_eye_checkup_Modified_By ON t_eye_checkup (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_eye_checkup_modified_by ON t_eye_checkup (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_eye_checkup_user_id ON t_eye_checkup (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_eye_checkup_userID ON t_eye_checkup (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_eye_checkup_UserID ON t_eye_checkup (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_eye_checkup_UserId ON t_eye_checkup (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_eye_checkup_asha_id ON t_eye_checkup (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_eye_checkup_ASHA_ID ON t_eye_checkup (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_eye_checkup_AshaId ON t_eye_checkup (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_eye_checkup_AshaID ON t_eye_checkup (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_eye_checkup_form_id ON t_eye_checkup (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_eye_checkup_FormId ON t_eye_checkup (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_eye_checkup_formId ON t_eye_checkup (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_eye_checkup_ben_id ON t_eye_checkup (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_eye_checkup_benId ON t_eye_checkup (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_eye_checkup_BenId ON t_eye_checkup (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_eye_checkup_BeneficiaryRegID ON t_eye_checkup (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_eye_checkup_BeneficiaryRegId ON t_eye_checkup (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_eye_checkup_beneficiary_reg_id ON t_eye_checkup (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_eye_checkup_beneficiary_id ON t_eye_checkup (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_eye_checkup_beneficiaryId ON t_eye_checkup (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_eye_checkup_BeneficiaryId ON t_eye_checkup (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eye_checkup'
      AND index_name = 'idx_t_eye_checkup_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_eye_checkup' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_eye_checkup_CreatedDate ON t_eye_checkup (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_eye_checkup_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- uwin_session_record
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_uwin_session_record_created_by ON uwin_session_record (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_uwin_session_record_CreatedBy ON uwin_session_record (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_uwin_session_record_Created_By ON uwin_session_record (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_uwin_session_record_updated_by ON uwin_session_record (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_uwin_session_record_UpdatedBy ON uwin_session_record (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_uwin_session_record_Updated_By ON uwin_session_record (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_uwin_session_record_ModifiedBy ON uwin_session_record (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_uwin_session_record_Modified_By ON uwin_session_record (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_uwin_session_record_modified_by ON uwin_session_record (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_uwin_session_record_user_id ON uwin_session_record (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_uwin_session_record_userID ON uwin_session_record (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_uwin_session_record_UserID ON uwin_session_record (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_uwin_session_record_UserId ON uwin_session_record (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_uwin_session_record_asha_id ON uwin_session_record (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_uwin_session_record_ASHA_ID ON uwin_session_record (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_uwin_session_record_AshaId ON uwin_session_record (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_uwin_session_record_AshaID ON uwin_session_record (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_uwin_session_record_form_id ON uwin_session_record (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_uwin_session_record_FormId ON uwin_session_record (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_uwin_session_record_formId ON uwin_session_record (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_uwin_session_record_ben_id ON uwin_session_record (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_uwin_session_record_benId ON uwin_session_record (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_uwin_session_record_BenId ON uwin_session_record (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_uwin_session_record_BeneficiaryRegID ON uwin_session_record (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_uwin_session_record_BeneficiaryRegId ON uwin_session_record (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_uwin_session_record_beneficiary_reg_id ON uwin_session_record (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_uwin_session_record_beneficiary_id ON uwin_session_record (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_uwin_session_record_beneficiaryId ON uwin_session_record (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_uwin_session_record_BeneficiaryId ON uwin_session_record (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'uwin_session_record'
      AND index_name = 'idx_uwin_session_record_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'uwin_session_record' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_uwin_session_record_CreatedDate ON uwin_session_record (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_uwin_session_record_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- maa_meeting
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_maa_meeting_created_by ON maa_meeting (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_maa_meeting_CreatedBy ON maa_meeting (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_maa_meeting_Created_By ON maa_meeting (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_maa_meeting_updated_by ON maa_meeting (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_maa_meeting_UpdatedBy ON maa_meeting (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_maa_meeting_Updated_By ON maa_meeting (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_maa_meeting_ModifiedBy ON maa_meeting (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_maa_meeting_Modified_By ON maa_meeting (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_maa_meeting_modified_by ON maa_meeting (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_maa_meeting_user_id ON maa_meeting (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_maa_meeting_userID ON maa_meeting (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_maa_meeting_UserID ON maa_meeting (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_maa_meeting_UserId ON maa_meeting (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_maa_meeting_asha_id ON maa_meeting (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_maa_meeting_ASHA_ID ON maa_meeting (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_maa_meeting_AshaId ON maa_meeting (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_maa_meeting_AshaID ON maa_meeting (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_maa_meeting_form_id ON maa_meeting (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_maa_meeting_FormId ON maa_meeting (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_maa_meeting_formId ON maa_meeting (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_maa_meeting_ben_id ON maa_meeting (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_maa_meeting_benId ON maa_meeting (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_maa_meeting_BenId ON maa_meeting (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_maa_meeting_BeneficiaryRegID ON maa_meeting (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_maa_meeting_BeneficiaryRegId ON maa_meeting (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_maa_meeting_beneficiary_reg_id ON maa_meeting (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_maa_meeting_beneficiary_id ON maa_meeting (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_maa_meeting_beneficiaryId ON maa_meeting (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_maa_meeting_BeneficiaryId ON maa_meeting (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'maa_meeting'
      AND index_name = 'idx_maa_meeting_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'maa_meeting' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_maa_meeting_CreatedDate ON maa_meeting (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_maa_meeting_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- t_sam_visit
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_t_sam_visit_created_by ON t_sam_visit (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_t_sam_visit_CreatedBy ON t_sam_visit (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_t_sam_visit_Created_By ON t_sam_visit (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_t_sam_visit_updated_by ON t_sam_visit (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_t_sam_visit_UpdatedBy ON t_sam_visit (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_t_sam_visit_Updated_By ON t_sam_visit (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_t_sam_visit_ModifiedBy ON t_sam_visit (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_t_sam_visit_Modified_By ON t_sam_visit (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_t_sam_visit_modified_by ON t_sam_visit (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_t_sam_visit_user_id ON t_sam_visit (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_t_sam_visit_userID ON t_sam_visit (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_t_sam_visit_UserID ON t_sam_visit (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_t_sam_visit_UserId ON t_sam_visit (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_t_sam_visit_asha_id ON t_sam_visit (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_t_sam_visit_ASHA_ID ON t_sam_visit (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_t_sam_visit_AshaId ON t_sam_visit (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_t_sam_visit_AshaID ON t_sam_visit (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_t_sam_visit_form_id ON t_sam_visit (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_t_sam_visit_FormId ON t_sam_visit (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_t_sam_visit_formId ON t_sam_visit (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_t_sam_visit_ben_id ON t_sam_visit (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_t_sam_visit_benId ON t_sam_visit (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_t_sam_visit_BenId ON t_sam_visit (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_t_sam_visit_BeneficiaryRegID ON t_sam_visit (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_t_sam_visit_BeneficiaryRegId ON t_sam_visit (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_t_sam_visit_beneficiary_reg_id ON t_sam_visit (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_t_sam_visit_beneficiary_id ON t_sam_visit (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_t_sam_visit_beneficiaryId ON t_sam_visit (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_t_sam_visit_BeneficiaryId ON t_sam_visit (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_sam_visit'
      AND index_name = 'idx_t_sam_visit_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 't_sam_visit' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_t_sam_visit_CreatedDate ON t_sam_visit (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_t_sam_visit_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- sammelan_record
SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_created_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'created_by') > 0,
    'CREATE INDEX idx_sammelan_record_created_by ON sammelan_record (created_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_created_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_CreatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'CreatedBy') > 0,
    'CREATE INDEX idx_sammelan_record_CreatedBy ON sammelan_record (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_CreatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_Created_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'Created_By') > 0,
    'CREATE INDEX idx_sammelan_record_Created_By ON sammelan_record (Created_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_Created_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_updated_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'updated_by') > 0,
    'CREATE INDEX idx_sammelan_record_updated_by ON sammelan_record (updated_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_updated_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_UpdatedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'UpdatedBy') > 0,
    'CREATE INDEX idx_sammelan_record_UpdatedBy ON sammelan_record (UpdatedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_UpdatedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_Updated_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'Updated_By') > 0,
    'CREATE INDEX idx_sammelan_record_Updated_By ON sammelan_record (Updated_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_Updated_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_ModifiedBy'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'ModifiedBy') > 0,
    'CREATE INDEX idx_sammelan_record_ModifiedBy ON sammelan_record (ModifiedBy) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_ModifiedBy already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_Modified_By'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'Modified_By') > 0,
    'CREATE INDEX idx_sammelan_record_Modified_By ON sammelan_record (Modified_By) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_Modified_By already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_modified_by'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'modified_by') > 0,
    'CREATE INDEX idx_sammelan_record_modified_by ON sammelan_record (modified_by) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_modified_by already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_user_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'user_id') > 0,
    'CREATE INDEX idx_sammelan_record_user_id ON sammelan_record (user_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_user_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_userID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'userID') > 0,
    'CREATE INDEX idx_sammelan_record_userID ON sammelan_record (userID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_userID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_UserID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'UserID') > 0,
    'CREATE INDEX idx_sammelan_record_UserID ON sammelan_record (UserID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_UserID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_UserId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'UserId') > 0,
    'CREATE INDEX idx_sammelan_record_UserId ON sammelan_record (UserId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_UserId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_asha_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'asha_id') > 0,
    'CREATE INDEX idx_sammelan_record_asha_id ON sammelan_record (asha_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_asha_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_ASHA_ID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'ASHA_ID') > 0,
    'CREATE INDEX idx_sammelan_record_ASHA_ID ON sammelan_record (ASHA_ID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_ASHA_ID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_AshaId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'AshaId') > 0,
    'CREATE INDEX idx_sammelan_record_AshaId ON sammelan_record (AshaId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_AshaId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_AshaID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'AshaID') > 0,
    'CREATE INDEX idx_sammelan_record_AshaID ON sammelan_record (AshaID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_AshaID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_form_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'form_id') > 0,
    'CREATE INDEX idx_sammelan_record_form_id ON sammelan_record (form_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_form_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_FormId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'FormId') > 0,
    'CREATE INDEX idx_sammelan_record_FormId ON sammelan_record (FormId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_FormId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_formId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'formId') > 0,
    'CREATE INDEX idx_sammelan_record_formId ON sammelan_record (formId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_formId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_ben_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'ben_id') > 0,
    'CREATE INDEX idx_sammelan_record_ben_id ON sammelan_record (ben_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_ben_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_benId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'benId') > 0,
    'CREATE INDEX idx_sammelan_record_benId ON sammelan_record (benId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_benId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_BenId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'BenId') > 0,
    'CREATE INDEX idx_sammelan_record_BenId ON sammelan_record (BenId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_BenId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_BeneficiaryRegID'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'BeneficiaryRegID') > 0,
    'CREATE INDEX idx_sammelan_record_BeneficiaryRegID ON sammelan_record (BeneficiaryRegID) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_BeneficiaryRegID already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_BeneficiaryRegId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'BeneficiaryRegId') > 0,
    'CREATE INDEX idx_sammelan_record_BeneficiaryRegId ON sammelan_record (BeneficiaryRegId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_BeneficiaryRegId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_beneficiary_reg_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'beneficiary_reg_id') > 0,
    'CREATE INDEX idx_sammelan_record_beneficiary_reg_id ON sammelan_record (beneficiary_reg_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_beneficiary_reg_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_beneficiary_id'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'beneficiary_id') > 0,
    'CREATE INDEX idx_sammelan_record_beneficiary_id ON sammelan_record (beneficiary_id) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_beneficiary_id already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_beneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'beneficiaryId') > 0,
    'CREATE INDEX idx_sammelan_record_beneficiaryId ON sammelan_record (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_beneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_BeneficiaryId'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'BeneficiaryId') > 0,
    'CREATE INDEX idx_sammelan_record_BeneficiaryId ON sammelan_record (BeneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_BeneficiaryId already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'sammelan_record'
      AND index_name = 'idx_sammelan_record_CreatedDate'
);

SET @sql = IF(
    @idx_exists = 0
      AND (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record') > 0
      AND (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'db_iemr' AND table_name = 'sammelan_record' AND column_name = 'CreatedDate') > 0,
    'CREATE INDEX idx_sammelan_record_CreatedDate ON sammelan_record (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_sammelan_record_CreatedDate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



