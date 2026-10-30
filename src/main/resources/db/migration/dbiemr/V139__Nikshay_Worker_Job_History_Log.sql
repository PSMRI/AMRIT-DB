USE db_iemr;

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
