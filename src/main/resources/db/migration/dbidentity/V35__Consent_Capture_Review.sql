-- Consent Manager (DPDPA) - MMU consent capture, front-end review changes (Consent-API feature 004).
-- Spec: Consent-API/specs/004-capture-review-changes (data-model.md).
-- Additive and idempotent: every column and index is added through an information_schema guard;
-- the new table uses CREATE TABLE IF NOT EXISTS. No column is dropped or renamed.
-- cm_consent_notification is not append-only, so it carries CreatedBy/CreatedDate/ModifiedBy/
-- LastModDate/Deleted. Its phone is encrypted by Consent-API; no masked copy is stored.

USE db_identity;

-- Adds one column to a cm_ table when it is missing.
DROP PROCEDURE IF EXISTS cm_v35_add_column;
DELIMITER $$
CREATE PROCEDURE cm_v35_add_column(IN p_table VARCHAR(64), IN p_column VARCHAR(64), IN p_definition VARCHAR(255))
BEGIN
  IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
      WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = p_table AND COLUMN_NAME = p_column) = 0 THEN
    SET @sql := CONCAT('ALTER TABLE db_identity.', p_table, ' ADD COLUMN ', p_column, ' ', p_definition);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END IF;
END$$
DELIMITER ;

-- cm_notice: project notices and the grievance officer's official contact.
CALL cm_v35_add_column('cm_notice', 'project_id', 'INT NULL');
CALL cm_v35_add_column('cm_notice', 'grievance_officer_name', 'VARCHAR(100) NULL');
CALL cm_v35_add_column('cm_notice', 'grievance_phone', 'VARCHAR(20) NULL');
CALL cm_v35_add_column('cm_notice', 'grievance_email', 'VARCHAR(100) NULL');
CALL cm_v35_add_column('cm_notice', 'grievance_address', 'VARCHAR(500) NULL');
CALL cm_v35_add_column('cm_notice', 'grievance_office_hours', 'VARCHAR(100) NULL');

-- cm_notice_translation: declarations per language.
CALL cm_v35_add_column('cm_notice_translation', 'declaration', 'TEXT NULL');
CALL cm_v35_add_column('cm_notice_translation', 'representative_declaration', 'TEXT NULL');

-- cm_consent_evidence: the declaration agreed to (evidence type DECLARATION).
CALL cm_v35_add_column('cm_consent_evidence', 'declaration_text', 'TEXT NULL');
CALL cm_v35_add_column('cm_consent_evidence', 'declaration_wording', 'VARCHAR(20) NULL');
CALL cm_v35_add_column('cm_consent_evidence', 'declaration_app_default', 'BIT(1) NULL');

DROP PROCEDURE IF EXISTS cm_v35_add_column;

-- Index for "latest published notice for a context and project".
SET @idx_exists := (
  SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = 'db_identity' AND TABLE_NAME = 'cm_notice' AND INDEX_NAME = 'ix_cm_notice_ctx_project'
);
SET @sql := IF(@idx_exists = 0,
  'CREATE INDEX ix_cm_notice_ctx_project ON db_identity.cm_notice (context, project_id, status, version_no)',
  'SELECT "Index ix_cm_notice_ctx_project already exists"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- One SMS notification per consent (FR-015 to FR-018).
CREATE TABLE IF NOT EXISTS cm_consent_notification (
  notification_id  BIGINT       NOT NULL AUTO_INCREMENT,
  consent_id       VARCHAR(36)  NOT NULL,
  channel          VARCHAR(10)  NOT NULL,
  phone            VARCHAR(512) NOT NULL,
  status           VARCHAR(15)  NOT NULL,
  attempted_at     DATETIME(3)  NULL,
  CreatedBy        VARCHAR(50)  NOT NULL,
  CreatedDate      DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy       VARCHAR(50)  NULL,
  LastModDate      DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted          BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (notification_id),
  UNIQUE KEY uk_cm_consent_notification_consent (consent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
