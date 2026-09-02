
-- =============================================================================
-- Down-sync : VAN setup                    ** RUN ONCE ON EACH LAPTOP / VAN DB **

-- A van holds two columns central does not:
--   LastDownSyncDate - when this row was last received
--   CentralID        - the row's primary key AT CENTRAL. This is the key the
--                      down-sync matches on, which leaves VanSerialNo free to
--                      keep its meaning everywhere else in the application:
--                      "my own primary key".
-- =============================================================================

ALTER TABLE db_iemr.t_benvisitdetail
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benvisitdetail (CentralID, VanID);
ALTER TABLE db_iemr.t_phy_anthropometry
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_phy_anthropometry (CentralID, VanID);
ALTER TABLE db_iemr.t_phy_vitals
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_phy_vitals (CentralID, VanID);
ALTER TABLE db_iemr.t_benadherence
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benadherence (CentralID, VanID);
ALTER TABLE db_iemr.t_anccare
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_anccare (CentralID, VanID);
ALTER TABLE db_iemr.t_pnccare
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_pnccare (CentralID, VanID);
ALTER TABLE db_iemr.t_ncdscreening
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_ncdscreening (CentralID, VanID);
ALTER TABLE db_iemr.t_ncdcare
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_ncdcare (CentralID, VanID);
ALTER TABLE db_iemr.t_phy_generalexam
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_phy_generalexam (CentralID, VanID);
ALTER TABLE db_iemr.t_phy_headtotoe
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_phy_headtotoe (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_obstetric
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_obstetric (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_gastrointestinal
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_gastrointestinal (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_cardiovascular
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_cardiovascular (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_respiratory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_respiratory (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_centralnervous
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_centralnervous (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_musculoskeletalsystem
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_musculoskeletalsystem (CentralID, VanID);
ALTER TABLE db_iemr.t_sys_genitourinarysystem
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_sys_genitourinarysystem (CentralID, VanID);
ALTER TABLE db_iemr.t_ancdiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_ancdiagnosis (CentralID, VanID);
ALTER TABLE db_iemr.t_ncddiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_ncddiagnosis (CentralID, VanID);
ALTER TABLE db_iemr.t_pncdiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_pncdiagnosis (CentralID, VanID);
ALTER TABLE db_iemr.t_benchiefcomplaint
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benchiefcomplaint (CentralID, VanID);
ALTER TABLE db_iemr.t_benclinicalobservation
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benclinicalobservation (CentralID, VanID);
ALTER TABLE db_iemr.t_prescription
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_prescription (CentralID, VanID);
ALTER TABLE db_iemr.t_prescribeddrug
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_prescribeddrug (CentralID, VanID);
ALTER TABLE db_iemr.t_lab_testorder
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_lab_testorder (CentralID, VanID);
ALTER TABLE db_iemr.t_benreferdetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benreferdetails (CentralID, VanID);
ALTER TABLE db_iemr.t_lab_testresult
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_lab_testresult (CentralID, VanID);
ALTER TABLE db_iemr.t_physicalstockentry
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_physicalstockentry (CentralID, VanID);
ALTER TABLE db_iemr.t_patientissue
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_patientissue (CentralID, VanID);
ALTER TABLE db_iemr.t_facilityconsumption
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_facilityconsumption (CentralID, VanID);
ALTER TABLE db_iemr.t_itemstockentry
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_itemstockentry (CentralID, VanID);
ALTER TABLE db_iemr.t_itemstockexit
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_itemstockexit (CentralID, VanID);
ALTER TABLE db_iemr.t_benmedhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benmedhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_femaleobstetrichistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_femaleobstetrichistory (CentralID, VanID);
ALTER TABLE db_iemr.t_benmenstrualdetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benmenstrualdetails (CentralID, VanID);
ALTER TABLE db_iemr.t_benpersonalhabit
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benpersonalhabit (CentralID, VanID);
ALTER TABLE db_iemr.t_childvaccinedetail1
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_childvaccinedetail1 (CentralID, VanID);
ALTER TABLE db_iemr.t_childvaccinedetail2
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_childvaccinedetail2 (CentralID, VanID);
ALTER TABLE db_iemr.t_childoptionalvaccinedetail
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_childoptionalvaccinedetail (CentralID, VanID);
ALTER TABLE db_iemr.t_ancwomenvaccinedetail
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_ancwomenvaccinedetail (CentralID, VanID);
ALTER TABLE db_iemr.t_childfeedinghistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_childfeedinghistory (CentralID, VanID);
ALTER TABLE db_iemr.t_benallergyhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benallergyhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_bencomorbiditycondition
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_bencomorbiditycondition (CentralID, VanID);
ALTER TABLE db_iemr.t_benmedicationhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benmedicationhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_benfamilyhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_benfamilyhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_perinatalhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_perinatalhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_developmenthistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_developmenthistory (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerfamilyhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerfamilyhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerpersonalhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerpersonalhistory (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerdiethistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerdiethistory (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerobstetrichistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerobstetrichistory (CentralID, VanID);
ALTER TABLE db_iemr.t_cancervitals
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancervitals (CentralID, VanID);
ALTER TABLE db_iemr.t_cancersignandsymptoms
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancersignandsymptoms (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerlymphnode
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerlymphnode (CentralID, VanID);
ALTER TABLE db_iemr.t_canceroralexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_canceroralexamination (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerbreastexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerbreastexamination (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerabdominalexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerabdominalexamination (CentralID, VanID);
ALTER TABLE db_iemr.t_cancergynecologicalexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancergynecologicalexamination (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerdiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerdiagnosis (CentralID, VanID);
ALTER TABLE db_iemr.t_cancerimageannotation
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_cancerimageannotation (CentralID, VanID);
ALTER TABLE db_iemr.t_stockadjustment
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_stockadjustment (CentralID, VanID);
ALTER TABLE db_iemr.t_stocktransfer
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_stocktransfer (CentralID, VanID);
ALTER TABLE db_iemr.t_patientreturn
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_patientreturn (CentralID, VanID);
ALTER TABLE db_iemr.t_indent
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_indent (CentralID, VanID);
ALTER TABLE db_iemr.t_indentissue
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_indentissue (CentralID, VanID);
ALTER TABLE db_iemr.t_indentorder
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_indentorder (CentralID, VanID);
ALTER TABLE db_iemr.t_saitemmapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_t_saitemmapping (CentralID, VanID);
ALTER TABLE db_iemr.tb_stoptb_general_opd
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_tb_stoptb_general_opd (CentralID, vanID);
ALTER TABLE db_iemr.tb_stoptb_general_examination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_tb_stoptb_general_examination (CentralID, vanID);
ALTER TABLE db_iemr.tb_screening
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN vanID                 INT          NULL COMMENT 'the van this record belongs to - the down-sync filters on it',
    ADD COLUMN vanSerialNo           BIGINT       NULL COMMENT 'this row primary key on the van it came from',
    ADD COLUMN last_mod_date         DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync',
    ADD INDEX idx_downsync_centralid_tb_screening (CentralID, vanID);
ALTER TABLE db_iemr.tb_stoptb_diagnostics
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_tb_stoptb_diagnostics (CentralID, vanID);
ALTER TABLE db_iemr.tb_suspected
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN vanID                 INT          NULL COMMENT 'the van this record belongs to - the down-sync filters on it',
    ADD COLUMN vanSerialNo           BIGINT       NULL COMMENT 'this row primary key on the van it came from',
    ADD COLUMN last_mod_date         DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync',
    ADD INDEX idx_downsync_centralid_tb_suspected (CentralID, vanID);
ALTER TABLE db_iemr.tb_confirmed_cases
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN vanID                 INT          NULL COMMENT 'the van this record belongs to - the down-sync filters on it',
    ADD COLUMN vanSerialNo           BIGINT       NULL COMMENT 'this row primary key on the van it came from',
    ADD COLUMN last_mod_date         DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync',
    ADD INDEX idx_downsync_centralid_tb_confirmed_cases (CentralID, vanID);
ALTER TABLE db_iemr.tb_diagnostic_order
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_tb_diagnostic_order (CentralID, vanID);
ALTER TABLE db_iemr.tb_diagnostic_result
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_tb_diagnostic_result (CentralID, vanID);
ALTER TABLE db_iemr.tb_diagnostic_document
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_tb_diagnostic_document (CentralID, vanID);
ALTER TABLE db_identity.i_beneficiarydetails_rmnch
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_beneficiarydetails_rmnch (CentralID, VanID);
ALTER TABLE db_identity.i_householddetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD INDEX idx_downsync_centralid_i_householddetails (CentralID, VanID);
ALTER TABLE db_iemr.tb_stoptb_visit
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN last_mod_date         DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync',
    ADD INDEX idx_downsync_centralid_tb_stoptb_visit (CentralID, vanID);
ALTER TABLE db_iemr.t_form_response
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN LastModDate           DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept',
    ADD INDEX idx_downsync_centralid_t_form_response (CentralID, vanID);
ALTER TABLE db_iemr.t_section_response
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN LastModDate           DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept',
    ADD INDEX idx_downsync_centralid_t_section_response (CentralID, vanID);
ALTER TABLE db_iemr.t_question_response
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N',
    ADD COLUMN DownSyncDate          DATETIME     NULL,
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL,
    ADD COLUMN LastDownSyncDate      DATETIME     NULL COMMENT 'when this row was last received from central',
    ADD COLUMN CentralID             BIGINT       NULL COMMENT 'primary key of this row in the central DB',
    ADD COLUMN LastModDate           DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept',
    ADD INDEX idx_downsync_centralid_t_question_response (CentralID, vanID);

UPDATE db_iemr.t_form_response    SET LastModDate = COALESCE(updatedAt, createdAt) WHERE LastModDate IS NULL;
UPDATE db_iemr.t_section_response SET LastModDate = savedAt WHERE LastModDate IS NULL AND savedAt IS NOT NULL;
UPDATE db_iemr.t_question_response q
  JOIN db_iemr.t_section_response s ON s.sectionResponseId = q.sectionResponseId
   SET q.LastModDate = s.LastModDate
 WHERE q.LastModDate IS NULL AND s.LastModDate IS NOT NULL;
