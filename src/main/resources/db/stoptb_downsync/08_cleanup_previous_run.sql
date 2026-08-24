-- ----------------------------------------------------------------------------
-- Only for a database where the earlier Flyway migrations (V102 / V103 / V104)
-- were already applied - the dev server. On a clean database this file has
-- nothing to do and can be skipped.
--
-- Those migrations added LastModDate to every table that lacked it, including
-- the nine StopTB tables that already track modification time as last_mod_date.
-- That duplicate is what we have now decided against: two timestamps on one
-- table drift apart, and a column present on one side of the sync but not the
-- other changes that table's column fingerprint, which breaks its down-sync.
--
-- This file does not drop anything by itself. It PRINTS the statements to run,
-- so they can be reviewed first - dropping a column is not reversible.
-- ----------------------------------------------------------------------------

-- 1. Tables carrying BOTH spellings. Each row is a duplicate to remove.
SELECT CONCAT('ALTER TABLE ', TABLE_SCHEMA, '.', TABLE_NAME,
              ' DROP COLUMN LastModDate;') AS statement_to_run
FROM information_schema.COLUMNS
WHERE COLUMN_NAME IN ('LastModDate','last_mod_date')
  AND TABLE_SCHEMA IN ('db_iemr','db_identity')
GROUP BY TABLE_SCHEMA, TABLE_NAME
HAVING COUNT(DISTINCT COLUMN_NAME) > 1
ORDER BY TABLE_SCHEMA, TABLE_NAME;

-- Review the output, then run it. Nothing is lost: the sync uses last_mod_date
-- for these tables (m_downsynctabledetail.LastModColumnName says so), and the
-- LastModDate copy was only ever written by MySQL's ON UPDATE.

-- 2. The rollout bookkeeping table V103 created. Not used by the sync.
--    DROP TABLE IF EXISTS db_iemr.t_downsynccolumnrollout;
--    DROP TABLE IF EXISTS db_identity.t_downsynccolumnrollout;

-- 3. The helper procedure V103 left installed, if the DBA wants it gone.
--    DROP PROCEDURE IF EXISTS db_iemr.amrit_downsync_backfill_table;
--    DROP PROCEDURE IF EXISTS db_identity.amrit_downsync_backfill_table;

-- 4. The old configuration rows. Script 05 updates every row it recognises
--    (ON DUPLICATE KEY UPDATE on SchemaName+TableName), so re-seeding is enough
--    and this is only needed if the DBA wants a clean slate:
--    DELETE FROM db_iemr.m_downsynctabledetail;
--
--    After running 05, confirm SyncOrder is dense and LastModColumnName is set:
--      SELECT COUNT(*), MIN(SyncOrder), MAX(SyncOrder),
--             SUM(LastModColumnName IS NOT NULL) AS named
--      FROM db_iemr.m_downsynctabledetail;

-- 5. Flyway history. V102/V103/V104 are recorded as applied, but those migration
--    files live only on the abandoned branch. If that branch is never merged, a
--    later AMRIT-DB run reports them as applied-but-not-resolved. Either keep
--    the branch, or clear the rows:
--    DELETE FROM db_iemr.flyway_schema_history     WHERE version IN ('102','103','104');
--    DELETE FROM db_identity.flyway_schema_history WHERE version IN ('22','23');
