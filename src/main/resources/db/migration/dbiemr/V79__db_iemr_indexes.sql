

USE db_iemr;

-- =========================================================
-- eligible_couple_tracking
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='eligible_couple_tracking'
AND index_name='idx_ect_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ect_benid ON eligible_couple_tracking (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ect_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='eligible_couple_tracking'
AND index_name='idx_ect_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ect_createddate ON eligible_couple_tracking (created_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ect_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='eligible_couple_tracking'
AND index_name='idx_ect_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ect_createdby ON eligible_couple_tracking (created_by) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ect_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- high_risk_assess
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='high_risk_assess'
AND index_name='idx_hra_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_hra_createdby ON high_risk_assess (created_by) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_hra_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='high_risk_assess'
AND index_name='idx_hra_userid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_hra_userid ON high_risk_assess (user_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_hra_userid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='high_risk_assess'
AND index_name='idx_hra_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_hra_createddate ON high_risk_assess (created_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_hra_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- m_benhealthidmapping
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='m_benhealthidmapping'
AND index_name='idx_mbhim_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_mbhim_createddate ON m_benhealthidmapping (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_mbhim_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='m_benhealthidmapping'
AND index_name='idx_mbhim_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_mbhim_createdby ON m_benhealthidmapping (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_mbhim_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='m_benhealthidmapping'
AND index_name='idx_mbhim_psmid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_mbhim_psmid ON m_benhealthidmapping (ProviderServiceMapID) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_mbhim_psmid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- non_pregnant_high_risk_assess
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='non_pregnant_high_risk_assess'
AND index_name='idx_nphra_visitdate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_nphra_visitdate ON non_pregnant_high_risk_assess (visit_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_nphra_visitdate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='non_pregnant_high_risk_assess'
AND index_name='idx_nphra_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_nphra_benid ON non_pregnant_high_risk_assess (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_nphra_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='non_pregnant_high_risk_assess'
AND index_name='idx_nphra_userid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_nphra_userid ON non_pregnant_high_risk_assess (user_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_nphra_userid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- non_pregnant_high_risk_track
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='non_pregnant_high_risk_track'
AND index_name='idx_nphrt_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_nphrt_benid ON non_pregnant_high_risk_track (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_nphrt_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='non_pregnant_high_risk_track'
AND index_name='idx_nphrt_userid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_nphrt_userid ON non_pregnant_high_risk_track (user_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_nphrt_userid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='non_pregnant_high_risk_track'
AND index_name='idx_nphrt_visitdate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_nphrt_visitdate ON non_pregnant_high_risk_track (visit_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_nphrt_visitdate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- pregnant_high_risk_assess
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='pregnant_high_risk_assess'
AND index_name='idx_phra_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_phra_benid ON pregnant_high_risk_assess (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_phra_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='pregnant_high_risk_assess'
AND index_name='idx_phra_userid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_phra_userid ON pregnant_high_risk_assess (user_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_phra_userid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='pregnant_high_risk_assess'
AND index_name='idx_phra_visitdate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_phra_visitdate ON pregnant_high_risk_assess (visit_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_phra_visitdate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


/* =========================================================
   FLYWAY MYSQL 8 INDEX CREATION SCRIPT
   DB : db_iemr
   SAFE IF INDEX ALREADY EXISTS
   USING:
   CREATE INDEX ... ALGORITHM=INPLACE LOCK=NONE
   ========================================================= */

USE db_iemr;

-- =========================================================
-- pregnant_high_risk_track
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='pregnant_high_risk_track'
AND index_name='idx_phrt_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_phrt_benid ON pregnant_high_risk_track (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_phrt_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='pregnant_high_risk_track'
AND index_name='idx_phrt_visitdate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_phrt_visitdate ON pregnant_high_risk_track (visit_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_phrt_visitdate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='pregnant_high_risk_track'
AND index_name='idx_phrt_userid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_phrt_userid ON pregnant_high_risk_track (user_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_phrt_userid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_anc_visit
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_anc_visit'
AND index_name='idx_tav_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tav_createdby ON t_anc_visit (created_by) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tav_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_anc_visit'
AND index_name='idx_tav_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tav_createddate ON t_anc_visit (created_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tav_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_anc_visit'
AND index_name='idx_tav_visitdate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tav_visitdate ON t_anc_visit (visit_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tav_visitdate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_cdr
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_cdr'
AND index_name='idx_tcdr_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcdr_benid ON t_cdr (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcdr_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_cdr'
AND index_name='idx_tcdr_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcdr_createddate ON t_cdr (created_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcdr_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_cdr'
AND index_name='idx_tcdr_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcdr_createdby ON t_cdr (created_by) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcdr_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_mdsr
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_mdsr'
AND index_name='idx_tmdsr_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tmdsr_benid ON t_mdsr (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tmdsr_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_mdsr'
AND index_name='idx_tmdsr_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tmdsr_createdby ON t_mdsr (created_by) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tmdsr_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_mdsr'
AND index_name='idx_tmdsr_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tmdsr_createddate ON t_mdsr (created_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tmdsr_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_child_register
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_child_register'
AND index_name='idx_tcr_benid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcr_benid ON t_child_register (ben_id) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcr_benid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_child_register'
AND index_name='idx_tcr_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcr_createdby ON t_child_register (created_by) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcr_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_child_register'
AND index_name='idx_tcr_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcr_createddate ON t_child_register (created_date) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcr_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_childoptionalvaccinedetail
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_childoptionalvaccinedetail'
AND index_name='idx_tcovd_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcovd_createdby ON t_childoptionalvaccinedetail (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcovd_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_childoptionalvaccinedetail'
AND index_name='idx_tcovd_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcovd_createddate ON t_childoptionalvaccinedetail (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcovd_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_childvaccinedetail2
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_childvaccinedetail2'
AND index_name='idx_tcvd2_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcvd2_createdby ON t_childvaccinedetail2 (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcvd2_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_iemr'
AND table_name='t_childvaccinedetail2'
AND index_name='idx_tcvd2_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_tcvd2_createddate ON t_childvaccinedetail2 (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_tcvd2_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
