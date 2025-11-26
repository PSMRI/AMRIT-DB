use db_iemr;



alter table db_iemr.t_registrationfields modify Options varchar(500);

ALTER TABLE `db_iemr`.`m_providerserviceaddmapping` 
CHANGE COLUMN `AbdmFacilityID` `AbdmFacilityID` VARCHAR(100) NULL DEFAULT NULL ;

ALTER TABLE `db_iemr`.`t_healthid` 
add COLUMN `isNewAbha` bit(1)  NULL DEFAULT 0 AFTER `TxnID`;

alter table t_mctsoutboundcalls add isFurthercallrequired bit(1);

alter table non_pregnant_high_risk_assess modify id bigint NOT NULL  AUTO_INCREMENT;


alter table t_pnc_visit modify `pnc_date` timestamp NOT NULL;

alter table t_pnc_visit modify   `death_date` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

alter table tb_screening modify id bigint NOT NULL  AUTO_INCREMENT;

alter table tb_suspected modify id bigint NOT NULL  AUTO_INCREMENT;

 alter table non_pregnant_high_risk_track modify id bigint NOT NULL  AUTO_INCREMENT;

 alter table pregnant_high_risk_track modify id bigint NOT NULL  AUTO_INCREMENT;

