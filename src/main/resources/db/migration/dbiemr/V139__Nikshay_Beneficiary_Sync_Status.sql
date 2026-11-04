USE db_iemr;

CREATE TABLE IF NOT EXISTS nikshay_beneficiary_sync_status (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ben_reg_id BIGINT NOT NULL COMMENT 'BenRegId',
    beneficiary_id BIGINT NULL COMMENT 'BeneficiaryID (db_identity.m_beneficiaryregidmapping); null if not found',
    beneficiary_type VARCHAR(20) NOT NULL COMMENT 'INDEX, CONTACT or ALL_NEGATIVE',
    index_ben_reg_id BIGINT NULL COMMENT 'For a CONTACT: BenRegId of their index patient',
    phase VARCHAR(20) NOT NULL COMMENT 'ENROLMENT, CONTACTS, XRAY_UPLOAD, NAAT_UPLOAD or TRANSFER_OUT',
    status VARCHAR(20) NOT NULL COMMENT 'PENDING, IN_PROGRESS, DONE, FAILED or NOT_APPLICABLE',
    failure_reason VARCHAR(50) NULL COMMENT 'NikshayFailureReason of the latest failure; null unless FAILED',
    error_detail VARCHAR(2000) NULL COMMENT 'Latest error message or note',
    nikshay_id VARCHAR(50) NULL COMMENT 'Ni-kshay ID the phase produced or used',
    episode_id VARCHAR(50) NULL COMMENT 'Episode the phase produced or used',
    last_attempt_at TIMESTAMP NULL,
    is_updated BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Set once the beneficiary data has been corrected',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY idx_nikshay_sync_status_ben_phase (ben_reg_id, phase),
    KEY idx_nikshay_sync_status_phase_status (phase, status)
);
