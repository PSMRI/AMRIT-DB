
-- =============================================================================
-- Down-sync : CENTRAL setup                     ** RUN ONCE ON THE CENTRAL DB **

-- Central holds DownSynced / DownSyncDate / DownSyncFailureReason. It does NOT
-- need LastDownSyncDate or CentralID - those belong to a van
-- =============================================================================

ALTER TABLE db_iemr.t_benvisitdetail
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benvisitdetail (VanID, DownSynced);
ALTER TABLE db_iemr.t_phy_anthropometry
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_phy_anthropometry (VanID, DownSynced);
ALTER TABLE db_iemr.t_phy_vitals
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_phy_vitals (VanID, DownSynced);
ALTER TABLE db_iemr.t_benadherence
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benadherence (VanID, DownSynced);
ALTER TABLE db_iemr.t_anccare
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_anccare (VanID, DownSynced);
ALTER TABLE db_iemr.t_pnccare
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_pnccare (VanID, DownSynced);
ALTER TABLE db_iemr.t_ncdscreening
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_ncdscreening (VanID, DownSynced);
ALTER TABLE db_iemr.t_ncdcare
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_ncdcare (VanID, DownSynced);
ALTER TABLE db_iemr.t_phy_generalexam
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_phy_generalexam (VanID, DownSynced);
ALTER TABLE db_iemr.t_phy_headtotoe
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_phy_headtotoe (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_obstetric
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_obstetric (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_gastrointestinal
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_gastrointestinal (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_cardiovascular
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_cardiovascular (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_respiratory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_respiratory (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_centralnervous
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_centralnervous (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_musculoskeletalsystem
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_musculoskeletalsystem (VanID, DownSynced);
ALTER TABLE db_iemr.t_sys_genitourinarysystem
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_sys_genitourinarysystem (VanID, DownSynced);
ALTER TABLE db_iemr.t_ancdiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_ancdiagnosis (VanID, DownSynced);
ALTER TABLE db_iemr.t_ncddiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_ncddiagnosis (VanID, DownSynced);
ALTER TABLE db_iemr.t_pncdiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_pncdiagnosis (VanID, DownSynced);
ALTER TABLE db_iemr.t_benchiefcomplaint
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benchiefcomplaint (VanID, DownSynced);
ALTER TABLE db_iemr.t_benclinicalobservation
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benclinicalobservation (VanID, DownSynced);
ALTER TABLE db_iemr.t_prescription
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_prescription (VanID, DownSynced);
ALTER TABLE db_iemr.t_prescribeddrug
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_prescribeddrug (VanID, DownSynced);
ALTER TABLE db_iemr.t_lab_testorder
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_lab_testorder (VanID, DownSynced);
ALTER TABLE db_iemr.t_benreferdetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benreferdetails (VanID, DownSynced);
ALTER TABLE db_iemr.t_lab_testresult
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_lab_testresult (VanID, DownSynced);
ALTER TABLE db_iemr.t_physicalstockentry
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_physicalstockentry (VanID, DownSynced);
ALTER TABLE db_iemr.t_patientissue
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_patientissue (VanID, DownSynced);
ALTER TABLE db_iemr.t_facilityconsumption
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_facilityconsumption (VanID, DownSynced);
ALTER TABLE db_iemr.t_itemstockentry
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_itemstockentry (VanID, DownSynced);
ALTER TABLE db_iemr.t_itemstockexit
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_itemstockexit (VanID, DownSynced);
ALTER TABLE db_iemr.t_benmedhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benmedhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_femaleobstetrichistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_femaleobstetrichistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_benmenstrualdetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benmenstrualdetails (VanID, DownSynced);
ALTER TABLE db_iemr.t_benpersonalhabit
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benpersonalhabit (VanID, DownSynced);
ALTER TABLE db_iemr.t_childvaccinedetail1
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_childvaccinedetail1 (VanID, DownSynced);
ALTER TABLE db_iemr.t_childvaccinedetail2
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_childvaccinedetail2 (VanID, DownSynced);
ALTER TABLE db_iemr.t_childoptionalvaccinedetail
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_childoptionalvaccinedetail (VanID, DownSynced);
ALTER TABLE db_iemr.t_ancwomenvaccinedetail
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_ancwomenvaccinedetail (VanID, DownSynced);
ALTER TABLE db_iemr.t_childfeedinghistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_childfeedinghistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_benallergyhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benallergyhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_bencomorbiditycondition
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_bencomorbiditycondition (VanID, DownSynced);
ALTER TABLE db_iemr.t_benmedicationhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benmedicationhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_benfamilyhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_benfamilyhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_perinatalhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_perinatalhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_developmenthistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_developmenthistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerfamilyhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerfamilyhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerpersonalhistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerpersonalhistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerdiethistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerdiethistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerobstetrichistory
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerobstetrichistory (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancervitals
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancervitals (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancersignandsymptoms
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancersignandsymptoms (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerlymphnode
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerlymphnode (VanID, DownSynced);
ALTER TABLE db_iemr.t_canceroralexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_canceroralexamination (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerbreastexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerbreastexamination (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerabdominalexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerabdominalexamination (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancergynecologicalexamination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancergynecologicalexamination (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerdiagnosis
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerdiagnosis (VanID, DownSynced);
ALTER TABLE db_iemr.t_cancerimageannotation
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_cancerimageannotation (VanID, DownSynced);
ALTER TABLE db_iemr.t_stockadjustment
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_stockadjustment (VanID, DownSynced);
ALTER TABLE db_iemr.t_stocktransfer
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_stocktransfer (VanID, DownSynced);
ALTER TABLE db_iemr.t_patientreturn
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_patientreturn (VanID, DownSynced);
ALTER TABLE db_iemr.t_indent
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_indent (VanID, DownSynced);
ALTER TABLE db_iemr.t_indentissue
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_indentissue (VanID, DownSynced);
ALTER TABLE db_iemr.t_indentorder
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_indentorder (VanID, DownSynced);
ALTER TABLE db_iemr.t_saitemmapping
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_t_saitemmapping (VanID, DownSynced);
ALTER TABLE db_iemr.tb_stoptb_general_opd
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_stoptb_general_opd (vanID, DownSynced);
ALTER TABLE db_iemr.tb_stoptb_general_examination
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_stoptb_general_examination (vanID, DownSynced);
ALTER TABLE db_iemr.tb_screening
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_screening (vanID, DownSynced);
ALTER TABLE db_iemr.tb_stoptb_diagnostics
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_stoptb_diagnostics (vanID, DownSynced);
ALTER TABLE db_iemr.tb_suspected
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_suspected (vanID, DownSynced);
ALTER TABLE db_iemr.tb_confirmed_cases
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_confirmed_cases (vanID, DownSynced);
ALTER TABLE db_iemr.tb_diagnostic_order
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_diagnostic_order (vanID, DownSynced);
ALTER TABLE db_iemr.tb_diagnostic_result
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_diagnostic_result (vanID, DownSynced);
ALTER TABLE db_iemr.tb_diagnostic_document
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_diagnostic_document (vanID, DownSynced);
ALTER TABLE db_identity.i_beneficiarydetails_rmnch
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_beneficiarydetails_rmnch (VanID, DownSynced);
ALTER TABLE db_identity.i_householddetails
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_i_householddetails (VanID, DownSynced);
ALTER TABLE db_iemr.tb_stoptb_visit
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD INDEX idx_downsync_tb_stoptb_visit (vanID, DownSynced);
ALTER TABLE db_iemr.t_form_response
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD COLUMN LastModDate           DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept',
    ADD INDEX idx_downsync_t_form_response (vanID, DownSynced);
ALTER TABLE db_iemr.t_section_response
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD COLUMN LastModDate           DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept',
    ADD INDEX idx_downsync_t_section_response (vanID, DownSynced);
ALTER TABLE db_iemr.t_question_response
    ADD COLUMN DownSynced            CHAR(1)      NOT NULL DEFAULT 'N' COMMENT 'N never sent / P delivered / U update pending / F conflict',
    ADD COLUMN DownSyncDate          DATETIME     NULL COMMENT 'when last delivered to a van',
    ADD COLUMN DownSyncFailureReason VARCHAR(255) NULL COMMENT 'CONFLICT, or the failure detail',
    ADD COLUMN LastModDate           DATETIME     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'maintained by MySQL - dates a change for the sync; V87 gave this table updatedAt/savedAt, which resolveLastModColumn does not accept',
    ADD INDEX idx_downsync_t_question_response (vanID, DownSynced);

UPDATE db_iemr.t_form_response    SET LastModDate = COALESCE(updatedAt, createdAt) WHERE LastModDate IS NULL;
UPDATE db_iemr.t_section_response SET LastModDate = savedAt WHERE LastModDate IS NULL AND savedAt IS NOT NULL;
UPDATE db_iemr.t_question_response q
  JOIN db_iemr.t_section_response s ON s.sectionResponseId = q.sectionResponseId
   SET q.LastModDate = s.LastModDate
 WHERE q.LastModDate IS NULL AND s.LastModDate IS NOT NULL;
