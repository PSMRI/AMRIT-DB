-- =============================================================================
-- Down-sync : VAN setup                    ** RUN ONCE ON EACH LAPTOP / VAN DB **

-- A van holds two columns central does not:
--   LastDownSyncDate - when this row was last received
--   CentralID        - the row's primary key AT CENTRAL. This is the key the
--                      down-sync matches on, which leaves VanSerialNo free to
--                      keep its meaning everywhere else in the application:
--                      "my own primary key".
-- =============================================================================

ALTER TABLE db_identity.i_beneficiarydetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiarydetails (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiaryaddress
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiaryaddress (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiarycontacts
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiarycontacts (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiaryaccount
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiaryaccount (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiaryconsent
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiaryconsent (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiaryimage
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiaryimage (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiarymapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiarymapping (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiaryfamilymapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiaryfamilymapping (CentralID, VanID);
ALTER TABLE db_identity.i_beneficiaryidentity
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiaryidentity (CentralID, VanID);
ALTER TABLE db_identity.m_beneficiaryregidmapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_m_beneficiaryregidmapping (CentralID, VanID);