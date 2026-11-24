-- Consent Manager (DPDPA) - Admin legacy consent upload, front-end APIs A9-A10 (Consent-API feature 008).
-- Spec: Consent-API/specs/008-legacy-consent-upload (data-model.md).
-- Additive and idempotent: new tables use CREATE TABLE IF NOT EXISTS; the index is added through an
-- information_schema guard. Nothing existing is changed.
-- Personal data: cm_legacy_row.representative_name and remarks are stored encrypted by Consent-API; the
-- 12-digit beneficiary_id is HMAC-hashed by the anonymiser.

USE db_identity;

-- One uploaded legacy file: checked (A9), then imported once (A10).
CREATE TABLE IF NOT EXISTS cm_legacy_batch (
  batch_id             CHAR(36)     NOT NULL,
  file_name            VARCHAR(255) NULL,
  service_provider_id  INT          NULL,
  status               VARCHAR(10)  NOT NULL,
  total                INT          NOT NULL DEFAULT 0,
  valid                INT          NOT NULL DEFAULT 0,
  imported             INT          NOT NULL DEFAULT 0,
  skipped              INT          NOT NULL DEFAULT 0,
  failed               INT          NOT NULL DEFAULT 0,
  uploaded_by_user_id  BIGINT       NOT NULL,
  uploaded_by          VARCHAR(50)  NOT NULL,
  uploaded_at          DATETIME(3)  NOT NULL,
  imported_by          VARCHAR(50)  NULL,
  imported_at          DATETIME(3)  NULL,
  expires_at           DATETIME(3)  NOT NULL,
  request_key          CHAR(36)     NOT NULL,
  request_hash         CHAR(64)     NOT NULL,
  import_request_key   CHAR(36)     NULL,
  import_request_hash  CHAR(64)     NULL,
  CreatedBy            VARCHAR(50)  NOT NULL,
  CreatedDate          DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy           VARCHAR(50)  NULL,
  LastModDate          DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted              BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (batch_id),
  UNIQUE KEY uk_cm_legacy_batch_request (uploaded_by_user_id, request_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- One row of a legacy file, with its check result and, after import, the consent it became.
CREATE TABLE IF NOT EXISTS cm_legacy_row (
  row_id                       BIGINT       NOT NULL AUTO_INCREMENT,
  batch_id                     CHAR(36)     NOT NULL,
  row_no                       INT          NOT NULL,
  beneficiary_id               VARCHAR(20)  NULL,
  beneficiary_reg_id           BIGINT       NULL,
  consent_date                 DATE         NULL,
  purposes                     VARCHAR(255) NULL,
  language_code                VARCHAR(10)  NULL,
  mode                         VARCHAR(20)  NULL,
  representative_name          VARCHAR(512) NULL,
  representative_relationship  VARCHAR(50)  NULL,
  remarks                      TEXT         NULL,
  status                       VARCHAR(10)  NOT NULL,
  reasons                      VARCHAR(500) NULL,
  consent_id                   CHAR(36)     NULL,
  CreatedBy                    VARCHAR(50)  NOT NULL,
  CreatedDate                  DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy                   VARCHAR(50)  NULL,
  LastModDate                  DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted                      BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (row_id),
  UNIQUE KEY uk_cm_legacy_row_batch_row (batch_id, row_no),
  CONSTRAINT fk_cm_legacy_row_batch FOREIGN KEY (batch_id)
    REFERENCES cm_legacy_batch (batch_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ALREADY_IMPORTED lookups by patient and consent date.
DROP PROCEDURE IF EXISTS cm_v37_add_index;
DELIMITER $$
CREATE PROCEDURE cm_v37_add_index()
BEGIN
  IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
      WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'cm_legacy_row'
        AND INDEX_NAME = 'ix_cm_legacy_row_ben_date') = 0 THEN
    ALTER TABLE db_identity.cm_legacy_row
      ADD INDEX ix_cm_legacy_row_ben_date (beneficiary_reg_id, consent_date, status);
  END IF;
END$$
DELIMITER ;

CALL cm_v37_add_index();

DROP PROCEDURE IF EXISTS cm_v37_add_index;
