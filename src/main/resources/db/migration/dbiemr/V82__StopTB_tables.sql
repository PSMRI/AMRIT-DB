USE db_iemr;

-- ─────────────────────────────────────────────────────────────────────────────
-- Stop TB: new tables
-- ─────────────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS `tb_stoptb_general_examination` (
  `id`                              BIGINT       NOT NULL AUTO_INCREMENT,
  `beneficiary_reg_id`              BIGINT       DEFAULT NULL,
  `provider_service_map_id`         INT          DEFAULT NULL,
  `pulse_rate`                      INT          DEFAULT NULL,
  `systolic_bp`                     INT          DEFAULT NULL,
  `diastolic_bp`                    INT          DEFAULT NULL,
  `random_blood_sugar`              DOUBLE       DEFAULT NULL,
  `pallor_id`                       INT          DEFAULT NULL,
  `pallor`                          VARCHAR(50)  DEFAULT NULL,
  `icterus_id`                      INT          DEFAULT NULL,
  `icterus`                         VARCHAR(50)  DEFAULT NULL,
  `lymphadenopathy_id`              INT          DEFAULT NULL,
  `lymphadenopathy`                 VARCHAR(50)  DEFAULT NULL,
  `oedema_id`                       INT          DEFAULT NULL,
  `oedema`                          VARCHAR(50)  DEFAULT NULL,
  `cyanosis_id`                     INT          DEFAULT NULL,
  `cyanosis`                        VARCHAR(50)  DEFAULT NULL,
  `clubbing_id`                     INT          DEFAULT NULL,
  `clubbing`                        VARCHAR(50)  DEFAULT NULL,
  `key_population_risk_factor_ids`  TEXT         DEFAULT NULL,
  `key_population_risk_factors`     TEXT         DEFAULT NULL,
  `hiv_status_id`                   INT          DEFAULT NULL,
  `hiv_status`                      VARCHAR(50)  DEFAULT NULL,
  `referral_to_hwc_needed_id`       INT          DEFAULT NULL,
  `referral_to_hwc_needed`          TINYINT(1)   DEFAULT NULL,
  `created_by`                      VARCHAR(255) DEFAULT NULL,
  `created_date`                    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by`                     VARCHAR(255) DEFAULT NULL,
  `last_mod_date`                   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted`                         TINYINT(1)   DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ─────────────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS `tb_stoptb_general_opd` (
  `id`                      BIGINT       NOT NULL AUTO_INCREMENT,
  `ben_reg_id`              BIGINT       DEFAULT NULL,
  `provider_service_map_id` INT          DEFAULT NULL,
  `chief_complaint`         TEXT         DEFAULT NULL,
  `medication`              TEXT         DEFAULT NULL,
  `dosage`                  VARCHAR(255) DEFAULT NULL,
  `frequency`               VARCHAR(100) DEFAULT NULL,
  `duration`                VARCHAR(100) DEFAULT NULL,
  `notes`                   TEXT         DEFAULT NULL,
  `created_by`              VARCHAR(255) DEFAULT NULL,
  `created_date`            TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by`             VARCHAR(255) DEFAULT NULL,
  `last_mod_date`           TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted`                 TINYINT(1)   DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ─────────────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS `tb_stoptb_diagnostics` (
  `id`                                    BIGINT       NOT NULL AUTO_INCREMENT,
  `ben_reg_id`                            BIGINT       DEFAULT NULL,
  `provider_service_map_id`               INT          DEFAULT NULL,
  `visit_date`                            TIMESTAMP    NULL DEFAULT NULL,
  `nikshay_id`                            VARCHAR(50)  DEFAULT NULL,
  `is_referred_for_digital_chest_xray`    TINYINT(1)   DEFAULT NULL,
  `reason_for_denial_chest_xray`          VARCHAR(255) DEFAULT NULL,
  `reason_for_denial_chest_xray_other`    VARCHAR(255) DEFAULT NULL,
  `is_digital_chest_xray_conducted_id`    INT          DEFAULT NULL,
  `is_digital_chest_xray_conducted`       TINYINT(1)   DEFAULT NULL,
  `reason_not_conducted_chest_xray`       VARCHAR(255) DEFAULT NULL,
  `reason_not_conducted_chest_xray_other` VARCHAR(255) DEFAULT NULL,
  `digital_chest_xray_result_id`          INT          DEFAULT NULL,
  `digital_chest_xray_result`             VARCHAR(20)  DEFAULT NULL,
  `is_referred_for_sputum_collection`     TINYINT(1)   DEFAULT NULL,
  `reason_for_denial_sputum`              VARCHAR(500) DEFAULT NULL,
  `reason_for_denial_sputum_other`        VARCHAR(255) DEFAULT NULL,
  `sputum_submitted_at`                   VARCHAR(255) DEFAULT NULL,
  `is_truenat_conducted_id`               INT          DEFAULT NULL,
  `is_truenat_conducted`                  TINYINT(1)   DEFAULT NULL,
  `reason_not_conducted_naat`             VARCHAR(255) DEFAULT NULL,
  `reason_not_conducted_naat_other`       VARCHAR(255) DEFAULT NULL,
  `truenat_result_id`                     INT          DEFAULT NULL,
  `truenat_result`                        VARCHAR(20)  DEFAULT NULL,
  `recommended_for_liquid_culture_id`     INT          DEFAULT NULL,
  `recommended_for_liquid_culture`        TINYINT(1)   DEFAULT NULL,
  `liquid_culture_result_id`              INT          DEFAULT NULL,
  `liquid_culture_result`                 VARCHAR(20)  DEFAULT NULL,
  `created_by`                            VARCHAR(255) DEFAULT NULL,
  `created_date`                          TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by`                           VARCHAR(255) DEFAULT NULL,
  `last_mod_date`                         TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted`                               TINYINT(1)   DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ─────────────────────────────────────────────────────────────────────────────
-- Stop TB: new columns on existing tb_screening table
-- ─────────────────────────────────────────────────────────────────────────────

SET @schema = 'db_iemr';
SET @table  = 'tb_screening';

-- cough_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN cough_check_id INT DEFAULT NULL;',
  'SELECT "cough_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='cough_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- blood_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN blood_check_id INT DEFAULT NULL;',
  'SELECT "blood_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='blood_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- fever_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN fever_check_id INT DEFAULT NULL;',
  'SELECT "fever_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='fever_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- weight_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN weight_check_id INT DEFAULT NULL;',
  'SELECT "weight_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='weight_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- sweats_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN sweats_check_id INT DEFAULT NULL;',
  'SELECT "sweats_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='sweats_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- history_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN history_check_id INT DEFAULT NULL;',
  'SELECT "history_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='history_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- drugs_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN drugs_check_id INT DEFAULT NULL;',
  'SELECT "drugs_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='drugs_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- family_check_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN family_check_id INT DEFAULT NULL;',
  'SELECT "family_check_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='family_check_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- rise_of_fever_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN rise_of_fever_id INT DEFAULT NULL;',
  'SELECT "rise_of_fever_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='rise_of_fever_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- loss_of_appetite_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN loss_of_appetite_id INT DEFAULT NULL;',
  'SELECT "loss_of_appetite_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='loss_of_appetite_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ben_reg_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN ben_reg_id BIGINT DEFAULT NULL;',
  'SELECT "ben_reg_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='ben_reg_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- provider_service_map_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN provider_service_map_id INT DEFAULT NULL;',
  'SELECT "provider_service_map_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='provider_service_map_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- created_by
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN created_by VARCHAR(255) DEFAULT NULL;',
  'SELECT "created_by exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='created_by');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- modified_by
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN modified_by VARCHAR(255) DEFAULT NULL;',
  'SELECT "modified_by exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='modified_by');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- last_mod_date
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN last_mod_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;',
  'SELECT "last_mod_date exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='last_mod_date');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- deleted
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN deleted TINYINT(1) DEFAULT 0;',
  'SELECT "deleted exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='deleted');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- referred_for_digital_chest_xray_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN referred_for_digital_chest_xray_id INT DEFAULT NULL;',
  'SELECT "referred_for_digital_chest_xray_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='referred_for_digital_chest_xray_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- referred_for_digital_chest_xray
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN referred_for_digital_chest_xray TINYINT(1) DEFAULT NULL;',
  'SELECT "referred_for_digital_chest_xray exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='referred_for_digital_chest_xray');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- referred_for_sputum_collection_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN referred_for_sputum_collection_id INT DEFAULT NULL;',
  'SELECT "referred_for_sputum_collection_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='referred_for_sputum_collection_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- referred_for_sputum_collection
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN referred_for_sputum_collection TINYINT(1) DEFAULT NULL;',
  'SELECT "referred_for_sputum_collection exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='referred_for_sputum_collection');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- sputum_sample_submitted_at
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN sputum_sample_submitted_at VARCHAR(50) DEFAULT NULL;',
  'SELECT "sputum_sample_submitted_at exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='sputum_sample_submitted_at');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- recommended_for_truenat_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN recommended_for_truenat_id INT DEFAULT NULL;',
  'SELECT "recommended_for_truenat_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='recommended_for_truenat_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- recommended_for_truenat
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN recommended_for_truenat TINYINT(1) DEFAULT NULL;',
  'SELECT "recommended_for_truenat exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='recommended_for_truenat');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- recommended_for_liquid_culture_id
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN recommended_for_liquid_culture_id INT DEFAULT NULL;',
  'SELECT "recommended_for_liquid_culture_id exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='recommended_for_liquid_culture_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- recommended_for_liquid_culture
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN recommended_for_liquid_culture TINYINT(1) DEFAULT NULL;',
  'SELECT "recommended_for_liquid_culture exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='recommended_for_liquid_culture');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- test_denial_reasons
SET @sql = (SELECT IF(COUNT(*)=0,
  'ALTER TABLE db_iemr.tb_screening ADD COLUMN test_denial_reasons TEXT DEFAULT NULL;',
  'SELECT "test_denial_reasons exists";')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=@schema AND TABLE_NAME=@table AND COLUMN_NAME='test_denial_reasons');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
