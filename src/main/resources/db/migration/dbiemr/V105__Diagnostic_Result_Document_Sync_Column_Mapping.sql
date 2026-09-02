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
-- DB isn't guaranteed the way tb_diagnostic_result/tb_diagnostic_document are -- a 0-row match
-- here doesn't just mean "nothing left to do", it means external_order_id would silently never
-- be registered for sync. So each UPDATE is preceded by an explicit existence check that aborts
-- the migration instead of silently no-op'ing.
--
-- Idempotent: FIND_IN_SET guards each UPDATE so re-running only touches rows that don't already
-- have external_order_id in their column list.
-- ==========================================================

USE db_iemr;

DELIMITER $$
CREATE PROCEDURE sp_v106_assert_synctabledetail_row(IN p_table_name VARCHAR(100))
BEGIN
    DECLARE row_count INT;
    SELECT COUNT(*) INTO row_count FROM m_synctabledetail WHERE TableName = p_table_name;
    IF row_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'V106 aborted: no m_synctabledetail row found for this TableName -- cannot register external_order_id in sync column mapping';
    END IF;
END$$
DELIMITER ;

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------

CALL sp_v106_assert_synctabledetail_row('tb_diagnostic_result');

UPDATE m_synctabledetail
SET ServerColumnName = CONCAT(ServerColumnName, ',external_order_id'),
    VanColumnName = CONCAT(VanColumnName, ',external_order_id')
WHERE TableName = 'tb_diagnostic_result'
  AND FIND_IN_SET('external_order_id', ServerColumnName) = 0;

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------

CALL sp_v106_assert_synctabledetail_row('tb_diagnostic_document');

UPDATE m_synctabledetail
SET ServerColumnName = CONCAT(ServerColumnName, ',external_order_id'),
    VanColumnName = CONCAT(VanColumnName, ',external_order_id')
WHERE TableName = 'tb_diagnostic_document'
  AND FIND_IN_SET('external_order_id', ServerColumnName) = 0;

DROP PROCEDURE sp_v106_assert_synctabledetail_row;
