USE db_iemr;

SET @tbl_exists = (SELECT COUNT(*) FROM information_schema.tables
                   WHERE table_schema = 'db_iemr' AND table_name = 'm_synctabledetail');

SET @sync_id = NULL;
SET @sql = IF(@tbl_exists > 0,
"SELECT MIN(SyncTableDetailID) INTO @sync_id FROM db_iemr.m_synctabledetail
  WHERE TableName = 'tb_confirmed_cases'
    AND VanColumnName NOT LIKE '%side_effects%'
    AND ServerColumnName NOT LIKE '%side_effects%'",
"SELECT 'm_synctabledetail does not exist - side_effects sync registration skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = IF(@sync_id IS NOT NULL,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',side_effects'),
        ServerColumnName = CONCAT(ServerColumnName, ',side_effects')
  WHERE SyncTableDetailID = @sync_id",
"SELECT 'tb_confirmed_cases sync row missing or side_effects already registered - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
