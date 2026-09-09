-- ==========================================================
-- Registers external_order_id in the generic van<->central sync column mapping
-- (m_synctabledetail.ServerColumnName / VanColumnName) for tb_diagnostic_result and
-- tb_diagnostic_document.
--
-- How the mapping is consumed (why the column must be in BOTH lists):
-- on upload the van selects VanColumnName from its local table, and the central side binds
-- values by NAME, not by position -- for each name split out of ServerColumnName it looks up
-- that key in the record the van sent (see GetDataFromVanAndSyncToDBImpl.syncDataToCentralDB in
-- MMU-API/HWC-API/TM-API, which does cleanRecord.get(column.trim()) after unwrapping any
-- date_format(...) aliases). So position within the list does not matter, but a name present in
-- ServerColumnName and missing from VanColumnName resolves to null and is written to central as
-- NULL with no error at all. Each list is therefore guarded independently below, so a row whose
-- two lists have drifted apart gets repaired rather than skipped or double-appended.
--
-- Skipped, not failed, when the row is absent: AMRIT is deployed across many servers and the
-- m_synctabledetail rows for these two tables are not seeded by any migration in this repo
-- (m_synctabledetail is created with AUTO_INCREMENT=84 in V1, these rows are 97/98 where they
-- exist at all). On a server that has no row for a table there is nothing to register and
-- nothing to break, so the UPDATE simply matches no rows and the migration moves on.
--
-- Operational caveat: because this migration runs once, a server that gains an
-- m_synctabledetail row for either table LATER will not have external_order_id registered by
-- this file. Whatever seeds that row must include external_order_id in both column lists.
--
-- Idempotent: FIND_IN_SET guards every append, so re-running (or running after a partial manual
-- fix) only touches the lists that do not already contain external_order_id.
-- ==========================================================

USE db_iemr;

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------

UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('external_order_id', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',external_order_id')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('external_order_id', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',external_order_id')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_result'
  AND (
      FIND_IN_SET('external_order_id', ServerColumnName) = 0
      OR FIND_IN_SET('external_order_id', VanColumnName) = 0
  );

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------

UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('external_order_id', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',external_order_id')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('external_order_id', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',external_order_id')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('external_order_id', ServerColumnName) = 0
      OR FIND_IN_SET('external_order_id', VanColumnName) = 0
  );

-- ----------------------------------------------------------
-- Post-state, for anyone running this by hand: one row per table when registered,
-- "row absent - nothing to register" when this server has no sync mapping for it.
-- ----------------------------------------------------------

SELECT t.TableName,
       IFNULL(
           (SELECT CONCAT(
                       'server=',
                       IF(FIND_IN_SET('external_order_id', s.ServerColumnName) > 0, 'ok', 'MISSING'),
                       ', van=',
                       IF(FIND_IN_SET('external_order_id', s.VanColumnName) > 0, 'ok', 'MISSING'))
            FROM m_synctabledetail s
            WHERE s.TableName = t.TableName
            LIMIT 1),
           'row absent - nothing to register'
       ) AS external_order_id_mapping
FROM (SELECT 'tb_diagnostic_result' AS TableName
      UNION ALL
      SELECT 'tb_diagnostic_document') t;
