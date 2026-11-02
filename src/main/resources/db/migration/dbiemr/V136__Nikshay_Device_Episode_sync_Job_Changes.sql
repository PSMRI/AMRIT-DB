USE db_iemr;

CREATE TABLE IF NOT EXISTS m_nikshay_device_configuration (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_serial_number VARCHAR(50) NOT NULL COMMENT 'Serial number of the camp device',
    device_name VARCHAR(10) NOT NULL COMMENT 'NAAT or XRAY',
    phi_user_id VARCHAR(100) NOT NULL COMMENT 'Ni-kshay user ID of the device PHI',
    password VARCHAR(512) NOT NULL COMMENT 'AES-GCM encrypted, Base64',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_by VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(50) NULL,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    more_data JSON NULL COMMENT 'Extra details, e.g. vendor reference, remarks',
    UNIQUE KEY uk_nikshay_device_serial_number (device_serial_number)
);

CREATE TABLE IF NOT EXISTS m_nikshay_device_village_mapping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_detail_id INT NOT NULL COMMENT 'm_nikshay_device_configuration.id',
    state_id INT COMMENT 'm_nikshay_state.NikshayStateID',
    district_id INT COMMENT 'm_nikshay_district.NikshayDistrictID',
    tbu_id INT COMMENT 'm_nikshay_tu.NikshayTUID',
    facility_id INT COMMENT 'm_nikshay_facility.NikshayFacilityID',
    village_id INT NOT NULL COMMENT 'm_nikshay_village.NikshayVillageID',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_by VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(50) NULL,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    more_data JSON NULL,
    KEY idx_nikshay_dvm_village_active (village_id, is_active),
    KEY idx_nikshay_dvm_device (device_detail_id),
    CONSTRAINT fk_nikshay_dvm_device FOREIGN KEY (device_detail_id) REFERENCES m_nikshay_device_configuration(id)
);

CREATE TABLE IF NOT EXISTS m_nikshay_transfer_out_phi_village_mapping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    village_id INT NOT NULL COMMENT 'm_nikshay_village.NikshayVillageID',
    tbu_id INT NOT NULL COMMENT 'm_nikshay_tu.NikshayTUID',
    designated_phi_id VARCHAR(50) NOT NULL COMMENT 'Designated PHI ID',
    designation_hierarchy_id VARCHAR(50) NULL COMMENT 'Ni-kshay hierarchy ID of the designated PHI (optional)',
    status VARCHAR(10) NOT NULL DEFAULT 'active' COMMENT 'active / inactive',
    created_by VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(50) NULL,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY idx_nikshay_tophi_village_phi (village_id, designated_phi_id, status),
    KEY idx_nikshay_tophi_tbu (tbu_id)
);

CREATE TABLE IF NOT EXISTS nikshay_worker_job_history_log (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ben_id BIGINT NULL COMMENT 'BenRegId; null only if the identity record had not synced',
    episode_id VARCHAR(50) NULL COMMENT 'Ni-kshay episode ID, when applicable',
    phase VARCHAR(30) NOT NULL COMMENT 'NIKSHAY_ID_GENERATION, NAAT, NAAT_RIF, XRAY, CONTACT_TPT, TRANSFER_OUT',
    reference_id VARCHAR(100) NULL COMMENT 'What the row is about, e.g. tb_diagnostic_order.external_order_id for NAAT / X-ray',
    status VARCHAR(10) NOT NULL COMMENT 'SUCCESS or FAILED (held is FAILED with its reason)',
    reason VARCHAR(50) NULL COMMENT 'BRD failure reason code; null on success',
    message VARCHAR(1000) NULL COMMENT 'Error or validation detail, or a short success note',
    request_payload LONGTEXT NULL COMMENT 'JSON sent to Ni-kshay on a failed call',
    response_body LONGTEXT NULL COMMENT 'Ni-kshay''s full answer (HTTP status and body) on a failed call',
    job_run_id VARCHAR(36) NULL COMMENT 'Run that wrote the row',
    trigger_type VARCHAR(10) NULL COMMENT 'JOB or MANUAL',
    triggered_by VARCHAR(50) NULL COMMENT 'User who started a manual push',
    attempt INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY idx_nikshay_jhl_ben_phase_ref (ben_id, phase, reference_id, id),
    KEY idx_nikshay_jhl_status_phase (status, phase, created_at),
    KEY idx_nikshay_jhl_run (job_run_id)
);

CREATE TABLE IF NOT EXISTS nikshay_beneficiary_episode (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    beneficiary_id BIGINT NULL COMMENT 'BeneficiaryID (db_identity.m_beneficiaryregidmapping); null if not found',
    ben_reg_id BIGINT NOT NULL COMMENT 'BenRegId',
    nikshay_id VARCHAR(50) NOT NULL COMMENT 'The person''s Ni-kshay ID (parent ID when a new episode was created)',
    episode_id VARCHAR(50) NOT NULL COMMENT 'Episode to use for tests, contacts and transfer; same as nikshay_id unless a new episode was created',
    link_status VARCHAR(20) NOT NULL COMMENT 'NEW, LINKED, NEW_EPISODE or LINKED_NO_ACTION',
    flow_scenario VARCHAR(20) NOT NULL COMMENT 'POSITIVE (TB-positive index patient or their contact) or ALL_NEGATIVE (household all screened, all X-rays normal)',
    stage_found VARCHAR(100) NULL COMMENT 'Stage of the existing Ni-kshay record at the duplicate check; null when none',
    device_id INT NULL COMMENT 'm_nikshay_device_configuration.id of the NAAT device that enrolled',
    created_by VARCHAR(50) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY idx_nikshay_ben_episode_ben_reg (ben_reg_id, id),
    KEY idx_nikshay_ben_episode_episode (episode_id)
);

CREATE TABLE IF NOT EXISTS nikshay_beneficiary_phase_status (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ben_reg_id BIGINT NOT NULL COMMENT 'BenRegId',
    beneficiary_id BIGINT NULL COMMENT 'BeneficiaryID (db_identity.m_beneficiaryregidmapping); null if not found',
    beneficiary_type VARCHAR(20) NOT NULL COMMENT 'INDEX, CONTACT or ALL_NEGATIVE',
    index_ben_reg_id BIGINT NULL COMMENT 'For a CONTACT: BenRegId of their index patient',
    phase VARCHAR(20) NOT NULL COMMENT 'ENROLMENT, CONTACTS, XRAY_UPLOAD, NAAT_UPLOAD or TRANSFER_OUT',
    status VARCHAR(20) NOT NULL COMMENT 'PENDING, IN_PROGRESS, DONE, FAILED or NOT_APPLICABLE',
    failure_reason VARCHAR(50) NULL COMMENT 'NikshayFailureReason of the latest failure; null unless FAILED',
    error_detail VARCHAR(2000) NULL COMMENT 'Latest error message (FAILED) or note (PENDING / NOT_APPLICABLE / DONE)',
    attempts INT NOT NULL DEFAULT 0 COMMENT 'Times the phase was tried',
    nikshay_id VARCHAR(50) NULL COMMENT 'Ni-kshay ID the phase produced or used',
    episode_id VARCHAR(50) NULL COMMENT 'Episode the phase produced or used',
    last_attempt_at TIMESTAMP NULL,
    completed_at TIMESTAMP NULL COMMENT 'When the phase became DONE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_nikshay_phase_status_ben_phase (ben_reg_id, phase),
    KEY idx_nikshay_phase_status_phase_status (phase, status),
    KEY idx_nikshay_phase_status_status_reason (status, failure_reason),
    KEY idx_nikshay_phase_status_index (index_ben_reg_id)
);

CREATE TABLE IF NOT EXISTS nikshay_phase_run_setting (
    phase VARCHAR(20) NOT NULL PRIMARY KEY COMMENT 'ENROLMENT, XRAY_UPLOAD, NAAT_UPLOAD, CONTACTS or TRANSFER_OUT',
    run_mode VARCHAR(20) NOT NULL COMMENT 'AUTOMATIC or MANUAL',
    updated_by VARCHAR(50) NULL COMMENT 'Username of the last change',
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT IGNORE INTO nikshay_phase_run_setting (phase, run_mode, updated_by)
SELECT p.phase, 'MANUAL', 'system'
FROM (
    SELECT 'ENROLMENT' AS phase
    UNION ALL SELECT 'XRAY_UPLOAD'
    UNION ALL SELECT 'NAAT_UPLOAD'
    UNION ALL SELECT 'CONTACTS'
    UNION ALL SELECT 'TRANSFER_OUT'
) AS p;
