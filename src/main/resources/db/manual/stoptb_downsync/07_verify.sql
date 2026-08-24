-- =============================================================================
-- StopTB down-sync : verification.  READ-ONLY.
--
--   mysql -h <host> -u <user> -p --force --table < 07_verify.sql
--
-- Use --force: a check that runs before its object exists fails with "doesn't
-- exist", and without --force the client stops at the first one.
--
-- Run this on the central DB and on the laptop DB and compare the outputs.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. Every configured table carries the four down-sync columns.
-- -----------------------------------------------------------------------------
SELECT '1. down-sync columns' AS check_name, scope.sch AS schema_name,
       COUNT(*) AS tables_in_scope,
       SUM(IFNULL(cols.found,0) = 4) AS complete,
       SUM(IFNULL(cols.found,0) <> 4) AS incomplete,
       IF(SUM(IFNULL(cols.found,0) <> 4) = 0, 'PASS', 'FAIL - see check 2') AS result
FROM (SELECT DISTINCT LOWER(TRIM(SchemaName)) sch, LOWER(TRIM(TableName)) tbl
      FROM db_iemr.m_synctabledetail
      WHERE IFNULL(Deleted,b'0') = b'0' AND TableName IS NOT NULL AND SchemaName IS NOT NULL) scope
JOIN information_schema.TABLES t
  ON LOWER(t.TABLE_SCHEMA) = scope.sch AND LOWER(t.TABLE_NAME) = scope.tbl
 AND t.TABLE_TYPE = 'BASE TABLE'
LEFT JOIN (SELECT TABLE_SCHEMA, TABLE_NAME, COUNT(*) AS found
           FROM information_schema.COLUMNS
           WHERE COLUMN_NAME IN ('DownSynced','DownSyncDate','DownSyncFailureReason','LastDownSyncDate')
           GROUP BY TABLE_SCHEMA, TABLE_NAME) cols
  ON cols.TABLE_SCHEMA = t.TABLE_SCHEMA AND cols.TABLE_NAME = t.TABLE_NAME
GROUP BY scope.sch;

-- 2. the tables that are short of one
SELECT '2. incomplete tables' AS check_name, t.TABLE_SCHEMA, t.TABLE_NAME,
       IFNULL(cols.found,0) AS columns_present
FROM (SELECT DISTINCT LOWER(TRIM(SchemaName)) sch, LOWER(TRIM(TableName)) tbl
      FROM db_iemr.m_synctabledetail
      WHERE IFNULL(Deleted,b'0') = b'0' AND TableName IS NOT NULL AND SchemaName IS NOT NULL) scope
JOIN information_schema.TABLES t
  ON LOWER(t.TABLE_SCHEMA) = scope.sch AND LOWER(t.TABLE_NAME) = scope.tbl
 AND t.TABLE_TYPE = 'BASE TABLE'
LEFT JOIN (SELECT TABLE_SCHEMA, TABLE_NAME, COUNT(*) AS found
           FROM information_schema.COLUMNS
           WHERE COLUMN_NAME IN ('DownSynced','DownSyncDate','DownSyncFailureReason','LastDownSyncDate')
           GROUP BY TABLE_SCHEMA, TABLE_NAME) cols
  ON cols.TABLE_SCHEMA = t.TABLE_SCHEMA AND cols.TABLE_NAME = t.TABLE_NAME
WHERE IFNULL(cols.found,0) < 4
ORDER BY t.TABLE_SCHEMA, t.TABLE_NAME;

-- -----------------------------------------------------------------------------
-- 3. The columns the sync itself reads by name. All four must be present on
--    every ACTIVE transactional table, or that table fails with
--    "Unknown column".
-- -----------------------------------------------------------------------------
SELECT '3. missing sync prerequisites' AS check_name, d.SchemaName, d.TableName,
       MAX(c.COLUMN_NAME = 'VanID')       AS has_vanid,
       MAX(c.COLUMN_NAME = 'VanSerialNo') AS has_vanserialno,
       MAX(c.COLUMN_NAME = 'Processed')   AS has_processed,
       MAX(c.COLUMN_NAME = 'LastModDate') AS has_lastmoddate,
       MAX(c.COLUMN_NAME = 'LastModDate' AND c.EXTRA LIKE '%on update%') AS lastmoddate_auto,
       MAX(LOWER(c.COLUMN_NAME) = LOWER(d.VanAutoIncColumnName)
           AND c.EXTRA LIKE '%auto_increment%') AS pk_is_autoinc
FROM db_iemr.m_downsynctabledetail d
JOIN information_schema.COLUMNS c
  ON LOWER(c.TABLE_SCHEMA) = LOWER(d.SchemaName) AND LOWER(c.TABLE_NAME) = LOWER(d.TableName)
WHERE d.IsActive = b'1' AND d.TableType = 'TRANSACTIONAL'
GROUP BY d.SchemaName, d.TableName
HAVING has_vanid = 0 OR has_vanserialno = 0 OR has_processed = 0
    OR has_lastmoddate = 0 OR lastmoddate_auto = 0 OR pk_is_autoinc = 0
ORDER BY d.SchemaName, d.TableName;

-- -----------------------------------------------------------------------------
-- 4. The configuration: counts, and a dense gap-free SyncOrder.
-- -----------------------------------------------------------------------------
SELECT '4. configuration' AS check_name, SchemaName, TableType, IsActive+0 AS is_active, COUNT(*) AS rows_found
FROM db_iemr.m_downsynctabledetail GROUP BY 1,2,3,4 ORDER BY SchemaName, TableType, is_active;

SELECT '4b. SyncOrder' AS check_name, COUNT(*) AS rows_found,
       MIN(SyncOrder) AS lowest, MAX(SyncOrder) AS highest,
       IF(MIN(SyncOrder) = 1 AND MAX(SyncOrder) = COUNT(*), 'PASS dense', 'FAIL - gaps') AS result
FROM db_iemr.m_downsynctabledetail;

-- 4c. the active set. Central and the laptop must agree on this, or the laptop
--     asks for a table central has not configured and that table fails every run
--     ("... is not configured for down-sync in m_downsynctabledetail").
SELECT '4c. active set fingerprint' AS check_name, COUNT(*) AS active_tables,
       MD5(GROUP_CONCAT(CONCAT(SchemaName,'.',TableName) ORDER BY SchemaName, TableName)) AS fingerprint
FROM db_iemr.m_downsynctabledetail WHERE IsActive = b'1';

-- -----------------------------------------------------------------------------
-- 5. Schema drift. The van resolves the SELECT list from information_schema at
--    sync time and sends it to central, so a hash that differs between the two
--    sides breaks that table's down-sync.
-- -----------------------------------------------------------------------------
SELECT '5. column fingerprint' AS check_name, c.TABLE_SCHEMA, c.TABLE_NAME,
       COUNT(*) AS column_count,
       MD5(GROUP_CONCAT(c.COLUMN_NAME ORDER BY c.COLUMN_NAME SEPARATOR ',')) AS column_list_hash
FROM information_schema.COLUMNS c
JOIN db_iemr.m_downsynctabledetail d
  ON LOWER(d.SchemaName) = LOWER(c.TABLE_SCHEMA) AND LOWER(d.TableName) = LOWER(c.TABLE_NAME)
 AND d.IsActive = b'1'
WHERE c.COLUMN_NAME NOT IN ('DownSynced','DownSyncDate','DownSyncFailureReason','LastDownSyncDate')
GROUP BY c.TABLE_SCHEMA, c.TABLE_NAME
ORDER BY c.TABLE_SCHEMA, c.TABLE_NAME;

-- -----------------------------------------------------------------------------
-- 6. The backfill. Nothing may sit at 'N' while carrying a VanSerialNo - such a
--    row came up from a van and would otherwise be sent straight back down.
-- -----------------------------------------------------------------------------
SELECT '6. backfill missed' AS check_name, 'tb_screening' AS table_name, COUNT(*) AS rows_found,
       IF(COUNT(*) = 0, 'PASS', 'FAIL - re-run 06_backfill.sql') AS result
FROM db_iemr.tb_screening WHERE DownSynced = 'N' AND VanSerialNo IS NOT NULL
UNION ALL
SELECT '6. backfill missed', 'tb_suspected', COUNT(*),
       IF(COUNT(*) = 0, 'PASS', 'FAIL - re-run 06_backfill.sql')
FROM db_iemr.tb_suspected WHERE DownSynced = 'N' AND VanSerialNo IS NOT NULL;

-- 6b. a central-created row must have VanSerialNo NULL: the down-sync reads
--     central's VanSerialNo as the LOCAL primary key, so a stray value matches
--     the record against an unrelated local row.
SELECT '6b. eligible rows carrying a VanSerialNo' AS check_name, COUNT(*) AS rows_found,
       IF(COUNT(*) = 0, 'PASS', 'FAIL - these would overwrite unrelated local rows') AS result
FROM db_iemr.tb_screening WHERE DownSynced IN ('N','U') AND VanSerialNo IS NOT NULL;

-- -----------------------------------------------------------------------------
-- 7. VAN structure. m_uservanmapping has NO UserID - it hangs off
--    m_userparkingplacemap, so the login -> VAN path is two hops.
-- -----------------------------------------------------------------------------
SELECT '7. logins with no van' AS check_name, COUNT(*) AS logins_found
FROM db_iemr.m_user u
WHERE u.Deleted = 0
  AND NOT EXISTS (SELECT 1 FROM db_iemr.m_userparkingplacemap p
                  JOIN db_iemr.m_uservanmapping m
                    ON m.UserParkingPlaceMapID = p.UserParkingPlaceMapID AND m.Deleted = 0
                  WHERE p.UserID = u.UserID AND p.Deleted = 0);

-- A login on more than one VAN makes any CreatedBy -> VanID backfill
-- non-deterministic: MySQL simply picks one. Resolve before tagging records.
SELECT '7b. logins mapped to >1 van' AS check_name, p.UserID,
       COUNT(DISTINCT m.VanID) AS vans,
       GROUP_CONCAT(DISTINCT m.VanID ORDER BY m.VanID) AS van_ids
FROM db_iemr.m_userparkingplacemap p
JOIN db_iemr.m_uservanmapping m
  ON m.UserParkingPlaceMapID = p.UserParkingPlaceMapID AND m.Deleted = 0
WHERE p.Deleted = 0
GROUP BY p.UserID HAVING vans > 1;

-- -----------------------------------------------------------------------------
-- 8. What the next down-sync of a given van will actually send. Replace 1.
-- -----------------------------------------------------------------------------
SELECT '8. eligible for VanID 1' AS check_name, id, VanID, VanSerialNo,
       DownSynced, DownSyncDate, LastModDate, DownSyncFailureReason
FROM db_iemr.tb_screening
WHERE VanID = 1
  AND ( DownSynced IS NULL OR DownSynced IN ('N','U')
        OR ( DownSynced = 'P' AND DownSyncDate IS NOT NULL AND LastModDate > DownSyncDate ) )
ORDER BY id;
