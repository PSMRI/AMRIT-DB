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