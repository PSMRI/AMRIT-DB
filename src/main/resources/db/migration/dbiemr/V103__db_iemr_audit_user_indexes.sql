USE db_iemr;

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

-- ---------- eligible_couple_tracking ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'eligible_couple_tracking'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE eligible_couple_tracking
     ADD INDEX idx_eligible_couple_tracking_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_eligible_couple_tracking_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 'eligible_couple_tracking'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE eligible_couple_tracking
     ADD INDEX idx_eligible_couple_tracking_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_eligible_couple_tracking_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_pregnant_woman_register ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pregnant_woman_register'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pregnant_woman_register
     ADD INDEX idx_t_pregnant_woman_register_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pregnant_woman_register_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pregnant_woman_register'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pregnant_woman_register
     ADD INDEX idx_t_pregnant_woman_register_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pregnant_woman_register_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_eligible_couple_register ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eligible_couple_register'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_eligible_couple_register
     ADD INDEX idx_t_eligible_couple_register_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_eligible_couple_register_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_eligible_couple_register'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_eligible_couple_register
     ADD INDEX idx_t_eligible_couple_register_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_eligible_couple_register_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_delivery_outcome ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_delivery_outcome'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_delivery_outcome
     ADD INDEX idx_t_delivery_outcome_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_delivery_outcome_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_delivery_outcome'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_delivery_outcome
     ADD INDEX idx_t_delivery_outcome_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_delivery_outcome_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_infant_register ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_infant_register'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_infant_register
     ADD INDEX idx_t_infant_register_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_infant_register_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_infant_register'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_infant_register
     ADD INDEX idx_t_infant_register_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_infant_register_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_pnc_visit ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pnc_visit'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pnc_visit
     ADD INDEX idx_t_pnc_visit_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pnc_visit_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pnc_visit'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pnc_visit
     ADD INDEX idx_t_pnc_visit_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pnc_visit_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_anc_visit ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_anc_visit
     ADD INDEX idx_t_anc_visit_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_anc_visit_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anc_visit'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_anc_visit
     ADD INDEX idx_t_anc_visit_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_anc_visit_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_child_register ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_child_register'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_child_register
     ADD INDEX idx_t_child_register_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_child_register_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_child_register'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_child_register
     ADD INDEX idx_t_child_register_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_child_register_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_pmsma ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pmsma'
      AND column_name = 'created_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pmsma
     ADD INDEX idx_t_pmsma_created_by (created_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pmsma_created_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pmsma'
      AND column_name = 'updated_by'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pmsma
     ADD INDEX idx_t_pmsma_updated_by (updated_by),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pmsma_updated_by already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_cbacdetails ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_cbacdetails
     ADD INDEX idx_t_cbacdetails_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_cbacdetails'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_cbacdetails
     ADD INDEX idx_t_cbacdetails_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_cbacdetails_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_pnccare ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pnccare'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pnccare
     ADD INDEX idx_t_pnccare_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pnccare_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_pnccare'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_pnccare
     ADD INDEX idx_t_pnccare_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_pnccare_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_anccare ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_anccare
     ADD INDEX idx_t_anccare_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_anccare_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_anccare'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_anccare
     ADD INDEX idx_t_anccare_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_anccare_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_benvisitdetail ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benvisitdetail'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_benvisitdetail
     ADD INDEX idx_t_benvisitdetail_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_benvisitdetail_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_benvisitdetail'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_benvisitdetail
     ADD INDEX idx_t_benvisitdetail_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_benvisitdetail_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------- t_childvaccinedetail1 ----------
SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND column_name = 'CreatedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_childvaccinedetail1
     ADD INDEX idx_t_childvaccinedetail1_createdby (CreatedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_createdby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
      AND table_name = 't_childvaccinedetail1'
      AND column_name = 'ModifiedBy'
      AND seq_in_index = 1
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_childvaccinedetail1
     ADD INDEX idx_t_childvaccinedetail1_modifiedby (ModifiedBy),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_t_childvaccinedetail1_modifiedby already exists or column already indexed'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
