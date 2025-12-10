UPDATE `db_iemr`.`m_synctabledetail` SET `ServerColumnName` = 'PermAddrLine1,PermAddrLine2,PermAddrLine3,PermCountryId,PermCountry,PermStateId,PermState,PermDistrictId,PermDistrict,PermSubDistrictId,PermSubDistrict,PermVillageId,PermVillage,PermHabitation,PermPinCode,PermZoneID,PermZone,PermAreaId,PermArea,PermServicePointId,PermServicePoint,PermCoordinate,CurrAddrLine1,CurrAddrLine2,CurrAddrLine3,CurrCountryId,CurrCountry,CurrStateId,CurrState,CurrDistrictId,CurrDistrict,CurrSubDistrictId,CurrSubDistrict,CurrVillageId,CurrVillage,CurrHabitation,CurrPinCode,CurrZoneID,CurrZone,CurrAreaId,CurrArea,CurrServicePointId,CurrServicePoint,CurrCoordinate,EmerAddrLine1,EmerAddrLine2,EmerAddrLine3,EmerCountryId,EmerCountry,EmerStateId,EmerState,EmerDistrictId,EmerDistrict,EmerSubDistrictId,EmerSubDistrict,EmerVillageId,EmerVillage,EmerHabitation,EmerPinCode,PermAddressValue,CurrAddressValue,EmerAddressValue,EmerZoneID,EmerZone,EmerAreaId,EmerArea,EmerServicePointId,EmerServicePoint,EmerCoordinate,Deleted,Processed,CreatedBy,CreatedDate,Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,LastModDate,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,SyncedDate,ReservedForChange' WHERE (`SyncTableDetailID` = '62');

UPDATE `db_iemr`.`m_synctabledetail` SET `VanColumnName` = 'BenRegId,BenDetailsId,BenAddressId,BenImageId,BenContactsId,BenConsentId,BenAccountID,BenSecureStackId,Deleted,Processed,CreatedBy,date_format(CreatedDate,\'%Y-%m-%d %H:%i:%s\'),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,\'%Y-%m-%d %H:%i:%s\'),BenMapId,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,\'%Y-%m-%d %H:%i:%s\'),ReservedForChange' WHERE (`SyncTableDetailID` = '65');

update `db_iemr`.`m_synctabledetail` SET `vancolumnname` = "ItemStockEntryID,FacilityID,Quantity,ProviderServiceMapID,ExitTypeID,ExitType,Deleted,Processed,CreatedBy,date_format(CreatedDate,'%Y-%m-%d %H:%i:%s'),ModifiedBy,date_format(LastModDate,'%Y-%m-%d %H:%i:%s'),ItemStockExitID,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,'%Y-%m-%d %H:%i:%s'),ReservedForChange" where (`tablename`='t_itemstockexit');

use db_identity;
ALTER TABLE i_beneficiaryaccount ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiaryaddress ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiarycontacts ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiaryconsent ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiarydetails ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiaryfamilymapping ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiaryidentity ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiaryimage ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiarymapping ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_beneficiaryservicemapping ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE m_beneficiaryregidmapping ADD COLUMN SyncFailureReason VARCHAR(500);
use db_iemr;
ALTER TABLE t_benvisitdetail ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_phy_anthropometry ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_phy_vitals ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benadherence ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_anccare ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_pnccare ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_ncdscreening ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_ncdcare ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE i_ben_flow_outreach ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_covid19 ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_idrsdetails ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_physicalactivity ADD COLUMN SyncFailureReason VARCHAR(500);

-- Group 3
ALTER TABLE t_phy_generalexam ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_phy_headtotoe ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_obstetric ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_gastrointestinal ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_cardiovascular ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_respiratory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_centralnervous ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_musculoskeletalsystem ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_sys_genitourinarysystem ADD COLUMN SyncFailureReason VARCHAR(500);

-- Group 4
ALTER TABLE t_ancdiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_ncddiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_pncdiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benclinicalobservation ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_prescription ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_prescribeddrug ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_lab_testorder ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benreferdetails ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_BenChiefComplaint ADD COLUMN SyncFailureReason VARCHAR(500);

-- Group 5
ALTER TABLE t_lab_testresult ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_physicalstockentry ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_patientissue ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_facilityconsumption ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_itemstockentry ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_itemstockexit ADD COLUMN SyncFailureReason VARCHAR(500);

-- Group 6
ALTER TABLE t_benmedhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_femaleobstetrichistory  ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benmenstrualdetails ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benpersonalhabit ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_childvaccinedetail1 ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_childvaccinedetail2 ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_childoptionalvaccinedetail ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_ancwomenvaccinedetail ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_childfeedinghistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benallergyhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_bencomorbiditycondition ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benmedicationhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_benfamilyhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_perinatalhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_developmenthistory ADD COLUMN SyncFailureReason VARCHAR(500);

-- Group 7
ALTER TABLE t_cancerfamilyhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerpersonalhistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerdiethistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerobstetrichistory ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancervitals ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancersignandsymptoms ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerlymphnode ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_canceroralexamination ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerbreastexamination ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerabdominalexamination ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancergynecologicalexamination ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerdiagnosis ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_cancerimageannotation ADD COLUMN SyncFailureReason VARCHAR(500);

ALTER TABLE t_stockadjustment ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_stocktransfer ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_patientreturn ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_indent ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_indentissue ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_indentorder ADD COLUMN SyncFailureReason VARCHAR(500);
ALTER TABLE t_saitemmapping ADD COLUMN SyncFailureReason VARCHAR(500);
