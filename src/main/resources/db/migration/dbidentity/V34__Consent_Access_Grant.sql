-- Consent Manager (DPDPA) - doctor access grants for Consent-API feature 003.
-- Proposal: Consent-API/docs/proposal/consent-manager-proposal.md section 5 (cm_access_grant).
-- Additive and idempotent: CREATE TABLE IF NOT EXISTS only; no existing table is changed.
-- Not an append-only table, so it carries CreatedBy/CreatedDate/ModifiedBy/LastModDate/Deleted.

USE db_identity;

CREATE TABLE IF NOT EXISTS cm_access_grant (
  grant_id               CHAR(36)     NOT NULL,
  beneficiary_reg_id     BIGINT       NOT NULL,
  grant_type             VARCHAR(15)  NOT NULL,
  grantee_user_id        BIGINT       NOT NULL,
  grantee_name           VARCHAR(100) NOT NULL,
  grantee_facility_id    INT          NULL,
  purposes               VARCHAR(255) NOT NULL,
  reason                 VARCHAR(255) NOT NULL,
  days                   INT          NOT NULL,
  status                 VARCHAR(10)  NOT NULL,
  valid_until            DATETIME(3)  NULL,
  approved_at            DATETIME(3)  NULL,
  approved_by            BIGINT       NULL,
  approval_masked_phone  VARCHAR(20)  NULL,
  revoked_at             DATETIME(3)  NULL,
  reviewed_by            BIGINT       NULL,
  revoke_reason          VARCHAR(20)  NULL,
  requested_by           BIGINT       NOT NULL,
  request_key            CHAR(36)     NOT NULL,
  request_hash           CHAR(64)     NOT NULL,
  CreatedBy              VARCHAR(50)  NOT NULL,
  CreatedDate            DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy             VARCHAR(50)  NULL,
  LastModDate            DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted                BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (grant_id),
  UNIQUE KEY uk_cm_access_grant_request (requested_by, request_key),
  KEY idx_cm_access_grant_ben (beneficiary_reg_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
