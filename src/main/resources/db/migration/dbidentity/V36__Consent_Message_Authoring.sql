-- Consent Manager (DPDPA) - Admin consent message authoring, front-end APIs A6-A8 (Consent-API feature 006).
-- Spec: Consent-API/specs/006-consent-message-authoring (data-model.md).
-- Additive and idempotent: columns are added through an information_schema guard; the new table uses
-- CREATE TABLE IF NOT EXISTS. No column is dropped or renamed. No personal data is added.
-- Drafts, published and retired versions use the existing cm_notice rows (status DRAFT / PUBLISHED / RETIRED).

USE db_identity;

-- Adds one column to a cm_ table when it is missing.
DROP PROCEDURE IF EXISTS cm_v36_add_column;
DELIMITER $$
CREATE PROCEDURE cm_v36_add_column(IN p_table VARCHAR(64), IN p_column VARCHAR(64), IN p_definition VARCHAR(255))
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

-- cm_notice_translation: languages produced by machine translation, and the English version they came from.
CALL cm_v36_add_column('cm_notice_translation', 'machine_translated', 'BIT(1) NOT NULL DEFAULT b''0''');
CALL cm_v36_add_column('cm_notice_translation', 'source_version', 'INT NULL');

DROP PROCEDURE IF EXISTS cm_v36_add_column;

-- One row per draft save or publish, for idempotent replay (Idempotency-Key scoped to the user).
CREATE TABLE IF NOT EXISTS cm_notice_request (
  request_id         BIGINT       NOT NULL AUTO_INCREMENT,
  actor_user_id      BIGINT       NOT NULL,
  request_key        CHAR(36)     NOT NULL,
  request_hash       CHAR(64)     NOT NULL,
  action             VARCHAR(10)  NOT NULL,
  notice_version_id  BIGINT       NOT NULL,
  CreatedBy          VARCHAR(50)  NOT NULL,
  CreatedDate        DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ModifiedBy         VARCHAR(50)  NULL,
  LastModDate        DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  Deleted            BIT(1)       NOT NULL DEFAULT b'0',
  PRIMARY KEY (request_id),
  UNIQUE KEY uk_cm_notice_request (actor_user_id, request_key),
  CONSTRAINT fk_cm_notice_request_notice FOREIGN KEY (notice_version_id)
    REFERENCES cm_notice (notice_version_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
