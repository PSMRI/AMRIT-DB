-- =============================================================================
-- Down-sync : CENTRAL setup                     ** RUN ONCE ON THE CENTRAL DB **

-- Central holds DownSynced / DownSyncDate / DownSyncFailureReason. It does NOT
-- need LastDownSyncDate or CentralID - those belong to a van
-- =============================================================================


ALTER TABLE db_identity.i_beneficiarydetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiarydetails (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiaryaddress
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiaryaddress (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiarycontacts
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiarycontacts (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiaryaccount
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiaryaccount (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiaryconsent
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiaryconsent (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiaryimage
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiaryimage (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiarymapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiarymapping (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiaryfamilymapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiaryfamilymapping (VanID, DownSynced);
ALTER TABLE db_identity.i_beneficiaryidentity
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiaryidentity (VanID, DownSynced);
ALTER TABLE db_identity.m_beneficiaryregidmapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_m_beneficiaryregidmapping (VanID, DownSynced);