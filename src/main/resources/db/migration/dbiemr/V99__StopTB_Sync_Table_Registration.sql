USE db_iemr;

-- ============================================================
-- Registers 7 Stop TB tables into m_synctabledetail (SyncTableGroupID=11,
-- "Stop TB" group) so MMU-API's van-side sync process actually attempts to
-- push them. Without a row here, a table is never even considered by the
-- sync's table-list query, regardless of whether central accepts it.
-- tb_diagnostic_provider_token deliberately NOT registered here - it's local
-- EMRLite auth/session state, not beneficiary data, and shouldn't sync.
-- Companion fix (not in this file): MMU-API's DataSyncRepositoryCentral.
-- VALID_TABLES needs these same table names added on the central side, or
-- central will reject pushes for them even once the van starts sending them.
-- ============================================================

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_iemr', 'tb_diagnostic_order',
    'order_event,beneficiary_id,provider_service_name,provider_code,order_type,external_order_id,provider_order_id,status,retry_count,last_polled_at,retried_at,error_message,reason_for_refusal,push_response_json,patient_first_name,patient_last_name,patient_date_of_birth,patient_sex,created_by,created_date,modified_by,last_mod_date,deleted,vanID,parkingPlaceID,visitCode,processed,vanSerialNo',
    'order_event,beneficiary_id,provider_service_name,provider_code,order_type,external_order_id,provider_order_id,status,retry_count,date_format(last_polled_at,''%Y-%m-%d %H:%i:%s''),date_format(retried_at,''%Y-%m-%d %H:%i:%s''),error_message,reason_for_refusal,push_response_json,patient_first_name,patient_last_name,patient_date_of_birth,patient_sex,created_by,date_format(created_date,''%Y-%m-%d %H:%i:%s''),modified_by,date_format(last_mod_date,''%Y-%m-%d %H:%i:%s''),deleted,vanID,parkingPlaceID,visitCode,processed,vanSerialNo',
    'vanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'tb_diagnostic_order' AND SyncTableGroupID = 11
);

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_iemr', 'tb_diagnostic_result',
    'diagnostic_order_id,beneficiary_id,provider_status,result_summary,raw_response_json,tb_presence,tb_confidence,drug_resistance_presence,created_by,created_date,modified_by,last_mod_date,deleted,vanID,parkingPlaceID,vanSerialNo',
    'diagnostic_order_id,beneficiary_id,provider_status,result_summary,raw_response_json,tb_presence,tb_confidence,drug_resistance_presence,created_by,date_format(created_date,''%Y-%m-%d %H:%i:%s''),modified_by,date_format(last_mod_date,''%Y-%m-%d %H:%i:%s''),deleted,vanID,parkingPlaceID,vanSerialNo',
    'vanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'tb_diagnostic_result' AND SyncTableGroupID = 11
);

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_iemr', 'tb_diagnostic_document',
    'diagnostic_order_id,beneficiary_id,order_type,asset_type,document_type,epoch_time,stored_file_name,stored_path,sha256_hash,content_type,original_file_name,created_by,created_date,modified_by,last_mod_date,deleted,vanID,parkingPlaceID,vanSerialNo',
    'diagnostic_order_id,beneficiary_id,order_type,asset_type,document_type,epoch_time,stored_file_name,stored_path,sha256_hash,content_type,original_file_name,created_by,date_format(created_date,''%Y-%m-%d %H:%i:%s''),modified_by,date_format(last_mod_date,''%Y-%m-%d %H:%i:%s''),deleted,vanID,parkingPlaceID,vanSerialNo',
    'vanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'tb_diagnostic_document' AND SyncTableGroupID = 11
);

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_identity', 'i_beneficiarydetails_rmnch',
    'BeneficiaryRegID,aadhaNo,aadha_no,aadha_noId,age,ageAtMarriage,age_unit,age_unitId,childRegisteredAWCID,childRegisteredSchoolID,dateofdelivey,expectedDateofDelivery,facilitySectionID,guidelineid,houseoldId,lastDeliveryConductedID,lastMenstrualPeriod,latitude,lengthofMenstrualCycleId,literacyId,longitude,menstrualBFDId,menstrualProblemId,menstrualStatusId,mobileOthers,mobilenoofRelation,mobilenoofRelationId,motherName,ncd_priority,need_opcareId,previousLiveBirth,rchid,registrationDate,registrationType,regularityofMenstrualCycleId,religionOthers,reproductiveStatus,reproductiveStatusId,serverUpdatedStatus,typeofSchoolID,whoConductedDeliveryID,nayiPahalDeliveryStatus,nayiPahalDeliveryStatusPosition,dateMarriage,noOfDaysForDelivery,Deleted,Processed,CreatedBy,CreatedDate,Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,LastModDate,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,SyncedDate,ProviderServiceMapID,deviceId,beneficiaryId,RelatedBeneficiaryIds,HRPStatus,ImmunizationStatus,NishchayPregnancyStatus,NishchayPregnancyStatusPosition,NishchayDeliveryStatus,NishchayDeliveryStatusPosition,FamilyHeadRelation,FamilyHeadRelationPosition,MenstrualStatus,ComplicationsOthers,WhoConductedDelivery,LastDeliveryConducted,FacilitySelection,DeliveryDate,ChildRegisteredSchool,TypeOfSchool,isDeath,isDeathValue,timeOfDeath,reasonOfDeath,reasonOfDeathId,placeOfDeath,placeOfDeathId,otherPlaceOfDeath,dateOfDeath,isSpouseAdded,isChildrenAdded,isMarried,doYouHavechildren,noOfchildren,noofAlivechildren,isDeactivate,gpsLatitude,gpsLongitude,digipin,gpsTimestamp,isGpsUnavailable,gpsUnavailableReason,placeOfCurrentLiving,otherPlaceOfCurrentLiving,institutionName',
    'BeneficiaryRegID,aadhaNo,aadha_no,aadha_noId,age,ageAtMarriage,age_unit,age_unitId,childRegisteredAWCID,childRegisteredSchoolID,date_format(dateofdelivey,''%Y-%m-%d %H:%i:%s''),date_format(expectedDateofDelivery,''%Y-%m-%d %H:%i:%s''),facilitySectionID,guidelineid,houseoldId,lastDeliveryConductedID,lastMenstrualPeriod,latitude,lengthofMenstrualCycleId,literacyId,longitude,menstrualBFDId,menstrualProblemId,menstrualStatusId,mobileOthers,mobilenoofRelation,mobilenoofRelationId,motherName,ncd_priority,need_opcareId,previousLiveBirth,rchid,date_format(registrationDate,''%Y-%m-%d %H:%i:%s''),registrationType,regularityofMenstrualCycleId,religionOthers,reproductiveStatus,reproductiveStatusId,serverUpdatedStatus,typeofSchoolID,whoConductedDeliveryID,nayiPahalDeliveryStatus,nayiPahalDeliveryStatusPosition,date_format(dateMarriage,''%Y-%m-%d %H:%i:%s''),noOfDaysForDelivery,Deleted,Processed,CreatedBy,date_format(CreatedDate,''%Y-%m-%d %H:%i:%s''),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,''%Y-%m-%d %H:%i:%s''),VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,''%Y-%m-%d %H:%i:%s''),ProviderServiceMapID,deviceId,beneficiaryId,RelatedBeneficiaryIds,HRPStatus,ImmunizationStatus,NishchayPregnancyStatus,NishchayPregnancyStatusPosition,NishchayDeliveryStatus,NishchayDeliveryStatusPosition,FamilyHeadRelation,FamilyHeadRelationPosition,MenstrualStatus,ComplicationsOthers,WhoConductedDelivery,LastDeliveryConducted,FacilitySelection,DeliveryDate,ChildRegisteredSchool,TypeOfSchool,isDeath,isDeathValue,timeOfDeath,reasonOfDeath,reasonOfDeathId,placeOfDeath,placeOfDeathId,otherPlaceOfDeath,dateOfDeath,isSpouseAdded,isChildrenAdded,isMarried,doYouHavechildren,noOfchildren,noofAlivechildren,isDeactivate,gpsLatitude,gpsLongitude,digipin,date_format(gpsTimestamp,''%Y-%m-%d %H:%i:%s''),isGpsUnavailable,gpsUnavailableReason,placeOfCurrentLiving,otherPlaceOfCurrentLiving,institutionName',
    'VanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'i_beneficiarydetails_rmnch' AND SyncTableGroupID = 11
);

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_identity', 'i_bornbirthdeatils',
    'BeneficiaryRegID,beneficiaryId,countryid,bcdBatchNo,bcgDate,bcgGivenDueDate,birthDefects,birthDefectsOthers,birthDefectsid,birthDosage,birthDosageid,birthPlace,birthPlaceid,childName,complecations,complecationsid,conductedDelivery,conductedDeliveryOther,conductedDeliveryid,corticosteroidGivenMother,corticosteroidGivenMotherid,criedImmediately,criedImmediatelyid,deliveryType,deliveryTypeOther,deliveryTypeid,facilityName,facilityOther,facilityid,feedingStarted,feedingStartedid,gestationalAge,gestationalAgeid,heightAtBirth,hptDate,hptGivenDueDate,hptdBatchNo,hptdBatchID,opvBatchNo,opvDate,opvGivenDueDate,placeName,serverUpdatedStatus,term,termid,vitaminkBatchNo,vitaminkDate,vitaminkGivenDueDate,weightAtBirth,stateid,districtid,villageid,birthBCG,birthHepB,birthOPV,Deleted,Processed,CreatedBy,CreatedDate,Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,LastModDate,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,SyncedDate,ProviderServiceMapID,deviceId,ComplicationsOther,birthCertificateFileFrontView,birthCertificateFileBackView',
    'BeneficiaryRegID,beneficiaryId,countryid,bcdBatchNo,date_format(bcgDate,''%Y-%m-%d %H:%i:%s''),date_format(bcgGivenDueDate,''%Y-%m-%d %H:%i:%s''),birthDefects,birthDefectsOthers,birthDefectsid,birthDosage,birthDosageid,birthPlace,birthPlaceid,childName,complecations,complecationsid,conductedDelivery,conductedDeliveryOther,conductedDeliveryid,corticosteroidGivenMother,corticosteroidGivenMotherid,criedImmediately,criedImmediatelyid,deliveryType,deliveryTypeOther,deliveryTypeid,facilityName,facilityOther,facilityid,feedingStarted,feedingStartedid,gestationalAge,gestationalAgeid,heightAtBirth,date_format(hptDate,''%Y-%m-%d %H:%i:%s''),date_format(hptGivenDueDate,''%Y-%m-%d %H:%i:%s''),hptdBatchNo,hptdBatchID,opvBatchNo,date_format(opvDate,''%Y-%m-%d %H:%i:%s''),date_format(opvGivenDueDate,''%Y-%m-%d %H:%i:%s''),placeName,serverUpdatedStatus,term,termid,vitaminkBatchNo,date_format(vitaminkDate,''%Y-%m-%d %H:%i:%s''),date_format(vitaminkGivenDueDate,''%Y-%m-%d %H:%i:%s''),weightAtBirth,stateid,districtid,villageid,birthBCG,birthHepB,birthOPV,Deleted,Processed,CreatedBy,date_format(CreatedDate,''%Y-%m-%d %H:%i:%s''),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,''%Y-%m-%d %H:%i:%s''),VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,''%Y-%m-%d %H:%i:%s''),ProviderServiceMapID,deviceId,ComplicationsOther,birthCertificateFileFrontView,birthCertificateFileBackView',
    'VanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'i_bornbirthdeatils' AND SyncTableGroupID = 11
);

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_identity', 'i_householddetails',
    'BeneficiaryRegID,Countyid,availabilityofToilet,availabilityofToiletId,avalabilityofElectricity,avalabilityofElectricityId,block,bpl_aplId,colony,district,districtid,districtname,familyHeadName,familyHeadPhoneNo,familyName,fuelUsed,fuelUsedId,houseOwnerShip,houseOwnerShipId,houseType,houseTypeId,houseno,houseoldId,landIrregatedId,landOwnedId,liveStockOwnerShipId,motarizedVehicleId,other_availabilityofToilet,other_avalabilityofElectricity,other_fuelUsed,other_houseType,other_motarizedVehicle,other_residentialArea,other_sourceofDrinkingWater,pincode,rationCardDetails,residentialArea,residentialAreaId,seperateKitchen,seperateKitchenId,serverUpdatedStatus,sourceofDrinkingWater,sourceofDrinkingWaterId,state,stateid,street,type_bpl_apl,village,villageid,houseNum,wardNo,wardName,mohallaName,Deleted,Processed,CreatedBy,CreatedDate,Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,LastModDate,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,SyncedDate,ProviderServiceMapID,deviceId,beneficiaryId,LiveStockOwnerShip,MotarizedVehicle,LandOwned,Blockid,landIrregated,isDeactivate,gpsLatitude,gpsLongitude,digipin,gpsTimestamp,isGpsUnavailable,gpsUnavailableReason,address,totalHhMembers,registeredAtCampSite,registeredAtCampSiteId',
    'BeneficiaryRegID,Countyid,availabilityofToilet,availabilityofToiletId,avalabilityofElectricity,avalabilityofElectricityId,block,bpl_aplId,colony,district,districtid,districtname,familyHeadName,familyHeadPhoneNo,familyName,fuelUsed,fuelUsedId,houseOwnerShip,houseOwnerShipId,houseType,houseTypeId,houseno,houseoldId,landIrregatedId,landOwnedId,liveStockOwnerShipId,motarizedVehicleId,other_availabilityofToilet,other_avalabilityofElectricity,other_fuelUsed,other_houseType,other_motarizedVehicle,other_residentialArea,other_sourceofDrinkingWater,pincode,rationCardDetails,residentialArea,residentialAreaId,seperateKitchen,seperateKitchenId,serverUpdatedStatus,sourceofDrinkingWater,sourceofDrinkingWaterId,state,stateid,street,type_bpl_apl,village,villageid,houseNum,wardNo,wardName,mohallaName,Deleted,Processed,CreatedBy,date_format(CreatedDate,''%Y-%m-%d %H:%i:%s''),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,''%Y-%m-%d %H:%i:%s''),VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,''%Y-%m-%d %H:%i:%s''),ProviderServiceMapID,deviceId,beneficiaryId,LiveStockOwnerShip,MotarizedVehicle,LandOwned,Blockid,landIrregated,isDeactivate,gpsLatitude,gpsLongitude,digipin,date_format(gpsTimestamp,''%Y-%m-%d %H:%i:%s''),isGpsUnavailable,gpsUnavailableReason,address,totalHhMembers,registeredAtCampSite,registeredAtCampSiteId',
    'VanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'i_householddetails' AND SyncTableGroupID = 11
);

INSERT INTO db_iemr.m_synctabledetail
    (SchemaName, TableName, ServerColumnName, VanColumnName, VanAutoIncColumnName,
     IsMaster, SyncTableGroupID, Deleted, Processed, CreatedBy, CreatedDate)
SELECT
    'db_iemr', 'tb_stoptb_visit',
    'beneficiary_reg_id,visit_no,visit_date,provider_service_map_id,created_by,nurse_completed_flag,doctor_completed_flag,counsellor_completed_flag,vanID,parkingPlaceID,processed,vanSerialNo,SyncedDate,Syncedby,SyncFailureReason',
    'beneficiary_reg_id,visit_no,date_format(visit_date,''%Y-%m-%d %H:%i:%s''),provider_service_map_id,created_by,nurse_completed_flag,doctor_completed_flag,counsellor_completed_flag,vanID,parkingPlaceID,processed,vanSerialNo,date_format(SyncedDate,''%Y-%m-%d %H:%i:%s''),Syncedby,SyncFailureReason',
    'vanSerialNo', 0, 11, 0, 'N', 'Admin', NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM db_iemr.m_synctabledetail WHERE TableName = 'tb_stoptb_visit' AND SyncTableGroupID = 11
);

-- ============================================================
-- Fix: i_beneficiarydetails_rmnch/i_householddetails/i_bornbirthdeatils have
-- their real column named VanSerialNo (capital V), not vanSerialNo like the
-- tb_* tables - the 3 INSERTs above already register them correctly, this
-- UPDATE is a no-op safeguard for anyone who runs this against a DB where
-- those rows were previously inserted with the wrong case by hand.
-- ============================================================
UPDATE db_iemr.m_synctabledetail SET VanAutoIncColumnName = 'VanSerialNo'
WHERE TableName IN ('i_beneficiarydetails_rmnch','i_householddetails','i_bornbirthdeatils') AND SyncTableGroupID = 11;

-- ============================================================
-- Fix: i_ben_flow_outreach's pre-existing m_synctabledetail row had
-- Deleted=NULL instead of Deleted=0 like every other row. The sync
-- program's table-list query filters "WHERE deleted = false" - NULL never
-- matches false in SQL, so this table was silently never attempted for sync
-- despite being otherwise correctly registered. Self-limiting: only touches
-- the row if it's actually NULL, no-op otherwise.
-- ============================================================
UPDATE db_iemr.m_synctabledetail SET Deleted = 0 WHERE TableName = 'i_ben_flow_outreach' AND Deleted IS NULL;
