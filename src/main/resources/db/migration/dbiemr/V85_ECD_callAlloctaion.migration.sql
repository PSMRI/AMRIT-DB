USE db_iemr;

/* =========================================================
   ECD Outbound Call Allocation — Restructure idx_mcts_eligible_v2
   Related fix: 504 Gateway Timeout on /callAllocation/getEligibleRecordsInfo

   Root cause of bad index performance:
   Original column order started with ChildID (IS NOT NULL = range condition),
   causing MySQL to stop at column 1 and scan 2M+ rows. Columns
   ProviderServiceMapID and phoneNumberType were never reached by the optimizer.

   Fix: reorder columns so equality filters come first, range columns last.
   New order: ProviderServiceMapID → phoneNumberType → AllocationStatus → ChildID → CallDateTo
   This lets MySQL seek to the exact PSM+phoneType+allocationStatus subset
   (~19K rows) before applying the ChildID range filter.
   ========================================================= */

-- =========================================================
-- Step 1: Drop existing idx_mcts_eligible_v2 if it exists
-- =========================================================

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
    AND table_name = 't_mctsoutboundcalls'
    AND index_name = 'idx_mcts_eligible_v2'
);

SET @sql = IF(
    @idx_exists > 0,
    'ALTER TABLE t_mctsoutboundcalls DROP INDEX idx_mcts_eligible_v2',
    'SELECT ''idx_mcts_eligible_v2 does not exist, skipping drop'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================================
-- Step 2: Recreate idx_mcts_eligible_v2 with optimal column order
-- Covers: ProviderServiceMapID (equality) → phoneNumberType (equality) →
--         AllocationStatus (equality) → ChildID (IS NOT NULL range) → CallDateTo (range)
-- Used by: getChildUnAllocatedCountLR, getChildUnAllocatedCountHR, getTotalAllocatedCountChild
-- =========================================================

SET @idx_exists = (
    SELECT COUNT(*) FROM information_schema.statistics
    WHERE table_schema = 'db_iemr'
    AND table_name = 't_mctsoutboundcalls'
    AND index_name = 'idx_mcts_eligible_v2'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD INDEX idx_mcts_eligible_v2 (ProviderServiceMapID, phoneNumberType, AllocationStatus, ChildID, CallDateTo) ALGORITHM=INPLACE LOCK=NONE',
    'SELECT ''idx_mcts_eligible_v2 already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;