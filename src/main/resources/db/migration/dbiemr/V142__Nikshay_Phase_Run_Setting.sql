USE db_iemr;

CREATE TABLE IF NOT EXISTS nikshay_phase_run_setting (
  phase VARCHAR(20) NOT NULL PRIMARY KEY COMMENT 'ENROLMENT, XRAY_UPLOAD, NAAT_UPLOAD, CONTACTS or TRANSFER_OUT',
  run_mode VARCHAR(20) NOT NULL COMMENT 'AUTOMATIC or MANUAL',
  updated_by VARCHAR(50) NULL COMMENT 'Username of the last change',
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT IGNORE INTO nikshay_phase_run_setting (phase, run_mode, updated_by) VALUES
  ('ENROLMENT', 'MANUAL', 'system'),
  ('XRAY_UPLOAD', 'MANUAL', 'system'),
  ('NAAT_UPLOAD', 'MANUAL', 'system'),
  ('CONTACTS', 'MANUAL', 'system'),
  ('TRANSFER_OUT', 'MANUAL', 'system');
