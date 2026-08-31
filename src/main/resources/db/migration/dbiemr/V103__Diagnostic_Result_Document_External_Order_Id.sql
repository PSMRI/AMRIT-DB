-- ==========================================================
-- Adds external_order_id to tb_diagnostic_result / tb_diagnostic_document, alongside the
-- existing diagnostic_order_id column (kept, not dropped, not backfilled/migrated here).
--
-- Why: diagnostic_order_id is a local, per-van AUTO_INCREMENT FK to tb_diagnostic_order.id,
-- which collides once orders from multiple offline (van) servers meet centrally. The app now
-- links tb_diagnostic_result/tb_diagnostic_document to their parent order via
-- tb_diagnostic_order.external_order_id (a stable business key) instead, and no longer
-- populates diagnostic_order_id on new inserts.
--
-- tb_diagnostic_result.diagnostic_order_id is currently NOT NULL (see V96), so it must be
-- relaxed to nullable here -- otherwise every new insert from the updated app code (which never
-- sets it) would fail outright on that NOT NULL constraint. tb_diagnostic_document.
-- diagnostic_order_id is already nullable, so no equivalent change is needed there.
--
-- The old FK/unique constraints on diagnostic_order_id (fk_diagnostic_result_order,
-- uk_diagnostic_result_order_id, fk_diagnostic_document_order,
-- uk_diagnostic_document_order_doctype -- all from V96) are dropped below: they enforced
-- invariants (one result per order, one document per order+type, valid parent order) that no
-- longer hold once new rows stop populating diagnostic_order_id, so they'd either block new
-- inserts outright or simply go stale. The column itself is kept, unconstrained, as a
-- read-only historical reference to whatever it held before this migration.
-- ==========================================================

-- ----------------------------------------------------------
-- tb_diagnostic_result
-- ----------------------------------------------------------

ALTER TABLE db_iemr.tb_diagnostic_result
    ADD COLUMN external_order_id VARCHAR(100) NULL AFTER diagnostic_order_id;

ALTER TABLE db_iemr.tb_diagnostic_result
    DROP FOREIGN KEY fk_diagnostic_result_order,
    DROP INDEX uk_diagnostic_result_order_id;

-- Relax NOT NULL so new rows (which no longer set diagnostic_order_id) can still be inserted
ALTER TABLE db_iemr.tb_diagnostic_result
    MODIFY COLUMN diagnostic_order_id BIGINT NULL;

ALTER TABLE db_iemr.tb_diagnostic_result
    ADD CONSTRAINT uk_diagnostic_result_external_order_id UNIQUE (external_order_id);

-- ----------------------------------------------------------
-- tb_diagnostic_document
-- ----------------------------------------------------------

ALTER TABLE db_iemr.tb_diagnostic_document
    ADD COLUMN external_order_id VARCHAR(100) NULL AFTER diagnostic_order_id;

ALTER TABLE db_iemr.tb_diagnostic_document
    DROP FOREIGN KEY fk_diagnostic_document_order,
    DROP INDEX uk_diagnostic_document_order_doctype;

ALTER TABLE db_iemr.tb_diagnostic_document
    ADD CONSTRAINT uk_diagnostic_document_external_order_id_doctype
        UNIQUE (external_order_id, document_type);
