-- ==========================================================
-- Diagnostic device integration schema for db_iemr
-- Run against your local MySQL:
-- mysql -u root -p db_iemr < diagnostic_order_schema.sql
--
-- Purpose:
-- Creates all database tables required for diagnostic device
-- integration.
--
-- Safe to execute multiple times because CREATE TABLE IF NOT
-- EXISTS will skip table creation if the table already exists.
--
-- Note:
-- This script only creates new tables. It does NOT modify an
-- existing table if its schema differs. Future schema changes
-- should be handled through separate ALTER TABLE migration scripts.
-- ==========================================================

USE db_iemr;

-- ==========================================================
-- Stores diagnostic order details sent to external providers.
-- One record represents one diagnostic order.
-- ==========================================================
CREATE TABLE IF NOT EXISTS tb_diagnostic_order (
    id BIGINT NOT NULL AUTO_INCREMENT,
    order_event VARCHAR(100) NULL,
    ben_reg_id BIGINT NULL,
    provider_service_name VARCHAR(50) NULL,
    provider_code VARCHAR(50) NULL,
    order_type VARCHAR(20) NULL,
    external_order_id VARCHAR(100) NULL,
    provider_order_id VARCHAR(100) NULL,
    status VARCHAR(20) NULL,
    retry_count INT NULL DEFAULT 0,
    last_polled_at DATETIME NULL,
    test_completed_at DATETIME NULL,
    error_message TEXT NULL,
    reason_for_refusal TEXT NULL,
    push_response_json LONGTEXT NULL,
    patient_first_name VARCHAR(100) NULL,
    patient_last_name VARCHAR(100) NULL,
    patient_date_of_birth VARCHAR(10) NULL,
    patient_sex VARCHAR(10) NULL,
    created_by VARCHAR(100) NULL,
    created_date DATETIME NOT NULL,
    modified_by VARCHAR(100) NULL,
    last_mod_date DATETIME NULL,
    deleted BIT NOT NULL DEFAULT 0,

    -- Sync/Common Fields
    vanID INT NULL,
    parkingPlaceID INT NULL,
    visitCode BIGINT NULL,
    processed VARCHAR(1) NOT NULL DEFAULT 'N',
    vanSerialNo BIGINT NULL,
    SyncedDate DATETIME NULL,
    Syncedby VARCHAR(50) NULL,
    SyncFailureReason TEXT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_diagnostic_order_ben_visit_type (ben_reg_id, visitCode, order_type),
    UNIQUE KEY uk_diagnostic_order_external_order_id (external_order_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Stores diagnostic results received for an order.
-- Each diagnostic order can have one result.
-- ==========================================================
CREATE TABLE IF NOT EXISTS tb_diagnostic_result (
    id BIGINT NOT NULL AUTO_INCREMENT,
    diagnostic_order_id BIGINT NOT NULL,
    ben_reg_id BIGINT NULL,
    provider_status VARCHAR(20) NULL,
    result_summary TEXT NULL,
    raw_response_json LONGTEXT NULL,
    tb_presence BIT NULL,
    tb_confidence DOUBLE NULL,
    drug_resistance_presence BIT NULL,
    created_by VARCHAR(100) NULL,
    created_date DATETIME NOT NULL,
    modified_by VARCHAR(100) NULL,
    last_mod_date DATETIME NULL,
    deleted BIT NOT NULL DEFAULT 0,

    -- Sync/Common Fields
    vanID INT NULL,
    parkingPlaceID INT NULL,
    processed VARCHAR(1) NOT NULL DEFAULT 'N',
    vanSerialNo BIGINT NULL,
    SyncedDate DATETIME NULL,
    Syncedby VARCHAR(50) NULL,
    SyncFailureReason TEXT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_diagnostic_result_order_id (diagnostic_order_id),
    CONSTRAINT fk_diagnostic_result_order
    FOREIGN KEY (diagnostic_order_id)
    REFERENCES tb_diagnostic_order (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Stores documents/assets associated with diagnostic results
-- such as reports, PDFs, images, etc.
-- ==========================================================
CREATE TABLE IF NOT EXISTS tb_diagnostic_document (
    id BIGINT NOT NULL AUTO_INCREMENT,
    diagnostic_order_id BIGINT NULL,
    ben_reg_id BIGINT NULL,
    order_type VARCHAR(20) NULL,
    asset_type VARCHAR(50) NULL,
    document_type VARCHAR(30) NULL,
    epoch_time BIGINT NULL,
    stored_file_name VARCHAR(150) NULL,
    stored_path VARCHAR(255) NULL,
    sha256_hash VARCHAR(64) NULL,
    content_type VARCHAR(100) NULL,
    original_file_name VARCHAR(255) NULL,
    created_by VARCHAR(100) NULL,
    created_date DATETIME NOT NULL,
    modified_by VARCHAR(100) NULL,
    last_mod_date DATETIME NULL,
    deleted BIT NOT NULL DEFAULT 0,

    -- Sync/Common Fields
    vanID INT NULL,
    parkingPlaceID INT NULL,
    processed VARCHAR(1) NOT NULL DEFAULT 'N',
    vanSerialNo BIGINT NULL,
    SyncedDate DATETIME NULL,
    Syncedby VARCHAR(50) NULL,
    SyncFailureReason TEXT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_diagnostic_document_order_doctype (diagnostic_order_id, document_type),
    KEY idx_diagnostic_document_ben_reg_id (ben_reg_id),
    KEY idx_diagnostic_document_order_type (order_type),
    KEY idx_diagnostic_document_epoch_time (epoch_time),
    CONSTRAINT fk_diagnostic_document_order
    FOREIGN KEY (diagnostic_order_id)
    REFERENCES tb_diagnostic_order (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================================================
-- Stores authentication tokens used for communicating with
-- external diagnostic providers.
-- ==========================================================
CREATE TABLE IF NOT EXISTS tb_diagnostic_provider_token (
    id BIGINT NOT NULL AUTO_INCREMENT,
    provider_code VARCHAR(50) NOT NULL,
    token_type VARCHAR(20) NOT NULL,
    token_value TEXT NOT NULL,
    expires_at DATETIME NULL,
    created_date DATETIME NOT NULL,
    last_mod_date DATETIME NULL,

    -- Sync/Common Fields
    vanID INT NULL,
    parkingPlaceID INT NULL,
    processed VARCHAR(1) NOT NULL DEFAULT 'N',
    vanSerialNo BIGINT NULL,
    SyncedDate DATETIME NULL,
    Syncedby VARCHAR(50) NULL,
    SyncFailureReason TEXT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_diagnostic_provider_token_code_type (provider_code, token_type)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;