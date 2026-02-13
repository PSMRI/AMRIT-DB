use dbiemr;



alter table dbiemr.t_registrationfields modify Options varchar(500);

ALTER TABLE `dbiemr`.`m_providerserviceaddmapping` 
CHANGE COLUMN `AbdmFacilityID` `AbdmFacilityID` VARCHAR(100) NULL DEFAULT NULL ;


USE dbiemr;

-- 1️ Add column isNewAbha to t_healthid if it does not exist
SET @col_exists1 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_healthid'
      AND COLUMN_NAME = 'isNewAbha'
);

SET @sql1 := IF(
    @col_exists1 = 0,
    'ALTER TABLE t_healthid ADD COLUMN isNewAbha BIT(1) NULL DEFAULT 0 AFTER TxnID;',
    'SELECT "Column isNewAbha already exists";'
);

PREPARE stmt1 FROM @sql1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;


-- 2️ Add column isFurthercallrequired to t_mctsoutboundcalls if it does not exist
SET @col_exists2 := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_mctsoutboundcalls'
      AND COLUMN_NAME = 'isFurthercallrequired'
);

SET @sql2 := IF(
    @col_exists2 = 0,
    'ALTER TABLE t_mctsoutboundcalls ADD COLUMN isFurthercallrequired BIT(1);',
    'SELECT "Column isFurthercallrequired already exists";'
);

PREPARE stmt2 FROM @sql2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;

-- ALTER TABLE `dbiemr`.`t_healthid` 
-- add COLUMN `isNewAbha` bit(1)  NULL DEFAULT 0 AFTER `TxnID`;

-- alter table t_mctsoutboundcalls add isFurthercallrequired bit(1);

alter table non_pregnant_high_risk_assess modify id bigint NOT NULL  AUTO_INCREMENT;


alter table t_pnc_visit modify `pnc_date` timestamp NOT NULL;

alter table t_pnc_visit modify   `death_date` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

alter table tb_screening modify id bigint NOT NULL  AUTO_INCREMENT;

alter table tb_suspected modify id bigint NOT NULL  AUTO_INCREMENT;

 alter table non_pregnant_high_risk_track modify id bigint NOT NULL  AUTO_INCREMENT;

 alter table pregnant_high_risk_track modify id bigint NOT NULL  AUTO_INCREMENT;

