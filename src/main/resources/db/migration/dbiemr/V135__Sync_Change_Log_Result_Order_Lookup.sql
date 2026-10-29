-- STOP-TB sync change log, fix for V134.
--
-- V134's tb_diagnostic_result update trigger logged NEW.diagnostic_order_id without checking it
-- for NULL. Results are written with diagnostic_order_id NULL (they are linked to their order by
-- external_order_id), so every result update that changed a sent field failed with
-- "Column 'row_pk' cannot be null" and the result was never saved.
--
-- The result triggers now find the order through external_order_id (unique on
-- tb_diagnostic_order). When no order matches, nothing is logged, so the insert can never be NULL.
-- This also makes result changes reach the feed, which the diagnostic_order_id version never did.

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_ai`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_ai` AFTER INSERT ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', o.id, 'U', NULL, o.beneficiary_id FROM db_iemr.tb_diagnostic_order o
  WHERE o.external_order_id = NEW.external_order_id;

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_au`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_au` AFTER UPDATE ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', o.id, 'U', NULL, o.beneficiary_id FROM db_iemr.tb_diagnostic_order o
  WHERE o.external_order_id = NEW.external_order_id
    AND (NOT (NEW.provider_status <=> OLD.provider_status) OR NOT (NEW.result_summary <=> OLD.result_summary)
         OR NOT (NEW.tb_presence <=> OLD.tb_presence) OR NOT (NEW.tb_confidence <=> OLD.tb_confidence)
         OR NOT (NEW.drug_resistance_presence <=> OLD.drug_resistance_presence) OR NOT (NEW.deleted <=> OLD.deleted)
         OR NOT (NEW.external_order_id <=> OLD.external_order_id));

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_ad`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_ad` AFTER DELETE ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', o.id, 'U', NULL, o.beneficiary_id FROM db_iemr.tb_diagnostic_order o
  WHERE o.external_order_id = OLD.external_order_id;
