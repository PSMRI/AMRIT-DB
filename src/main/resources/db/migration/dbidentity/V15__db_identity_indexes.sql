
USE db_identity;

-- =========================================================
-- i_beneficiarydetails_rmnch
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_beneficiarydetails_rmnch'
AND index_name='idx_ibd_rmnch_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibd_rmnch_createdby ON i_beneficiarydetails_rmnch (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibd_rmnch_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_beneficiarydetails_rmnch'
AND index_name='idx_ibd_rmnch_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibd_rmnch_createddate ON i_beneficiarydetails_rmnch (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibd_rmnch_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_beneficiarydetails_rmnch'
AND index_name='idx_ibd_rmnch_ProServicemapid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibd_rmnch_ProServicemapid ON i_beneficiarydetails_rmnch (ProviderServiceMapID) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibd_rmnch_ProServicemapid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- i_beneficiarydetails
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_beneficiarydetails'
AND index_name='idx_ibd_DOB'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibd_DOB ON i_beneficiarydetails (DOB) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibd_DOB already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- i_bornbirthdeatils
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_bornbirthdeatils'
AND index_name='idx_ibbd_beneficiaryid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibbd_beneficiaryid ON i_bornbirthdeatils (beneficiaryId) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibbd_beneficiaryid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_bornbirthdeatils'
AND index_name='idx_ibbd_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibbd_createddate ON i_bornbirthdeatils (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibbd_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_bornbirthdeatils'
AND index_name='idx_ibbd_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ibbd_createdby ON i_bornbirthdeatils (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ibbd_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- i_cbac_additional_details
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_cbac_additional_details'
AND index_name='idx_icad_cbacdetailsid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_icad_cbacdetailsid ON i_cbac_additional_details (cbacDetailsId) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_icad_cbacdetailsid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_cbac_additional_details'
AND index_name='idx_icad_filleddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_icad_filleddate ON i_cbac_additional_details (filledDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_icad_filleddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- i_householddetails
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_householddetails'
AND index_name='idx_ihd_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ihd_createddate ON i_householddetails (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ihd_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_householddetails'
AND index_name='idx_ihd_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ihd_createdby ON i_householddetails (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ihd_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_householddetails'
AND index_name='idx_ihd_psmid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_ihd_psmid ON i_householddetails (ProviderServiceMapID) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_ihd_psmid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- i_cbacdetails
-- =========================================================

SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_cbacdetails'
AND index_name='idx_icbac_createddate'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_icbac_createddate ON i_cbacdetails (CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_icbac_createddate already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_cbacdetails'
AND index_name='idx_icbac_createdby'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_icbac_createdby ON i_cbacdetails (CreatedBy) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_icbac_createdby already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @idx_exists = (
SELECT COUNT(*) FROM information_schema.statistics
WHERE table_schema='db_identity'
AND table_name='i_cbacdetails'
AND index_name='idx_icbac_psmid'
);

SET @sql = IF(
@idx_exists = 0,
'CREATE INDEX idx_icbac_psmid ON i_cbacdetails (ProviderServiceMapID) ALGORITHM=INPLACE LOCK=NONE',
'SELECT ''idx_icbac_psmid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



