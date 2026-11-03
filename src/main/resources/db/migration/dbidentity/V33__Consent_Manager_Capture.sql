-- Consent Manager (DPDPA) - consent capture tables for Consent-API feature 002.
-- Proposal: Consent-API/docs/proposal/consent-manager-proposal.md section 5.
-- Additive and idempotent: CREATE TABLE IF NOT EXISTS only; no existing table is changed.
-- cm_consent, cm_consent_purpose and cm_audit_log are append-only and carry no soft-delete
-- audit columns; every other table carries CreatedBy/CreatedDate/ModifiedBy/LastModDate/Deleted.

USE db_identity;

CREATE TABLE IF NOT EXISTS cm_purpose (
  purpose_id        BIGINT       NOT NULL AUTO_INCREMENT,
  purpose_code      VARCHAR(20)  NOT NULL,
  version           INT          NOT NULL,
  name              VARCHAR(200) NOT NULL,
  description       TEXT         NULL,
  legal_basis       VARCHAR(100) NULL,
  is_mandatory      BIT(1)       NOT NULL,
  is_withdrawable   BIT(1)       NOT NULL,
  validity_days     INT          NULL,
  is_active         BIT(1)       NOT NULL DEFAULT b'1',
  CreatedBy         VARCHAR(50)  NOT NULL,
  CreatedDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy        VARCHAR(50)  NULL,
  LastModDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted           BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (purpose_id),
  UNIQUE KEY uk_cm_purpose_code_version (purpose_code, version)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cm_notice (
  notice_version_id BIGINT       NOT NULL AUTO_INCREMENT,
  notice_code       VARCHAR(50)  NOT NULL,
  version_no        INT          NOT NULL,
  context           VARCHAR(20)  NOT NULL,
  is_material       BIT(1)       NOT NULL DEFAULT b'0',
  status            VARCHAR(20)  NOT NULL,
  approved_by       VARCHAR(50)  NULL,
  published_at      DATETIME(3)  NULL,
  CreatedBy         VARCHAR(50)  NOT NULL,
  CreatedDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy        VARCHAR(50)  NULL,
  LastModDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted           BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (notice_version_id),
  UNIQUE KEY uk_cm_notice_code_version (notice_code, version_no),
  KEY idx_cm_notice_context_status (context, status, version_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cm_notice_translation (
  translation_id    BIGINT       NOT NULL AUTO_INCREMENT,
  notice_version_id BIGINT       NOT NULL,
  language_code     VARCHAR(10)  NOT NULL,
  language_name     VARCHAR(50)  NOT NULL,
  body              TEXT         NOT NULL,
  data_items        TEXT         NULL,
  retention         TEXT         NULL,
  recipients        TEXT         NULL,
  withdrawal_info   TEXT         NULL,
  grievance_info    TEXT         NULL,
  text_hash         CHAR(64)     NOT NULL,
  audio_ref         VARCHAR(255) NULL,
  helpline_script   TEXT         NULL,
  CreatedBy         VARCHAR(50)  NOT NULL,
  CreatedDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy        VARCHAR(50)  NULL,
  LastModDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted           BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (translation_id),
  UNIQUE KEY uk_cm_notice_translation_lang (notice_version_id, language_code),
  CONSTRAINT fk_cm_notice_translation_notice FOREIGN KEY (notice_version_id)
    REFERENCES cm_notice (notice_version_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cm_notice_purpose (
  notice_version_id BIGINT       NOT NULL,
  purpose_code      VARCHAR(20)  NOT NULL,
  display_rank      INT          NOT NULL,
  CreatedBy         VARCHAR(50)  NOT NULL,
  CreatedDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy        VARCHAR(50)  NULL,
  LastModDate       DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted           BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (notice_version_id, purpose_code),
  CONSTRAINT fk_cm_notice_purpose_notice FOREIGN KEY (notice_version_id)
    REFERENCES cm_notice (notice_version_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- One row per consent event. Append-only.
CREATE TABLE IF NOT EXISTS cm_consent (
  consent_id               CHAR(36)     NOT NULL,
  beneficiary_reg_id       BIGINT       NULL,
  event_type               VARCHAR(20)  NOT NULL,
  consenting_party         VARCHAR(10)  NOT NULL,
  notice_version_id        BIGINT       NOT NULL,
  language_code            VARCHAR(10)  NOT NULL,
  text_hash                CHAR(64)     NOT NULL,
  channel                  VARCHAR(20)  NOT NULL,
  mode                     VARCHAR(20)  NULL,
  captured_by              BIGINT       NOT NULL,
  provider_service_map_id  INT          NULL,
  facility_id              INT          NULL,
  service_point_id         INT          NULL,
  service_line             VARCHAR(30)  NULL,
  device_id                VARCHAR(100) NOT NULL,
  call_id                  VARCHAR(100) NULL,
  captured_at              DATETIME(3)  NOT NULL,
  server_received_at       DATETIME(3)  NOT NULL,
  capture_time_flagged     BIT(1)       NOT NULL DEFAULT b'0',
  sync_status              VARCHAR(12)  NOT NULL,
  project_id               INT          NULL,
  config_version           INT          NULL,
  request_key              CHAR(36)     NOT NULL,
  request_hash             CHAR(64)     NOT NULL,
  PRIMARY KEY (consent_id),
  UNIQUE KEY uk_cm_consent_request (captured_by, request_key),
  KEY idx_cm_consent_beneficiary (beneficiary_reg_id),
  CONSTRAINT fk_cm_consent_notice FOREIGN KEY (notice_version_id)
    REFERENCES cm_notice (notice_version_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Decision per purpose. Only the supersede step changes a row (is_current, status).
CREATE TABLE IF NOT EXISTS cm_consent_purpose (
  consent_purpose_id  BIGINT       NOT NULL AUTO_INCREMENT,
  consent_id          CHAR(36)     NOT NULL,
  beneficiary_reg_id  BIGINT       NULL,
  purpose_code        VARCHAR(20)  NOT NULL,
  decision            VARCHAR(5)   NOT NULL,
  status              VARCHAR(20)  NOT NULL,
  version_no          INT          NOT NULL,
  is_current          BIT(1)       NOT NULL,
  valid_until         DATETIME(3)  NULL,
  current_key         VARCHAR(60)  GENERATED ALWAYS AS (
                        IF(is_current = b'1' AND beneficiary_reg_id IS NOT NULL,
                           CONCAT(beneficiary_reg_id, ':', purpose_code), NULL)) STORED,
  PRIMARY KEY (consent_purpose_id),
  UNIQUE KEY uk_cm_consent_purpose_current (current_key),
  KEY idx_cm_consent_purpose_ben (beneficiary_reg_id, purpose_code),
  KEY idx_cm_consent_purpose_consent (consent_id),
  CONSTRAINT fk_cm_consent_purpose_consent FOREIGN KEY (consent_id)
    REFERENCES cm_consent (consent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cm_consent_evidence (
  evidence_id           CHAR(36)     NOT NULL,
  consent_id            CHAR(36)     NULL,
  type                  VARCHAR(25)  NOT NULL,
  file_ref              VARCHAR(255) NULL,
  sha256                CHAR(64)     NULL,
  content_type          VARCHAR(100) NULL,
  size_bytes            BIGINT       NULL,
  duration_sec          DECIMAL(8,2) NULL,
  witness_name          VARCHAR(512) NULL,
  witness_relationship  VARCHAR(50)  NULL,
  otp_status            VARCHAR(20)  NULL,
  masked_phone          VARCHAR(20)  NULL,
  call_id               VARCHAR(100) NULL,
  uploaded_by           BIGINT       NOT NULL,
  request_key           CHAR(36)     NULL,
  request_hash          CHAR(64)     NULL,
  created_at            DATETIME(3)  NOT NULL,
  CreatedBy             VARCHAR(50)  NOT NULL,
  CreatedDate           DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy            VARCHAR(50)  NULL,
  LastModDate           DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted               BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (evidence_id),
  UNIQUE KEY uk_cm_consent_evidence_request (uploaded_by, request_key),
  KEY idx_cm_consent_evidence_consent (consent_id),
  CONSTRAINT fk_cm_consent_evidence_consent FOREIGN KEY (consent_id)
    REFERENCES cm_consent (consent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cm_guardian_link (
  guardian_link_id     BIGINT       NOT NULL AUTO_INCREMENT,
  consent_id           CHAR(36)     NOT NULL,
  beneficiary_reg_id   BIGINT       NULL,
  guardian_type        VARCHAR(25)  NOT NULL,
  guardian_name        VARCHAR(512) NOT NULL,
  guardian_phone       VARCHAR(512) NULL,
  relationship         VARCHAR(50)  NOT NULL,
  verification_method  VARCHAR(15)  NOT NULL,
  verified_at          DATETIME(3)  NULL,
  follow_up_required   BIT(1)       NOT NULL DEFAULT b'0',
  valid_until          DATETIME(3)  NULL,
  CreatedBy            VARCHAR(50)  NOT NULL,
  CreatedDate          DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy           VARCHAR(50)  NULL,
  LastModDate          DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted              BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (guardian_link_id),
  KEY idx_cm_guardian_link_ben (beneficiary_reg_id),
  CONSTRAINT fk_cm_guardian_link_consent FOREIGN KEY (consent_id)
    REFERENCES cm_consent (consent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Hash-chained, append-only audit log. The application user must have no UPDATE/DELETE
-- rights on it (grant script: docs/consent/cm_audit_log_grants.sql, applied by DevOps).
CREATE TABLE IF NOT EXISTS cm_audit_log (
  id                  BIGINT       NOT NULL AUTO_INCREMENT,
  action              VARCHAR(30)  NOT NULL,
  consent_id          CHAR(36)     NULL,
  beneficiary_reg_id  BIGINT       NULL,
  purpose             VARCHAR(255) NULL,
  status              VARCHAR(20)  NULL,
  initiator           BIGINT       NULL,
  source_ip           VARCHAR(45)  NULL,
  created_at          DATETIME(3)  NOT NULL,
  prev_hash           CHAR(64)     NOT NULL,
  entry_hash          CHAR(64)     NOT NULL,
  PRIMARY KEY (id),
  KEY idx_cm_audit_log_consent (consent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Genesis row of the hash chain, inserted once.
INSERT INTO cm_audit_log (action, created_at, prev_hash, entry_hash)
SELECT 'GENESIS', UTC_TIMESTAMP(3), REPEAT('0', 64), SHA2('GENESIS', 256)
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM cm_audit_log);
