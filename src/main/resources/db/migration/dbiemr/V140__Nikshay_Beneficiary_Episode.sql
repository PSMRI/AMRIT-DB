USE db_iemr;

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
