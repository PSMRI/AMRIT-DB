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
--
-- SELF-SKIP GUARD: on a merged/central DB (see CAUTION above), this join can map more than one
-- row onto the same external_order_id, which would violate uk_diagnostic_result_external_order_id
-- / uk_diagnostic_document_external_order_id_doctype (added in V103) and abort with error 1062.
-- Each UPDATE below is therefore preceded by a check for that condition -- either two candidate
-- rows resolving to the same key, or a candidate colliding with a row some earlier run already
-- migrated -- and is skipped entirely (all-or-nothing) when found, leaving diagnostic_order_id
-- populated so V108 (or manual review) can resolve those rows safely instead.
-- ==========================================================

USE db_iemr;

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------

SET @dr_safe = (
    SELECT COUNT(*) = 0
    FROM (
        SELECT o.external_order_id
        FROM tb_diagnostic_result r
        JOIN tb_diagnostic_order o ON o.id = r.diagnostic_order_id
        WHERE r.external_order_id IS NULL
          AND r.diagnostic_order_id IS NOT NULL
        GROUP BY o.external_order_id
        HAVING COUNT(*) > 1
           OR EXISTS (
                SELECT 1 FROM tb_diagnostic_result e
                WHERE e.external_order_id = o.external_order_id
              )
    ) unsafe_groups
);

UPDATE tb_diagnostic_result r
JOIN tb_diagnostic_order o ON o.id = r.diagnostic_order_id
SET r.external_order_id = o.external_order_id,
    r.diagnostic_order_id = NULL
WHERE r.external_order_id IS NULL
  AND r.diagnostic_order_id IS NOT NULL
  AND @dr_safe = 1;

SELECT IF(@dr_safe = 1,
    'tb_diagnostic_result backfill applied',
    'tb_diagnostic_result backfill SKIPPED -- diagnostic_order_id -> tb_diagnostic_order.id is not 1:1 here (merged/central DB); rows left for V108 / manual resolution'
) AS notice;

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------

SET @dd_safe = (
    SELECT COUNT(*) = 0
    FROM (
        SELECT o.external_order_id, d.document_type
        FROM tb_diagnostic_document d
        JOIN tb_diagnostic_order o ON o.id = d.diagnostic_order_id
        WHERE d.external_order_id IS NULL
          AND d.diagnostic_order_id IS NOT NULL
        GROUP BY o.external_order_id, d.document_type
        HAVING COUNT(*) > 1
           OR EXISTS (
                SELECT 1 FROM tb_diagnostic_document e
                WHERE e.external_order_id = o.external_order_id
                  AND e.document_type = d.document_type
              )
    ) unsafe_groups
);

UPDATE tb_diagnostic_document d
JOIN tb_diagnostic_order o ON o.id = d.diagnostic_order_id
SET d.external_order_id = o.external_order_id,
    d.diagnostic_order_id = NULL
WHERE d.external_order_id IS NULL
  AND d.diagnostic_order_id IS NOT NULL
  AND @dd_safe = 1;

SELECT IF(@dd_safe = 1,
    'tb_diagnostic_document backfill applied',
    'tb_diagnostic_document backfill SKIPPED -- diagnostic_order_id -> tb_diagnostic_order.id is not 1:1 here (merged/central DB); rows left for V108 / manual resolution'
) AS notice;