USE db_identity;

-- =====================================================================
-- Indexes supporting the Admin-API username rename.
--
-- CreatedBy/ModifiedBy hold the username as a denormalised string, so a
-- rename has to sweep every row attributing work to the old name. Without
-- an index each of those statements is a full table scan; on the larger
-- beneficiary and visit tables that timed out behind nginx and, worse,
-- would hold row locks for the duration of the rename transaction.
--
-- One single-column index per audit column: the rename filters on exactly
-- one of them per statement, so composite indexes would not help.
--
-- Guarded on column rather than index name so a differently-named index
-- already covering the column is not duplicated. ALGORITHM=INPLACE with
-- LOCK=NONE keeps the tables writable while these are built.
-- =====================================================================

-- ---------- i_beneficiarydetails_rmnch ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarydetails_rmnch'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails_rmnch
     ADD INDEX idx_i_beneficiarydetails_rmnch_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarydetails_rmnch_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarydetails_rmnch'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails_rmnch
     ADD INDEX idx_i_beneficiarydetails_rmnch_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarydetails_rmnch_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiaryfamilymapping ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryfamilymapping'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping
     ADD INDEX idx_i_beneficiaryfamilymapping_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryfamilymapping_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryfamilymapping'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryfamilymapping
     ADD INDEX idx_i_beneficiaryfamilymapping_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryfamilymapping_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiarydetails ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarydetails'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails
     ADD INDEX idx_i_beneficiarydetails_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarydetails_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarydetails'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarydetails
     ADD INDEX idx_i_beneficiarydetails_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarydetails_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiarymapping ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarymapping'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarymapping
     ADD INDEX idx_i_beneficiarymapping_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarymapping_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarymapping'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarymapping
     ADD INDEX idx_i_beneficiarymapping_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarymapping_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiaryidentity ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryidentity'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryidentity
     ADD INDEX idx_i_beneficiaryidentity_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryidentity_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryidentity'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryidentity
     ADD INDEX idx_i_beneficiaryidentity_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryidentity_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_householddetails ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_householddetails'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_householddetails
     ADD INDEX idx_i_householddetails_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_householddetails_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_householddetails'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_householddetails
     ADD INDEX idx_i_householddetails_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_householddetails_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiaryimage ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryimage'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryimage
     ADD INDEX idx_i_beneficiaryimage_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryimage_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryimage'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryimage
     ADD INDEX idx_i_beneficiaryimage_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryimage_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiaryaddress ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryaddress'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryaddress
     ADD INDEX idx_i_beneficiaryaddress_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryaddress_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryaddress'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryaddress
     ADD INDEX idx_i_beneficiaryaddress_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryaddress_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiaryservicemapping ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryservicemapping'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryservicemapping
     ADD INDEX idx_i_beneficiaryservicemapping_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryservicemapping_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryservicemapping'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryservicemapping
     ADD INDEX idx_i_beneficiaryservicemapping_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryservicemapping_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- m_beneficiaryregidmapping ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'm_beneficiaryregidmapping'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping
     ADD INDEX idx_m_beneficiaryregidmapping_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_m_beneficiaryregidmapping_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'm_beneficiaryregidmapping'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping
     ADD INDEX idx_m_beneficiaryregidmapping_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_m_beneficiaryregidmapping_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_bornbirthdeatils ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_bornbirthdeatils'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_bornbirthdeatils
     ADD INDEX idx_i_bornbirthdeatils_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_bornbirthdeatils_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_bornbirthdeatils'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_bornbirthdeatils
     ADD INDEX idx_i_bornbirthdeatils_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_bornbirthdeatils_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiarycontacts ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarycontacts'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarycontacts
     ADD INDEX idx_i_beneficiarycontacts_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarycontacts_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiarycontacts'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiarycontacts
     ADD INDEX idx_i_beneficiarycontacts_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiarycontacts_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_beneficiaryconsent ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryconsent'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryconsent
     ADD INDEX idx_i_beneficiaryconsent_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryconsent_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_beneficiaryconsent'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_beneficiaryconsent
     ADD INDEX idx_i_beneficiaryconsent_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_beneficiaryconsent_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- i_benfamilytag ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_benfamilytag'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_benfamilytag
     ADD INDEX idx_i_benfamilytag_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_benfamilytag_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'i_benfamilytag'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE i_benfamilytag
     ADD INDEX idx_i_benfamilytag_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_i_benfamilytag_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
