-- Hub only (AMRIT_HUB=true, see HubConfigured): never runs on production central or state servers.
--
-- Beneficiary changes for the STOP-TB sync change log. The log table lives in db_iemr
-- (dbiemr_hub/V1) so tablets hold a single token; these triggers write to it across schemas.
-- Every table that makes up the beneficiary record logs entity 'beneficiary' keyed by BenRegId.
-- Tables keyed by their own ID resolve BenRegId through i_beneficiarymapping; on the first insert
-- the mapping doesn't exist yet, so nothing is logged until the mapping insert, which covers it.
-- A household is sent inside each member's record, so a household change updates every member.
--
-- Privileges: a trigger runs as its definer, the db_identity migration user. That user must be
-- able to INSERT into db_iemr.t_sync_change_log, or every beneficiary save on this server fails.
-- Camp laptops use one account with ALL PRIVILEGES for every schema; anywhere else (UAT central)
-- grant it before setting AMRIT_HUB=true, together with TRIGGER and EVENT.
--
-- Triggers are single statements on purpose: they must never make a save fail, and Flyway needs
-- no DELIMITER handling. Each one appends a line to db_iemr.t_sync_change_log; nothing else.


DROP TRIGGER IF EXISTS `trg_scl_i_beneficiarymapping_ai`;
CREATE TRIGGER `trg_scl_i_beneficiarymapping_ai` AFTER INSERT ON `i_beneficiarymapping` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('beneficiary', NEW.BenRegId, 'I', NEW.BenRegId, NULL);

DROP TRIGGER IF EXISTS `trg_scl_i_beneficiarymapping_au`;
CREATE TRIGGER `trg_scl_i_beneficiarymapping_au` AFTER UPDATE ON `i_beneficiarymapping` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('beneficiary', NEW.BenRegId, 'U', NEW.BenRegId, NULL);

DROP TRIGGER IF EXISTS `trg_scl_i_beneficiarymapping_ad`;
CREATE TRIGGER `trg_scl_i_beneficiarymapping_ad` AFTER DELETE ON `i_beneficiarymapping` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id) VALUES ('beneficiary', OLD.BenRegId, 'D', OLD.BenRegId, NULL);

DROP TRIGGER IF EXISTS `trg_scl_ben_details_ai`;
CREATE TRIGGER `trg_scl_ben_details_ai` AFTER INSERT ON `i_beneficiarydetails` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_details_au`;
CREATE TRIGGER `trg_scl_ben_details_au` AFTER UPDATE ON `i_beneficiarydetails` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_details_ad`;
CREATE TRIGGER `trg_scl_ben_details_ad` AFTER DELETE ON `i_beneficiarydetails` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BeneficiaryRegID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_rmnch_ai`;
CREATE TRIGGER `trg_scl_ben_rmnch_ai` AFTER INSERT ON `i_beneficiarydetails_rmnch` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_rmnch_au`;
CREATE TRIGGER `trg_scl_ben_rmnch_au` AFTER UPDATE ON `i_beneficiarydetails_rmnch` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_rmnch_ad`;
CREATE TRIGGER `trg_scl_ben_rmnch_ad` AFTER DELETE ON `i_beneficiarydetails_rmnch` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BeneficiaryRegID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_birth_ai`;
CREATE TRIGGER `trg_scl_ben_birth_ai` AFTER INSERT ON `i_bornbirthdeatils` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_birth_au`;
CREATE TRIGGER `trg_scl_ben_birth_au` AFTER UPDATE ON `i_bornbirthdeatils` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT NEW.BeneficiaryRegID AS row_pk, NEW.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_birth_ad`;
CREATE TRIGGER `trg_scl_ben_birth_ad` AFTER DELETE ON `i_bornbirthdeatils` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT OLD.BeneficiaryRegID AS row_pk, OLD.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_address_ai`;
CREATE TRIGGER `trg_scl_ben_address_ai` AFTER INSERT ON `i_beneficiaryaddress` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenAddressId = NEW.BenAddressID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_address_au`;
CREATE TRIGGER `trg_scl_ben_address_au` AFTER UPDATE ON `i_beneficiaryaddress` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenAddressId = NEW.BenAddressID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_address_ad`;
CREATE TRIGGER `trg_scl_ben_address_ad` AFTER DELETE ON `i_beneficiaryaddress` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenAddressId = OLD.BenAddressID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_contacts_ai`;
CREATE TRIGGER `trg_scl_ben_contacts_ai` AFTER INSERT ON `i_beneficiarycontacts` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenContactsId = NEW.BenContactsID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_contacts_au`;
CREATE TRIGGER `trg_scl_ben_contacts_au` AFTER UPDATE ON `i_beneficiarycontacts` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenContactsId = NEW.BenContactsID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_contacts_ad`;
CREATE TRIGGER `trg_scl_ben_contacts_ad` AFTER DELETE ON `i_beneficiarycontacts` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenContactsId = OLD.BenContactsID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_image_ai`;
CREATE TRIGGER `trg_scl_ben_image_ai` AFTER INSERT ON `i_beneficiaryimage` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenImageId = NEW.BenImageId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_image_au`;
CREATE TRIGGER `trg_scl_ben_image_au` AFTER UPDATE ON `i_beneficiaryimage` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenImageId = NEW.BenImageId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_image_ad`;
CREATE TRIGGER `trg_scl_ben_image_ad` AFTER DELETE ON `i_beneficiaryimage` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenImageId = OLD.BenImageId) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_account_ai`;
CREATE TRIGGER `trg_scl_ben_account_ai` AFTER INSERT ON `i_beneficiaryaccount` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenAccountID = NEW.BenAccountID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_account_au`;
CREATE TRIGGER `trg_scl_ben_account_au` AFTER UPDATE ON `i_beneficiaryaccount` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenAccountID = NEW.BenAccountID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_ben_account_ad`;
CREATE TRIGGER `trg_scl_ben_account_ad` AFTER DELETE ON `i_beneficiaryaccount` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT m.BenRegId AS row_pk, m.BenRegId AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarymapping m WHERE m.BenAccountID = OLD.BenAccountID) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_household_ai`;
CREATE TRIGGER `trg_scl_household_ai` AFTER INSERT ON `i_householddetails` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT r.BeneficiaryRegID AS row_pk, r.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarydetails_rmnch r WHERE r.houseoldId = NEW.houseoldId UNION SELECT NEW.BeneficiaryRegID, NEW.BeneficiaryRegID, NULL) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_household_au`;
CREATE TRIGGER `trg_scl_household_au` AFTER UPDATE ON `i_householddetails` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT r.BeneficiaryRegID AS row_pk, r.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarydetails_rmnch r WHERE r.houseoldId = NEW.houseoldId UNION SELECT NEW.BeneficiaryRegID, NEW.BeneficiaryRegID, NULL) k WHERE k.row_pk IS NOT NULL;

DROP TRIGGER IF EXISTS `trg_scl_household_ad`;
CREATE TRIGGER `trg_scl_household_ad` AFTER DELETE ON `i_householddetails` FOR EACH ROW
  INSERT INTO db_iemr.t_sync_change_log (entity, row_pk, op, ben_reg_id, beneficiary_id)
  SELECT 'beneficiary', k.row_pk, 'U', k.ben_reg_id, k.beneficiary_id FROM (SELECT r.BeneficiaryRegID AS row_pk, r.BeneficiaryRegID AS ben_reg_id, NULL AS beneficiary_id FROM i_beneficiarydetails_rmnch r WHERE r.houseoldId = OLD.houseoldId UNION SELECT OLD.BeneficiaryRegID, OLD.BeneficiaryRegID, NULL) k WHERE k.row_pk IS NOT NULL;
