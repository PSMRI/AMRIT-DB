USE db_iemr;

/* =========================================================
   ECD Outbound Call Allocation — Performance Indexes
   Fixes 504 Gateway Timeout on /callAllocation/getEligibleRecordsInfo
   for Child + Self phone type on large production datasets.

   Root cause: 3 sequential COUNT queries each did a full scan of
   t_mctsoutboundcalls (4M+ rows). Existing single-column indexes on
   phoneNumberType (cardinality=2) and ProviderServiceMapID (cardinality=2)
   were skipped by the MySQL optimizer as non-selective.

   Fix: composite indexes that let the optimizer seek directly to the
   matching subset instead of scanning the full table.
   ========================================================= */

-- =========================================================
-- t_mctsoutboundcalls — Child lookup
-- Covers: ProviderServiceMapID + ChildID + phoneNumberType + CallDateTo + CallDateFrom
-- Used by: getChildUnAllocatedCountLR, getChildUnAllocatedCountHR, getTotalAllocatedCountChild
-- =========================================================

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
    AND table_name = 't_mctsoutboundcalls'
    AND index_name = 'idx_outbound_child_lookup'
);

SET @sql = IF(
    @idx_exists = 0,
    'CREATE INDEX idx_outbound_child_lookup ON t_mctsoutboundcalls (ProviderServiceMapID, ChildID, phoneNumberType, CallDateTo, CallDateFrom) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_outbound_child_lookup already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_mctsoutboundcalls — Mother lookup
-- Covers: ProviderServiceMapID + ChildID + MotherID + phoneNumberType + CallDateTo + CallDateFrom
-- Used by: getMotherUnAllocatedCountLR, getMotherUnAllocatedCountHR, getTotalAllocatedCountMother
-- =========================================================

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
    AND table_name = 't_mctsoutboundcalls'
    AND index_name = 'idx_outbound_mother_lookup'
);

SET @sql = IF(
    @idx_exists = 0,
    'CREATE INDEX idx_outbound_mother_lookup ON t_mctsoutboundcalls (ProviderServiceMapID, ChildID, MotherID, phoneNumberType, CallDateTo, CallDateFrom) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_outbound_mother_lookup already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_childvaliddata — Child record count lookup
-- Covers: IsAllocated + Phone_No_of + CreatedDate
-- Used by: childRecordRepo.getRecordCount (introductory count)
-- =========================================================

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
    AND table_name = 't_childvaliddata'
    AND index_name = 'idx_childvalid_count_lookup'
);

SET @sql = IF(
    @idx_exists = 0,
    'CREATE INDEX idx_childvalid_count_lookup ON t_childvaliddata (IsAllocated, Phone_No_of, CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_childvalid_count_lookup already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- t_mothervalidrecord — Mother record count lookup
-- Covers: IsAllocated + PhoneNo_Of_Whom + CreatedDate
-- Used by: motherRecordRepo.getRecordCount (introductory count)
-- =========================================================

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
    AND table_name = 't_mothervalidrecord'
    AND index_name = 'idx_mothervalid_count_lookup'
);

SET @sql = IF(
    @idx_exists = 0,
    'CREATE INDEX idx_mothervalid_count_lookup ON t_mothervalidrecord (IsAllocated, PhoneNo_Of_Whom, CreatedDate) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_mothervalid_count_lookup already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
