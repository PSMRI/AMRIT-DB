-- Hub only (AMRIT_HUB=true, see HubConfigured): never runs on production central or state servers.
--
-- STOP-TB sync change log. Every change to a record the STOP-TB app pulls appends one line here;
-- the FLW-API changes feed (/stoptb/sync/changes) returns the current rows for lines after a
-- tablet's token. seq is the token. The log is local to this laptop and is never synced to central
-- (do not add it to m_synctabledetail).
--
-- entity  = the record type the app receives (beneficiary, tb_screening, opd_visit, ...)
-- row_pk  = that record's key: BenRegId for beneficiary, otherwise the table's primary key
-- ben_reg_id / beneficiary_id = whichever the source row carries; the feed resolves the village
--           through i_ben_flow_outreach when it reads, so the triggers do no lookups for scope.
-- Child rows (complaints, drugs, answers, results, vitals) are logged as an update of their parent.
--
-- Triggers are single statements on purpose: they must never make a save fail, and Flyway needs
-- no DELIMITER handling. Each one appends a line to db_iemr.t_sync_change_log; nothing else.


CREATE TABLE IF NOT EXISTS `t_sync_change_log` (
  `seq`            BIGINT      NOT NULL AUTO_INCREMENT,
  `entity`         VARCHAR(40) NOT NULL,
  `row_pk`         BIGINT      NOT NULL,
  `op`             CHAR(1)     NOT NULL COMMENT 'I, U or D',
  `ben_reg_id`     BIGINT      NULL,
  `beneficiary_id` BIGINT      NULL,
  `changed_at`     DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`seq`),
  KEY `idx_scl_ben_reg_id` (`ben_reg_id`, `seq`),
  KEY `idx_scl_beneficiary_id` (`beneficiary_id`, `seq`),
  KEY `idx_scl_entity_row` (`entity`, `row_pk`),
  KEY `idx_scl_changed_at` (`changed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Keep 30 days. Small batches so the clean-up never holds long locks; at hub scale (~15k lines a
-- day) one batch an hour is far more than enough. A token older than this gets a fresh snapshot.
DROP EVENT IF EXISTS `ev_sync_change_log_cleanup`;
CREATE EVENT `ev_sync_change_log_cleanup` ON SCHEDULE EVERY 1 HOUR
  DO DELETE FROM `t_sync_change_log` WHERE `changed_at` < NOW(6) - INTERVAL 30 DAY ORDER BY `changed_at` LIMIT 10000;

-- The feed scopes by village through the flow table, which has no index on villageID.
SET @idx_exists = (SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'i_ben_flow_outreach' AND index_name = 'idx_bfo_village_psm');
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX `idx_bfo_village_psm` ON `i_ben_flow_outreach` (`villageID`, `providerServiceMapID`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @idx_exists = (SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'i_ben_flow_outreach' AND index_name = 'idx_bfo_beneficiary_id');
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX `idx_bfo_beneficiary_id` ON `i_ben_flow_outreach` (`beneficiary_id`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- Records the app pulls. Latest anthropometry and vitals are part of the beneficiary record.

DROP TRIGGER IF EXISTS `trg_scl_tb_screening_ai`;
CREATE TRIGGER `trg_scl_tb_screening_ai` AFTER INSERT ON `tb_screening` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_screening', NEW.`id`, 'I', NEW.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_screening_au`;
CREATE TRIGGER `trg_scl_tb_screening_au` AFTER UPDATE ON `tb_screening` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_screening', NEW.`id`, 'U', NEW.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_screening_ad`;
CREATE TRIGGER `trg_scl_tb_screening_ad` AFTER DELETE ON `tb_screening` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_screening', OLD.`id`, 'D', OLD.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_gen_exam_ai`;
CREATE TRIGGER `trg_scl_tb_stoptb_gen_exam_ai` AFTER INSERT ON `tb_stoptb_general_examination` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('general_examination', NEW.`id`, 'I', NEW.`beneficiary_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_gen_exam_au`;
CREATE TRIGGER `trg_scl_tb_stoptb_gen_exam_au` AFTER UPDATE ON `tb_stoptb_general_examination` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('general_examination', NEW.`id`, 'U', NEW.`beneficiary_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_gen_exam_ad`;
CREATE TRIGGER `trg_scl_tb_stoptb_gen_exam_ad` AFTER DELETE ON `tb_stoptb_general_examination` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('general_examination', OLD.`id`, 'D', OLD.`beneficiary_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_gen_opd_ai`;
CREATE TRIGGER `trg_scl_tb_stoptb_gen_opd_ai` AFTER INSERT ON `tb_stoptb_general_opd` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('general_opd', NEW.`id`, 'I', NEW.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_gen_opd_au`;
CREATE TRIGGER `trg_scl_tb_stoptb_gen_opd_au` AFTER UPDATE ON `tb_stoptb_general_opd` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('general_opd', NEW.`id`, 'U', NEW.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_gen_opd_ad`;
CREATE TRIGGER `trg_scl_tb_stoptb_gen_opd_ad` AFTER DELETE ON `tb_stoptb_general_opd` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('general_opd', OLD.`id`, 'D', OLD.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_diagnostics_ai`;
CREATE TRIGGER `trg_scl_tb_stoptb_diagnostics_ai` AFTER INSERT ON `tb_stoptb_diagnostics` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('diagnostics', NEW.`id`, 'I', NEW.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_diagnostics_au`;
CREATE TRIGGER `trg_scl_tb_stoptb_diagnostics_au` AFTER UPDATE ON `tb_stoptb_diagnostics` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('diagnostics', NEW.`id`, 'U', NEW.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_stoptb_diagnostics_ad`;
CREATE TRIGGER `trg_scl_tb_stoptb_diagnostics_ad` AFTER DELETE ON `tb_stoptb_diagnostics` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('diagnostics', OLD.`id`, 'D', OLD.`ben_reg_id`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_tb_suspected_ai`;
CREATE TRIGGER `trg_scl_tb_suspected_ai` AFTER INSERT ON `tb_suspected` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_suspected', NEW.`id`, 'I', NULL, NEW.`ben_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_suspected_au`;
CREATE TRIGGER `trg_scl_tb_suspected_au` AFTER UPDATE ON `tb_suspected` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_suspected', NEW.`id`, 'U', NULL, NEW.`ben_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_suspected_ad`;
CREATE TRIGGER `trg_scl_tb_suspected_ad` AFTER DELETE ON `tb_suspected` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_suspected', OLD.`id`, 'D', NULL, OLD.`ben_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_confirmed_cases_ai`;
CREATE TRIGGER `trg_scl_tb_confirmed_cases_ai` AFTER INSERT ON `tb_confirmed_cases` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_confirmed', NEW.`id`, 'I', NULL, NEW.`ben_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_confirmed_cases_au`;
CREATE TRIGGER `trg_scl_tb_confirmed_cases_au` AFTER UPDATE ON `tb_confirmed_cases` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_confirmed', NEW.`id`, 'U', NULL, NEW.`ben_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_confirmed_cases_ad`;
CREATE TRIGGER `trg_scl_tb_confirmed_cases_ad` AFTER DELETE ON `tb_confirmed_cases` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('tb_confirmed', OLD.`id`, 'D', NULL, OLD.`ben_id`);

DROP TRIGGER IF EXISTS `trg_scl_t_form_response_ai`;
CREATE TRIGGER `trg_scl_t_form_response_ai` AFTER INSERT ON `t_form_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('form_response', NEW.`responseId`, 'I', NULL, NEW.`beneficiaryId`);

DROP TRIGGER IF EXISTS `trg_scl_t_form_response_au`;
CREATE TRIGGER `trg_scl_t_form_response_au` AFTER UPDATE ON `t_form_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('form_response', NEW.`responseId`, 'U', NULL, NEW.`beneficiaryId`);

DROP TRIGGER IF EXISTS `trg_scl_t_form_response_ad`;
CREATE TRIGGER `trg_scl_t_form_response_ad` AFTER DELETE ON `t_form_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('form_response', OLD.`responseId`, 'D', NULL, OLD.`beneficiaryId`);

DROP TRIGGER IF EXISTS `trg_scl_t_section_response_ai`;
CREATE TRIGGER `trg_scl_t_section_response_ai` AFTER INSERT ON `t_section_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'form_response', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT fr.responseId AS row_pk, NULL AS ben_reg_id, fr.beneficiaryId AS beneficiary_id FROM t_form_response fr WHERE fr.responseId = NEW.responseId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_section_response_au`;
CREATE TRIGGER `trg_scl_t_section_response_au` AFTER UPDATE ON `t_section_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'form_response', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT fr.responseId AS row_pk, NULL AS ben_reg_id, fr.beneficiaryId AS beneficiary_id FROM t_form_response fr WHERE fr.responseId = NEW.responseId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_section_response_ad`;
CREATE TRIGGER `trg_scl_t_section_response_ad` AFTER DELETE ON `t_section_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'form_response', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT fr.responseId AS row_pk, NULL AS ben_reg_id, fr.beneficiaryId AS beneficiary_id FROM t_form_response fr WHERE fr.responseId = OLD.responseId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_question_response_ai`;
CREATE TRIGGER `trg_scl_t_question_response_ai` AFTER INSERT ON `t_question_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'form_response', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT fr.responseId AS row_pk, NULL AS ben_reg_id, fr.beneficiaryId AS beneficiary_id FROM t_section_response sr JOIN t_form_response fr ON fr.responseId = sr.responseId WHERE sr.sectionResponseId = NEW.sectionResponseId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_question_response_au`;
CREATE TRIGGER `trg_scl_t_question_response_au` AFTER UPDATE ON `t_question_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'form_response', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT fr.responseId AS row_pk, NULL AS ben_reg_id, fr.beneficiaryId AS beneficiary_id FROM t_section_response sr JOIN t_form_response fr ON fr.responseId = sr.responseId WHERE sr.sectionResponseId = NEW.sectionResponseId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_question_response_ad`;
CREATE TRIGGER `trg_scl_t_question_response_ad` AFTER DELETE ON `t_question_response` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'form_response', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT fr.responseId AS row_pk, NULL AS ben_reg_id, fr.beneficiaryId AS beneficiary_id FROM t_section_response sr JOIN t_form_response fr ON fr.responseId = sr.responseId WHERE sr.sectionResponseId = OLD.sectionResponseId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_order_ai`;
CREATE TRIGGER `trg_scl_tb_diagnostic_order_ai` AFTER INSERT ON `tb_diagnostic_order` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('diagnostic_order', NEW.`id`, 'I', NULL, NEW.`beneficiary_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_order_au`;
CREATE TRIGGER `trg_scl_tb_diagnostic_order_au` AFTER UPDATE ON `tb_diagnostic_order` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('diagnostic_order', NEW.`id`, 'U', NULL, NEW.`beneficiary_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_order_ad`;
CREATE TRIGGER `trg_scl_tb_diagnostic_order_ad` AFTER DELETE ON `tb_diagnostic_order` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('diagnostic_order', OLD.`id`, 'D', NULL, OLD.`beneficiary_id`);

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_ai`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_ai` AFTER INSERT ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.diagnostic_order_id AS row_pk, NULL AS ben_reg_id, NEW.beneficiary_id AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_au`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_au` AFTER UPDATE ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.diagnostic_order_id AS row_pk, NULL AS ben_reg_id, NEW.beneficiary_id AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_tb_diagnostic_result_ad`;
CREATE TRIGGER `trg_scl_tb_diagnostic_result_ad` AFTER DELETE ON `tb_diagnostic_result` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'diagnostic_order', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.diagnostic_order_id AS row_pk, NULL AS ben_reg_id, OLD.beneficiary_id AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_benvisitdetail_ai`;
CREATE TRIGGER `trg_scl_t_benvisitdetail_ai` AFTER INSERT ON `t_benvisitdetail` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('opd_visit', NEW.`BenVisitID`, 'I', NEW.`BeneficiaryRegID`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_t_benvisitdetail_au`;
CREATE TRIGGER `trg_scl_t_benvisitdetail_au` AFTER UPDATE ON `t_benvisitdetail` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('opd_visit', NEW.`BenVisitID`, 'U', NEW.`BeneficiaryRegID`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_t_benvisitdetail_ad`;
CREATE TRIGGER `trg_scl_t_benvisitdetail_ad` AFTER DELETE ON `t_benvisitdetail` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('opd_visit', OLD.`BenVisitID`, 'D', OLD.`BeneficiaryRegID`, NULL);

DROP TRIGGER IF EXISTS `trg_scl_t_benchiefcomplaint_ai`;
CREATE TRIGGER `trg_scl_t_benchiefcomplaint_ai` AFTER INSERT ON `t_benchiefcomplaint` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'opd_visit', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BenVisitID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_benchiefcomplaint_au`;
CREATE TRIGGER `trg_scl_t_benchiefcomplaint_au` AFTER UPDATE ON `t_benchiefcomplaint` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'opd_visit', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BenVisitID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_benchiefcomplaint_ad`;
CREATE TRIGGER `trg_scl_t_benchiefcomplaint_ad` AFTER DELETE ON `t_benchiefcomplaint` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'opd_visit', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BenVisitID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_prescribeddrug_ai`;
CREATE TRIGGER `trg_scl_t_prescribeddrug_ai` AFTER INSERT ON `t_prescribeddrug` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'opd_visit', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BenVisitID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_prescribeddrug_au`;
CREATE TRIGGER `trg_scl_t_prescribeddrug_au` AFTER UPDATE ON `t_prescribeddrug` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'opd_visit', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BenVisitID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_prescribeddrug_ad`;
CREATE TRIGGER `trg_scl_t_prescribeddrug_ad` AFTER DELETE ON `t_prescribeddrug` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'opd_visit', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BenVisitID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_phy_anthropometry_ai`;
CREATE TRIGGER `trg_scl_t_phy_anthropometry_ai` AFTER INSERT ON `t_phy_anthropometry` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_phy_anthropometry_au`;
CREATE TRIGGER `trg_scl_t_phy_anthropometry_au` AFTER UPDATE ON `t_phy_anthropometry` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_phy_anthropometry_ad`;
CREATE TRIGGER `trg_scl_t_phy_anthropometry_ad` AFTER DELETE ON `t_phy_anthropometry` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BeneficiaryRegID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_phy_vitals_ai`;
CREATE TRIGGER `trg_scl_t_phy_vitals_ai` AFTER INSERT ON `t_phy_vitals` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_phy_vitals_au`;
CREATE TRIGGER `trg_scl_t_phy_vitals_au` AFTER UPDATE ON `t_phy_vitals` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_t_phy_vitals_ad`;
CREATE TRIGGER `trg_scl_t_phy_vitals_ad` AFTER DELETE ON `t_phy_vitals` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BeneficiaryRegID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;


-- i_ben_flow_outreach decides which beneficiaries are in a village (scope). Only a new row or a
-- change to villageID / providerServiceMapID / deleted matters; its frequent status updates don't.

DROP TRIGGER IF EXISTS `trg_scl_ben_flow_ai`;
CREATE TRIGGER `trg_scl_ben_flow_ai` AFTER INSERT ON `i_ben_flow_outreach` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) SELECT 'beneficiary', NEW.beneficiary_reg_id, 'U', NEW.beneficiary_reg_id, NEW.beneficiary_id FROM DUAL WHERE NEW.beneficiary_reg_id IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_flow_au`;
CREATE TRIGGER `trg_scl_ben_flow_au` AFTER UPDATE ON `i_ben_flow_outreach` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) SELECT 'beneficiary', NEW.beneficiary_reg_id, 'U', NEW.beneficiary_reg_id, NEW.beneficiary_id FROM DUAL WHERE NEW.beneficiary_reg_id IS NOT NULL AND (NOT (NEW.villageID <=> OLD.villageID) OR NOT (NEW.providerServiceMapID <=> OLD.providerServiceMapID) OR NOT (NEW.deleted <=> OLD.deleted));
