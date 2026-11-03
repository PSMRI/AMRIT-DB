USE db_iemr;
 
SET @idx_exists = (

    SELECT COUNT(*)

    FROM information_schema.statistics

    WHERE table_schema = 'db_iemr'

      AND table_name = 't_mctsoutboundcalls'

      AND index_name = 'idx_mcts_eligible_v2'

);
 
SET @sql = IF(

    @idx_exists = 0,

    'ALTER TABLE t_mctsoutboundcalls

     ADD INDEX idx_mcts_eligible_v2

     (ProviderServiceMapID, phoneNumberType, AllocationStatus, ChildID, CallDateTo),

     ALGORITHM=INPLACE,

     LOCK=NONE',

    'SELECT ''idx_mcts_eligible_v2 already exists'''

);
 
PREPARE stmt FROM @sql;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;
 