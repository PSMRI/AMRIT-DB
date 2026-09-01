-- ==========================================================
-- Backfills tb_diagnostic_result.external_order_id / tb_diagnostic_document.external_order_id
-- from tb_diagnostic_order, via the existing diagnostic_order_id column (added in V96, kept
-- in place, unconstrained, by V103 -- this migration only fills in the new column, it does not
-- touch diagnostic_order_id).
--
-- CAUTION: this join is only trustworthy on a database where diagnostic_order_id ->
-- tb_diagnostic_order.id is still a reliable mapping -- i.e. a single-instance/local/pre-merge
-- database. diagnostic_order_id is a per-van AUTO_INCREMENT value; once rows from multiple
-- offline vans have been combined into one central DB, two different vans' orders can carry the
-- same id, and this join can silently link a result/document to the wrong order. Do not run this
-- against a merged/central DB.
--
-- Idempotent: every UPDATE is scoped to "external_order_id IS NULL", so re-running only touches
-- rows not yet resolved. Unlike V103's DDL, these are plain DML -- a WHERE clause is enough to
-- make them idempotent, no information_schema-guarded dynamic SQL is needed.
--
-- Each row's diagnostic_order_id is cleared (set NULL) in the same statement that resolves its
-- external_order_id -- that per-van AUTO_INCREMENT value is no longer trustworthy/needed once the
-- row has its stable business-key reference, and nulling it out flags the row as "migrated". Rows
-- that could NOT be resolved (no matching order) keep diagnostic_order_id populated, as the only
-- remaining link back to their parent order for manual investigation.
-- ==========================================================

USE db_iemr;

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------

UPDATE tb_diagnostic_result r
JOIN tb_diagnostic_order o ON o.id = r.diagnostic_order_id
SET r.external_order_id = o.external_order_id,
    r.diagnostic_order_id = NULL
WHERE r.external_order_id IS NULL
  AND r.diagnostic_order_id IS NOT NULL;

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------

UPDATE tb_diagnostic_document d
JOIN tb_diagnostic_order o ON o.id = d.diagnostic_order_id
SET d.external_order_id = o.external_order_id,
    d.diagnostic_order_id = NULL
WHERE d.external_order_id IS NULL
  AND d.diagnostic_order_id IS NOT NULL;

-- ==========================================================
-- Registers external_order_id in the generic van<->central sync column mapping
-- (m_synctabledetail.ServerColumnName / VanColumnName) for tb_diagnostic_result
-- (SyncTableDetailID 97) and tb_diagnostic_document (SyncTableDetailID 98) -- checked directly
-- against the live db_iemr on this machine, since neither row was ever seeded by a migration
-- in this repo (they predate/bypass this repo's tracked history).
--
-- Appended to the end of the list, identically in both ServerColumnName and VanColumnName, so
-- the two comma-separated lists stay position-aligned with each other (position relative to
-- other columns doesn't matter for the sync mechanism, only that the two lists match index-for-
-- index).
--
-- Because these two rows aren't seeded by any migration in this repo, their existence on a given
-- DB isn't guaranteed the way tb_diagnostic_result/tb_diagnostic_document are -- unlike the
-- backfill UPDATEs above, a 0-row match here doesn't just mean "nothing left to do", it means
-- external_order_id would silently never be registered for sync. So each UPDATE is preceded by
-- an explicit existence check that aborts the migration instead of silently no-op'ing.
--
-- Idempotent: FIND_IN_SET guards each UPDATE so re-running only touches rows that don't already
-- have external_order_id in their column list.
-- ==========================================================

DELIMITER $$
CREATE PROCEDURE sp_v104_assert_synctabledetail_row(IN p_table_name VARCHAR(100))
BEGIN
    DECLARE row_count INT;
    SELECT COUNT(*) INTO row_count FROM m_synctabledetail WHERE TableName = p_table_name;
    IF row_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'V104 aborted: no m_synctabledetail row found for this TableName -- cannot register external_order_id in sync column mapping';
    END IF;
END$$
DELIMITER ;

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------

CALL sp_v104_assert_synctabledetail_row('tb_diagnostic_result');

UPDATE m_synctabledetail
SET ServerColumnName = CONCAT(ServerColumnName, ',external_order_id'),
    VanColumnName = CONCAT(VanColumnName, ',external_order_id')
WHERE TableName = 'tb_diagnostic_result'
  AND FIND_IN_SET('external_order_id', ServerColumnName) = 0;

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------

CALL sp_v104_assert_synctabledetail_row('tb_diagnostic_document');

UPDATE m_synctabledetail
SET ServerColumnName = CONCAT(ServerColumnName, ',external_order_id'),
    VanColumnName = CONCAT(VanColumnName, ',external_order_id')
WHERE TableName = 'tb_diagnostic_document'
  AND FIND_IN_SET('external_order_id', ServerColumnName) = 0;

DROP PROCEDURE sp_v104_assert_synctabledetail_row;