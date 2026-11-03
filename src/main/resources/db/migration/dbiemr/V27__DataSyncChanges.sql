UPDATE `db_iemr`.`m_synctabledetail` SET `ServerColumnName` = 'PermAddrLine1,PermAddrLine2,PermAddrLine3,PermCountryId,PermCountry,PermStateId,PermState,PermDistrictId,PermDistrict,PermSubDistrictId,PermSubDistrict,PermVillageId,PermVillage,PermHabitation,PermPinCode,PermZoneID,PermZone,PermAreaId,PermArea,PermServicePointId,PermServicePoint,PermCoordinate,CurrAddrLine1,CurrAddrLine2,CurrAddrLine3,CurrCountryId,CurrCountry,CurrStateId,CurrState,CurrDistrictId,CurrDistrict,CurrSubDistrictId,CurrSubDistrict,CurrVillageId,CurrVillage,CurrHabitation,CurrPinCode,CurrZoneID,CurrZone,CurrAreaId,CurrArea,CurrServicePointId,CurrServicePoint,CurrCoordinate,EmerAddrLine1,EmerAddrLine2,EmerAddrLine3,EmerCountryId,EmerCountry,EmerStateId,EmerState,EmerDistrictId,EmerDistrict,EmerSubDistrictId,EmerSubDistrict,EmerVillageId,EmerVillage,EmerHabitation,EmerPinCode,PermAddressValue,CurrAddressValue,EmerAddressValue,EmerZoneID,EmerZone,EmerAreaId,EmerArea,EmerServicePointId,EmerServicePoint,EmerCoordinate,Deleted,Processed,CreatedBy,CreatedDate,Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,LastModDate,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,SyncedDate,ReservedForChange' WHERE (`SyncTableDetailID` = '62');

UPDATE `db_iemr`.`m_synctabledetail` SET `VanColumnName` = 'BenRegId,BenDetailsId,BenAddressId,BenImageId,BenContactsId,BenConsentId,BenAccountID,BenSecureStackId,Deleted,Processed,CreatedBy,date_format(CreatedDate,\'%Y-%m-%d %H:%i:%s\'),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,\'%Y-%m-%d %H:%i:%s\'),BenMapId,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,\'%Y-%m-%d %H:%i:%s\'),ReservedForChange' WHERE (`SyncTableDetailID` = '65');

update `db_iemr`.`m_synctabledetail` SET `vancolumnname` = "ItemStockEntryID,FacilityID,Quantity,ProviderServiceMapID,ExitTypeID,ExitType,Deleted,Processed,CreatedBy,date_format(CreatedDate,'%Y-%m-%d %H:%i:%s'),ModifiedBy,date_format(LastModDate,'%Y-%m-%d %H:%i:%s'),ItemStockExitID,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,'%Y-%m-%d %H:%i:%s'),ReservedForChange" where (`tablename`='t_itemstockexit');

-- db_identity ALTER statements moved to dbidentity/V12__DataSync_SyncFailureReason.sql
use db_iemr;
-- ALTER TABLE t_benvisitdetail ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_phy_anthropometry ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_phy_vitals ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benadherence ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_anccare ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_pnccare ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_ncdscreening ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_ncdcare ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE i_ben_flow_outreach ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_covid19 ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_idrsdetails ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_physicalactivity ADD COLUMN SyncFailureReason VARCHAR(500);


SET @table_name = 't_benvisitdetail';
SET @column_name = 'SyncFailureReason';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_benvisitdetail: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_phy_anthropometry';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_phy_anthropometry: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_phy_vitals';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_phy_vitals: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benadherence';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_benadherence: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_anccare';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_anccare: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_pnccare';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_pnccare: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_ncdscreening';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_ncdscreening: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_ncdcare';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_ncdcare: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 'i_ben_flow_outreach';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''i_ben_flow_outreach: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_covid19';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_covid19: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_idrsdetails';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_idrsdetails: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_physicalactivity';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), 'SELECT ''t_physicalactivity: skipped'' AS Result');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- Group 3
-- ALTER TABLE t_phy_generalexam ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_phy_headtotoe ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_obstetric ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_gastrointestinal ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_cardiovascular ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_respiratory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_centralnervous ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_musculoskeletalsystem ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_sys_genitourinarysystem ADD COLUMN SyncFailureReason VARCHAR(500);


SET @column_name = 'SyncFailureReason';

SET @table_name = 't_phy_generalexam';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_phy_headtotoe';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_obstetric';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_gastrointestinal';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_cardiovascular';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_respiratory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_centralnervous';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_musculoskeletalsystem';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_sys_genitourinarysystem';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Group 4
-- ALTER TABLE t_ancdiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_ncddiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_pncdiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benclinicalobservation ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_prescription ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_prescribeddrug ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_lab_testorder ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benreferdetails ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_BenChiefComplaint ADD COLUMN SyncFailureReason VARCHAR(500);


SET @column_name = 'SyncFailureReason';

SET @table_name = 't_ancdiagnosis';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_ncddiagnosis';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_pncdiagnosis';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benclinicalobservation';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_prescription';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_prescribeddrug';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_lab_testorder';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benreferdetails';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_BenChiefComplaint';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;


-- Group 5
-- ALTER TABLE t_lab_testresult ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_physicalstockentry ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_patientissue ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_facilityconsumption ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_itemstockentry ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_itemstockexit ADD COLUMN SyncFailureReason VARCHAR(500);


SET @column_name = 'SyncFailureReason';

SET @table_name = 't_lab_testresult';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_physicalstockentry';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_patientissue';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_facilityconsumption';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_itemstockentry';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_itemstockexit';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Group 6
-- ALTER TABLE t_benmedhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_femaleobstetrichistory  ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benmenstrualdetails ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benpersonalhabit ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_childvaccinedetail1 ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_childvaccinedetail2 ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_childoptionalvaccinedetail ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_ancwomenvaccinedetail ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_childfeedinghistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benallergyhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_bencomorbiditycondition ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benmedicationhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_benfamilyhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_perinatalhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_developmenthistory ADD COLUMN SyncFailureReason VARCHAR(500);


SET @column_name = 'SyncFailureReason';

SET @table_name = 't_benmedhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_femaleobstetrichistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benmenstrualdetails';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benpersonalhabit';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_childvaccinedetail1';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_childvaccinedetail2';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_childoptionalvaccinedetail';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_ancwomenvaccinedetail';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_childfeedinghistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benallergyhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_bencomorbiditycondition';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benmedicationhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_benfamilyhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_perinatalhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_developmenthistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



-- Group 7
-- ALTER TABLE t_cancerfamilyhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerpersonalhistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerdiethistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerobstetrichistory ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancervitals ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancersignandsymptoms ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerlymphnode ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_canceroralexamination ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerbreastexamination ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerabdominalexamination ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancergynecologicalexamination ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerdiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_cancerimageannotation ADD COLUMN SyncFailureReason VARCHAR(500);




SET @column_name = 'SyncFailureReason';

SET @table_name = 't_cancerfamilyhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerpersonalhistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerdiethistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerobstetrichistory';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancervitals';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancersignandsymptoms';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerlymphnode';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_canceroralexamination';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerbreastexamination';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerabdominalexamination';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancergynecologicalexamination';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerdiagnosis';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_cancerimageannotation';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ALTER TABLE t_stockadjustment ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_stocktransfer ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_patientreturn ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_indent ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_indentissue ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_indentorder ADD COLUMN SyncFailureReason VARCHAR(500);
-- ALTER TABLE t_saitemmapping ADD COLUMN SyncFailureReason VARCHAR(500);



SET @column_name = 'SyncFailureReason';

SET @table_name = 't_stockadjustment';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_stocktransfer';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_patientreturn';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_indent';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_indentissue';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_indentorder';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @table_name = 't_saitemmapping';
SELECT COUNT(*) INTO @col_exists FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;
SET @sql = IF(@col_exists = 0, CONCAT('ALTER TABLE `', @table_name, '` ADD COLUMN `', @column_name, '` VARCHAR(500)'), CONCAT('SELECT ''', @table_name, ': skipped'' AS Result'));
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
