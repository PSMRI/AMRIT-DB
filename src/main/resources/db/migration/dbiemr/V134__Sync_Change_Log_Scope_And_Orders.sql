-- STOP-TB sync change log, follow-up to V132.
--
-- 1. i_ben_flow_outreach scope changes are logged with op 'S' instead of 'U', so the changes
--    feed can tell "this beneficiary just came into a village" from an ordinary update and also
--    send the beneficiary's older TB, form and order records. Feeds that don't know 'S' treat it
--    like 'U' (an upsert), so nothing breaks.
-- 2. tb_diagnostic_order / tb_diagnostic_result updates are logged only when a field the feed
--    sends changes. The vendor poller rewrites pending orders every few seconds (last_polled_at,
--    processed, modified_by, raw_response_json), which otherwise re-sent every pending order to
--    every tablet on every poll.
--
-- Insert and delete triggers are unchanged. Triggers stay single statements.

DROP TRIGGER IF EXISTS `trg_scl_ben_flow_ai`;
CREATE TRIGGER `trg_scl_ben_flow_ai` AFTER INSERT ON `i_ben_flow_outreach` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', NEW.beneficiary_reg_id, 'S', NEW.beneficiary_reg_id, NEW.beneficiary_id FROM DUAL
  WHERE NEW.beneficiary_reg_id IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_flow_au`;
CREATE TRIGGER `trg_scl_ben_flow_au` AFTER UPDATE ON `i_ben_flow_outreach` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', NEW.beneficiary_reg_id, 'S', NEW.beneficiary_reg_id, NEW.beneficiary_id FROM DUAL
  WHERE NEW.beneficiary_reg_id IS NOT NULL
    AND (NOT (NEW.villageID <=> OLD.villageID) OR NOT (NEW.providerServiceMapID <=> OLD.providerServiceMapID)
         OR NOT (NEW.deleted <=> OLD.deleted));

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_order_au`;
CREATE TRIGGER `trg_scl_tb_diagnostic_order_au` AFTER UPDATE ON `tb_diagnostic_order` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', NEW.id, 'U', NULL, NEW.beneficiary_id FROM DUAL
  WHERE NOT (NEW.status <=> OLD.status) OR NOT (NEW.error_message <=> OLD.error_message)
     OR NOT (NEW.reason_to_close <=> OLD.reason_to_close) OR NOT (NEW.deleted <=> OLD.deleted)
     OR NOT (NEW.beneficiary_id <=> OLD.beneficiary_id) OR NOT (NEW.visitCode <=> OLD.visitCode)
     OR NOT (NEW.order_type <=> OLD.order_type) OR NOT (NEW.external_order_id <=> OLD.external_order_id);

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_au`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_au` AFTER UPDATE ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', NEW.diagnostic_order_id, 'U', NULL, NEW.beneficiary_id FROM DUAL
  WHERE NOT (NEW.provider_status <=> OLD.provider_status) OR NOT (NEW.result_summary <=> OLD.result_summary)
     OR NOT (NEW.tb_presence <=> OLD.tb_presence) OR NOT (NEW.tb_confidence <=> OLD.tb_confidence)
     OR NOT (NEW.drug_resistance_presence <=> OLD.drug_resistance_presence) OR NOT (NEW.deleted <=> OLD.deleted);
