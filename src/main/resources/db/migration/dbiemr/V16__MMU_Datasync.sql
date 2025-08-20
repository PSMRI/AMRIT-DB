
update m_synctabledetail
set vancolumnname=
"BeneficiaryRegID,TitleId,Title,FirstName,MiddleName,LastName,Status,GenderId,Gender,MaritalStatusId,MaritalStatus,date_format(MarriageDate,'%Y-%m-%d %H:%i:%s'),MarriageAge,date_format(DOB,'%Y-%m-%d %H:%i:%s'),FatherName,MotherName,SpouseName,EmergencyRegistration,HealthCareWorkerId,HealthCareWorker,PlaceOfWork,LiteracyStatus,educationId,education,occupationId,occupation,incomeStatusId,incomeStatus,communityId,community,religionId,religion,preferredLanguageId,preferredLanguage,sourceOfInfo,servicePointId,areaId,zoneId,phcId,Remarks,Deleted,Processed,CreatedBy,date_format(CreatedDate,'%Y-%m-%d %H:%i:%s'),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,'%Y-%m-%d %H:%i:%s'),BeneficiaryDetailsId,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SexualOrientationID,SexualOrientationType,IsHIVPositive,HIVStatus,SyncedBy,date_format(SyncedDate,'%Y-%m-%d %H:%i:%s'),ReservedForChange"
where tablename='i_beneficiarydetails';

update m_synctabledetail
set vancolumnname=
"PermAddrLine1,PermAddrLine2,PermAddrLine3,PermCountryId,PermCountry,PermStateId,PermState,PermDistrictId,PermDistrict,PermSubDistrictId,PermSubDistrict,PermVillageId,PermVillage,PermHabitation,PermPinCode,PermZoneID,PermZone,PermAreaId,PermArea,PermServicePointId,PermServicePoint,PermCoordinate,CurrAddrLine1,CurrAddrLine2,CurrAddrLine3,CurrCountryId,CurrCountry,CurrStateId,CurrState,CurrDistrictId,CurrDistrict,CurrSubDistrictId,CurrSubDistrict,CurrVillageId,CurrVillage,CurrHabitation,CurrPinCode,CurrZoneID,CurrZone,CurrAreaId,CurrArea,CurrServicePointId,CurrServicePoint,CurrCoordinate,EmerAddrLine1,EmerAddrLine2,EmerAddrLine3,EmerCountryId,EmerCountry,EmerStateId,EmerState,EmerDistrictId,EmerDistrict,EmerSubDistrictId,EmerSubDistrict,EmerVillageId,EmerVillage,EmerHabitation,EmerPinCode,PermAddressValue,CurrAddressValue,EmerAddressValue,EmerZoneID,EmerZone,EmerAreaId,EmerArea,EmerServicePointId,EmerServicePoint,EmerCoordinate,Deleted,Processed,CreatedBy,date_format(CreatedDate,'%Y-%m-%d %H:%i:%s'),Reserved,ReservedFor,ReservedOn,ReservedById,ModifiedBy,date_format(LastModDate,'%Y-%m-%d %H:%i:%s'),BenAddressID,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,'%Y-%m-%d %H:%i:%s'),ReservedForChange"
where tablename='i_beneficiaryaddress';

update m_synctabledetail
set vancolumnname=
"ItemStockEntryID,FacilityID,Quantity,ProviderServiceMapID,ExitTypeID,ExitType,Deleted,Processed,CreatedBy,date_format(CreatedDate,'%Y-%m-%d %H:%i:%s'),ModifiedBy,date_format(LastModDate,'%Y-%m-%d %H:%i:%s'),ItemStockExitID,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,'%Y-%m-%d %H:%i:%s'),ReservedForChange"
where tablename='t_itemstockexit';

update m_synctabledetail
set vancolumnname=
"BeneficiaryRegID,BenVisitID,VisitCode,FacilityID,patientname,Age,Gender,DoctorName,PrescriptionID,Reference,IssueType,IssuedBy,ProviderServiceMapID,Status,Deleted,Processed,CreatedBy,date_format(CreatedDate,'%Y-%m-%d %H:%i:%s'),ModifiedBy,date_format(LastModDate,'%Y-%m-%d %H:%i:%s'),SyncFacilityID,PatientIssueID,VanSerialNo,VanID,VehicalNo,ParkingPlaceID,SyncedBy,date_format(SyncedDate,'%Y-%m-%d %H:%i:%s'),ReservedForChange"
where tablename='t_patientissue';

