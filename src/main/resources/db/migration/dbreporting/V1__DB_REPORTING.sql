-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
-- Host: 192.168.5.5    Database: db_reporting
-- ------------------------------------------------------
-- Server version	5.7.19-log
use db_reporting;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `assam_104`
--

DROP TABLE IF EXISTS `assam_104`;
/*!50001 DROP VIEW IF EXISTS `assam_104`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `assam_104` AS SELECT 
 1 AS `Date`,
 1 AS `Agent_Loggedin`,
 1 AS `Inbound Calls`,
 1 AS `Outbound Calls`,
 1 AS `Total Calls`,
 1 AS `Grievance Received`,
 1 AS `Average Call Handling Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dim_1097beneficiary`
--

DROP TABLE IF EXISTS `dim_1097beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_1097beneficiary` (
  `Dim_1097BeneficiaryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenficiaryDetailsID` bigint(20) DEFAULT NULL,
  `BeneficiaryID` bigint(20) DEFAULT NULL,
  `BeneficiaryMapID` bigint(20) DEFAULT NULL,
  `TitleId` smallint(6) DEFAULT NULL,
  `Title` varchar(12) DEFAULT NULL,
  `GenderId` smallint(6) DEFAULT NULL,
  `Gender` char(15) DEFAULT NULL,
  `MaritalStatusId` int(11) DEFAULT NULL,
  `MaritalStatus` varchar(20) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `SexualOrientationId` int(11) DEFAULT NULL,
  `SexualOrientationType` varchar(30) DEFAULT NULL,
  `IsHIVPositive` bit(1) DEFAULT NULL,
  `HIVStatus` smallint(6) DEFAULT NULL,
  `educationId` int(11) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `occupationId` smallint(6) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `HealthCareWorkerId` int(11) DEFAULT NULL,
  `HealthCareWorker` varchar(45) DEFAULT NULL,
  `incomeStatus` varchar(45) DEFAULT NULL,
  `communityId` int(11) DEFAULT NULL,
  `community` varchar(45) DEFAULT NULL,
  `preferredLanguage` varchar(45) DEFAULT NULL,
  `religionId` smallint(6) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `PlaceOfWork` varchar(30) DEFAULT NULL,
  `PermStateId` int(11) DEFAULT NULL,
  `PermState` varchar(50) DEFAULT NULL,
  `PermDistrictId` int(11) DEFAULT NULL,
  `PermDistrict` varchar(50) DEFAULT NULL,
  `PermSubDistrictId` int(15) DEFAULT NULL,
  `PermSubDistrict` varchar(50) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `dim_create_date` int(11) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Dim_1097BeneficiaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_beneficiary`
--

DROP TABLE IF EXISTS `dim_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_beneficiary` (
  `Dim_BeneficiaryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryDetailsId` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BeneficiaryID` bigint(20) DEFAULT NULL,
  `TitleId` int(11) DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `GenderId` int(11) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `MaritalStatusId` int(11) DEFAULT NULL,
  `MaritalStatus` varchar(20) DEFAULT NULL,
  `MarriageDate` datetime DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `FatherName` varchar(50) DEFAULT NULL,
  `MotherName` varchar(50) DEFAULT NULL,
  `SpouseName` varchar(50) DEFAULT NULL,
  `EmergencyRegistration` bit(1) DEFAULT NULL,
  `HealthCareWorkerId` int(11) DEFAULT NULL,
  `HealthCareWorker` varchar(45) DEFAULT NULL,
  `PlaceOfWork` varchar(30) DEFAULT NULL,
  `LiteracyStatus` varchar(30) DEFAULT NULL,
  `educationId` int(11) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `occupationId` smallint(6) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `incomeStatus` varchar(45) DEFAULT NULL,
  `communityId` int(11) DEFAULT NULL,
  `community` varchar(45) DEFAULT NULL,
  `religionId` smallint(6) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `preferredLanguage` varchar(45) DEFAULT NULL,
  `sourceOfInfo` varchar(45) DEFAULT NULL,
  `servicePointId` bigint(20) DEFAULT NULL,
  `areaId` int(15) DEFAULT NULL,
  `zoneId` int(15) DEFAULT NULL,
  `phcId` int(15) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `SexualOrientationID` int(11) DEFAULT NULL,
  `SexualOrientationType` varchar(30) DEFAULT NULL,
  `IsHIVPositive` bit(1) DEFAULT b'0',
  `HIVStatus` smallint(6) DEFAULT NULL,
  `BenContactsID` bigint(20) DEFAULT NULL,
  `PreferredPhoneNum` varchar(25) DEFAULT NULL,
  `PreferredPhoneTyp` varchar(15) DEFAULT NULL,
  `PreferredSMSPhoneNum` varchar(25) DEFAULT NULL,
  `PreferredSMSPhoneTyp` varchar(15) DEFAULT NULL,
  `EmergencyContactNum` varchar(25) DEFAULT NULL,
  `EmergencyContactTyp` varchar(15) DEFAULT NULL,
  `PhoneNum1` varchar(25) DEFAULT NULL,
  `PhoneTyp1` varchar(15) DEFAULT NULL,
  `PhoneNum2` varchar(25) DEFAULT NULL,
  `PhoneTyp2` varchar(15) DEFAULT NULL,
  `PhoneNum3` varchar(25) DEFAULT NULL,
  `PhoneTyp3` varchar(15) DEFAULT NULL,
  `PhoneNum4` varchar(25) DEFAULT NULL,
  `PhoneTyp4` varchar(15) DEFAULT NULL,
  `PhoneNum5` varchar(25) DEFAULT NULL,
  `PhoneTyp5` varchar(15) DEFAULT NULL,
  `EmailId` varchar(75) DEFAULT NULL,
  `BenAddressID` bigint(20) DEFAULT NULL,
  `PermAddrLine1` varchar(50) DEFAULT NULL,
  `PermAddrLine2` varchar(50) DEFAULT NULL,
  `PermAddrLine3` varchar(50) DEFAULT NULL,
  `PermCountryId` int(15) DEFAULT NULL,
  `PermCountry` varchar(15) DEFAULT NULL,
  `PermStateId` int(15) DEFAULT NULL,
  `PermState` varchar(30) DEFAULT NULL,
  `PermDistrictId` int(15) DEFAULT NULL,
  `PermDistrict` varchar(50) DEFAULT NULL,
  `PermSubDistrictId` int(15) DEFAULT NULL,
  `PermSubDistrict` varchar(50) DEFAULT NULL,
  `PermVillageId` int(15) DEFAULT NULL,
  `PermVillage` varchar(100) DEFAULT NULL,
  `Isrural` bit(1) DEFAULT NULL,
  `PermHabitation` varchar(50) DEFAULT NULL,
  `PermPinCode` varchar(8) DEFAULT NULL,
  `PermZoneID` int(15) DEFAULT NULL,
  `PermZone` varchar(50) DEFAULT NULL,
  `PermAreaId` int(15) DEFAULT NULL,
  `PermArea` varchar(50) DEFAULT NULL,
  `PermServicePointId` int(15) DEFAULT NULL,
  `PermServicePoint` varchar(50) DEFAULT NULL,
  `PermCoordinate` varchar(50) DEFAULT NULL,
  `CurrAddrLine1` varchar(50) DEFAULT NULL,
  `CurrAddrLine2` varchar(50) DEFAULT NULL,
  `CurrAddrLine3` varchar(50) DEFAULT NULL,
  `CurrCountryId` int(15) DEFAULT NULL,
  `CurrCountry` varchar(15) DEFAULT NULL,
  `CurrStateId` int(15) DEFAULT NULL,
  `CurrState` varchar(30) DEFAULT NULL,
  `CurrDistrictId` int(15) DEFAULT NULL,
  `CurrDistrict` varchar(50) DEFAULT NULL,
  `CurrSubDistrictId` int(15) DEFAULT NULL,
  `CurrSubDistrict` varchar(50) DEFAULT NULL,
  `CurrVillageId` int(15) DEFAULT NULL,
  `CurrVillage` varchar(100) DEFAULT NULL,
  `CurrHabitation` varchar(50) DEFAULT NULL,
  `CurrPinCode` varchar(8) DEFAULT NULL,
  `CurrZoneID` int(15) DEFAULT NULL,
  `CurrZone` varchar(50) DEFAULT NULL,
  `CurrAreaId` int(15) DEFAULT NULL,
  `CurrArea` varchar(50) DEFAULT NULL,
  `CurrServicePointId` int(15) DEFAULT NULL,
  `CurrServicePoint` varchar(50) DEFAULT NULL,
  `CurrCoordinate` varchar(50) DEFAULT NULL,
  `EmerAddrLine1` varchar(50) DEFAULT NULL,
  `EmerAddrLine2` varchar(50) DEFAULT NULL,
  `EmerAddrLine3` varchar(50) DEFAULT NULL,
  `EmerCountryId` int(15) DEFAULT NULL,
  `EmerCountry` varchar(15) DEFAULT NULL,
  `EmerStateId` int(15) DEFAULT NULL,
  `EmerState` varchar(30) DEFAULT NULL,
  `EmerDistrictId` int(15) DEFAULT NULL,
  `EmerDistrict` varchar(50) DEFAULT NULL,
  `EmerSubDistrictId` int(15) DEFAULT NULL,
  `EmerSubDistrict` varchar(50) DEFAULT NULL,
  `EmerVillageId` int(15) DEFAULT NULL,
  `EmerVillage` varchar(100) DEFAULT NULL,
  `EmerHabitation` varchar(50) DEFAULT NULL,
  `EmerPinCode` varchar(8) DEFAULT NULL,
  `PermAddressValue` varchar(250) DEFAULT NULL,
  `CurrAddressValue` varchar(250) DEFAULT NULL,
  `EmerAddressValue` varchar(250) DEFAULT NULL,
  `EmerZoneID` int(15) DEFAULT NULL,
  `EmerZone` varchar(50) DEFAULT NULL,
  `EmerAreaId` int(15) DEFAULT NULL,
  `EmerArea` varchar(50) DEFAULT NULL,
  `EmerServicePointId` int(15) DEFAULT NULL,
  `EmerServicePoint` varchar(50) DEFAULT NULL,
  `EmerCoordinate` varchar(50) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `dim_create_date` bigint(20) NOT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Dim_BeneficiaryID`),
  KEY `BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `inx_permVillageID` (`PermVillageId`),
  KEY `inx_GenderId` (`GenderId`),
  KEY `inx_PermDistrictId` (`PermDistrictId`),
  KEY `inx_PermSubDistrictId` (`PermSubDistrictId`),
  KEY `inx_PermStateId` (`PermStateId`),
  KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `inx_PermDistrict` (`PermDistrict`),
  KEY `inx_PermState` (`PermState`),
  KEY `inx_Isrural` (`Isrural`)
) ENGINE=InnoDB AUTO_INCREMENT=7225667 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_date`
--

DROP TABLE IF EXISTS `dim_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_date` (
  `date_key` int(11) NOT NULL,
  `full_date` date DEFAULT NULL,
  `date_name` char(11) NOT NULL,
  `date_name_us` char(11) NOT NULL,
  `date_name_eu` char(11) NOT NULL,
  `day_of_week` tinyint(4) NOT NULL,
  `day_name_of_week` char(10) NOT NULL,
  `day_of_month` tinyint(4) NOT NULL,
  `day_of_year` smallint(6) NOT NULL,
  `weekday_weekend` char(10) NOT NULL,
  `week_of_year` tinyint(4) NOT NULL,
  `month_name` char(10) NOT NULL,
  `month_of_year` tinyint(4) NOT NULL,
  `is_last_day_of_month` char(1) NOT NULL,
  `calendar_quarter` tinyint(4) NOT NULL,
  `calendar_year` smallint(6) NOT NULL,
  `calendar_year_month` char(10) NOT NULL,
  `calendar_year_qtr` char(10) NOT NULL,
  `fiscal_month_of_year` tinyint(4) NOT NULL,
  `fiscal_quarter` tinyint(4) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `fiscal_year_month` char(10) NOT NULL,
  `fiscal_year_qtr` char(10) NOT NULL,
  PRIMARY KEY (`date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_user`
--

DROP TABLE IF EXISTS `dim_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_user` (
  `Dim_USERID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `TitleID` smallint(6) DEFAULT NULL,
  `TitleName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `GenderID` smallint(6) DEFAULT NULL,
  `GenderIName` varchar(20) DEFAULT NULL,
  `MaritalStatusID` smallint(6) DEFAULT NULL,
  `MaritalStatusName` varchar(50) DEFAULT NULL,
  `AadhaarNo` varchar(20) DEFAULT NULL,
  `PAN` varchar(20) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `FathersName` varchar(30) DEFAULT NULL,
  `MothersName` varchar(30) DEFAULT NULL,
  `CommunityID` smallint(6) DEFAULT NULL,
  `CommunityName` varchar(50) DEFAULT NULL,
  `ReligionID` smallint(6) DEFAULT NULL,
  `ReligionName` varchar(50) DEFAULT NULL,
  `AddressLine1` varchar(50) DEFAULT NULL,
  `AddressLine2` varchar(50) DEFAULT NULL,
  `PermAddressLine1` varchar(50) DEFAULT NULL,
  `PermAddressLine2` varchar(50) DEFAULT NULL,
  `PermStateID` int(11) DEFAULT NULL,
  `PermStateName` varchar(50) DEFAULT NULL,
  `PermDistrictID` int(11) DEFAULT NULL,
  `PermDistrictName` varchar(50) DEFAULT NULL,
  `PermPinCode` varchar(8) DEFAULT NULL,
  `PermanentAddress` varchar(500) DEFAULT NULL,
  `CountryID` int(11) DEFAULT NULL,
  `CountryName` varchar(50) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `PinCode` varchar(8) DEFAULT NULL,
  `IsPresent` bit(1) DEFAULT NULL,
  `IsPermanent` bit(1) DEFAULT NULL,
  `DOJ` datetime DEFAULT NULL,
  `QualificationID` int(11) DEFAULT NULL,
  `QualificationName` varchar(50) DEFAULT NULL,
  `DesignationID` int(11) DEFAULT NULL,
  `DesignationName` varchar(50) DEFAULT NULL,
  `EmployeeID` varchar(20) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Password` varchar(250) DEFAULT NULL,
  `ContactNo` varchar(12) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT NULL,
  `StatusName` varchar(50) DEFAULT NULL,
  `ServiceProviderID` smallint(6) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `dim_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Dim_USERID`),
  KEY `inx_userid` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `fac_bencall`
--

DROP TABLE IF EXISTS `fac_bencall`;
/*!50001 DROP VIEW IF EXISTS `fac_bencall`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fac_bencall` AS SELECT 
 1 AS `PermDistrict`,
 1 AS `CallSubTypeName`,
 1 AS `count(fbc.BenCallID)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fact_104bencdiresponse`
--

DROP TABLE IF EXISTS `fact_104bencdiresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_104bencdiresponse` (
  `Fact_104BenCDIResponseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `QuestionID` int(11) DEFAULT NULL,
  `Question` varchar(200) DEFAULT NULL,
  `Answer` varchar(500) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `TotalScore` int(11) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `reasonIfNo` varchar(100) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `Fact_CreatedDate` int(11) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_104BenCDIResponseID`),
  KEY `inx_brgid` (`BeneficiaryRegID`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_createddate` (`CreatedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=22248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_104benmedhistory`
--

DROP TABLE IF EXISTS `fact_104benmedhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_104benmedhistory` (
  `Fact_104BenMedHistoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenHistoryID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `PatientName` varchar(50) DEFAULT NULL,
  `PatientAge` int(11) DEFAULT NULL,
  `PatientGenderID` smallint(6) DEFAULT NULL,
  `PatientGenderName` varchar(20) DEFAULT NULL,
  `SymptomID` varchar(100) DEFAULT NULL,
  `Algorithm` varchar(300) DEFAULT NULL,
  `DiseaseSummaryID` varchar(30) DEFAULT NULL,
  `DiseaseSummary` varchar(800) DEFAULT NULL,
  `Allergies` varchar(100) DEFAULT NULL,
  `SelecteDiagnosisID` varchar(100) DEFAULT NULL,
  `SelecteDiagnosis` varchar(100) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `CategoryName` varchar(100) DEFAULT NULL,
  `SubCategoryID` int(11) DEFAULT NULL,
  `SubCategoryName` varchar(100) DEFAULT NULL,
  `AddedAdvice` varchar(7000) DEFAULT NULL,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `Rx_UserID` int(11) DEFAULT NULL,
  `Rx_DiagnosisProvided` varchar(300) DEFAULT NULL,
  `Rx_Remarks` varchar(100) DEFAULT NULL,
  `ActionByHAO` varchar(200) DEFAULT NULL,
  `ActionByCO` varchar(200) DEFAULT NULL,
  `ActionByMO` varchar(200) DEFAULT NULL,
  `ActionByPD` varchar(200) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `IsSelf` bit(1) DEFAULT NULL,
  `TreatmentRecommendation` varchar(900) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `travel_14days` bit(1) DEFAULT NULL,
  `travel_type` varchar(30) DEFAULT NULL,
  `symptoms` varchar(300) DEFAULT NULL,
  `COVID19_contact_history` varchar(300) DEFAULT NULL,
  `medical_consultation` bit(1) DEFAULT NULL,
  `Suspected_COVID19` bit(1) DEFAULT NULL,
  `recommendation` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`Fact_104BenMedHistoryID`),
  KEY `inx_CreatedDate` (`CreatedDate`),
  KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `inx_actionByHAO` (`ActionByHAO`),
  KEY `inx_actionByMO` (`ActionByMO`),
  KEY `inx_actionByCO` (`ActionByCO`),
  KEY `inx_BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `inx_BenCallID` (`BenCallID`),
  KEY `inx_PrescriptionID` (`PrescriptionID`),
  KEY `inx_DiseaseSummary` (`DiseaseSummary`),
  KEY `inx_SelecteDiagnosis` (`SelecteDiagnosis`)
) ENGINE=InnoDB AUTO_INCREMENT=1456995 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_104prescription`
--

DROP TABLE IF EXISTS `fact_104prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_104prescription` (
  `Fact_104prescriptionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `DiagnosisProvided` varchar(300) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `PrescribedDrugID` bigint(20) DEFAULT NULL,
  `DrugMapID` int(11) DEFAULT NULL,
  `DrugName` varchar(100) DEFAULT NULL,
  `DrugGroupName` varchar(100) DEFAULT NULL,
  `DrugForm` varchar(30) DEFAULT NULL,
  `DrugRoute` varchar(30) DEFAULT NULL,
  `Frequency` varchar(30) DEFAULT NULL,
  `Dosage` varchar(100) DEFAULT NULL,
  `NoOfDays` int(11) DEFAULT NULL,
  `TimeToConsume` varchar(50) DEFAULT NULL,
  `SideEffects` varchar(100) DEFAULT NULL,
  `ValidTill` datetime DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_104prescriptionID`),
  KEY `inx_PrescriptionID` (`PrescriptionID`),
  KEY `inx_BenCallID` (`BenCallID`),
  KEY `inx_UserID` (`UserID`),
  KEY `inx_PrescribedDrugID` (`PrescribedDrugID`),
  KEY `inx_Createddate` (`CreatedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=20789 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_1097callsummary`
--

DROP TABLE IF EXISTS `fact_1097callsummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_1097callsummary` (
  `Fact_1097CallSummaryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `CallStartTime` datetime DEFAULT NULL,
  `CallEndTime` datetime DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `CZCallID` varchar(30) DEFAULT NULL,
  `AgentID` varchar(20) DEFAULT NULL,
  `PhoneNo` varchar(45) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `IsOutbound` bit(1) DEFAULT NULL,
  `IsCalledEarlier` bit(1) DEFAULT NULL,
  `CallType` varchar(50) DEFAULT NULL,
  `CallSubType` varchar(50) DEFAULT NULL,
  `Rec_UserName` varchar(30) DEFAULT NULL,
  `Rec_UserRole` varchar(50) DEFAULT NULL,
  `BenOutboundPreferedLang` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `Info_Category` varchar(100) DEFAULT NULL,
  `Info_SubCategory` varchar(100) DEFAULT NULL,
  `Info_DocumentName` varchar(300) DEFAULT NULL,
  `CO_Category` varchar(100) DEFAULT NULL,
  `CO_SubCategory` varchar(100) DEFAULT NULL,
  `CO_DocumentName` varchar(300) DEFAULT NULL,
  `FeedbackID` bigint(20) DEFAULT NULL,
  `CallTransferRemarks` varchar(500) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_1097CallSummaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7368075 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_anccare`
--

DROP TABLE IF EXISTS `fact_anccare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_anccare` (
  `Fact_ANCCareID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitNo` smallint(6) DEFAULT NULL,
  `ComolaintType` varchar(20) DEFAULT NULL,
  `Duration` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `LastMenstrualPeriod_LMP` datetime DEFAULT NULL,
  `GestationalAgeOrPeriodofAmenorrhea_POA` smallint(6) DEFAULT NULL,
  `ExpectedDateofDelivery` datetime DEFAULT NULL,
  `TrimesterNumber` smallint(6) DEFAULT NULL,
  `PrimiGravida` bit(1) DEFAULT NULL,
  `Gravida_G` smallint(6) DEFAULT NULL,
  `TermDeliveries_T` smallint(6) DEFAULT NULL,
  `PretermDeliveries_P` smallint(6) DEFAULT NULL,
  `Abortions_A` smallint(6) DEFAULT NULL,
  `Livebirths_L` smallint(6) DEFAULT NULL,
  `BloodGroup` varchar(15) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ANCCareID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_ancdiagnosis`
--

DROP TABLE IF EXISTS `fact_ancdiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_ancdiagnosis` (
  `Fact_ANCDiagnosisID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisitNo` smallint(6) DEFAULT NULL,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `HighRiskStatus` varchar(500) DEFAULT NULL,
  `HighRiskCondition` varchar(500) DEFAULT NULL,
  `ComplicationOfCurrentPregnancy` varchar(1050) DEFAULT NULL,
  `OtherCompCurPreg` varchar(300) DEFAULT NULL,
  `IsHighRisk` bit(1) DEFAULT NULL,
  `IsMaternalDeath` bit(1) DEFAULT NULL,
  `PlaceOfDeath` varchar(50) DEFAULT NULL,
  `DateOfDeath` datetime DEFAULT NULL,
  `CauseOfDeath` varchar(100) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(30) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ANCDiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_bencall`
--

DROP TABLE IF EXISTS `fact_bencall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_bencall` (
  `Fact_BenCallID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenCallID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `CallID` varchar(30) DEFAULT NULL,
  `SessionID` varchar(100) DEFAULT NULL,
  `PhoneNo` varchar(15) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CallTypeID` int(11) DEFAULT NULL,
  `CallTypeName` varchar(50) DEFAULT NULL,
  `CallSubTypeName` varchar(50) DEFAULT NULL,
  `is1097` bit(1) DEFAULT NULL,
  `CallTime` datetime DEFAULT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `ServicesProvided` varchar(30) DEFAULT NULL,
  `CallClosureType` varchar(30) DEFAULT NULL,
  `DispositionStatusID` int(11) DEFAULT NULL,
  `DispositionStatusName` varchar(50) DEFAULT NULL,
  `CallReceivedUserID` int(11) DEFAULT NULL,
  `ReceivedRoleName` varchar(50) DEFAULT NULL,
  `ReceivedAgentID` varchar(20) DEFAULT NULL,
  `CallEndUserID` int(11) DEFAULT NULL,
  `CallEndTime` datetime DEFAULT NULL,
  `CallDuration` varchar(100) DEFAULT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `SubCategory` varchar(30) DEFAULT NULL,
  `CDICallStatus` varchar(30) DEFAULT NULL,
  `IsOutbound` bit(1) DEFAULT NULL,
  `IsCalledEarlier` bit(1) DEFAULT NULL,
  `RecordingFilePath` varchar(300) DEFAULT NULL,
  `ArchiveFilePath` varchar(300) DEFAULT NULL,
  `OBCallID` bigint(20) DEFAULT NULL,
  `ChangeLog` text,
  `IsMother` bit(1) DEFAULT NULL,
  `SMS_Advice` varchar(300) DEFAULT NULL,
  `SMS_Ph` varchar(12) DEFAULT NULL,
  `IsVerified` bit(1) DEFAULT NULL,
  `isCallAnswered` bit(1) DEFAULT NULL,
  `isCallDisconnected` bit(1) DEFAULT NULL,
  `isCallAudited` bit(1) DEFAULT b'0',
  `isFurtherCallRequired` bit(1) DEFAULT NULL,
  `TypeOfComplaint` varchar(100) DEFAULT NULL,
  `complaintRemarks` varchar(100) DEFAULT NULL,
  `reasonForNoFurtherCalls` varchar(100) DEFAULT NULL,
  `reasonForCallNotAnswered` varchar(100) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CZcallStartTime` datetime DEFAULT NULL,
  `CZcallEndTime` datetime DEFAULT NULL,
  `CZcallDuration` int(11) DEFAULT NULL,
  `isWrongNumber` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Fact_BenCallID`),
  KEY `FK_FBenCall_ReceivedAgentID` (`ReceivedAgentID`),
  KEY `inx_CallReceivedUserID` (`CallReceivedUserID`),
  KEY `inx_BenCallID` (`BenCallID`),
  KEY `inx_ReceivedRoleName` (`ReceivedRoleName`),
  KEY `inx_BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `inx_CallTypeID` (`CallTypeID`),
  KEY `inx_OBCallID` (`OBCallID`),
  KEY `inx_CreatedDate` (`CreatedDate`),
  KEY `inx_PhoneNo` (`PhoneNo`),
  KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `inx_IsMother` (`IsMother`),
  KEY `inx_IsVerified` (`IsVerified`),
  KEY `inx_CallTypeName` (`CallTypeName`),
  KEY `inx_CallEndUserID` (`CallEndUserID`),
  KEY `inx_CallSubTypeName` (`CallSubTypeName`),
  KEY `inx_CZCallDuration` (`CZcallDuration`),
  KEY `inx_CZcallStartTime` (`CZcallStartTime`),
  KEY `inx_CZcallEndTime` (`CZcallEndTime`),
  KEY `inx_SessionID` (`SessionID`),
  KEY `inx_CallID` (`CallID`),
  KEY `inx_IsOutbound` (`IsOutbound`),
  KEY `inx_IsCalledEarlier` (`IsCalledEarlier`)
) ENGINE=InnoDB AUTO_INCREMENT=17649176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_benchiefcomplaint`
--

DROP TABLE IF EXISTS `fact_benchiefcomplaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_benchiefcomplaint` (
  `Fact_BenChiefComplaintID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `ServiceID` smallint(6) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `ChiefComplaintID` int(11) DEFAULT NULL,
  `ChiefComplaint` varchar(100) DEFAULT NULL,
  `SCTDesID` int(11) DEFAULT NULL,
  `SCTCode` varchar(30) DEFAULT NULL,
  `SCTChiefComplaint` varchar(500) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `UnitOfDuration` varchar(30) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(30) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_BenChiefComplaintID`)
) ENGINE=InnoDB AUTO_INCREMENT=983026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_bendisease`
--

DROP TABLE IF EXISTS `fact_bendisease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_bendisease` (
  `FactBenDiseaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisitCategory` varchar(50) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(45) DEFAULT NULL,
  `VehicalNo` varchar(45) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `Disease` text,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `SyncedBy` varchar(45) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FactBenDiseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_benreferdetails`
--

DROP TABLE IF EXISTS `fact_benreferdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_benreferdetails` (
  `FactBenReferID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `referredToInstituteID` int(11) DEFAULT NULL,
  `referredToInstituteName` varchar(100) DEFAULT NULL,
  `serviceName` varchar(500) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(45) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(45) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FactBenReferID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_benvisitdetail`
--

DROP TABLE IF EXISTS `fact_benvisitdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_benvisitdetail` (
  `Fact_BenVisitDetailID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitDateTime` datetime DEFAULT NULL,
  `VisitNo` smallint(6) DEFAULT NULL,
  `VisitReasonID` smallint(6) DEFAULT NULL,
  `VisitReason` varchar(20) DEFAULT NULL,
  `VisitCategoryID` int(11) DEFAULT NULL,
  `VisitCategory` varchar(20) DEFAULT NULL,
  `PregnancyStatus` varchar(10) DEFAULT NULL,
  `RCHID` varchar(30) DEFAULT NULL,
  `HealthFacilityType` varchar(20) DEFAULT NULL,
  `HealthFacilityLocation` varchar(100) DEFAULT NULL,
  `ReportFilePath` varchar(500) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(30) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `VisitFlowStatusFlag` varchar(5) DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_BenVisitDetailID`),
  KEY `BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `ProviderServiceMapID` (`ProviderServiceMapID`)
) ENGINE=InnoDB AUTO_INCREMENT=2652078 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_bloodrequest`
--

DROP TABLE IF EXISTS `fact_bloodrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_bloodrequest` (
  `Fact_BloodRequestID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BloodReqID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `RecipientBeneficiaryID` bigint(20) DEFAULT NULL,
  `RecipientName` varchar(100) DEFAULT NULL,
  `RecipientAge` int(11) DEFAULT NULL,
  `RecipientGenderID` smallint(6) DEFAULT NULL,
  `RecipientGenderName` varchar(20) DEFAULT NULL,
  `TypeOfRequest` varchar(20) DEFAULT NULL,
  `BloodGroupID` int(11) DEFAULT NULL,
  `BloodGroupName` varchar(50) DEFAULT NULL,
  `ComponentTypeID` int(11) DEFAULT NULL,
  `ComponentTypeName` varchar(50) DEFAULT NULL,
  `ComponentID` int(11) DEFAULT NULL,
  `ComponentName` varchar(50) DEFAULT NULL,
  `UnitRequired` varchar(50) DEFAULT NULL,
  `HospitalAdmitted` varchar(200) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `OutboundNeeded` bit(1) DEFAULT NULL,
  `OutboundDate` datetime DEFAULT NULL,
  `BloodBankAddress` varchar(300) DEFAULT NULL,
  `BBPersonName` varchar(50) DEFAULT NULL,
  `BBMobileNo` varchar(15) DEFAULT NULL,
  `BBPersonDesignation` varchar(50) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Feedback` varchar(100) DEFAULT NULL,
  `IsSelf` bit(1) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_BloodRequestID`),
  KEY `inx_brgid` (`BeneficiaryRegID`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_bencallid` (`BenCallID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_childcongenitalanomalies`
--

DROP TABLE IF EXISTS `fact_childcongenitalanomalies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_childcongenitalanomalies` (
  `Fact_ChildCongenitalAnomaliesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChildCongenitalAnomaliesID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `MotherID` bigint(20) DEFAULT NULL,
  `ChildID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `CongenitalAnomalies` varchar(200) DEFAULT NULL,
  `CauseOfDefect` varchar(100) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ChildCongenitalAnomaliesID`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_childid` (`ChildID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_childinvalidrecord`
--

DROP TABLE IF EXISTS `fact_childinvalidrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_childinvalidrecord` (
  `Fact_ChildInValidRecordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RowID` bigint(20) DEFAULT NULL,
  `Date_of_Entry` datetime DEFAULT NULL,
  `Entry_type` smallint(6) DEFAULT NULL,
  `MCTSID_no_Child_ID` bigint(20) DEFAULT NULL,
  `Child_Name` varchar(50) DEFAULT NULL,
  `Father_Name` varchar(50) DEFAULT NULL,
  `Mother_Name` varchar(50) DEFAULT NULL,
  `Mother_ID` bigint(20) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Place_of_Birth` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Caste` varchar(50) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `Child_Aadhaar_No` varchar(50) DEFAULT NULL,
  `Weight_of_Child` decimal(5,2) DEFAULT NULL,
  `Child_EID` int(11) DEFAULT NULL,
  `Child_EID_Time` datetime DEFAULT NULL,
  `Emamta_Health_ID` int(11) DEFAULT NULL,
  `Emamta_Family_ID` int(11) DEFAULT NULL,
  `Phone_No_of` varchar(50) DEFAULT NULL,
  `Phone_No` varchar(12) DEFAULT NULL,
  `Registration_Date` datetime DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `State_Name` varchar(50) DEFAULT NULL,
  `District_ID` int(11) DEFAULT NULL,
  `District_Name` varchar(50) DEFAULT NULL,
  `Taluka_Name` varchar(50) DEFAULT NULL,
  `Taluka_ID` int(11) DEFAULT NULL,
  `Block_ID` int(11) DEFAULT NULL,
  `Block_Name` varchar(50) DEFAULT NULL,
  `PHC_ID` int(11) DEFAULT NULL,
  `PHC_Name` varchar(50) DEFAULT NULL,
  `SubCenter_ID` int(11) DEFAULT NULL,
  `SubCenter_Name` varchar(50) DEFAULT NULL,
  `SubCenter_Name1` varchar(50) DEFAULT NULL,
  `Village_ID` int(11) DEFAULT NULL,
  `Village_Name` varchar(50) DEFAULT NULL,
  `GP_Village` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Year` char(4) DEFAULT NULL,
  `ANM_ID` int(11) DEFAULT NULL,
  `ANM_Name` varchar(50) DEFAULT NULL,
  `ANM_Phone_No` varchar(12) DEFAULT NULL,
  `ASHA_ID` int(11) DEFAULT NULL,
  `ASHA_Name` varchar(50) DEFAULT NULL,
  `ASHA_Phone_No` varchar(12) DEFAULT NULL,
  `BCG_Date` datetime DEFAULT NULL,
  `OPV0_Date` datetime DEFAULT NULL,
  `Hepatitis_B1_Date` datetime DEFAULT NULL,
  `DPT1_Date` datetime DEFAULT NULL,
  `OPV1_Date` datetime DEFAULT NULL,
  `Hepatitis_B2_Date` datetime DEFAULT NULL,
  `DPT2_Date` datetime DEFAULT NULL,
  `OPV2_Date` datetime DEFAULT NULL,
  `Hepatitis_B3_Date` datetime DEFAULT NULL,
  `DPT3_Date` datetime DEFAULT NULL,
  `OPV3_Date` datetime DEFAULT NULL,
  `Hepatitis_B4_Date` datetime DEFAULT NULL,
  `Measles_Date` datetime DEFAULT NULL,
  `VitA_Dose1_Date` datetime DEFAULT NULL,
  `MR_Date` datetime DEFAULT NULL,
  `DPTBooster_Date` datetime DEFAULT NULL,
  `OPVBooster_Date` datetime DEFAULT NULL,
  `VitA_Dose2_Date` datetime DEFAULT NULL,
  `VitA_Dose3_Date` datetime DEFAULT NULL,
  `VitA_Dose99_Date` datetime DEFAULT NULL,
  `VitA_Dose5_Date` datetime DEFAULT NULL,
  `VitA_Dose6_Date` datetime DEFAULT NULL,
  `VitA_Dose7_Date` datetime DEFAULT NULL,
  `VitA_Dose8_Date` datetime DEFAULT NULL,
  `VitA_Dose9_Date` datetime DEFAULT NULL,
  `JE_Date` datetime DEFAULT NULL,
  `DT5_Date` datetime DEFAULT NULL,
  `TT10_Date` datetime DEFAULT NULL,
  `TT16_Date` datetime DEFAULT NULL,
  `Measles_2_Date` datetime DEFAULT NULL,
  `PentaValent1_Date` datetime DEFAULT NULL,
  `PentaValent2_Date` datetime DEFAULT NULL,
  `PentaValent3_Date` datetime DEFAULT NULL,
  `is_Upload` bit(1) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Delete_Mother` bit(1) DEFAULT NULL,
  `Delete_Reason` varchar(100) DEFAULT NULL,
  `Deleted_ON` datetime DEFAULT NULL,
  `SMS_Status` tinyint(4) DEFAULT NULL,
  `Created_By` varchar(50) DEFAULT NULL,
  `Updated_By` varchar(50) DEFAULT NULL,
  `MDDS_StateID` int(11) DEFAULT NULL,
  `MDDS_District_ID` int(11) DEFAULT NULL,
  `MDDS_Taluka_ID` int(11) DEFAULT NULL,
  `MDDS_Village_ID` int(11) DEFAULT NULL,
  `BirthCertificateNo` varchar(20) DEFAULT NULL,
  `Rural_urban` varchar(10) DEFAULT NULL,
  `SNO` varchar(20) DEFAULT NULL,
  `Lead_ID` varchar(20) DEFAULT NULL,
  `My_ID` varchar(20) DEFAULT NULL,
  `CID_NO` int(11) DEFAULT NULL,
  `MID_NO` int(11) DEFAULT NULL,
  `Duplicate_Bit` bit(1) DEFAULT NULL,
  `FacilityType` varchar(30) DEFAULT NULL,
  `DueServices` varchar(50) DEFAULT NULL,
  `OverDueServices` varchar(50) DEFAULT NULL,
  `GivenServices` varchar(50) DEFAULT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Is_Valid` bit(1) DEFAULT NULL,
  `Is_Error` bit(1) DEFAULT NULL,
  `Error_Reason` varchar(50) DEFAULT NULL,
  `FileID` int(11) DEFAULT NULL,
  `IsAllocated` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ChildInValidRecordID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_psmrid` (`ProviderServiceMapID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_childvalidrecord`
--

DROP TABLE IF EXISTS `fact_childvalidrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_childvalidrecord` (
  `Fact_ChildValidRecordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RowID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `Date_of_Entry` datetime DEFAULT NULL,
  `Entry_type` smallint(6) DEFAULT NULL,
  `entrytype` varchar(50) DEFAULT NULL,
  `MCTSID_no_Child_ID` bigint(20) DEFAULT NULL,
  `Child_RCH_ID_No` bigint(20) DEFAULT NULL,
  `Mother_RCH_ID_No` bigint(20) DEFAULT NULL,
  `Child_Name` varchar(50) DEFAULT NULL,
  `Father_Name` varchar(50) DEFAULT NULL,
  `Mother_Name` varchar(50) DEFAULT NULL,
  `Mother_ID` bigint(20) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Place_of_Birth` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Caste` varchar(50) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `Child_Aadhaar_No` varchar(50) DEFAULT NULL,
  `Weight_of_Child` decimal(5,2) DEFAULT NULL,
  `Child_EID` int(11) DEFAULT NULL,
  `Child_EID_Time` datetime DEFAULT NULL,
  `Emamta_Health_ID` int(11) DEFAULT NULL,
  `Emamta_Family_ID` int(11) DEFAULT NULL,
  `Phone_No_of` varchar(50) DEFAULT NULL,
  `Phone_No` varchar(12) DEFAULT NULL,
  `Registration_Date` datetime DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `State_Name` varchar(50) DEFAULT NULL,
  `District_ID` int(11) DEFAULT NULL,
  `District_Name` varchar(50) DEFAULT NULL,
  `Taluka_Name` varchar(50) DEFAULT NULL,
  `Taluka_ID` int(11) DEFAULT NULL,
  `Block_ID` int(11) DEFAULT NULL,
  `Block_Name` varchar(50) DEFAULT NULL,
  `PHC_ID` int(11) DEFAULT NULL,
  `PHC_Name` varchar(50) DEFAULT NULL,
  `SubCenter_ID` int(11) DEFAULT NULL,
  `SubCenter_Name` varchar(50) DEFAULT NULL,
  `SubCenter_Name1` varchar(50) DEFAULT NULL,
  `Village_ID` int(11) DEFAULT NULL,
  `Village_Name` varchar(800) DEFAULT NULL,
  `GP_Village` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Year` char(4) DEFAULT NULL,
  `ANM_ID` int(11) DEFAULT NULL,
  `ANM_Name` varchar(50) DEFAULT NULL,
  `ANM_Phone_No` varchar(12) DEFAULT NULL,
  `ASHA_ID` int(11) DEFAULT NULL,
  `ASHA_Name` varchar(50) DEFAULT NULL,
  `ASHA_Phone_No` varchar(12) DEFAULT NULL,
  `BCG_Date` datetime DEFAULT NULL,
  `OPV0_Date` datetime DEFAULT NULL,
  `HepatitisB0_Dt` datetime DEFAULT NULL,
  `Hepatitis_B1_Date` datetime DEFAULT NULL,
  `DPT1_Date` datetime DEFAULT NULL,
  `OPV1_Date` datetime DEFAULT NULL,
  `Hepatitis_B2_Date` datetime DEFAULT NULL,
  `DPT2_Date` datetime DEFAULT NULL,
  `OPV2_Date` datetime DEFAULT NULL,
  `Hepatitis_B3_Date` datetime DEFAULT NULL,
  `DPT3_Date` datetime DEFAULT NULL,
  `OPV3_Date` datetime DEFAULT NULL,
  `Hepatitis_B4_Date` datetime DEFAULT NULL,
  `Measles_Date` datetime DEFAULT NULL,
  `VitA_Dose1_Date` datetime DEFAULT NULL,
  `MR_Date` datetime DEFAULT NULL,
  `DPTBooster_Date` datetime DEFAULT NULL,
  `OPVBooster_Date` datetime DEFAULT NULL,
  `VitA_Dose2_Date` datetime DEFAULT NULL,
  `VitA_Dose3_Date` datetime DEFAULT NULL,
  `VitA_Dose99_Date` datetime DEFAULT NULL,
  `VitA_Dose5_Date` datetime DEFAULT NULL,
  `VitA_Dose6_Date` datetime DEFAULT NULL,
  `VitA_Dose7_Date` datetime DEFAULT NULL,
  `VitA_Dose8_Date` datetime DEFAULT NULL,
  `VitA_Dose9_Date` datetime DEFAULT NULL,
  `JE_Date` datetime DEFAULT NULL,
  `DT5_Date` datetime DEFAULT NULL,
  `TT10_Date` datetime DEFAULT NULL,
  `TT16_Date` datetime DEFAULT NULL,
  `Measles_2_Date` datetime DEFAULT NULL,
  `PentaValent1_Date` datetime DEFAULT NULL,
  `PentaValent2_Date` datetime DEFAULT NULL,
  `PentaValent3_Date` datetime DEFAULT NULL,
  `is_Upload` bit(1) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Delete_Mother` bit(1) DEFAULT NULL,
  `Delete_Reason` varchar(100) DEFAULT NULL,
  `Deleted_ON` datetime DEFAULT NULL,
  `SMS_Status` tinyint(4) DEFAULT NULL,
  `Created_By` varchar(50) DEFAULT NULL,
  `Updated_By` varchar(50) DEFAULT NULL,
  `MDDS_StateID` int(11) DEFAULT NULL,
  `MDDS_District_ID` int(11) DEFAULT NULL,
  `MDDS_Taluka_ID` int(11) DEFAULT NULL,
  `MDDS_Village_ID` int(11) DEFAULT NULL,
  `BirthCertificateNo` varchar(20) DEFAULT NULL,
  `Rural_urban` varchar(10) DEFAULT NULL,
  `SNO` varchar(20) DEFAULT NULL,
  `Lead_ID` varchar(20) DEFAULT NULL,
  `My_ID` varchar(20) DEFAULT NULL,
  `CID_NO` int(11) DEFAULT NULL,
  `MID_NO` int(11) DEFAULT NULL,
  `Duplicate_Bit` bit(1) DEFAULT NULL,
  `FacilityType` varchar(30) DEFAULT NULL,
  `DueServices` varchar(50) DEFAULT NULL,
  `OverDueServices` varchar(50) DEFAULT NULL,
  `GivenServices` varchar(50) DEFAULT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Is_Valid` bit(1) DEFAULT NULL,
  `Is_Error` bit(1) DEFAULT NULL,
  `Error_Reason` varchar(50) DEFAULT NULL,
  `FileID` int(11) DEFAULT NULL,
  `IsAllocated` bit(1) DEFAULT NULL,
  `IsHrni` bit(1) DEFAULT NULL,
  `Hrni_Reason` varchar(300) DEFAULT NULL,
  `IsSelfNo` bit(1) DEFAULT b'0',
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ChildValidRecordID`),
  KEY `FK_FChildValidRecord_PhoneNoOf_idx` (`Phone_No_of`),
  KEY `inx_MCTSID_no_Child_ID` (`MCTSID_no_Child_ID`),
  KEY `inx_BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `inx_CreatedDate` (`CreatedDate`),
  KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `inx_isSelfNo` (`IsSelfNo`)
) ENGINE=InnoDB AUTO_INCREMENT=131071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_diahypercase`
--

DROP TABLE IF EXISTS `fact_diahypercase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_diahypercase` (
  `FactDiaHyperCaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisitCategory` varchar(50) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(45) DEFAULT NULL,
  `VehicalNo` varchar(45) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `IsDiabetesMellitus` bit(1) DEFAULT NULL,
  `IsHypertension` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `SyncedBy` varchar(45) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FactDiaHyperCaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_directoryservice`
--

DROP TABLE IF EXISTS `fact_directoryservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_directoryservice` (
  `Fact_DirectoryServiceID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DirectoryServiceID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `InstituteDirectoryID` int(11) DEFAULT NULL,
  `InstituteDirectoryName` varchar(50) DEFAULT NULL,
  `InstituteSubDirectoryID` int(11) DEFAULT NULL,
  `InstituteSubDirectoryName` varchar(50) DEFAULT NULL,
  `InstitutionID` int(11) DEFAULT NULL,
  `AcceptorHospitalName` varchar(100) DEFAULT NULL,
  `AcceptorHospitalState` varchar(100) DEFAULT NULL,
  `AcceptorHospitalDistrict` varchar(100) DEFAULT NULL,
  `AcceptorHospitalSubDistrict` varchar(100) DEFAULT NULL,
  `AcceptorHospitalVillage` varchar(100) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_DirectoryServiceID`),
  KEY `inx_brgid` (`BeneficiaryRegID`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_createddate` (`CreatedDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_epidemicoutbreak`
--

DROP TABLE IF EXISTS `fact_epidemicoutbreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_epidemicoutbreak` (
  `Fact_EpidemicOutbreakID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OutbreakComplaintID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `NatureOfComplaintID` int(11) DEFAULT NULL,
  `NatureOfComplaint` varchar(50) DEFAULT NULL,
  `TotalPeopleAffected` int(11) DEFAULT NULL,
  `AffectedDistrictID` int(11) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `AffectedDistrictBlockID` int(11) DEFAULT NULL,
  `DistrictBlockName` varchar(50) DEFAULT NULL,
  `AffectedDistrictBranchID` int(11) DEFAULT NULL,
  `DistrictBranchName` varchar(50) DEFAULT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_EpidemicOutbreakID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_Benregid` (`BeneficiaryRegID`)
) ENGINE=InnoDB AUTO_INCREMENT=2215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_feedback`
--

DROP TABLE IF EXISTS `fact_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_feedback` (
  `Fact_FeedbackID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FeedbackID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `FeedbackAgainst` varchar(100) DEFAULT NULL,
  `DesignationID` int(11) DEFAULT NULL,
  `DesignationName` varchar(50) DEFAULT NULL,
  `InstitutionID` int(11) DEFAULT NULL,
  `InstitutionName` varchar(100) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `BlockID` int(11) DEFAULT NULL,
  `BlockName` varchar(50) DEFAULT NULL,
  `DistrictBranchID` int(11) DEFAULT NULL,
  `districtbranchname` varchar(100) DEFAULT NULL,
  `InstitutionTypeID` int(11) DEFAULT NULL,
  `InstituteTypeName` varchar(50) DEFAULT NULL,
  `SeverityID` smallint(6) DEFAULT NULL,
  `SeverityName` varchar(50) DEFAULT NULL,
  `FeedbackTypeID` smallint(6) DEFAULT NULL,
  `FeedbackTypeName` varchar(50) DEFAULT NULL,
  `FeedbackNatureID` int(11) DEFAULT NULL,
  `FeedbackNatureName` varchar(50) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `CategoryName` varchar(100) DEFAULT NULL,
  `SubCategoryID` int(11) DEFAULT NULL,
  `SubCategoryName` varchar(100) DEFAULT NULL,
  `FeedbackStatusID` smallint(6) DEFAULT NULL,
  `FeedbackStatusName` varchar(50) DEFAULT NULL,
  `Feedback` varchar(500) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `SMSPhoneNo` varchar(20) DEFAULT NULL,
  `ServiceAvailDate` datetime DEFAULT NULL,
  `EmailStatusID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_FeedbackID`),
  KEY `inx_brgid` (`BeneficiaryRegID`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_bencallid` (`BenCallID`)
) ENGINE=InnoDB AUTO_INCREMENT=5060 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_foodsafetycopmlaint`
--

DROP TABLE IF EXISTS `fact_foodsafetycopmlaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_foodsafetycopmlaint` (
  `Fact_FSComplaintID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FSComplaintID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `PatientName` varchar(100) DEFAULT NULL,
  `PatientAge` int(11) DEFAULT NULL,
  `PatientGenderID` smallint(6) DEFAULT NULL,
  `PatientGenderName` varchar(20) DEFAULT NULL,
  `TypeOfRequest` varchar(25) DEFAULT NULL,
  `isDiarrhea` tinyint(4) DEFAULT NULL,
  `isVomiting` tinyint(4) DEFAULT NULL,
  `isAbdominalPain` tinyint(4) DEFAULT NULL,
  `isChillsOrRigors` tinyint(4) DEFAULT NULL,
  `isGiddiness` tinyint(4) DEFAULT NULL,
  `isDehydration` tinyint(4) DEFAULT NULL,
  `isRashes` tinyint(4) DEFAULT NULL,
  `FromWhen` datetime DEFAULT NULL,
  `HistoryOfDiet` varchar(200) DEFAULT NULL,
  `isFoodConsumed` tinyint(4) DEFAULT NULL,
  `TypeOfFood` varchar(200) DEFAULT NULL,
  `FoodConsumedFrom` varchar(200) DEFAULT NULL,
  `AssociatedSymptoms` varchar(200) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `DistrictBlockID` int(11) DEFAULT NULL,
  `DistrictBlockName` varchar(50) DEFAULT NULL,
  `VillageID` int(11) DEFAULT NULL,
  `VillageName` varchar(100) DEFAULT NULL,
  `FeedbackTypeID` smallint(6) DEFAULT NULL,
  `FeedbackType` varchar(50) DEFAULT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `IsSelf` bit(1) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `Fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_FSComplaintID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_Benregid` (`BeneficiaryRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_itemstockentry`
--

DROP TABLE IF EXISTS `fact_itemstockentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_itemstockentry` (
  `Fact_ItemStockEntryID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemStockEntryID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `FacilityName` varchar(100) DEFAULT NULL,
  `FacilityDesc` varchar(100) DEFAULT NULL,
  `FacilityCode` varchar(20) DEFAULT NULL,
  `FacilityTypeID` int(11) DEFAULT NULL,
  `IsMainFacility` bit(1) DEFAULT NULL,
  `MainFacilityID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `ItemDesc` varchar(100) DEFAULT NULL,
  `ItemCategoryID` int(11) DEFAULT NULL,
  `ItemCategoryName` varchar(100) DEFAULT NULL,
  `AlertBeforeDays` int(11) DEFAULT NULL,
  `Strength` varchar(10) DEFAULT NULL,
  `BatchNo` varchar(45) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `QuantityInHand` int(11) DEFAULT NULL,
  `UnitCostPrice` decimal(10,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `EntryTypeID` int(11) DEFAULT NULL,
  `EntryType` varchar(45) DEFAULT NULL,
  `vanid` int(11) DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ItemStockEntryID`)
) ENGINE=InnoDB AUTO_INCREMENT=32768 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_itemstockexit`
--

DROP TABLE IF EXISTS `fact_itemstockexit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_itemstockexit` (
  `Fact_ItemStockExitID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemStockExitID` int(11) DEFAULT NULL,
  `ItemStockEntryID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `FacilityName` varchar(100) DEFAULT NULL,
  `FacilityDesc` varchar(100) DEFAULT NULL,
  `FacilityCode` varchar(20) DEFAULT NULL,
  `FacilityTypeID` int(11) DEFAULT NULL,
  `IsMainFacility` bit(1) DEFAULT NULL,
  `MainFacilityID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `ItemDesc` varchar(100) DEFAULT NULL,
  `ItemCategoryID` int(11) DEFAULT NULL,
  `ItemCategoryName` varchar(100) DEFAULT NULL,
  `Strength` varchar(10) DEFAULT NULL,
  `BatchNo` varchar(45) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `QuantityInHand` int(11) DEFAULT NULL,
  `UnitCostPrice` decimal(10,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `EntryTypeID` int(11) DEFAULT NULL,
  `EntryType` varchar(45) DEFAULT NULL,
  `QuantityGiven` int(11) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `ExitTypeID` int(11) DEFAULT NULL,
  `ExitType` varchar(45) DEFAULT NULL,
  `vanid` int(11) DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_ItemStockExitID`)
) ENGINE=InnoDB AUTO_INCREMENT=983026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_labtestorder`
--

DROP TABLE IF EXISTS `fact_labtestorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_labtestorder` (
  `Fact_LabTestOrderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisitCategory` varchar(20) DEFAULT NULL,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `ProcedureID` int(11) DEFAULT NULL,
  `ProcedureName` varchar(100) DEFAULT NULL,
  `TestingRequirements` varchar(50) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(30) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_LabTestOrderID`),
  KEY `BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `VisitCode` (`VisitCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_labtestresult`
--

DROP TABLE IF EXISTS `fact_labtestresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_labtestresult` (
  `Fact_LabTestresult` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `ProcedureID` int(11) DEFAULT NULL,
  `ProcedureName` varchar(100) DEFAULT NULL,
  `TestComponentID` int(11) DEFAULT NULL,
  `TestComponentName` varchar(100) DEFAULT NULL,
  `TestResultValue` varchar(30) DEFAULT NULL,
  `TestResultUnit` varchar(30) DEFAULT NULL,
  `TestReportFilePath` varchar(300) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(30) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_LabTestresult`),
  KEY `BeneficiaryRegID` (`BeneficiaryRegID`)
) ENGINE=InnoDB AUTO_INCREMENT=785022 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_mctscallresponse`
--

DROP TABLE IF EXISTS `fact_mctscallresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_mctscallresponse` (
  `Fact_MctsCallResponseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MctsCallResponseID` bigint(20) DEFAULT NULL,
  `MotherID` bigint(20) DEFAULT NULL,
  `ChildID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `obcallid` bigint(20) DEFAULT NULL,
  `outboundCallType` varchar(255) DEFAULT NULL,
  `SectionID` int(11) DEFAULT NULL,
  `QuestionID` int(11) DEFAULT NULL,
  `Question` varchar(300) DEFAULT NULL,
  `Answer` varchar(3000) DEFAULT NULL,
  `ReasonsforHrni` varchar(800) DEFAULT NULL,
  `OtherHrni` varchar(300) DEFAULT NULL,
  `CongentialAnomalies` varchar(800) DEFAULT NULL,
  `OtherCongentialAnomalies` varchar(300) DEFAULT NULL,
  `ProbableCauseOfDefect` varchar(300) DEFAULT NULL,
  `ReasonsForHrp` varchar(800) DEFAULT NULL,
  `OtherHrpReason` varchar(300) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_MctsCallResponseID`),
  KEY `inx_Motherid` (`MotherID`),
  KEY `inx_ChildID` (`ChildID`),
  KEY `inx_Bencallid` (`BenCallID`),
  KEY `inx_QuestionId` (`QuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2752471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_mctsoutboundcall`
--

DROP TABLE IF EXISTS `fact_mctsoutboundcall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_mctsoutboundcall` (
  `Fact_MctsOutboundCallID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBCallID` bigint(20) DEFAULT NULL,
  `MotherID` bigint(20) DEFAULT NULL,
  `ChildID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `AllocatedUserID` int(11) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `OutboundCallType` varchar(30) DEFAULT NULL,
  `DisplayOBCallType` varchar(30) DEFAULT NULL,
  `CallDateFrom` datetime DEFAULT NULL,
  `CallDateTo` datetime DEFAULT NULL,
  `PrefferedCallDate` datetime DEFAULT NULL,
  `CallStatus` varchar(30) DEFAULT NULL,
  `NoOfTrials` int(11) DEFAULT '0',
  `AllocationStatus` varchar(20) DEFAULT NULL,
  `phoneNumberType` varchar(50) DEFAULT NULL,
  `IsSMSSent` bit(1) DEFAULT NULL,
  `IsHighRisk` bit(1) DEFAULT NULL,
  `HighRisk_Reason` varchar(300) DEFAULT NULL,
  `IsHrni` bit(1) DEFAULT NULL,
  `Hrni_Reason` varchar(300) DEFAULT NULL,
  `congenitalanomalies` varchar(100) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_MctsOutboundCallID`),
  KEY `inx_BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `inx_ChildID` (`ChildID`),
  KEY `inx_MotherID` (`MotherID`),
  KEY `inx_CreatedDate` (`CreatedDate`),
  KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `inx_OBCallID` (`OBCallID`),
  KEY `inx_Outboundcalltype` (`OutboundCallType`),
  KEY `inx_AllocatedUserid` (`AllocatedUserID`),
  KEY `inx_CallStatus` (`CallStatus`),
  KEY `inx_CallDateTo` (`CallDateTo`)
) ENGINE=InnoDB AUTO_INCREMENT=1441771 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_motherinvalidrecord`
--

DROP TABLE IF EXISTS `fact_motherinvalidrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_motherinvalidrecord` (
  `Fact_MotherInValidRecordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MotherInValidRecordID` bigint(20) DEFAULT NULL,
  `RowID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `Date_of_Entry` datetime DEFAULT NULL,
  `Entry_type` smallint(6) DEFAULT NULL,
  `MCTSID_no` bigint(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Husband_Name` varchar(50) DEFAULT NULL,
  `PhoneNo_Of_Whom` varchar(50) DEFAULT NULL,
  `Whom_PhoneNo` varchar(50) DEFAULT NULL,
  `Birth_Date` datetime DEFAULT NULL,
  `Age` tinyint(4) DEFAULT NULL,
  `Blood_Group` varchar(5) DEFAULT NULL,
  `Caste` varchar(20) DEFAULT NULL,
  `Aadhar_no` varchar(20) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `State_Name` varchar(20) DEFAULT NULL,
  `District_ID` int(11) DEFAULT NULL,
  `District_Name` varchar(20) DEFAULT NULL,
  `Taluka_Name` varchar(20) DEFAULT NULL,
  `Taluka_ID` int(11) DEFAULT NULL,
  `Block_ID` int(11) DEFAULT NULL,
  `Block_Name` varchar(50) DEFAULT NULL,
  `SubCenter_ID` int(11) DEFAULT NULL,
  `SubCenter_Name` varchar(50) DEFAULT NULL,
  `Village_ID` int(11) DEFAULT NULL,
  `Village_Name` varchar(50) DEFAULT NULL,
  `City_ID` int(11) DEFAULT NULL,
  `City_Name` varchar(50) DEFAULT NULL,
  `SubCenter_Name1` varchar(50) DEFAULT NULL,
  `ANM_ID` int(11) DEFAULT NULL,
  `ANM_Name` varchar(50) DEFAULT NULL,
  `ANM_Ph` varchar(20) DEFAULT NULL,
  `ASHA_ID` int(11) DEFAULT NULL,
  `ASHA_Name` varchar(50) DEFAULT NULL,
  `ASHA_Ph` varchar(20) DEFAULT NULL,
  `PHC_ID` varchar(20) DEFAULT NULL,
  `PHC_Name` varchar(50) DEFAULT NULL,
  `SUBPHC_ID` varchar(20) DEFAULT NULL,
  `SUBPHC_Name` varchar(50) DEFAULT NULL,
  `YR` char(4) DEFAULT NULL,
  `GP_Village` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `LMP_Date` datetime DEFAULT NULL,
  `ANC1_Date` datetime DEFAULT NULL,
  `ANC2_Date` datetime DEFAULT NULL,
  `ANC3_Date` datetime DEFAULT NULL,
  `ANC4_Date` datetime DEFAULT NULL,
  `ANC_Complication` varchar(50) DEFAULT NULL,
  `TT1_Date` datetime DEFAULT NULL,
  `TT2_Date` datetime DEFAULT NULL,
  `TTBooster_Date` datetime DEFAULT NULL,
  `IFA100_Given_Date` datetime DEFAULT NULL,
  `EDD` datetime DEFAULT NULL,
  `Anemia` varchar(15) DEFAULT NULL,
  `RTI_STI` char(4) DEFAULT NULL,
  `Delivery_Lnk_Facility` varchar(50) DEFAULT NULL,
  `Facility_Name` varchar(50) DEFAULT NULL,
  `Delivery_Date` datetime DEFAULT NULL,
  `Delivery_Place_home_type` varchar(100) DEFAULT NULL,
  `Delivery_Place_Public` varchar(100) DEFAULT NULL,
  `Delivery_Place_Private` varchar(100) DEFAULT NULL,
  `Delivery_type` varchar(20) DEFAULT NULL,
  `Delivery_Complications` varchar(100) DEFAULT NULL,
  `Discharge_Date` datetime DEFAULT NULL,
  `Abortion` varchar(50) DEFAULT NULL,
  `PNC_Home_Visit` varchar(20) DEFAULT NULL,
  `PNC_Complication` varchar(20) DEFAULT NULL,
  `PPC_Method` varchar(20) DEFAULT NULL,
  `PNC_Checkup` varchar(20) DEFAULT NULL,
  `Outcome_Nos` tinyint(4) DEFAULT NULL,
  `Child1_ID` bigint(20) DEFAULT NULL,
  `Child1_Name` varchar(50) DEFAULT NULL,
  `Child1_Gender` varchar(10) DEFAULT NULL,
  `Child1_Weight` decimal(5,2) DEFAULT NULL,
  `Child1_BreastFeeding` char(4) DEFAULT NULL,
  `Child2_ID` bigint(20) DEFAULT NULL,
  `Child2_Name` varchar(50) DEFAULT NULL,
  `Child2_Gender` varchar(10) DEFAULT NULL,
  `Child2_weight` decimal(5,2) DEFAULT NULL,
  `Child2_Breastfeeding` char(4) DEFAULT NULL,
  `Child3_ID` bigint(20) DEFAULT NULL,
  `Child3_Name` varchar(50) DEFAULT NULL,
  `Child3_Gender` varchar(10) DEFAULT NULL,
  `Child3_Weight` decimal(5,2) DEFAULT NULL,
  `Child3_Breastfeeding` char(4) DEFAULT NULL,
  `Child4_ID` bigint(20) DEFAULT NULL,
  `Child4_Name` varchar(50) DEFAULT NULL,
  `Child4_Gender` varchar(10) DEFAULT NULL,
  `Child4_Weight` decimal(5,2) DEFAULT NULL,
  `Child4_Breastfeeding` char(4) DEFAULT NULL,
  `Mother_Reg_Date` datetime DEFAULT NULL,
  `Last_Update_Date` datetime DEFAULT NULL,
  `EID` varchar(20) DEFAULT NULL,
  `EID_time` datetime DEFAULT NULL,
  `CPSMS_Flag` bit(1) DEFAULT NULL,
  `JSY_Beneficiary` char(4) DEFAULT NULL,
  `JSY_Paid_Date` datetime DEFAULT NULL,
  `Bank_Name` varchar(50) DEFAULT NULL,
  `Bank_Branch_Name` varchar(50) DEFAULT NULL,
  `Acc_No` varchar(20) DEFAULT NULL,
  `IFSC_Code` varchar(20) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Referred_By_Telecaller` bit(1) DEFAULT NULL,
  `Referred_Date` datetime DEFAULT NULL,
  `No_of_Try` tinyint(4) DEFAULT NULL,
  `Call_Answered` bit(1) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `High_Risk` bit(1) DEFAULT NULL,
  `Call_Verified` bit(1) DEFAULT NULL,
  `Associate` varchar(20) DEFAULT NULL,
  `Call_Date` datetime DEFAULT NULL,
  `Due_Services` varchar(50) DEFAULT NULL,
  `Due_Services_Response` varchar(50) DEFAULT NULL,
  `Overdue_Services` varchar(50) DEFAULT NULL,
  `Overdue_Services_Response` varchar(50) DEFAULT NULL,
  `Given_Services` varchar(50) DEFAULT NULL,
  `Given_Services_Response` varchar(50) DEFAULT NULL,
  `Miscarriage` bit(1) DEFAULT NULL,
  `Baby_Died` bit(1) DEFAULT NULL,
  `Call_No` varchar(50) DEFAULT NULL,
  `Questions_Asked` varchar(50) DEFAULT NULL,
  `Asnwer_Given_by_Benificary` varchar(50) DEFAULT NULL,
  `Source` varchar(50) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `NoCall_Reason` varchar(50) DEFAULT NULL,
  `NoPhone_Reason` varchar(50) DEFAULT NULL,
  `Created_By` varchar(50) DEFAULT NULL,
  `Updated_By` varchar(50) DEFAULT NULL,
  `BPL_APL` varchar(50) DEFAULT NULL,
  `MDDS_StateID` varchar(50) DEFAULT NULL,
  `MDDS_District_ID` varchar(50) DEFAULT NULL,
  `MDDS_Taluka_ID` varchar(50) DEFAULT NULL,
  `MDDS_Village_ID` varchar(50) DEFAULT NULL,
  `Is_Valid` bit(1) DEFAULT NULL,
  `InValid_Reason` varchar(45) DEFAULT NULL,
  `Is_Error` bit(1) DEFAULT NULL,
  `Error_Reason` varchar(100) DEFAULT NULL,
  `FileID` int(11) DEFAULT NULL,
  `IsAllocated` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_MotherInValidRecordID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_psmrid` (`ProviderServiceMapID`)
) ENGINE=InnoDB AUTO_INCREMENT=18459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_mothervalidrecord`
--

DROP TABLE IF EXISTS `fact_mothervalidrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_mothervalidrecord` (
  `Fact_MotherValidRecordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MotherValidRecordID` bigint(20) DEFAULT NULL,
  `RowID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `Date_of_Entry` datetime DEFAULT NULL,
  `Entry_type` smallint(6) DEFAULT NULL,
  `MCTSID_no` bigint(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Husband_Name` varchar(50) DEFAULT NULL,
  `PhoneNo_Of_Whom` varchar(50) DEFAULT NULL,
  `Whom_PhoneNo` varchar(50) DEFAULT NULL,
  `Birth_Date` datetime DEFAULT NULL,
  `Age` tinyint(4) DEFAULT NULL,
  `Blood_Group` varchar(5) DEFAULT NULL,
  `Caste` varchar(20) DEFAULT NULL,
  `Aadhar_no` varchar(20) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `State_Name` varchar(20) DEFAULT NULL,
  `District_ID` int(11) DEFAULT NULL,
  `District_Name` varchar(20) DEFAULT NULL,
  `Taluka_Name` varchar(20) DEFAULT NULL,
  `Taluka_ID` int(11) DEFAULT NULL,
  `Block_ID` int(11) DEFAULT NULL,
  `Block_Name` varchar(50) DEFAULT NULL,
  `SubCenter_ID` int(11) DEFAULT NULL,
  `SubCenter_Name` varchar(50) DEFAULT NULL,
  `Village_ID` int(11) DEFAULT NULL,
  `Village_Name` varchar(800) DEFAULT NULL,
  `City_ID` int(11) DEFAULT NULL,
  `City_Name` varchar(50) DEFAULT NULL,
  `SubCenter_Name1` varchar(50) DEFAULT NULL,
  `ANM_ID` int(11) DEFAULT NULL,
  `ANM_Name` varchar(50) DEFAULT NULL,
  `ANM_Ph` varchar(20) DEFAULT NULL,
  `ASHA_ID` int(11) DEFAULT NULL,
  `ASHA_Name` varchar(50) DEFAULT NULL,
  `ASHA_Ph` varchar(20) DEFAULT NULL,
  `PHC_ID` varchar(20) DEFAULT NULL,
  `PHC_Name` varchar(50) DEFAULT NULL,
  `SUBPHC_ID` varchar(20) DEFAULT NULL,
  `SUBPHC_Name` varchar(50) DEFAULT NULL,
  `YR` char(4) DEFAULT NULL,
  `GP_Village` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `LMP_Date` datetime DEFAULT NULL,
  `ANC1_Date` datetime DEFAULT NULL,
  `ANC2_Date` datetime DEFAULT NULL,
  `ANC3_Date` datetime DEFAULT NULL,
  `ANC4_Date` datetime DEFAULT NULL,
  `ANC_Complication` varchar(50) DEFAULT NULL,
  `TT1_Date` datetime DEFAULT NULL,
  `TT2_Date` datetime DEFAULT NULL,
  `TTBooster_Date` datetime DEFAULT NULL,
  `IFA100_Given_Date` datetime DEFAULT NULL,
  `EDD` datetime DEFAULT NULL,
  `Anemia` varchar(15) DEFAULT NULL,
  `RTI_STI` char(4) DEFAULT NULL,
  `Delivery_Lnk_Facility` varchar(50) DEFAULT NULL,
  `Facility_Name` varchar(50) DEFAULT NULL,
  `Delivery_Date` datetime DEFAULT NULL,
  `Delivery_Place_home_type` varchar(100) DEFAULT NULL,
  `Delivery_Place_Public` varchar(100) DEFAULT NULL,
  `Delivery_Place_Private` varchar(100) DEFAULT NULL,
  `Delivery_type` varchar(20) DEFAULT NULL,
  `Delivery_Complications` varchar(100) DEFAULT NULL,
  `Discharge_Date` datetime DEFAULT NULL,
  `Abortion` varchar(50) DEFAULT NULL,
  `PNC_Home_Visit` varchar(20) DEFAULT NULL,
  `PNC_Complication` varchar(20) DEFAULT NULL,
  `PPC_Method` varchar(20) DEFAULT NULL,
  `PNC_Checkup` varchar(20) DEFAULT NULL,
  `Outcome_Nos` tinyint(4) DEFAULT NULL,
  `Child1_ID` bigint(20) DEFAULT NULL,
  `Child1_Name` varchar(50) DEFAULT NULL,
  `Child1_Gender` varchar(10) DEFAULT NULL,
  `Child1_Weight` decimal(5,2) DEFAULT NULL,
  `Child1_BreastFeeding` char(4) DEFAULT NULL,
  `Child2_ID` bigint(20) DEFAULT NULL,
  `Child2_Name` varchar(50) DEFAULT NULL,
  `Child2_Gender` varchar(10) DEFAULT NULL,
  `Child2_weight` decimal(5,2) DEFAULT NULL,
  `Child2_Breastfeeding` char(4) DEFAULT NULL,
  `Child3_ID` bigint(20) DEFAULT NULL,
  `Child3_Name` varchar(50) DEFAULT NULL,
  `Child3_Gender` varchar(10) DEFAULT NULL,
  `Child3_Weight` decimal(5,2) DEFAULT NULL,
  `Child3_Breastfeeding` char(4) DEFAULT NULL,
  `Child4_ID` bigint(20) DEFAULT NULL,
  `Child4_Name` varchar(50) DEFAULT NULL,
  `Child4_Gender` varchar(10) DEFAULT NULL,
  `Child4_Weight` decimal(5,2) DEFAULT NULL,
  `Child4_Breastfeeding` char(4) DEFAULT NULL,
  `Mother_Reg_Date` datetime DEFAULT NULL,
  `Last_Update_Date` datetime DEFAULT NULL,
  `EID` varchar(20) DEFAULT NULL,
  `EID_time` datetime DEFAULT NULL,
  `CPSMS_Flag` bit(1) DEFAULT NULL,
  `JSY_Beneficiary` char(4) DEFAULT NULL,
  `JSY_Paid_Date` datetime DEFAULT NULL,
  `Bank_Name` varchar(50) DEFAULT NULL,
  `Bank_Branch_Name` varchar(50) DEFAULT NULL,
  `Acc_No` varchar(20) DEFAULT NULL,
  `IFSC_Code` varchar(20) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Referred_By_Telecaller` bit(1) DEFAULT NULL,
  `Referred_Date` datetime DEFAULT NULL,
  `No_of_Try` tinyint(4) DEFAULT NULL,
  `Call_Answered` bit(1) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `High_Risk` bit(1) DEFAULT NULL,
  `High_Risk_Reason` varchar(100) DEFAULT NULL,
  `Call_Verified` bit(1) DEFAULT NULL,
  `Associate` varchar(20) DEFAULT NULL,
  `Call_Date` datetime DEFAULT NULL,
  `Due_Services` varchar(50) DEFAULT NULL,
  `Due_Services_Response` varchar(50) DEFAULT NULL,
  `Overdue_Services` varchar(50) DEFAULT NULL,
  `Overdue_Services_Response` varchar(50) DEFAULT NULL,
  `Given_Services` varchar(50) DEFAULT NULL,
  `Given_Services_Response` varchar(50) DEFAULT NULL,
  `Miscarriage` bit(1) DEFAULT NULL,
  `Baby_Died` bit(1) DEFAULT NULL,
  `Call_No` varchar(50) DEFAULT NULL,
  `Questions_Asked` varchar(50) DEFAULT NULL,
  `Asnwer_Given_by_Benificary` varchar(50) DEFAULT NULL,
  `Source` varchar(50) DEFAULT NULL,
  `NoCall_Reason` varchar(50) DEFAULT NULL,
  `NoPhone_Reason` varchar(50) DEFAULT NULL,
  `Created_By` varchar(50) DEFAULT NULL,
  `Updated_By` varchar(50) DEFAULT NULL,
  `BPL_APL` varchar(50) DEFAULT NULL,
  `MDDS_StateID` varchar(50) DEFAULT NULL,
  `MDDS_District_ID` varchar(50) DEFAULT NULL,
  `MDDS_Taluka_ID` varchar(50) DEFAULT NULL,
  `MDDS_Village_ID` varchar(50) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Is_Valid` bit(1) DEFAULT NULL,
  `InValid_Reason` varchar(45) DEFAULT NULL,
  `Is_Error` bit(1) DEFAULT NULL,
  `Error_Reason` varchar(100) DEFAULT NULL,
  `FileID` int(11) DEFAULT NULL,
  `IsAllocated` bit(1) DEFAULT NULL,
  `Registration_no` bigint(20) DEFAULT NULL,
  `Landline_no` varchar(50) DEFAULT NULL,
  `Mother_Weight` int(11) DEFAULT NULL,
  `ANC1_Symptoms_High_Risk` varchar(100) DEFAULT NULL,
  `ANC2_Symptoms_High_Risk` varchar(100) DEFAULT NULL,
  `ANC3_Symptoms_High_Risk` varchar(100) DEFAULT NULL,
  `ANC4_Symptoms_High_Risk` varchar(100) DEFAULT NULL,
  `Delivery_Place` varchar(100) DEFAULT NULL,
  `Delivery_Place_Name` varchar(100) DEFAULT NULL,
  `IsSelfNo` bit(1) DEFAULT b'0',
  `Deleted` bit(1) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_MotherValidRecordID`),
  KEY `FK_FactMotValidR_PhoneNoOfWhom_idx` (`PhoneNo_Of_Whom`),
  KEY `inx_ProviderServiceMapID` (`ProviderServiceMapID`),
  KEY `inx_CreatedDate` (`CreatedDate`),
  KEY `inx_BeneficiaryRegID` (`BeneficiaryRegID`),
  KEY `inx_MCTSID_no` (`MCTSID_no`),
  KEY `inx_isSelfNo` (`IsSelfNo`)
) ENGINE=InnoDB AUTO_INCREMENT=131071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_organdonation`
--

DROP TABLE IF EXISTS `fact_organdonation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_organdonation` (
  `Fact_OrganDonationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrganDonationID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `DonarName` varchar(100) DEFAULT NULL,
  `DonarAge` int(11) DEFAULT NULL,
  `DonarGenderID` smallint(6) DEFAULT NULL,
  `DonarGenderName` varchar(20) DEFAULT NULL,
  `DonationTypeID` int(11) DEFAULT NULL,
  `DonationTypeName` varchar(20) DEFAULT NULL,
  `DonatableOrganID` int(11) DEFAULT NULL,
  `DonatableOrganName` varchar(50) DEFAULT NULL,
  `AcceptorHospitalID` int(11) DEFAULT NULL,
  `AcceptorHospitalName` varchar(100) DEFAULT NULL,
  `AcceptorHospitalState` varchar(100) DEFAULT NULL,
  `AcceptorHospitalDistrict` varchar(100) DEFAULT NULL,
  `AcceptorHospitalSubDistrict` varchar(100) DEFAULT NULL,
  `AcceptorHospitalVillage` varchar(100) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `IsSelf` bit(1) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_OrganDonationID`),
  KEY `inx_createddate` (`CreatedDate`),
  KEY `inx_psmrid` (`ProviderServiceMapID`),
  KEY `inx_Benregid` (`BeneficiaryRegID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_patientissueexit`
--

DROP TABLE IF EXISTS `fact_patientissueexit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_patientissueexit` (
  `Fact_PatientIssueExitID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemStockExitID` int(11) DEFAULT NULL,
  `ItemStockEntryID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `ItemDesc` varchar(100) DEFAULT NULL,
  `ItemCategoryID` int(11) DEFAULT NULL,
  `ItemCategoryName` varchar(100) DEFAULT NULL,
  `Strength` varchar(100) DEFAULT NULL,
  `BatchNo` varchar(45) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `QuantityInHand` int(11) DEFAULT NULL,
  `UnitCostPrice` decimal(10,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `QuantityGiven` int(11) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `ExitTypeID` int(11) DEFAULT NULL,
  `ExitType` varchar(45) DEFAULT NULL,
  `PatientIssueID` int(11) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `VisitID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `PatientName` varchar(150) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `DoctorName` varchar(20) DEFAULT NULL,
  `PrescriptionID` int(11) DEFAULT NULL,
  `Reference` varchar(50) DEFAULT NULL,
  `IssueType` varchar(20) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `PatientIssueDeleted` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_PatientIssueExitID`)
) ENGINE=InnoDB AUTO_INCREMENT=983026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_phoneblock`
--

DROP TABLE IF EXISTS `fact_phoneblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_phoneblock` (
  `Fact_PhoneBlockID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `phoneNo` varchar(15) DEFAULT NULL,
  `NoOfNuisanceCall` int(11) DEFAULT NULL,
  `IsBlocked` bit(1) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_PhoneBlockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_phyvitals`
--

DROP TABLE IF EXISTS `fact_phyvitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_phyvitals` (
  `fact_PhyVitalsid` bigint(11) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `Temperature` decimal(5,2) DEFAULT NULL,
  `PulseRate` smallint(6) DEFAULT NULL,
  `RespiratoryRate` smallint(6) DEFAULT NULL,
  `SystolicBP_1stReading` smallint(6) DEFAULT NULL,
  `DiastolicBP_1stReading` smallint(6) DEFAULT NULL,
  `AverageSystolicBP` smallint(6) DEFAULT NULL,
  `AverageDiastolicBP` smallint(6) DEFAULT NULL,
  `BloodPressureStatusID` smallint(6) DEFAULT NULL,
  `BloodPressureStatus` varchar(30) DEFAULT NULL,
  `BloodGlucose_Fasting` smallint(6) DEFAULT NULL,
  `BloodGlucose_Random` smallint(6) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(30) DEFAULT NULL,
  `Weight_Kg` decimal(5,2) DEFAULT NULL,
  `Height_cm` decimal(5,2) DEFAULT NULL,
  `BMI` decimal(5,2) DEFAULT NULL,
  `ClinicalObservation` varchar(500) DEFAULT NULL,
  `OtherSymptoms` varchar(300) DEFAULT NULL,
  `TobaccoUseStatus` varchar(50) DEFAULT NULL,
  `AlcoholIntakeStatus` varchar(50) DEFAULT NULL,
  `fact_CreatedDate` int(11) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createddate` datetime DEFAULT NULL,
  PRIMARY KEY (`fact_PhyVitalsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2611864 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_pnccare`
--

DROP TABLE IF EXISTS `fact_pnccare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_pnccare` (
  `Fact_PNCCareID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitNo` smallint(6) DEFAULT NULL,
  `DeliveryTypeID` smallint(6) DEFAULT NULL,
  `DeliveryType` varchar(100) DEFAULT NULL,
  `DeliveryPlaceID` smallint(6) DEFAULT NULL,
  `DeliveryPlace` varchar(100) DEFAULT NULL,
  `OtherDeliveryPlace` varchar(100) DEFAULT NULL,
  `DateOfDelivery` datetime DEFAULT NULL,
  `DeliveryComplicationID` smallint(6) DEFAULT NULL,
  `DeliveryComplication` varchar(100) DEFAULT NULL,
  `OtherDeliveryComplication` varchar(100) DEFAULT NULL,
  `PostpartumComplicationID` smallint(6) DEFAULT NULL,
  `PostpartumComplication` varchar(30) DEFAULT NULL,
  `PregOutcomeID` smallint(6) DEFAULT NULL,
  `PregOutcome` varchar(20) DEFAULT NULL,
  `PostNatalComplicationID` smallint(6) DEFAULT NULL,
  `PostNatalComplication` varchar(100) DEFAULT NULL,
  `OtherPostNatalComplication` varchar(100) DEFAULT NULL,
  `GestationID` smallint(6) DEFAULT NULL,
  `GestationName` varchar(20) DEFAULT NULL,
  `GestationalAgeOfNewborn` varchar(20) DEFAULT NULL,
  `BirthWeightOfNewborn` decimal(5,2) DEFAULT NULL,
  `NewBornHealthStatusID` int(11) DEFAULT NULL,
  `NewBornHealthStatus` varchar(30) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_PNCCareID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_pncdiagnosis`
--

DROP TABLE IF EXISTS `fact_pncdiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_pncdiagnosis` (
  `FactPNCDiagnosisID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisitCategory` varchar(50) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(45) DEFAULT NULL,
  `VehicalNo` varchar(45) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `ProvisionalDiagnosis` text,
  `ConfirmatoryDiagnosis` text,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `SyncedBy` varchar(45) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FactPNCDiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_prescribeddrug`
--

DROP TABLE IF EXISTS `fact_prescribeddrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_prescribeddrug` (
  `Fact_PrescribedDrugID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PrescribedDrugID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `DrugForm` varchar(15) DEFAULT NULL,
  `DrugID` int(11) DEFAULT NULL,
  `GenericDrugName` varchar(300) DEFAULT NULL,
  `DrugTradeOrBrandName` varchar(50) DEFAULT NULL,
  `DrugStrength` varchar(50) DEFAULT NULL,
  `Dose` varchar(30) DEFAULT NULL,
  `Route` varchar(30) DEFAULT NULL,
  `Frequency` varchar(30) DEFAULT NULL,
  `Duration` varchar(30) DEFAULT NULL,
  `DuartionUnit` varchar(30) DEFAULT NULL,
  `RelationToFood` varchar(20) DEFAULT NULL,
  `SpecialInstruction` varchar(100) DEFAULT NULL,
  `QtyPrescribed` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_PrescribedDrugID`)
) ENGINE=InnoDB AUTO_INCREMENT=1670564 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_prescription`
--

DROP TABLE IF EXISTS `fact_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_prescription` (
  `Fact_PrescriptionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PrescriptionID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `DiagnosisProvided` text,
  `DiagnosisProvided_SCTCode` text,
  `DiagnosisProvided_SCTTerm` text,
  `Instruction` varchar(300) DEFAULT NULL,
  `ConfirmatoryDiagnosis` varchar(300) DEFAULT NULL,
  `ExternalInvestigation` varchar(300) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `ReferredToInstituteID` int(11) DEFAULT NULL,
  `ReferredToInstitute` varchar(200) DEFAULT NULL,
  `RefrredToAdditionalService` varchar(100) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_schemeservice`
--

DROP TABLE IF EXISTS `fact_schemeservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_schemeservice` (
  `Fact_SchemeServiceID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SchemeServiceID` bigint(20) DEFAULT NULL,
  `RequestID` varchar(30) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenCallID` bigint(20) DEFAULT NULL,
  `SchemeID` int(11) DEFAULT NULL,
  `SchemeName` varchar(100) DEFAULT NULL,
  `SchemeDesc` varchar(300) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_SchemeServiceID`),
  KEY `inx_brgid` (`BeneficiaryRegID`),
  KEY `inx_createddate` (`CreatedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_tmanc`
--

DROP TABLE IF EXISTS `fact_tmanc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_tmanc` (
  `Fact_TMANC` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisitNo` int(11) DEFAULT NULL,
  `BloodGroup` varchar(15) DEFAULT NULL,
  `GravidaStatus` int(11) DEFAULT NULL,
  `ParityStatus` int(11) DEFAULT NULL,
  `LastPregOutcome` varchar(30) DEFAULT NULL,
  `LMP` datetime DEFAULT NULL,
  `FoetalAge` varchar(30) DEFAULT NULL,
  `IsMCTSCardHolder` bit(1) DEFAULT NULL,
  `IsSmoking` bit(1) DEFAULT NULL,
  `IsAlcohol` bit(1) DEFAULT NULL,
  `IsChronicDiseaseHistory` bit(1) DEFAULT NULL,
  `ChronicDisease` varchar(300) DEFAULT NULL,
  `SystolicBP` int(11) DEFAULT NULL,
  `DiastolicBP` int(11) DEFAULT NULL,
  `BloodGlucose_Random` int(11) DEFAULT NULL,
  `Height_cm` decimal(5,2) DEFAULT NULL,
  `Weight_Kg` decimal(5,2) DEFAULT NULL,
  `PregnancyStatus` varchar(30) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `SyncedBy` varchar(45) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_TMANC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_tmrequest`
--

DROP TABLE IF EXISTS `fact_tmrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_tmrequest` (
  `Fact_TMRequestID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TMRequestID` bigint(20) DEFAULT NULL,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `BenVisitID` bigint(20) DEFAULT NULL,
  `VisitCode` bigint(20) DEFAULT NULL,
  `VisitNo` smallint(6) DEFAULT NULL,
  `SpecializationID` int(11) DEFAULT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `RequestDate` datetime DEFAULT NULL,
  `Duration_minute` int(11) DEFAULT NULL,
  `Status` char(4) DEFAULT NULL,
  `ConsultationStats` text,
  `BeneficiaryArrivalTime` datetime DEFAULT NULL,
  `Consultation_FirstStart` datetime DEFAULT NULL,
  `Consultation_LastEnd` datetime DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VanName` varchar(30) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT NULL,
  `Processed` char(4) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `fact_CreatedDate` bigint(20) DEFAULT NULL,
  `LoadedBy` varchar(50) NOT NULL,
  `LodadedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fact_TMRequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=131071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_report`
--

DROP TABLE IF EXISTS `m_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_report` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `ReportName` varchar(50) DEFAULT NULL,
  `SPName` varchar(50) DEFAULT NULL,
  `ServiceID` smallint(6) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replicationtest`
--

DROP TABLE IF EXISTS `replicationtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replicationtest` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `sanjeevani_dashboard`
--

DROP TABLE IF EXISTS `sanjeevani_dashboard`;
/*!50001 DROP VIEW IF EXISTS `sanjeevani_dashboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sanjeevani_dashboard` AS SELECT 
 1 AS `CurrDistrict`,
 1 AS `CreatedBy`,
 1 AS `VisitCode`,
 1 AS `servicePoint`,
 1 AS `ProviderServiceMapID`,
 1 AS `VisitCategory`,
 1 AS `visit_date`,
 1 AS `visit_time`,
 1 AS `visit_month`,
 1 AS `visit_year`,
 1 AS `beneficiary_id`,
 1 AS `ben_name`,
 1 AS `FirstName`,
 1 AS `father_name`,
 1 AS `spouse_name`,
 1 AS `ben_phone_no`,
 1 AS `New/Repeat_visit`,
 1 AS `registrationDate`,
 1 AS `ben_dob`,
 1 AS `age_part1`,
 1 AS `age_part2`,
 1 AS `ben_gender`,
 1 AS `maritalstatus`,
 1 AS `community`,
 1 AS `religion`,
 1 AS `incomestatus`,
 1 AS `Weight_Kg`,
 1 AS `Height_cm`,
 1 AS `BMI`,
 1 AS `WaistCircumference_cm`,
 1 AS `ANC/PNC`,
 1 AS `LMP_Date`,
 1 AS `EDD`,
 1 AS `GestationalAge`,
 1 AS `Temperature`,
 1 AS `PulseRate`,
 1 AS `SystolicBP_1stReading`,
 1 AS `DiastolicBP_1stReading`,
 1 AS `DiagnosisProvided1`,
 1 AS `DiagnosisProvided2`,
 1 AS `DiagnosisProvided3`,
 1 AS `DiagnosisProvided4`,
 1 AS `DiagnosisProvided5`,
 1 AS `ChiefComplaint`,
 1 AS `Reffred_To`,
 1 AS `Referred_For`,
 1 AS `VisitCode_Test`,
 1 AS `RBS_Test`,
 1 AS `Hemoglobin`,
 1 AS `Vision_Aquity_Test`,
 1 AS `HbA1c`,
 1 AS `Malaria`,
 1 AS `VisitCode_Screening`,
 1 AS `BeneficiaryRegID`,
 1 AS `Epilepsy_Screenings`,
 1 AS `Asthma_Screenings`,
 1 AS `Vision_Screenings`,
 1 AS `Tuberculosis_Screenings`,
 1 AS `Malaria_Screenings`,
 1 AS `Diabetes_Screenings`,
 1 AS `Epilepsy_suspected`,
 1 AS `Asthma_suspected`,
 1 AS `Vision_suspected`,
 1 AS `Tuberculosis_suspected`,
 1 AS `Malaria_suspected`,
 1 AS `Diabetes_suspected`,
 1 AS `Hypertension_suspected`,
 1 AS `Epilepsy_confirmed`,
 1 AS `Asthma_confirmed`,
 1 AS `Vision_confirmed`,
 1 AS `Tuberculosis_confirmed`,
 1 AS `Malaria_confirmed`,
 1 AS `Diabetes_confirmed`,
 1 AS `Hypertension_confirmed`,
 1 AS `VisitCode_Drug`,
 1 AS `Total_drug`,
 1 AS `drug_1`,
 1 AS `drug1_Qty`,
 1 AS `drug_2`,
 1 AS `drug2_Qty`,
 1 AS `drug_3`,
 1 AS `drug3_Qty`,
 1 AS `drug_4`,
 1 AS `drug4_Qty`,
 1 AS `drug_5`,
 1 AS `drug5_Qty`,
 1 AS `drug_6`,
 1 AS `drug6_Qty`,
 1 AS `drug_7`,
 1 AS `drug7_Qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scheduler_status`
--

DROP TABLE IF EXISTS `scheduler_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proc_name` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_itemstockentry`
--

DROP TABLE IF EXISTS `t_itemstockentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_itemstockentry` (
  `ItemStockEntryID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `BatchNo` varchar(45) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `QuantityInHand` int(11) DEFAULT NULL,
  `UnitCostPrice` decimal(10,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `EntryTypeID` int(11) NOT NULL,
  `EntryType` varchar(45) NOT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SyncFacilityID` int(11) DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ItemStockEntryID`),
  KEY `FK_ItemStockEntry_Facility_idx` (`FacilityID`),
  KEY `FK_ItemStockEntry_Item_idx` (`ItemID`),
  KEY `FK_ItemStockEntry_ProviderServiceMapping_idx` (`ProviderServiceMapID`),
  CONSTRAINT `FK_ItemStockEntry_Facility` FOREIGN KEY (`FacilityID`) REFERENCES `m_facility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ItemStockEntry_Item` FOREIGN KEY (`ItemID`) REFERENCES `m_item` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ItemStockEntry_ProviderServiceMapping` FOREIGN KEY (`ProviderServiceMapID`) REFERENCES `m_providerservicemapping` (`ProviderServiceMapID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6379 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'db_reporting'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Event_ECDReporting` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`piramaldev`@`%`*/ /*!50106 EVENT `Event_ECDReporting` ON SCHEDULE EVERY 24 HOUR STARTS '2023-12-31 04:01:00' ON COMPLETION PRESERVE ENABLE COMMENT 'Load_ECDReporting' DO begin
CALL db_reporting.Pr_UpdateECDReporting();
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `Event_TMSaveWorkList` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`piramaldev`@`%`*/ /*!50106 EVENT `Event_TMSaveWorkList` ON SCHEDULE EVERY 30 MINUTE STARTS '2021-02-23 11:15:10' ON COMPLETION NOT PRESERVE DISABLE DO begin
CALL db_iemr.Pr_TMSaveWorkList();

end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `Identity_Commonn` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`masteruser`@`%`*/ /*!50106 EVENT `Identity_Commonn` ON SCHEDULE EVERY 24 HOUR STARTS '2019-02-15 00:35:10' ON COMPLETION PRESERVE ENABLE COMMENT 'Load_Beneficiary' DO begin
CALL db_reporting.SP_Load_Dim_beneficiary();
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `IEMR_Commonn` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`masteruser`@`localhost`*/ /*!50106 EVENT `IEMR_Commonn` ON SCHEDULE EVERY 24 HOUR STARTS '2019-02-15 01:00:10' ON COMPLETION PRESERVE ENABLE COMMENT 'Load_IEMR_Transaction' DO begin
CALL db_reporting.SP_Load_Dim_User();
CALL db_reporting.SP_Load_Fact_104BenMedHistory();
CALL db_reporting.SP_Load_Fact_104prescription();
CALL db_reporting.SP_Load_Fact_1097CallSummary();
CALL db_reporting.SP_Load_Fact_BenCall();
CALL db_reporting.SP_Load_Fact_BloodRequest();
CALL db_reporting.SP_Load_Fact_ChildCongenitalAnomalies();
CALL db_reporting.SP_Load_Fact_ChildInValidRecord();
CALL db_reporting.SP_Load_Fact_ChildValidRecord();
CALL db_reporting.SP_Load_Fact_DirectoryService();
CALL db_reporting.SP_Load_Fact_EpidemicOutbreak();
CALL db_reporting.SP_Load_Fact_Feedback();
CALL db_reporting.SP_Load_Fact_FoodSafetyCopmlaint();
CALL db_reporting.SP_Load_Fact_MCTSCallResponse();
CALL db_reporting.SP_Load_Fact_MctsOutboundCall();
CALL db_reporting.SP_Load_Fact_MotherInValidRecord();
CALL db_reporting.SP_Load_Fact_MotherValidRecord();
CALL db_reporting.SP_Load_Fact_OrganDonation();
CALL db_reporting.SP_Load_Fact_SchemeService();
CALL db_reporting.SP_Load_Fact_104BenCDIResponse();

-- Added for Assam Sparsha Report Requirement
call db_reporting.SP_Load_Fact_BenVisitDetail();
CALL db_reporting.SP_Load_Fact_LabTestResult();
CALL db_reporting.SP_Load_Fact_PrescribedDrug();
CALL db_reporting.SP_Load_Fact_PhyVitals();
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `InventoryReport` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`masteruser`@`%`*/ /*!50106 EVENT `InventoryReport` ON SCHEDULE EVERY 24 HOUR STARTS '2019-02-15 01:30:10' ON COMPLETION PRESERVE ENABLE COMMENT 'Load_Inventory' DO begin
call db_reporting.temp_LoadInventoryReport();
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `TMReport` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `TMReport` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 02:00:00' ON COMPLETION NOT PRESERVE ENABLE DO call db_reporting.temp_LoadTMReport() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'db_reporting'
--
/*!50003 DROP PROCEDURE IF EXISTS `D_mmu_adolescent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_mmu_adolescent`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare totalPatient LONG;
declare totalAdolescents LONG;
declare newAdolescents LONG;
declare femaleAdolescents LONG;

SELECT Count(DISTINCT beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND beneficiary_visit_code is not null INTO totalPatient;

SELECT Count(DISTINCT beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND beneficiary_visit_code is not null AND ben_age_val BETWEEN 10 and 19 INTO totalAdolescents;

SELECT Count(DISTINCT beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND beneficiary_visit_code is not null AND ben_age_val BETWEEN 10 and 19 AND visit_no = 1 INTO newAdolescents;

SELECT Count(DISTINCT beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND beneficiary_visit_code is not null AND ben_age_val BETWEEN 10 and 19 AND ben_gender_val = 2 INTO femaleAdolescents;

SELECT totalPatient, totalAdolescents, newAdolescents, femaleAdolescents;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_AllDiabetic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_AllDiabetic`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_AllDiabetic int;
declare v_AllDiaRef int ;
declare v_AllDiaControl int;
declare v_AllDiaFemale int;

drop temporary table if exists AllDiabeticTemp;

create temporary table AllDiabeticTemp as

select 
distinct BCC.BeneficiaryRegID , 'OldDiabetic' OldDiabetic
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 2
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate)
    
union

select distinct A.BeneficiaryRegID , 'NewDiabetic' NewDiabetic
 from 
 
(select 
Rx.BeneficiaryRegID,
Rx.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
  on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
    and BVD.VisitCode = Rx.VisitCode
    and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
WHERE DATE(Rx.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND Rx.providerServiceMapID = PSMID
	AND Rx.Deleted = 0b0
    and Rx.DiagnosisProvided like '%Diabetes Mellitus%'

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
  on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
    and BVD.VisitCode = PNCD.VisitCode
    and (BVD.VisitCategory = 'PNC')
WHERE DATE(PNCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PNCD.providerServiceMapID = PSMID
	AND PNCD.Deleted = 0b0
    AND PNCD.ProvisionalDiagnosis like '%Diabetes Mellitus%' ) A
/* 
union

select 
ANCD.BeneficiaryRegID,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
  on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
    and BVD.VisitCode = ANCD.VisitCode
    and (BVD.VisitCategory = 'ANC')
 WHERE DATE(ANCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND ANCD.providerServiceMapID = PSMID
	AND ANCD.Deleted = 0b0
union

select 
NCDS.BeneficiaryRegID,
CASE
    WHEN NCDS.ScreeningCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN NCDS.ScreeningCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
  on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
    and BVD.VisitCode = NCDS.VisitCode
    and (BVD.VisitCategory = 'NCD screening')
WHERE DATE(NCDS.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND NCDS.providerServiceMapID = PSMID
	AND NCDS.Deleted = 0b0
*/
inner join db_iemr.t_prescribeddrug PD 
	on A.BeneficiaryRegID = PD.BeneficiaryRegID
    and A.VisitCode = PD.VisitCode
WHERE DATE(PD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PD.providerServiceMapID = PSMID
	AND PD.Deleted = 0b0
    AND PD.GenericDrugName in ("%%");


select count(distinct BeneficiaryRegID) from AllDiabeticTemp into v_AllDiabetic;

select count(distinct ADT.BeneficiaryRegID) from AllDiabeticTemp ADT
	inner join db_iemr.t_benreferdetails BRD on ADT.BeneficiaryRegID = BRD.BeneficiaryRegID
	into v_AllDiaRef; 
    
select count(distinct ADT.BeneficiaryRegID) from AllDiabeticTemp ADT
	inner join db_iemr.t_Lab_TestResult LTR on ADT.BeneficiaryRegID = LTR.BeneficiaryRegID
    where (LTR.TestResultValue < 160 and LTR.ProcedureID = "% %") 
		and  (LTR.TestResultValue < 7 and LTR.ProcedureID = "% %")
	into v_AllDiaControl; 
    
select count(distinct ADT.BeneficiaryRegID) from AllDiabeticTemp ADT
	inner join db_identity.i_beneficiarymapping BM on ADT.BeneficiaryRegID = BM.BenRegID
    inner join db_identity.i_beneficiarydetails BD on BM.BenDetailsID = BD.BeneficiaryDetailsID
    where BD.GenderID = 2
	into v_AllDiaFemale; 
    
select  v_AllDiabetic,v_AllDiaRef,v_AllDiaControl,v_AllDiaFemale;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_AllDiaHTN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_AllDiaHTN`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_AllDiaHTN int;

drop temporary table if exists AllDiaHTNTemp;

create temporary table AllDiaHTNTemp as

select 
distinct BCC.BeneficiaryRegID , 'OldDiaHTN' OldDiaHTN
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 2
	and BCC.ComorbidConditionID = 3
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate)
    
union

select distinct A.BeneficiaryRegID , 'NewDiaHTN' NewDiaHTN
 from 
 
(select 
Rx.BeneficiaryRegID,
Rx.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
  on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
    and BVD.VisitCode = Rx.VisitCode
    and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
WHERE DATE(Rx.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND Rx.providerServiceMapID = PSMID
	AND Rx.Deleted = 0b0
    and Rx.DiagnosisProvided like '%Diabetes Mellitus%'
    and Rx.DiagnosisProvided like '%Hypertension%'

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
  on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
    and BVD.VisitCode = PNCD.VisitCode
    and (BVD.VisitCategory = 'PNC')
WHERE DATE(PNCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PNCD.providerServiceMapID = PSMID
	AND PNCD.Deleted = 0b0
    AND PNCD.ProvisionalDiagnosis like '%Diabetes Mellitus%'
    AND PNCD.ProvisionalDiagnosis like '%Hypertension%') A
/* 
union

select 
ANCD.BeneficiaryRegID,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
  on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
    and BVD.VisitCode = ANCD.VisitCode
    and (BVD.VisitCategory = 'ANC')
 WHERE DATE(ANCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND ANCD.providerServiceMapID = PSMID
	AND ANCD.Deleted = 0b0
union

select 
NCDS.BeneficiaryRegID,
CASE
    WHEN NCDS.ScreeningCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN NCDS.ScreeningCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
  on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
    and BVD.VisitCode = NCDS.VisitCode
    and (BVD.VisitCategory = 'NCD screening')
WHERE DATE(NCDS.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND NCDS.providerServiceMapID = PSMID
	AND NCDS.Deleted = 0b0
*/
inner join db_iemr.t_prescribeddrug PD 
	on A.BeneficiaryRegID = PD.BeneficiaryRegID
    and A.VisitCode = PD.VisitCode
WHERE DATE(PD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PD.providerServiceMapID = PSMID
	AND PD.Deleted = 0b0
    AND PD.GenericDrugName in ("%%")
    AND PD.GenericDrugName in ("%%");


select count(distinct BeneficiaryRegID) from AllDiaHTNTemp into v_AllDIaHTN;

    
select  v_AllDiaHTN;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_AllDiaTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_AllDiaTest`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

Declare v_AllRBS int;
Declare v_AllHbA1C int;
declare v_AllUrineSugar int;

select 
count(distinct BeneficiaryRegID) into v_AllRBS
 from t_lab_testresult LTR
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where DATE(LTR.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND LTR.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%";
    
select 
count(distinct BeneficiaryRegID) into v_AllHbA1C
 from t_lab_testresult LTR
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where DATE(LTR.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND LTR.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%";
    
    
select 
count(distinct BeneficiaryRegID) into v_AllUrineSugar
 from t_lab_testresult LTR
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where DATE(LTR.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND LTR.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%";
    
select v_AllRBS, v_AllHbA1C, v_AllUrineSugar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_AllHTN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_AllHTN`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_AllHTN int;
declare v_AllHTNRef int ;
declare v_AllNTNControl int;
declare v_AllHTNFemale int;

drop temporary table if exists AllHTNTemp;

create temporary table AllHTNTemp as

select 
distinct BCC.BeneficiaryRegID , 'OldHTN' OldHTN
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 3
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate)
    
union

select distinct A.BeneficiaryRegID , 'NewHTN' NewHTN
 from 
 
(select 
Rx.BeneficiaryRegID,
Rx.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
  on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
    and BVD.VisitCode = Rx.VisitCode
    and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
WHERE DATE(Rx.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND Rx.providerServiceMapID = PSMID
	AND Rx.Deleted = 0b0
    and Rx.DiagnosisProvided like '%Hypertension%'

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
  on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
    and BVD.VisitCode = PNCD.VisitCode
    and (BVD.VisitCategory = 'PNC')
WHERE DATE(PNCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PNCD.providerServiceMapID = PSMID
	AND PNCD.Deleted = 0b0
    AND PNCD.ProvisionalDiagnosis like '%Hypertension%' ) A
/* 
union

select 
ANCD.BeneficiaryRegID,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
  on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
    and BVD.VisitCode = ANCD.VisitCode
    and (BVD.VisitCategory = 'ANC')
 WHERE DATE(ANCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND ANCD.providerServiceMapID = PSMID
	AND ANCD.Deleted = 0b0
union

select 
NCDS.BeneficiaryRegID,
CASE
    WHEN NCDS.ScreeningCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN NCDS.ScreeningCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
  on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
    and BVD.VisitCode = NCDS.VisitCode
    and (BVD.VisitCategory = 'NCD screening')
WHERE DATE(NCDS.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND NCDS.providerServiceMapID = PSMID
	AND NCDS.Deleted = 0b0
*/
inner join db_iemr.t_prescribeddrug PD 
	on A.BeneficiaryRegID = PD.BeneficiaryRegID
    and A.VisitCode = PD.VisitCode
WHERE DATE(PD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PD.providerServiceMapID = PSMID
	AND PD.Deleted = 0b0
    AND PD.GenericDrugName in ("%%");


select count(distinct BeneficiaryRegID) from AllHTNTemp into v_AllHTN;

select count(distinct AHT.BeneficiaryRegID) from AllHTNTemp AHT
	inner join db_iemr.t_benreferdetails BRD on AHT.BeneficiaryRegID = BRD.BeneficiaryRegID
	into v_AllHTNRef; 
    
/*  
select count(distinct BeneficiaryRegID) from AllDiabeticTemp ADT
	inner join db_iemr.t_Lab_TestResult LTR on ADT.BefeficiaryRegID = LTR.BeneficiaryRegID
    where (LTR.ResultValue < 160 and LTR.ProcedureID = "% %") 
		and  (LTR.ResultValue < 7 and LTR.ProcedureID = "% %")
	into v_AllDiaControl; 
*/    

select count(distinct AHT.BeneficiaryRegID) from AllHTNTemp AHT
	inner join db_identity.i_beneficiarymapping BM on AHT.BeneficiaryRegID = BM.BenRegID
    inner join db_identity.i_beneficiarydetails BD on BM.BenDetailsID = BD.BeneficiaryDetailsID
    where BD.GenderID = 2
	into v_AllHTNFemale; 
    
select v_AllHTN,v_AllHTNRef,v_AllHTNFemale;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_mmu_anc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_mmu_anc`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN
declare totalANC LONG;
declare newANC LONG;
declare oldANC LONG;
declare trimester1 LONG;
declare trimester2 LONG;
declare trimester3 LONG;
declare highRiskANC LONG;
declare ancReferHigerLevel LONG;

SELECT COUNT(Distinct t.BeneficiaryRegID) FROM t_benvisitdetail t WHERE DATE(t.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND t.VisitCategory = 'ANC' into totalANC;
 
 SELECT COUNT(Distinct t.BeneficiaryRegID) FROM t_benvisitdetail t WHERE DATE(t.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND t.VisitCategory = 'ANC' AND t.VisitNo = 1 into newANC;
 
 SELECT COUNT(Distinct t.BeneficiaryRegID) FROM t_benvisitdetail t WHERE DATE(t.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND t.VisitCategory = 'ANC' AND t.VisitNo > 1 into oldANC;
 
 SELECT COUNT(Distinct BeneficiaryRegID) FROM t_anccare  WHERE DATE(CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND TrimesterNumber = 1 into trimester1;
 
SELECT COUNT(Distinct BeneficiaryRegID) FROM t_anccare t WHERE DATE(CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND TrimesterNumber = 2 into trimester2;
 
SELECT COUNT(Distinct BeneficiaryRegID) FROM t_anccare t WHERE DATE(CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND TrimesterNumber = 3 into trimester3;
 
 SELECT COUNT(Distinct TBVD.BeneficiaryRegID) 
 FROM t_benvisitdetail TBVD INNER JOIN t_ancdiagnosis TAD ON TBVD.BeneficiaryRegID = TAD.BeneficiaryRegID
  AND TBVD.VisitCode = TAD.VisitCode AND DATE(TBVD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
  AND TBVD.providerServiceMapID = PSMID AND length(TAD.ComplicationOfCurrentPregnancy) > 1 AND TAD.ComplicationOfCurrentPregnancy != 'None'
  INTO highRiskANC;
  
SELECT COUNT(Distinct TBR.BeneficiaryRegID)
  FROM t_benvisitdetail TBVD INNER JOIN t_benreferdetails TBR ON TBVD.BeneficiaryRegID = TBR.BeneficiaryRegID
  AND TBVD.VisitCode = TBR.VisitCode AND DATE(TBVD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate)  
  AND TBVD.providerServiceMapID = PSMID AND TBVD.VisitCategory = 'ANC' AND TBR.referredToInstituteID is not null INTO ancReferHigerLevel;


SELECT totalANC, newANC, oldANC, trimester1, trimester2, trimester3, highRiskANC, ancReferHigerLevel;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_mmu_below_5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_mmu_below_5`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN
declare totalPatient LONG;
declare totalBelow5 LONG;
declare newBelow5 LONG;
declare oldBelow5 LONG;
declare femaleBelow5 LONG;
declare referredBelow5 LONG;

SELECT Count(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND ben_age_val <= 5 AND providerServiceMapID = PSMID AND beneficiary_visit_code is not null INTO totalBelow5;

SELECT Count(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND ben_age_val <= 5 AND providerServiceMapID = PSMID AND visit_no = 1 AND beneficiary_visit_code is not null INTO newBelow5;

SELECT Count(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND ben_age_val <= 5 AND providerServiceMapID = PSMID AND visit_no > 1 AND beneficiary_visit_code is not null INTO oldBelow5;

SELECT Count(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND ben_age_val <= 5 AND providerServiceMapID = PSMID AND ben_gender_val = 2 AND beneficiary_visit_code is not null INTO femaleBelow5;
 
SELECT COUNT(Distinct TBR.BeneficiaryRegID)
  FROM i_ben_flow_outreach IBFO INNER JOIN t_benreferdetails TBR ON IBFO.beneficiary_reg_id = TBR.BeneficiaryRegID
  AND IBFO.beneficiary_visit_code = TBR.VisitCode AND DATE(IBFO.visitDate) BETWEEN DATE(fromDate) AND DATE(toDate)  
  AND IBFO.providerServiceMapID = PSMID AND IBFO.ben_age_val <= 5 AND TBR.referredToInstituteID is not null INTO referredBelow5;
  
SELECT Count(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND beneficiary_visit_code is not null INTO totalPatient;

SELECT totalBelow5, newBelow5, oldBelow5, femaleBelow5, referredBelow5, totalPatient;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_mmu_common` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_mmu_common`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN
declare totalPatient LONG; 
declare newPatient LONG; 
declare oldPatient LONG; 
declare femalePatient LONG;

SELECT COUNT(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID INTO totalPatient;

SELECT COUNT(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND visit_no = 1 INTO newPatient;

 SELECT COUNT(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND visit_no > 1 INTO oldPatient;

 SELECT COUNT(Distinct beneficiary_reg_id) FROM i_ben_flow_outreach WHERE DATE(visitDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND ben_gender_val = 2 INTO femalePatient;
 
 select totalPatient, newPatient, oldPatient,  femalePatient ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_NewDiabetic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_NewDiabetic`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_NewDiabetic int;

select count(distinct BeneficiaryRegID) into v_NewDiabetic
 from 
(select 
Rx.BeneficiaryRegID,
Rx.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
  on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
    and BVD.VisitCode = Rx.VisitCode
    and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
WHERE DATE(Rx.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND Rx.providerServiceMapID = PSMID
	AND Rx.Deleted = 0b0
    and Rx.DiagnosisProvided like '%Diabetes Mellitus%'

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
  on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
    and BVD.VisitCode = PNCD.VisitCode
    and (BVD.VisitCategory = 'PNC')
WHERE DATE(PNCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PNCD.providerServiceMapID = PSMID
	AND PNCD.Deleted = 0b0
    AND PNCD.ProvisionalDiagnosis like '%Diabetes Mellitus%' ) A
/* 
union

select 
ANCD.BeneficiaryRegID,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
  on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
    and BVD.VisitCode = ANCD.VisitCode
    and (BVD.VisitCategory = 'ANC')
 WHERE DATE(ANCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND ANCD.providerServiceMapID = PSMID
	AND ANCD.Deleted = 0b0
union

select 
NCDS.BeneficiaryRegID,
CASE
    WHEN NCDS.ScreeningCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN NCDS.ScreeningCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
  on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
    and BVD.VisitCode = NCDS.VisitCode
    and (BVD.VisitCategory = 'NCD screening')
WHERE DATE(NCDS.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND NCDS.providerServiceMapID = PSMID
	AND NCDS.Deleted = 0b0
*/
inner join db_iemr.t_prescribeddrug PD 
	on A.BeneficiaryRegID = PD.BenefciaryRegID
    and A.VisitCode = PD.VisitCode
WHERE DATE(PD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PD.providerServiceMapID = PSMID
	AND PD.Deleted = 0b0
    AND PD.GenericDrugName in ("%%");

select v_NewDiabetic;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_NewDiaDetected` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_NewDiaDetected`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_NewDiaDetected int;
declare v_NewDiaTreatment int;

drop temporary table if exists NewDiaDetected;

create temporary table NewDiaDetected as

select *  from(
select distinct LTR.BeneficiaryRegID,LTR.ProcedureID,LTR.TestResultValue
,LTR.prescriptionid,
case when PR.procedureName= '' and LTR.TestResultValue <160 then 1 else 0 end as RBSValue, /*need to change procedureName values*/
case when PR.procedureName= ''and LTR.TestResultValue <7 then 1 else 0 end as HbA1CValue, /*need to change procedureName values*/
case when PR.procedureName= '' and LTR.TestResultValue <180 then 1 else 0 end as USTValue  /*need to change procedureName values*/
 from
 
(select 
Rx.BeneficiaryRegID,
Rx.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
  on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
    and BVD.VisitCode = Rx.VisitCode
    and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
WHERE DATE(Rx.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND Rx.providerServiceMapID = PSMID
  AND Rx.Deleted = 0b0
    and Rx.DiagnosisProvided like '%Diabetes Mellitus%'

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
  on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
    and BVD.VisitCode = PNCD.VisitCode
    and (BVD.VisitCategory = 'PNC')
WHERE DATE(PNCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PNCD.providerServiceMapID = PSMID
  AND PNCD.Deleted = 0b0
    AND PNCD.ProvisionalDiagnosis like '%Diabetes Mellitus%' ) X
/* 
inner join db_iemr.t_prescribeddrug PD 
  on A.BeneficiaryRegID = PD.BenefciaryRegID
    and A.VisitCode = PD.VisitCode
WHERE DATE(PD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PD.providerServiceMapID = PSMID
  AND PD.Deleted = 0b0
    AND PD.GenericDrugName in ("%%") )X */
  inner join  t_lab_testresult LTR on LTR.BeneficiaryRegID=X.BeneficiaryRegID
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where DATE(LTR.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND LTR.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%" having ((RBSValue=1) or (HbA1CValue=1) or (USTValue=1))) Y  /*need to provide procedureid values*/
    ;

select count(distinct BeneficiaryRegID) from NewDiaDetected into v_NewDiaDetected;

select count(distinct T.BeneficiaryRegID) from NewDiaDetected  T
inner join t_prescribeddrug PD on PD.PrescriptionID=T.prescriptionid
where PD.GenericDrugName in('') into v_NewDiaTreatment; /*Need to provide drugName*/

select v_NewDiaDetected, v_NewDiaTreatment;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_NewHTN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_NewHTN`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_NewHTN int;
    
select count(distinct BeneficiaryRegID) into v_NewHTN
 from 
(select 
Rx.BeneficiaryRegID,
Rx.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
  on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
    and BVD.VisitCode = Rx.VisitCode
    and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
WHERE DATE(Rx.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND Rx.providerServiceMapID = PSMID
	AND Rx.Deleted = 0b0
    and Rx.DiagnosisProvided like '%Hypertension%'

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
  on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
    and BVD.VisitCode = PNCD.VisitCode
    and (BVD.VisitCategory = 'PNC')
WHERE DATE(PNCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PNCD.providerServiceMapID = PSMID
	AND PNCD.Deleted = 0b0
    AND PNCD.ProvisionalDiagnosis like '%Hypertension%' ) A
/* 
union

select 
ANCD.BeneficiaryRegID,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
  on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
    and BVD.VisitCode = ANCD.VisitCode
    and (BVD.VisitCategory = 'ANC')
 WHERE DATE(ANCD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND ANCD.providerServiceMapID = PSMID
	AND ANCD.Deleted = 0b0
union

select 
NCDS.BeneficiaryRegID,
CASE
    WHEN NCDS.ScreeningCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN NCDS.ScreeningCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
  on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
    and BVD.VisitCode = NCDS.VisitCode
    and (BVD.VisitCategory = 'NCD screening')
WHERE DATE(NCDS.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND NCDS.providerServiceMapID = PSMID
	AND NCDS.Deleted = 0b0
*/
inner join db_iemr.t_prescribeddrug PD 
	on A.BeneficiaryRegID = PD.BenefciaryRegID
    and A.VisitCode = PD.VisitCode
WHERE DATE(PD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND PD.providerServiceMapID = PSMID
	AND PD.Deleted = 0b0
    AND PD.GenericDrugName in ("%%");

select v_NewHTN;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_OldDiabetic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_OldDiabetic`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_OldDiabetic int;

select 
count(distinct BCC.BeneficiaryRegID) into v_OldDiabetic
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 2
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate);

select v_OldDiabetic;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_OldDiaFollowUp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_OldDiaFollowUp`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_OldDiaFollowUp int;

select 
count(distinct BCC.BeneficiaryRegID) into v_OldDiaFollowUp
from db_iemr.t_BenVisitDetail BVD 
inner join  db_iemr.t_bencomorbiditycondition BCC on BVD.BeneficiaryRegID = BCC.BeneficiaryRegID
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 2
	and DATE(BVD.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate)
    AND VisitReason = "Follow Up";

select v_OldDiaFollowUp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_OldDiaTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_OldDiaTest`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN


Declare v_OldRBS int;
Declare v_OldHbA1C int;
declare v_OldUrineSugar int;

select 
count(distinct BCC.BeneficiaryRegID) into v_OldRBS
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
join db_iemr.t_lab_testresult LTR on BCC.BeneficiaryRegID = LTR.BeneficiaryRegID 	
	and BCC.VisitCode = LTR.VisitCode
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where BCC.ComorbidConditionID = 2
	and BCC.Year < BM.CreatedDate 
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%";
    
select 
count(distinct BCC.BeneficiaryRegID) into v_OldHbA1C
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
join db_iemr.t_lab_testresult LTR on BCC.BeneficiaryRegID = LTR.BeneficiaryRegID 	
	and BCC.VisitCode = LTR.VisitCode
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where BCC.ComorbidConditionID = 2
	and BCC.Year < BM.CreatedDate 
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%";
    
select 
count(distinct BCC.BeneficiaryRegID) into v_OldUrineSugar
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
join db_iemr.t_lab_testresult LTR on BCC.BeneficiaryRegID = LTR.BeneficiaryRegID 	
	and BCC.VisitCode = LTR.VisitCode
inner join m_procedure PR on LTR.ProcedureID = PR.ProcedureID
where BCC.ComorbidConditionID = 2
	and BCC.Year < BM.CreatedDate 
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    AND PR.ProcedureName like "%%";
    
select v_OldRBS, v_OldHbA1C , v_OldUrineSugar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_OldHTN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_OldHTN`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_OldHTN int;

select 
count(distinct BCC.BeneficiaryRegID) into v_OldHTN
from db_iemr.t_bencomorbiditycondition BCC
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 3
	and DATE(BCC.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate);

select v_OldHTN;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_MMU_OldHTNFollowUp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_MMU_OldHTNFollowUp`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN

declare v_OldHTNFollowUp int;

select 
count(distinct BCC.BeneficiaryRegID) into v_OldHTNFollowUp
from db_iemr.t_BenVisitDetail BVD 
inner join  db_iemr.t_bencomorbiditycondition BCC on BVD.BeneficiaryRegID = BCC.BeneficiaryRegID
join db_identity.i_beneficiarymapping BM on BCC.BeneficiaryRegID = BM.BenRegID
where BCC.ComorbidConditionID = 3
	and DATE(BVD.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
    AND BCC.providerServiceMapID = PSMID
    and date(BCC.Year) < date(BM.CreatedDate)
    AND VisitReason = "Follow Up";

select v_OldHTNFollowUp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_mmu_pnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `D_mmu_pnc`(IN fromDate DATETIME, IN toDate DATETIME, IN PSMID int)
BEGIN
declare totalPNC LONG;
declare newPNC LONG;
declare oldPNC LONG;
declare pncReferTohigerLevel LONG;

SELECT COUNT(Distinct t.BeneficiaryRegID) FROM t_benvisitdetail t WHERE DATE(t.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND t.VisitCategory = 'PNC' into totalPNC;
 
 SELECT COUNT(Distinct t.BeneficiaryRegID) FROM t_benvisitdetail t WHERE DATE(t.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND t.VisitCategory = 'PNC' AND t.VisitNo = 1 into newPNC;
 
 SELECT COUNT(Distinct t.BeneficiaryRegID) FROM t_benvisitdetail t WHERE DATE(t.CreatedDate)  BETWEEN DATE(fromDate) AND DATE(toDate) 
 AND providerServiceMapID = PSMID AND t.VisitCategory = 'PNC' AND t.VisitNo > 1 into oldPNC;
 
 SELECT COUNT(Distinct TBR.BeneficiaryRegID)
  FROM t_benvisitdetail TBVD INNER JOIN t_benreferdetails TBR ON TBVD.BeneficiaryRegID = TBR.BeneficiaryRegID
  AND TBVD.VisitCode = TBR.VisitCode AND DATE(TBVD.CreatedDate) BETWEEN DATE(fromDate) AND DATE(toDate)  
  AND TBVD.providerServiceMapID = PSMID AND TBVD.VisitCategory = 'PNC' AND TBR.referredToInstituteID is not null INTO pncReferTohigerLevel;
  
  SELECT totalPNC, newPNC, oldPNC, pncReferTohigerLevel;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getANCRecIFATab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `getANCRecIFATab`(fromDate DATETIME, toDate DATETIME, PSMID int)
BEGIN
SELECT COUNT(DISTINCT PI.BeneficiaryRegID)
FROM t_benvisitdetail BVD
INNER JOIN t_patientissue PI ON BVD.BeneficiaryRegID = PI.BeneficiaryRegID AND BVD.VisitCode = PI.VisitCode AND BVD.VisitCategory = 'ANC' AND BVD.ProviderServiceMapID = PSMID
INNER JOIN t_itemstockexit ISEX ON PI.PatientIssueID = ISEX.ExitTypeID AND ISEX.ExitType = 'T_PatientIssue'
INNER JOIN t_itemstockentry ISEN ON ISEX.ItemStockEntryID = ISEN.ItemStockEntryID
INNER JOIN m_item MI on ISEN.ItemID = MI.ItemID AND MI.ItemName IN ('IFA', 'iron folic acid');

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getANCRefCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `getANCRefCount`(fromDate DATETIME, toDate DATETIME, PSMID int)
BEGIN
SELECT count(distinct BRD.BeneficiaryRegID) FROM t_benvisitdetail BVD
INNER JOIN t_benreferdetails BRD ON BVD.BeneficiaryRegID = BRD.BeneficiaryRegID AND BVD.VisitCode = BRD.VisitCode
WHERE BVD.VisitCategory = 'ANC' AND date(BRD.LastModDate) between date(fromDate) and date(toDate) and BVD.ProviderServiceMapID = PSMID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PopulateDateDimension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`` PROCEDURE `PopulateDateDimension`(BeginDate DATETIME, EndDate DATETIME)
BEGIN

 # =============================================
 # Description: http://arcanecode.com/2009/11/18/populating-a-kimball-date-dimension/
 # =============================================

 # A few notes, this code does nothing to the existing table, no deletes
 # are triggered before hand. Because the DateKey is uniquely indexed,
 # it will simply produce errors if you attempt to insert duplicates.
 # You can however adjust the Begin/End dates and rerun to safely add
 # new dates to the table every year.
 #
 # If the begin date is after the end date, no errors occur but nothing
 # happens as the while loop never executes.

 # Holds a flag so we can determine if the date is the last day of month
 DECLARE LastDayOfMon CHAR(1);

 # Number of months to add to the date to get the current Fiscal date
 DECLARE FiscalYearMonthsOffset INT;

 # These two counters are used in our loop.
 DECLARE DateCounter DATETIME;    #Current date in loop
 DECLARE FiscalCounter DATETIME;  #Fiscal Year Date in loop

 # Set this to the number of months to add to the current date to get
 # the beginning of the Fiscal year. For example, if the Fiscal year
 # begins July 1, put a 6 there.
 # Negative values are also allowed, thus if your 2010 Fiscal year
 # begins in July of 2009, put a -6.
 SET FiscalYearMonthsOffset = 6;

 # Start the counter at the begin date
 SET DateCounter = BeginDate;

 WHILE DateCounter <= EndDate DO
            # Calculate the current Fiscal date as an offset of
            # the current date in the loop

            SET FiscalCounter = DATE_ADD(DateCounter, INTERVAL FiscalYearMonthsOffset MONTH);

            # Set value for IsLastDayOfMonth
            IF MONTH(DateCounter) = MONTH(DATE_ADD(DateCounter, INTERVAL 1 DAY)) THEN
               SET LastDayOfMon = 'N';
            ELSE
               SET LastDayOfMon = 'Y';
   END IF;

            # add a record into the date dimension table for this date
            INSERT  INTO dim_date
       (date_key
       ,full_date
       ,date_name
       ,date_name_us
       ,date_name_eu
       ,day_of_week
       ,day_name_of_week
       ,day_of_month
       ,day_of_year
       ,weekday_weekend
       ,week_of_year
       ,month_name
       ,month_of_year
       ,is_last_day_of_month
       ,calendar_quarter
       ,calendar_year
       ,calendar_year_month
       ,calendar_year_qtr
       ,fiscal_month_of_year
       ,fiscal_quarter
       ,fiscal_year
       ,fiscal_year_month
       ,fiscal_year_qtr)
            VALUES  (
                      ( YEAR(DateCounter) * 10000 ) + ( MONTH(DateCounter)
                                                         * 100 )
                      + DAY(DateCounter)  #DateKey
                    , DateCounter # FullDate
                    , CONCAT(CAST(YEAR(DateCounter) AS CHAR(4)),'/',DATE_FORMAT(DateCounter,'%m'),'/',DATE_FORMAT(DateCounter,'%d')) #DateName
                    , CONCAT(DATE_FORMAT(DateCounter,'%m'),'/',DATE_FORMAT(DateCounter,'%d'),'/',CAST(YEAR(DateCounter) AS CHAR(4)))#DateNameUS
                    , CONCAT(DATE_FORMAT(DateCounter,'%d'),'/',DATE_FORMAT(DateCounter,'%m'),'/',CAST(YEAR(DateCounter) AS CHAR(4)))#DateNameEU
                    , DAYOFWEEK(DateCounter) #DayOfWeek
                    , DAYNAME(DateCounter) #DayNameOfWeek
                    , DAYOFMONTH(DateCounter) #DayOfMonth
                    , DAYOFYEAR(DateCounter) #DayOfYear
                    , CASE DAYNAME(DateCounter)
                        WHEN 'Saturday' THEN 'Weekend'
                        WHEN 'Sunday' THEN 'Weekend'
                        ELSE 'Weekday'
                      END #WeekdayWeekend
                    , WEEKOFYEAR(DateCounter) #WeekOfYear
                    , MONTHNAME(DateCounter) #MonthName
                    , MONTH(DateCounter) #MonthOfYear
                    , LastDayOfMon #IsLastDayOfMonth
                    , QUARTER(DateCounter) #CalendarQuarter
                    , YEAR(DateCounter) #CalendarYear
                    , CONCAT(CAST(YEAR(DateCounter) AS CHAR(4)),'-',DATE_FORMAT(DateCounter,'%m')) #CalendarYearMonth
                    , CONCAT(CAST(YEAR(DateCounter) AS CHAR(4)),'Q',QUARTER(DateCounter)) #CalendarYearQtr
                    , MONTH(FiscalCounter) #[FiscalMonthOfYear]
                    , QUARTER(FiscalCounter) #[FiscalQuarter]
                    , YEAR(FiscalCounter) #[FiscalYear]
                    , CONCAT(CAST(YEAR(FiscalCounter) AS CHAR(4)),'-',DATE_FORMAT(FiscalCounter,'%m')) #[FiscalYearMonth]
                    , CONCAT(CAST(YEAR(FiscalCounter) AS CHAR(4)),'Q',QUARTER(FiscalCounter)) #[FiscalYearQtr]
                    );

            # Increment the date counter for next pass thru the loop
            SET DateCounter = DATE_ADD(DateCounter, INTERVAL 1 DAY);
      END WHILE;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104BeneficiaryReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104BeneficiaryReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
select b.beneficiaryID "Beneficiary ID", b.title "Title", 
 b.firstName "First Name",b.MiddleName "Middle Name", b.lastName "Last Name",
  b.dob "Dob",
 b.gender "Gender",b.community "Community",
 b.education "Education",b.fathername "Father Name",
 b.maritalStatus "Marital Status",b.healthCareWorker "Health Care Worker", 
 b.PreferredPhoneNum "Phone Number",
 b.PhoneNum1 "Phone Num1",
  b.PhoneNum2 "Phone Num2",
   b.PhoneNum3 "Phone Num3",
      b.PhoneNum4 "Phone Num4",
 -- b.spouseName "spouseName",
 b.emergencyRegistration "Emergency Registration", 
 b.PreferredPhoneNum "Preferred Phone Num",
 b.permDistrict "Perm District",
  b.permSubDistrict "Perm Sub District",
   b.permVillage "Perm Village",
   c.callTypeName "Call Type",
    c.callSubTypeName "Call Sub Type", 
    c.callReceivedUserID "Call Received User ID",
    c.callEndUserID "Call End User ID",
     b.createdDate "Date",
--	b.occupation,  b.emailId,

            c.ReceivedAgentID "Agent ID", user.firstName "Agent Name"
			from fact_bencall c
			LEFT JOIN dim_beneficiary b on c.beneficiaryRegID=b.beneficiaryRegID
			left join dim_user user on  c.CallReceivedUserID=user.UserID
			where c.providerServiceMapID=ifnull(v_psmid,c.providerServiceMapID) and 
            c.isCalledEarlier is false and c.beneficiaryRegID IS NOT NULL
             and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			and b.createdDate >=v_starttime and b.createdDate <=v_endtime
             and c.isoutbound is false
            group by b.beneficiaryID order by b.beneficiaryID desc;
            
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104BoodRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104BoodRequest`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct
b.BeneficiaryID "Beneficiary ID",t.bloodGroupName "Blood Group Name", 
t.componentTypeName "Component Type Name", t.unitRequired  "Unit Required",
t.TypeOfRequest "Type Of Request",
t.bloodReqID "Blood Req ID", 
t.BBPersonName "Blood Bank Person Name", 
t.BBPersonDesignation "Blood Bank Person Designation",
t.bloodBankAddress "Blood Bank Address", 
t.BBMobileNo "Blood Bank Mobile No",
t.outboundDate "Outbound Call Date", 
t.outboundNeeded "Outbound Needed", 
t.hospitalAdmitted "Hospital Admitted", 
 t.DistrictName "Hospital District Name", 
  t.createdDate "Date", 
   t.remarks "Remarks",
   t.feedback "Feedback", 
 t.requestID  "Request ID",
 b.firstName "First Name", b.lastName "Last Name",b.dob "Date Of Birth",
 b.gender "Gender",b.healthCareWorker "Health Care Worker", t.isSelf  "Is Self",
 c.phoneNo "Phone Number",t.recipientAge "Recipient Age",t.recipientName "Recipient Name",
 t.RecipientBeneficiaryID "Recipient Beneficiary ID",
 t.recipientGenderName "Recipient Gender Name",b.permDistrict "District",
 b.permSubDistrict "Sub District", b.permVillage  "Village",
t.benCallID "Ben Call ID",
c.callTypeName "Call Type", c.callSubTypeName "Call Sub Type", 
c.callReceivedUserID "Call Received User ID",c.callEndUserID "Call End User ID",
t.OutboundDate "Outbound Date", 
c.ReceivedAgentID "Agent ID", user.firstName "Agent Name"
 --	 t.componentName
         
             
			  
            
			from db_reporting.fact_bloodrequest t
			 LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			 order by t.createdDate desc; 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104BoodRequestDetails_Componentwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104BoodRequestDetails_Componentwise`(v_starttime datetime,v_endtime datetime,
v_districtid int(11),v_talukid int(11),v_villageid int(11),v_psmid int(11))
begin

select bg.ComponentType "Component Type",
ifnull(t.count,0)count  from db_iemr.m_componenttype bg left join (
select  t.componenttypeid,
t.componenttypename "Component Type", 
-- t.componentTypeName "Component Type Name", 
count(1) count

		from db_reporting.fact_bloodrequest t
			 inner JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
         --   LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and b.PermDistrictId=ifnull(v_districtid,b.PermDistrictId)
               and b.PermSubDistrictId=ifnull(v_talukid,b.PermSubDistrictId)
               and b.PermVillageId=ifnull(v_villageid,b.PermVillageId)
           --   and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
      
			 group by t.componenttypeid,t.componenttypename)t on t.componenttypeid=bg.componenttypeid
             where bg.deleted is false
              and    bg.ComponentType in('Red Blood Cells','White Blood Cells') 
       union
       
select 'Others' ,
sum(ifnull(t.count,0)) count  from db_iemr.m_componenttype bg left join (
select  t.componenttypeid,
t.componenttypename , 
-- t.componentTypeName "Component Type Name", 
count(1) count

		from db_reporting.fact_bloodrequest t
			 inner JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
         --   LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where 
             componenttypename not in('Red Blood Cells','White Blood Cells') and
             t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and b.PermDistrictId=ifnull(v_districtid,b.PermDistrictId)
               and b.PermSubDistrictId=ifnull(v_talukid,b.PermSubDistrictId)
               and b.PermVillageId=ifnull(v_villageid,b.PermVillageId)
           --   and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
      
			 group by t.componenttypeid,t.componenttypename)t on t.componenttypeid=bg.componenttypeid
             where bg.deleted is false
              and    bg.ComponentType not in('Red Blood Cells','White Blood Cells') ;
         
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104BoodRequestDetails_Componentwise_Pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104BoodRequestDetails_Componentwise_Pivot`(v_starttime datetime,v_endtime datetime,
v_districtid int(11),v_talukid int(11),v_villageid int(11),v_psmid int(11))
begin

declare v_stateid int(11);
select stateid into v_stateid from db_iemr.m_providerservicemapping 
where providerservicemapid=v_psmid;

create temporary table temp_report(
Districtid int(11),DistrictName varchar(100),	TotalCount int(11) default 0,
	RBC int(11)default 0,	WBC int(11) default 0,
	Others int(11) default 0);
    
     insert into temp_report(Districtid,DistrictName)
    select Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;

create temporary table temp1 as
select t.PermDistrictId,bg.componenttypeid,replace(bg.ComponentType,' ','') "ComponentType",
ifnull(t.count,0)count  from db_iemr.m_componenttype bg left join (
select  b.PermDistrictId,t.componenttypeid,
t.componenttypename "Component Type", 
-- t.componentTypeName "Component Type Name", 
count(1) count

		from db_reporting.fact_bloodrequest t
			 inner JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
         --   LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and b.PermDistrictId=ifnull(v_districtid,b.PermDistrictId)
               and b.PermSubDistrictId=ifnull(v_talukid,b.PermSubDistrictId)
               and b.PermVillageId=ifnull(v_villageid,b.PermVillageId)
           --   and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
      
			 group by b.PermDistrictId,t.componenttypeid,t.componenttypename)t on t.componenttypeid=bg.componenttypeid
             where bg.deleted is false
             and    bg.ComponentType in('Red Blood Cells','White Blood Cells') 
       union
       
select t.PermDistrictId,bg.componenttypeid,'Others' ,
sum(ifnull(t.count,0)) count  from db_iemr.m_componenttype bg left join (
select  PermDistrictId,t.componenttypeid,
t.componenttypename , 
-- t.componentTypeName "Component Type Name", 
count(1) count

		from db_reporting.fact_bloodrequest t
			 inner JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
         --   LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where 
             componenttypename not in('Red Blood Cells','White Blood Cells') and
             t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and b.PermDistrictId=ifnull(v_districtid,b.PermDistrictId)
               and b.PermSubDistrictId=ifnull(v_talukid,b.PermSubDistrictId)
               and b.PermVillageId=ifnull(v_villageid,b.PermVillageId)
           --   and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
      
			 group by b.PermDistrictId,t.componenttypeid,t.componenttypename)t on t.componenttypeid=bg.componenttypeid
             where bg.deleted is false
              and    bg.ComponentType not in('Red Blood Cells','White Blood Cells') ;

set sql_safe_updates=0;              
update temp_report t1
inner join temp1 t2 on  t1.DistrictId=t2.permdistrictid 
set t1.RBC=t2.count
where t2.componenttype='RedBloodCells';   


update temp_report t1
inner join temp1 t2 on  t1.DistrictId=t2.permdistrictid 
set t1.WBC=t2.count
where t2.componenttype='WhiteBloodCells';  


update temp_report t1
inner join temp1 t2 on  t1.DistrictId=t2.permdistrictid 
set t1.Others=t2.count
where t2.componenttype='Others'; 


update temp_report  set Totalcount=RBC+WBC+Others; 

select Districtname,Totalcount,WBC,RBC,Others from temp_report;     
             
drop temporary table if exists temp1;

drop temporary table if exists temp_report;


 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104BoodRequestDetails_Groupwise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104BoodRequestDetails_Groupwise`(v_starttime datetime,v_endtime datetime,
v_districtid int(11),v_talukid int(11),v_villageid int(11),v_psmid int(11))
begin

select bg.bloodgroup "Group",ifnull(t.count,0)count from db_iemr.m_bloodgroup bg left join (
select  t.bloodgroupid,
t.BloodGroupName "Blood Group Name", 
-- t.componentTypeName "Component Type Name", 
count(1) count

		from db_reporting.fact_bloodrequest t
			 left JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
         --   LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and b.PermDistrictId=ifnull(v_districtid,b.PermDistrictId)
               and b.PermSubDistrictId=ifnull(v_talukid,b.PermSubDistrictId)
               and b.PermVillageId=ifnull(v_villageid,b.PermVillageId)
           --   and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			 group by t.bloodgroupid,t.bloodGroupName)t on t.bloodgroupid=bg.bloodgroupid
             where bg.deleted is false;
             -- ,t.componentTypeName;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104BoodRequestDetails_Groupwise_Pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104BoodRequestDetails_Groupwise_Pivot`(v_starttime datetime,v_endtime datetime,
v_districtid int(11),v_talukid int(11),v_villageid int(11),v_psmid int(11))
begin

declare v_stateid int(11);
select stateid into v_stateid from db_iemr.m_providerservicemapping 
where providerservicemapid=v_psmid;

create temporary table temp1 as

select b.permdistrict, t.bloodgroupid,
t.BloodGroupName , 
-- t.componentTypeName "Component Type Name", 
count(1) count

		from db_reporting.fact_bloodrequest t
			 left JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
         --   LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and b.PermDistrictId=ifnull(v_districtid,b.PermDistrictId)
               and b.PermSubDistrictId=ifnull(v_talukid,b.PermSubDistrictId)
               and b.PermVillageId=ifnull(v_villageid,b.PermVillageId)
           --   and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			 group by b.permdistrict,t.bloodgroupid,t.bloodGroupName;
             
          create temporary table temp3 as
   select  permdistrict,
replace(replace(replace(replace(bg.bloodgroup,' ',''),'''',''),'+','Positi'),'-','Negati') "Groupname",
ifnull(t.count,0)count from temp1  t
right join(
              select * from db_iemr.m_bloodgroup where deleted is false)bg
            on t.bloodgroupid=bg.bloodgroupid
           
             group by permdistrict,bg.bloodgroup ;
             
      
      
      SET SESSION group_concat_max_len = 1000000;
      
  
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'ifnull(sum(case when Groupname = ''',
       `Groupname`,
      ''' then ifnull(count,0) end),0) ',
       `Groupname`
    )
  ) INTO @sql 
FROM
  temp3 ;
  
  create temporary table temp4 as
  select * from  db_iemr.m_district 
where stateid=v_stateid;
 
SET @sql2 = CONCAT('create temporary table temp5 as SELECT d.Districtname permdistrict,', @sql,'  FROM 
                   temp3 t
right join temp4 d  on t.permdistrict=d.districtname
group by d.Districtname;');
                   

if( @sql2 is not null) then
PREPARE stmt FROM @sql2;
execute stmt;
DEALLOCATE PREPARE stmt;


alter table temp5 add totalcount int(11) default 0;

set sql_safe_updates=0;
update temp5 t
inner join (select permdistrict, sum(count) count from temp1 
group by permdistrict)a on a.permdistrict=t.permdistrict
set t.totalcount=a.count;

 select permdistrict,(APositive+ANegative+
 BPositive+BNegative) Totalcount,APositive,ANegative,
 BPositive,BNegative from temp5 where permdistrict is not null;


drop temporary table  if exists  temp5;

end if;


      
    --  select * from m_district where stateid=v_stateid;
             
drop temporary table if exists  temp1;
drop temporary table  if exists  temp3;
drop temporary table  if exists  temp4;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallQuality_AgentWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104CallQuality_AgentWise`(v_starttime datetime,
v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
 select Concat(ifnull(du.firstname,''),' ',ifnull(du.middlename,''),'',
 ifnull(du.lastname,'')) Agentname,
 fb.ReceivedAgentID,
 count(1) "Count Of Calls"  from fact_bencall fb 
 inner join dim_user du on du.userid=fb.CallReceivedUserID
 inner join db_iemr.m_userservicerolemapping mu on mu.userid=du.userid
 where 
 fb.createddate>=v_starttime and fb.createddate<=v_endtime 
  and fb.ProviderServiceMapID=ifnull(v_psmid,fb.ProviderServiceMapID) 
   and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
   group by Concat(ifnull(du.firstname,''),' ',ifnull(du.middlename,''),'',
 ifnull(du.lastname,'')),
fb.ReceivedAgentID;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallQuality_CallTypeWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104CallQuality_CallTypeWise`(v_starttime datetime,
v_endtime datetime,v_calltypeid int(11),
v_psmid int(11))
begin
 select fb.CallSubTypeName "Call Type",count(1) "Count Of Calls"  from fact_bencall fb 
 where 
 fb.createddate>=v_starttime and fb.createddate<=v_endtime 
  and fb.ProviderServiceMapID=ifnull(v_psmid,fb.ProviderServiceMapID) 
 and fb.calltypeid=ifnull(v_calltypeid,fb.calltypeid)
   group by fb.CallSubTypeName;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallQuality_DateWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104CallQuality_DateWise`(v_starttime datetime,
v_endtime datetime,
v_psmid int(11))
begin
 select date(fb.createddate) "date",count(1) "Count Of Calls"  from fact_bencall fb 
 where 
 fb.createddate>=v_starttime and fb.createddate<=v_endtime 
  and fb.ProviderServiceMapID=ifnull(v_psmid,fb.ProviderServiceMapID) 
  -- and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
   group by date(fb.createddate);
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallQuality_LocationWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104CallQuality_LocationWise`(v_starttime datetime,v_endtime datetime,
v_locationid int(11),v_psmid int(11))
begin
 select md.locationname "Center",count(1) "Count Of Calls"  from fact_bencall fb 
 inner join dim_user du on du.userid=fb.CallReceivedUserID
 inner join db_iemr.m_userservicerolemapping mu on mu.userid=du.userid
 inner join db_iemr.m_providerserviceaddmapping md on md.PSAddMapID=mu.WorkingLocationID 
 where  md.PSAddMapID=ifnull(v_locationid,md.PSAddMapID)  and
 fb.createddate>=v_starttime and fb.createddate<=v_endtime 
  and fb.ProviderServiceMapID=ifnull(v_psmid,fb.ProviderServiceMapID) 
   group by md.locationname;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallQuality_RoleWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104CallQuality_RoleWise`(v_starttime datetime,
v_endtime datetime,
v_roleid int(11),v_psmid int(11))
begin
 select r.rolename,count(1) "Count Of Calls"  from fact_bencall fb 
 inner join dim_user du on du.userid=fb.CallReceivedUserID
 inner join db_iemr.m_userservicerolemapping mu on mu.userid=du.userid
 inner join db_iemr.m_role r on r.roleid=mu.roleid and r.deleted is false
 -- inner join db_iemr.m_providerserviceaddmapping md on md.PSAddMapID=mu.WorkingLocationID 
 where 
 -- md.PSAddMapID=ifnull(v_locationid,md.PSAddMapID)  and
 fb.createddate>=v_starttime and fb.createddate<=v_endtime 
  and fb.ProviderServiceMapID=ifnull(v_psmid,fb.ProviderServiceMapID) 
  and mu.roleid=ifnull(v_roleid,mu.roleid)
   group by r.rolename;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallQuality_SkillsetWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104CallQuality_SkillsetWise`(v_starttime datetime,
v_endtime datetime,
v_roleid int(11),v_psmid int(11))
begin
 select r.rolename "Skill Set",count(1) "Count Of Calls"  from fact_bencall fb 
 inner join dim_user du on du.userid=fb.CallReceivedUserID
 inner join db_iemr.m_userservicerolemapping mu on mu.userid=du.userid
 inner join db_iemr.m_role r on r.roleid=mu.roleid and r.deleted is false
 -- inner join db_iemr.m_providerserviceaddmapping md on md.PSAddMapID=mu.WorkingLocationID 
 where 
 -- md.PSAddMapID=ifnull(v_locationid,md.PSAddMapID)  and
 fb.createddate>=v_starttime and fb.createddate<=v_endtime 
  and fb.ProviderServiceMapID=ifnull(v_psmid,fb.ProviderServiceMapID) 
  and mu.roleid=ifnull(v_roleid,mu.roleid)
   group by r.rolename;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CallSummaryReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104CallSummaryReport`(v_starttime datetime,v_endtime datetime,
v_rolename varchar(100),v_calltypeid int(11),
v_Agentid int(11),v_psmid int(11))
begin
select distinct  t1.CreatedDate "Date Of Call",t1.phoneno "Caller Phone Number"
,ReceivedAgentID "Agent ID",t2.FirstName "Agent Name",
ReceivedRoleName "Skill Set",
			t1.CallTypeName "Call Type",
            t1.callsubtypename "Call Sub Type",
            t1.providerservicemapid "Provider Service Map ID",
            t1.remarks "Closure Remark"
 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
          --  LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 

where ( t1.createdDate between v_starttime and v_endtime ) 
and ( t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID ) )
and ( t1.callTypeID is not null ) 
and ( t1.ReceivedagentID=ifnull(v_Agentid,t1.ReceivedagentID) ) 
and ( t1.receivedRoleName=ifnull(v_rolename,t1.receivedRoleName) ) 
and ( t1.callTypeID=ifnull(v_calltypeid,t1.callTypeID) );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CODetailGCategoryReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104CODetailGCategoryReport`(v_starttime datetime,v_endtime datetime,v_psmid int(11))
begin
select CategoryName "Category",count(1) Count from fact_104benmedhistory
where CategoryName is not null
        and  providerServiceMapID=ifnull(v_psmid,providerServiceMapID) and
           -- and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)  and
            createddate>=v_starttime and createddate<=v_endtime
group by CategoryName
order by CategoryName asc;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104CODetailGuidelinesReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104CODetailGuidelinesReport`(v_starttime datetime,v_endtime datetime,v_psmid int(11))
begin
select DiseaseSummary "Guidelines",count(1) Count from fact_104benmedhistory
where DiseaseSummary is not null
        and  providerServiceMapID=ifnull(v_psmid,providerServiceMapID) and
           -- and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)  and
            createddate>=v_starttime and createddate<=v_endtime
group by DiseaseSummary
order by diseaseSummary asc;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104COReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104COReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

select distinct b.beneficiaryID "Beneficiary ID",
t.ActionByPD "Action By P D",
t.allergies "Allergies",
t.diseaseSummary "Disease Summary",
t.selecteDiagnosis "Selecte Diagnosis",
t.selecteDiagnosisID "Selecte Diagnosis ID", 
t.addedAdvice "Added Advice",
t.diseaseSummaryID "Disease Summary ID",
t.prescriptionID "Prescription ID", 
t.requestID "Request ID",
t.benHistoryID "Ben History ID", 
b.firstName "First Name", b.lastName "Last Name",
t.patientName "Patient Name", 
t.isSelf "Is Self",
 b.dob "Date Of Birth",
 t.patientAge "Patient Age",
 b.gender "Gender",
  b.healthCareWorker "Health Care Worker",
 c.phoneNo "Phone Number",
   b.permDistrict "District", 
   b.permSubDistrict "Sub District",
    b.permVillage "Village",  
     t.benCallID "Ben Call ID", 
     c.callTypeName "Call Type",
     c.callSubTypeName "Call Sub Type",
     c.callReceivedUserID "Call Received User ID", 
     t.SymptomID "Symptom ID",
     t.ActionByHAO "Action By H A O",
t.treatmentrecommendation "Action By C O",
t.ActionByMO "Action By M O",
t.createdDate "Date", 
c.callEndUserID "Call End User ID",
t.CategoryName "Category",
t.subCategoryName "Sub Category",
 c.ReceivedAgentID "Agent ID",
 user.firstName  "Agent Name"
#t.remarks "Remarks"
-- t.beneficiaryRegID,
--  t.patientGenderName, 
 -- t.algorithm
			from fact_104benmedhistory t 
			LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			 and t.treatmentrecommendation IS NOT NULL   and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			 order by t.createdDate asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104DirectoryServiceReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104DirectoryServiceReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
b.beneficiaryID "Beneficiary ID",
t.acceptorHospitalName "Acceptor Hospital Name",
t.acceptorHospitalState "Acceptor Hospital State",
t.acceptorHospitalDistrict "Acceptor Hospital District",
t.acceptorHospitalSubDistrict "Acceptor Hospital Sub District",
t.acceptorHospitalVillage "Acceptor Hospital Village",
t.instituteDirectoryName "Institute Directory Name",
t.instituteSubDirectoryName "Institute Sub Directory Name",
t.institutionID "Institution ID", t.createdDate "Date",
b.firstName "First Name", b.lastName "Last Name", b.dob "Date Of Birth",
b.gender "Gender", b.healthCareWorker "Health Care Worker",c.phoneNo "Phone Number",
b.permDistrict "District",b.permSubDistrict "Sub District", b.permVillage "Village",
t.benCallID "Ben Call ID",
c.callTypeName "Call Type", c.callSubTypeName "Call Sub Type",
c.callReceivedUserID "Call Received User ID",
c.callEndUserID "Call End User ID", c.ReceivedagentID "Agent ID",
user.firstName "Agent Name"
from fact_directoryservice t
LEFT JOIN dim_beneficiary b on b.BeneficiaryRegID=t.BeneficiaryRegID
LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
left join dim_user user on user.userid=c.CallReceivedUserID
where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID)
and t.createdDate >=v_starttime
and t.createdDate <=v_endtime
and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
order by t.createdDate desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104DSusedValidCallAtHAO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104DSusedValidCallAtHAO`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin
/*select t1.CreatedDate,CallID,ReceivedAgentID,t2.FirstName,ReceivedRoleName,
t3.DiseaseSummary,t3.SelecteDiagnosis,
			CallTypeName,CZCallDuration,RecordingFilePath*/
            
            select t1.CreatedDate "Date Of Call",CallID"Call ID",
ReceivedAgentID "Agent ID",
t2.FirstName "Agent Name",ReceivedRoleName "Skill Set",
t3.DiseaseSummary "Symptom",t3.SelecteDiagnosis
 "Disease Summary Provided",
			CallTypeName "Call Type",CZCallDuration "Call Duration",
            RecordingFilePath "Recording File Path"
            
            
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            where ReceivedRoleName=ifnull(v_receivedRoleName,receivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName= ifnull(v_callTypeName,t1.CallTypeName)
            and (t1.CallReceivedUserID=t1.CallEndUserID) 
            and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            and t3.SelecteDiagnosis is not null  group by ReceivedRoleName,ReceivedAgentID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104Epidemicoutbreak` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104Epidemicoutbreak`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

select  distinct b.BeneficiaryID "Beneficiary ID",t.NatureOfComplaint "Nature Of Complaint",
t.OutbreakComplaintID "Outbreak Complaint ID",
t.districtblockname "Affected District Block Name",t.DistrictBranchName "Affected District Branch Name",
t.DistrictName "Affected District Name",t.TotalPeopleAffected "Total People Affected",
t.Remarks "Remarks",t.RequestID "Request ID",t.CreatedDate "Date",
b.FirstName "First Name",
b.LastName "Last Name",b.DOB "Date Of Birth",b.Gender "Gender",b.HealthCareWorker "Health Care Worker",
c.PhoneNo "Phone Number", b.PermDistrict "District",b.PermSubDistrict "Sub District",b.PermVillage "Village",
c.CallTypeName "Call Type",c.CallSubTypeName "Call Sub Type",t.BenCallID "Ben Call ID",
c.CallReceivedUserID "Call Received User ID",c.CallEndUserID "Call End User ID",
c.ReceivedagentID "Agent ID", user.firstName "Agent Name"


			from db_reporting.fact_epidemicoutbreak t
			LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
	        and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
              order by t.createddate desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104FoodsafetyComplaint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104FoodsafetyComplaint`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

select   distinct b.BeneficiaryID "Beneficiary ID",t.FeedbackType "Feedback Type" ,
t.AssociatedSymptoms "Associated Symptoms",t.FoodConsumedFrom "Food Consumed From",
t.fromwhen   "Fromadd Services Date",t.FSComplaintID "Fs Complaint ID",
t.HistoryOfDiet "History Of Diet",t.isAbdominalPain "Is Abdominal Pain",
t.isChillsOrRigors "Is Chills Or Rigors",t.isDehydration "Is Dehydration",
t.isDiarrhea "Is Diarrhea",t.isFoodConsumed "Is Food Consumed",t.isGiddiness "Is Giddiness",
t.isRashes "Is Rashes",t.isVomiting "Is Vomiting",t.TypeOfFood "Type Of Food",t.TypeOfRequest "Type Of Request",
t.Remarks "Remarks",t.RequestID "Request ID",t.CreatedDate "Date",b.FirstName "First Name",
b.LastName "Last Name",t.PatientName "Patient Name",t.PatientAge "Patient Age",
b.DOB "Date Of Birth",b.Gender "Gender",b.HealthCareWorker "Health Care Worker",t.isself "Is Self",
t.PatientGenderID "Patient Gender ID",c.PhoneNo "Phone Number", 
t.DistrictName "District",t.DistrictBlockName "Sub District",t.VillageName "Village",
t.BenCallID "Ben Call ID",c.CallTypeName "Call Type",c.CallSubTypeName "Call Sub Type",
c.CallReceivedUserID "Call Received User ID",c.CallEndUserID "Call End User ID",
t.FromWhen "From When Date",t.PatientGenderName "Patient Gender",
c.ReceivedagentID "Agent ID", user.firstName "Agent Name"
			from fact_foodsafetycopmlaint t
			LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
	        and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
              order by t.createddate desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104GrievanceDetailsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104GrievanceDetailsReport`(v_starttime datetime,v_endtime datetime,v_feedbackNatureID int(11),
v_feedbacktypeid int(11),
v_feedbacktypename varchar(100),v_psmid int(11))
begin
	SELECT feedbackReport.feedbacktypename "Type Of Request"
    ,COUNT(feedbackReport.FeedbackID) "Count Of Grievance"   FROM fact_feedback feedbackReport 
			 where feedbackReport.createdDate >= v_starttime and feedbackReport.createdDate <= v_endtime
			 and feedbackReport.providerServiceMapID = ifnull(v_psmid,feedbackReport.providerServiceMapID)
             and feedbackReport.feedbackNatureID = ifnull(v_feedbackNatureID,feedbackReport.feedbackNatureID)
             and feedbackReport.feedbacktypeid=ifnull(v_feedbacktypeid,feedbackReport.feedbacktypeid)
             and feedbackReport.feedbacktypename=ifnull(v_feedbacktypename,feedbackReport.feedbacktypename)
             group by feedbackReport.feedbacktypename;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104GrievanceReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104GrievanceReport`(v_starttime datetime,v_endtime datetime,v_feedbackTypeID int(11),v_Agentid int(11),v_psmid int(11))
begin

	select b.beneficiaryID, t.feedbackAgainst, t.feedbackID, t.feedbackNatureName, 
t.feedbackStatusName, t.EmailStatusID , t.feedbackTypeName,t.feedback, t.DesignationName,
t.requestID, t.serviceAvailDate, t.severityName, t.smsPhoneNo, t.userID,t.instituteTypeName,  t.institutionName,
t.districtBranchName,t.districtName,t.blockName,t.createdDate,b.firstName "First Name",b.lastName,
b.dob,b.gender, b.healthCareWorker,c.phoneNo,t.stateName,b.permDistrict,
b.permSubDistrict,b.permVillage,t.benCallID,c.callTypeName,c.callSubTypeName,c.callReceivedUserID,
c.callEndUserID, c.ReceivedAgentID, user.firstName "Agent name"
			 from fact_feedback t 
			 LEFT JOIN dim_beneficiary  b    on b.beneficiaryregid=t.beneficiaryregid
             LEFT JOIN fact_bencall c on c.bencallid=t.bencallid
			 left join dim_user user 	on user.userid=c.callreceiveduserid
			 where t.providerServiceMapID=ifnull(v_psmid ,t.providerServiceMapID)
              and t.feedbackTypeID=ifnull(v_feedbackTypeID,t.feedbackTypeID)
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			 and t.createdDate >= v_starttime  and t.createdDate <=v_endtime   order by t.createdDate desc;
             
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104HAHTDisconnectedCalls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104HAHTDisconnectedCalls`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin

/*select t1.CreatedDate,CallID,ReceivedAgentID,t2.FirstName,ReceivedRoleName,t3.DiseaseSummary,t3.SelecteDiagnosis,
			CallTypeName,max(CZCallDuration) CZCallDuration,RecordingFilePath*/
  select t1.CreatedDate "Date Of Call",CallID"Call ID",
ReceivedAgentID "Agent ID",
t2.FirstName "Agent Name",ReceivedRoleName "Skill Set",
t3.DiseaseSummary "Symptom",t3.SelecteDiagnosis
 "Disease Summary Provided",
			CallTypeName "Call Type",max(CZCallDuration) "Call Duration",
            RecordingFilePath "Recording File Path"          
            
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            where ReceivedRoleName= ifnull(v_receivedRoleName,receivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName=ifnull(v_callTypeName,t1.CallTypeName) 
            and t1.CallSubTypeName like '%Disconnected%'
            and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            and t1.CZCallDuration is not null 
            group by ReceivedRoleName,ReceivedAgentID;
            
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104HAHTvalidcallsclosedatHAO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104HAHTvalidcallsclosedatHAO`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin

/*select t1.CreatedDate,CallID,ReceivedAgentID,t2.FirstName,ReceivedRoleName,t3.DiseaseSummary,t3.SelecteDiagnosis,
			CallTypeName,max(CZCallDuration)CZCallDuration,RecordingFilePath
  */          
   select t1.CreatedDate "Date Of Call",CallID"Call ID",
ReceivedAgentID "Agent ID",
t2.FirstName "Agent Name",ReceivedRoleName "Skill Set",
t3.DiseaseSummary "Symptom",t3.SelecteDiagnosis
 "Disease Summary Provided",
			CallTypeName "Call Type",max(CZCallDuration) "Call Duration",
            RecordingFilePath "Recording File Path"          
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            where ReceivedRoleName=ifnull(v_receivedRoleName,ReceivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName=ifnull(v_callTypeName,t1.CallTypeName) and t1.CZCallDuration is not null 
             and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
and (t1.CallReceivedUserID=t1.CallEndUserID)
 group by ReceivedRoleName,ReceivedAgentID
           ;
           end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104HAOReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_104HAOReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
#SNo	Action By HAO	Action By P D	Allergies	Selected Diagnosis	Selected Diagnosis ID	Added Advice	Disease Summary ID	Prescription ID	Request ID	Ben History ID	First Name	Last Name	Patient Name	Is Self	Date Of birth	Patient Age	Gender	Health Care Worker	Phone Number	District	Sub District	Village	Ben Call ID	Call Type	Call Sub Type	Call Received User ID	Call End User ID	Symptom ID	Action By C O	Action By M O	Date	Beneficiary ID	Agent ID	Agent Name	Have You Travelled In Last14 Days	Travel Type	Symptom	Covid19 Contact History	Did You Seek Medical Consultation	Suspected Covid19	Recommendation	

select 
t.ActionByHAO "Action By HAO",
t.ActionByPD "Action By P D",
t.allergies "Allergies",
#t.diseaseSummary "Disease Summary",
t.selecteDiagnosis "Selecte Diagnosis",
t.selecteDiagnosisID "Selecte Diagnosis ID", 
t.addedAdvice "Added Advice",
t.diseaseSummaryID "Disease Summary ID",
t.algorithm "algorithm",
t.prescriptionID "Prescription ID", 
t.requestID "Request ID",
t.benHistoryID "Ben History ID", 
b.firstName "First Name", b.lastName "Last Name",
t.patientName "Patient Name", 
t.isSelf "Is Self",
 b.dob "Date Of Birth",
 t.patientAge "Patient Age",
 b.gender "Gender",
  b.healthCareWorker "Health Care Worker",
 c.phoneNo "Phone Number",
   b.permDistrict "District", 
   b.permSubDistrict "Sub District",
    b.permVillage "Village",  
     t.benCallID "Ben Call ID", 
     c.callTypeName "Call Type",
     c.callSubTypeName "Call Sub Type",
     c.callReceivedUserID "Call Received User ID", 
     c.callEndUserID "Call End User ID",
     t.SymptomID "Symptom ID",
     t.actionByCO "Action By C O",
     t.ActionByMO "Action By MO",
     t.createdDate "Date", 
b.beneficiaryID "Beneficiary ID",
-- prescriptionReport.drugName "Drug Name",prescriptionReport.frequency "Frequency", 
  --          prescriptionReport.dosage "Dosage", prescriptionReport.noOfDays "No Of Days", 
c.ReceivedAgentID "Agent ID",
 user.firstName  "Agent Name",
            t.travel_14days "Have You Travelled In Last14 Days",t.travel_type "Travel Type",
            t.symptoms "Symptom",t.COVID19_contact_history "Covid19 Contact History"
            ,t.medical_consultation "Did You Seek Medical Consultation",
            t.Suspected_COVID19 "Suspected Covid19",t.recommendation "Recommendation"
            


/*t.benHistoryID, t.requestID, t.beneficiaryRegID, t.benCallID, t.patientName, t.patientAge, t.patientGenderName, 
-- t.algorithm, 
			t.diseaseSummaryID, t.diseaseSummary, t.allergies, t.selecteDiagnosisID, t.selecteDiagnosis, t.addedAdvice,
            t.prescriptionID, t.actionByHAO, t.remarks, t.isSelf, t.createdDate, b.beneficiaryID, b.firstName,
            b.lastName, b.healthCareWorker, b.gender, b.dob, b.permVillage, b.permSubDistrict, b.permDistrict, 
			c.callTypeName, c.callSubTypeName, c.phoneNo, c.callReceivedUserID, c.callEndUserID, c.ReceivedAgentID,
            user.firstName,
			t.travel_14days,t.travel_type,
			t.symptoms,t.COVID19_contact_history,t.medical_consultation,
			t.Suspected_COVID19,t.recommendation */
            
			from fact_104benmedhistory t 
			LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID			
			where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID)
             and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			and t.actionByHAO IS NOT NULL  
             and t.createddate>=v_starttime and t.createddate<=v_endtime
			order by t.createdDate desc;
            
            end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104HealthSchemes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104HealthSchemes`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
b.beneficiaryID "Beneficiary ID",t.schemeDesc "Scheme Desc",t.schemeID "Scheme ID",
t.schemeName "Scheme Name", 
t.schemeServiceID "Scheme Service ID", 
 t.remarks "Remarks",t.requestID "Request ID",t.createdDate "Date",
 b.firstName "First Name", b.lastName "Last Name",
 b.dob "Date Of Birth",  b.gender "Gender", 
             b.healthCareWorker "Health Care Worker",c.phoneNo "Phone Number",
             b.permDistrict "District",b.permSubDistrict "Sub District", b.permVillage "Village", 
   c.callTypeName "Call Type", c.callSubTypeName "Call Sub Type", t.benCallID "Ben Call ID", 
			  c.callReceivedUserID "Call Received User ID", 
            c.callEndUserID "Call End User ID", c.ReceivedAgentID "Agent ID",
            user.firstName "Agent Name"
			from fact_schemeservice t
			left join fact_bencall c on t.bencallid=c.bencallid
			LEFT JOIN dim_beneficiary b on c.beneficiaryRegID=b.beneficiaryRegID
			left join dim_user user on  c.CallReceivedUserID=user.UserID
			where c.providerServiceMapID=ifnull(v_psmid,c.providerServiceMapID)  
             and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID) and
             t.createdDate >=v_starttime and t.createdDate <=v_endtime;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104LAHTAlgorithmCalls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104LAHTAlgorithmCalls`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin
select t1.CreatedDate "Date Of Call",CallID"Call ID",ReceivedAgentID "Agent ID",
t2.FirstName "Agent Name",ReceivedRoleName "Skill Set",t3.DiseaseSummary "Symptom",t3.SelecteDiagnosis
 "Disease Summary Provided",
			CallTypeName "Call Type",min(CZCallDuration) "Call Duration",
            RecordingFilePath "Recording File Path"
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            where ReceivedRoleName= ifnull(v_receivedRoleName,ReceivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName=ifnull(v_callTypeName,t1.CallTypeName) and t3.DiseaseSummary is not null
            and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            and t1.CZCallDuration is not null  group by ReceivedRoleName,ReceivedAgentID;
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104LAHTTransferCallsMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104LAHTTransferCallsMO`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin
/* select t1.CreatedDate,CallID,ReceivedAgentID,t2.FirstName,ReceivedRoleName,t3.DiseaseSummary,t3.SelecteDiagnosis,
			CallTypeName,min(CZCallDuration) CZCallDuration,RecordingFilePath
        */    
   select t1.CreatedDate "Date Of Call",CallID"Call ID",ReceivedAgentID "Agent ID",
t2.FirstName "Agent Name",ReceivedRoleName "Skill Set",t3.DiseaseSummary "Symptom",t3.SelecteDiagnosis
 "Disease Summary Provided",
			CallTypeName "Call Type",min(CZCallDuration) "Call Duration",
            RecordingFilePath "Recording File Path"         
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID
			LEFT JOIN db_iemr.m_userservicerolemapping t4 ON t1.CallEndUserID=t4.UserID 
			 LEFT JOIN db_iemr.m_role t5 ON t5.RoleID=t4.RoleID where 
            ReceivedRoleName=ifnull(v_receivedRoleName,ReceivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName=ifnull(v_callTypeName,t1.CallTypeName) 
            and t5.RoleName='MO' 
            and t1.CZCallDuration is not null 
              and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            group by ReceivedRoleName,ReceivedAgentID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104MODetailsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104MODetailsReport`(v_starttime datetime,v_endtime datetime,
v_districtid int(11),v_SubDistrictId int(11),v_villageid int(11),
v_roleid int(11),v_locationid int(11),v_psmid int(11))
begin
 select bh.diseaseSummary "Disease Summary",count(1) Count from fact_104benmedhistory bh
 inner join fact_bencall fb on fb.bencallid=bh.bencallid
 inner join dim_beneficiary db on fb.BeneficiaryRegID=db.BeneficiaryRegID
 inner join dim_user du on du.userid=fb.CallReceivedUserID
 inner join db_iemr.m_userservicerolemapping mu on mu.userid=du.userid
 inner join db_iemr.m_providerserviceaddmapping md on md.PSAddMapID=mu.WorkingLocationID 
 where    db.PermDistrictId=ifnull(v_Districtid,db.PermDistrictId) and db.PermDistrictId is not null 
 and db.PermSubDistrictId=ifnull(v_SubDistrictId,db.PermSubDistrictId) and db.PermSubDistrictId is not null
 and db.PermVillageId=ifnull(v_VillageId,db.PermVillageId) and db.PermVillageId is not null
 and
 bh.createddate>=v_starttime and bh.createddate<=v_endtime and db.BeneficiaryRegID is not null  
  and md.PSAddMapID=ifnull(v_locationid,md.PSAddMapID) and md.PSAddMapID is not null
   and mu.roleid=ifnull(v_roleid,mu.roleid)
   group by bh.diseaseSummary order by  bh.diseaseSummary desc;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104MOReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104MOReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

select 
t.ActionByHAO "Action By HAO",
t.ActionByPD "Action By P D",
t.allergies "Allergies",
t.diseaseSummary "Disease Summary",
t.selecteDiagnosis "Selecte Diagnosis",
t.selecteDiagnosisID "Selecte Diagnosis ID", 
t.addedAdvice "Added Advice",
t.diseaseSummaryID "Disease Summary ID",
t.prescriptionID "Prescription ID", 
t.requestID "Request ID",
t.benHistoryID "Ben History ID", 
b.firstName "First Name", b.lastName "Last Name",
t.patientName "Patient Name", 
t.isSelf "Is Self",
 b.dob "Date Of Birth",
 t.patientAge "Patient Age",
 b.gender "Gender",
  b.healthCareWorker "Health Care Worker",
 c.phoneNo "Phone Number",
   b.permDistrict "District", 
   b.permSubDistrict "Sub District",
    b.permVillage "Village",  
     t.benCallID "Ben Call ID", 
     c.callTypeName "Call Type",
     c.callSubTypeName "Call Sub Type",
     c.callReceivedUserID "Call Received User ID", 
     c.callEndUserID "Call End User ID",
     t.SymptomID "Symptom ID",
     t.actionByCO "Action By C O",
     t.ActionByMO "Action By MO",
     t.createdDate "Date", 
b.beneficiaryID "Beneficiary ID",
prescriptionReport.drugName "Drug Name",prescriptionReport.frequency "Frequency", 
            prescriptionReport.dosage "Dosage", prescriptionReport.noOfDays "No Of Days", 
c.ReceivedAgentID "Agent ID",
 user.firstName  "Agent Name",
            t.travel_14days "Have You Travelled In Last14 Days",t.travel_type "Travel Type",
            t.symptoms "Symptom",t.COVID19_contact_history "Covid19 Contact History"
            ,t.medical_consultation "Did You Seek Medical Consultation",
            t.Suspected_COVID19 "Suspected Covid19",t.recommendation "Recommendation"
            

/*t.benHistoryID, t.requestID, t.beneficiaryRegID, t.benCallID, t.patientName, 
t.patientAge, t.patientGenderName, t.algorithm, 
            t.diseaseSummaryID, t.diseaseSummary, t.allergies, t.selecteDiagnosisID,
            t.selecteDiagnosis, t.addedAdvice, t.prescriptionID, t.actionByMO, t.remarks,
            t.isSelf, t.createdDate, b.beneficiaryID, b.firstName, b.lastName, 
            b.healthCareWorker, b.gender, b.dob, b.permVillage, b.permSubDistrict, b.permDistrict, 
            c.callTypeName, c.callSubTypeName, c.phoneNo, c.callReceivedUserID, c.callEndUserID, 
            c.ReceivedAgentID, user.firstName,
            prescriptionReport.drugName,prescriptionReport.frequency, 
            prescriptionReport.dosage, prescriptionReport.noOfDays, 
            t.travel_14days,t.travel_type,
            t.symptoms,t.COVID19_contact_history,t.medical_consultation,
            t.Suspected_COVID19,t.recommendation */
            
            from fact_104benmedhistory t 
            LEFT JOIN dim_beneficiary b   on b.beneficiaryregid=t.beneficiaryregid
            LEFT JOIN  fact_bencall c  on c.bencallid=t.BenCallID
            left join dim_user user on user.userid=c.callreceiveduserid
            left join fact_104prescription prescriptionReport   on      prescriptionReport.BenCallID=c.BenCallID    
            where          t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 
            and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)  and
             t.actionByMO IS NOT NULL   and t.createddate>=v_starttime and t.createddate<=v_endtime
			order by t.createdDate desc;
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104OrganDonation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104OrganDonation`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

select  distinct b.BeneficiaryID "Beneficiary ID",
t.DonationTypeName "Donation Type Name",t.OrganDonationID "Organ Donation ID",
t.DonatableOrganName "Donatable Organ Name",t.AcceptorHospitalName "Acceptor Hospital Name",
t.AcceptorHospitalState "Acceptor Hospital State",t.AcceptorHospitalDistrict "Acceptor Hospital District",
t.AcceptorHospitalSubDistrict "Acceptor Hospital Sub District",t.AcceptorHospitalVillage "Acceptor Hospital Village",
t.CreatedDate "Created Date",t.Remarks "Remarks",t.RequestID "Request ID",
b.FirstName "First Name",
b.LastName "Last Name",b.DOB "Date Of Birth",t.DonarAge "Donar Age",t.DonarGenderName "Donar Gender",
b.Gender "Gender",b.HealthCareWorker "Health Care Worker",t.IsSelf "Is Self",
c.PhoneNo "Phone Number",t.DonarName "Donar Name",b.PermDistrict "District",b.PermSubDistrict "Sub District",b.PermVillage "Village",
t.BenCallID "Ben Call ID",c.CallTypeName "Call Type",c.CallSubTypeName "Call Sub Type",
c.CallReceivedUserID "Call Received User ID",c.CallEndUserID "Call End User ID",
t.CreatedDate "Date",
c.ReceivedagentID "Agent ID", user.firstName "Agent Name"

			from db_reporting.fact_organdonation t
			LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
	        and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
              order by t.createddate desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104OtherAdviceCalls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104OtherAdviceCalls`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin
select t1.CreatedDate,CallID,ReceivedAgentID,t2.FirstName,ReceivedRoleName,t3.DiseaseSummary,t3.SelecteDiagnosis,
			CallTypeName,CZCallDuration,t3.ActionByHAO,RecordingFilePath
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            LEFT JOIN db_identity.i_beneficiarymapping t4 ON t1.BeneficiaryRegID=t4.BenRegId 
            where ReceivedRoleName= ifnull(v_receivedRoleName,ReceivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName= ifnull(v_callTypeName,t1.CallTypeName) and (t1.CZcallStartTime <= t4.CreatedDate 
            and t1.CZcallEndTime >= t4.CreatedDate) and (t1.CallReceivedUserID=t1.CallEndUserID) 
             and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            group by ReceivedRoleName,ReceivedAgentID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104PrescriptionReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104PrescriptionReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
 select b.beneficiaryID, t.diagnosisProvided,t.drugForm,t.drugGroupName, t.drugName,
t.drugRoute,t.frequency,t.noOfDays,t.dosage,  t.timeToConsume, t.prescriptionID, t.remarks, 
t.validTill,t.userID,t.sideEffects,  t.createdDate,b.firstName "First Name", b.lastName, b.dob,
b.gender,c.phoneNo,b.healthCareWorker,b.permDistrict,b.permSubDistrict,b.permVillage, c.callTypeName,
c.callSubTypeName,t.benCallID, c.callEndUserID, c.ReceivedAgentID, c.callReceivedUserID,user.firstName "Agent Name"
            from fact_104prescription t
             LEFT JOIN dim_beneficiary b  on b.beneficiaryregid=t.beneficiaryregid
             LEFT JOIN fact_bencall c on c.bencallid=t.BenCallID
            left join dim_user user   on user.userid=c.callreceiveduserid
            where t.createdDate >=v_starttime and t.createdDate <=v_endtime
             and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
            and t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID)
            order by t.prescriptionID desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104psychiatrist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104psychiatrist`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

select distinct 
t.ActionByMO "Action By M O",t.ActionByPD "Action By P D",t.Allergies "Allergies",
t.DiseaseSummary "Disease Summary",t.SelecteDiagnosis "Selecte Diagnosis",
t.SelecteDiagnosisID "Selecte Diagnosis ID",t.AddedAdvice "Added Advice",
t.DiseaseSummaryID "Disease Summary ID",t.PrescriptionID "Prescription ID",
t.RequestID "Request ID",t.BenHistoryID "Ben History ID",b.FirstName "First Name",
b.LastName "Last Name",t.PatientName "Patient Name",t.IsSelf "Is Self",
b.dob "Date Of Birth",t.PatientAge "Patient Age",b.Gender "Gender",t.PatientGenderName "Patient Gender Name",
b.HealthCareWorker "Health Care Worker",c.PhoneNo "Phone Number",b.permDistrict "District",
b.PermSubDistrict "Sub District",b.PermVillage "Village",c.BenCallID "Ben Call ID",
c.CallTypeName "Call Type",c.CallSubTypeName "Call Sub Type",c.CallReceivedUserID "Call Received User ID",
c.CallEndUserID "Call End User ID",t.SymptomID "Symptom ID",t.ActionByHAO "Action By H A O",
t.ActionByCO "Action By C O",t.createddate "Date",b.BeneficiaryID "Beneficiary ID",
c.ReceivedAgentID "Agent ID",user.firstname "Agent Name"

			from fact_104benmedhistory t 
			LEFT JOIN dim_beneficiary b  on t.BeneficiaryRegID=b.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user 	on user.userid=c.CallReceivedUserID		
			 where 
             t.actionbyPD  is not null and
             t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
			    and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
			 order by t.createdDate desc; 
             
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104QAReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104QAReport`(v_starttime datetime,v_endtime datetime,
v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin


 /*   select * from fact_bencall as generatedAlias0 
    where ( generatedAlias0.createdDate between v_starttime and v_endtime )
and ( generatedAlias0.providerServiceMapID=ifnull(v_psmid,generatedAlias0.providerServiceMapID) ) 
and ( generatedAlias0.ReceivedagentID=ifnull(v_Agentid ,generatedAlias0.ReceivedagentID))
 and ( generatedAlias0.receivedRoleName=ifnull(v_receivedRoleName,generatedAlias0.receivedRoleName) );
 */
select  t1.CreatedDate "Date Of Call",t1.phoneno "Caller Phone Number"
,ReceivedAgentID "Agent ID",t2.FirstName "Agent Name",
ReceivedRoleName "Skill Set",t3.DiseaseSummary "Symptom",
t3.SelecteDiagnosis "Disease Summary Provided",
t1.remarks "Closure Remark",
			t1.CallTypeName "Call Type",
            t1.callsubtypename "Call Sub Type",
            t1.CZCallDuration "Call Duration"
            ,t1.RecordingFilePath "Recording File Path"
 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            where ReceivedRoleName= ifnull(v_receivedRoleName,ReceivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			-- and t1.CallTypeName=ifnull(v_callTypeName,t1.CallTypeName) 
            and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            group by ReceivedRoleName,ReceivedAgentID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104RandomPickup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104RandomPickup`(v_starttime datetime,v_endtime datetime,
v_callTypeName varchar(100),v_receivedRoleName varchar(100),
v_Agentid int(11),v_psmid int(11))
begin
/*select t1.CreatedDate,CallID,ReceivedAgentID,t2.FirstName,ReceivedRoleName,t3.DiseaseSummary,t3.SelecteDiagnosis,
			CallTypeName,CZCallDuration,RecordingFilePath*/
            
            select t1.CreatedDate "Date Of Call",CallID"Call ID",ReceivedAgentID "Agent ID",
t2.FirstName "Agent Name",ReceivedRoleName "Skill Set",t3.DiseaseSummary "Symptom",t3.SelecteDiagnosis
 "Disease Summary Provided",
			CallTypeName "Call Type",CZCallDuration "Call Duration",
            RecordingFilePath "Recording File Path"         
			 from db_reporting.fact_bencall t1
			LEFT JOIN db_reporting.dim_user t2 ON t1.CallReceivedUserID=t2.UserID 
            LEFT JOIN db_reporting.fact_104benmedhistory t3 ON t1.BenCallID=t3.BenCallID 
            where ReceivedRoleName= ifnull(v_receivedRoleName,ReceivedRoleName)
			 and t1.CreatedDate >=v_starttime and t1.CreatedDate <=v_endtime
			and t1.CallTypeName=ifnull(v_callTypeName,t1.CallTypeName) and (t1.CallReceivedUserID=t1.CallEndUserID) 
            and (t3.DiseaseSummary is not null or t3.SelecteDiagnosis is not null) 
            and t1.ReceivedAgentID=ifnull(v_Agentid,t1.ReceivedAgentID)
            and  t1.providerServiceMapID=ifnull(v_psmid,t1.providerServiceMapID)
            group by ReceivedRoleName,ReceivedAgentID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104SurveyorReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104SurveyorReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

select  distinct  t.question "Question", t.answer "Answer", t.score "Score",
 b.beneficiaryID "Beneficiary ID", b.firstName "First Name",
 b.lastName "Last Name", b.healthCareWorker "Health Care Worker",
			b.gender "Gender", b.dob "Date Of Birth", 
            b.permVillage "Village", b.permSubDistrict "Sub District"
            , b.permDistrict "District", c.callTypeName "Call Type", 
            c.callSubTypeName "Call Sub Type", c.phoneNo "Phone Number",
            c.ReceivedagentID "Agent ID", user.firstName "Agent Name"
			from fact_104bencdiresponse t
			LEFT JOIN dim_beneficiary b  on b.BeneficiaryRegID=t.BeneficiaryRegID
            LEFT JOIN fact_bencall c on c.BenCallID=t.BenCallID
			left join dim_user user on user.userid=c.CallReceivedUserID		 			
			 where t.providerServiceMapID=ifnull(v_psmid,t.providerServiceMapID) 	 
	        and t.createdDate >=v_starttime
             and t.createdDate <=v_endtime
              and c.ReceivedAgentID=ifnull(v_Agentid,c.ReceivedAgentID)
              order by t.createddate desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_104UnblockUserReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_104UnblockUserReport`(v_starttime datetime,v_endtime datetime,
v_psmid int(11))
begin
select phoneNo "Phone Number",createddate "Entry Date" from db_reporting.fact_phoneblock phoneBlock
where  phoneBlock.lastModDate >= v_starttime and phoneBlock.lastModDate <=v_endtime 
			 and phoneBlock.providerServiceMapID = ifnull(v_psmid,phoneBlock.providerServiceMapID) 
             and phoneBlock.isBlocked is false ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_1097AgegroupDistribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_1097AgegroupDistribution`(
v_starttime datetime,
v_endtime datetime,
v_statename varchar(100),
v_districtname varchar(100),
v_minage int(11),
v_maxage int(11),
v_psmrid int(11)
)
Begin
declare v_totalcount int(11) default 0;

Drop Temporary table if exists Temp_Output;
Drop Temporary table if exists Temp_RawData;
Drop Temporary table if exists Temp_Agegroup;

create temporary table temp_agegroup(AgegroupID int,Agegroup varchar(100),MinAge Int,MaxAge Int,IsReq Bit Default 1);
  
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(6,'All',0,150);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(1,'0 To 15',0,15);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(2,'15 To 24',15,24);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(3,'25 To 39',25,39);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(4,'40 To 59',40,59);
 insert into temp_agegroup(AgegroupID,Agegroup,MinAge,MaxAge) values(5,'59 To 150',59,150);
 
 If v_minage is not null and v_maxage Is not null Then
 Update temp_agegroup Set Isreq = 0 Where minage <> v_minage and maxage <> v_maxage and AgegroupID <> 6;
 End If;
 
Set v_minage = Case When v_minage Is null then 0 Else v_minage End;
Set v_maxage = Case When v_maxage Is null then 150 Else v_maxage End;

 
Create temporary table Temp_RawData as
Select
	AgeGroupID,MinAge,MaxAge
From 
(
Select 
	AgegroupID,
	Case 
		When AgegroupID = 1 Then 0
        When AgegroupID = 2 Then 15
        When AgegroupID = 3 Then 25
        When AgegroupID = 4 Then 40
        When AgegroupID = 5 Then 59
	End MinAge,
	Case 
		When AgegroupID = 1 Then 15
        When AgegroupID = 2 Then 24
        When AgegroupID = 3 Then 39
        When AgegroupID = 4 Then 59
        When AgegroupID = 5 Then 150
	End MaxAge
From
( 
	Select 
		Case when TIMESTAMPDIFF(year,DOB, now()) < 15 then 1
			when TIMESTAMPDIFF(year,DOB, now()) between 15 and 24 then 2
			when TIMESTAMPDIFF(year,DOB, now()) between 25 and 39 then 3
			when TIMESTAMPDIFF(year,DOB, now()) between 40 and 59 then 4
			else 5 
		End AgegroupID
	From db_reporting.fact_1097callsummary Cal
	inner join db_reporting.dim_1097beneficiary Ben on Cal.beneficiaryregid=Ben.beneficiaryregid
	where 
		Cal.createddate between v_starttime and v_endtime
		and Ben.permstate=ifnull(v_statename,Ben.permstate) 
		and Ben.permdistrict=ifnull(v_districtname,Ben.permdistrict)
		/*and Ben.Agegroup=ifnull(v_Agegroup,Ben.Agegroup)*/
		and Cal.ProviderServiceMapID=ifnull(v_psmrid,Cal.ProviderServiceMapID)
)OBJ)OBJ
Where 
	MinAge >= v_minage 
	And MaxAge <= v_maxage;
 
Select Count(1) Into v_totalcount From Temp_RawData;

Create Temporary Table Temp_Output
Select AgegroupID,MinAge,MaxAge,(Ifnull(Count(1),0) / v_totalcount) * 100.0 ServiceProvidedRatio,Count(1) Count 
From Temp_RawData
Group by 
	Concat(MinAge,' To ',MaxAge);
    
Insert into Temp_Output
(AgegroupID,MinAge,MaxAge,ServiceProvidedRatio,Count)
Select 6 AgegroupID,0,150,(Ifnull(Count(1),0) / v_totalcount ) * 100.0 ServiceProvidedRatio,Count(1) Count 
From Temp_RawData;

Select 
	Temp_Agegroup.Agegroup,
    Temp_Agegroup.MinAge minage,
    Temp_Agegroup.MaxAge maxage,
    Ifnull(Round(Temp_Output.ServiceProvidedRatio,2),0)ServiceProvidedRatio,
    ifnull(Temp_Output.Count,0) count 
from Temp_Agegroup
Left join Temp_Output on Temp_Output.AgeGroupID = Temp_Agegroup.AgeGroupID
Where 
	IsReq = 1
Order by 
	Temp_Agegroup.AgeGroupID;

Drop Temporary table if exists Temp_Output;
Drop Temporary table if exists Temp_RawData;
Drop Temporary table if exists Temp_Agegroup;
 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_1097calltypeReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_1097calltypeReport`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),
 v_CallType varchar(100),v_Callsubtype varchar(100),
 v_language varchar(100),
 v_gender varchar(100),v_SexualOrientationType varchar(100),
 v_psmrid int(11))
begin
 
 select distinct  t1.AgentID "Agent ID",t1.Rec_UserRole "User Role",
 t1.CallStartTime "Call Start Time",t1.CallEndTime "Call End Time",
 t1.CreatedDate "Call Date" ,hour(t1.createddate) "Call Hour",
 t1.CZCallID "Call ID",t1.PhoneNo "Phone No",t1.CallType "Call Type",t1.CallSubType "Call Sub Type",
 t1.Rec_UserName "User Name",
 -- t1. "User Location",
 t2.preferredLanguage "Preferred Language",t1.IsCalledEarlier "Is Called Earlier",
 t2.BeneficiaryID "Beneficiary ID",t2.Title "Title",
 -- t2.fi "Beneficiary Name",
 t2.DOB "Dob",
 TIMESTAMPDIFF(year,t2.DOB, now()) "Age",
 t2.Gender "Gender",t2.PermState "State",
 t2.PermDistrict "District",t2.PermSubDistrict "Sub District",
 -- t2.preferredLanguage "Preferred Language",
 t2.occupation "Occupation",
 t2.education "Education",t2.SexualOrientationType "Sexual Orientation",
 t2.MaritalStatus "Marital Status",t2.PlaceOfWork "Place Of Work",
 -- t1.iv "Ivrs Selected Language",
 t1.CO_Category "Category Name",t1.CO_SubCategory "Sub Category Name",
 t1.CO_DocumentName "Document Name",
  t1.CO_Category "Counselling Category Name",
  t1.CO_SubCategory "Counselling Sub Category Name",
  t1.CO_DocumentName "Counselling Document Name",
 t1.feedbackid "Feedback ID",
  f.feedback "Feedback",
 t1.remarks "Remarks",
 t1.createddate "Ben Created Date",
 t1.createdby "Beneficiary Created By",
 -- t1.cou "Counselling Category Name",
 -- t1. "Counselling Sub Category Name",
 t1.createdby "Username",t1.benoutboundPreferedLang "Outbound Requested Language",
 t1.callstarttime "Start Timestamp",t1.callendtime "End Timestamp",
 t1.calltransferremarks "Call Transfer Remarks",t1.isoutbound "Is Outbound",
 t1.CallType "Beneficiary Call Type",t1.CallSubType "Beneficiary Call Sub Type"
  from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 left join db_reporting.fact_feedback f on f.feedbackid=t1.feedbackid
 where t1.createddate between v_starttime and v_endtime
 and (t2.permstate=ifnull(v_statename,t2.permstate) or
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 or t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 or t2.gender=ifnull(v_gender,t2.gender)
 or t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType))
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID);
  
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_1097GenderDistribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_1097GenderDistribution`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_Gender varchar(100),v_psmrid int(11))
begin
 declare v_totalcount int(11) default 0;
 declare v_spr int(11);
 declare v_cnt int(11);
 select  count(1) into v_totalcount from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.Gender=ifnull(v_Gender,t2.Gender)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
  and t2.Gender is not null;
 
 if (v_Gender is null) then
 create temporary table temp1 as
 select g.GenderName,((ifnull(count,0))*100/v_totalcount) 
 "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_gender g left join (
 select t2.Gender,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.Gender=ifnull(v_Gender,t2.Gender)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.Gender)t on t.Gender=g.gendername
 group by g.GenderName;
 
 set sql_safe_updates=0;
 
 insert into temp1(Gendername) values ('All');
 select sum(`ServiceProvidedRatio`) into v_spr from temp1;
 select sum(`count`) into v_cnt from temp1;
 update temp1  
 set `ServiceProvidedRatio`=v_spr,`count`=v_cnt
 where Gendername='All';
 
 update temp1 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;
 
 update temp1 set `count`=0 where `count` is null;
 
 select Gendername,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp1;
 
 
 drop temporary table temp1;
 
 end if;
 
 if (v_Gender is not null) then
 create temporary table temp2 as
 select g.GenderName,((ifnull(count,0))*100/v_totalcount) 
 "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_gender g left join (
 select t2.Gender,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.Gender=ifnull(v_Gender,t2.Gender)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.Gender)t on t.Gender=g.gendername
 where g.gendername=v_gender
 group by g.GenderName;
 
 
 insert into temp2(Gendername) values ('All');
 
 set sql_safe_updates=0;
 
 select sum(ifnull(`ServiceProvidedRatio`,0)) into v_spr from temp2;
 select sum(`count`) into v_cnt from temp2;
 update temp2  
 set `ServiceProvidedRatio`=ifnull(v_spr,0),`count`=ifnull(v_cnt,0)
 where Gendername='All';
 
 update temp2 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;
 
 update temp2 set `count`=0 where `count` is null;
 
 select Gendername,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp2;
 
 
 drop temporary table temp2;
 
 end if;
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_1097LanguageDistribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_1097LanguageDistribution`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_language varchar(100),v_psmrid int(11))
begin
 declare v_totalcount int(11) default 0;
 declare v_spr int(11);
 declare v_cnt int(11);
 select  count(1) into v_totalcount from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
  and t2.preferredLanguage is not null;
 
 if (v_Language is null) then
 create temporary table temp1 as
 select g.LanguageName,((ifnull(count,0))*100/v_totalcount) 
 "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_language g left join (
 select t2.preferredLanguage,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.preferredLanguage)t on t.preferredLanguage=g.LanguageName
 group by g.LanguageName;
 
 set sql_safe_updates=0;
 
 insert into temp1(LanguageName) values ('All');
 select sum(`ServiceProvidedRatio`) into v_spr from temp1;
 select sum(`count`) into v_cnt from temp1;
 update temp1  
 set `ServiceProvidedRatio`=v_spr,`count`=v_cnt
 where LanguageName='All';
 
 update temp1 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;
 
 update temp1 set `count`=0 where `count` is null;
 
 select LanguageName,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp1;
 
 
 drop temporary table temp1;
 
 end if;
 
 if (v_Language is not null) then
 create temporary table temp2 as
 select g.LanguageName,((ifnull(count,0))*100/v_totalcount) "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_language g left join (
 select t2.preferredLanguage,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.preferredLanguage=ifnull(v_Language,t2.preferredLanguage)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.preferredLanguage)t on t.preferredLanguage=g.LanguageName
 where g.LanguageName=v_Language
 group by g.LanguageName;
 
 
 insert into temp2(LanguageName) values ('All');
 
 set sql_safe_updates=0;
 
 select sum(ifnull(`ServiceProvidedRatio`,0)) into v_spr from temp2;
 select sum(`count`) into v_cnt from temp2;
 update temp2  
 set `ServiceProvidedRatio`=ifnull(v_spr,0),`count`=ifnull(v_cnt,0)
 where LanguageName='All';
 
 update temp2 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;
 
 update temp2 set `count`=0 where `count` is null;
 
 select LanguageName,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp2;
 
 
 drop temporary table temp2;
 
 end if;
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_1097Sexualorientation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_1097Sexualorientation`(v_starttime datetime,v_endtime datetime,
 v_statename varchar(100),v_districtname varchar(100),v_SexualOrientationType varchar(100),v_psmrid int(11))
begin
 declare v_totalcount int(11) default 0;
 declare v_spr int(11);
 declare v_cnt int(11);
 select  count(1) into v_totalcount from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
  and t2.SexualOrientationType is not null;
 
 if (v_SexualOrientationType is null) then
 create temporary table temp1 as
 select g.SexualOrientation,((ifnull(count,0))*100/v_totalcount) "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_sexualorientation g left join (
 select t2.SexualOrientationType,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.SexualOrientationType)t on t.SexualOrientationType=g.SexualOrientation
 group by g.SexualOrientation;
 
 set sql_safe_updates=0;
 
 insert into temp1(SexualOrientation) values ('All');
 select sum(`ServiceProvidedRatio`) into v_spr from temp1;
 select sum(`count`) into v_cnt from temp1;
 update temp1  
 set `ServiceProvidedRatio`=v_spr,`count`=v_cnt
 where SexualOrientation='All';
 
 update temp1 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;
 
 update temp1 set `count`=0 where `count` is null;
 
 select SexualOrientation,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp1;
 
 
 drop temporary table temp1;
 
 end if;
 
 if (v_SexualOrientationType is not null) then
 create temporary table temp2 as
 select g.SexualOrientation,((ifnull(count,0))*100/v_totalcount) "ServiceProvidedRatio" ,ifnull(count,0) count
  from db_iemr.m_sexualorientation g left join (
 select t2.SexualOrientationType,  count(1) count from db_reporting.fact_1097callsummary t1
 inner join db_reporting.dim_1097beneficiary t2 on t1.beneficiaryregid=t2.beneficiaryregid
 where t1.createddate between v_starttime and v_endtime
 and t2.permstate=ifnull(v_statename,t2.permstate) and
 t2.permdistrict=ifnull(v_districtname,t2.permdistrict)
 and t2.SexualOrientationType=ifnull(v_SexualOrientationType,t2.SexualOrientationType)
 and t2.ProviderServiceMapID=ifnull(v_psmrid,t2.ProviderServiceMapID)
 group by t2.SexualOrientationType)t on t.SexualOrientationType=g.SexualOrientation
 where g.SexualOrientation=v_SexualOrientationType
 group by g.SexualOrientation;
 
 
 insert into temp2(SexualOrientation) values ('All');
 
 set sql_safe_updates=0;
 
 select sum(ifnull(`ServiceProvidedRatio`,0)) into v_spr from temp2;
 select sum(`count`) into v_cnt from temp2;
 update temp2  
 set `ServiceProvidedRatio`=ifnull(v_spr,0),`count`=ifnull(v_cnt,0)
 where SexualOrientation='All';
 
 update temp2 set ServiceProvidedRatio=0 where ServiceProvidedRatio is null;
 
 update temp2 set `count`=0 where `count` is null;
 
 select SexualOrientation,cast(`ServiceProvidedRatio` as UNSIGNED)`ServiceProvidedRatio`,
 cast(`count` as UNSIGNED) `count` from temp2;
 
 
 drop temporary table temp2;
 
 end if;
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_DistrictwisecallvolumeReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_DistrictwisecallvolumeReport`(v_starttime datetime,v_endtime datetime,v_psmid int(11), v_districtid int(11))
begin

select db.PermDistrictId,db.PermDistrict,fb.CallTypeID,fb.callsubtypename,db.Gender,count(1) callcount  
from db_reporting.fact_bencall fb  
inner join db_reporting.dim_beneficiary db on fb.BeneficiaryRegID=db.BeneficiaryRegID 
 where  fb.IsOutbound is false and
  fb.createddate>=v_starttime and fb.createddate<=v_endtime
  and fb.providerservicemapid=ifnull(v_psmid,fb.providerservicemapid) 
  and db.PermDistrictId = ifnull(v_districtid, db.PermDistrictId)
  and db.PermDistrictId is not null 
  and fb.CallTypeID is not null
group by db.PermDistrictId,fb.CallTypeID,db.gender;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_DistrictwisecallvolumeReport_pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_DistrictwisecallvolumeReport_pivot`(v_starttime datetime,v_endtime datetime,v_psmid int(11), v_districtid int(11))
begin

Declare LCL_SQL_STATEMENT TEXT; 

Drop temporary table if exists temp;  
 Drop temporary table if exists  temp2;
 
 
 create temporary table temp2 as
 select db.PermDistrictId,db.PermDistrict,fb.CallTypeID,
 replace(fb.callsubtypename,' ','')callsubtypename,
 replace(db.Gender,' ','') gender,count(1) callcount  
 from db_reporting.fact_bencall fb  
 inner join db_reporting.dim_beneficiary db on fb.BeneficiaryRegID=db.BeneficiaryRegID 
  where  fb.IsOutbound is false and
   fb.createddate>=v_starttime and fb.createddate<=v_endtime
   and fb.providerservicemapid=ifnull(v_psmid,fb.providerservicemapid) 
   and db.PermDistrictId = ifnull(v_districtid, db.PermDistrictId)
   and db.PermDistrictId is not null 
   and fb.CallTypeID is not null
 group by db.PermDistrictId,fb.CallTypeID,db.gender;
 
 
 create temporary table temp as
 select * from (
 select t.PermDistrict,gender,replace(m.calltype,' ','') callsubtypename ,sum(t.callcount) callcount from temp2 t 
 right join (select * from db_iemr.m_calltype 
 where providerservicemapid=ifnull(v_psmid,providerservicemapid) 
  and deleted is false ) m on replace(m.calltype,' ','') =t.callsubtypename
 group by t.PermDistrict,m.calltype,gender) a order by  callsubtypename;
 
 update temp Set callsubtypename = Replace(callsubtypename,'"','');
 update temp Set callsubtypename = Replace(callsubtypename,'|','');
 update temp Set callsubtypename = Replace(callsubtypename,'''','');
  
 
 SET SESSION group_concat_max_len = 1000000;
  
 SELECT
   GROUP_CONCAT(DISTINCT
     CONCAT(
       'ifnull(sum(case when callsubtypename = ''',
       `callsubtypename`,
       ''' then ifnull(callcount,0) end),0) ''',
       `callsubtypename`,''''
     )
   ) into LCL_SQL_STATEMENT
 FROM
   temp 
   Where trim(callsubtypename) REGEXP '^[A-Za-z0-9]+$';
           
 
SET @sql2 = CONCAT('create temporary table temp5 as SELECT  permdistrict,', LCL_SQL_STATEMENT,'  FROM temp group by permdistrict;');  
 if( @sql2 is not null) then
 PREPARE stmt FROM @sql2;
 execute stmt;
 DEALLOCATE PREPARE stmt;
  
 alter table temp5 add totalcalls int(11) default 0;
 alter table temp5 add male int(11) default 0;
 alter table temp5 add female int(11)  default 0;
 
 set sql_safe_updates=0;
 
 update temp5 t1
 inner join (select permdistrict,sum(callcount) callcount from temp 
 group by permdistrict ) t2 on t1.permdistrict=t2.permdistrict
 set t1.totalcalls=t2.callcount;
 
 
 update temp5 t1
 inner join (select permdistrict,sum(callcount) callcount from temp where gender='Male'
 group by permdistrict ) t2 on t1.permdistrict=t2.permdistrict
 set t1.male=t2.callcount;
 
 update temp5 t1
 inner join (select permdistrict,sum(callcount) callcount from temp where gender='FeMale'
 group by permdistrict ) t2 on t1.permdistrict=t2.permdistrict
 set t1.female=t2.callcount;
 
 
 select * from  temp5  where permdistrict is not null;
 
 Drop temporary table if exists temp5;
 end if;
 
 Drop temporary table if exists temp;  
 Drop temporary table if exists  temp2;
 
 
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDAashaHomeVisitGapReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDAashaHomeVisitGapReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fb.BeneficiaryRegID 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
fb.Remarks,
null 'District Feedback'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Still birth'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(304) and  fr.answer='NO'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fb.BeneficiaryRegID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr.Remarks,
null 'District Feedback'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Still birth'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(304) and fr.answer='NO';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDAbortionReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDAbortionReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer    Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer='Abortion')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr2.questionid in(283,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer   Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer='Abortion')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDAbortionReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDAbortionReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer    Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer='Abortion')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr2.questionid in(283,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer   Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer='Abortion')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDAbortionReport_Datacheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDAbortionReport_Datacheck`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

drop temporary table if exists temp_ECDAbortionReport;
create temporary table temp_ECDAbortionReport as
select distinct `Call Date`,`RCH ID`,`Phone No`,`Beneficiary Name`,`District Name`,`Block Name`,LMP,EDD,`Reason of incident`,`Period of occurrence`
from (

select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
-- fr2.Answer    Remarks
case when fr2.questionid=283 then fr2.Answer   end "Reason of incident",
case when fr2.questionid=284 then fr2.Answer   end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer='Abortion')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr2.questionid in(283,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
case when fr2.questionid=283 then fr2.Answer   end "Reason of incident",
case when fr2.questionid=284 then fr2.Answer   end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370,295) and answer='Abortion')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid -- and fr.bencallid=fr2.bencallid
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null)a;
             
                 drop temporary table if exists temp_ECDAbortionReport_2;
 create temporary table temp_ECDAbortionReport_2
 select * from temp_ECDAbortionReport;
 
 -- select * from temp_ECDAbortionReport;
 

 select distinct t1.`Call Date`,t1.`RCH ID`,t1.`Phone No`,t1.`Beneficiary Name`,t1.`District Name`,
 t1.`Block Name`,t1.LMP,t1.EDD,t1.`Reason of incident`,t2.`Period of occurrence` from temp_ECDAbortionReport t1
 inner join temp_ECDAbortionReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`RCH ID`=t2.`RCH ID`
 and t1.`Phone No`=t2.`Phone No`
 where t2.`Period of occurrence` is not null and t1.`Reason of incident` is not null ;
 
 drop temporary table if exists temp_ECDMiscarriageReport;
  drop temporary table if exists temp_ECDMiscarriageReport_2;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDAbsenceInVHSNDReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDAbsenceInVHSNDReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
fr2.answer 'Reason of not attending VHSND'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(305) and answer='NO')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
     and fr2.questionid in(310) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- fb.Remarks 'Reason of not attending VHSND'

 fr2.answer 'Reason of not attending VHSND'

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(305) and answer='NO')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(310) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDAbsenceInVHSNDReport_correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDAbsenceInVHSNDReport_correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,
fr.answer 'Reason of not attending VHSND'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
     and fr.questionid in(310) and fr.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- fb.Remarks 'Reason of not attending VHSND'

 fr.answer 'Reason of not attending VHSND'

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(310) and fr.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBabyDeathReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDBabyDeathReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Infant Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Baby Died'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Infant Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Baby Died '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null;
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBabyDeathReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDBabyDeathReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Infant Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Baby Died'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Infant Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Baby Died '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null;
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBabyDeathReport_Datacheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDBabyDeathReport_Datacheck`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDBabyDeathReport;
create temporary table temp_ECDBabyDeathReport as
select distinct `CALL Date`,`Registration No`,`PhoneNo of Beneficiary`,MotherName,`District`,`Block`,LMP,edd,
`Reason of incident`,`Period of occurrence` from (
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Infant Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Baby Died'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer Remarks

case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Infant Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Baby Died '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null)a;
             
             drop temporary table if exists temp_ECDBabyDeathReport_2;
 create temporary table temp_ECDBabyDeathReport_2
 select * from temp_ECDBabyDeathReport;
 
 select * from temp_ECDBabyDeathReport;
 select t1.`CALL Date`,t1.`Registration No`,t1.`PhoneNo of Beneficiary`,
t1.MotherName,t1.District,t1.`Block`,t1.LMP,t1.edd,
t1.`Reason of incident`,
t2.`Period of occurrence` from temp_ECDBabyDeathReport t1
 inner join temp_ECDBabyDeathReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`Registration No`=t2.`Registration No`
 and t1.`PhoneNo of Beneficiary`=t2.`PhoneNo of Beneficiary`
 where t2.`Period of occurrence` is not null and t1.`Reason of incident` is not null ;
 
 drop temporary table if exists temp_ECDBabyDeathReport;
  drop temporary table if exists temp_ECDBabyDeathReport_2;
 
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBeneficiarywisefollowupdetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDBeneficiarywisefollowupdetails`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
/*select `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,LMP,edd,
`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`,
sum(1+2+3+4+5+6+7+8+9+10+11+12+13+14+15+16) "Total number of services received by Beneficiaries"
*/

select   `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,LMP,edd `edd/dob`,
`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`,
   sum(`ecd1`+`ecd2`+`ecd3`+`ecd4`+`ecd5`+`ecd6`+`ecd7`+`ecd8`+`ecd9`+`ecd10`+`ecd11`+
   `ecd12`+`ecd13`+`ecd14`+`ecd15`+`ecd16`) 
     "Total number of services received by Beneficiaries"
    from (
select distinct 
-- fm.createddate as "Date",
fo.MotherID "RCHNO",-- new column
fm.Whom_PhoneNo "Phone No",
fm.Name "Beneficiary Name",
District_Name "District",
Block_Name "Block",
fm.LMP_Date LMP,
fm.edd ,
case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed'  then  fb.createddate end "ECD-1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  fb.createddate end "ECD-2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  fb.createddate end "ECD-3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  fb.createddate end "ECD-4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  fb.createddate end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  fb.createddate end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  fb.createddate end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  fb.createddate end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  fb.createddate end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  fb.createddate end "ECD-10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  fb.createddate end "ECD-11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  fb.createddate end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  fb.createddate end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  fb.createddate end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  fb.createddate end "ECD-15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  fb.createddate end "ECD-16",

case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed' then  1 else 0 end "ecd1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  1 else 0 end "ecd2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  1 else 0 end "ecd3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  1 else 0 end "ecd4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  1 else 0 end "ecd5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  1 else 0 end "ecd6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  1 else 0 end "ecd7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  1 else 0  end "ecd8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  1 else 0  end "ecd9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  1 else 0  end "ecd10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  1 else 0  end "ecd11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  1 else 0  end "ecd12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  1 else 0  end "ecd13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  1 else 0  end "ecd14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  1 else 0  end "ecd15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  1 else 0  end "ecd16"
from  fact_mctsoutboundcall fo 
left join(select * from fact_bencall where isverified is true 
and isCallAnswered is true  and iscalldisconnected is false)fb on fo.OBCallID=fb.OBCallID
-- inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
             and fb.CallEndTime is not null
            union all
 select distinct 
-- fm.createddate as "Date",
fo.ChildID "RCHNO",-- new column
fm.Phone_No "Phone No",
fm.Child_Name "Beneficiary Name",
District_Name "District",
Block_Name "Block",
null LMP,
fm.dob ,
case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed'  then  fb.createddate end "ECD-1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  fb.createddate end "ECD-2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  fb.createddate end "ECD-3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  fb.createddate end "ECD-4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  fb.createddate end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  fb.createddate end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  fb.createddate end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  fb.createddate end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  fb.createddate end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  fb.createddate end "ECD-10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  fb.createddate end "ECD-11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  fb.createddate end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  fb.createddate end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  fb.createddate end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  fb.createddate end "ECD-15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  fb.createddate end "ECD-16",


case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed' then  1 else 0 end "ecd1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  1 else 0 end "ecd2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  1 else 0 end "ecd3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  1 else 0 end "ecd4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  1 else 0 end "ecd5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  1 else 0 end "ecd6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  1 else 0 end "ecd7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  1 else 0  end "ecd8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  1 else 0  end "ecd9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  1 else 0  end "ecd10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  1 else 0  end "ecd11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  1 else 0  end "ecd12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  1 else 0  end "ecd13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  1 else 0  end "ecd14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  1 else 0  end "ecd15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  1 else 0  end "ecd16"       
from  fact_mctsoutboundcall fo 
left join(select * from fact_bencall where isverified is true 
and isCallAnswered is true and iscalldisconnected is false)fb on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
            and fb.CallEndTime is not null
            
 )a 
 group by  `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,LMP,edd,
`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`;
 
 -- group by  `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,
 -- LMP,edd
 /*`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`*/
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBeneficiarywisefollowupdetails_bkp_09112023` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDBeneficiarywisefollowupdetails_bkp_09112023`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
/*select `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,LMP,edd,
`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`,
sum(1+2+3+4+5+6+7+8+9+10+11+12+13+14+15+16) "Total number of services received by Beneficiaries"
*/

select   `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,LMP,edd `edd/dob`,
`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`,
   sum(`ecd1`+`ecd2`+`ecd3`+`ecd4`+`ecd5`+`ecd6`+`ecd7`+`ecd8`+`ecd9`+`ecd10`+`ecd11`+
   `ecd12`+`ecd13`+`ecd14`+`ecd15`+`ecd16`) 
     "Total number of services received by Beneficiaries"
    from (
select distinct 
-- fm.createddate as "Date",
fo.MotherID "RCHNO",-- new column
fm.Whom_PhoneNo "Phone No",
fm.Name "Beneficiary Name",
District_Name "District",
Block_Name "Block",
fm.LMP_Date LMP,
fm.edd ,
case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed'  then  fb.createddate end "ECD-1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  fb.createddate end "ECD-2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  fb.createddate end "ECD-3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  fb.createddate end "ECD-4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  fb.createddate end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  fb.createddate end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  fb.createddate end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  fb.createddate end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  fb.createddate end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  fb.createddate end "ECD-10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  fb.createddate end "ECD-11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  fb.createddate end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  fb.createddate end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  fb.createddate end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  fb.createddate end "ECD-15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  fb.createddate end "ECD-16",

case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed' then  1 else 0 end "ecd1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  1 else 0 end "ecd2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  1 else 0 end "ecd3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  1 else 0 end "ecd4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  1 else 0 end "ecd5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  1 else 0 end "ecd6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  1 else 0 end "ecd7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  1 else 0  end "ecd8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  1 else 0  end "ecd9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  1 else 0  end "ecd10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  1 else 0  end "ecd11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  1 else 0  end "ecd12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  1 else 0  end "ecd13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  1 else 0  end "ecd14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  1 else 0  end "ecd15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  1 else 0  end "ecd16"
from  fact_mctsoutboundcall fo 
left join(select * from fact_bencall where isverified is true 
and isCallAnswered is true  and iscalldisconnected is false)fb on fo.OBCallID=fb.OBCallID
-- inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
             and fb.CallEndTime is not null
            union all
 select distinct 
-- fm.createddate as "Date",
fo.ChildID "RCHNO",-- new column
fm.Phone_No "Phone No",
fm.Child_Name "Beneficiary Name",
District_Name "District",
Block_Name "Block",
null LMP,
fm.dob ,
case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed'  then  fb.createddate end "ECD-1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  fb.createddate end "ECD-2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  fb.createddate end "ECD-3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  fb.createddate end "ECD-4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  fb.createddate end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  fb.createddate end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  fb.createddate end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  fb.createddate end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  fb.createddate end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  fb.createddate end "ECD-10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  fb.createddate end "ECD-11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  fb.createddate end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  fb.createddate end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  fb.createddate end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  fb.createddate end "ECD-15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  fb.createddate end "ECD-16",


case when fo.outboundcalltype='ECD1'   and fo.callstatus='completed' then  1 else 0 end "ecd1",
case when fo.outboundcalltype='ECD2'   and fo.callstatus='completed' then  1 else 0 end "ecd2",
case when fo.outboundcalltype='ECD3'   and fo.callstatus='completed' then  1 else 0 end "ecd3",
case when fo.outboundcalltype='ECD4'   and fo.callstatus='completed' then  1 else 0 end "ecd4",
case when fo.outboundcalltype='ECD5'   and fo.callstatus='completed' then  1 else 0 end "ecd5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' then  1 else 0 end "ecd6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' then  1 else 0 end "ecd7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed' then  1 else 0  end "ecd8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed' then  1 else 0  end "ecd9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed' then  1 else 0  end "ecd10",
case when fo.outboundcalltype='ECD11'   and fo.callstatus='completed' then  1 else 0  end "ecd11",
case when fo.outboundcalltype='ECD12'   and fo.callstatus='completed' then  1 else 0  end "ecd12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' then  1 else 0  end "ecd13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed' then  1 else 0  end "ecd14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed' then  1 else 0  end "ecd15",
case when fo.outboundcalltype='ECD16'   and fo.callstatus='completed' then  1 else 0  end "ecd16"       
from  fact_mctsoutboundcall fo 
left join(select * from fact_bencall where isverified is true 
and isCallAnswered is true and iscalldisconnected is false)fb on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
            and fb.CallEndTime is not null
            
 )a 
 group by  `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,LMP,edd,
`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`;
 
 -- group by  `RCHNO`,`Phone No`,`Beneficiary Name`,`District`,`Block`,
 -- LMP,edd
 /*`ECD-1`,`ECD-2`,`ECD-3`,`ECD-4`,`ECD-5`,`ECD-6`,`ECD-7`,`ECD-8`,`ECD-9`,`ECD-10`,`ECD-11`,
`ECD-12`,`ECD-13`,`ECD-14`,`ECD-15`,`ECD-16`*/
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBirthDefectReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDBirthDefectReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
-- fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer congentialanomalies
-- fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
-- inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
-- and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.congentialanomalies is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(388) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
-- null LMP,
fm.dob ,
fr2.Answer congentialanomalies

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.congentialanomalies is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(388) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDBirthDefectReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDBirthDefectReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
-- fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer congentialanomalies
-- fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
-- inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
-- and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.congentialanomalies is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(388) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
-- null LMP,
fm.dob ,
fr2.Answer congentialanomalies

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.congentialanomalies is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(388) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCalciumIFATabNonadherenceReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCalciumIFATabNonadherenceReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,

fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(335,334) and fr.answer='No'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr.Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
              and fr.questionid in(335,334)and fr.answer='No';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallDetailsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCallDetailsReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin



select * from (
select distinct 
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallDetailsReport_16042024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCallDetailsReport_16042024`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin



select * from (
select distinct
fo.allocateduserid, r.rolename,fo.OutboundCallType "CallCategory2",
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join db_iemr.m_user u on u.userid=fo.allocateduserid
inner join db_iemr.m_userservicerolemapping usr on usr.userid=u.userid
inner join db_iemr.m_role r on r.roleid=usr.roleid
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fo.allocateduserid,r.rolename,fo.OutboundCallType "CallCategory2",
 fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join db_iemr.m_user u on u.userid=fo.allocateduserid
inner join db_iemr.m_userservicerolemapping usr on usr.userid=u.userid
inner join db_iemr.m_role r on r.roleid=usr.roleid
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a where rolename='ANM' and CallCategory2='introductory';
     
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallDetailsReport_bkp_03052024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCallDetailsReport_bkp_03052024`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin


 drop table if exists temp_UniqueDetailsReport;
 create temporary table temp_UniqueDetailsReport as
select * from (
select distinct fb.bencallid,
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.bencallid, fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
     -- select * from temp_UniqueDetailsReport;   
     
       drop temporary table if exists temp_UniqueDetailsReport2;
	create temporary table temp_UniqueDetailsReport2 as
select * from temp_UniqueDetailsReport;    

 -- select * from temp_UniqueDetailsReport2; 
  
  select `User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,t1.`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`, `edd/dob`,
 t1.`RegistrationNO`,`CallCategory`,`Call status`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks` from temp_UniqueDetailsReport t1 inner join (
select max(bencallid) max_bencallid,`Phone Number`
from temp_UniqueDetailsReport2
group by `Phone Number`)t2 on t1.bencallid=t2.max_bencallid and t1.`Phone Number`=t2.`Phone Number`;
       
   
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallDetailsReport_bkp_09112023` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCallDetailsReport_bkp_09112023`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin



select * from (
select distinct 
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallDetailsReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCallDetailsReport_Correction`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin



select * from (
select distinct 
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  ((reasonForCallNotAnswered is null) or (length(trim(reasonForCallNotAnswered))=0 )) 
 and iscalldisconnected is true then "Disconnected Call"
 when   ((reasonForCallNotAnswered is null) or (length(trim(reasonForCallNotAnswered))=0 )) 
 and iscalldisconnected is false and  fb.iscallanswered is true then "Answered Call" 
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false  then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  ((reasonForCallNotAnswered is null) or (length(trim(reasonForCallNotAnswered))=0 )) 
 and iscalldisconnected is true then "Disconnected Call"
 when   ((reasonForCallNotAnswered is null) or (length(trim(reasonForCallNotAnswered))=0 )) 
 and iscalldisconnected is false and  fb.iscallanswered is true then "Answered Call" 
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallSummaryReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCallSummaryReport`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),
v_role varchar(50))
begin

select `Date`,count(callid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",
sum(`Number Busy/No reply/Out of Reach/Switched off/Not Connnected`) "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
sum(`Invalid Number/Out of order/Wrong number/Other Numbers`) "Invalid Number/Out of order/Wrong number/Other Numbers",
-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16",
sum(`Miscarriage/Abortion/still birth/Baby died etc`) "Miscarriage/Abortion/still birth/Baby died etc" 
from (
select 
distinct  date(fb.CreatedDate) as "Date",
fb.BenCallID "CallId",
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end as "Answeredcalls",

case when fb.reasonForCallNotAnswered in('Number busy','No reply','Out of Reach','Switched off','Call not connected')
and fb.isCallAnswered is not true	 then 1 else 0 end "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
case when fb.reasonForCallNotAnswered in('Invalid number','Out of service')
	and fb.isCallAnswered is not true then 1 else 0 end "Invalid Number/Out of order/Wrong number/Other Numbers",
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' then  1 else 0 end "ECD-0",
case when fo.outboundcalltype='ECD1'  and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2'  and fo.callstatus='completed'  and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4'  and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5'  and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-10",
case when fo.outboundcalltype='ECD11'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-11",
case when fo.outboundcalltype='ECD12'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0  end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-15",
case when fo.outboundcalltype='ECD16'  and fo.callstatus='completed'  and fb.isverified is true  then  1 else 0  end "ECD-16",
-- case when fo.outboundcalltype='ECD17' then  1 else 0  end "ECD-17",
-- case when fo.outboundcalltype='ECD18' then  1 else 0  end "ECD-18",
-- case when fo.outboundcalltype='ECD19' then  1 else 0  end "ECD-19",
-- case when fo.outboundcalltype='ECD20' then  1 else 0  end "ECD-20",
-- case when fo.outboundcalltype='ECD21' then  1 else 0  end "ECD-21",

case when fb.reasonForNoFurtherCalls in('Mother has abortion','Still birth','Dead','Reallocate to different state')
	 then 1 else 0 end "Miscarriage/Abortion/still birth/Baby died etc"
 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and callendtime is not null
	and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
	and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
	and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
    and fb.ReceivedRoleName=v_role  and fb.CallEndTime is not null
  union all
select 
distinct  date(fb.CreatedDate) as "Date",
fb.BenCallID "CallId",

/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end as "Answeredcalls",

case when fb.reasonForCallNotAnswered in('Number busy','No reply','Out of Reach','Switched off','Call not connected')
	 then 1 else 0 end "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
case when fb.reasonForCallNotAnswered in('Invalid number','Out of service')
	 then 1 else 0 end "Invalid Number/Out of order/Wrong number/Other Numbers",
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' then  1 else 0 end "ECD-0",
case when fo.outboundcalltype='ECD1'  and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-8",
case when fo.outboundcalltype='ECD9'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-9",
case when fo.outboundcalltype='ECD10'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-10",
case when fo.outboundcalltype='ECD11'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0  end "ECD-11",
case when fo.outboundcalltype='ECD12'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0  end "ECD-12",
case when fo.outboundcalltype='ECD13'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-13",
case when fo.outboundcalltype='ECD14'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-14",
case when fo.outboundcalltype='ECD15'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-15",
case when fo.outboundcalltype='ECD16'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-16",

-- case when fo.outboundcalltype='ECD17' then  1 else 0  end "ECD-17",
-- case when fo.outboundcalltype='ECD18' then  1 else 0  end "ECD-18",
-- case when fo.outboundcalltype='ECD19' then  1 else 0  end "ECD-19",
-- case when fo.outboundcalltype='ECD20' then  1 else 0  end "ECD-20",
-- case when fo.outboundcalltype='ECD21' then  1 else 0  end "ECD-21",

case when fb.reasonForNoFurtherCalls in('Mother has abortion','Still birth','Dead','Reallocate to different state')
	 then 1 else 0 end "Miscarriage/Abortion/still birth/Baby died etc"

  from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null)a group by `Date`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallSummaryReport_bkp_06112023` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCallSummaryReport_bkp_06112023`(v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),
v_role varchar(50))
begin

select `Date`,count(callid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",
sum(`Number Busy/No reply/Out of Reach/Switched off/Not Connnected`) "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
sum(`Invalid Number/Out of order/Wrong number/Other Numbers`) "Invalid Number/Out of order/Wrong number/Other Numbers",
-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16",
sum(`Miscarriage/Abortion/still birth/Baby died etc`) "Miscarriage/Abortion/still birth/Baby died etc" 
from (
select 
distinct  date(fb.CreatedDate) as "Date",
fb.BenCallID "CallId",
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end as "Answeredcalls",

case when fb.reasonForCallNotAnswered in('Number busy','No reply','Out of Reach','Switched off','Call not connected')
	 then 1 else 0 end "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
case when fb.reasonForCallNotAnswered in('Invalid number','Out of service')
	 then 1 else 0 end "Invalid Number/Out of order/Wrong number/Other Numbers",
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' then  1 else 0 end "ECD-0",
case when fo.outboundcalltype='ECD1'  and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2'  and fo.callstatus='completed'  and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4'  and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5'  and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-8",
case when fo.outboundcalltype='ECD9'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-9",
case when fo.outboundcalltype='ECD10'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-10",
case when fo.outboundcalltype='ECD11'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-11",
case when fo.outboundcalltype='ECD12'  and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-12",
case when fo.outboundcalltype='ECD13'   and fo.callstatus='completed' and fb.isverified is true then  1 else 0  end "ECD-13",
case when fo.outboundcalltype='ECD14'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-14",
case when fo.outboundcalltype='ECD15'   and fo.callstatus='completed'  and fb.isverified is true then  1 else 0  end "ECD-15",
case when fo.outboundcalltype='ECD16'  and fo.callstatus='completed'  and fb.isverified is true  then  1 else 0  end "ECD-16",
-- case when fo.outboundcalltype='ECD17' then  1 else 0  end "ECD-17",
-- case when fo.outboundcalltype='ECD18' then  1 else 0  end "ECD-18",
-- case when fo.outboundcalltype='ECD19' then  1 else 0  end "ECD-19",
-- case when fo.outboundcalltype='ECD20' then  1 else 0  end "ECD-20",
-- case when fo.outboundcalltype='ECD21' then  1 else 0  end "ECD-21",

case when fb.reasonForNoFurtherCalls in('Mother has abortion','Still birth','Dead','Reallocate to different state')
	 then 1 else 0 end "Miscarriage/Abortion/still birth/Baby died etc"
 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and callendtime is not null
	and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
	and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
	and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
    and fb.ReceivedRoleName=v_role  and fb.CallEndTime is not null
  union all
select 
distinct  date(fb.CreatedDate) as "Date",
fb.BenCallID "CallId",

/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end as "Answeredcalls",

case when fb.reasonForCallNotAnswered in('Number busy','No reply','Out of Reach','Switched off','Call not connected')
	 then 1 else 0 end "Number Busy/No reply/Out of Reach/Switched off/Not Connnected",
case when fb.reasonForCallNotAnswered in('Invalid number','Out of service')
	 then 1 else 0 end "Invalid Number/Out of order/Wrong number/Other Numbers",
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' then  1 else 0 end "ECD-0",
case when fo.outboundcalltype='ECD1'  and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-8",
case when fo.outboundcalltype='ECD9'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-9",
case when fo.outboundcalltype='ECD10'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-10",
case when fo.outboundcalltype='ECD11'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0  end "ECD-11",
case when fo.outboundcalltype='ECD12'  and  fo.callstatus='completed'   and fb.isverified is true    then  1 else 0  end "ECD-12",
case when fo.outboundcalltype='ECD13'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-13",
case when fo.outboundcalltype='ECD14'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-14",
case when fo.outboundcalltype='ECD15'   and  fo.callstatus='completed'   and fb.isverified is true   then  1 else 0  end "ECD-15",
case when fo.outboundcalltype='ECD16'  and  fo.callstatus='completed'   and fb.isverified is true     then  1 else 0  end "ECD-16",

-- case when fo.outboundcalltype='ECD17' then  1 else 0  end "ECD-17",
-- case when fo.outboundcalltype='ECD18' then  1 else 0  end "ECD-18",
-- case when fo.outboundcalltype='ECD19' then  1 else 0  end "ECD-19",
-- case when fo.outboundcalltype='ECD20' then  1 else 0  end "ECD-20",
-- case when fo.outboundcalltype='ECD21' then  1 else 0  end "ECD-21",

case when fb.reasonForNoFurtherCalls in('Mother has abortion','Still birth','Dead','Reallocate to different state')
	 then 1 else 0 end "Miscarriage/Abortion/still birth/Baby died etc"

  from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null)a group by `Date`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallUniqueDetailsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCallUniqueDetailsReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin


 drop table if exists temp_UniqueDetailsReport;
 create temporary table temp_UniqueDetailsReport as
select * from (
select distinct fb.bencallid,
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd `edd/dob`,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
  /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is true -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
           union all
select distinct fb.bencallid, fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.iscallanswered is true and fb.isverified is true
and fb.isCallDisconnected is false then "Answered Call" 
 when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
end "Call Status",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
 /* New column alternative No*/
left join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
where fb.IsMother is false -- and callendtime is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  and fb.CallEndTime is not null
            )a;
     
     -- select * from temp_UniqueDetailsReport;   
     
       drop temporary table if exists temp_UniqueDetailsReport2;
	create temporary table temp_UniqueDetailsReport2 as
select * from temp_UniqueDetailsReport;    

 -- select * from temp_UniqueDetailsReport2; 
  
  select `User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,t1.`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`, `edd/dob`,
 t1.`RegistrationNO`,`CallCategory`,`Call status`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks` from temp_UniqueDetailsReport t1 inner join (
select max(bencallid) max_bencallid,`Phone Number`
from temp_UniqueDetailsReport2
group by `Phone Number`)t2 on t1.bencallid=t2.max_bencallid and t1.`Phone Number`=t2.`Phone Number`;
       
   
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallUniqueDetailsReport_03052024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCallUniqueDetailsReport_03052024`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

 drop table if exists temp_UniqueDetailsReport;
 create temporary table temp_UniqueDetailsReport as
select distinct a.bencallid,`User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`,edd `edd/dob`,
 `RegistrationNO`,`CallCategory`,`Callstatus`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks`
 from (
select t1.* from (select distinct 
fb.bencallid bencallid,fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end 
"Callstatus",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
 
 /* New column alternative No */
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
 
where fb.IsMother is true -- and fo.callstatus='completed'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
            group by 
        fb.ReceivedAgentID ,
fb.calltime,
fm.District_Name ,
fm.Block_Name ,
fm.PHC_Name ,fm.SubCenter_Name,
fm.Village_Name ,fm.Address ,
fb.PhoneNo ,fm.PhoneNo_Of_Whom ,bmc.PhoneNum1,
fm.Husband_Name ,fm.name ,
fm.LMP_Date ,
fm.edd,fm.MCTSID_no ,fo.OutboundCallType ,
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end ,
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk ,fr.reasonsforhrp ,
fb.CZcallDuration ,fb.Remarks 

)t1
inner join fact_bencall t2 on t1.bencallid=t2.bencallid   and t2.CallEndTime is not null         
           union all
           select t1.* from (
select distinct 
max(fb.bencallid) bencallid,
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
  
  
 /* New column alternative No */
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
 
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
             and fb.CallEndTime is not null
          group by   
fb.ReceivedAgentID ,
fb.calltime ,
fm.District_Name ,
fm.Block_Name ,
fm.PHC_Name ,fm.SubCenter_Name ,
fm.Village_Name ,fm.Address ,
fb.PhoneNo ,fm.Phone_No_of ,bmc.PhoneNum1,
'' ,fm.Mother_Name,
'' ,
fm.dob,fo.childid ,
fo.OutboundCallType ,
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end ,
fb.IsVerified,
fo.ishrni ,fr.reasonsforhrni ,
fb.CZcallDuration ,fb.Remarks 

            )t1
            inner join fact_bencall t2 on t1.bencallid=t2.bencallid and t2.CallEndTime is not null
            )a;
  --   alter table temp_UniqueDetailsReport add status int(11);
     
     drop temporary table if exists temp_UniqueDetailsReport2;
	create temporary table temp_UniqueDetailsReport2 as
select * from temp_UniqueDetailsReport;    

select * from temp_UniqueDetailsReport2; 
  
  select `User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,t1.`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`, `edd/dob`,
 t1.`RegistrationNO`,`CallCategory`,`Callstatus`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks` from temp_UniqueDetailsReport t1 inner join (
select max(bencallid) max_bencallid,`Phone Number` 
from temp_UniqueDetailsReport2
group by `Phone Number`)t2 on t1.bencallid=t2.max_bencallid and t1.`Phone Number`=t2.`Phone Number`;
       
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallUniqueDetailsReport_bkp_09052024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCallUniqueDetailsReport_bkp_09052024`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

 drop table if exists temp_UniqueDetailsReport;
 create temporary table temp_UniqueDetailsReport as
select distinct a.bencallid,`User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`,edd `edd/dob`,
 `RegistrationNO`,`CallCategory`,`Callstatus`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks`
 from (
select t1.* from (select distinct 
fb.bencallid bencallid,fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end 
"Callstatus",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
 
 /* New column alternative No */
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
 
where fb.IsMother is true -- and fo.callstatus='completed'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
            group by 
        fb.ReceivedAgentID ,
fb.calltime,
fm.District_Name ,
fm.Block_Name ,
fm.PHC_Name ,fm.SubCenter_Name,
fm.Village_Name ,fm.Address ,
fb.PhoneNo ,fm.PhoneNo_Of_Whom ,bmc.PhoneNum1,
fm.Husband_Name ,fm.name ,
fm.LMP_Date ,
fm.edd,fm.MCTSID_no ,fo.OutboundCallType ,
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end ,
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk ,fr.reasonsforhrp ,
fb.CZcallDuration ,fb.Remarks 

)t1
inner join fact_bencall t2 on t1.bencallid=t2.bencallid   and t2.CallEndTime is not null         
           union all
           select t1.* from (
select distinct 
max(fb.bencallid) bencallid,
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
  
  
 /* New column alternative No */
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
 
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
             and fb.CallEndTime is not null
          group by   
fb.ReceivedAgentID ,
fb.calltime ,
fm.District_Name ,
fm.Block_Name ,
fm.PHC_Name ,fm.SubCenter_Name ,
fm.Village_Name ,fm.Address ,
fb.PhoneNo ,fm.Phone_No_of ,bmc.PhoneNum1,
'' ,fm.Mother_Name,
'' ,
fm.dob,fo.childid ,
fo.OutboundCallType ,
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end ,
fb.IsVerified,
fo.ishrni ,fr.reasonsforhrni ,
fb.CZcallDuration ,fb.Remarks 

            )t1
            inner join fact_bencall t2 on t1.bencallid=t2.bencallid and t2.CallEndTime is not null
            )a;
  --   alter table temp_UniqueDetailsReport add status int(11);
     
     drop temporary table if exists temp_UniqueDetailsReport2;
	create temporary table temp_UniqueDetailsReport2 as
select * from temp_UniqueDetailsReport;    

-- select * from temp_UniqueDetailsReport2; 
  
  select `User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`, `edd/dob`,
 t1.`RegistrationNO`,`CallCategory`,`Callstatus`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks` from temp_UniqueDetailsReport t1 inner join (
select max(bencallid) max_bencallid,registrationno 
from temp_UniqueDetailsReport2
group by registrationno)t2 on t1.bencallid=t2.max_bencallid;
       
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCallUniqueDetailsReport_bkp_09112023` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCallUniqueDetailsReport_bkp_09112023`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

 drop table if exists temp_UniqueDetailsReport;
 create temporary table temp_UniqueDetailsReport as
select distinct a.bencallid,`User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`,edd `edd/dob`,
 `RegistrationNO`,`CallCategory`,`Callstatus`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks`
 from (
select t1.* from (select distinct 
fb.bencallid bencallid,fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
fm.Husband_Name "Husband Name",fm.name Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end 
"Callstatus",
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk "Is HRP/ISHRNI",fr.reasonsforhrp "HRP/HRNI indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
left join (select * from fact_mctscallresponse 
where reasonsforhrp is not null)fr on fr.obcallid=fb.obcallid
 and fr.bencallid=fb.bencallid
 
 /* New column alternative No */
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
 
where fb.IsMother is true -- and fo.callstatus='completed'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime 
            and fb.createdDate <=v_endtime and fb.CallEndTime is not null
            group by 
        fb.ReceivedAgentID ,
fb.calltime,
fm.District_Name ,
fm.Block_Name ,
fm.PHC_Name ,fm.SubCenter_Name,
fm.Village_Name ,fm.Address ,
fb.PhoneNo ,fm.PhoneNo_Of_Whom ,bmc.PhoneNum1,
fm.Husband_Name ,fm.name ,
fm.LMP_Date ,
fm.edd,fm.MCTSID_no ,fo.OutboundCallType ,
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end ,
fb.IsVerified,
-- fm.High_Risk "Is HRP",fm.High_Risk_Reason "HRP indicators",
fo.IsHighRisk ,fr.reasonsforhrp ,
fb.CZcallDuration ,fb.Remarks 

)t1
inner join fact_bencall t2 on t1.bencallid=t2.bencallid   and t2.CallEndTime is not null         
           union all
           select t1.* from (
select distinct 
max(fb.bencallid) bencallid,
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
bmc.PhoneNum1 "Alternative No",
'' "Husband Name",fm.Mother_Name,
'' LMPDate,
fm.dob,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,
fo.ishrni "Is HRP",fr.reasonsforhrni "HRP indicators",
fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
left join (select * from fact_mctscallresponse 
where reasonsforhrni is not null)fr on fr.obcallid=fb.obcallid
  and fr.bencallid=fb.bencallid
  
  
 /* New column alternative No */
right join 
(select ib.*,bm.BenRegId from db_identity.i_beneficiarycontacts ib 
left join db_identity.i_beneficiarymapping bm  on ib.BenContactsID=bm.BenContactsId)bmc
on fb.BeneficiaryRegID=bmc.BenRegId
 /* New column alternative No*/
 
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
             and fb.CallEndTime is not null
          group by   
fb.ReceivedAgentID ,
fb.calltime ,
fm.District_Name ,
fm.Block_Name ,
fm.PHC_Name ,fm.SubCenter_Name ,
fm.Village_Name ,fm.Address ,
fb.PhoneNo ,fm.Phone_No_of ,bmc.PhoneNum1,
'' ,fm.Mother_Name,
'' ,
fm.dob,fo.childid ,
fo.OutboundCallType ,
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end ,
fb.IsVerified,
fo.ishrni ,fr.reasonsforhrni ,
fb.CZcallDuration ,fb.Remarks 

            )t1
            inner join fact_bencall t2 on t1.bencallid=t2.bencallid and t2.CallEndTime is not null
            )a;
  --   alter table temp_UniqueDetailsReport add status int(11);
     
     drop temporary table if exists temp_UniqueDetailsReport2;
	create temporary table temp_UniqueDetailsReport2 as
select * from temp_UniqueDetailsReport;    

-- select * from temp_UniqueDetailsReport2; 
  
  select `User ID`,`Call Time`,`Mother District`,
 `Health Block Name`,`PHC Name`,`Sub Center Name`,
 `Village Name`,`Address`,`Phone Number`,`Phone No Of Whom`,`Alternative No`,
 `Husband Name`,Mother_Name,`LMP Date`, `edd/dob`,
 t1.`RegistrationNO`,`CallCategory`,`Callstatus`,IsVerified,
 `Is HRP/ISHRNI`,`HRP/HRNI indicators`,
`CallDuration`,`Remarks` from temp_UniqueDetailsReport t1 inner join (
select max(bencallid) max_bencallid,registrationno 
from temp_UniqueDetailsReport2
group by registrationno)t2 on t1.bencallid=t2.max_bencallid;
       
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCumulativeDistrictReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDCumulativeDistrictReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),v_role varchar(50))
begin



select District,count(bencallid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",

-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16" from (
select 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16"

/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
fm.Husband_Name "Husband Name",'' Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            union all
select distinct 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,

-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16"
/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
'' "Husband Name",fm.Mother_Name,
'' "LMP Date",
'' edd,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            )a group by District;
            
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCumulativeDistrictReport_09112023` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCumulativeDistrictReport_09112023`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),v_role varchar(50))
begin



select District,count(bencallid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",

-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16" from (
select 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16"

/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
fm.Husband_Name "Husband Name",'' Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            union all
select distinct 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,

-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16"
/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
'' "Husband Name",fm.Mother_Name,
'' "LMP Date",
'' edd,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            )a group by District;
            
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDCumulativeDistrictReport_bkp_09112023` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDCumulativeDistrictReport_bkp_09112023`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11),v_role varchar(50))
begin



select District,count(bencallid) "Calls Made",sum(AnsweredCalls) "answered call"
,sum(VerifiedCalls) "verified call",

-- sum(`ECD-0`) "0",
sum(`ECD-1`) "1",
sum(`ECD-2`) "2",sum(`ECD-3`) "3",sum(`ECD-4`) "4",sum(`ECD-5`) "5",
sum(`ECD-6`) "6",sum(`ECD-7`) "7",sum(`ECD-8`) "8",sum(`ECD-9`) "9",
sum(`ECD-10`) "10",sum(`ECD-11`) "11",sum(`ECD-12`) "12",sum(`ECD-13`) "13",
sum(`ECD-14`) "14",sum(`ECD-15`) "15",sum(`ECD-16`) "16" from (
select 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,
-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16"

/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.PhoneNo_Of_Whom "Phone No Of Whom",
fm.Husband_Name "Husband Name",'' Mother_Name,
fm.LMP_Date "LMP Date",
fm.edd,fm.MCTSID_no "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            union all
select distinct 
distinct fm.District_Name District,fb.bencallid,
/* new validation for isCallAnswered */
case when fb.isCallAnswered is true then (case when fb.IsVerified is true then 1 else 0 end) else 'N/A' end as "Verifiedcalls",
case when fb.isCallAnswered is true then 1 else 0 end AnsweredCalls,

-- case when fo.outboundcalltype='Introductory' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-0",

case when fo.outboundcalltype='ECD1' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-1",
case when fo.outboundcalltype='ECD2' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-2",
case when fo.outboundcalltype='ECD3' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-3",
case when fo.outboundcalltype='ECD4' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-4",
case when fo.outboundcalltype='ECD5' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-5",
case when fo.outboundcalltype='ECD6' and fo.callstatus='completed' and fb.isverified is true   then  1 else 0 end "ECD-6",
case when fo.outboundcalltype='ECD7' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-7",
case when fo.outboundcalltype='ECD8' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-8",
case when fo.outboundcalltype='ECD9' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-9",
case when fo.outboundcalltype='ECD10' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-10",
case when fo.outboundcalltype='ECD11' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-11",
case when fo.outboundcalltype='ECD12' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-12",
case when fo.outboundcalltype='ECD13' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-13",
case when fo.outboundcalltype='ECD14' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-14",
case when fo.outboundcalltype='ECD15' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-15",
case when fo.outboundcalltype='ECD16' and fo.callstatus='completed' and fb.isverified is true  then  1 else 0 end "ECD-16"
/*
fb.ReceivedAgentID "User ID",-- 'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "District Name",-- '' ChildDistrict,
fm.Block_Name "Health Block Name",
fm.PHC_Name "PHC Name",fm.SubCenter_Name "Sub Center Name",
fm.Village_Name "Village Name",fm.Address "Address",
fb.PhoneNo "Phone Number",fm.Phone_No_of "Phone No Of Whom",
'' "Husband Name",fm.Mother_Name,
'' "LMP Date",
'' edd,fo.childid "RegistrationNO",fo.OutboundCallType "CallCategory",
case when fb.IsVerified is true then fb.CallSubTypeName else reasonForCallNotAnswered end "Callstatus",
fb.IsVerified,fb.CZcallDuration "CallDuration",fb.Remarks "Remarks"*/
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fb.ReceivedRoleName=v_role and fb.CallEndTime is not null
            )a group by District;
            
        
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDDeliveryStatusReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDDeliveryStatusReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(372) and fr.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
 null LMP,
fm.dob ,
fr.Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(372) and fr.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDDeliveryStatusReport_Datacheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDDeliveryStatusReport_Datacheck`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDDeliveryStatusReport;
create temporary table temp_ECDDeliveryStatusReport as

select distinct `Call Date`,`RCH ID`,`Phone No`,`Beneficiary Name`,`District Name`,`Block Name`,LMP,EDD,`Place of Delivery`,`Mode of Delivery`
from (
select date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
-- fr.Remarks
case when fr.questionid=372 then fr.Answer end "Place of Delivery",
case when fr.questionid=373 then fr.Answer end "Mode of Delivery"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(372,373) and fr.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,-- need to cross check once
fm.dob ,
-- fr.Remarks

case when fr.questionid=372 then fr.Answer end "Place of Delivery",
case when fr.questionid=373 then fr.Answer end "Mode of Delivery"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(372,373) and fr.answer is not null)a;
             
             drop temporary table if exists temp_ECDDeliveryStatusReport_2;
 create temporary table temp_ECDDeliveryStatusReport_2
 select * from temp_ECDDeliveryStatusReport;
 

 select t1.`Call Date`,t1.`RCH ID`,t1.`Phone No`,t1.`Beneficiary Name`,t1.`District Name`,
 t1.`Block Name`,t1.LMP,t1.EDD,t1.`Place of Delivery`,t2.`Mode of Delivery` from temp_ECDDeliveryStatusReport t1
 inner join temp_ECDDeliveryStatusReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`RCH ID`=t2.`RCH ID`
 and t1.`Phone No`=t2.`Phone No`
 where t2.`Mode of Delivery` is not null and t1.`Place of Delivery` is not null ;
 
 drop temporary table if exists temp_ECDDeliveryStatusReport;
  drop temporary table if exists temp_ECDDeliveryStatusReport_2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDDevelopmentalDelayReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDDevelopmentalDelayReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
fm.LMP_Date LMP,
fc.dob 'Date of birth (Child)',

fr.Question  'Developmental delay(Findings)'
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join fact_childvalidrecord  fc on fc.MCTSID_no_Child_ID=fo.childid

where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(396,397,398,409,408,407,406,405,404,403,402,401,400,399) and fr.answer='NO'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
null LMP,
fm.dob ,
fr.Question  as Remarks 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fr.questionid in(396,397,398,409,408,407,406,405,404,403,402,401,400,399) and fr.answer='NO';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDHRPWCasesIdentifiedReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDHRPWCasesIdentifiedReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer ReasonsforHRP 
-- fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
-- inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
-- and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(296) and answer='Yes')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.ReasonsforHRP  is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(308) and fr2.answer<>"Don't know/Not stated"
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer ReasonsforHRP 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(296) and answer='Yes')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.ReasonsforHRP  is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fr2.questionid in(308) and  fr2.answer<>"Don't know/Not stated";
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDHRPWCasesIdentifiedReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDHRPWCasesIdentifiedReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer ReasonsforHRP 
-- fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
-- inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
-- and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(296) and answer='Yes')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.ReasonsforHRP  is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(308) and fr2.answer<>"Don't know/Not stated"
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer ReasonsforHRP 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(296) and answer='Yes')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.ReasonsforHRP  is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            and fr2.questionid in(308) and  fr2.answer<>"Don't know/Not stated";
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDInfantsHighRiskReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDInfantsHighRiskReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer ReasonsforHrni 
-- fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(374) and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr2.questionid in(388) and fr2.answer is not null
       -- where fr.questionid in()
union 

             select distinct 
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer ReasonsforHrni 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer<>'Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.answer in(select name from db_iemr.m_hrni
 where name not in("Don't know/Not stated",'Newborn with Congenital Anomalies'))
 union
select distinct  
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer ReasonsforHrni  

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(374) and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(388) and fr2.answer is not null
             union
             select distinct  
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer ReasonsforHrni  

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer<>'Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.answer in(select name from db_iemr.m_hrni
 where name not in("Don't know/Not stated",'Newborn with Congenital Anomalies'));
             -- where fr.questionid in();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDInfantsHighRiskReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDInfantsHighRiskReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer ReasonsforHrni 
-- fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(374) and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr2.questionid in(388) and fr2.answer is not null
       -- where fr.questionid in()
union 

             select distinct 
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fr2.Answer ReasonsforHrni 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer<>'Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.answer in(select name from db_iemr.m_hrni
 where name not in("Don't know/Not stated",'Newborn with Congenital Anomalies'))
 union
select distinct  
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer ReasonsforHrni  

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(374) and answer='Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(388) and fr2.answer is not null
             union
             select distinct  
date(fb.CreatedDate) 'Call Date',
' ' Agetname,
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
fr2.Answer ReasonsforHrni  

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(374) 
and answer<>'Newborn with Congenital Anomalies')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and fr.ReasonsforHrni   is not null
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.answer in(select name from db_iemr.m_hrni
 where name not in("Don't know/Not stated",'Newborn with Congenital Anomalies'));
             -- where fr.questionid in();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDJSYRelatedComplaintsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDJSYRelatedComplaintsReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr.questionid in(376) and fr.answer='Delay in Process'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
 null LMP,
fm.dob ,
fb.Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(376)and  fr.answer='Delay in Process';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDJSYRelatedComplaintsReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDJSYRelatedComplaintsReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
 fm.LMP_Date LMP,
fm.edd EDD,
fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr.questionid in(376) and fr.answer='Delay in Process'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
 null LMP,
fm.dob ,
fb.Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(376)and  fr.answer='Delay in Process';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDMaternalDeathReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDMaternalDeathReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Maternal Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Dead'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr.questionid in(282) and fr.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Mother Died')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Dead'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(284) and fr.answer is not null;
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDMaternalDeathReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDMaternalDeathReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Maternal Death')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Dead'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and fr.questionid in(282) and fr.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Mother Died')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Dead'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(284) and fr.answer is not null;
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDMiscarriageReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDMiscarriageReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,

fr2.Answer Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(281,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(281,284) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDMiscarriageReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDMiscarriageReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,

fr2.Answer Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(281,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(281,284) and fr2.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDMiscarriageReport_Datacheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDMiscarriageReport_Datacheck`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDMiscarriageReport;
create temporary table temp_ECDMiscarriageReport as
select `Call Date`,`RCH ID`,`Phone No`,`Beneficiary Name`,`District Name`,`Block Name`,LMP,EDD,`Causes of Miscarriage`,`Period of occurrence`
from (
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,

case when fr2.questionid=281 then fr2.Answer end "Causes of Miscarriage",
case when fr2.questionid=284 then fr2.Answer end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr2.questionid in(281,284) and fr2.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer Remarks

case when fr2.questionid=281 then fr2.Answer end "Causes of Miscarriage",
case when fr2.questionid=284 then fr2.Answer end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(295) and answer='Miscarriage')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(281,284) and fr2.answer is not null)a;
             
                 drop temporary table if exists temp_ECDMiscarriageReport_2;
 create temporary table temp_ECDMiscarriageReport_2
 select * from temp_ECDMiscarriageReport;
 

 select t1.`Call Date`,t1.`RCH ID`,t1.`Phone No`,t1.`Beneficiary Name`,t1.`District Name`,
 t1.`Block Name`,t1.LMP,t1.EDD,t1.`Causes of Miscarriage`,t2.`Period of occurrence` from temp_ECDMiscarriageReport t1
 inner join temp_ECDMiscarriageReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`RCH ID`=t2.`RCH ID`
 and t1.`Phone No`=t2.`Phone No`
 where t2.`Period of occurrence` is not null and t1.`Causes of Miscarriage` is not null ;
 
 drop temporary table if exists temp_ECDMiscarriageReport;
  drop temporary table if exists temp_ECDMiscarriageReport_2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDNCDIdentifiedReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDNCDIdentifiedReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
District_Name 'District Name',
Block_Name 'Block Name',
fm.LMP_Date LMP,
fm.edd EDD,

fb.Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr.questionid in(303) and fr.answer is not null
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
District_Name 'District Name',
Block_Name 'Block Name',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr.Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
              and fr.questionid in(303) and fr.answer is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDNotConnectedPhonelistDiffformatReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDNotConnectedPhonelistDiffformatReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.Name BeneficiaryName,
fm.Husband_Name,
 fm.MCTSID_no 'RCHID',-- new column
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'BLOCK NAME',
Whom_PhoneNo 'PHONE NUMBER',
-- reasonForCallNotAnswered 'CallStatus',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
else "WrongNumber call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Ph 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Ph 'ASHA PHONENO'


from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false) or(fb.isWrongNumber is true)) 
            union all
select distinct 
distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.child_name,
null Husband_Name,
fm.MCTSID_no_Child_ID 'RCHID',-- new column  doubt
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'HEALTH BLOCK NAME',
Phone_No 'PHONE NUMBER',
-- reasonForCallNotAnswered 'status',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "WrongNumber call"
else "Unverified call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Phone_No 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Phone_No 'ASHA PHONENO'

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false) or(fb.isWrongNumber is true)) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDNotConnectedPhonelistDiffformatReport_16042024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDNotConnectedPhonelistDiffformatReport_16042024`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.Name BeneficiaryName,
fm.Husband_Name,
 fm.MCTSID_no 'RCHID',-- new column
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'BLOCK NAME',
Whom_PhoneNo 'PHONE NUMBER',
-- reasonForCallNotAnswered 'CallStatus',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when   iscalldisconnected is true then "Disconnected Call"
else "Disconnected Call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Ph 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Ph 'ASHA PHONENO'


from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false) or(fb.isWrongNumber is true)) 
            union all
select distinct 
distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.child_name,
null Husband_Name,
fm.MCTSID_no_Child_ID 'RCHID',-- new column  doubt
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'HEALTH BLOCK NAME',
Phone_No 'PHONE NUMBER',
-- reasonForCallNotAnswered 'status',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
else "Disconnected Call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Phone_No 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Phone_No 'ASHA PHONENO'

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false) or(fb.isWrongNumber is true)) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDNotConnectedPhonelistDiffformatReport_23012024` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDNotConnectedPhonelistDiffformatReport_23012024`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.Name BeneficiaryName,
fm.Husband_Name,
 fm.MCTSID_no 'RCHID',-- new column
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'BLOCK NAME',
Whom_PhoneNo 'PHONE NUMBER',
-- reasonForCallNotAnswered 'CallStatus',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  ((reasonForCallNotAnswered is null) or  (length(trim(reasonForCallNotAnswered))=0)) 
 and iscalldisconnected is true then "Disconnected Call"
when  isverified is false and iscalldisconnected is false and isCallAnswered is true then "Answered call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Ph 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Ph 'ASHA PHONENO'


from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false))-- or(fb.isWrongNumber is true)) 
            union all
select distinct 
distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.child_name,
null Husband_Name,
fm.MCTSID_no_Child_ID 'RCHID',-- new column  doubt
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'HEALTH BLOCK NAME',
Phone_No 'PHONE NUMBER',
-- reasonForCallNotAnswered 'status',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  ((reasonForCallNotAnswered is null) or  (length(trim(reasonForCallNotAnswered))=0)) 
 and iscalldisconnected is true then "Disconnected Call"
when  isverified is false and iscalldisconnected is false and isCallAnswered is true then "Answered call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Phone_No 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Phone_No 'ASHA PHONENO'

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false));-- or(fb.isWrongNumber is true)) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDNotConnectedPhonelistDiffformatReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDNotConnectedPhonelistDiffformatReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.Name BeneficiaryName,
fm.Husband_Name,
 fm.MCTSID_no 'RCHID',-- new column
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'BLOCK NAME',
Whom_PhoneNo 'PHONE NUMBER',
-- reasonForCallNotAnswered 'CallStatus',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
else "Unverified call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Ph 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Ph 'ASHA PHONENO'


from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false))-- or(fb.isWrongNumber is true)) 
            union all
select distinct 
distinct 
date(fb.CreatedDate) 'CALL TIME',
fm.child_name,
null Husband_Name,
fm.MCTSID_no_Child_ID 'RCHID',-- new column  doubt
-- fm.MCTSID_no 'Mother ID',Name BeneficiaryName,
District_Name 'District',
Block_Name 'HEALTH BLOCK NAME',
Phone_No 'PHONE NUMBER',
-- reasonForCallNotAnswered 'status',
case when  
reasonForCallNotAnswered is not null and length(trim(reasonForCallNotAnswered))>0  then reasonForCallNotAnswered
 when  reasonForCallNotAnswered is null and iscalldisconnected is true then "Disconnected Call"
else "Unverified call"
 end "Callstatus",
ANM_Name 'ANM NAME',
ANM_Phone_No 'ANM PHONENO',
ASHA_Name 'ASHA Name',
ASHA_Phone_No 'ASHA PHONENO'

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false -- and reasonForCallNotAnswered='Call not connected'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            and ((fb.IsVerified is false));-- or(fb.isWrongNumber is true)) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDStillBirthReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDStillBirthReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer    Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Still birth')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
              and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer    Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Still birth')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null;
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDStillBirthReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_ECDStillBirthReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer    Remarks
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Still birth')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
              and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
fr2.Answer    Remarks

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Still birth')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null;
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDStillBirthReport_datacheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDStillBirthReport_datacheck`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin

 drop temporary table if exists temp_ECDStillBirthReport;
create temporary table temp_ECDStillBirthReport as
select `CALL Date`,`Registration No`,`PhoneNo of Beneficiary`,
MotherName,District,`Block`,LMP,edd,
`Reason of incident`,
case when `Period of occurrence` is not null then `Period of occurrence` end `Period of occurrence` from (
select distinct 
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no 'Registration No',-- new column
fm.Whom_PhoneNo 'PhoneNo of Beneficiary',
fm.Name MotherName,
District_Name 'District',
Block_Name 'Block',
fm.LMP_Date LMP,
fm.edd ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer    Remarks

case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Still birth')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is true  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
              and fr2.questionid in(283,284) and fr2.answer is not null
            union 
select distinct  
date(fb.CreatedDate) 'CALL Date',
fm.MCTSID_no_Child_ID 'Registration No',-- clarification required new column
fm.Phone_No 'PhoneNo of Beneficiary',
fm.Child_Name ChildName,
District_Name 'District',
Block_Name 'Block',
null LMP,
fm.dob ,
-- reasonForNoFurtherCalls 'Baby's Birth Status',
-- fr2.Answer    Remarks

case when  fr2.questionid=283 then fr2.Answer end "Reason of incident",
case when  fr2.questionid=284 then fr2.Answer end "Period of occurrence"

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join (select * from fact_mctscallresponse where questionid in(370) and answer='Still birth')  fr on fr.obcallid=fb.obcallid
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mctscallresponse fr2 on fr.obcallid=fr2.obcallid 
where fb.IsMother is false  -- and reasonForNoFurtherCalls='Still birth '
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr2.questionid in(283,284) and fr2.answer is not null)a ;
          --   where (`Reason of incident` is not null and `Period of occurrence` is not null)
   --     group by `CALL Date`,`Registration No`,`PhoneNo of Beneficiary`,
 -- MotherName,District,`Block`,LMP,edd,`Reason of incident`,`Period of occurrence` ;
 
 drop temporary table if exists temp_ECDStillBirthReport_2;
 create temporary table temp_ECDStillBirthReport_2
 select * from temp_ECDStillBirthReport;
 

 select t1.`CALL Date`,t1.`Registration No`,t1.`PhoneNo of Beneficiary`,
t1.MotherName,t1.District,t1.`Block`,t1.LMP,t1.edd,
t1.`Reason of incident`,
t2.`Period of occurrence` from temp_ECDStillBirthReport t1
 inner join temp_ECDStillBirthReport_2 t2 on t1.`CALL Date`=t2.`CALL Date` and t1.`Registration No`=t2.`Registration No`
 and t1.`PhoneNo of Beneficiary`=t2.`PhoneNo of Beneficiary`
 where t2.`Period of occurrence` is not null and t1.`Reason of incident` is not null ;
 
 drop temporary table if exists temp_ECDStillBirthReport;
  drop temporary table if exists temp_ECDStillBirthReport_2;
 
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDVaccineDropOutIdentifiedReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDVaccineDropOutIdentifiedReport`(v_starttime datetime,
v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Mother Name',
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
fm.LMP_Date LMP,
fc.dob 'Date of birth (Child)',

fr.Answer Remarks 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join fact_childvalidrecord  fc on fc.MCTSID_no_Child_ID=fo.childid

where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(378) and  fr.answer<>'Not Applicable'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
null LMP,
fm.dob ,
fr.Answer as Remarks 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(378) and fr.answer<>'Not Applicable';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDVaccineDropOutIdentifiedReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDVaccineDropOutIdentifiedReport_Correction`(v_starttime datetime,
v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Mother Name',
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
fm.LMP_Date LMP,
fc.dob 'Date of birth (Child)',

fr.Answer Remarks 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join fact_childvalidrecord  fc on fc.MCTSID_no_Child_ID=fo.childid

where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
       and fr.questionid in(378) and  fr.answer<>'Not Applicable'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
null LMP,
fm.dob ,
fr.Answer as Remarks 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
             and fr.questionid in(378) and fr.answer<>'Not Applicable';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDVaccineLeftOutIdentifiedReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDVaccineLeftOutIdentifiedReport`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
fm.LMP_Date LMP,
fc.dob 'Date of birth (Child)',

fr.Answer as Remarks 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join fact_childvalidrecord  fc on fc.MCTSID_no_Child_ID=fo.childid

where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr.questionid in(379) and  fr.answer<>'Not Applicable'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
null LMP,
fm.dob ,
fr.Answer as Remarks 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
              and fr.questionid in(379) and   fr.answer<>'Not Applicable';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_ECDVaccineLeftOutIdentifiedReport_Correction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_ECDVaccineLeftOutIdentifiedReport_Correction`(v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
select distinct 
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no 'RCH ID',-- new column
fm.Whom_PhoneNo 'Phone No',
fm.Name 'Beneficiary Name',
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
fm.LMP_Date LMP,
fc.dob 'Date of birth (Child)',

fr.Answer as Remarks 
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join fact_childvalidrecord  fc on fc.MCTSID_no_Child_ID=fo.childid

where fb.IsMother is true  -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
        and fr.questionid in(379) and  fr.answer<>'Not Applicable'
union 
select distinct  
date(fb.CreatedDate) 'Call Date',
fm.MCTSID_no_Child_ID 'RCH ID',-- clarification required new column
fm.Phone_No 'Phone No',
fm.Child_Name ChildName,
fm.District_Name 'District Name',
fm.Block_Name 'Block Name',
null LMP,
fm.dob ,
fr.Answer as Remarks 

from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid

inner join fact_mctscallresponse fr on fr.obcallid=fb.obcallid-- new join required
and fr.bencallid=fb.bencallid-- new join required
where fb.IsMother is false -- and reasonForNoFurtherCalls='Mother has abortion'
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
              and fr.questionid in(379) and   fr.answer<>'Not Applicable';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchChildOutboundWorklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `PR_FetchChildOutboundWorklist`(v_AllocatedUserID int)
BEGIN
/********************************************************************************************************************
-- SP/Function Name : PR_FetchChildOutboundWorklist
-- Project/Product Name : Piramal
-- Created By : Prateek
-- Created Date : 26-04-2018
-- Reviewed By :
-- Reviewed Date : DD-MMM-YYYY
-- Purpose : TO Fetch Child Outbound Worklist for an agent.
-- Version History :
---------------------------------------------------------------------------------------------------------------------
-- Version# TFS_ID# Modified By Modified Date Purpose
---------------------------------------------------------------------------------------------------------------------
1.0 - Initial Write - XYZ - DD-MMM-YYYY Initial Write
*********************************************************************************************************************/
select
B.BeneficiaryRegID,
B.OutboundCallType,
B.DisplayOBCallType,
B.CallDateFrom,
B.NoOfTrials,
B.MCTSID_no_Child_ID,
B.Child_Name,
B.Mother_ID,
B.Mother_Name,
B.Phone_No_of,
B.Phone_No,
B.OBCallID
from
(SELECT MIN(A.OutboundCallType) OutboundCallType,
A.childID,
A.BeneficiaryRegID,
A.DisplayOBCallType,
A.CallDateFrom,
A.NoOfTrials,
A.MCTSID_no_Child_ID,
A.Child_Name,
A.Mother_ID,
A.Mother_Name,
A.Phone_No_of,
A.Phone_No,
A.OBCallID
FROM
(select mctsoutbou0_.childID, mctsoutbou0_.OutboundCallType,
mctsoutbou0_.DisplayOBCallType,
mctsoutbou0_.CallDateFrom,
mctsoutbou0_.NoOfTrials,
mctsoutbou0_.OBCallID,
mctsdatare1_.MCTSID_no_Child_ID,
mctsdatare1_.BeneficiaryRegID,
mctsdatare1_.Child_Name,
mctsdatare1_.Mother_ID,
mctsdatare1_.Mother_Name,
mctsdatare1_.Phone_No_of,
mctsdatare1_.Phone_No
from t_MCTSOutboundCalls mctsoutbou0_
inner join t_childvaliddata mctsdatare1_ on mctsoutbou0_.childID=mctsdatare1_.MCTSID_no_Child_ID
where mctsoutbou0_.AllocatedUserID=v_AllocatedUserID and
(mctsoutbou0_.CallStatus<>'Completed' and mctsoutbou0_.CallStatus<>'NA' )
and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_date)
AND(current_date() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
) A
group by A.childID)B;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchMCTS_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_FetchMCTS_1`( IN P_ProviderServiceMapID INT)
BEGIN

select 
B.OutboundCallType,
B.motherID,
C.OBCallID,
C.MotherID,
C.ChildID,
C.BeneficiaryRegID,
C.AllocatedUserID,
C.ProviderServiceMapID,
C.OutboundCallType,
C.DisplayOBCallType,
C.CallDateFrom,
C.CallDateTo,
C.PrefferedCallDate,
C.CallStatus,
C.NoOfTrials,
C.AllocationStatus,
C.IsSMSSent,
C.Deleted,
C.Processed,
C.CreatedBy,
C.CreatedDate,
C.ModifiedBy,
C.LastModDate,
D.MotherValidRecordID,
D.RowID,
D.BeneficiaryRegID,
D.Date_of_Entry,
D.Entry_type,
D.MCTSID_no,
D.Name,
D.Husband_Name,
D.PhoneNo_Of_Whom,
D.Whom_PhoneNo,
D.Birth_Date,
D.Age,
D.Blood_Group,
D.Caste,
D.Aadhar_no,
D.State_ID,
D.State_Name,
D.District_ID,
D.District_Name,
D.Taluka_Name,
D.Taluka_ID,
D.Block_ID,
D.Block_Name,
D.SubCenter_ID,
D.SubCenter_Name,
D.Village_ID,
D.Village_Name,
D.City_ID,
D.City_Name,
D.SubCenter_Name1,
D.ANM_ID,
D.ANM_Name,
D.ANM_Ph,
D.ASHA_ID,
D.ASHA_Name,
D.ASHA_Ph,
D.PHC_ID,
D.PHC_Name,
D.SUBPHC_ID,
D.SUBPHC_Name,
D.YR,
D.GP_Village,
D.Address,
D.LMP_Date,
D.ANC1_Date,
D.ANC2_Date,
D.ANC3_Date,
D.ANC4_Date,
D.ANC_Complication,
D.TT1_Date,
D.TT2_Date,
D.TTBooster_Date,
D.IFA100_Given_Date,
D.EDD,
D.Anemia,
D.RTI_STI,
D.Delivery_Lnk_Facility,
D.Facility_Name,
D.Delivery_Date,
D.Delivery_Place_home_type,
D.Delivery_Place_Public,
D.Delivery_Place_Private,
D.Delivery_type,
D.Delivery_Complications,
D.Discharge_Date,
D.Abortion,
D.PNC_Home_Visit,
D.PNC_Complication,
D.PPC_Method,
D.PNC_Checkup,
D.Outcome_Nos,
D.Child1_ID,
D.Child1_Name,
D.Child1_Gender,
D.Child1_Weight,
D.Child1_BreastFeeding,
D.Child2_ID,
D.Child2_Name,
D.Child2_Gender,
D.Child2_weight,
D.Child2_Breastfeeding,
D.Child3_ID,
D.Child3_Name,
D.Child3_Gender,
D.Child3_Weight,
D.Child3_Breastfeeding,
D.Child4_ID,
D.Child4_Name,
D.Child4_Gender,
D.Child4_Weight,
D.Child4_Breastfeeding,
D.Mother_Reg_Date,
D.Last_Update_Date,
D.EID,
D.EID_time,
D.CPSMS_Flag,
D.JSY_Beneficiary,
D.JSY_Paid_Date,
D.Bank_Name,
D.Bank_Branch_Name,
D.Acc_No,
D.IFSC_Code,
D.Remarks,
D.Referred_By_Telecaller,
D.Referred_Date,
D.No_of_Try,
D.Call_Answered,
D.Status,
D.High_Risk,
D.High_Risk_Reason,
D.Call_Verified,
D.Associate,
D.Call_Date,
D.Due_Services,
D.Due_Services_Response,
D.Overdue_Services,
D.Overdue_Services_Response,
D.Given_Services,
D.Given_Services_Response,
D.Miscarriage,
D.Baby_Died,
D.Call_No,
D.Questions_Asked,
D.Asnwer_Given_by_Benificary,
D.Source,
D.NoCall_Reason,
D.NoPhone_Reason,
D.Created_By,
D.Updated_By,
D.BPL_APL,
D.MDDS_StateID,
D.MDDS_District_ID,
D.MDDS_Taluka_ID,
D.MDDS_Village_ID,
D.Is_Valid,
D.InValid_Reason,
D.Is_Error,
D.Error_Reason,
D.FileID,
D.IsAllocated,
D.Deleted,
D.Processed,
D.CreatedBy,
D.CreatedDate,
D.ModifiedBy,
D.LastModDate
 from (
SELECT MIN(A.OutboundCallType) OutboundCallType,A.motherID FROM (
select mctsoutbou0_.motherID,mctsoutbou0_.OutboundCallType from t_MCTSOutboundCalls mctsoutbou0_
inner join t_mothervalidrecord mother on mctsoutbou0_.motherID=mother.MCTSID_no
where mctsoutbou0_.CallStatus!='Completed'
 and  mctsoutbou0_.CallDateTo>=current_date

and mctsoutbou0_.ProviderServiceMapID = P_ProviderServiceMapID ) A
group by A.motherID )B
inner join t_MCTSOutboundCalls C on C.motherid=B.motherid and C.OutboundCallType=B.OutboundCallType
inner join t_mothervalidrecord D
on B.motherID=D.MCTSID_no order by CallDateFrom;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchMCTS_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_FetchMCTS_2`(IN P_ProviderServiceMapID INT, IN P_CallDateFrom DATETIME,IN P_CallDateTo DATETIME)
BEGIN

select 
B.OutboundCallType,
B.motherID,
C.OBCallID,
C.MotherID,
C.ChildID,
C.BeneficiaryRegID,
C.AllocatedUserID,
C.ProviderServiceMapID,
C.OutboundCallType,
C.DisplayOBCallType,
C.CallDateFrom,
C.CallDateTo,
C.PrefferedCallDate,
C.CallStatus,
C.NoOfTrials,
C.AllocationStatus,
C.IsSMSSent,
C.Deleted,
C.Processed,
C.CreatedBy,
C.CreatedDate,
C.ModifiedBy,
C.LastModDate,
D.MotherValidRecordID,
D.RowID,
D.BeneficiaryRegID,
D.Date_of_Entry,
D.Entry_type,
D.MCTSID_no,
D.Name,
D.Husband_Name,
D.PhoneNo_Of_Whom,
D.Whom_PhoneNo,
D.Birth_Date,
D.Age,
D.Blood_Group,
D.Caste,
D.Aadhar_no,
D.State_ID,
D.State_Name,
D.District_ID,
D.District_Name,
D.Taluka_Name,
D.Taluka_ID,
D.Block_ID,
D.Block_Name,
D.SubCenter_ID,
D.SubCenter_Name,
D.Village_ID,
D.Village_Name,
D.City_ID,
D.City_Name,
D.SubCenter_Name1,
D.ANM_ID,
D.ANM_Name,
D.ANM_Ph,
D.ASHA_ID,
D.ASHA_Name,
D.ASHA_Ph,
D.PHC_ID,
D.PHC_Name,
D.SUBPHC_ID,
D.SUBPHC_Name,
D.YR,
D.GP_Village,
D.Address,
D.LMP_Date,
D.ANC1_Date,
D.ANC2_Date,
D.ANC3_Date,
D.ANC4_Date,
D.ANC_Complication,
D.TT1_Date,
D.TT2_Date,
D.TTBooster_Date,
D.IFA100_Given_Date,
D.EDD,
D.Anemia,
D.RTI_STI,
D.Delivery_Lnk_Facility,
D.Facility_Name,
D.Delivery_Date,
D.Delivery_Place_home_type,
D.Delivery_Place_Public,
D.Delivery_Place_Private,
D.Delivery_type,
D.Delivery_Complications,
D.Discharge_Date,
D.Abortion,
D.PNC_Home_Visit,
D.PNC_Complication,
D.PPC_Method,
D.PNC_Checkup,
D.Outcome_Nos,
D.Child1_ID,
D.Child1_Name,
D.Child1_Gender,
D.Child1_Weight,
D.Child1_BreastFeeding,
D.Child2_ID,
D.Child2_Name,
D.Child2_Gender,
D.Child2_weight,
D.Child2_Breastfeeding,
D.Child3_ID,
D.Child3_Name,
D.Child3_Gender,
D.Child3_Weight,
D.Child3_Breastfeeding,
D.Child4_ID,
D.Child4_Name,
D.Child4_Gender,
D.Child4_Weight,
D.Child4_Breastfeeding,
D.Mother_Reg_Date,
D.Last_Update_Date,
D.EID,
D.EID_time,
D.CPSMS_Flag,
D.JSY_Beneficiary,
D.JSY_Paid_Date,
D.Bank_Name,
D.Bank_Branch_Name,
D.Acc_No,
D.IFSC_Code,
D.Remarks,
D.Referred_By_Telecaller,
D.Referred_Date,
D.No_of_Try,
D.Call_Answered,
D.Status,
D.High_Risk,
D.High_Risk_Reason,
D.Call_Verified,
D.Associate,
D.Call_Date,
D.Due_Services,
D.Due_Services_Response,
D.Overdue_Services,
D.Overdue_Services_Response,
D.Given_Services,
D.Given_Services_Response,
D.Miscarriage,
D.Baby_Died,
D.Call_No,
D.Questions_Asked,
D.Asnwer_Given_by_Benificary,
D.Source,
D.NoCall_Reason,
D.NoPhone_Reason,
D.Created_By,
D.Updated_By,
D.BPL_APL,
D.MDDS_StateID,
D.MDDS_District_ID,
D.MDDS_Taluka_ID,
D.MDDS_Village_ID,
D.Is_Valid,
D.InValid_Reason,
D.Is_Error,
D.Error_Reason,
D.FileID,
D.IsAllocated,
D.Deleted,
D.Processed,
D.CreatedBy,
D.CreatedDate,
D.ModifiedBy,
D.LastModDate
from 
(SELECT MIN(A.OutboundCallType) OutboundCallType,A.motherID 
	FROM 
(select mctsoutbou0_.motherID,mctsoutbou0_.OutboundCallType 
	from t_MCTSOutboundCalls mctsoutbou0_
		inner join t_mothervalidrecord mother on mctsoutbou0_.motherID=mother.MCTSID_no
		where mctsoutbou0_.CallStatus!='Completed'
			and ((mctsoutbou0_.CallDateFrom>=P_CallDateFrom and mctsoutbou0_.CallDateFrom<=P_CallDateTo ) 
			or (mctsoutbou0_.CallDateTo<=P_CallDateTo and mctsoutbou0_.CallDateTo>=P_CallDateFrom))
			and mctsoutbou0_.ProviderServiceMapID = P_ProviderServiceMapID 
) A group by A.motherID 
)B inner join t_MCTSOutboundCalls C
		on C.motherid=B.motherid and C.OutboundCallType=B.OutboundCallType
	inner join t_mothervalidrecord D
		on B.motherID=D.MCTSID_no 
	order by CallDateFrom;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchMCTS_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_FetchMCTS_3`(IN P_ProviderServiceMapID INT)
BEGIN

select 
B.OutboundCallType,
B.childID,
C.OBCallID,
C.MotherID,
C.ChildID,
C.BeneficiaryRegID,
C.AllocatedUserID,
C.ProviderServiceMapID,
C.OutboundCallType,
C.DisplayOBCallType,
C.CallDateFrom,
C.CallDateTo,
C.PrefferedCallDate,
C.CallStatus,
C.NoOfTrials,
C.AllocationStatus,
C.IsSMSSent,
C.Deleted,
C.Processed,
C.CreatedBy,
C.CreatedDate,
C.ModifiedBy,
C.LastModDate,
D.RowID,
D.BeneficiaryRegID,
D.Date_of_Entry,
D.Entry_type,
D.MCTSID_no_Child_ID,
D.Child_Name,
D.Father_Name,
D.Mother_Name,
D.Mother_ID,
D.DOB,
D.Place_of_Birth,
D.Gender,
D.Caste,
D.BloodGroup,
D.Child_Aadhaar_No,
D.Weight_of_Child,
D.Child_EID,
D.Child_EID_Time,
D.Emamta_Health_ID,
D.Emamta_Family_ID,
D.Phone_No_of,
D.Phone_No,
D.Registration_Date,
D.Updated_Date,
D.CityID,
D.City,
D.State_ID,
D.State_Name,
D.District_ID,
D.District_Name,
D.Taluka_Name,
D.Taluka_ID,
D.Block_ID,
D.Block_Name,
D.PHC_ID,
D.PHC_Name,
D.SubCenter_ID,
D.SubCenter_Name,
D.SubCenter_Name1,
D.Village_ID,
D.Village_Name,
D.GP_Village,
D.Address,
D.Year,
D.ANM_ID,
D.ANM_Name,
D.ANM_Phone_No,
D.ASHA_ID,
D.ASHA_Name,
D.ASHA_Phone_No,
D.BCG_Date,
D.OPV0_Date,
D.Hepatitis_B1_Date,
D.DPT1_Date,
D.OPV1_Date,
D.Hepatitis_B2_Date,
D.DPT2_Date,
D.OPV2_Date,
D.Hepatitis_B3_Date,
D.DPT3_Date,
D.OPV3_Date,
D.Hepatitis_B4_Date,
D.Measles_Date,
D.VitA_Dose1_Date,
D.MR_Date,
D.DPTBooster_Date,
D.OPVBooster_Date,
D.VitA_Dose2_Date,
D.VitA_Dose3_Date,
D.VitA_Dose99_Date,
D.VitA_Dose5_Date,
D.VitA_Dose6_Date,
D.VitA_Dose7_Date,
D.VitA_Dose8_Date,
D.VitA_Dose9_Date,
D.JE_Date,
D.DT5_Date,
D.TT10_Date,
D.TT16_Date,
D.Measles_2_Date,
D.PentaValent1_Date,
D.PentaValent2_Date,
D.PentaValent3_Date,
D.is_Upload,
D.Status,
D.Remarks,
D.Delete_Mother,
D.Delete_Reason,
D.Deleted_ON,
D.SMS_Status,
D.Created_By,
D.Updated_By,
D.MDDS_StateID,
D.MDDS_District_ID,
D.MDDS_Taluka_ID,
D.MDDS_Village_ID,
D.BirthCertificateNo,
D.Rural_urban,
D.SNO,
D.Lead_ID,
D.My_ID,
D.CID_NO,
D.MID_NO,
D.Duplicate_Bit,
D.FacilityType,
D.DueServices,
D.OverDueServices,
D.GivenServices,
D.Source,
D.Is_Valid,
D.Is_Error,
D.Error_Reason,
D.FileID,
D.IsAllocated,
D.Deleted,
D.Processed,
D.CreatedBy,
D.CreatedDate,
D.ModifiedBy,
D.LastModDate
 from (
SELECT MIN(A.OutboundCallType) OutboundCallType,A.childID FROM (
select mctsoutbou0_.childID,mctsoutbou0_.OutboundCallType from t_MCTSOutboundCalls mctsoutbou0_
inner join t_childvaliddata childvalid1_ on mctsoutbou0_.childID=childvalid1_.MCTSID_no_Child_ID
where mctsoutbou0_.CallStatus!='Completed'
and mctsoutbou0_.CallDateTo>=current_date

and mctsoutbou0_.ProviderServiceMapID=P_ProviderServiceMapID) A group by A.childID )B
inner join t_MCTSOutboundCalls C on C.childID=B.childID and C.OutboundCallType=B.OutboundCallType
inner join t_childvaliddata D
on B.childID=D.MCTSID_no_Child_ID order by CallDateFrom;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchMCTS_4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_FetchMCTS_4`(IN P_ProviderServiceMapID INT, IN P_CallDateFrom DATETIME,IN P_CallDateTo DATETIME )
BEGIN

select 
B.OutboundCallType,
B.childID,
C.OBCallID,
C.MotherID,
C.ChildID,
C.BeneficiaryRegID,
C.AllocatedUserID,
C.ProviderServiceMapID,
C.OutboundCallType,
C.DisplayOBCallType,
C.CallDateFrom,
C.CallDateTo,
C.PrefferedCallDate,
C.CallStatus,
C.NoOfTrials,
C.AllocationStatus,
C.IsSMSSent,
C.Deleted,
C.Processed,
C.CreatedBy,
C.CreatedDate,
C.ModifiedBy,
C.LastModDate,
D.RowID,
D.BeneficiaryRegID,
D.Date_of_Entry,
D.Entry_type,
D.MCTSID_no_Child_ID,
D.Child_Name,
D.Father_Name,
D.Mother_Name,
D.Mother_ID,
D.DOB,
D.Place_of_Birth,
D.Gender,
D.Caste,
D.BloodGroup,
D.Child_Aadhaar_No,
D.Weight_of_Child,
D.Child_EID,
D.Child_EID_Time,
D.Emamta_Health_ID,
D.Emamta_Family_ID,
D.Phone_No_of,
D.Phone_No,
D.Registration_Date,
D.Updated_Date,
D.CityID,
D.City,
D.State_ID,
D.State_Name,
D.District_ID,
D.District_Name,
D.Taluka_Name,
D.Taluka_ID,
D.Block_ID,
D.Block_Name,
D.PHC_ID,
D.PHC_Name,
D.SubCenter_ID,
D.SubCenter_Name,
D.SubCenter_Name1,
D.Village_ID,
D.Village_Name,
D.GP_Village,
D.Address,
D.Year,
D.ANM_ID,
D.ANM_Name,
D.ANM_Phone_No,
D.ASHA_ID,
D.ASHA_Name,
D.ASHA_Phone_No,
D.BCG_Date,
D.OPV0_Date,
D.Hepatitis_B1_Date,
D.DPT1_Date,
D.OPV1_Date,
D.Hepatitis_B2_Date,
D.DPT2_Date,
D.OPV2_Date,
D.Hepatitis_B3_Date,
D.DPT3_Date,
D.OPV3_Date,
D.Hepatitis_B4_Date,
D.Measles_Date,
D.VitA_Dose1_Date,
D.MR_Date,
D.DPTBooster_Date,
D.OPVBooster_Date,
D.VitA_Dose2_Date,
D.VitA_Dose3_Date,
D.VitA_Dose99_Date,
D.VitA_Dose5_Date,
D.VitA_Dose6_Date,
D.VitA_Dose7_Date,
D.VitA_Dose8_Date,
D.VitA_Dose9_Date,
D.JE_Date,
D.DT5_Date,
D.TT10_Date,
D.TT16_Date,
D.Measles_2_Date,
D.PentaValent1_Date,
D.PentaValent2_Date,
D.PentaValent3_Date,
D.is_Upload,
D.Status,
D.Remarks,
D.Delete_Mother,
D.Delete_Reason,
D.Deleted_ON,
D.SMS_Status,
D.Created_By,
D.Updated_By,
D.MDDS_StateID,
D.MDDS_District_ID,
D.MDDS_Taluka_ID,
D.MDDS_Village_ID,
D.BirthCertificateNo,
D.Rural_urban,
D.SNO,
D.Lead_ID,
D.My_ID,
D.CID_NO,
D.MID_NO,
D.Duplicate_Bit,
D.FacilityType,
D.DueServices,
D.OverDueServices,
D.GivenServices,
D.Source,
D.Is_Valid,
D.Is_Error,
D.Error_Reason,
D.FileID,
D.IsAllocated,
D.Deleted,
D.Processed,
D.CreatedBy,
D.CreatedDate,
D.ModifiedBy,
D.LastModDate
from 
(SELECT MIN(A.OutboundCallType) OutboundCallType,A.childID 
FROM 
(select mctsoutbou0_.childID,mctsoutbou0_.OutboundCallType 
from t_MCTSOutboundCalls mctsoutbou0_
	inner join t_childvaliddata childvalid1_ on mctsoutbou0_.childID=childvalid1_.MCTSID_no_Child_ID
	where mctsoutbou0_.CallStatus!='Completed'
		and ((mctsoutbou0_.CallDateFrom>=P_CallDateFrom and mctsoutbou0_.CallDateFrom<=P_CallDateTo ) 
		or (mctsoutbou0_.CallDateTo<=P_CallDateTo and mctsoutbou0_.CallDateTo>=P_CallDateFrom))
		and mctsoutbou0_.ProviderServiceMapID=P_ProviderServiceMapID
) A group by A.childID 
)B inner join t_MCTSOutboundCalls C 
		on C.childID=B.childID and C.OutboundCallType=B.OutboundCallType
	inner join t_childvaliddata D
		on B.childID=D.MCTSID_no_Child_ID 
	order by CallDateFrom;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchMotherChildOutboundWorklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `PR_FetchMotherChildOutboundWorklist`(v_AllocatedUserID int)
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           PR_FetchMotherOutboundWorklist
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           26-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Fetch Mother Outbound Worklist for an agent.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
--------------------------------------------------------------------------------------------------------------------- 
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/ 

select 
B.OBCallID,B.BeneficiaryRegID BeneficiaryRegID,
B.AllocatedUserID,
B.ProviderServiceMapID,
B.OutboundCallType OutboundCallType,B.CallDateFrom,B.NoOfTrials,
B.DisplayOBCallType,
B.Name,
B.MCTSID_no,
B.PhoneNo_Of_Whom,
B.Whom_PhoneNo,
B.High_Risk

from 
(SELECT MIN(A.OutboundCallType) OutboundCallType, 
A.motherID,
A.OBCallID,
A.ChildID,
A.AllocatedUserID,
A.ProviderServiceMapID,
A.DisplayOBCallType,
A.CallDateFrom,
A.NoOfTrials,
A.BeneficiaryRegID,
A.MCTSID_no,
A.Name,
A.PhoneNo_Of_Whom,
A.Whom_PhoneNo,
A.High_Risk
FROM
(select  mctsoutbou0_.motherID, mctsoutbou0_.OutboundCallType,
mctsoutbou0_.OBCallID,
mctsoutbou0_.ChildID,
mctsoutbou0_.AllocatedUserID,
mctsoutbou0_.ProviderServiceMapID,
mctsoutbou0_.DisplayOBCallType,
mctsoutbou0_.CallDateFrom,
mctsoutbou0_.NoOfTrials,

mctsdatare1_.BeneficiaryRegID,
mctsdatare1_.MCTSID_no,
mctsdatare1_.Name,
mctsdatare1_.PhoneNo_Of_Whom,
mctsdatare1_.Whom_PhoneNo,
mctsdatare1_.High_Risk
from t_MCTSOutboundCalls mctsoutbou0_
inner join t_mothervalidrecord mctsdatare1_ on mctsoutbou0_.motherID=mctsdatare1_.MCTSID_no
where mctsoutbou0_.AllocatedUserID = v_AllocatedUserID and 
(mctsoutbou0_.CallStatus <>'Completed' and  mctsoutbou0_.CallStatus<>'NA')
and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_date)
AND(current_date() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
) A
group by A.motherID)B where OutboundCallType like 'PNC%';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchMotherOutboundWorklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_FetchMotherOutboundWorklist`(v_AllocatedUserID int)
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           PR_FetchMotherOutboundWorklist
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           26-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Fetch Mother Outbound Worklist for an agent.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
--------------------------------------------------------------------------------------------------------------------- 
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/ 

select 
B.OBCallID,B.BeneficiaryRegID BeneficiaryRegID,
B.AllocatedUserID,
B.ProviderServiceMapID,
B.OutboundCallType OutboundCallType,B.CallDateFrom,B.NoOfTrials,
B.DisplayOBCallType,
B.Name,
B.MCTSID_no,
B.PhoneNo_Of_Whom,
B.Whom_PhoneNo,
B.High_Risk

from 
(SELECT A.OutboundCallType OutboundCallType, 
A.motherID,
A.OBCallID,
A.ChildID,
A.AllocatedUserID,
A.ProviderServiceMapID,
A.DisplayOBCallType,
A.CallDateFrom,
A.NoOfTrials,
A.BeneficiaryRegID,
A.MCTSID_no,
A.Name,
A.PhoneNo_Of_Whom,
A.Whom_PhoneNo,
A.High_Risk
FROM
(select  mctsoutbou0_.motherID, mctsoutbou0_.OutboundCallType,
mctsoutbou0_.OBCallID,
mctsoutbou0_.ChildID,
mctsoutbou0_.AllocatedUserID,
mctsoutbou0_.ProviderServiceMapID,
mctsoutbou0_.DisplayOBCallType,
mctsoutbou0_.CallDateFrom,
mctsoutbou0_.NoOfTrials,

mctsdatare1_.BeneficiaryRegID,
mctsdatare1_.MCTSID_no,
mctsdatare1_.Name,
mctsdatare1_.PhoneNo_Of_Whom,
mctsdatare1_.Whom_PhoneNo,
mctsdatare1_.High_Risk
from t_MCTSOutboundCalls mctsoutbou0_
inner join t_mothervalidrecord mctsdatare1_ on mctsoutbou0_.motherID=mctsdatare1_.MCTSID_no
where mctsoutbou0_.AllocatedUserID = v_AllocatedUserID and 
(mctsoutbou0_.CallStatus <>'Completed' and  mctsoutbou0_.CallStatus<>'NA')
 and (mctsoutbou0_.PrefferedCallDate is null or mctsoutbou0_.PrefferedCallDate<=current_date)
 AND(current_date() between mctsoutbou0_.CallDateFrom AND mctsoutbou0_.CallDateTo)
) A
-- group by A.motherID
)
B where OutboundCallType like 'ANC%'
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchSpecialist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `PR_FetchSpecialist`(specializationid int,parkingplaceid int)
BEGIN
select usr.UserName,usr.UserID,usr.FirstName,usr.MiddleName,
usr.LastName, usm.SpecializationID,gen.GenderName,til.TitleName,usr.EmailID,usr.ContactNo,
             spec.Specialization from m_user usr
join m_userspecializationmapping usm on usr.UserID=usm.UserID and usr.UserID in (select uppmap.UserID  from m_userparkingplacemap uppmap
join m_userservicerolemapping usrmap on usrmap.UserID=uppmap.UserID and usrmap.Deleted=false
join m_servicerolescreenmapping srsmap on usrmap.RoleID=srsmap.RoleID and srsmap.Deleted=false
join m_screen scrn on scrn.ScreenID=srsmap.ScreenID and scrn.ScreenName="TC Specialist" and scrn.Deleted=false
where uppmap.ParkingPlaceID=parkingplaceid) and (specializationid=0 or usm.SpecializationID=specializationid) and usm.Deleted = 0b0
left join m_gender gen on gen.GenderID=usr.GenderID
left join m_title til on til.TitleID=usr.TitleID
left join m_specialization spec on spec.SpecializationID=usm.SpecializationID order by usr.FirstName ;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchUnregisteredUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_FetchUnregisteredUser`(v_ParkingPlace int)
BEGIN

select usr.UserID, usr.FirstName, usr.LastName, usr.UserName from m_userparkingplacemap uspm
inner join m_user usr on uspm.UserID = usr.UserID
where usr.deleted = false and 
uspm.deleted = false and 
uspm.ParkingPlaceID = v_ParkingPlace and 
uspm.UserID not in (select UserID from m_userbiometricmapping where IsCompleted is true);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_FetchUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `PR_FetchUserDetails`(v_ServiceProviderID int, v_PSMStateID int, v_ServiceID int, v_RoleID int, v_Name_User varchar(50), v_UserID int)
BEGIN

 

	select 
USRMappingID,
ProviderServiceMapID,
UserID,
RoleID,
RoleName,
TitleID,
TitleName,
FirstName,
MiddleName,
LastName,
GenderID,
GenderName,
MaritalStatusID,
MaritalStatus,
AadhaarNo,
PAN,
DOB,
DOJ,
QualificationID,
Qualification,
UserName,
Password,
AgentID,
AgentPassword,
CZRole,
EmailID,
Languages,
StatusID,
UserStatus,
EmergencyContactPerson,
EmergencyContactNo,
IsSupervisor,
UserDeleted,
DemographicID,
FathersName,
MothersName,
CommunityID,
CommunityType,
ReligionID,
ReligionType,
UserAddressLine1,
UserAddressLine2,
PermAddressLine1,
PermAddressLine2,
PermStateID,
PermDistrictID,
PermPinCode,
UserPremanentAddress,
UserCityID,
UserCity,
UserStateID,
UserState,
UserCountryID,
UserCountry,
PinCode,
IsPresent,
IsPermanent,
ServiceProviderID,
ServiceProviderName,
ServiceID,
ServiceName,
IsNational,
PSMStateID,
PSMStateName,
WorkingLocationID,
WorkingLocationName,
WorkingDistrictID,
WorkingDistrictName,
WorkingAddress,
USRMDeleted
    FROM showuserdetailsfromuserservicerolemapping
    where (v_ServiceProviderID is null or ServiceProviderID = v_ServiceProviderID)
    and (v_PSMStateID is null or PSMStateID = v_PSMStateID) 
    and (v_ServiceID is null or ServiceID = v_ServiceID)
    and (v_RoleID is null or RoleID = v_RoleID)
    and (v_Name_User is null or concat(coalesce(FirstName, ""),coalesce(MiddleName, ""),coalesce(LastName, "")) like v_Name_User )
    and (v_UserID is null or UserID = v_UserID)
    and UserDeleted != 0b1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_Insert104BRCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `PR_Insert104BRCategory`(v_SubServiceID smallint, v_ProviderServiceMapID int)
BEGIN
 


insert into db_iemr.m_category 
(CategoryName,
 CategoryDesc,
 SubServiceID,
 ProviderServiceMapID,
 CreatedBy)
values
("Blood Document", 
concat("Blood Document Upload For - ",  v_ProviderServiceMapID), 
v_SubServiceID,
v_ProviderServiceMapID,
 "Trigger-Insert104BRCategory");



insert into db_iemr.m_subcategory 
(SubCategoryName, 
SubCategoryDesc,
 CreatedBy)
	values
("Blood Document", 
concat("Blood Document Upload For - ", v_ProviderServiceMapID),
"Trigger-Insert104BRCategory");



update db_iemr.m_subcategory subcat , db_iemr.m_category  cat 
set subcat.CategoryID = cat.CategoryID
where subcat.SubCategoryDesc = cat.CategoryDesc
and (subcat.SubCategoryName = "Blood Document")
and (cat.CategoryName = "Blood Document"); 


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_InsertCallType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_InsertCallType`(v_ProviderServiceMapID int)
BEGIN
 

DECLARE v_ServiceID INT ;

select ServiceID into v_ServiceID from m_ProviderServiceMapping 
where ProviderServiceMapID = v_ProviderServiceMapID;





if(v_ServiceID = 3 or v_ServiceID = 1 or v_ServiceID = 6)
then
INSERT INTO `db_iemr`.`m_calltype`
(`CallGroupType`,
`CallType`,
`CallTypeDesc`,
`ProviderServiceMapID`,
`IsInbound`,
`IsOutbound`,
`FitToBlock`,
`FitForFollowup`,
`MaxRedial`,
`CreatedBy`)
VALUES
('Wrapup Exceeds', 'Wrapup Exceeds', 'For Call Disconnect', v_ProviderServiceMapID,0b1,0b1,0b0,0b0,0,'Admin');

end if;


if(v_ServiceID = 6)
then
INSERT INTO `db_iemr`.`m_calltype`
(`CallGroupType`,
`CallType`,
`CallTypeDesc`,
`ProviderServiceMapID`,
`IsInbound`,
`IsOutbound`,
`FitToBlock`,
`FitForFollowup`,
`MaxRedial`,
`CreatedBy`)
VALUES
("Answered" , "Answered" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "Invalid number" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "Out of service" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "Out of reach" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "Switched off" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "No reply" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "Number busy" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b0 , 0b1 , 0b0 , 0b0 , 0,"Admin"),
("Not Answered" , "Call not connected" , "For MCTS Through trigger" , v_ProviderServiceMapID , 0b1 , 0b0 , 0b0 , 0b0 , 0,"Admin");

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_InsertInNotificationMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `PR_InsertInNotificationMap`(v_RoleID int, v_NotificationID int, v_ProviderServiceMapID int,v_NotificationTypeID int, v_CreatedBy varchar(50), v_ValidFrom datetime, v_WorkingLocationID int)
BEGIN

 
DECLARE v_NotificationType VARCHAR(100);
DECLARE v_NotificationState VARCHAR(30)  default 'unread';


select NotificationType  into v_NotificationType
from db_iemr.m_notificationtype
where NotificationTypeID =v_NotificationTypeID;
 







if(v_RoleID is not null and v_WorkingLocationID is not null)
then
INSERT INTO `db_iemr`.`m_usernotificationmap` 
(`UserID`, `RoleID`, `NotificationID`, `ProviderServiceMapID`,`NotificationState`, `NotificationTypeID`,`NotificationType`,`CreatedBy`)
SELECT
 usrm.UserID, 
 usrm.RoleID,
 v_NotificationID,
 v_ProviderServiceMapID,
 v_NotificationState,
 v_NotificationTypeID,
 v_NotificationType,
 v_CreatedBy
 FROM db_iemr.m_userservicerolemapping usrm 
where usrm.RoleID = v_RoleID 
and usrm.WorkingLocationID = v_WorkingLocationID 
and usrm.ProviderServiceMapID = v_ProviderServiceMapID 
and usrm.Deleted != 0b1;
end if;



if(v_RoleID is not null and v_WorkingLocationID is null)
then
INSERT INTO `db_iemr`.`m_usernotificationmap` 
(`UserID`, `RoleID`, `NotificationID`, `ProviderServiceMapID`,`NotificationState`, `NotificationTypeID`,`NotificationType`,`CreatedBy`)
SELECT
 usrm.UserID, 
 usrm.RoleID,
 v_NotificationID,
 v_ProviderServiceMapID,
 v_NotificationState,
 v_NotificationTypeID,
 v_NotificationType,
 v_CreatedBy
 FROM db_iemr.m_userservicerolemapping usrm 
where usrm.RoleID = v_RoleID
and usrm.ProviderServiceMapID = v_ProviderServiceMapID 
and usrm.Deleted != 0b1;
end if;



if(v_RoleID is null and v_WorkingLocationID is not null)
then
INSERT INTO `db_iemr`.`m_usernotificationmap` 
(`UserID`, `RoleID`, `NotificationID`, `ProviderServiceMapID`,`NotificationState`, `NotificationTypeID`,`NotificationType`,`CreatedBy`)
SELECT
 usrm.UserID, 
 usrm.RoleID,
 v_NotificationID,
 v_ProviderServiceMapID,
 v_NotificationState,
 v_NotificationTypeID,
 v_NotificationType,
 v_CreatedBy
 FROM db_iemr.m_userservicerolemapping usrm 
where usrm.WorkingLocationID = v_WorkingLocationID
and usrm.ProviderServiceMapID = v_ProviderServiceMapID 
and usrm.Deleted != 0b1;
end if;


if(v_RoleID is null and v_WorkingLocationID is null)
then
INSERT INTO `db_iemr`.`m_usernotificationmap` 
(`UserID`, `RoleID`, `NotificationID`, `ProviderServiceMapID`,`NotificationState`, `NotificationTypeID`,`NotificationType`,`CreatedBy`)
SELECT
 usrm.UserID, 
 usrm.RoleID,
 v_NotificationID,
 v_ProviderServiceMapID,
 v_NotificationState,
 v_NotificationTypeID,
 v_NotificationType,
 v_CreatedBy
 FROM db_iemr.m_userservicerolemapping usrm 
where usrm.ProviderServiceMapID = v_ProviderServiceMapID 
and usrm.Deleted != 0b1;
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_InsertMCTSFieldsStatewise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `PR_InsertMCTSFieldsStatewise`(v_ProviderServiceMapID int)
BEGIN
 


DECLARE v_ServiceID INT ;
DECLARE v_StateID INT ; 




select ServiceID into v_ServiceID from m_ProviderServiceMapping 
where ProviderServiceMapID = v_ProviderServiceMapID;




select StateID into v_StateID from m_ProviderServiceMapping 
where ProviderServiceMapID = v_ProviderServiceMapID;






if(v_ServiceID = 6 and v_StateID = 5)
THEN
INSERT INTO `db_iemr`.`m_mctsfieldsstatewise` (`DataFields`, `FieldsFor`, `ProviderServiceMapID`, `CreatedBy`) VALUES ('[{"dbColumnName":"State_ID","excelColumnName":"StateID"},{"dbColumnName":"District_ID","excelColumnName":"District_ID"},{"dbColumnName":"District_Name","excelColumnName":"District_Name"},{"dbColumnName":"Taluka_ID","excelColumnName":"Taluka_ID"},{"dbColumnName":"Taluka_Name","excelColumnName":"Taluka_Name"},{"dbColumnName":"Block_ID","excelColumnName":"HealthBlock_ID"},{"dbColumnName":"Block_Name","excelColumnName":"HealthBlock_Name"},{"dbColumnName":"PHC_ID","excelColumnName":"PHC_ID"},{"dbColumnName":"PHC_Name","excelColumnName":"PHC_Name"},{"dbColumnName":"SubCenter_ID","excelColumnName":"SubCentre_ID"},{"dbColumnName":"SubCenter_Name","excelColumnName":"SubCentre_Name"},{"dbColumnName":"Village_ID","excelColumnName":"Village_ID"},{"dbColumnName":"Village_Name","excelColumnName":"Village_Name"},{"dbColumnName":"YR","excelColumnName":"Yr"},{"dbColumnName":"GP_Village","excelColumnName":"GP_Village"},{"dbColumnName":"Address","excelColumnName":"Address"},{"dbColumnName":"MCTSID_no","excelColumnName":"ID_No"},{"dbColumnName":"Name","excelColumnName":"Name"},{"dbColumnName":"Husband_Name","excelColumnName":"Husband_Name"},{"dbColumnName":"PhoneNo_Of_Whom","excelColumnName":"PhoneNo_Of_Whom"},{"dbColumnName":"Whom_PhoneNo","excelColumnName":"Whom_PhoneNo"},{"dbColumnName":"Birth_Date","excelColumnName":"Birthdate"},{"dbColumnName":"JSY_Beneficiary","excelColumnName":"JSY_Beneficiary"},{"dbColumnName":"Caste","excelColumnName":"Caste"},{"dbColumnName":"SubCenter_Name1","excelColumnName":"SubCentre_Name1"},{"dbColumnName":"ANM_Name","excelColumnName":"ANM_Name"},{"dbColumnName":"ANM_Ph","excelColumnName":"ANM_Phone"},{"dbColumnName":"ASHA_Name","excelColumnName":"ASHA_Name"},{"dbColumnName":"ASHA_Ph","excelColumnName":"ASHA_Phone"},{"dbColumnName":"Delivery_Lnk_Facility","excelColumnName":"Delivery_Lnk_Facility"},{"dbColumnName":"Facility_Name","excelColumnName":"Facility_Name"},{"dbColumnName":"LMP_Date","excelColumnName":"LMP_Date"},{"dbColumnName":"ANC1_Date","excelColumnName":"ANC1_Date"},{"dbColumnName":"ANC2_Date","excelColumnName":"ANC2_Date"},{"dbColumnName":"ANC3_Date","excelColumnName":"ANC3_Date"},{"dbColumnName":"ANC4_Date","excelColumnName":"ANC4_Date"},{"dbColumnName":"TT1_Date","excelColumnName":"TT1_Date"},{"dbColumnName":"TT2_Date","excelColumnName":"TT2_Date"},{"dbColumnName":"TTBooster_Date","excelColumnName":"TTBooster_Date"},{"dbColumnName":"IFA100_Given_Date","excelColumnName":"IFA100_Given_Date"},{"dbColumnName":"Anemia","excelColumnName":"Anemia"},{"dbColumnName":"ANC_Complication","excelColumnName":"ANC_Complication"},{"dbColumnName":"RTI_STI","excelColumnName":"RTI_STI"},{"dbColumnName":"Delivery_Date","excelColumnName":"Dly_Date"},{"dbColumnName":"Delivery_Place_home_type","excelColumnName":"Dly_Place_Home_Type"},{"dbColumnName":"Delivery_Place_Public","excelColumnName":"Dly_Place_Public"},{"dbColumnName":"Delivery_Place_Private","excelColumnName":"Dly_Place_Private"},{"dbColumnName":"Delivery_type","excelColumnName":"Dly_Type"},{"dbColumnName":"Delivery_Complications","excelColumnName":"Dly_Complication"},{"dbColumnName":"Discharge_Date","excelColumnName":"Discharge_Date"},{"dbColumnName":"JSY_Paid_Date","excelColumnName":"JSY_Paid_Date"},{"dbColumnName":"Abortion","excelColumnName":"Abortion"},{"dbColumnName":"PNC_Home_Visit","excelColumnName":"PNC_Home_Visit"},{"dbColumnName":"PNC_Complication","excelColumnName":"PNC_Complication"},{"dbColumnName":"PPC_Method","excelColumnName":"PPC_Method"},{"dbColumnName":"PNC_Checkup","excelColumnName":"PNC_Checkup"},{"dbColumnName":"Outcome_Nos","excelColumnName":"Outcome_Nos"},{"dbColumnName":"Child1_Name","excelColumnName":"Child1_Name"},{"dbColumnName":"Child1_Gender","excelColumnName":"Child1_Sex"},{"dbColumnName":"Child1_Weight","excelColumnName":"Child1_Wt"},{"dbColumnName":"Child1_BreastFeeding","excelColumnName":"Child1_Brestfeeding"},{"dbColumnName":"Child2_Name","excelColumnName":"Child2_Name"},{"dbColumnName":"Child2_Gender","excelColumnName":"Child2_Sex"},{"dbColumnName":"Child2_weight","excelColumnName":"Child2_Wt"},{"dbColumnName":"Child2_Breastfeeding","excelColumnName":"Child2_Brestfeeding"},{"dbColumnName":"Child3_Name","excelColumnName":"Child3_Name"},{"dbColumnName":"Child3_Gender","excelColumnName":"Child3_Sex"},{"dbColumnName":"Child3_Weight","excelColumnName":"Child3_Wt"},{"dbColumnName":"Child3_Breastfeeding","excelColumnName":"Child3_Brestfeeding"},{"dbColumnName":"Child4_Name","excelColumnName":"Child4_Name"},{"dbColumnName":"Child4_Gender","excelColumnName":"Child4_Sex"},{"dbColumnName":"Child4_Weight","excelColumnName":"Child4_Wt"},{"dbColumnName":"Child4_Breastfeeding","excelColumnName":"Child4_Brestfeeding"},{"dbColumnName":"Age","excelColumnName":"Age"},{"dbColumnName":"Mother_Reg_Date","excelColumnName":"MTHR_REG_DATE"},{"dbColumnName":"Last_Update_Date","excelColumnName":"LastUpdateDate"},{"dbColumnName":"Remarks","excelColumnName":"Remarks"},{"dbColumnName":"ANM_ID","excelColumnName":"ANM_ID"},{"dbColumnName":"ASHA_ID","excelColumnName":"ASHA_ID"},{"dbColumnName":"Call_Answered","excelColumnName":"Call_Ans"},{"dbColumnName":"NoCall_Reason","excelColumnName":"NoCall_Reason"},{"dbColumnName":"NoPhone_Reason","excelColumnName":"NoPhone_Reason"},{"dbColumnName":"Created_By","excelColumnName":"Created_By"},{"dbColumnName":"Updated_By","excelColumnName":"Updated_By"},{"dbColumnName":"Aadhar_no","excelColumnName":"Aadhar_No"},{"dbColumnName":"BPL_APL","excelColumnName":"BPL_APL"},{"dbColumnName":"EID","excelColumnName":"EID"},{"dbColumnName":"EID_time","excelColumnName":"EIDTime"},{"dbColumnName":"Entry_type","excelColumnName":"Entry_Type"},{"dbColumnName":"MDDS_StateID","excelColumnName":"MDDS_StateID"},{"dbColumnName":"MDDS_District_ID","excelColumnName":"MDDS_District_ID"},{"dbColumnName":"MDDS_Taluka_ID","excelColumnName":"MDDS_Taluka_ID"},{"dbColumnName":"MDDS_Village_ID","excelColumnName":"MDDS_Village_ID"}]', 'Mother Data', v_ProviderServiceMapID, 'Trigger - MCTSExcelMapping');
INSERT INTO `db_iemr`.`m_mctsfieldsstatewise` (`DataFields`, `FieldsFor`, `ProviderServiceMapID`, `CreatedBy`) VALUES ('[{"dbColumnName":"State_ID","excelColumnName":"StateID"},{"dbColumnName":"District_ID","excelColumnName":"District_ID"},{"dbColumnName":"District_Name","excelColumnName":"District_Name"},{"dbColumnName":"Taluka_ID","excelColumnName":"Taluka_ID"},{"dbColumnName":"Taluka_Name","excelColumnName":"Taluka_Name"},{"dbColumnName":"Block_ID","excelColumnName":"HealthBlock_ID"},{"dbColumnName":"Block_Name","excelColumnName":"HealthBlock_Name"},{"dbColumnName":"PHC_ID","excelColumnName":"PHC_ID"},{"dbColumnName":"PHC_Name","excelColumnName":"PHC_Name"},{"dbColumnName":"SubCenter_ID","excelColumnName":"SubCentre_ID"},{"dbColumnName":"SubCenter_Name","excelColumnName":"SubCentre_Name"},{"dbColumnName":"Village_ID","excelColumnName":"Village_ID"},{"dbColumnName":"Village_Name","excelColumnName":"Village_Name"},{"dbColumnName":"Year","excelColumnName":"Yr"},{"dbColumnName":"City","excelColumnName":"City_Maholla"},{"dbColumnName":"GP_Village","excelColumnName":"GP_Village"},{"dbColumnName":"Address","excelColumnName":"Address"},{"dbColumnName":"MCTSID_no_Child_ID","excelColumnName":"ID_No"},{"dbColumnName":"Child_Name","excelColumnName":"Name"},{"dbColumnName":"Mother_Name","excelColumnName":"Mother_Name"},{"dbColumnName":"Mother_ID","excelColumnName":"Mother_ID"},{"dbColumnName":"Phone_No_of","excelColumnName":"PhoneNo_Of_Whom"},{"dbColumnName":"Phone_No","excelColumnName":"Whom_PhoneNo"},{"dbColumnName":"DOB","excelColumnName":"Birthdate"},{"dbColumnName":"Place_of_Birth","excelColumnName":"Place_of_Delivery"},{"dbColumnName":"BloodGroup","excelColumnName":"Blood_Group"},{"dbColumnName":"Caste","excelColumnName":"Caste"},{"dbColumnName":"SubCenter_Name1","excelColumnName":"SubCentre_Name1"},{"dbColumnName":"ANM_Name","excelColumnName":"ANM_Name"},{"dbColumnName":"ANM_Phone_No","excelColumnName":"ANM_Phone"},{"dbColumnName":"ASHA_Name","excelColumnName":"ASHA_Name"},{"dbColumnName":"ASHA_Phone_No","excelColumnName":"ASHA_Phone"},{"dbColumnName":"BCG_Date","excelColumnName":"BCG_Dt"},{"dbColumnName":"OPV0_Date","excelColumnName":"OPV0_Dt"},{"dbColumnName":"Hepatitis_B1_Date","excelColumnName":"HepatitisB1_Dt"},{"dbColumnName":"DPT1_Date","excelColumnName":"DPT1_Dt"},{"dbColumnName":"OPV1_Date","excelColumnName":"OPV1_Dt"},{"dbColumnName":"Hepatitis_B2_Date","excelColumnName":"HepatitisB2_Dt"},{"dbColumnName":"DPT2_Date","excelColumnName":"DPT2_Dt"},{"dbColumnName":"OPV2_Date","excelColumnName":"OPV2_Dt"},{"dbColumnName":"Hepatitis_B3_Date","excelColumnName":"HepatitisB3_Dt"},{"dbColumnName":"DPT3_Date","excelColumnName":"DPT3_Dt"},{"dbColumnName":"OPV3_Date","excelColumnName":"OPV3_Dt"},{"dbColumnName":"Hepatitis_B4_Date","excelColumnName":"HepatitisB4_Dt"},{"dbColumnName":"Measles_Date","excelColumnName":"Measles_Dt"},{"dbColumnName":"VitA_Dose1_Date","excelColumnName":"VitA_Dose1_Dt"},{"dbColumnName":"MR_Date","excelColumnName":"MR_Dt"},{"dbColumnName":"DPTBooster_Date","excelColumnName":"DPTBooster_Dt"},{"dbColumnName":"OPVBooster_Date","excelColumnName":"OPVBooster_Dt"},{"dbColumnName":"VitA_Dose2_Date","excelColumnName":"VitA_Dose2_Dt"},{"dbColumnName":"VitA_Dose3_Date","excelColumnName":"VitA_Dose3_Dt"},{"dbColumnName":"JE_Date","excelColumnName":"JE_Dt"},{"dbColumnName":"VitA_Dose9_Date","excelColumnName":"VitA_Dose9_Dt"},{"dbColumnName":"DT5_Date","excelColumnName":"DT5_Dt"},{"dbColumnName":"TT10_Date","excelColumnName":"TT10_Dt"},{"dbColumnName":"TT16_Date","excelColumnName":"TT16_Dt"},{"dbColumnName":"Registration_Date","excelColumnName":"CLD_REG_DATE"},{"dbColumnName":"Gender","excelColumnName":"Sex"},{"dbColumnName":"VitA_Dose5_Date","excelColumnName":"VitA_Dose5_Dt"},{"dbColumnName":"VitA_Dose6_Date","excelColumnName":"VitA_Dose6_Dt"},{"dbColumnName":"VitA_Dose7_Date","excelColumnName":"VitA_Dose7_Dt"},{"dbColumnName":"VitA_Dose8_Date","excelColumnName":"VitA_Dose8_Dt"},{"dbColumnName":"Updated_Date","excelColumnName":"LastUpdateDate"},{"dbColumnName":"Remarks","excelColumnName":"Remarks"},{"dbColumnName":"ANM_ID","excelColumnName":"ANM_ID"},{"dbColumnName":"ASHA_ID","excelColumnName":"ASHA_ID"},{"dbColumnName":"Created_By","excelColumnName":"Created_By"},{"dbColumnName":"Updated_By","excelColumnName":"Updated_By"},{"dbColumnName":"Measles_2_Date","excelColumnName":"Measles2_Dt"},{"dbColumnName":"Weight_of_Child","excelColumnName":"Weight_of_Child"},{"dbColumnName":"Child_Aadhaar_No","excelColumnName":"Child_Aadhaar_No"},{"dbColumnName":"Child_EID","excelColumnName":"Child_EID"},{"dbColumnName":"Child_EID_Time","excelColumnName":"Child_EIDTime"},{"dbColumnName":"Father_Name","excelColumnName":"Father_Name"},{"dbColumnName":"BirthCertificateNo","excelColumnName":"Birth_Certificate_Number"},{"dbColumnName":"Entry_type","excelColumnName":"Entry_Type"},{"dbColumnName":"MDDS_StateID","excelColumnName":"MDDS_StateID"},{"dbColumnName":"MDDS_District_ID","excelColumnName":"MDDS_District_ID"},{"dbColumnName":"MDDS_Taluka_ID","excelColumnName":"MDDS_Taluka_ID"},{"dbColumnName":"MDDS_Village_ID","excelColumnName":"MDDS_Village_ID"}]', 'Child Data', v_ProviderServiceMapID, 'Trigger - MCTSExcelMapping');


else if (v_ServiceID =6 and v_StateID = 15)
then
INSERT INTO `db_iemr`.`m_mctsfieldsstatewise` (`DataFields`, `FieldsFor`, `ProviderServiceMapID`, `CreatedBy`) VALUES ('[{"dbColumnName":"District_ID","excelColumnName":"DISTRICT ID"},{"dbColumnName":"District_Name","excelColumnName":"DIST NAME"},{"dbColumnName":"Taluka_ID","excelColumnName":"TAL CD"},{"dbColumnName":"Taluka_Name","excelColumnName":"TAL NAME"},{"dbColumnName":"Block_ID","excelColumnName":"BLOCK CD"},{"dbColumnName":"Block_Name","excelColumnName":"BLOCK NAME"},{"dbColumnName":"PHC_ID","excelColumnName":"PHC CD"},{"dbColumnName":"PHC_Name","excelColumnName":"PHC NAME"},{"dbColumnName":"SUBPHC_ID","excelColumnName":"SUBPHC CD"},{"dbColumnName":"SUBPHC_Name","excelColumnName":"SC NAME"},{"dbColumnName":"YR","excelColumnName":"YR"},{"dbColumnName":"GP_Village","excelColumnName":"GP VILLAGE"},{"dbColumnName":"Address","excelColumnName":"ADDRESS"},{"dbColumnName":"MCTSID_no","excelColumnName":"ID NO"},{"dbColumnName":"Name","excelColumnName":"NAME"},{"dbColumnName":"Updated_Name","excelColumnName":"UPDATED NAME"},{"dbColumnName":"Husband_Name","excelColumnName":"HUSBAND NAME"},{"dbColumnName":"Updated_HusbandName","excelColumnName":"UPDATED HUSBAND NAME"},{"dbColumnName":"PhoneNo_Of_Whom","excelColumnName":"PHONENO OF WHOM"},{"dbColumnName":"Whom_PhoneNo","excelColumnName":"WHOM PHONENO"},{"dbColumnName":"Birth_Date","excelColumnName":"BIRTHDATE"},{"dbColumnName":"Age","excelColumnName":"AGE"},{"dbColumnName":"JSY_Beneficiary","excelColumnName":"JSY BENEFICIARY"},{"dbColumnName":"Caste","excelColumnName":"CASTE"},{"dbColumnName":"SubCenter_Name","excelColumnName":"SUBCENTRE NAME"},{"dbColumnName":"ANM_Name","excelColumnName":"ANM NAME"},{"dbColumnName":"ANM_Ph","excelColumnName":"ANM PHONE"},{"dbColumnName":"ASHA_Name","excelColumnName":"ASHA NAME"},{"dbColumnName":"ASHA_Ph","excelColumnName":"ASHA PHONE"},{"dbColumnName":"Delivery_Lnk_Facility","excelColumnName":"DELIVERY LNK FACILITY"},{"dbColumnName":"Facility_Name","excelColumnName":"FACILITY NAME"},{"dbColumnName":"LMP_Date","excelColumnName":"LMP DATE"},{"dbColumnName":"ANC1_Date","excelColumnName":"ANC1 DATE"},{"dbColumnName":"ANC2_Date","excelColumnName":"ANC2 DATE"},{"dbColumnName":"ANC3_Date","excelColumnName":"ANC3 DATE"},{"dbColumnName":"ANC4_Date","excelColumnName":"ANC4 DATE"},{"dbColumnName":"TT1_Date","excelColumnName":"TT1 DATE"},{"dbColumnName":"TT2_Date","excelColumnName":"TT2 DATE"},{"dbColumnName":"TTBooster_Date","excelColumnName":"TTBOOSTER DATE"},{"dbColumnName":"IFA100_Given_Date","excelColumnName":"IFA100 GIVEN DATE"},{"dbColumnName":"EDD","excelColumnName":"EDD"},{"dbColumnName":"Anemia","excelColumnName":"ANEMIA"},{"dbColumnName":"ANC_Complication","excelColumnName":"ANC COMPLICATION"},{"dbColumnName":"RTI_STI","excelColumnName":"RTI STI"},{"dbColumnName":"Delivery_Date","excelColumnName":"DLY DATE"},{"dbColumnName":"Delivery_Place_home_type","excelColumnName":"DLY PLACE HOME TYPE"},{"dbColumnName":"Delivery_Place_Public","excelColumnName":"DLY PLACE PUBLIC"},{"dbColumnName":"Delivery_Place_Private","excelColumnName":"DLY PLACE PRIVATE"},{"dbColumnName":"Delivery_type","excelColumnName":"DLY TYPE"},{"dbColumnName":"Delivery_Complications","excelColumnName":"DLY COMPLICATION"},{"dbColumnName":"Discharge_Date","excelColumnName":"DISCHARGE DATE"},{"dbColumnName":"JSY_Paid_Date","excelColumnName":"JSY PAID DATE"},{"dbColumnName":"Abortion","excelColumnName":"ABORTION"},{"dbColumnName":"PNC_Home_Visit","excelColumnName":"PNC HOME VISIT"},{"dbColumnName":"PNC_Complication","excelColumnName":"PNC COMPLICATION"},{"dbColumnName":"PPC_Method","excelColumnName":"PPC METHOD"},{"dbColumnName":"PNC_Checkup","excelColumnName":"PNC CHECKUP"},{"dbColumnName":"Outcome_Nos","excelColumnName":"OUTCOME NOS"},{"dbColumnName":"Child1_Name","excelColumnName":"CHILD1 NAME"},{"dbColumnName":"Child1_Gender","excelColumnName":"CHILD1 SEX"},{"dbColumnName":"Child1_Weight","excelColumnName":"CHILD1 WT"},{"dbColumnName":"Child1_BreastFeeding","excelColumnName":"CHILD1 BRESTFEEDING"},{"dbColumnName":"Child2_Name","excelColumnName":"CHILD2 NAME"},{"dbColumnName":"Child2_Gender","excelColumnName":"CHILD2 SEX"},{"dbColumnName":"Child2_weight","excelColumnName":"CHILD2 WT"},{"dbColumnName":"Child2_Breastfeeding","excelColumnName":"CHILD2 BRESTFEEDING"},{"dbColumnName":"Child3_Name","excelColumnName":"CHILD3 NAME"},{"dbColumnName":"Child3_Gender","excelColumnName":"CHILD3 SEX"},{"dbColumnName":"Child3_Weight","excelColumnName":"CHILD3 WT"},{"dbColumnName":"Child3_Breastfeeding","excelColumnName":"CHILD3 BRESTFEEDING"},{"dbColumnName":"Child4_Name","excelColumnName":"CHILD4 NAME"},{"dbColumnName":"Child4_Gender","excelColumnName":"CHILD4 SEX"},{"dbColumnName":"Child4_Weight","excelColumnName":"CHILD4 WT"},{"dbColumnName":"Child4_Breastfeeding","excelColumnName":"CHILD4 BRESTFEEDING"},{"dbColumnName":"Mother_Reg_Date","excelColumnName":"MTHR REG DATE"},{"dbColumnName":"Last_Update_Date","excelColumnName":"LASTUPDATEDATE"},{"dbColumnName":"Aadhar_no","excelColumnName":"AADHAR NO"},{"dbColumnName":"EID","excelColumnName":"EID"},{"dbColumnName":"EID_time","excelColumnName":"EIDTIME"},{"dbColumnName":"CPSMS_Flag","excelColumnName":"CPSMS FLAG"},{"dbColumnName":"Bank_Name","excelColumnName":"BANK NAME"},{"dbColumnName":"Bank_Branch_Name","excelColumnName":"BRANCH NAME"},{"dbColumnName":"Acc_No","excelColumnName":"ACC NO"},{"dbColumnName":"IFSC_Code","excelColumnName":"IFSC CODE"},{"dbColumnName":"Remarks","excelColumnName":"REMARKS"},{"dbColumnName":"Referred_By_Telecaller","excelColumnName":"REFERRED BY TELECALLER"},{"dbColumnName":"Referred_Date","excelColumnName":"REFERRED DATE"},{"dbColumnName":"No_of_Try","excelColumnName":"No. of Try"},{"dbColumnName":"Call_Answered","excelColumnName":"Call Answered"},{"dbColumnName":"Status","excelColumnName":"STATUS"},{"dbColumnName":"Call_Verified","excelColumnName":"Call verified (yes/ no)"},{"dbColumnName":"Associate","excelColumnName":"Associate"},{"dbColumnName":"Call_Date","excelColumnName":"Call Date"},{"dbColumnName":"Due_Services","excelColumnName":"DUE SERVICES"},{"dbColumnName":"Due_Services_Response","excelColumnName":"DUE SERVICES RESPONSE"},{"dbColumnName":"Overdue_Services","excelColumnName":"OVER DUE SERVICES"},{"dbColumnName":"Overdue_Services_Response","excelColumnName":"OVER DUE SERVICES RESPONSE"},{"dbColumnName":"Given_Services","excelColumnName":"GIVEN SERVICES"},{"dbColumnName":"Given_Services_Response","excelColumnName":"GIVEN SERVICES RESPONSE"},{"dbColumnName":"Miscarriage","excelColumnName":"MISCARRIAGE"},{"dbColumnName":"Baby_Died","excelColumnName":"BABY DIED"},{"dbColumnName":"Call_No","excelColumnName":"Call No."},{"dbColumnName":"Questions_Asked","excelColumnName":"Question Asked"},{"dbColumnName":"Asnwer_Given_by_Benificary","excelColumnName":"Answer given by benificiary"}]', 'Mother Data', v_ProviderServiceMapID, 'Trigger - MCTSExcelMapping');
INSERT INTO `db_iemr`.`m_mctsfieldsstatewise` (`DataFields`, `FieldsFor`, `ProviderServiceMapID`, `CreatedBy`) VALUES ('[{"dbColumnName":"Lead_ID","excelColumnName":"LEAD_ID"},{"dbColumnName":"My_ID","excelColumnName":"MY_ID"},{"dbColumnName":"State_ID","excelColumnName":"STATE_ID"},{"dbColumnName":"District_ID","excelColumnName":"DISTRICT_ID"},{"dbColumnName":"District_Name","excelColumnName":"DISTRICT_NAME"},{"dbColumnName":"Taluka_Name","excelColumnName":"TALUKA_ID"},{"dbColumnName":"Taluka_ID","excelColumnName":"TALUKA_NAME"},{"dbColumnName":"Block_ID","excelColumnName":"HEALTH_BLOCK_ID"},{"dbColumnName":"Block_Name","excelColumnName":"HEALTH_BLOCK_NAME"},{"dbColumnName":"PHC_ID","excelColumnName":"PHC_ID"},{"dbColumnName":"PHC_Name","excelColumnName":"PHC_NAME"},{"dbColumnName":"SubCenter_ID","excelColumnName":"SUBCENTER_ID"},{"dbColumnName":"SubCenter_Name","excelColumnName":"SUBCENTER_NAME"},{"dbColumnName":"Village_ID","excelColumnName":"VILLAGE_ID"},{"dbColumnName":"Village_Name","excelColumnName":"VILLAGE_NAME"},{"dbColumnName":"Rural_urban","excelColumnName":"RURAL_URBAN"},{"dbColumnName":"Year","excelColumnName":"YEAR"},{"dbColumnName":"SNO","excelColumnName":"SNO1"},{"dbColumnName":"City","excelColumnName":"CITY_MOHOLLA"},{"dbColumnName":"GP_Village","excelColumnName":"GP_VILLAGE"},{"dbColumnName":"Address","excelColumnName":"ADDRESS"},{"dbColumnName":"MCTSID_no_Child_ID","excelColumnName":"CHILD_ID"},{"dbColumnName":"Child_Name","excelColumnName":"CHILD_NAME"},{"dbColumnName":"Mother_Name","excelColumnName":"MOTHER_NAME"},{"dbColumnName":"Mother_ID","excelColumnName":"MOTHER_ID"},{"dbColumnName":"Phone_No_of","excelColumnName":"PHONE_NO_OF_WHOM"},{"dbColumnName":"Phone_No","excelColumnName":"PHONE_NO"},{"dbColumnName":"DOB","excelColumnName":"BIRTH_DATE"},{"dbColumnName":"Place_of_Birth","excelColumnName":"PLACE_OF_DELIVERY"},{"dbColumnName":"BloodGroup","excelColumnName":"BLOOD_GROUP"},{"dbColumnName":"Caste","excelColumnName":"CASTE"},{"dbColumnName":"ANM_Name","excelColumnName":"ANM_NAME"},{"dbColumnName":"ANM_Phone_No","excelColumnName":"ANM_PHONE_NO"},{"dbColumnName":"ASHA_Name","excelColumnName":"ASHA_NAME"},{"dbColumnName":"ASHA_Phone_No","excelColumnName":"ASHA_PHONE_NO"},{"dbColumnName":"BCG_Date","excelColumnName":"BCG_DATE"},{"dbColumnName":"OPV0_Date","excelColumnName":"OPV_0_DATE"},{"dbColumnName":"Hepatitis_B1_Date","excelColumnName":"HEPATITIS_B_1_DATE"},{"dbColumnName":"DPT1_Date","excelColumnName":"DPT_1_DATE"},{"dbColumnName":"OPV1_Date","excelColumnName":"OPV_1_DATE"},{"dbColumnName":"Hepatitis_B2_Date","excelColumnName":"HEPATITIS_B_2_DATE"},{"dbColumnName":"DPT2_Date","excelColumnName":"DPT_2_DATE"},{"dbColumnName":"OPV2_Date","excelColumnName":"OPV_2_DATE"},{"dbColumnName":"Hepatitis_B3_Date","excelColumnName":"HEPATITIS_B_3_DATE"},{"dbColumnName":"DPT3_Date","excelColumnName":"DPT_3_DATE"},{"dbColumnName":"OPV3_Date","excelColumnName":"OPV_3_DATE"},{"dbColumnName":"Hepatitis_B4_Date","excelColumnName":"HEPATITIS_B_4_DATE"},{"dbColumnName":"Measles_Date","excelColumnName":"MEASLES_DATE"},{"dbColumnName":"VitA_Dose1_Date","excelColumnName":"VITA_DOSE_1_DATE"},{"dbColumnName":"MR_Date","excelColumnName":"MR_DATE"},{"dbColumnName":"DPTBooster_Date","excelColumnName":"DPT_BOOSTER_DATE"},{"dbColumnName":"OPVBooster_Date","excelColumnName":"OPV_BOOSTER_DATE"},{"dbColumnName":"VitA_Dose2_Date","excelColumnName":"VITA_DOSE_2_DATE"},{"dbColumnName":"VitA_Dose3_Date","excelColumnName":"VITA_DOSE_3_DATE"},{"dbColumnName":"JE_Date","excelColumnName":"JE_DATE"},{"dbColumnName":"VitA_Dose9_Date","excelColumnName":"VITA_DOSE_9_DATE"},{"dbColumnName":"DT5_Date","excelColumnName":"DT_5_DATE"},{"dbColumnName":"TT10_Date","excelColumnName":"TT_10_DATE"},{"dbColumnName":"TT16_Date","excelColumnName":"TT_16_DATE"},{"dbColumnName":"is_Upload","excelColumnName":"IS_UPLOAD"},{"dbColumnName":"Emamta_Health_ID","excelColumnName":"EMAMTAHEALTH_ID"},{"dbColumnName":"Emamta_Family_ID","excelColumnName":"EMAMTAFAMILY_ID"},{"dbColumnName":"CID_NO","excelColumnName":"CID_NO"},{"dbColumnName":"MID_NO","excelColumnName":"MID_NO"},{"dbColumnName":"Delete_Mother","excelColumnName":"DELETE_MOTHER"},{"dbColumnName":"Delete_Reason","excelColumnName":"REASON_DELETION"},{"dbColumnName":"Deleted_ON","excelColumnName":"DELETED_ON"},{"dbColumnName":"Entry_type","excelColumnName":"ENTRY_TYPE"},{"dbColumnName":"Registration_Date","excelColumnName":"CHILD_REGESTERED_DATE"},{"dbColumnName":"Duplicate_Bit","excelColumnName":"DUPLICATE_BIT"},{"dbColumnName":"FacilityType","excelColumnName":"FACILITY_TYPE"},{"dbColumnName":"Gender","excelColumnName":"SEX"},{"dbColumnName":"VitA_Dose5_Date","excelColumnName":"VITA_DOSE_5_DATE"},{"dbColumnName":"VitA_Dose6_Date","excelColumnName":"VITA_DOSE_6_DATE"},{"dbColumnName":"VitA_Dose7_Date","excelColumnName":"VITA_DOSE_7_DATE"},{"dbColumnName":"VitA_Dose8_Date","excelColumnName":"VITA_DOSE_8_DATE"},{"dbColumnName":"VitA_Dose99_Date","excelColumnName":"VITA_DOSE_99_DATE"},{"dbColumnName":"Updated_Date","excelColumnName":"LAST_UPDATE_DATE"},{"dbColumnName":"SMS_Status","excelColumnName":"SMS_STATUS"},{"dbColumnName":"Remarks","excelColumnName":"REMARKS"},{"dbColumnName":"ANM_ID","excelColumnName":"ANM_ID"},{"dbColumnName":"ASHA_ID","excelColumnName":"ASHA_ID"},{"dbColumnName":"Created_By","excelColumnName":"CREATED_BY"},{"dbColumnName":"Updated_By","excelColumnName":"UPDATED_BY"},{"dbColumnName":"Measles_2_Date","excelColumnName":"MEASLES_2_DATE"},{"dbColumnName":"DueServices","excelColumnName":"DUE SERVICES"},{"dbColumnName":"OverDueServices","excelColumnName":"OVER DUE SERVICES"},{"dbColumnName":"GivenServices","excelColumnName":"GIVEN SERVICES"}]', 'Child Data', v_ProviderServiceMapID, 'Trigger - MCTSExcelMapping');

else if (v_ServiceID =6 and v_StateID = 18)
then
INSERT INTO `db_iemr`.`m_mctsfieldsstatewise` (`DataFields`, `FieldsFor`, `ProviderServiceMapID`, `CreatedBy`) VALUES ('[{"dbColumnName":"District_ID","excelColumnName":"DISTRICT ID"},{"dbColumnName":"District_Name","excelColumnName":"DIST NAME"},{"dbColumnName":"Source","excelColumnName":"SOURCE"},{"dbColumnName":"Taluka_Name","excelColumnName":"TAL NAME"},{"dbColumnName":"Block_ID","excelColumnName":"BLOCK CD"},{"dbColumnName":"Block_Name","excelColumnName":"BLOCK NAME"},{"dbColumnName":"PHC_ID","excelColumnName":"PHC CD"},{"dbColumnName":"PHC_Name","excelColumnName":"PHC NAME"},{"dbColumnName":"SUBPHC_ID","excelColumnName":"SUBPHC CD"},{"dbColumnName":"SUBPHC_Name","excelColumnName":"SC NAME"},{"dbColumnName":"YR","excelColumnName":"YR"},{"dbColumnName":"GP_Village","excelColumnName":"GP VILLAGE"},{"dbColumnName":"Address","excelColumnName":"ADDRESS"},{"dbColumnName":"MCTSID_no","excelColumnName":"ID NO"},{"dbColumnName":"Name","excelColumnName":"NAME"},{"dbColumnName":"Husband_Name","excelColumnName":"HUSBAND NAME"},{"dbColumnName":"PhoneNo_Of_Whom","excelColumnName":"PHONENO OF WHOM"},{"dbColumnName":"Whom_PhoneNo","excelColumnName":"WHOM PHONENO"},{"dbColumnName":"Birth_Date","excelColumnName":"BIRTHDATE"},{"dbColumnName":"Age","excelColumnName":"AGE"},{"dbColumnName":"JSY_Beneficiary","excelColumnName":"JSY BENEFICIARY"},{"dbColumnName":"Caste","excelColumnName":"CASTE"},{"dbColumnName":"SubCenter_Name","excelColumnName":"SUBCENTRE NAME"},{"dbColumnName":"ANM_Name","excelColumnName":"ANM NAME"},{"dbColumnName":"ANM_Ph","excelColumnName":"ANM PHONE"},{"dbColumnName":"ASHA_Name","excelColumnName":"ASHA NAME"},{"dbColumnName":"ASHA_Ph","excelColumnName":"ASHA PHONE"},{"dbColumnName":"Delivery_Lnk_Facility","excelColumnName":"DELIVERY LNK FACILITY"},{"dbColumnName":"Facility_Name","excelColumnName":"FACILITY NAME"},{"dbColumnName":"LMP_Date","excelColumnName":"LMP DATE"},{"dbColumnName":"ANC1_Date","excelColumnName":"ANC1 DATE"},{"dbColumnName":"ANC2_Date","excelColumnName":"ANC2 DATE"},{"dbColumnName":"ANC3_Date","excelColumnName":"ANC3 DATE"},{"dbColumnName":"ANC4_Date","excelColumnName":"ANC4 DATE"},{"dbColumnName":"TT1_Date","excelColumnName":"TT1 DATE"},{"dbColumnName":"TT2_Date","excelColumnName":"TT2 DATE"},{"dbColumnName":"TTBooster_Date","excelColumnName":"TTBOOSTER DATE"},{"dbColumnName":"IFA100_Given_Date","excelColumnName":"IFA100 GIVEN DATE"},{"dbColumnName":"EDD","excelColumnName":"EDD"},{"dbColumnName":"Anemia","excelColumnName":"ANEMIA"},{"dbColumnName":"ANC_Complication","excelColumnName":"ANC COMPLICATION"},{"dbColumnName":"RTI_STI","excelColumnName":"RTI STI"},{"dbColumnName":"Delivery_Date","excelColumnName":"DLY DATE"},{"dbColumnName":"Delivery_Place_home_type","excelColumnName":"DLY PLACE HOME TYPE"},{"dbColumnName":"Delivery_Place_Public","excelColumnName":"DLY PLACE PUBLIC"},{"dbColumnName":"Delivery_Place_Private","excelColumnName":"DLY PLACE PRIVATE"},{"dbColumnName":"Delivery_type","excelColumnName":"DLY TYPE"},{"dbColumnName":"Delivery_Complications","excelColumnName":"DLY COMPLICATION"},{"dbColumnName":"Discharge_Date","excelColumnName":"DISCHARGE DATE"},{"dbColumnName":"JSY_Paid_Date","excelColumnName":"JSY PAID DATE"},{"dbColumnName":"Abortion","excelColumnName":"ABORTION"},{"dbColumnName":"PNC_Home_Visit","excelColumnName":"PNC HOME VISIT"},{"dbColumnName":"PNC_Complication","excelColumnName":"PNC COMPLICATION"},{"dbColumnName":"PPC_Method","excelColumnName":"PPC METHOD"},{"dbColumnName":"PNC_Checkup","excelColumnName":"PNC CHECKUP"},{"dbColumnName":"Outcome_Nos","excelColumnName":"OUTCOME NOS"},{"dbColumnName":"Child1_Name","excelColumnName":"CHILD1 NAME"},{"dbColumnName":"Child1_Gender","excelColumnName":"CHILD1 SEX"},{"dbColumnName":"Child1_Weight","excelColumnName":"CHILD1 WT"},{"dbColumnName":"Child1_BreastFeeding","excelColumnName":"CHILD1 BRESTFEEDING"},{"dbColumnName":"Child2_Name","excelColumnName":"CHILD2 NAME"},{"dbColumnName":"Child2_Gender","excelColumnName":"CHILD2 SEX"},{"dbColumnName":"Child2_weight","excelColumnName":"CHILD2 WT"},{"dbColumnName":"Child2_Breastfeeding","excelColumnName":"CHILD2 BRESTFEEDING"},{"dbColumnName":"Child3_Name","excelColumnName":"CHILD3 NAME"},{"dbColumnName":"Child3_Gender","excelColumnName":"CHILD3 SEX"},{"dbColumnName":"Child3_Weight","excelColumnName":"CHILD3 WT"},{"dbColumnName":"Child3_Breastfeeding","excelColumnName":"CHILD3 BRESTFEEDING"},{"dbColumnName":"Child4_Name","excelColumnName":"CHILD4 NAME"},{"dbColumnName":"Child4_Gender","excelColumnName":"CHILD4 SEX"},{"dbColumnName":"Child4_Weight","excelColumnName":"CHILD4 WT"},{"dbColumnName":"Child4_Breastfeeding","excelColumnName":"CHILD4 BRESTFEEDING"},{"dbColumnName":"Mother_Reg_Date","excelColumnName":"MTHR REG DATE"},{"dbColumnName":"Last_Update_Date","excelColumnName":"LASTUPDATEDATE"},{"dbColumnName":"Aadhar_no","excelColumnName":"AADHAR NO"},{"dbColumnName":"EID","excelColumnName":"EID"},{"dbColumnName":"EID_time","excelColumnName":"EIDTIME"},{"dbColumnName":"CPSMS_Flag","excelColumnName":"CPSMS FLAG"},{"dbColumnName":"Bank_Name","excelColumnName":"BANK NAME"},{"dbColumnName":"Bank_Branch_Name","excelColumnName":"BRANCH NAME"},{"dbColumnName":"Acc_No","excelColumnName":"ACC NO"},{"dbColumnName":"IFSC_Code","excelColumnName":"IFSC CODE"},{"dbColumnName":"Remarks","excelColumnName":"REMARKS"},{"dbColumnName":"Referred_By_Telecaller","excelColumnName":"REFERRED BY TELECALLER"},{"dbColumnName":"Referred_Date","excelColumnName":"REFERRED DATE"}]', 'Mother Data', v_ProviderServiceMapID, 'Trigger - MCTSExcelMapping');
INSERT INTO `db_iemr`.`m_mctsfieldsstatewise` (`DataFields`, `FieldsFor`, `ProviderServiceMapID`, `CreatedBy`) VALUES ('[{"dbColumnName":"My_ID","excelColumnName":"MY ID"},{"dbColumnName":"State_ID","excelColumnName":"STATE ID"},{"dbColumnName":"District_ID","excelColumnName":"DISTRICT ID"},{"dbColumnName":"District_Name","excelColumnName":"DISTRICT NAME"},{"dbColumnName":"Source","excelColumnName":"SOURCE"},{"dbColumnName":"Taluka_Name","excelColumnName":"TALUKA NAME"},{"dbColumnName":"Block_ID","excelColumnName":"HEALTH BLOCK ID"},{"dbColumnName":"Block_Name","excelColumnName":"HEALTH BLOCK NAME"},{"dbColumnName":"PHC_ID","excelColumnName":"PHC ID"},{"dbColumnName":"PHC_Name","excelColumnName":"PHC NAME"},{"dbColumnName":"SubCenter_ID","excelColumnName":"SUBCENTER ID"},{"dbColumnName":"SubCenter_Name","excelColumnName":"SUBCENTER NAME"},{"dbColumnName":"Village_ID","excelColumnName":"VILLAGE ID"},{"dbColumnName":"Village_Name","excelColumnName":"VILLAGE NAME"},{"dbColumnName":"Rural_urban","excelColumnName":"RURAL URBAN"},{"dbColumnName":"Year","excelColumnName":"YEAR"},{"dbColumnName":"SNO","excelColumnName":"SNO"},{"dbColumnName":"City","excelColumnName":"CITY MOHOLLA"},{"dbColumnName":"GP_Village","excelColumnName":"GP VILLAGE"},{"dbColumnName":"Address","excelColumnName":"ADDRESS"},{"dbColumnName":"MCTSID_no_Child_ID","excelColumnName":"CHILD ID"},{"dbColumnName":"Child_Name","excelColumnName":"CHILD NAME"},{"dbColumnName":"Mother_Name","excelColumnName":"MOTHER NAME"},{"dbColumnName":"Mother_ID","excelColumnName":"MOTHER ID"},{"dbColumnName":"Phone_No_of","excelColumnName":"PHONE NO OF WHOM"},{"dbColumnName":"Phone_No","excelColumnName":"PHONE NO"},{"dbColumnName":"DOB","excelColumnName":"BIRTH DATE"},{"dbColumnName":"Place_of_Birth","excelColumnName":"PLACE OF DELIVERY"},{"dbColumnName":"BloodGroup","excelColumnName":"BLOOD GROUP"},{"dbColumnName":"Caste","excelColumnName":"CASTE"},{"dbColumnName":"ANM_Name","excelColumnName":"ANM NAME"},{"dbColumnName":"ANM_Phone_No","excelColumnName":"ANM PHONE NO"},{"dbColumnName":"ASHA_Name","excelColumnName":"ASHA NAME"},{"dbColumnName":"ASHA_Phone_No","excelColumnName":"ASHA PHONE NO"},{"dbColumnName":"BCG_Date","excelColumnName":"BCG DATE"},{"dbColumnName":"OPV0_Date","excelColumnName":"OPV 0 DATE"},{"dbColumnName":"Hepatitis_B1_Date","excelColumnName":"HEPATITIS B 1 DATE"},{"dbColumnName":"DPT1_Date","excelColumnName":"DPT 1 DATE"},{"dbColumnName":"OPV1_Date","excelColumnName":"OPV 1 DATE"},{"dbColumnName":"Hepatitis_B2_Date","excelColumnName":"HEPATITIS B 2 DATE"},{"dbColumnName":"DPT2_Date","excelColumnName":"DPT 2 DATE"},{"dbColumnName":"OPV2_Date","excelColumnName":"OPV 2 DATE"},{"dbColumnName":"Hepatitis_B3_Date","excelColumnName":"HEPATITIS B 3 DATE"},{"dbColumnName":"DPT3_Date","excelColumnName":"DPT 3 DATE"},{"dbColumnName":"OPV3_Date","excelColumnName":"OPV 3 DATE"},{"dbColumnName":"Hepatitis_B4_Date","excelColumnName":"HEPATITIS B 4 DATE"},{"dbColumnName":"Measles_Date","excelColumnName":"MEASLES DATE"},{"dbColumnName":"VitA_Dose1_Date","excelColumnName":"VITA DOSE 1 DATE"},{"dbColumnName":"MR_Date","excelColumnName":"MR DATE"},{"dbColumnName":"DPTBooster_Date","excelColumnName":"DPT BOOSTER DATE"},{"dbColumnName":"OPVBooster_Date","excelColumnName":"OPV BOOSTER DATE"},{"dbColumnName":"VitA_Dose2_Date","excelColumnName":"VITA DOSE 2 DATE"},{"dbColumnName":"VitA_Dose3_Date","excelColumnName":"VITA DOSE 3 DATE"},{"dbColumnName":"DT5_Date","excelColumnName":"DT5_Dt"},{"dbColumnName":"VitA_Dose9_Date","excelColumnName":"VITA DOSE 9 DATE"},{"dbColumnName":"TT10_Date","excelColumnName":"TT 10 DATE"},{"dbColumnName":"TT16_Date","excelColumnName":"TT 16 DATE"},{"dbColumnName":"is_Upload","excelColumnName":"IS UPLOAD"},{"dbColumnName":"Emamta_Health_ID","excelColumnName":"EMAMTAHEALTH ID"},{"dbColumnName":"Emamta_Family_ID","excelColumnName":"EMAMTAFAMILY ID"},{"dbColumnName":"CID_NO","excelColumnName":"CID NO"},{"dbColumnName":"MID_NO","excelColumnName":"MID NO"},{"dbColumnName":"Delete_Mother","excelColumnName":"DELETE MOTHER"},{"dbColumnName":"Delete_Reason","excelColumnName":"REASON DELETION"},{"dbColumnName":"Deleted_ON","excelColumnName":"DELETED ON"},{"dbColumnName":"Entry_type","excelColumnName":"ENTRY TYPE"},{"dbColumnName":"Registration_Date","excelColumnName":"CHILD REGESTERED DATE"},{"dbColumnName":"Duplicate_Bit","excelColumnName":"DUPLICATE BIT"},{"dbColumnName":"FacilityType","excelColumnName":"FACILITY TYPE"},{"dbColumnName":"Gender","excelColumnName":"SEX"},{"dbColumnName":"VitA_Dose5_Date","excelColumnName":"VITA DOSE 5 DATE"},{"dbColumnName":"VitA_Dose6_Date","excelColumnName":"VITA DOSE 6 DATE"},{"dbColumnName":"VitA_Dose7_Date","excelColumnName":"VITA DOSE 7 DATE"},{"dbColumnName":"VitA_Dose8_Date","excelColumnName":"VITA DOSE 8 DATE"},{"dbColumnName":"VitA_Dose99_Date","excelColumnName":"VITA DOSE 99 DATE"},{"dbColumnName":"Updated_Date","excelColumnName":"LAST UPDATE DATE"},{"dbColumnName":"SMS_Status","excelColumnName":"SMS STATUS"},{"dbColumnName":"Remarks","excelColumnName":"REMARKS"},{"dbColumnName":"ANM_ID","excelColumnName":"ANM ID"},{"dbColumnName":"ASHA_ID","excelColumnName":"ASHA ID"},{"dbColumnName":"Created_By","excelColumnName":"CREATED BY"},{"dbColumnName":"Updated_By","excelColumnName":"UPDATED BY"},{"dbColumnName":"Measles_2_Date","excelColumnName":"MEASLES 2 DATE"}]', 'Child Data', v_ProviderServiceMapID, 'Trigger - MCTSExcelMapping');

end if; 
end if;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_InstituteBulkUpload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `PR_InstituteBulkUpload`(
IN_InstDet longtext,v_Created_by varchar(50),v_userid int(11),v_serviceproviderid int(11)
)
BEGIN

declare ReCount int(11);
declare v_insertcount int(11);
declare v_updatecount int(11);
declare v_recordcount int(11);
declare v_validrecordcount int(11);

declare v_tempcount int(11);
declare e_error int(11);
declare Count int(11);

SET SQL_SAFE_UPDATES = 0;

     drop temporary table if exists temp;
    
	create temporary table temp (jsondata longtext);
    
     drop temporary table if exists temp_institution;
    CREATE temporary TABLE `temp_institution` (
  `InstitutionID` int(11) NOT NULL AUTO_INCREMENT,
  `Serviceline` varchar(100) DEFAULT NULL,
  `InstitutionName` varchar(100) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `BlockID` int(11) DEFAULT NULL,
  `DistrictBranchMappingID` int(11) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `ContactPerson1` varchar(50) DEFAULT NULL,
  `ContactPerson1_Email` varchar(30) DEFAULT NULL,
  `ContactNo1` varchar(15) DEFAULT NULL,
  `ContactPerson2` varchar(50) DEFAULT NULL,
  `ContactPerson2_Email` varchar(30) DEFAULT NULL,
  `ContactNo2` varchar(15) DEFAULT NULL,
  `ContactPerson3` varchar(50) DEFAULT NULL,
  `ContactPerson3_Email` varchar(30) DEFAULT NULL,
  `ContactNo3` varchar(30) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  InstitutionType varchar(100),
  `InstitutionTypeId` int(11) DEFAULT NULL,
  State varchar(100),
  District varchar(100),
  Taluk varchar(100),
  PRIMARY KEY (`InstitutionID`)
) ;

	select  JSON_LENGTH(json_extract(IN_InstDet,"$.InstitutionDetails")) into ReCount;
   
      set count=0;
 	WHILE count  <= ReCount DO
    SET @sql_text:=CONCAT(' insert into temp select json_extract(''',IN_InstDet, ''',"$.InstitutionDetails[',count,']");');  
	PREPARE stmt from @sql_text; 
	EXECUTE stmt;
	 SET  count = count + 1; 
	 
insert into temp_institution(  Serviceline,state,district,taluk,InstitutionName, 
 Address, ContactPerson1, ContactPerson1_Email, ContactNo1, 
ContactPerson2, ContactPerson2_Email, ContactNo2, ContactPerson3, ContactPerson3_Email, 
ContactNo3, Website, InstitutionType)

     select  replace(JSON_EXTRACT(jsondata, '$.Serviceline'),'"','') as Serviceline,
        replace(JSON_EXTRACT(jsondata, '$.State'),'"','') as State,
        replace(JSON_EXTRACT(jsondata, '$.District'),'"','') as District,
        replace(JSON_EXTRACT(jsondata, '$.Taluk'),'"','') as Taluk,
		replace(JSON_EXTRACT(jsondata, '$.InstitutionName'),'"','') as InstitutionName,
        replace(JSON_EXTRACT(jsondata, '$.Address'),'"','') as Address,
          replace(JSON_EXTRACT(jsondata, '$.PrimaryContactPerson'),'"','') as ContactPerson1,
            replace(JSON_EXTRACT(jsondata, '$.PrimaryEmailID'),'"','') as ContactPerson1_Email,
              replace(JSON_EXTRACT(jsondata, '$.PrimaryContactNumber'),'"','') as ContactNo1,
                replace(JSON_EXTRACT(jsondata, '$.SecondaryContactPerson'),'"','') as ContactPerson2,
                replace(JSON_EXTRACT(jsondata, '$.SecondaryEmailID'),'"','') as ContactPerson2_Email,
                replace(JSON_EXTRACT(jsondata, '$.SecondaryContactNumber'),'"','') as ContactNo2,
                replace(JSON_EXTRACT(jsondata, '$.TertiaryContactPerson'),'"','') as ContactPerson3,
                replace(JSON_EXTRACT(jsondata, '$.TertiaryEmailID'),'"','') as ContactPerson3_Email,
                replace(JSON_EXTRACT(jsondata, '$.TertiaryContactNumber'),'"','') as ContactNo3,
                replace(JSON_EXTRACT(jsondata, '$.Website'),'"','') as Website,
                replace(JSON_EXTRACT(jsondata, '$.InstituteType'),'"','') as InstitutionType
        
             from temp;
	  delete from temp;
	 END WHILE;
     
     
     update temp_institution t
     inner join db_iemr.m_state s on s.StateName=t.State
     set t.StateID=s.StateID;
     
     update temp_institution t
     inner join db_iemr.m_district s on s.districtname=t.district
     set t.districtid=s.districtid;
     
     
     update temp_institution t
     inner join db_iemr.m_districtblock s on s.blockname=t.taluk
     set t.blockid=s.blockid;
     
     
     
     update temp_institution t
   
     inner join db_iemr.m_servicemaster sm on sm.ServiceName=t.serviceline
     inner join db_iemr.m_providerservicemapping s on 
      s.StateID=t.StateID
     and s.serviceproviderid=v_serviceproviderid and s.serviceid=sm.ServiceID
    
     set t.ProviderServiceMapID=s.ProviderServiceMapID
     where s.Deleted is false  and sm.ServiceID!=1;
     
     
     
     
     update temp_institution t
   
     inner join db_iemr.m_servicemaster sm on sm.ServiceName=t.serviceline
     inner join db_iemr.m_providerservicemapping s on 
    
      s.serviceproviderid=v_serviceproviderid and s.serviceid=sm.ServiceID
    
     set t.ProviderServiceMapID=s.ProviderServiceMapID
     where s.Deleted is false and sm.ServiceID=1;
     
     update temp_institution t
     inner join db_iemr.m_institutiontype s on s.institutiontype=t.InstitutionType
     and t.providerservicemapid=s.ProviderServiceMapID
     set t.institutiontypeid=s.institutiontypeid;
     
    /*drop table if exists temp_institution_check;
     create table temp_institution_check as
     select * from temp_institution;*/
     
     select count(1) into v_recordcount 
      from temp_institution where InstitutionName is not null;
     
     select count(1) into v_validrecordcount 
      from temp_institution t
 where t.InstitutionName is not null and t.StateID is not null 
 and t.institutiontypeid is not null
  and t.DistrictID is not null and t.blockid is not null
 
 

  
  and t.InstitutionName not  REGEXP '[0-9]' and length(t.InstitutionName)>=3
 --  and t.ContactPerson1 not  REGEXP '[0-9]' and length(t.ContactPerson1)>=2
 -- and length(t.ContactNo1)=10
 and ((length(t.ContactNo1)=10) 
 or(ifnull(trim(t.ContactNo1),'')=''))
  
   and t.ProviderServiceMapID is not null
    and t.Address is not null ;
   
   
     select count(1) into v_tempcount
      from temp_institution where InstitutionName is not null ;
      
      
   if ((v_recordcount=v_validrecordcount) and v_tempcount>0) then    
   
     
     update temp_institution t
 inner join db_iemr.m_institution m on m.Institutionname=t.InstitutionName
  and m.StateID=t.stateid and m.DistrictID=t.districtid 
  and t.providerservicemapid=m.providerservicemapid
 set m.StateID=t.stateid, m.DistrictID=t.DistrictID, m.BlockID=t.BlockID,  
 m.Address=t.Address, m.ContactPerson1=t.ContactPerson1, 
 m.ContactPerson1_Email=t.ContactPerson1_Email, m.ContactNo1=t.ContactNo1, 
 m.ContactPerson2=t.ContactPerson2, m.ContactPerson2_Email=t.ContactPerson2_Email, 
 m.ContactNo2=t.ContactNo2, 
 m.ContactPerson3=t.ContactPerson3, 
m.ContactPerson3_Email= t.ContactPerson3_Email, m.ContactNo3=t.ContactNo3, 
m.Website=t.Website, m.ProviderServiceMapID=t.ProviderServiceMapID, 
m.CreatedBy= replace(v_Created_by, '"',''),m.InstituteTypeId=t.InstitutionTypeId
 
 where  t.InstitutionName is not null and t.StateID is not null 
 and t.institutiontypeid is not null
  and t.DistrictID is not null and t.blockid is not null
 
 
 
 and t.InstitutionName not  REGEXP '[0-9]' and length(t.InstitutionName)>=3
 --  and t.ContactPerson1 not  REGEXP '[0-9]' and length(t.ContactPerson1)>=2
 -- and length(t.ContactNo1)=10 
 and ((length(t.ContactNo1)=10) 
 or(ifnull(trim(t.ContactNo1),'')=''))
  
   and t.ProviderServiceMapID is not null
   and t.Address is not null ;
 
    
   set v_updatecount=row_count();
     
 insert into db_iemr.m_institution(InstitutionName, StateID, DistrictID, BlockID,  Address, 
 ContactPerson1, 
 ContactPerson1_Email, ContactNo1, ContactPerson2, ContactPerson2_Email, ContactNo2,
  ContactPerson3_Email,ContactPerson3, 
 ContactNo3, Website, ProviderServiceMapID, Deleted, Processed, CreatedBy, 
 InstituteTypeId)
 select t.InstitutionName, t.StateID, t.DistrictID, t.BlockID,  
 t.Address, t.ContactPerson1, 
 t.ContactPerson1_Email, t.ContactNo1, t.ContactPerson2, t.ContactPerson2_Email, t.ContactNo2, 
 t.ContactPerson3_Email, t.ContactPerson3, 
 t.ContactNo3, t.Website, t.ProviderServiceMapID, b'0' Deleted,
 'N' Processed,  replace(v_Created_by, '"',''),
  t.InstitutionTypeId
 from temp_institution t
 left join db_iemr.m_institution m on m.Institutionname=t.InstitutionName
 and m.StateID=t.stateid and m.DistrictID=t.districtid and t.providerservicemapid=m.providerservicemapid
 where m.InstitutionName is null and t.InstitutionName is not null and t.StateID is not null
  and t.institutiontypeid is not null
  and t.DistrictID is not null and t.blockid is not null
 
 and t.InstitutionName not  REGEXP '[0-9]' and length(t.InstitutionName)>=3
  -- and t.ContactPerson1 not  REGEXP '[0-9]' and length(t.ContactPerson1)>=2
 -- and length(t.ContactNo1)=10
 and ((length(t.ContactNo1)=10) 
 or(ifnull(trim(t.ContactNo1),'')=''))
  
   and t.ProviderServiceMapID is not null
   and t.Address is not null  ;
   
   set v_insertcount=row_count();
   
   
   select  v_insertcount 'Records Saved Successfully',
  
    v_updatecount 'Records Updated Successfully';
  
   
   else 
     set e_error=-1;
  select e_error 'File format is not proper', e_error 'file format error';
  end if;
  
  
 
     
     

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSCallAnsweredReport_Pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_MCTSCallAnsweredReport_Pivot`(
 v_starttime datetime,v_endtime datetime,
 v_effectiveFrom datetime,v_outboundCallType varchar(20),
 v_VerifiedData varchar(10),
 v_Agentid int(11),v_psmid int(11))
begin
 -- Mother ID	Mother Name	Child ID	Child Name	Phone No	Anm Name	
 -- Asha Name	Phc Name	Address	District Name	Block Name	Sub Center Name	
 -- Outbound Call Type	Display Call Type	Call Date And Time	Remark;
 
 /*drop temporary table if exists temp_MctsQAMapping;
 create temporary table temp_MctsQAMapping 
 select mcts.QuestionID,mctsq.question from db_iemr.m_MctsQAMapping mcts 
 inner join db_iemr.m_questionnaire  mctsq on mcts.questionid=mcts.Questionid
  where mcts.outboundCallType = v_outboundCallType and mcts.providerServiceMapID = v_psmid
  and mcts.deleted is false and mcts.effectiveFrom = v_effectiveFrom
  and mcts.interaction is null ;*/
 drop temporary table if exists temp_questions;
 create temporary table temp_questions as 
 select mcts.QuestionID QuestionID , mctsq.question,mctsq.questionrank from db_iemr.m_MctsQAMapping mcts 
 inner join db_iemr.m_questionnaire  mctsq on mctsq.questionid=mcts.Questionid
  where mcts.outboundCallType = ifnull(v_outboundCallType,mcts.outboundCallType) 
  and mcts.providerServiceMapID = ifnull(v_psmid,mcts.providerServiceMapID)
  and mcts.deleted is false and 
  mcts.effectiveFrom= ifnull(v_effectiveFrom,mcts.effectiveFrom)
  and mcts.interaction is null order by mctsq.questionrank asc;
  
  
 if ( v_VerifiedData='true') then

 drop temporary table if exists temp_Answereddata;
 create temporary table temp_Answereddata as 
 select distinct fm.MCTSID_no "MotherID", fb.CallID callID,fm.name "MotherName",
 fm.Child1_ID "ChildID",fm.Child1_Name "ChildName",fm.Whom_PhoneNo "PhoneNo",
 fm.ANM_Name "AnmName",fm.ASHA_Name "AshaName",fm.PHC_Name "PhcName",
 fm.Address "Address",
 fm.District_Name "DistrictName",fm.Block_Name "BlockName",
 fm.SubCenter_Name "SubCenterName",
 fo.OutboundCallType "OutboundCallType",fo.DisplayOBCallType "DisplayCallType",
 fb.CallTime "CallDateAndTime",fb.Remarks "Remark",fr.questionid,
 fr.Question Question,fr.Answer  
 from fact_bencall fb
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
 left join fact_mctscallresponse fr on fr.BenCallID=fb.BenCallID 
 and fr.MotherID=fm.MCTSID_no
 where fb.IsMother is true  and fb.isverified is true 
 and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
              and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
              and fo.outboundCallType = ifnull(v_outboundCallType,fo.outboundCallType)
 and   fb.CallTypeid 
               in (select calltypeid from db_iemr.m_calltype
              where callgrouptype='Answered' and calltype='Answered')
 
 union all
 
 select distinct fm.Mother_ID, fb.CallID callID,fm.Mother_Name,fm.MCTSID_no_Child_ID,fm.Child_Name,fm.Phone_No,
 fm.ANM_Name,fm.ASHA_Name,fm.PHC_Name,fm.Address,
 fm.District_Name,fm.Block_Name,fm.SubCenter_Name,
 fo.OutboundCallType,fo.DisplayOBCallType,
 fb.CallTime,fb.Remarks,fr.questionid,
 fr.Question Question,fr.Answer  
 from fact_bencall fb
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_childvalidrecord fm on fm.MCTSID_no_Child_ID=fo.childid
 left join fact_mctscallresponse fr on fr.BenCallID=fb.BenCallID 
 and fr.ChildID=fm.MCTSID_no_Child_ID
 
 where fb.IsMother is false   and fb.isverified is true
 and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
              and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
               and fo.outboundCallType = ifnull(v_outboundCallType,fo.outboundCallType)
              and   fb.CallTypeid 
               in (select calltypeid from db_iemr.m_calltype
              where callgrouptype='Answered' and calltype='Answered');
    --   SELECT * FROM temp_Answereddata;       
              
               SET SESSION group_concat_max_len = 1000000;
               
              drop temporary table if exists temp_MctsQAMapping_pivot; 
              create temporary table temp_MctsQAMapping_pivot as 
  select distinct t.question question,t.questionrank from temp_questions t
  left join temp_Answereddata a on t.questionid=a.questionid order by t.questionrank asc ;
  
  -- select * from temp_MctsQAMapping_pivot;
  
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
  
      CONCAT(
      'max(case when `question`= ''',
       `question`,
      ''' then Answer end)  ',
       concat('"',`question`,'"')
    ) order by questionrank asc
  ) INTO @sql 
FROM
  
  temp_MctsQAMapping_pivot;
  

  
    if( @sql is  null) then
select distinct MotherID,MotherName,ChildID,ChildName,
  PhoneNo,AnmName,AshaName,PhcName,Address,DistrictName,BlockName,
 SubCenterName, OutboundCallType,DisplayCallType,CallDateAndTime,Remark 
 from temp_Answereddata;
 end if;   
  
  -- select @sql;
  if( @sql is not null) then
  SET @sql2 = CONCAT('select MotherID,MotherName,ChildID,ChildName,
  PhoneNo,AnmName,AshaName,PhcName,Address,DistrictName,BlockName,
 SubCenterName, OutboundCallType,DisplayCallType,CallDateAndTime,Remark, 
  ', @sql,'  FROM 
                  temp_Answereddata group by MotherID,MotherName,ChildID,ChildName,
  PhoneNo,AnmName,AshaName,PhcName,Address,DistrictName,BlockName,
 SubCenterName, OutboundCallType,DisplayCallType,CallDateAndTime,Remark  ;');
                 
             
              PREPARE stmt FROM @sql2;
execute stmt;
DEALLOCATE PREPARE stmt;
end if;

end if;


  
 
 if ( v_VerifiedData='false') then
 
 drop temporary table if exists temp_Answereddata; 
 create temporary table temp_Answereddata as 
 select  distinct fm.MCTSID_no "MotherID", fb.CallID callID, fm.name "MotherName",
 fm.Child1_ID "ChildID",fm.Child1_Name "ChildName",fm.Whom_PhoneNo "PhoneNo",
 fm.ANM_Name "AnmName",fm.ASHA_Name "AshaName",fm.PHC_Name "PhcName",
 fm.Address "Address",
 fm.District_Name "DistrictName",fm.Block_Name "BlockName",
 fm.SubCenter_Name "SubCenterName",
 fo.OutboundCallType "OutboundCallType",fo.DisplayOBCallType "DisplayCallType",
 fb.CallTime "CallDateAndTime",fb.Remarks "Remark",fr.questionid,fr.Question Question,fr.Answer  
  
 from fact_bencall fb
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
 left join fact_mctscallresponse fr on fr.BenCallID=fb.BenCallID 
 and fr.MotherID=fm.MCTSID_no
 where fb.IsMother is true -- and fb.isverified is false 
 and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
              and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
               and fo.outboundCallType = ifnull(v_outboundCallType,fo.outboundCallType)
 and   fb.CallTypeid 
               in (select calltypeid from db_iemr.m_calltype
              where callgrouptype='Answered' and calltype='Answered')
 
 union all
 
 select distinct  fm.Mother_ID, fb.CallID callID,fm.Mother_Name,fm.MCTSID_no_Child_ID,fm.Child_Name,fm.Phone_No,
 fm.ANM_Name,fm.ASHA_Name,fm.PHC_Name,fm.Address,
 fm.District_Name,fm.Block_Name,fm.SubCenter_Name,
 fo.OutboundCallType,fo.DisplayOBCallType,
 fb.CallTime,fb.Remarks,fr.questionid,fr.Question,fr.Answer  
 from fact_bencall fb
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_childvalidrecord fm on fm.MCTSID_no_Child_ID=fo.childid
 left join fact_mctscallresponse fr on fr.BenCallID=fb.BenCallID 
 and fr.ChildID=fm.MCTSID_no_Child_ID
 
 where fb.IsMother is false  -- and fb.isverified is false
 and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
              and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
                and fo.outboundCallType = ifnull(v_outboundCallType,fo.outboundCallType)
              and   fb.CallTypeid 
               in (select calltypeid from db_iemr.m_calltype
              where callgrouptype='Answered' and calltype='Answered');
              
               SET SESSION group_concat_max_len = 1000000;
              
               drop temporary table if exists temp_MctsQAMapping_pivot; 
              create temporary table temp_MctsQAMapping_pivot as 
  select distinct t.question question,t.questionrank from temp_questions t
  left join temp_Answereddata a on t.questionid=a.questionid order by t.questionrank asc ;
  
  -- select * from temp_MctsQAMapping_pivot;
      
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
  
      CONCAT(
      'max(case when `question`= ''',
       `question`,
      ''' then Answer end)  ',
       concat('"',`question`,'"')
    ) order by questionrank asc) INTO @sql 
FROM
  
  temp_MctsQAMapping_pivot ;
  
    if( @sql is  null) then
select distinct MotherID,MotherName,ChildID,ChildName,
  PhoneNo,AnmName,AshaName,PhcName,Address,DistrictName,BlockName,
 SubCenterName, OutboundCallType,DisplayCallType,CallDateAndTime,Remark 
 from temp_Answereddata;
 end if;   
  
  -- select @sql;
  if( @sql is not null) then
  SET @sql2 = CONCAT('select MotherID,MotherName,ChildID,ChildName,
  PhoneNo,AnmName,AshaName,PhcName,Address,DistrictName,BlockName,
 SubCenterName, OutboundCallType,DisplayCallType,CallDateAndTime,Remark, 
  ', @sql,'  FROM 
                  temp_Answereddata  group by MotherID,MotherName,ChildID,ChildName,
  PhoneNo,AnmName,AshaName,PhcName,Address,DistrictName,BlockName,
 SubCenterName, OutboundCallType,DisplayCallType,CallDateAndTime,Remark;');
                 
              
              PREPARE stmt FROM @sql2;
execute stmt;
DEALLOCATE PREPARE stmt;
end if;
 end if;     
         
 
  
 drop temporary table if exists temp_Answereddata;
 
 drop temporary table if exists temp_questions;
 drop temporary table if exists temp_MctsQAMapping_pivot;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSCallDetailsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_MCTSCallDetailsReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

-- Call Time	Mother District	Child District	Phone Number	
-- Mother ID	Child ID	Status	Remarks

drop temporary table if exists temp_CDR;
create temporary table temp_CDR as
select distinct fb.ReceivedAgentID "User ID",'OUTGOING'CampaignID,
fb.calltime "Call Time",
fm.District_Name "Mother District",'' ChildDistrict,
-- fm.Whom_PhoneNo "Phone Number"
fb.PhoneNo "Phone Number",fm.MCTSID_no "Mother ID",'' ChildID,fb.CallSubTypeName "status",
fb.Remarks "Remarks",fo.NoOfTrials "Count",
fb.obcallid
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            union all
select distinct fb.ReceivedAgentID "User ID",'OUTGOING'CampaignID,
fb.calltime "Call Time",
'' MotherDistrict,fm.District_Name "Child DistrictName",
-- fm.Phone_No "Phone Number",
fb.PhoneNo "Phone Number",
'' MotherID,fm.MCTSID_no_Child_ID ChildID,fb.CallSubTypeName "status",
fb.Remarks "Remarks",fo.NoOfTrials "Count",
fb.obcallid
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  ;
            
            alter table temp_CDR add count_verified int(11) default 0;
            
         set sql_safe_updates=0;   
            update temp_CDR   t
            inner join (select obcallid,count(isverified) count from fact_bencall
             where obcallid is not null and isverified is true
             and providerServiceMapID=ifnull(v_psmid,providerServiceMapID)  
             and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)
			and createdDate >=v_starttime and createdDate <=v_endtime 
             group by obcallid)a 
             on a.obcallid=t.obcallid
              set count_verified=ifnull(a.count,0);
              
select `User ID`, `CampaignID`, `Call Time`, `Mother District`, `ChildDistrict`, `Phone Number`, `Mother ID`, `ChildID`, status, Remarks, Count,  count_verified
 from temp_CDR;
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSCallDetailsUniqueReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSCallDetailsUniqueReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
-- User ID	Call Time	Mother ID	Status	Remarks
select fb.ReceivedAgentID "User ID",
fb.calltime "Call Time",
fm.MCTSID_no "Mother ID",fb.CallSubTypeName "status",
fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime;
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSCallNotAnsweredReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSCallNotAnsweredReport`(
v_starttime datetime,v_endtime datetime,
v_Agentid int(11),v_psmid int(11))
begin
-- /*Mother ID	Mother Name	Child ID	Child Name	Phone No	Anm Name	
-- AshaName	Phc Name	Outbound Call Type	Display Call Type	Call Date And Time	
-- Address	District Name	Block Name	Sub Center Name	Remark	Reason
-- */
select fm.MCTSID_no "Mother ID",fm.name "Mother Name",fm.Child1_ID "Child ID"
,fm.Child1_Name "Child Name",fm.Whom_PhoneNo "Phone No",
fm.ANM_Name "Anm Name",fm.ASHA_Name "Asha Name",fm.PHC_Name "Phc Name",
fo.OutboundCallType "Outbound Call Type",fo.DisplayOBCallType "Display Call Type",
fb.CallTime "Call Date And Time",fm.Address "Address",
fm.District_Name "District Name",fm.Block_Name "Block Name",
fm.SubCenter_Name "Sub Center Name", fb.Remarks "Remarks",fb.CallSubTypeName "Reason"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
-- inner join fact_mctscallresponse fr on fr.BenCallID=fb.BenCallID 
-- and fr.MotherID=fm.MCTSID_no
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
             and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
and   fb.CallTypeid 
             not in(select calltypeid from db_iemr.m_calltype
             where callgrouptype='Answered' and calltype='Answered')

union all

select fm.Mother_ID,fm.Mother_Name,fm.MCTSID_no_Child_ID,fm.Child_Name,fm.Phone_No,
fm.ANM_Name,fm.ASHA_Name,fm.PHC_Name,
fo.OutboundCallType,fo.DisplayOBCallType,
fb.CallTime,fm.Address,fm.District_Name,fm.Block_Name,fm.SubCenter_Name,fb.Remarks ,fb.CallSubTypeName
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord fm on fm.MCTSID_no_Child_ID=fo.childid
where fb.IsMother is false   
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
             and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime 
             and fb.CallTypeid 
             not in(select calltypeid from db_iemr.m_calltype
             where callgrouptype='Answered' and calltype='Answered');
             
    

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSComplaintReport_Child` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_MCTSComplaintReport_Child`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

select  distinct fm.MCTSID_no_Child_ID "Mother ID / Child ID",fm.Child_Name "Beneficiary Caller Name",
fb.phoneno "Beneficiary Phone Number",
fb.PhoneNo "Another Contact Number",
fm.District_Name "District Name",fm.Block_Name "Block" ,
fm.Village_Name "Village",fo.OutboundCallType "Call Type",
fo.DisplayOBCallType "Display Call Type",
ff.FeedbackTypeName "Type Of Complain",
ff.feedbacknaturename "Nature Of Complaint",
ff.InstitutionName "Institute Name",
ff.DesignationName "Designation",  ff.FeedbackAgainst "Complaint Against",
ff.createddate "Date Of Complaint",
ff.feedback "Briefof Complaint",
ff.feedback "Detailsof Complaint"
 from fact_feedback ff
 inner join fact_bencall fb on fb.bencallid=ff.bencallid
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where  fb.ismother is false and ff.providerServiceMapID=ifnull(v_psmid,ff.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and ff.createdDate >=v_starttime and ff.createdDate <=v_endtime  ;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSComplaintReport_Mother` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_MCTSComplaintReport_Mother`(
 v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
 
 select  distinct fo.MotherID "Mother ID / Child ID",fm.Name "Beneficiary Caller Name",
 fm.whom_phoneno "Beneficiary Phone Number",
 fb.PhoneNo "Another Contact Number",
 fm.District_Name "District Name",fm.Block_Name "Block" ,
 fm.Village_Name "Village",fo.OutboundCallType "Call Type",
 fo.DisplayOBCallType "Display Call Type",
 ff.FeedbackTypeName "Type Of Complain",
 ff.feedbacknaturename "Nature Of Complaint",
 ff.InstitutionName "Institute Name",
 ff.DesignationName "Designation",  ff.FeedbackAgainst "Complaint Against",
 ff.createddate "Date Of Complaint",
 ff.feedback "Briefof Complaint",
 ff.feedback "Detailsof Complaint"
  from fact_feedback ff
  inner join fact_bencall fb on fb.bencallid=ff.bencallid
 inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
 inner join fact_mothervalidrecord  fm on fm.MCTSID_no=fo.MotherID
 where  fb.ismother is true and ff.providerServiceMapID=ifnull(v_psmid,ff.providerServiceMapID)  
              and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
 			and ff.createdDate >=v_starttime and ff.createdDate <=v_endtime  ;
 
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSCongenitalAnomalies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_MCTSCongenitalAnomalies`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

select  distinct fm.Mother_ID "Mother ID",fm.Mother_Name "Mother Name",fm.MCTSID_no_Child_ID "Child ID",
fm.Child_Name "Child Name",fm.DOB "Dob",
fm.Address "Address",fm.ANM_Name "Anm Name",fm.ASHA_Name "Asha Name",
fm.Phone_No "Phone No",c.CongenitalAnomalies "Congenital Anomalies",c.Remarks
 from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
inner join  fact_childcongenitalanomalies c on c.childid=fm.MCTSID_no_Child_ID
where c.providerServiceMapID=ifnull(v_psmid,c.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and c.createdDate >=v_starttime and c.createdDate <=v_endtime  ;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSDailyReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSDailyReport`(
v_starttime datetime,v_endtime datetime,
v_isMother varchar(10),
v_Agentid int(11),v_psmid int(11))
begin
declare v_stateid int(11);
select distinct stateid into v_stateid  from db_iemr.m_providerservicemapping 
where ProviderServiceMapID=v_psmid;

drop temporary table if exists temp_dailyReport;
create temporary table temp_dailyReport(
Date datetime,	Districtid int(11),Districts varchar(100),	TotalCalls int(11),
	TotalUniqueCalls int(11),	TotalSelfNoCalls int(11),
	TotalOtherNoCalls int(11),	TotalAnsweredCalls int(11),
	TotalVerifiedCalls	int(11),TotalUnVerifiedCalls int(11));
    
     insert into temp_dailyReport(Date,Districtid,Districts)
    select v_starttime,Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
    insert into temp_dailyReport(Date,Districtid,Districts)
    select date_add(v_starttime, interval 1 day),Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
     insert into temp_dailyReport(Date,Districtid,Districts)
    select date_add(v_starttime, interval 2 day),Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
    insert into temp_dailyReport(Date,Districtid,Districts)
    select date_add(v_starttime, interval 3 day),Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
    insert into temp_dailyReport(Date,Districtid,Districts)
    select date_add(v_starttime, interval 4 day),Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
     insert into temp_dailyReport(Date,Districtid,Districts)
    select date_add(v_starttime, interval 5 day),Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
      insert into temp_dailyReport(Date,Districtid,Districts)
    select date_add(v_starttime, interval 6 day),Districtid,DistrictName from db_iemr.m_district 
    where stateid=v_stateid;
    
    if (v_isMother='true') then

set sql_safe_updates=0;

update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalCalls=a.TotalCalls;
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(distinct bencallid) TotalUniqueCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalUniqueCalls=a.TotalUniqueCalls;      
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalSelfNoCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where 
fb.ismother is true  and fm.IsSelfNo is true and 
 fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalSelfNoCalls=a.TotalSelfNoCalls;   
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalOtherNoCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
where 
fb.ismother is true  and fm.IsSelfNo is false and 
 fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalOtherNoCalls=a.TotalOtherNoCalls;       
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalAnsweredCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is true 
and   fb.CallTypeid 
              in (select calltypeid from db_iemr.m_calltype
             where callgrouptype='Answered' and calltype='Answered')
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalAnsweredCalls=a.TotalAnsweredCalls;            



update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalVerifiedCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is true and fb.IsVerified is true
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalVerifiedCalls=a.TotalVerifiedCalls;       
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalUnVerifiedCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is true and fb.IsVerified is false
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalUnVerifiedCalls=a.TotalUnVerifiedCalls;                
          

end if;

    if (v_isMother='false') then

set sql_safe_updates=0;

update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalCalls=a.TotalCalls;
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(distinct bencallid) TotalUniqueCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalUniqueCalls=a.TotalUniqueCalls;      
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalSelfNoCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where 
fb.ismother is false  and fm.IsSelfNo is true and 
 fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalSelfNoCalls=a.TotalSelfNoCalls;   
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalOtherNoCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord  fm on fm.MCTSID_no_Child_ID=fo.childid
where 
fb.ismother is false  and fm.IsSelfNo is false and 
 fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalOtherNoCalls=a.TotalOtherNoCalls;       
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalAnsweredCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is false 
and   fb.CallTypeid 
              in (select calltypeid from db_iemr.m_calltype
             where callgrouptype='Answered' and calltype='Answered')
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalAnsweredCalls=a.TotalAnsweredCalls;            



update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalVerifiedCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is false and fb.IsVerified is true
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalVerifiedCalls=a.TotalVerifiedCalls;       
            
update temp_dailyReport t inner join(
select b.permdistrictid,date(fb.createdDate) createdDate,count(bencallid) TotalUnVerifiedCalls 
from  fact_bencall fb
inner join dim_beneficiary b on fb.BeneficiaryRegID=b.BeneficiaryRegID
where 
fb.ismother is false and fb.IsVerified is false
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime  
            group by b.permdistrictid)a on a.permdistrictid=t.Districtid
             and  date(a.createdDate)=date(t.date)
            set t.TotalUnVerifiedCalls=a.TotalUnVerifiedCalls;                
          

end if;


select * from temp_dailyReport ;-- where TotalCalls is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSDataReport_Child` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSDataReport_Child`(v_starttime datetime,v_endtime datetime,
-- v_Agentid int(11),
v_psmid int(11)
)
begin
select State_ID "State ID",	District_ID "District ID",District_Name "District Name",
Taluka_ID "Taluka ID",Taluka_Name "Taluka Name",Block_ID "Health Block ID",
Block_Name "Health Block Name",PHC_ID "PHC ID",PHC_Name "PHC Name",
SubCenter_ID "Sub Center ID",SubCenter_Name "Sub Center Name",City "City Maholla",

Village_ID "Village ID",Village_Name "Village Name",Year "Yr",
GP_Village "GP Village",Address "Address",MCTSID_no_Child_ID "ID No",
Child_Name "Name",Mother_Name "Mother Name",
Mother_ID "Mother ID",
Phone_No_of "Phone Noof Whom",
Phone_No "Whom Phone No",
DOB "Birth Date",
Place_of_Birth "Place Of Birth",
BloodGroup "Blood Group",
Caste "Caste",
SubCenter_Name1 "Sub Center Name1",
ANM_Name "ANM Name",
ANM_Phone_No "ANM Phone No",
ASHA_Name "Asha Name",
ASHA_Phone_No "Asha Phone No",
BCG_Date "Bcg Date",
OPV0_Date "Opvo Date",
Hepatitis_B2_Date "Hepatitis B2 Date",
DPT2_Date "Dpt2 Date",
OPV2_Date "Opv2 Date",
Hepatitis_B3_Date "Hepatitis B3 Date",
DPT3_Date "Dpt3 Date",
OPV3_Date "Opv3 Date",
Hepatitis_B4_Date "Hepatitis B4 Date",
Measles_Date "Measles Date",
VitA_Dose1_Date "Vit A Dose1 Date",
MR_Date "Mr Date",
DPTBooster_Date "Dpt Booster Date",
OPVBooster_Date "Opv Booster Date",
VitA_Dose2_Date "Vit A Dose2 Date",
VitA_Dose3_Date "Vit A Dose3 Date",
JE_Date "Je Date",
VitA_Dose9_Date "Vit A Dose9 Date",
DT5_Date "Dt5 Date",
TT10_Date "TT10 Date",
TT16_Date "TT16 Date",
Registration_Date "Child Registration Date",
Gender "Gender",
VitA_Dose5_Date "Vit A Dose5 Date",
VitA_Dose6_Date "Vit A Dose6 Date",
VitA_Dose7_Date "Vit A Dose7 Date",
VitA_Dose8_Date "Vit A Dose8 Date",
Updated_Date "Updated Date",
Remarks "Remarks",
ANM_ID "ANM ID",
ASHA_ID "Asha ID",
Created_By "Created By",
Updated_By "Updated By",
Measles_2_Date "Measles2 Date",
Weight_of_Child "Weight Of Child",
Child_Aadhaar_No "Child Aadhaar No",
Child_EID "Child E ID",
Child_EID_Time "Child E ID Time",
Father_Name "Father Name",
BirthCertificateNo "Birth Certificate No",
Entry_type "Entrytype",
MDDS_StateID "MDDS State ID",
MDDS_District_ID "MDDS District ID",
MDDS_Taluka_ID "MDDS Taluka ID",
MDDS_Village_ID "MDDS Village ID"




 from db_reporting.fact_childvalidrecord
 where providerServiceMapID=ifnull(v_psmid,providerServiceMapID)  
           --  and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)
			and createdDate >=v_starttime and createdDate <=v_endtime;
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSDataReport_Mother` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSDataReport_Mother`(v_starttime datetime,v_endtime datetime,
-- v_Agentid int(11),
v_psmid int(11)
)
begin
select State_ID "State ID",	District_ID "District ID",District_Name "District Name",
Taluka_ID "Taluka ID",Taluka_Name "Taluka Name",Block_ID "Health Block ID",
Block_Name "Health Block Name",PHC_ID "PHC ID",PHC_Name "PHC Name",
SubCenter_ID "Sub Center ID",SubCenter_Name "Sub Center Name",
Village_ID "Village ID",Village_Name "Village Name",YR "Yr",
GP_Village "GP Village",Address "Address",MCTSID_no "ID No",
Name "Name",Husband_Name "Husband Name",PhoneNo_Of_Whom "Phone No Of Whom",
Whom_PhoneNo "Whom Phone No",Birth_Date "Birth Date",
JSY_Beneficiary "JSY Beneficiary",Caste "Caste",
SubCenter_Name1 "Sub Center Name1",ANM_Name "ANM Name",
ANM_Ph "ANM Phone",ASHA_Name "Asha Name",ASHA_Ph "Asha Phone",
Delivery_Lnk_Facility "Delivery Lnk Facility",Facility_Name "Facility Name",
LMP_Date "LMP Date",ANC1_Date "ANC1 Date",ANC2_Date "ANC2 Date",
ANC3_Date "ANC3 Date",ANC4_Date "ANC4 Date",TT1_Date "TT1 Date",
TT2_Date "TT2 Date",TTBooster_Date "TT Booster Date",IFA100_Given_Date "Ifa100 Given Date",
Anemia "Anemia",ANC_Complication "ANC Complication",RTI_STI "Rti Sti",
Delivery_Date "Delivery Date",Delivery_Place_home_type "Delivery Placehome Type",
 Delivery_Place_Public "Delivery Place Public",
 Delivery_Place_Private "Delivery Place Private",
 Delivery_type "Delivery Type",
 Delivery_Complications "Delivery Complications",
 Discharge_Date "Discharge Date",
 JSY_Paid_Date "JSY Paid Date",
 Abortion "Abortion",
 PNC_Home_Visit "PNC Home Visit",
 PNC_Complication "PNC Complication",
 PPC_Method "Ppc Method",
 PNC_Checkup "PNC Checkup",
 Outcome_Nos "Outcome Nos",
 Child1_Name "Child1 Name",
 Child1_Gender "Child1 Gender",
 Child1_Weight "Child1 Weight",
 Child1_BreastFeeding "Child1 Breast Feeding",
 Child2_Name "Child2 Name",
 Child2_Gender "Child2 Gender",
 Child2_Weight "Child2 Weight",
 Child2_BreastFeeding "Child2 Breast Feeding",
 Child3_Name "Child3 Name",
 Child3_Gender "Child3 Gender",
 Child3_Weight "Child3 Weight",
 Child3_BreastFeeding "Child3 Breast Feeding",
 Child4_Name "Child4 Name",
 Child4_Gender "Child4 Gender",
 Child4_Weight "Child4 Weight",
 Child4_BreastFeeding "Child4 Breast Feeding",
 Age "Age",
 Mother_Reg_Date "Mother Reg Date",
 Last_Update_Date "Last Update Date",
 Remarks "Remarks",
 ANM_ID "ANM ID",
 ASHA_ID "Asha ID",
 Call_Answered "Call Answered",
 NoCall_Reason "No Call Reason",
 NoPhone_Reason "No Phone Reason",
 Created_By "Created By",
 Updated_By "Updated By",
Aadhar_no "Aadhar No",
 BPL_APL "Bpl Apl",
 EID "E ID",
 EID_time "E ID Time",
 Entry_type "Entrytype",
 MDDS_StateID "MDDS State ID",
 MDDS_District_ID "MDDS District ID",
 MDDS_Taluka_ID "MDDS Taluka ID",
 MDDS_Village_ID "MDDS Village ID"
 

 from db_reporting.fact_mothervalidrecord
 where providerServiceMapID=ifnull(v_psmid,providerServiceMapID)  
           --  and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)
			and createdDate >=v_starttime and createdDate <=v_endtime;
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSHighRiskReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSHighRiskReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin

if (v_Agentid is not null) then
select distinct fm.MCTSID_no "Mcts ID No",fm.Name "Name",fm.Husband_Name "Husband Name",
fm.Age "Age",fm.District_Name "District Name",fm.Taluka_Name "Taluka Name",
fm.Block_Name "Block Name",fm.PHC_ID "Phc ID",fm.PHC_Name "Phc Name",
fm.SUBPHC_ID "Sub Phc ID",fm.SUBPHC_Name "Sub Phc Name",
fm.PhoneNo_Of_Whom "Phone No Of Whom",fm.Whom_PhoneNo "Whom Phone No",
fm.Birth_Date "Birth Date",fm.LMP_Date "Lmp Date",fm.EDD "Edd",
fm.High_Risk_Reason "High Risk Reason"

from fact_mothervalidrecord fm
inner join fact_mctsoutboundcall fo on fm.MCTSID_no=fo.MotherID
inner join fact_bencall fb  on fo.OBCallID=fb.OBCallID
where  fm.High_Risk is true and  fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime;
end if;


if (v_Agentid is  null) then
select distinct fm.MCTSID_no "Mcts ID No",fm.Name "Name",fm.Husband_Name "Husband Name",
fm.Age "Age",fm.District_Name "District Name",fm.Taluka_Name "Taluka Name",
fm.Block_Name "Block Name",fm.PHC_ID "Phc ID",fm.PHC_Name "Phc Name",
fm.SUBPHC_ID "Sub Phc ID",fm.SUBPHC_Name "Sub Phc Name",
fm.PhoneNo_Of_Whom "Phone No Of Whom",fm.Whom_PhoneNo "Whom Phone No",
fm.Birth_Date "Birth Date",fm.LMP_Date "Lmp Date",fm.EDD "Edd",
fm.High_Risk_Reason "High Risk Reason"

from fact_mothervalidrecord fm
inner join fact_mctsoutboundcall fo on fm.MCTSID_no=fo.MotherID
-- inner join fact_bencall fb  on fo.OBCallID=fb.OBCallID
where  fm.High_Risk is true and  fo.MotherID is null
and fm.providerServiceMapID=ifnull(v_psmid,fm.providerServiceMapID)  
          --   and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fm.createdDate >=v_starttime and fm.createdDate <=v_endtime
 union all
 select distinct fm.MCTSID_no "Mcts ID No",fm.Name "Name",fm.Husband_Name "Husband Name",
fm.Age "Age",fm.District_Name "District Name",fm.Taluka_Name "Taluka Name",
fm.Block_Name "Block Name",fm.PHC_ID "Phc ID",fm.PHC_Name "Phc Name",
fm.SUBPHC_ID "Sub Phc ID",fm.SUBPHC_Name "Sub Phc Name",
fm.PhoneNo_Of_Whom "Phone No Of Whom",fm.Whom_PhoneNo "Whom Phone No",
fm.Birth_Date "Birth Date",fm.LMP_Date "Lmp Date",fm.EDD "Edd",
fm.High_Risk_Reason "High Risk Reason"

from fact_mothervalidrecord fm
inner join fact_mctsoutboundcall fo on fm.MCTSID_no=fo.MotherID
inner join fact_bencall fb  on fo.OBCallID=fb.OBCallID
where  fm.High_Risk is true and  fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime;

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSInvalidRecords_child` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_MCTSInvalidRecords_child`(v_starttime datetime,v_endtime datetime,
 -- v_Agentid int(11),
 v_psmid int(11)
 )
begin
 select 
 distinct
  MCTSID_no_Child_ID "M C T S ID no  Child  ID",
 Child_Name "Child  Name",Father_Name "Father  Name",Mother_Name "Mother  Name",
 Mother_ID "Mother  ID",DOB "Birth Date",Place_of_Birth "Place of  Birth",
 Gender "Gender",Caste "Caste",Child_Aadhaar_No "Child  Aadhaar  No",
 Weight_of_Child "Weight of  Child",Child_EID "Child  E ID",Child_EID_Time "Child  E ID  Time",
 Emamta_Health_ID "Emamta  Health  ID",Emamta_Family_ID "Emamta  Family  ID",
 Phone_No_of "Phone  No of",Phone_No "Phone  No",Registration_Date "Registration  Date",
 Updated_Date "Updated  Date",City "City",State_ID "State  ID",District_ID "District  ID",
 District_Name "District  Name",Taluka_Name "Taluka  Name",Taluka_ID "Taluka  ID",
 Block_ID "Block  ID",Block_Name "Block  Name",PHC_ID "Phc  ID",PHC_Name "Phc  Name",
 SubCenter_ID "Sub Center  ID",SubCenter_Name "Sub Center  Name",SubCenter_Name1 "Sub Center  Name1",
 Village_ID "Village  ID",Village_Name "Village  Name",address "Address",Year "Year",
 ANM_ID "Anm  ID",ANM_Name "Anm  Name",ANM_Phone_No "Anm  Phone  No",ASHA_ID "Asha  ID",
 ASHA_Name "Asha  Name",ASHA_Phone_No "Asha  Phone  No",Entry_type "Entry type",BCG_Date "B C G  Date",
 OPV0_Date "O P V0  Date",Hepatitis_B1_Date "Hepatitis  B1  Date",DPT1_Date "Dpt1  Date",
 OPV1_Date "Opv1  Date",
 Hepatitis_B2_Date "Hepatitis  B2  Date",DPT2_Date "Dpt2  Date",
 OPV2_Date "Opv2  Date",Hepatitis_B3_Date "Hepatitis  B3  Date",DPT3_Date "Dpt3  Date",
 OPV3_Date "Opv3  Date",Hepatitis_B4_Date "Hepatitis  B4  Date",Measles_Date "Measles  Date",
 VitA_Dose1_Date "Vit A  Dose1  Date",MR_Date "M R  Date",DPTBooster_Date "Dptbooster  Date",
 OPVBooster_Date "Opvbooster  Date",
 VitA_Dose2_Date "Vit A  Dose2  Date",VitA_Dose3_Date "Vit A  Dose3  Date",VitA_Dose99_Date "Vit A  Dose99  Date",
 VitA_Dose5_Date "Vit A  Dose5  Date",VitA_Dose6_Date "Vit A  Dose6  Date",
 VitA_Dose7_Date "Vit A  Dose7  Date",VitA_Dose8_Date "Vit A  Dose8  Date",
 VitA_Dose9_Date "Vit A  Dose9  Date",JE_Date "Je  Date",
 DT5_Date "Dt5  Date",TT10_Date "Tt10  Date",TT16_Date "Tt16  Date",
 Measles_2_Date "Measles 2  Date",PentaValent1_Date "Penta Valent1  Date",
 PentaValent2_Date "Penta Valent2  Date",PentaValent3_Date "Penta Valent3  Date",
 is_Upload "Is  Upload",Status "Status",Remarks "Remarks",Delete_Mother "Delete  Mother",
 Delete_Reason "Delete  Reason",Deleted_ON "Deleted  O N",SMS_Status "Sms  Status",
 MDDS_StateID "Mdds  State ID",MDDS_District_ID "Mdds  District  ID",MDDS_Taluka_ID "Mdds  Taluka  ID",
 MDDS_Village_ID "Mdds  Village  ID",BirthCertificateNo "Birth Certificate No",Rural_urban "Rural urban",
 SNO "S N O",Lead_ID "Lead  ID",My_ID "My  ID",CID_NO "Cid  N O",
 MID_NO "Mid  N O",Duplicate_Bit "Duplicate  Bit",FacilityType "Facility Type",
 DueServices "Due Services",OverDueServices "Over Due Services",GivenServices "Given Services",
 Source "Source",IsAllocated "Is Allocated",Is_Valid "Is  Valid",Is_Error "Is  Error",
 Error_Reason "Error  Reason",FileID "File ID",Deleted "Deleted",Updated_Date "Dateof Upload",
createdBy "Updated By"
 
 
 from db_reporting.fact_childinvalidrecord
  where providerServiceMapID=ifnull(v_psmid,providerServiceMapID)  
            --  and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)
 			and createdDate >=v_starttime and createdDate <=v_endtime;
  
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSInvalidrecords_Mother` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_MCTSInvalidrecords_Mother`(v_starttime datetime,v_endtime datetime,
-- v_Agentid int(11),
v_psmid int(11)
)
begin
select distinct 
MCTSID_no "M C T S ID",  Name "Name",Husband_Name "Husband  Name",
PhoneNo_Of_Whom "Phone No  Of  Whom",  Whom_PhoneNo "Whom  Phone No",
Birth_Date "Birth Date",Age "Age", Caste "Caste" , Aadhar_no "Aadhar no" ,
State_ID "State ID",	District_ID "District ID",District_Name "District Name",
Taluka_Name "Taluka Name",Taluka_ID "Taluka ID",Block_ID "Block  ID",
Block_Name "Block  Name",
SubCenter_ID "Sub Center ID",SubCenter_Name "Sub Center Name",
Village_ID "Village ID",Village_Name "Village Name",City_ID "City  ID",City_Name "City  Name",
SubCenter_Name1 "Sub Center  Name1",ANM_ID "Anm  ID",
ANM_Name "ANM Name",
ANM_Ph "ANM Ph", ASHA_ID "Asha  ID", ASHA_Name "Asha Name",ASHA_Ph "Asha Ph",
PHC_ID "PHC ID",PHC_Name "PHC Name",SUBPHC_ID "Sub Phc  ID",SUBPHC_Name "Sub Phc  Name",
YR "Yr",
GP_Village "GP Village",Address "Address",Entry_type "Entry type",
LMP_Date "LMP Date",ANC1_Date "ANC1 Date",ANC2_Date "ANC2 Date",
ANC3_Date "ANC3 Date",ANC4_Date "ANC4 Date",ANC_Complication "Anc  Complication",
TT1_Date "TT1 Date",
TT2_Date "TT2 Date",TTBooster_Date "TT Booster Date",IFA100_Given_Date "Ifa100 Given Date",
 EDD,
Anemia "Anemia",RTI_STI "Rti  Sti",Delivery_Lnk_Facility "Delivery  Lnk  Facility",
Facility_Name "Facility  Name",

-- MCTSID_no "ID No",
-- Name "Name",Husband_Name "Husband Name",PhoneNo_Of_Whom "Phone No Of Whom",
-- Whom_PhoneNo "Whom Phone No",Birth_Date "Birth Date",
-- JSY_Beneficiary "JSY Beneficiary",Caste "Caste",
-- SubCenter_Name1 "Sub Center Name1",
-- Delivery_Lnk_Facility "Delivery Lnk Facility",Facility_Name "Facility Name",RTI_STI "Rti Sti",

Delivery_Date "Delivery Date",Delivery_Place_home_type "Delivery Placehome Type",
 Delivery_Place_Public "Delivery Place Public",
 Delivery_Place_Private "Delivery Place Private",
 Delivery_type "Delivery Type",
 Delivery_Complications "Delivery Complications",
 Discharge_Date "Discharge Date",
-- JSY_Paid_Date "JSY Paid Date",
 Abortion "Abortion",
 PNC_Home_Visit "PNC Home Visit",
 PNC_Complication "PNC Complication",
 PPC_Method "Ppc Method",
 PNC_Checkup "PNC Checkup",
 Outcome_Nos "Outcome Nos",
 Child1_ID "Child1 ID",
 Child1_Name "Child1 Name",
 Child1_Gender "Child1 Gender",
 Child1_Weight "Child1 Weight",
 Child1_BreastFeeding "Child1 Breast Feeding",
  Child2_ID "Child2 ID",
 Child2_Name "Child2 Name",
 Child2_Gender "Child2 Gender",
 Child2_Weight "Child2 Weight",
 Child2_BreastFeeding "Child2 Breast Feeding",
  Child3_ID "Child3 ID",
 Child3_Name "Child3 Name",
 Child3_Gender "Child3 Gender",
 Child3_Weight "Child3 Weight",
 Child3_BreastFeeding "Child3 Breast Feeding",
  Child4_ID "Child4 ID",
 Child4_Name "Child4 Name",
 Child4_Gender "Child4 Gender",
 Child4_Weight "Child4 Weight",
 Child4_BreastFeeding "Child4 Breast Feeding",
 Mother_Reg_Date "Mother  Reg  Date",
 Last_Update_Date "Last  Update  Date",
 EID "E ID",
 EID_time "E ID Time",
 CPSMS_Flag "Cpsms  Flag",JSY_Beneficiary "Jsy  Beneficiary",
 JSY_Paid_Date "Jsy  Paid  Date",
  Bank_Name "Bank  Name",
  Bank_branch_name "Bank  Branch  Name",
  Acc_No "Acc  No",IFSC_Code "Ifsc  Code",
  Remarks "Remarks",Referred_By_Telecaller "Referred  By  Telecaller",
  Referred_Date "Referred  Date",
  No_of_Try "No of  Try",Call_Answered "Call  Answered",
  Status "Status",High_Risk "High  Risk",
Call_Verified "Call  Verified",Associate "Associate",
Call_Date "Call  Date",  Due_Services "Due  Services",
Due_Services_Response "Due  Services  Response",
 Overdue_Services "Overdue  Services",
 Overdue_Services_Response "Overdue  Services  Response",
 Given_Services "Given  Services",Given_Services_Response "Given  Services  Response",
 Miscarriage "Miscarriage",Baby_Died "Baby  Died",Call_No "Call  No",
 Questions_Asked "Questions  Asked",
 Asnwer_Given_by_Benificary "Asnwer  Given by  Benificary",
 Source "Source",NoCall_Reason "No Call  Reason",
 NoPhone_Reason "No Phone  Reason",
 Created_By "Created  By",Updated_By "Updated  By",
 BPL_APL "Bpl  Apl",
 MDDS_StateID "MDDS State ID",
 MDDS_District_ID "MDDS District ID",
 MDDS_Taluka_ID "MDDS Taluka ID",
 MDDS_Village_ID "MDDS Village ID",
Is_Valid "Is  Valid",Is_Error"Is  Error",Fileid "File ID",
Error_Reason "Error  Reason",IsAllocated "Is Allocated",
Deleted,CreatedDate "Dateof Upload",CreatedBy "Updated By",
InValid_Reason "In Valid  Reason"
from db_reporting.fact_motherinvalidrecord
 where providerServiceMapID=ifnull(v_psmid,providerServiceMapID)  
           --  and ReceivedAgentID=ifnull(v_Agentid,ReceivedAgentID)
			and createdDate >=v_starttime and createdDate <=v_endtime;
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_MCTSNHMReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `Pr_MCTSNHMReport`(
v_starttime datetime,v_endtime datetime,v_Agentid int(11),v_psmid int(11))
begin
-- Date	District	Beneficiary ID	Name	Health Block	Phc	Sub Center Name	Facility 
-- Name	Category	Display Call Type	Phone Number	Call Duration	Remark

select 
fb.createdDate "Date",b.PermDistrict "District",
b.BeneficiaryID "Beneficiary ID",fm.name "Name",fm.block_name "Health Block",
fm.phc_name "Phc",fm.SubCenter_Name "Sub Center Name",fm.facility_name "Facility Name",
-- fm.MCTSID_no "Mother ID",fb.CallSubTypeName "status",
fo.outboundCallType "Category",fo.DisplayOBCallType "Display Call Type",
fb.phoneno "Phone Number",
fb.CZcallDuration "Call Duration",
fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_mothervalidrecord fm on fm.MCTSID_no=fo.MotherID
inner join dim_beneficiary b on b.BeneficiaryRegID=fm.BeneficiaryRegID
where fb.IsMother is true 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID)
			and fb.createdDate >=v_starttime and fb.createdDate <=v_endtime
            union all
select 
fb.createdDate "Date",b.PermDistrict "District",
b.BeneficiaryID "Beneficiary ID",fm.child_name "Name",fm.block_name "Health Block",
fm.phc_name "Phc",fm.SubCenter_Name "Sub Center Name",
fm.SubCenter_Name "Facility Name",-- columnmapping from api need to check
-- fm.MCTSID_no "Mother ID",fb.CallSubTypeName "status",
fo.outboundCallType "Category",fo.DisplayOBCallType "Display Call Type",
fb.PhoneNo "Phone Number",
fb.CZcallDuration "Call Duration",
fb.Remarks "Remarks"
from fact_bencall fb
inner join fact_mctsoutboundcall fo on fo.OBCallID=fb.OBCallID
inner join fact_childvalidrecord fm on fm.MCTSID_no_Child_ID=fo.childid
inner join dim_beneficiary b on b.BeneficiaryRegID=fm.BeneficiaryRegID
where fb.IsMother is false 
and fb.providerServiceMapID=ifnull(v_psmid,fb.providerServiceMapID)  
             and fb.ReceivedAgentID=ifnull(v_Agentid,fb.ReceivedAgentID);
            
            
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_StockDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_StockDetail`(v_FromDate date, v_ToDate date)
BEGIN

select C.*,
ITM.ItemName,
FAC.FacilityName,
ITMC.ItemCategoryName,
sum(if(SAItm.IsAdded = 0b1, ifnull(SAItm.AdjustedQuantity,0),-(ifnull(SAItm.AdjustedQuantity,0))) ) as AdjustedQuantity_ToDate,
sum(if(SAItm.IsAdded = 0b1, ifnull(SAItm.AdjustedQuantity,0),0) ) as AdjustedQuantity_ToDate_Receipt,
sum(if(SAItm.IsAdded = 0b1, 0,(ifnull(SAItm.AdjustedQuantity,0))) ) as AdjustedQuantity_ToDate_Issue

from

(select B.*,
sum(ifnull(ISEx.Quantity,0)) as QuantityDispanced
from

(select A.*,
sum(if(SAItm.IsAdded = 0b1, ifnull(SAItm.AdjustedQuantity,0),-(ifnull(SAItm.AdjustedQuantity,0))) ) as AdjustedQuantity_FromDate
from
 
(select
ISE.ItemStockEntryID,
ISE.ItemID,
ISE.FacilityID,
ISE.BatchNo,
ifnull(ISE.Quantity,0) as TotalQuantityReceived,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISE.EntryType,
ISE.ProviderServiceMapID,
ISE.CreatedDate as EntryDate,
  (ifnull(ISE.Quantity,0) - sum(ifnull(ISEx.Quantity,0))) as OpeningStock
-- ISE.QuantityInHand as OpeningStock
FROM db_iemr.t_itemstockentry ISE
left join db_iemr.t_itemstockexit ISEx
 on ISE.ItemStockEntryID = ISEx.ItemStockEntryID
 and date(ISEx.CreatedDate) <v_FromDate
 
where date(ISE.CreatedDate) <= v_ToDate

group by ISE.ItemStockEntryID
) A left join db_iemr.t_saitemmapping SAItm
        on SAItm.ItemStockEntryID=A.ItemStockEntryID
        and date(SAItm.CreatedDate) < v_FromDate
       
group by A.ItemStockEntryID
 ) B left join db_iemr.t_itemstockexit ISEx
        on B.ItemStockEntryID = ISEx.ItemStockEntryID  
        and date(ISEx.CreatedDate) >= v_FromDate  
        and date(ISEx.CreatedDate) <= v_ToDate
       
 group by B.ItemStockEntryID
 ) C left join db_iemr.t_saitemmapping SAItm
        on SAItm.ItemStockEntryID=C.ItemStockEntryID
        and date(SAItm.CreatedDate) >= v_FromDate
        and date(SAItm.CreatedDate) <= v_ToDate
       
        Inner Join db_iemr.m_Item ITM on C.ItemID = ITM.ItemID
        Inner Join db_iemr.m_Facility FAC on C.FacilityID = FAC.FacilityID
        Inner join db_iemr.m_ItemCategory ITMC on ITM.ItemCategoryID = ITMC.ItemCategoryID
       
group by C.ItemStockEntryID;
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_StockSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_StockSummary`(v_FromDate date, v_ToDate date)
BEGIN

select D.ItemID,
D.FacilityID,
D.ItemName,
D.FacilityName,
D.ItemCategoryName,

sum(D.TotalQuantityReceived) as TotalQuantityReceived,
sum(D.OpeningStock) as OpeningStock,
sum(D.AdjustedQuantity_FromDate) as AdjustedQuantity_FromDate ,
sum(D.QuantityDispanced) as QuantityDispanced,
sum(D.AdjustedQuantity_ToDate) as AdjustedQuantity_ToDate,
sum(D.AdjustedQuantity_ToDate_Receipt) as AdjustedQuantity_ToDate_Receipt,
sum(D.AdjustedQuantity_ToDate_Issue) as AdjustedQuantity_ToDate_Issue

from
(select C.*,
ITM.ItemName,
FAC.FacilityName,
ITMC.ItemCategoryName,

sum(if(SAItm.IsAdded = 0b1, ifnull(SAItm.AdjustedQuantity,0),-(ifnull(SAItm.AdjustedQuantity,0))) ) as AdjustedQuantity_ToDate,
sum(if(SAItm.IsAdded = 0b1, ifnull(SAItm.AdjustedQuantity,0),0) ) as AdjustedQuantity_ToDate_Receipt,
sum(if(SAItm.IsAdded = 0b1, 0,(ifnull(SAItm.AdjustedQuantity,0))) ) as AdjustedQuantity_ToDate_Issue

from

(select B.*,
sum(ifnull(ISEx.Quantity,0)) as QuantityDispanced
from

(select A.*,
sum(if(SAItm.IsAdded = 0b1, ifnull(SAItm.AdjustedQuantity,0),-(ifnull(SAItm.AdjustedQuantity,0))) ) as AdjustedQuantity_FromDate
from
 
(select
ISE.ItemStockEntryID,
ISE.ItemID,
ISE.FacilityID,
ISE.BatchNo,
ifnull(ISE.Quantity,0) as TotalQuantityReceived,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISE.EntryType,
ISE.ProviderServiceMapID,
ISE.CreatedDate as EntryDate,
(ifnull(ISE.Quantity,0) - sum(ifnull(ISEx.Quantity,0))) as OpeningStock
FROM db_iemr.t_itemstockentry ISE
left join db_iemr.t_itemstockexit ISEx
 on ISE.ItemStockEntryID = ISEx.ItemStockEntryID
 and date(ISEx.CreatedDate) < v_FromDate
 
where date(ISE.CreatedDate) <=   v_ToDate

group by ISE.ItemStockEntryID
) A left join db_iemr.t_saitemmapping SAItm
                on SAItm.ItemStockEntryID=A.ItemStockEntryID
                and date(SAItm.CreatedDate) <   v_FromDate
       
group by A.ItemStockEntryID
 ) B left join db_iemr.t_itemstockexit ISEx
                on B.ItemStockEntryID = ISEx.ItemStockEntryID  
        and date(ISEx.CreatedDate) >=  v_FromDate        
        and date(ISEx.CreatedDate) <=   v_ToDate
       
 group by B.ItemStockEntryID
 ) C left join db_iemr.t_saitemmapping SAItm
                on SAItm.ItemStockEntryID=C.ItemStockEntryID
                and date(SAItm.CreatedDate) >=   v_FromDate
and date(SAItm.CreatedDate) <=   v_ToDate
       
        Inner Join db_iemr.m_Item ITM on C.ItemID = ITM.ItemID
        Inner Join db_iemr.m_Facility FAC on C.FacilityID = FAC.FacilityID
        Inner join db_iemr.m_ItemCategory ITMC on ITM.ItemCategoryID = ITMC.ItemCategoryID
       
group by C.ItemStockEntryID) D

group by D.ItemID;
 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_TMSaveWorkList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `Pr_TMSaveWorkList`()
begin
insert into i_ben_flow_outreach(
 beneficiary_reg_id, beneficiary_visit_id, beneficiary_visit_code, visit_reason, visit_category,
 visit_no, ben_name, ben_age, ben_dob, ben_gender, ben_phone_no, ben_age_val, nurse_flag, doctor_flag,
 pharmacist_flag, lab_technician_flag, radiologist_flag, oncologist_flag, specialist_flag, 
 TC_SpecialistLabFlag, created_by, created_date, modified_by, modified_date, visitDate, consultationDate,
 registrationDate, visitSession, father_name, spouse_name, ben_gender_val, beneficiary_id, districtID, 
 district, villageID, village, lab_iteration_cnt, deleted, servicePointID, servicePoint,
 providerServiceMapID, vanID, vanNo, consultantID, consultantName, VanSerialNo, VehicalNo, 
 ParkingPlaceID, SyncedBy, SyncedDate, ReservedForChange, Processed, BenArrivedFlag, TCSpecialistUserID, 
 TCRequestDate,referred_visitcode,referred_visit_id)
 select beneficiary_reg_id, null beneficiary_visit_id, null as beneficiary_visit_code, visit_reason, visit_category,
 ifnull(visit_no,0)+1 as visit_no, ben_name, ben_age, ben_dob, ben_gender, ben_phone_no, ben_age_val, 
 b'1' as nurse_flag, b'0' as doctor_flag,
 b'0' as pharmacist_flag, null as lab_technician_flag, null as radiologist_flag, null as oncologist_flag, 
 specialist_flag, 
null TC_SpecialistLabFlag, 'created_by_sp' as created_by, created_date, modified_by, modified_date, visitDate, consultationDate,
 registrationDate, visitSession, father_name, spouse_name, ben_gender_val, beneficiary_id, districtID, 
 district, villageID, village, null as lab_iteration_cnt, deleted, servicePointID, servicePoint,
 providerServiceMapID, vanID, vanNo, consultantID, consultantName, VanSerialNo, VehicalNo, 
 ParkingPlaceID, SyncedBy, SyncedDate, ReservedForChange, Processed, BenArrivedFlag,null as  TCSpecialistUserID, 
 TCRequestDate,beneficiary_visit_code,beneficiary_visit_id 
 from i_ben_flow_outreach where Processed in('U','N') AND specialist_flag = 100
  and doctor_flag=9  and referred_visitcode is null;
 
 set sql_safe_updates=0;
 
 update i_ben_flow_outreach set Processed='P' where Processed in('U','N')
 and referred_visitcode is null
 AND specialist_flag = 100
 and doctor_flag=9;
 
 update i_ben_flow_outreach i
inner join m_vanspokemapping m  on i.vanid=m.mmu_VanID
set i.vanid=m.tm_SpokeID,i.ParkingPlaceID=m.tm_HubID,
 i.servicePointID=m.tm_servicePointID,i.servicePoint=m.tm_servicepointname,
 i.providerServiceMapID=m.tm_ProviderServiceMapID,
 i.Processed='M',i.created_date = current_timestamp()
where i.referred_visitcode is not null and i.Processed !='M'
 and m.deleted is false;
-- AND i.specialist_flag = 100
 -- and i.doctor_flag=9
 
 
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_UpdateECDReporting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `Pr_UpdateECDReporting`()
begin


truncate table db_reporting.Fact_ChildValidRecord;
INSERT INTO db_reporting.Fact_ChildValidRecord(
RowID,
BeneficiaryRegID,
Date_of_Entry,
Entry_type,
MCTSID_no_Child_ID,
Child_Name,
Father_Name,
Mother_Name,
Mother_ID,
DOB,
Place_of_Birth,
Gender,
Caste,
BloodGroup,
Child_Aadhaar_No,
Weight_of_Child,
Child_EID,
Child_EID_Time,
Emamta_Health_ID,
Emamta_Family_ID,
Phone_No_of,
Phone_No,
Registration_Date,
Updated_Date,
CityID,
City,
State_ID,
State_Name,
District_ID,
District_Name,
Taluka_Name,
Taluka_ID,
Block_ID,
Block_Name,
PHC_ID,
PHC_Name,
SubCenter_ID,
SubCenter_Name,
SubCenter_Name1,
Village_ID,
Village_Name,
GP_Village,
Address,
Year,
ANM_ID,
ANM_Name,
ANM_Phone_No,
ASHA_ID,
ASHA_Name,
ASHA_Phone_No,
BCG_Date,
OPV0_Date,
Hepatitis_B1_Date,
DPT1_Date,
OPV1_Date,
Hepatitis_B2_Date,
DPT2_Date,
OPV2_Date,
Hepatitis_B3_Date,
DPT3_Date,
OPV3_Date,
Hepatitis_B4_Date,
Measles_Date,
VitA_Dose1_Date,
MR_Date,
DPTBooster_Date,
OPVBooster_Date,
VitA_Dose2_Date,
VitA_Dose3_Date,
VitA_Dose99_Date,
VitA_Dose5_Date,
VitA_Dose6_Date,
VitA_Dose7_Date,
VitA_Dose8_Date,
VitA_Dose9_Date,
JE_Date,
DT5_Date,
TT10_Date,
TT16_Date,
Measles_2_Date,
PentaValent1_Date,
PentaValent2_Date,
PentaValent3_Date,
is_Upload,
Status,
Remarks,
Delete_Mother,
Delete_Reason,
Deleted_ON,
SMS_Status,
Created_By,
Updated_By,
MDDS_StateID,
MDDS_District_ID,
MDDS_Taluka_ID,
MDDS_Village_ID,
BirthCertificateNo,
Rural_urban,
SNO,
Lead_ID,
My_ID,
CID_NO,
MID_NO,
Duplicate_Bit,
FacilityType,
DueServices,
OverDueServices,
GivenServices,
Source,
ProviderServiceMapID,
Is_Valid,
Is_Error,
Error_Reason,
FileID,
IsAllocated,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate,
Child_RCH_ID_No,Mother_RCH_ID_No,HepatitisB0_Dt,
IsHrni,Hrni_Reason,entrytype
)

SELECT
TC.RowID,
TC.BeneficiaryRegID,
TC.Date_of_Entry,
TC.Entry_type,
TC.MCTSID_no_Child_ID,
TC.Child_Name,
TC.Father_Name,
TC.Mother_Name,
TC.Mother_ID,
TC.DOB,
TC.Place_of_Birth,
TC.Gender,
TC.Caste,
TC.BloodGroup,
TC.Child_Aadhaar_No,
TC.Weight_of_Child,
TC.Child_EID,
TC.Child_EID_Time,
TC.Emamta_Health_ID,
TC.Emamta_Family_ID,
TC.Phone_No_of,
TC.Phone_No,
TC.Registration_Date,
TC.Updated_Date,
TC.CityID,
TC.City,
TC.State_ID,
TC.State_Name,
TC.District_ID,
TC.District_Name,
TC.Taluka_Name,
TC.Taluka_ID,
TC.Block_ID,
TC.Block_Name,
TC.PHC_ID,
TC.PHC_Name,
TC.SubCenter_ID,
TC.SubCenter_Name,
TC.SubCenter_Name1,
TC.Village_ID,
TC.Village_Name,
TC.GP_Village,
TC.Address,
TC.Year,
TC.ANM_ID,
TC.ANM_Name,
TC.ANM_Phone_No,
TC.ASHA_ID,
TC.ASHA_Name,
TC.ASHA_Phone_No,
TC.BCG_Date,
TC.OPV0_Date,
TC.Hepatitis_B1_Date,
TC.DPT1_Date,
TC.OPV1_Date,
TC.Hepatitis_B2_Date,
TC.DPT2_Date,
TC.OPV2_Date,
TC.Hepatitis_B3_Date,
TC.DPT3_Date,
TC.OPV3_Date,
TC.Hepatitis_B4_Date,
TC.Measles_Date,
TC.VitA_Dose1_Date,
TC.MR_Date,
TC.DPTBooster_Date,
TC.OPVBooster_Date,
TC.VitA_Dose2_Date,
TC.VitA_Dose3_Date,
TC.VitA_Dose99_Date,
TC.VitA_Dose5_Date,
TC.VitA_Dose6_Date,
TC.VitA_Dose7_Date,
TC.VitA_Dose8_Date,
TC.VitA_Dose9_Date,
TC.JE_Date,
TC.DT5_Date,
TC.TT10_Date,
TC.TT16_Date,
TC.Measles_2_Date,
TC.PentaValent1_Date,
TC.PentaValent2_Date,
TC.PentaValent3_Date,
TC.is_Upload,
TC.Status,
TC.Remarks,
TC.Delete_Mother,
TC.Delete_Reason,
TC.Deleted_ON,
TC.SMS_Status,
TC.Created_By,
TC.Updated_By,
TC.MDDS_StateID,
TC.MDDS_District_ID,
TC.MDDS_Taluka_ID,
TC.MDDS_Village_ID,
TC.BirthCertificateNo,
TC.Rural_urban,
TC.SNO,
TC.Lead_ID,
TC.My_ID,
TC.CID_NO,
TC.MID_NO,
TC.Duplicate_Bit,
TC.FacilityType,
TC.DueServices,
TC.OverDueServices,
TC.GivenServices,
TC.Source,
TF.ProviderServiceMapID,
TC.Is_Valid,
TC.Is_Error,
TC.Error_Reason,
TC.FileID,
TC.IsAllocated,
TC.Deleted,
TC.Processed,
TC.CreatedBy,
TC.CreatedDate,
TC.ModifiedBy,
TC.LastModDate,
Replace(DATE(TC.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_ChildValidRecord',
NOW(),
TC.Child_RCH_ID_No,TC.Mother_RCH_ID_No,TC.HepatitisB0_Dt,
TC.IsHrni,TC.Hrni_Reason,TC.entrytype
 FROM db_iemr.t_childvaliddata TC
LEFT JOIN db_iemr.t_filemanager TF ON TC.FileID = TF.FileID
WHERE DATE(TC.CreatedDate)<=CURDATE() - INTERVAL 1 DAY;

truncate table db_reporting.fact_mothervalidrecord;
INSERT INTO db_reporting.fact_mothervalidrecord

(MotherValidRecordID,

RowID,

BeneficiaryRegID,

Date_of_Entry,

Entry_type,

MCTSID_no,

Name,

Husband_Name,

PhoneNo_Of_Whom,

Whom_PhoneNo,

Birth_Date,

Age,

Blood_Group,

Caste,

Aadhar_no,

State_ID,

State_Name,

District_ID,

District_Name,

Taluka_Name,

Taluka_ID,

Block_ID,

Block_Name,

SubCenter_ID,

SubCenter_Name,

Village_ID,

Village_Name,

City_ID,

City_Name,

SubCenter_Name1,

ANM_ID,

ANM_Name,

ANM_Ph,

ASHA_ID,

ASHA_Name,

ASHA_Ph,

PHC_ID,

PHC_Name,

SUBPHC_ID,

SUBPHC_Name,

YR,

GP_Village,

Address,

LMP_Date,

ANC1_Date,

ANC2_Date,

ANC3_Date,

ANC4_Date,

ANC_Complication,

TT1_Date,

TT2_Date,

TTBooster_Date,

IFA100_Given_Date,

EDD,

Anemia,

RTI_STI,

Delivery_Lnk_Facility,

Facility_Name,

Delivery_Date,

Delivery_Place_home_type,

Delivery_Place_Public,

Delivery_Place_Private,

Delivery_type,

Delivery_Complications,

Discharge_Date,

Abortion,

PNC_Home_Visit,

PNC_Complication,

PPC_Method,

PNC_Checkup,

Outcome_Nos,

Child1_ID,

Child1_Name,

Child1_Gender,

Child1_Weight,

Child1_BreastFeeding,

Child2_ID,

Child2_Name,

Child2_Gender,

Child2_weight,

Child2_Breastfeeding,

Child3_ID,

Child3_Name,

Child3_Gender,

Child3_Weight,

Child3_Breastfeeding,

Child4_ID,

Child4_Name,

Child4_Gender,

Child4_Weight,

Child4_Breastfeeding,

Mother_Reg_Date,

Last_Update_Date,

EID,

EID_time,

CPSMS_Flag,

JSY_Beneficiary,

JSY_Paid_Date,

Bank_Name,

Bank_Branch_Name,

Acc_No,

IFSC_Code,

Remarks,

Referred_By_Telecaller,

Referred_Date,

No_of_Try,

Call_Answered,

Status,

High_Risk,

High_Risk_Reason,

Call_Verified,

Associate,

Call_Date,

Due_Services,

Due_Services_Response,

Overdue_Services,

Overdue_Services_Response,

Given_Services,

Given_Services_Response,

Miscarriage,

Baby_Died,

Call_No,

Questions_Asked,

Asnwer_Given_by_Benificary,

Source,

NoCall_Reason,

NoPhone_Reason,

Created_By,

Updated_By,

BPL_APL,

MDDS_StateID,

MDDS_District_ID,

MDDS_Taluka_ID,

MDDS_Village_ID,

ProviderServiceMapID,

Is_Valid,

InValid_Reason,

Is_Error,

Error_Reason,

FileID,

IsAllocated,

Deleted,

CreatedBy,

CreatedDate,

ModifiedBy,

LastModDate,

fact_CreatedDate,

LoadedBy,

LodadedDate,
Registration_no,Landline_no,Mother_Weight,ANC1_Symptoms_High_Risk,
     ANC2_Symptoms_High_Risk,ANC3_Symptoms_High_Risk,ANC4_Symptoms_High_Risk,
     Delivery_Place,Delivery_Place_Name)



SELECT

MV.MotherValidRecordID,

    MV.RowID,

    MV.BeneficiaryRegID,

    MV.Date_of_Entry,

    MV.Entry_type,

    MV.MCTSID_no,

    MV.Name,

    MV.Husband_Name,

    MV.PhoneNo_Of_Whom,

    MV.Whom_PhoneNo,

    MV.Birth_Date,

    MV.Age,

    MV.Blood_Group,

    MV.Caste,

    MV.Aadhar_no,

    MV.State_ID,

    MV.State_Name,

    MV.District_ID,

    MV.District_Name,

    MV.Taluka_Name,

    MV.Taluka_ID,

    MV.Block_ID,

    MV.Block_Name,

    MV.SubCenter_ID,

    MV.SubCenter_Name,

    MV.Village_ID,

    MV.Village_Name,

    MV.City_ID,

    MV.City_Name,

    MV.SubCenter_Name1,

    MV.ANM_ID,

    MV.ANM_Name,

    MV.ANM_Ph,

    MV.ASHA_ID,

    MV.ASHA_Name,

    MV.ASHA_Ph,

    MV.PHC_ID,

    MV.PHC_Name,

    MV.SUBPHC_ID,

    MV.SUBPHC_Name,

    MV.YR,

    MV.GP_Village,

    MV.Address,

    MV.LMP_Date,

    MV.ANC1_Date,

    MV.ANC2_Date,

    MV.ANC3_Date,

    MV.ANC4_Date,

    MV.ANC_Complication,

    MV.TT1_Date,

    MV.TT2_Date,

    MV.TTBooster_Date,

    MV.IFA100_Given_Date,

    MV.EDD,

    MV.Anemia,

    MV.RTI_STI,

    MV.Delivery_Lnk_Facility,

    MV.Facility_Name,

    MV.Delivery_Date,

    MV.Delivery_Place_home_type,

    MV.Delivery_Place_Public,

    MV.Delivery_Place_Private,

    MV.Delivery_type,

    MV.Delivery_Complications,

    MV.Discharge_Date,

    MV.Abortion,

    MV.PNC_Home_Visit,

    MV.PNC_Complication,

    MV.PPC_Method,

    MV.PNC_Checkup,

    MV.Outcome_Nos,

    MV.Child1_ID,

    MV.Child1_Name,

    MV.Child1_Gender,

    MV.Child1_Weight,

    MV.Child1_BreastFeeding,

    MV.Child2_ID,

    MV.Child2_Name,

    MV.Child2_Gender,

    MV.Child2_weight,

    MV.Child2_Breastfeeding,

    MV.Child3_ID,

    MV.Child3_Name,

    MV.Child3_Gender,

    MV.Child3_Weight,

    MV.Child3_Breastfeeding,

    MV.Child4_ID,

    MV.Child4_Name,

    MV.Child4_Gender,

    MV.Child4_Weight,

    MV.Child4_Breastfeeding,

    MV.Mother_Reg_Date,

    MV.Last_Update_Date,

    MV.EID,

    MV.EID_time,

    MV.CPSMS_Flag,

    MV.JSY_Beneficiary,

    MV.JSY_Paid_Date,

    MV.Bank_Name,

    MV.Bank_Branch_Name,

    MV.Acc_No,

    MV.IFSC_Code,

    MV.Remarks,

    MV.Referred_By_Telecaller,

    MV.Referred_Date,

    MV.No_of_Try,

    MV.Call_Answered,

    MV.Status,

    MV.High_Risk,

    MV.High_Risk_Reason,

    MV.Call_Verified,

    MV.Associate,

    MV.Call_Date,

    MV.Due_Services,

    MV.Due_Services_Response,

    MV.Overdue_Services,

    MV.Overdue_Services_Response,

    MV.Given_Services,

    MV.Given_Services_Response,

    MV.Miscarriage,

    MV.Baby_Died,

    MV.Call_No,

    MV.Questions_Asked,

    MV.Asnwer_Given_by_Benificary,

    MV.Source,

    MV.NoCall_Reason,

    MV.NoPhone_Reason,

    MV.Created_By,

    MV.Updated_By,

    MV.BPL_APL,

    MV.MDDS_StateID,

    MV.MDDS_District_ID,

    MV.MDDS_Taluka_ID,

    MV.MDDS_Village_ID,

    FM.ProviderServiceMapID,

    MV.Is_Valid,

    MV.InValid_Reason,

    MV.Is_Error,

    MV.Error_Reason,

    MV.FileID,

    MV.IsAllocated,

    MV.Deleted,

    MV.CreatedBy,

    MV.CreatedDate,

    MV.ModifiedBy,

    MV.LastModDate,

   Replace(DATE(MV.CreatedDate),'-','')AS fact_CreatedDate ,

     'SP_Load_Fact_MotherValidRecord',

     NOW(),
     MV.Registration_no,MV.Landline_no,MV.Mother_Weight,MV.ANC1_Symptoms_High_Risk,
     MV.ANC2_Symptoms_High_Risk,MV.ANC3_Symptoms_High_Risk,MV.ANC4_Symptoms_High_Risk,
     MV.Delivery_Place,MV.Delivery_Place_Name

FROM db_iemr.t_mothervalidrecord MV

LEFT JOIN db_iemr.t_filemanager  FM ON MV.FileID = FM.FileID
WHERE DATE(MV.CreatedDate)<=CURDATE() - INTERVAL 1 DAY;


truncate table db_reporting.Fact_MctsOutboundCall;
INSERT INTO  db_reporting.Fact_MctsOutboundCall(

OBCallID,
MotherID,
ChildID,
BeneficiaryRegID,
AllocatedUserID,
ProviderServiceMapID,
OutboundCallType,
DisplayOBCallType,
CallDateFrom,
CallDateTo,
PrefferedCallDate,
CallStatus,
NoOfTrials,
AllocationStatus,
IsSMSSent,
Deleted,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate,IsHighRisk,HighRisk_Reason,IsHrni,Hrni_Reason,
congenitalanomalies,phoneNumberType)

SELECT
OBCallID,
MotherID,
ChildID,
BeneficiaryRegID,
AllocatedUserID,
ProviderServiceMapID,
OutboundCallType,
DisplayOBCallType,
CallDateFrom,
CallDateTo,
PrefferedCallDate,
CallStatus,
NoOfTrials,
AllocationStatus,
IsSMSSent,
Deleted,
-- Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
Replace(DATE(CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_MctsOutboundCall',
NOW()  
,IsHighRisk,HighRisk_Reason,IsHrni,Hrni_Reason,
congenitalanomalies,phoneNumberType
FROM  db_iemr.t_MctsOutboundCalls
WHERE   DATE(CreatedDate)<= (CURDATE() - INTERVAL 1 DAY);


truncate table db_reporting.Fact_MCTSCallResponse;
INSERT INTO  db_reporting.Fact_MCTSCallResponse(
MotherID,
ChildID,
BenCallID,
QuestionID,
Question,
Answer,
Deleted,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate ,
LoadedBy,
LodadedDate,
outboundCallType,SectionID,ReasonsforHrni,OtherHrni,
CongentialAnomalies,OtherCongentialAnomalies,ProbableCauseOfDefect,
ReasonsForHrp,OtherHrpReason,obcallid,Remarks ,ProviderServiceMapID
)

SELECT
TM.MotherID,
TM.ChildID,
TM.BenCallID,
TM.QuestionID,
MQ.Question,
TM.Answer,
TM.Deleted,
TM.CreatedBy,
TM.CreatedDate,
TM.ModifiedBy,
TM.LastModDate,
Replace(DATE(TM.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_MCTSCallResponse',
NOW(),
TM.outboundCallType,TM.SectionID,TM.ReasonsforHrni,TM.OtherHrni,
TM.CongentialAnomalies,TM.OtherCongentialAnomalies,TM.ProbableCauseOfDefect,
TM.ReasonsForHrp,TM.OtherHrpReason,TM.obcallid,TM.Remarks ,TM.ProviderServiceMapID
FROM   db_iemr.t_MCTSCallResponse  TM
LEFT JOIN db_iemr.m_questionnaire MQ ON MQ.QuestionID = TM.QuestionID
WHERE   DATE(TM.CreatedDate)<= (CURDATE() - INTERVAL 1 DAY) ;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_UpdateHRP_HRniReasons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `PR_UpdateHRP_HRniReasons`(v_BenCallID bigint(20), v_obcallid bigint(20))
BEGIN
-- DECLARE v_NotificationState VARCHAR(30)  default 'unread';
 

/*Update value in t_mctscallresponse table */


update `db_iemr`.`t_mctscallresponse` t1
inner join m_mapquestion t2 on t1.QuestionID=t2.parentQuestionID
inner join t_mctscallresponse t3 on t3.questionid=t2.childQuestionID and t3.BenCallID=t1.BenCallID and t3.obcallid=t1.obcallid
set t1.ReasonsForHrp = t3.Answer 
where t1.Question='Any High Risk Pregnancy (HRP)?' AND t1.Answer ='Yes' and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;
     
update `db_iemr`.`t_mctscallresponse` t1
inner join m_mapquestion t2 on t1.QuestionID=t2.parentQuestionID
inner join t_mctscallresponse t3 on t3.questionid=t2.childQuestionID and t3.BenCallID=t1.BenCallID and t3.obcallid=t1.obcallid
set	t1.ReasonsforHrni = t3.Answer 
where t1.Question='Any High Risk Newborn/Infant?' AND t1.Answer ='Yes'  and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;
  
	/*					
update `db_iemr`.`t_mctscallresponse` t1
inner join m_mapquestion t2 on t1.QuestionID=t2.parentQuestionID
inner join t_mctscallresponse t3 on t3.questionid=t2.childQuestionID and t3.BenCallID=t1.BenCallID and t3.obcallid=t1.obcallid
set	t1.CongentialAnomalies =t3.Answer 
where t1.Question='Reasons for Congential Anomalies'  and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;
                       
update `db_iemr`.`t_mctscallresponse` t1
inner join m_mapquestion t2 on t1.QuestionID=t2.parentQuestionID
inner join t_mctscallresponse t3 on t3.questionid=t2.childQuestionID and t3.BenCallID=t1.BenCallID and t3.obcallid=t1.obcallid
set	t1.ProbableCauseOfDefect = t3.Answer 
where t1.Question='Probable Defect Cause'  and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;
*/

update `db_iemr`.`t_mctscallresponse` t1
set	t1.CongentialAnomalies =t1.Answer 
where t1.Question='Reasons for Congential Anomalies' and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;

update `db_iemr`.`t_mctscallresponse` t1
set	t1.ProbableCauseOfDefect =t1.Answer 
where t1.Question='Probable Defect Cause' and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;

update `db_iemr`.`t_mctscallresponse` t1
inner join  t_mctscallresponse t2 on t1.BenCallID=t2.BenCallID and t1.obcallid=t2.obcallid
set	t1.OtherHrpReason = t2.Answer 
where t2.Question='Other HRP Reason' and t1.Question='Any High Risk Pregnancy (HRP)?' AND t1.Answer ='Yes'
and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;

update `db_iemr`.`t_mctscallresponse` t1
inner join  t_mctscallresponse t2 on t1.BenCallID=t2.BenCallID and t1.obcallid=t2.obcallid
set	t1.OtherHrni = t2.Answer 
where t2.Question='Other HRNI Reason' and t1.Question='Any High Risk Newborn/Infant?' AND t1.Answer ='Yes'
and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;

update `db_iemr`.`t_mctscallresponse` t1
inner join  t_mctscallresponse t2 on t1.BenCallID=t2.BenCallID and t1.obcallid=t2.obcallid
set	t1.OtherCongentialAnomalies = t2.Answer 
where t2.Question='Other Congential Anomalie' and t1.Question='Reasons for Congential Anomalies' 
and t1.BenCallID=v_BenCallID and t1.obcallid=v_obcallid;


select 'Updation has done Successfully';

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_UpdateNotificationMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `PR_UpdateNotificationMap`(v_NotificationID int, v_ModifiedBy varchar(50), v_ValidFrom datetime, v_Deleted bit)
BEGIN

 
DECLARE v_NotificationState VARCHAR(30)  default 'unread';
 







update `db_iemr`.`m_usernotificationmap` 
set 
NotificationState = v_NotificationState,
ModifiedBy = v_ModifiedBy,
Deleted = v_Deleted
where NotificationID =v_NotificationID;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_ANC`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT 
AD.ID, 
AD.BeneficiaryRegID, 
AD.ProviderServiceMapID, 
AD.VisitCode,
AD.VisitDate,
AD.VisitNo,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, AD.VisitDate) AS Age,
BEN.PreferredPhoneNum,
AD.IshighRisk,
AD.VanID, 
AD.VanName,
AD.VehicalNo,
AD.ParkingPlaceID,
BRD.referredToInstituteName,
BRD.ServiceName,
AD.CreatedDate
 FROM db_reporting.fact_ancdiagnosis AD
	left join db_reporting.dim_beneficiary BEN on AD.BeneficiaryRegID = BEN.BeneficiaryRegID
	left join db_reporting.fact_benreferdetails BRD on AD.BeneficiaryRegID = BRD.BeneficiaryRegID 
		and AD.VisitCode = BRD.VisitCode
where date(AD.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and AD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or AD.VanID = P_VanID);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANCHighRisk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_ANCHighRisk`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT 
AD.ID, 
AD.BeneficiaryRegID, 
AD.ProviderServiceMapID, 
AD.VisitCode,
AD.VisitDate,
AD.VisitNo,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, AD.VisitDate) AS Age,
BEN.PreferredPhoneNum,
AD.IshighRisk,
AD.ComplicationOfCurrentPregnancy,
AD.VanID, 
AD.VanName,
AD.VehicalNo,
AD.ParkingPlaceID,
BRD.referredToInstituteName,
BRD.ServiceName,
AD.CreatedDate
 FROM db_reporting.fact_ancdiagnosis AD
	left join db_reporting.dim_beneficiary BEN on AD.BeneficiaryRegID = BEN.BeneficiaryRegID
	left join db_reporting.fact_benreferdetails BRD on AD.BeneficiaryRegID = BRD.BeneficiaryRegID 
		and AD.VisitCode = BRD.VisitCode
where date(AD.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and AD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or AD.VanID = P_VanID)
	and AD.IshighRisk is true;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_BenDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_BenDisease`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT
BEND.FactDiaHyperCaseID, 
BEND.BeneficiaryRegID, 
BEND.ProviderServiceMapID, 
BEND.VisitCode,
BEND.VisitDate,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, BEND.VisitDate) AS Age,
BEN.PreferredPhoneNum,
BEND.Disease,
BEND.VanID, 
BEND.VanName,
BEND.VehicalNo,
BEND.ParkingPlaceID,
BEND.CreatedDate
 FROM db_reporting.fact_bendisease BEND
	left join db_reporting.dim_beneficiary BEN on BEND.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(BEND.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and BEND.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or BEND.VanID = P_VanID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ChiefComplaintReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_ChiefComplaintReport`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ParkingPlaceID INT)
BEGIN
SELECT 
ChiefComplaintID,
ChiefComplaint,
VanID,
VanName,
GenderID,
Gender,
count(case when GenderID is not null then 1 end)TotalCnt,
count(case when GenderID=1 then 1 end ) Male, 
count(case when GenderID=2 then 1 end ) Female,
count(case when GenderID=3 then 1 end ) TransGender
FROM db_reporting.fact_benchiefcomplaint  bencom
left join db_reporting.dim_beneficiary dim on bencom.BeneficiaryRegID=dim.BeneficiaryRegID
where date(bencom.createddate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and ParkingPlaceID = P_ParkingPlaceID
group by ChiefComplaintID,VanID;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ChildrenCases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ChildrenCases`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN

select
BVD.BenVisitID,
BVD.VisitCode,
BVD.createddate as VisitDate,
BVD.BeneficiaryRegID,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.Gender,
DATE(BEN.DOB) AS DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, BVD.CreatedDate) AS Age,
BEN.CreatedDate as RegistrationDate,
BEN.PreferredPhoneNum,
BEN.FatherName,
BVD.VisitCategory,
BVD.VisitNo,
BVD.CreatedDate,
BVD.VanID,
BVD.VanName,

BVD.VehicalNo
from db_reporting.fact_benvisitdetail BVD
left join db_reporting.dim_beneficiary BEN on BVD.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(BVD.createddate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and BVD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or BVD.VanID = P_VanID)
    having Age <= 12;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Consultation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Consultation`(IN P_CallDateFrom Date, IN P_CallDateTo Date, IN P_ParkingPlaceID INT)
BEGIN

SELECT

TMR.TMRequestID,

TMR.BeneficiaryRegID,

BEN.BeneficiaryID,

CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS BeneficiaryName,

TMR.BenVisitID,

TMR.VisitCode,

TMR.VisitNo,

TMR.SpecializationID,

TMR.Specialization,

TMR.UserID,

TMR.UserName,

TMR.Name,

TMR.RequestDate,

TMR.Duration_minute,

TMR.Status,

TMR.ConsultationStats,

TMR.BeneficiaryArrivalTime,

TMR.Consultation_FirstStart,

TMR.Consultation_LastEnd,

TMR.ProviderServiceMapID,

TMR.VanID,

TMR.VanName,

tmr.UserID AS SpecialistID,

t2.StartTime,

 max(EndTime) EndTime,

-- t2.EndTime,

CONVERT(timediff(tmr.Consultation_FirstStart, tmr.BeneficiaryArrivalTime), CHAR) arrival_to_firstDiagnosis,

 

 

CONVERT(sec_to_time(sum(time_to_sec(timediff(t2.EndTime, t2.StartTime)))), CHAR) diagnosisSTart_to_diagnosisEnd

-- CONVERT(timediff(t2.EndTime, t2.StartTime), CHAR) diagnosisSTart_to_diagnosisEnd

FROM db_reporting.fact_tmrequest  TMR

inner join db_reporting.dim_beneficiary BEN on TMR.BeneficiaryRegID = BEN.BeneficiaryRegID

left JOIN (select * from db_iemr.t_tmstats where StartTime is not null and endtime is not null) t2 ON tmr.BeneficiaryRegID = t2.BeneficiaryRegID AND tmr.VisitCode = t2.VisitCode

where date(TMR.createddate) between P_CallDateFrom and P_CallDateTo

                and TMR.ParkingPlaceID = P_ParkingPlaceID and TMR.Status = 'D'

   AND TMR.deleted is False

  -- and t2.endtime is not null

    group by TMR.BeneficiaryRegID,TMR.VisitCode;

 

 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DiabeticHyper` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_DiabeticHyper`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT
DHC.FactDiaHyperCaseID, 
DHC.BeneficiaryRegID, 
DHC.ProviderServiceMapID, 
DHC.VisitCode,
DHC.VisitDate,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, DHC.VisitDate) AS Age,
BEN.PreferredPhoneNum,
DHC.IsDiabetesMellitus,
DHC.IsHypertension,
DHC.VanID, 
DHC.VanName,
DHC.VehicalNo,
DHC.ParkingPlaceID,
DHC.CreatedDate
 FROM db_reporting.fact_diahypercase DHC
	left join db_reporting.dim_beneficiary BEN on DHC.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(DHC.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and DHC.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or DHC.VanID = P_VanID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LabTestresult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_LabTestresult`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT 
LTR.ID, 
LTR.BeneficiaryRegID, 
LTR.ProviderServiceMapID, 
LTR.VisitCode,
LTR.VisitDate,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, LTR.VisitDate) AS Age,
LTR.ProcedureID, 
LTR.ProcedureName, 
LTR.TestComponentID, 
LTR.TestComponentName, 
CONCAT(COALESCE(LTR.TestResultValue, '' ),' ',COALESCE(LTR.TestResultUnit, '' )) AS TestResult,
LTR.VanID, 
LTR.VanName,
LTR.VehicalNo,
LTR.ParkingPlaceID,
LTR.CreatedDate
 FROM db_reporting.fact_labtestresult LTR
	left join db_reporting.dim_beneficiary BEN on LTR.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(LTR.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and LTR.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or LTR.VanID = P_VanID);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LabTestresult_SPARSHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`localhost` PROCEDURE `SP_LabTestresult_SPARSHA`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT 
 
LTR.BeneficiaryRegID, 
LTR.ProviderServiceMapID, 
LTR.VisitCode,
LTR.VisitDate ,
LTR.ProcedureName, 
LTR.TestComponentName, 
LTR.TestResultValue,
LTR.VanID, 
-- LTR.VanName,
-- LTR.VehicalNo,
-- LTR.ParkingPlaceID,
-- LTR.CreatedDate,
LTR.VanSerialNo
 FROM db_reporting.fact_labtestresult LTR
	left join db_reporting.dim_beneficiary BEN on LTR.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(LTR.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and LTR.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or LTR.VanID = P_VanID);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Dim_1097Beneficiary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Dim_1097Beneficiary`()
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Dim_1097Beneficiary
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           10-07-2017
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO fetch the User based on the given conditions.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

      1.1         -                       -Dharmendra       - 25-05-2018               As like 104 report

*********************************************************************************************************************/
INSERT INTO db_reporting.scheduler_status (proc_name, status, time)
  VALUES ('SP_Load_Dim_1097Beneficiary', 'started', now());

Insert Into db_reporting.dim_1097beneficiary(
BeneficiaryRegID,
BenficiaryDetailsID,
BeneficiaryID,
BeneficiaryMapID,
TitleId,
Title,
GenderId,
Gender,
MaritalStatusId,
MaritalStatus,
DOB,
SexualOrientationId,
SexualOrientationType,
IsHIVPositive,
HIVStatus,
educationId,
education,
occupationId,
occupation,
HealthCareWorkerId,
HealthCareWorker,
incomeStatus,
communityId,
community,
preferredLanguage,
religionId,
religion,
PlaceOfWork,
PermStateId,
PermState,
PermDistrictId,
PermDistrict,
PermSubDistrictId,
PermSubDistrict,
ProviderServiceMapID,
CreatedDate,
CreatedBy,
dim_create_date,
LoadedBy,
LodadedDate
    )
    SELECT
    BM.BenRegId,
    BD.BeneficiaryDetailsId,
    M.BeneficiaryID,
    BM.BenMapId,
    BD.TitleId,
    BD.Title,
    BD.GenderId,
    BD.Gender,
    BD.MaritalStatusId,
    BD.MaritalStatus,
    BD.DOB,
    BD.SexualOrientationID,
    BD.SexualOrientationType,
    BD.IsHIVPositive,
    BD.HIVStatus,
    BD.educationId,
    BD.education,
    BD.occupationId,
    BD.occupation,
    BD.HealthCareWorkerId,
    BD.HealthCareWorker,
    BD.incomeStatus,
    BD.communityId,
    BD.community,
    BD.preferredLanguage,
    BD.religionId,
    BD.religion,
    BD.PlaceOfWork,
    BA.PermStateId,
    BA.PermState,
    BA.PermDistrictId,
    BA.PermDistrict,
    BA.PermSubDistrictId,
    BA.PermSubDistrict,
    M.ProviderServiceMapID,
    BD.CreatedDate,
    BD.CreatedBy,
    Replace(DATE(BD.CreatedDate),'-','')AS dim_create_date,
    'SP_Load_Dim_1097Beneficiary',
    NOW()

FROM db_1097_identity.i_BeneficiaryDetails BD
LEFT JOIN db_1097_identity.i_beneficiarymapping BM ON BM.BenDetailsId = BD.BeneficiaryDetailsId
LEFT JOIN db_1097_identity.i_beneficiaryaddress BA ON BA.BenAddressID = BM.BenAddressId
LEFT JOIN db_1097_identity.m_beneficiaryregidmapping M ON M.BenRegId = BM.BenRegId
  WHERE DATE(BD.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
--  WHERE DATE(BD.CreatedDate)<CURDATE();




UPDATE db_reporting.dim_1097beneficiary   DB
LEFT JOIN db_1097_identity.i_BeneficiaryDetails BD  ON   DB.BenficiaryDetailsID = BD.BeneficiaryDetailsId
LEFT JOIN db_1097_identity.i_beneficiarymapping BM ON BM.BenDetailsId = BD.BeneficiaryDetailsId
LEFT JOIN db_1097_identity.i_beneficiaryaddress BA ON BA.BenAddressID = BM.BenAddressId
LEFT JOIN db_1097_identity.m_beneficiaryregidmapping M ON M.BenRegId = BM.BenRegId
 SET

DB.BeneficiaryRegID =  BM.BenRegId,
DB.BenficiaryDetailsID = BD.BeneficiaryDetailsId,
DB.BeneficiaryID = M.BeneficiaryID,
DB.BeneficiaryMapID = BM.BenMapId,
DB.TitleId = BD.TitleId,
DB.Title = BD.Title,
DB.GenderId = BD.GenderId,
DB.Gender = BD.Gender,
DB.MaritalStatusId = BD.MaritalStatusId,
DB.MaritalStatus = BD.MaritalStatus,
DB.DOB = BD.DOB,
DB.SexualOrientationId = BD.SexualOrientationID,
DB.SexualOrientationType = BD.SexualOrientationType,
DB.IsHIVPositive = BD.IsHIVPositive,
DB.HIVStatus = BD.HIVStatus,
DB.educationId = BD.educationId,
DB.education = BD.education,
DB.occupationId = BD.occupationId,
DB.occupation = BD.occupation,
DB.HealthCareWorkerId = BD.HealthCareWorkerId,
DB.HealthCareWorker= BD.HealthCareWorker,
DB.incomeStatus = BD.incomeStatus,
DB.communityId = BD.communityId,
DB.community = BD.community,
DB.preferredLanguage = BD.preferredLanguage,
DB.religionId = BD.religionId,
DB.religion =BD.religion,
DB.PlaceOfWork = BD.PlaceOfWork,
DB.PermDistrictId = BA.PermDistrictId,
DB.PermDistrict = BA.PermDistrict,
DB.PermSubDistrictId = BA.PermSubDistrictId,
DB.PermSubDistrict = BA.PermSubDistrict,
DB.ProviderServiceMapID = M.ProviderServiceMapID,
DB.CreatedDate = BD.CreatedDate,
DB.CreatedBy = BD.CreatedBy

WHERE DB.CreatedDate< CURDATE() - INTERVAL 1 DAY
       AND (BD.LastModDate >DB.LodadedDate   OR BA.LastModDate>DB.LodadedDate);

INSERT INTO db_reporting.scheduler_status (proc_name, status, time)
  VALUES ('SP_Load_Dim_1097Beneficiary', 'completed', now());
		


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Dim_beneficiary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Load_Dim_beneficiary`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           ProcedureName
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra Mohapatra
--    Created Date                  :           11-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To fetch beneficiary details


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Dim_beneficiary','started',now());

INSERT INTO db_reporting.dim_beneficiary
(BeneficiaryDetailsId,
BeneficiaryRegID,
BeneficiaryID,
TitleId,
Title,
FirstName,
MiddleName,
LastName,
Status,
GenderId,
Gender,
MaritalStatusId,
MaritalStatus,
MarriageDate,
DOB,
FatherName,
MotherName,
SpouseName,
EmergencyRegistration,
HealthCareWorkerId,
HealthCareWorker,
PlaceOfWork,
LiteracyStatus,
educationId,
education,
occupationId,
occupation,
incomeStatus,
communityId,
community,
religionId,
religion,
preferredLanguage,
sourceOfInfo,
servicePointId,
areaId,
zoneId,
phcId,
Remarks,
SexualOrientationID,
SexualOrientationType,
IsHIVPositive,
HIVStatus,
BenContactsID,
PreferredPhoneNum,
PreferredPhoneTyp,
PreferredSMSPhoneNum,
PreferredSMSPhoneTyp,
EmergencyContactNum,
EmergencyContactTyp,
PhoneNum1,
PhoneTyp1,
PhoneNum2,
PhoneTyp2,
PhoneNum3,
PhoneTyp3,
PhoneNum4,
PhoneTyp4,
PhoneNum5,
PhoneTyp5,
EmailId,
BenAddressID,
PermAddrLine1,
PermAddrLine2,
PermAddrLine3,
PermCountryId,
PermCountry,
PermStateId,
PermState,
PermDistrictId,
PermDistrict,
PermSubDistrictId,
PermSubDistrict,
PermVillageId,
PermVillage,
Isrural,
PermHabitation,
PermPinCode,
PermZoneID,
PermZone,
PermAreaId,
PermArea,
PermServicePointId,
PermServicePoint,
PermCoordinate,
CurrAddrLine1,
CurrAddrLine2,
CurrAddrLine3,
CurrCountryId,
CurrCountry,
CurrStateId,
CurrState,
CurrDistrictId,
CurrDistrict,
CurrSubDistrictId,
CurrSubDistrict,
CurrVillageId,
CurrVillage,
CurrHabitation,
CurrPinCode,
CurrZoneID,
CurrZone,
CurrAreaId,
CurrArea,
CurrServicePointId,
CurrServicePoint,
CurrCoordinate,
EmerAddrLine1,
EmerAddrLine2,
EmerAddrLine3,
EmerCountryId,
EmerCountry,
EmerStateId,
EmerState,
EmerDistrictId,
EmerDistrict,
EmerSubDistrictId,
EmerSubDistrict,
EmerVillageId,
EmerVillage,
EmerHabitation,
EmerPinCode,
PermAddressValue,
CurrAddressValue,
EmerAddressValue,
EmerZoneID,
EmerZone,
EmerAreaId,
EmerArea,
EmerServicePointId,
EmerServicePoint,
EmerCoordinate,
ProviderServiceMapID,
CreatedDate,
CreatedBy,
dim_create_date,
LoadedBy,
LodadedDate
)

SELECT
BD.BeneficiaryDetailsId,
BM.BenRegId,
BR.BeneficiaryID,
BD.TitleId,
BD.Title,
BD.FirstName,
BD.MiddleName,
BD.LastName,
BD.Status,
BD.GenderId,
BD.Gender,
BD.MaritalStatusId,
BD.MaritalStatus,
MarriageDate,
BD.DOB,
BD.FatherName,
BD.MotherName,
BD.SpouseName,
BD.EmergencyRegistration,
BD.HealthCareWorkerId,
BD.HealthCareWorker,
BD.PlaceOfWork,
BD.LiteracyStatus,
BD.educationId,
BD.education,
BD.occupationId,
BD.occupation,
BD.incomeStatus,
BD.communityId,
BD.community,
BD.religionId,
BD.religion,
BD.preferredLanguage,
BD.sourceOfInfo,
BD.servicePointId,
BD.areaId,
BD.zoneId,
BD.phcId,
BD.Remarks,
BD.SexualOrientationID,
BD.SexualOrientationType,
BD.IsHIVPositive,
BD.HIVStatus,
BC.BenContactsID,
BC.PreferredPhoneNum,
BC.PreferredPhoneTyp,
BC.PreferredSMSPhoneNum,
BC.PreferredSMSPhoneTyp,
BC.EmergencyContactNum,
BC.EmergencyContactTyp,
BC.PhoneNum1,
BC.PhoneTyp1,
BC.PhoneNum2,
BC.PhoneTyp2,
BC.PhoneNum3,
BC.PhoneTyp3,
BC.PhoneNum4,
BC.PhoneTyp4,
BC.PhoneNum5,
BC.PhoneTyp5,
BC.EmailId,
BA.BenAddressID,
BA.PermAddrLine1,
BA.PermAddrLine2,
BA.PermAddrLine3,
BA.PermCountryId,
BA.PermCountry,
BA.PermStateId,
BA.PermState,
BA.PermDistrictId,
BA.PermDistrict,
BA.PermSubDistrictId,
BA.PermSubDistrict,
BA.PermVillageId,
BA.PermVillage,
MD.Isrural,
BA.PermHabitation,
BA.PermPinCode,
BA.PermZoneID,
BA.PermZone,
BA.PermAreaId,
BA.PermArea,
BA.PermServicePointId,
BA.PermServicePoint,
BA.PermCoordinate,
BA.CurrAddrLine1,
BA.CurrAddrLine2,
BA.CurrAddrLine3,
BA.CurrCountryId,
BA.CurrCountry,
BA.CurrStateId,
BA.CurrState,
BA.CurrDistrictId,
BA.CurrDistrict,
BA.CurrSubDistrictId,
BA.CurrSubDistrict,
BA.CurrVillageId,
BA.CurrVillage,
BA.CurrHabitation,
BA.CurrPinCode,
BA.CurrZoneID,
BA.CurrZone,
BA.CurrAreaId,
BA.CurrArea,
BA.CurrServicePointId,
BA.CurrServicePoint,
BA.CurrCoordinate,
BA.EmerAddrLine1,
BA.EmerAddrLine2,
BA.EmerAddrLine3,
BA.EmerCountryId,
BA.EmerCountry,
BA.EmerStateId,
BA.EmerState,
BA.EmerDistrictId,
BA.EmerDistrict,
BA.EmerSubDistrictId,
BA.EmerSubDistrict,
BA.EmerVillageId,
BA.EmerVillage,
BA.EmerHabitation,
BA.EmerPinCode,
BA.PermAddressValue,
BA.CurrAddressValue,
BA.EmerAddressValue,
BA.EmerZoneID,
BA.EmerZone,
BA.EmerAreaId,
BA.EmerArea,
BA.EmerServicePointId,
BA.EmerServicePoint,
BA.EmerCoordinate,
BR.ProviderServiceMapID,
BM.CreatedDate,
BM.CreatedBy,
Replace(DATE(BD.CreatedDate),'-','')AS dim_create_date,
'SP_Load_dim_beneficiary',
NOW()
FROM db_identity.i_BeneficiaryDetails BD
LEFT JOIN db_identity.i_beneficiarymapping BM ON BM.BenDetailsId = BD.BeneficiaryDetailsId
LEFT JOIN db_identity.i_BeneficiaryContacts BC ON BC.BenContactsID = BM.BenContactsId
LEFT JOIN db_identity.i_beneficiaryaddress BA ON BA.BenAddressID = BM.BenAddressId
LEFT JOIN db_identity.m_beneficiaryregidmapping BR ON BR.BenRegId = BM.BenRegId
left join db_iemr.m_districtbranchmapping md on md.DistrictBranchID=BA.PermVillageID
 WHERE DATE(BD.CreatedDate)=CURDATE() - INTERVAL 1 DAY ;
 -- WHERE DATE(BD.CreatedDate)<CURDATE();

-- UPDATE

UPDATE db_reporting.dim_beneficiary   DB
LEFT JOIN db_identity.i_BeneficiaryDetails BD  ON   DB.BeneficiaryDetailsId = BD.BeneficiaryDetailsId
LEFT JOIN db_identity.i_beneficiarymapping BM ON BM.BenDetailsId = BD.BeneficiaryDetailsId
LEFT JOIN db_identity.i_beneficiaryaddress BA ON BA.BenAddressID = BM.BenAddressId
LEFT JOIN db_identity.i_BeneficiaryContacts BC ON BC.BenContactsID = BM.BenContactsId
LEFT JOIN db_identity.m_beneficiaryregidmapping BR ON BR.BenRegId = BM.BenRegId
left join db_iemr.m_districtbranchmapping md on md.DistrictBranchID=BA.PermVillageID
 SET

DB.BeneficiaryDetailsId=BD.BeneficiaryDetailsId,
DB.BeneficiaryRegID=BM.BenRegId,
DB.BeneficiaryID=BR.BeneficiaryID,
DB.TitleId=BD.TitleId,
DB.Title=BD.Title,
DB.FirstName=BD.FirstName,
DB.MiddleName=BD.MiddleName,
DB.LastName=BD.LastName,
DB.Status=BD.Status,
DB.GenderId=BD.GenderId,
DB.Gender=BD.Gender,
DB.MaritalStatusId=BD.MaritalStatusId,
DB.MaritalStatus=BD.MaritalStatus,
DB.MarriageDate=BD.MarriageDate,
DB.DOB=BD.DOB,
DB.FatherName=BD.FatherName,
DB.MotherName=BD.MotherName,
DB.SpouseName=BD.SpouseName,
DB.EmergencyRegistration=BD.EmergencyRegistration,
DB.HealthCareWorkerId=BD.HealthCareWorkerId,
DB.HealthCareWorker=BD.HealthCareWorker,
DB.PlaceOfWork=BD.PlaceOfWork,
DB.LiteracyStatus=BD.LiteracyStatus,
DB.educationId=BD.educationId,
DB.education=BD.education,
DB.occupationId=BD.occupationId,
DB.occupation=BD.occupation,
DB.incomeStatus=BD.incomeStatus,
DB.communityId=BD.communityId,
DB.community=BD.community,
DB.religionId=BD.religionId,
DB.religion=BD.religion,
DB.preferredLanguage=BD.preferredLanguage,
DB.sourceOfInfo=BD.sourceOfInfo,
DB.servicePointId=BD.servicePointId,
DB.areaId=BD.areaId,
DB.zoneId=BD.zoneId,
DB.phcId=BD.phcId,
DB.Remarks=BD.Remarks,
DB.SexualOrientationID=BD.SexualOrientationID,
DB.SexualOrientationType=BD.SexualOrientationType,
DB.IsHIVPositive=BD.IsHIVPositive,
DB.HIVStatus = BD.HIVStatus,
DB.BenContactsID=BC.BenContactsID,
DB.PreferredPhoneNum=BC.PreferredPhoneNum,
DB.PreferredPhoneTyp=BC.PreferredPhoneTyp,
DB.PreferredSMSPhoneNum=BC.PreferredSMSPhoneNum,
DB.PreferredSMSPhoneTyp=BC.PreferredSMSPhoneTyp,
DB.EmergencyContactNum=BC.EmergencyContactNum,
DB.EmergencyContactTyp=BC.EmergencyContactTyp,
DB.PhoneNum1=BC.PhoneNum1,
DB.PhoneTyp1=BC.PhoneTyp1,
DB.PhoneNum2=BC.PhoneNum2,
DB.PhoneTyp2=BC.PhoneTyp2,
DB.PhoneNum3=BC.PhoneNum3,
DB.PhoneTyp3=BC.PhoneTyp3,
DB.PhoneNum4=BC.PhoneNum4,
DB.PhoneTyp4=BC.PhoneTyp4,
DB.PhoneNum5=BC.PhoneNum5,
DB.PhoneTyp5=BC.PhoneTyp5,
DB.EmailId=BC.EmailId,
DB.BenAddressID=BA.BenAddressID,
DB.PermAddrLine1=BA.PermAddrLine1,
DB.PermAddrLine2=BA.PermAddrLine2,
DB.PermAddrLine3=BA.PermAddrLine3,
DB.PermCountryId=BA.PermCountryId,
DB.PermCountry=BA.PermCountry,
DB.PermStateId=BA.PermStateId,
DB.PermState=BA.PermState,
DB.PermDistrictId=BA.PermDistrictId,
DB.PermDistrict=BA.PermDistrict,
DB.PermSubDistrictId=BA.PermSubDistrictId,
DB.PermSubDistrict=BA.PermSubDistrict,
DB.PermVillageId=BA.PermVillageId,
DB.PermVillage=BA.PermVillage,
DB.Isrural=md.Isrural,
DB.PermHabitation=BA.PermHabitation,
DB.PermPinCode=BA.PermPinCode,
DB.PermZoneID=BA.PermZoneID,
DB.PermZone=BA.PermZone,
DB.PermAreaId=BA.PermAreaId,
DB.PermArea=BA.PermArea,
DB.PermServicePointId=BA.PermServicePointId,
DB.PermServicePoint=BA.PermServicePoint,
DB.PermCoordinate=BA.PermCoordinate,
DB.CurrAddrLine1=BA.CurrAddrLine1,
DB.CurrAddrLine2=BA.CurrAddrLine2,
DB.CurrAddrLine3=BA.CurrAddrLine3,
DB.CurrCountryId=BA.CurrCountryId,
DB.CurrCountry=BA.CurrCountry,
DB.CurrStateId=BA.CurrStateId,
DB.CurrState=BA.CurrState,
DB.CurrDistrictId=BA.CurrDistrictId,
DB.CurrDistrict=BA.CurrDistrict,
DB.CurrSubDistrictId=BA.CurrSubDistrictId,
DB.CurrSubDistrict=BA.CurrSubDistrict,
DB.CurrVillageId=BA.CurrVillageId,
DB.CurrVillage=BA.CurrVillage,
DB.CurrHabitation=BA.CurrHabitation,
DB.CurrPinCode=BA.CurrPinCode,
DB.CurrZoneID=BA.CurrZoneID,
DB.CurrZone=BA.CurrZone,
DB.CurrAreaId=BA.CurrAreaId,
DB.CurrArea=BA.CurrArea,
DB.CurrServicePointId=BA.CurrServicePointId,
DB.CurrServicePoint=BA.CurrServicePoint,
DB.CurrCoordinate=BA.CurrCoordinate,
DB.EmerAddrLine1=BA.EmerAddrLine1,
DB.EmerAddrLine2=BA.EmerAddrLine2,
DB.EmerAddrLine3=BA.EmerAddrLine3,
DB.EmerCountryId=BA.EmerCountryId,
DB.EmerCountry=BA.EmerCountry,
DB.EmerStateId=BA.EmerStateId,
DB.EmerState=BA.EmerState,
DB.EmerDistrictId=BA.EmerDistrictId,
DB.EmerDistrict=BA.EmerDistrict,
DB.EmerSubDistrictId=BA.EmerSubDistrictId,
DB.EmerSubDistrict=BA.EmerSubDistrict,
DB.EmerVillageId=BA.EmerVillageId,
DB.EmerVillage=BA.EmerVillage,
DB.EmerHabitation=BA.EmerHabitation,
DB.EmerPinCode=BA.EmerPinCode,
DB.PermAddressValue=BA.PermAddressValue,
DB.CurrAddressValue=BA.CurrAddressValue,
DB.EmerAddressValue=BA.EmerAddressValue,
DB.EmerZoneID=BA.EmerZoneID,
DB.EmerZone=BA.EmerZone,
DB.EmerAreaId=BA.EmerAreaId,
DB.EmerArea=BA.EmerArea,
DB.EmerServicePointId=BA.EmerServicePointId,
DB.EmerServicePoint=BA.EmerServicePoint,
DB.EmerCoordinate=BA.EmerCoordinate,
DB.ProviderServiceMapID=BR.ProviderServiceMapID,
DB.CreatedDate = BM.CreatedDate,
DB.CreatedBy = BM.CreatedBy ,
-- DB.dim_create_date=Replace(DATE(BD.CreatedDate),'-','')AS dim_create_date,
-- DB.LoadedBy='SP_Load_dim_beneficiary',
DB.LodadedDate=NOW()

WHERE
-- DB.CreatedDate< CURDATE() - INTERVAL 1 DAY
--        AND
(BD.LastModDate >DB.LodadedDate   OR BA.LastModDate>DB.LodadedDate OR  BC.LastModDate>DB.LodadedDate);

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Dim_beneficiary','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Dim_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Dim_User`()
BEGIN


/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Dim_User
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra Mohapatra
--    Created Date                  :           11-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To fetch User details
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Dim_User','started',now());

INSERT INTO db_reporting.dim_user(
UserID,
TitleID,
TitleName,
FirstName,
MiddleName,
LastName,
GenderID,
GenderIName,
MaritalStatusID,
MaritalStatusName,
AadhaarNo,
PAN,
DOB,
FathersName,
MothersName,
CommunityID,
CommunityName,
ReligionID,
ReligionName,
AddressLine1,
AddressLine2,
PermAddressLine1,
PermAddressLine2,
PermStateID,
PermStateName,
PermDistrictID,
PermDistrictName,
PermPinCode,
PermanentAddress,
CountryID,
CountryName,
StateID,
StateName,
DistrictID,
DistrictName,
PinCode,
IsPresent,
IsPermanent,
DOJ,
QualificationID,
QualificationName,
DesignationID,
DesignationName,
EmployeeID,
UserName,
Password,
ContactNo,
EmailID,
StatusID,
StatusName,
ServiceProviderID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
LoadedBy,
LodadedDate
 )

select
MU.UserID,
MU.TitleID,
MT.TitleName,
MU.FirstName,
MU.MiddleName,
MU.LastName,
MU.GenderID,
MG.GenderName,
MST.MaritalStatusID,
MST.status,
MU.AadhaarNo,
MU.PAN,
MU.DOB,
MUD.FathersName,
MUD.MothersName,
MC.CommunityID,
MC.Communitydesc,
MR.ReligionID,
MR.ReligionType,
MUD.AddressLine1,
MUD.AddressLine2,
MUD.PermAddressLine1,
MUD.PermAddressLine2,
MS.stateid,
MS.StateName,
MD.DistrictID,
MD.DistrictName,
MUD.PermPinCode,
MUD.PermanentAddress,
MCY.countryID,
MCY.countryName,
MS.stateid,
MS.StateName,
MD.DistrictID,
MD.DistrictName,
MUD.PinCode,
MUD.IsPresent,
MUD.IsPermanent,
MU.DOJ,
MQ.QualificationID,
MQ.Name as Qualification,
MDG.DesignationID,
MDG.DesignationName,
MU.EmployeeID,
MU.UserName,
MU.Password,
MU.ContactNo,
MU.EmailID,
MSTS.StatusID,
MSTS.Status,
MSP.ServiceProviderID,
MU.CreatedBy,
MU.CreatedDate,
MU.ModifiedBy,
MU.LastModDate,
'SP_Load_Dim_User',
NOW()
from db_iemr.m_user  MU
LEFT JOIN  db_iemr.m_UserDemographics MUD ON MU.UserID = MUD.UserID
LEFT JOIN db_iemr.m_title  MT ON MT.titleID = MU.titleID
LEFT JOIN db_iemr.m_gender  MG ON MG.genderID = MU.genderID
LEFT JOIN db_iemr.m_maritalstatus MST on MST.MaritalStatusID = MU.MaritalStatusID
LEFT JOIN db_iemr.m_community MC on MC.CommunityID = MUD.CommunityID
LEFT JOIN db_iemr.m_religion MR on MR.ReligionID = MUD.ReligionID
LEFT JOIN db_iemr.m_country  MCY ON MCY.countryID = MUD.CountryID
LEFT JOIN db_iemr.m_state  MS ON MS.stateID = MUD.StateID
LEFT JOIN db_iemr.m_district MD on MD.DistrictID = MUD.DistrictID
LEFT join db_iemr.m_userqualification MQ on MQ.QualificationID = MU.QualificationID
LEFT JOIN db_iemr.m_designation MDG ON MDG.designationID = MU.DesignationID
LEFT join db_iemr.m_status MSTS on MSTS.StatusID = MU.StatusID
LEFT join db_iemr.m_providerservicemapping MPS on MPS.ProviderServiceMapID = MSTS.ProviderServiceMapID
LEFT join db_iemr.m_serviceprovider MSP on MSP.ServiceProviderID = MPS.ServiceProviderID
WHERE DATE(MU.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(MU.CreatedDate)<CURDATE() ;

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Dim_User','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_104BenCDIResponse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_104BenCDIResponse`()
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_104BenCDIResponse
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           06-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_104BenCDIResponse(Reporting)
                                                from  t_104BenCDIResponse(iemr)


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
INSERT INTO db_reporting.scheduler_status (proc_name, status, time)
  VALUES ('SP_Load_Fact_104BenCDIResponse', 'started', now());

INSERT INTO fact_104BenCDIResponse (
ID,
BeneficiaryRegID,
BenCallID,
QuestionID,
Question,
Answer,
Score,
TotalScore,
Remarks,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
Fact_CreatedDate,
LoadedBy,
LodadedDate)

  SELECT
    BR.ID,
    BR.BeneficiaryRegID,
    BR.BenCallID,
   --  BR.CallerID,
    MQ.QuestionID,
    MQ.Question,
    BR.Answer,
    BR.Score,
    BR.TotalScore,
    BR.Remarks,
    BR.ProviderServiceMapID,
    -- BR.Deleted,
    -- BR.Processed,
    BR.CreatedBy,
    BR.CreatedDate,
    BR.ModifiedBy,
    BR.LastModDate,
    REPLACE(DATE(BR.CreatedDate), '-', '') AS fact_CreatedDate,
    'SP_Load_Fact_104BenCDIResponse',
    NOW()
  FROM db_iemr.t_104BenCDIResponse BR
  LEFT JOIN db_iemr.m_questionnaire MQ
    ON MQ.QuestionID = BR.QuestionID
 --  WHERE BR.CreatedDate < curdate();
 WHERE DATE(BR.CreatedDate)=CURDATE() - INTERVAL 1 DAY;

INSERT INTO db_reporting.scheduler_status (proc_name, status, time)
  VALUES ('SP_Load_Fact_104BenCDIResponse', 'completed', now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_load_fact_104benmedhistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `sp_load_fact_104benmedhistory`()
BEGIN



/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_104BenMedHistory
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra Mohapatra
--    Created Date                  :           26-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To Load fact_104benmedhistory (reporting)
                                                from  t_104benmedhistory(db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_104BenMedHistory','started',now());



INSERT INTO db_reporting.fact_104benmedhistory (
BenHistoryID,
RequestID,
BeneficiaryRegID,
BenCallID,
PatientName,
PatientAge,
PatientGenderID,
PatientGenderName,
SymptomID,
Algorithm,
DiseaseSummaryID,
DiseaseSummary,
Allergies,
SelecteDiagnosisID,
SelecteDiagnosis,
CategoryID,
CategoryName,
SubCategoryID,
SubCategoryName,
AddedAdvice,
PrescriptionID,
Rx_UserID,
Rx_DiagnosisProvided,
Rx_Remarks,
ActionByHAO,
ActionByCO,
ActionByMO,
ActionByPD,
Remarks,
IsSelf,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate ,
LoadedBy,
LodadedDate,
travel_14days,
travel_type,
symptoms,
COVID19_contact_history,
medical_consultation,  
Suspected_COVID19,
recommendation,
TreatmentRecommendation 

)

SELECT
BM.BenHistoryID,
BM.RequestID,
BM.BeneficiaryRegID,
BM.BenCallID,
BM.PatientName,
BM.PatientAge,
BM.PatientGenderID,
MG.GenderName,
BM.SymptomID,
BM.Algorithm,
BM.DiseaseSummaryID,
BM.DiseaseSummary,
BM.Allergies,
BM.SelecteDiagnosisID,
BM.SelecteDiagnosis,
BM.CategoryID,
MC.CategoryName,
BM.SubCategoryID,
MSC.SubCategoryName,
BM.AddedAdvice,
P.PrescriptionID,
p.UserID,
P.DiagnosisProvided,
P.Remarks,
BM.ActionByHAO,
BM.ActionByCO,
BM.ActionByMO,
BM.ActionByPD,
BM.Remarks,
BM.IsSelf,
BM.ProviderServiceMapID,
BM.CreatedBy,
BM.CreatedDate,
BM.ModifiedBy,
BM.LastModDate,
Replace(DATE(BM.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_104BenMedHistory',
NOW(),
C.travel_14days,
C.travel_type,
C.symptoms,
C.COVID19_contact_history,
C.medical_consultation,  
C.Suspected_COVID19,
C.recommendation,
BM.TreatmentRecommendation 

FROM db_iemr.t_104benmedhistory BM
LEFT JOIN db_iemr.t_104Prescription  P ON BM.BENCALLID = P.BENCALLID
LEFT JOIN db_iemr.m_gender MG ON MG.GenderID = BM.PatientGenderID
Left join db_iemr.m_category MC on BM.CategoryID = MC.CategoryID
LEFT JOIN db_iemr.m_subcategory MSC on BM.SubcategoryID = MSC.SubCategoryID
left join db_iemr.t_covid19 C on C.BenCallID=BM.BenCallID and C.BeneficiaryRegID=BM.BeneficiaryRegID
 and C.BenMedHistoryID=BM.BenHistoryID
WHERE DATE(BM.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(BM.CreatedDate)<CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_104BenMedHistory','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_104prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_104prescription`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_1097CallSummary
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           08-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_104prescription
                                                from
                                                t_104prescription & t_104prescribeddrug.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write
	  1.1                               
*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_104prescription','started',now());

INSERT INTO db_reporting.fact_104prescription(
PrescriptionID,
BeneficiaryRegID,
BenCallID,
UserID,
DiagnosisProvided,
Remarks,
PrescribedDrugID,
DrugMapID,
DrugName,
DrugGroupName,
DrugForm,
DrugRoute,
Frequency,
Dosage,
NoOfDays,
TimeToConsume,
SideEffects,
ValidTill,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
TP.PrescriptionID,
TP.BeneficiaryRegID,
TP.BenCallID,
TP.UserID,
TP.DiagnosisProvided,
TP.Remarks,
TPD.PrescribedDrugID,
MD.DrugID,
MD.DrugName,
MD.DrugGroupName,
TPD.DrugForm,
TPD.DrugRoute,
TPD.Frequency,
TPD.Dosage,
TPD.NoOfDays,
TPD.TimeToConsume,
TPD.SideEffects,
TPD.ValidTill,
MD.ProviderServiceMapID,
TP.CreatedBy,
TP.CreatedDate,
TP.ModifiedBy,
TP.LastModDate,
Replace(DATE(TPD.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_104prescription',
NOW()
FROM db_iemr.t_104prescribeddrug TPD
LEFT JOIN db_iemr.t_104prescription TP ON TP.PrescriptionID = TPD.PrescriptionID
LEFT JOIN db_iemr.m_104drugmapping MD  ON MD.DrugMapID = TPD.DrugMapID
 WHERE date(TPD.CreatedDate)= CURDATE() - INTERVAL 1 DAY;
-- WHERE TP.CreatedDate< CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_104prescription','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_1097CallSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `SP_Load_Fact_1097CallSummary`()
BEGIN


/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_1097CallSummary
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           28-05-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load Fact_1097CallSummary(db_reporting)
                                                from t_bencall(db_iemr)


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
    1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write
	  1.1                               
*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_1097CallSummary','started',now());




INSERT INTO DB_REPORTING.Fact_1097CallSummary(
UserID,
CallStartTime,
CallEndTime,
BenCallID,
CZCallID,
AgentID,
CallType,
CallSubType,
Rec_UserName,
Rec_UserRole,
BeneficiaryRegID,
Info_Category,
Info_SubCategory,
CO_Category,
CO_SubCategory,
FeedbackID,
CallTransferRemarks,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate
)

SELECT
TB.CallReceivedUserID,
TB.CreatedDate,
TB.CallTime,
TB.BenCallID,
TB.CallID,
TB.ReceivedAgentID,
CT.CallGroupType,
CT.CallType,
US.UserName,
TB.ReceivedRoleName,
TB.BeneficiaryRegID,
ICA.CategoryName,
ISCA.SubCategoryName,
CCA.CategoryName,
CSCA.SubCategoryName,
MB.FeedbackID,
TB.Remarks,
TB.CalledServiceID,
TB.CreatedBy,
TB.CreatedDate,
TB.ModifiedBy,
Replace(DATE(TB.CreatedDate),'-','')AS fact_CreatedDate,
TB.LastModDate,
'SP_Load_Fact_1097CallSummary',
NOW()

FROM db_iemr.t_bencall TB 
Left JOIN db_iemr.m_BenCall1097ServicesMapping MB  ON MB.BenCallID = TB.BenCallID
Left join db_iemr.m_user US on TB.CallReceivedUserID = US.UserID
Left JOIN db_iemr.m_calltype CT ON TB.CallTypeID = CT.CallTypeID
Left Join db_iemr.m_Category ICA on MB.CategoryID  = ICA.CategoryID 
left join db_iemr.m_SubCategory ISCA on MB.SubCategoryID  = ISCA.SubCategoryID 
Left Join db_iemr.m_Category CCA on MB.COCategoryID  = CCA.CategoryID 
left join db_iemr.m_SubCategory CSCA on MB.COSubCategoryID  = CSCA.SubCategoryID
WHERE DATE(TB.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(TB.CreatedDate)<CURDATE() ;

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_1097CallSummary','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ANCCare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_ANCCare`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_ANCCare
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_anccare(db_reporting)
                                                 from  t_anccare  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ANCCare','started',now());



  INSERT INTO db_reporting.fact_anccare

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
VisitNo,
ComolaintType,
Duration,
Description,
LastMenstrualPeriod_LMP,
GestationalAgeOrPeriodofAmenorrhea_POA,
ExpectedDateofDelivery,
TrimesterNumber,
PrimiGravida,
Gravida_G,
TermDeliveries_T,
PretermDeliveries_P,
Abortions_A,
Livebirths_L,
BloodGroup,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
AC.ID,
AC.BeneficiaryRegID,
AC.BenVisitID,
AC.ProviderServiceMapID,
AC.VisitCode,
AC.VisitNo,
AC.ComolaintType,
AC.Duration,
AC.Description,
AC.LastMenstrualPeriod_LMP,
AC.GestationalAgeOrPeriodofAmenorrhea_POA,
AC.ExpectedDateofDelivery,
AC.TrimesterNumber,
AC.PrimiGravida,
AC.Gravida_G,
AC.TermDeliveries_T,
AC.PretermDeliveries_P,
AC.Abortions_A,
AC.Livebirths_L,
AC.BloodGroup,
AC.Deleted,
AC.Processed,
AC.CreatedBy,
AC.CreatedDate,
AC.ModifiedBy,
AC.LastModDate,
AC.VanSerialNo,
AC.VanID,
AC.VehicalNo,
AC.ParkingPlaceID,
AC.SyncedBy,
AC.SyncedDate,
  Replace(DATE(AC.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_ANCCare',
  NOW()
 FROM db_iemr.t_anccare AC
 WHERE DATE(AC.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(AC.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ANCCare','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ANCDiagnosis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_ANCDiagnosis`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_ANCDiagnosis
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_ancdiagnosis(db_reporting)
                                                 from  t_ancdiagnosis  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ANCDiagnosis','started',now());



  INSERT INTO db_reporting.fact_ancdiagnosis

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
VIsitDate,
VisitNo,
PrescriptionID,
HighRiskStatus,
HighRiskCondition,
ComplicationOfCurrentPregnancy,
OtherCompCurPreg,
IsHighRisk,
IsMaternalDeath,
PlaceOfDeath,
DateOfDeath,
CauseOfDeath,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
AD.ID,
AD.BeneficiaryRegID,
AD.BenVisitID,
AD.ProviderServiceMapID,
AD.VisitCode,
BVD.CreatedDate,
BVD.VisitNo,
AD.PrescriptionID,
AD.HighRiskStatus,
AD.HighRiskCondition,
AD.ComplicationOfCurrentPregnancy,
AD.OtherCompCurPreg,
CASE
    WHEN AD.ComplicationOfCurrentPregnancy = 'None' or AD.ComplicationOfCurrentPregnancy is null THEN False
    ELSE True
END as IsHighRisk,
AD.IsMaternalDeath,
AD.PlaceOfDeath,
AD.DateOfDeath,
AD.CauseOfDeath,
AD.Deleted,
AD.Processed,
AD.CreatedBy,
AD.CreatedDate,
AD.ModifiedBy,
AD.LastModDate,
AD.VanSerialNo,
AD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
AD.SyncedBy,
AD.SyncedDate,
  Replace(DATE(AD.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_ANCDiagnosis',
  NOW()
 FROM db_iemr.t_ancdiagnosis AD
        left join db_iemr.m_van VAN on AD.VanID = VAN.VanID 
        inner join db_iemr.t_benvisitdetail BVD on AD.VisitCode = BVD.VisitCode 
			and AD.BeneficiaryRegID = BVD.BeneficiaryRegID
 WHERE DATE(AD.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(AD.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ANCDiagnosis','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_BenCall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `SP_Load_Fact_BenCall`()
BEGIN


insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenCall','started',now());



  INSERT INTO db_reporting.fact_bencall

(BenCallID,
BeneficiaryRegID,
CallID,
SessionID,
PhoneNo,
ProviderServiceMapID,
CallTypeID,
CallTypeName,
CallSubTypeName,
is1097,
CallTime,
Remarks,
ServicesProvided,
CallClosureType,
DispositionStatusID,
DispositionStatusName,
CallReceivedUserID,
ReceivedRoleName,
ReceivedAgentID,
CallEndUserID,
CallEndTime,
CallDuration,
Category,
SubCategory,
CDICallStatus,
IsOutbound,
IsCalledEarlier,
RecordingFilePath,
ArchiveFilePath,
OBCallID,
ChangeLog,
IsMother,
SMS_Advice,
SMS_Ph,
IsVerified,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate
,CZcallStartTime,
  CZcallEndTime,CZcallDuration,
  isCallAnswered,isCallDisconnected,isFurtherCallRequired,
  TypeOfComplaint,complaintRemarks,reasonForNoFurtherCalls,reasonForCallNotAnswered,
  isCallAudited
  ,isWrongNumber 
  )

SELECT
  TB.BenCallID,
  TB.BeneficiaryRegID,
  TB.CallID,
  TB.SessionID,
  TB.PhoneNo,
  TB.CalledServiceID,
  TB.CallTypeID,
  MC.callgroupType,
  MC.callType,
  TB.is1097,
  TB.CallTime,
  TB.Remarks,
 TB.ServicesProvided,
  TB.CallClosureType,
 MD.DispositionStatusID,
 MD.DispositionStatus,
 TB.CallReceivedUserID,
 TB.ReceivedRoleName,
  TB.ReceivedAgentID,
  TB.CallEndUserID,
  TB.CallEndTime,
  TB.CallDuration,
  TB.Category,
  TB.SubCategory,
  TB.CDICallStatus,
  TB.IsOutbound,
  TB.IsCalledEarlier,
  TB.RecordingFilePath,
TB.ArchiveFilePath,
TB.OBCallID,
TB.ChangeLog,
TB.IsMother,
TB.SMS_Advice,
TB.SMS_Ph,
TB.IsVerified,
  TB.CreatedBy,
  TB.CreatedDate,
  TB.ModifiedBy,
  TB.LastModDate,
  Replace(DATE(TB.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_BenCall',
  NOW(),TB.CZcallStartTime,
  TB.CZcallEndTime,TB.CZcallDuration,
  TB.isCallAnswered,TB.isCallDisconnected,TB.isFurtherCallRequired,
  TB.TypeOfComplaint,TB.complaintRemarks,TB.reasonForNoFurtherCalls,
  TB.reasonForCallNotAnswered,
  TB.isCallAudited,
   TB.isWrongNumber
 FROM db_iemr.t_bencall TB
 LEFT JOIN db_iemr.m_calltype MC ON MC.CallTypeID =  TB.CallTypeID
 LEFT JOIN db_iemr.m_dispositionstatus MD ON MD.DispositionStatusID= TB.DispositionStatusID
 WHERE DATE(TB.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenCall','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_BenChiefComplaint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_BenChiefComplaint`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_BenChiefComplaint
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           20-02-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load Fact_BenChiefComplaint(db_reporting)
                                                 from  t_BenChiefComplaint  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenChiefComplaint','started',now());



  INSERT INTO db_reporting.Fact_BenChiefComplaint

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
ServiceID,
VisitCode,
ChiefComplaintID,
ChiefComplaint,
SCTDesID,
SCTCode,
SCTChiefComplaint,
Duration,
UnitOfDuration,
Description,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

select 
BCC.ID, 
BCC.BeneficiaryRegID, 
BCC.BenVisitID, 
BCC.ProviderServiceMapID,
PSM.ServiceID,  
BCC.VisitCode, 
BCC.ChiefComplaintID, 
BCC.ChiefComplaint, 
BCC.SCTDesID, 
BCC.SCTCode, 
BCC.SCTChiefComplaint, 
BCC.Duration, 
BCC.UnitOfDuration, 
BCC.Description, 
BCC.Deleted, 
BCC.Processed, 
BCC.CreatedBy, 
BCC.CreatedDate, 
BCC.ModifiedBy, 
BCC.LastModDate, 
BCC.VanSerialNo, 
BCC.VanID, 
V.VanName,  
V.VehicalNo, 
V.ParkingPlaceID, 
BCC.SyncedBy, 
BCC.SyncedDate,
Replace(DATE(BCC.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_BenChiefComplaint',
NOW()
from db_iemr.t_BenChiefComplaint BCC
inner join db_iemr.m_Van V on BCC.VanID = V.VanID
inner join db_iemr.m_providerservicemapping PSM on BCC.ProviderServiceMapID = PSM.ProviderServiceMapID
 WHERE DATE(BCC.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(BCC.CreatedDate)<CURDATE();

update db_reporting.Fact_BenChiefComplaint FBCC
inner join db_iemr.t_BenChiefComplaint BCC on FBCC.ID = BCC.ID
set 
FBCC.ChiefComplaintID = BCC.ChiefComplaintID,
FBCC.ChiefComplaint = BCC.ChiefComplaint,
FBCC.SCTDesID = BCC.SCTDesID,
FBCC.SCTCode = BCC.SCTCode,
FBCC.SCTChiefComplaint = BCC.SCTChiefComplaint,
FBCC.Duration = BCC.Duration,
FBCC.UnitOfDuration = BCC.UnitOfDuration,
FBCC.Description = BCC.Description,
FBCC.ModifiedBy = BCC.ModifiedBy,
FBCC.LastModDate = BCC.LastModDate,
FBCC.LodadedDate = now()
where 
FBCC.LodadedDate < BCC.LastModDate ;


 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenChiefComplaint','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_BenDisease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_BenDisease`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_BenDisease
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           25-04-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_bendisease(db_reporting)
                                                 from  db_iemr (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenDisease','started',now());



  INSERT INTO db_reporting.fact_bendisease

(BeneficiaryRegID,
VisitCode,
ProviderServiceMapID,
VisitDate,
VisitCategory,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
Disease,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

select 
Rx.BeneficiaryRegID,
Rx.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
Rx.DiagnosisProvided,
Rx.Deleted,
Rx.Processed,
Rx.CreatedBy,
Rx.CreatedDate,
Rx.ModifiedBy,
Rx.LastModDate,
Rx.SyncedBy,
Rx.SyncedDate,
Replace(DATE(Rx.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_BenDisease',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
	on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
		and BVD.VisitCode = Rx.VisitCode
		and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(Rx.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(Rx.CreatedDate)<CURDATE()


union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
PNCD.ProvisionalDiagnosis,
PNCD.Deleted,
PNCD.Processed,
PNCD.CreatedBy,
PNCD.CreatedDate,
PNCD.ModifiedBy,
PNCD.LastModDate,
PNCD.SyncedBy,
PNCD.SyncedDate,
Replace(DATE(PNCD.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_BenDisease',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
	on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
		and BVD.VisitCode = PNCD.VisitCode
		and (BVD.VisitCategory = 'PNC')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(PNCD.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(PNCD.CreatedDate)<CURDATE();

union

select 
ANCD.BeneficiaryRegID,
ANCD.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
ANCD.ComplicationOfCurrentPregnancy,
ANCD.Deleted,
ANCD.Processed,
ANCD.CreatedBy,
ANCD.CreatedDate,
ANCD.ModifiedBy,
ANCD.LastModDate,
ANCD.SyncedBy,
ANCD.SyncedDate,
Replace(DATE(ANCD.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
	on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
		and BVD.VisitCode = ANCD.VisitCode
		and (BVD.VisitCategory = 'ANC')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(ANCD.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(ANCD.CreatedDate)<CURDATE();

union

select 
NCDS.BeneficiaryRegID,
NCDS.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
NCDS.ScreeningCondition,
NCDS.Deleted,
NCDS.Processed,
NCDS.CreatedBy,
NCDS.CreatedDate,
NCDS.ModifiedBy,
NCDS.LastModDate,
NCDS.SyncedBy,
NCDS.SyncedDate,
Replace(DATE(NCDS.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
	on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
		and BVD.VisitCode = NCDS.VisitCode
		and (BVD.VisitCategory = 'NCD screening')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(NCDS.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(NCDS.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenDisease','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_BenReferDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_BenReferDetails`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_BenReferDetails
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           29-03-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load Fact_BenReferDetails(db_reporting)
                                                 from  t_BenReferDetails (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenReferDetails','started',now());



  INSERT INTO db_reporting.Fact_BenReferDetails

(BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
referredToInstituteID,
referredToInstituteName,
serviceName,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanID,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
BRD.BeneficiaryRegID,
BRD.BenVisitID,
BRD.ProviderServiceMapID,
BRD.VisitCode,
BRD.referredToInstituteID,
BRD.referredToInstituteName,
GROUP_CONCAT(BRD.serviceName SEPARATOR ',') as ServiceName,
BRD.Deleted,
BRD.Processed,
BRD.CreatedBy,
BRD.CreatedDate,
BRD.ModifiedBy,
BRD.LastModDate,
BRD.VanSerialNo,
BRD.VanID,
BRD.ParkingPlaceID,
BRD.SyncedBy,
BRD.SyncedDate,
Replace(DATE(BRD.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_BenReferDetails',
NOW()
FROM db_iemr.t_benreferdetails BRD
where DATE(BRD.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(BRD.CreatedDate)<CURDATE()
group by  BRD.VisitCode;


 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenReferDetails','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_BenVisitDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_BenVisitDetail`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_BenVisitDetail
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_BenvisitDetail(db_reporting)
                                                 from  t_benvisitdetail  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenVisitDetail','started',now());



  INSERT INTO db_reporting.fact_benvisitdetail

(BenVisitID,
BeneficiaryRegID,
ProviderServiceMapID,
VisitCode,
VisitDateTime,
VisitNo,
VisitReasonID,
VisitReason,
VisitCategoryID,
VisitCategory,
PregnancyStatus,
RCHID,
HealthFacilityType,
HealthFacilityLocation,
ReportFilePath,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
VisitFlowStatusFlag,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
 BVD.BenVisitID,
BVD.BeneficiaryRegID,
BVD.ProviderServiceMapID,
BVD.VisitCode,
BVD.VisitDateTime,
BVD.VisitNo,
BVD.VisitReasonID,
BVD.VisitReason,
BVD.VisitCategoryID,
BVD.VisitCategory,
BVD.PregnancyStatus,
BVD.RCHID,
BVD.HealthFacilityType,
BVD.HealthFacilityLocation,
BVD.ReportFilePath,
BVD.Deleted,
BVD.Processed,
BVD.CreatedBy,
BVD.CreatedDate,
BVD.ModifiedBy,
BVD.LastModDate,
BVD.VanSerialNo,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
BVD.SyncedBy,
BVD.SyncedDate,
BVD.VisitFlowStatusFlag,
  Replace(DATE(BVD.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_BenVisitDetail',
  NOW()
 FROM db_iemr.t_benvisitdetail BVD
 left Join db_iemr.m_Van VAN on BVD.VanID = VAN.VanID 
 WHERE DATE(BVD.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(BVD.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BenVisitDetail','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_BloodRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_BloodRequest`()
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_BloodRequest
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           13-12-2017
--    Reviewed By                   :
--    Reviewed Date                 :           29-09-2018
--    Purpose                       :           TO Load reporting.Fact_Bloodrequest
                                                from  t_Bloodrequest (db_iemr ).


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BloodRequest','started',now());


INSERT INTO  db_reporting.Fact_Bloodrequest(
        BloodReqID,
        RequestID,
        BeneficiaryRegID,
        BenCallID,
        RecipientBeneficiaryID,
        RecipientName,
        RecipientAge,
        RecipientGenderID,
        RecipientGenderName,
        TypeOfRequest,
        BloodGroupID,
        BloodGroupName,
        ComponentTypeID,
        ComponentTypeName,
        ComponentID,
        ComponentName,
        UnitRequired,
        HospitalAdmitted,
        DistrictID,
        DistrictName,
        OutboundNeeded,
        OutboundDate,
        BloodBankAddress,
        BBPersonName,
        BBMobileNo,
        BBPersonDesignation,
        Remarks,
        Feedback,
        IsSelf,
        ProviderServiceMapID,
        CreatedBy,
        CreatedDate,
        ModifiedBy,
        LastModDate,
        fact_CreatedDate,
        LoadedBy,
        LodadedDate)

SELECT
   BloodReqID,
   RequestID,
   BeneficiaryRegID,
   TBR.BenCallID,
   RecipientBeneficiaryID,
   RecipientName,
   RecipientAge,
   MG.GenderID,
   MG.GenderName,
   TypeOfRequest,
   MB.BloodGroupID,
   MB.BloodGroup,
   MCT.ComponentTypeID,
   MCT.ComponentType,
   MC.ComponentID,
   MC.Component,
   UnitRequired,
   HospitalAdmitted,
   MD.DistrictID,
   MD.DistrictName,
   OutboundNeeded,
   OutboundDate,
   BloodBankAddress,
   BBPersonName,
   BBMobileNo,
   BBPersonDesignation,
   Remarks,
   Feedback,
   IsSelf,
   MPSM.ProviderServiceMapID,
   TBR.CreatedBy,
   TBR.CreatedDate,
   TBR.ModifiedBy,
   TBR.LastModDate,
   REPLACE(DATE(TBR.CreatedDate), '-', '') AS fact_CreatedDate,
   'SP_Load_Fact_BloodRequest',
   NOW()
   FROM db_iemr.t_Bloodrequest TBR
   LEFT JOIN db_iemr.m_bloodgroup MB ON MB.BloodGroupID = TBR.BloodGroupID
   LEFT JOIN db_iemr.m_component MC ON MC.ComponentID = TBR.ComponentID
   LEFT JOIN db_iemr.m_componenttype MCT ON MCT.ComponentTypeID = TBR.ComponentTypeID
   LEFT JOIN db_iemr.m_gender MG ON MG.GenderID = TBR.RecipientGenderID
   LEFT JOIN db_iemr.m_providerservicemapping MPSM ON MPSM.ProviderServiceMapID = TBR.ProviderServiceMapID
   LEFT JOIN db_iemr.m_district MD on MD.DistrictID = TBR.DistrictID
   WHERE DATE(TBR.CreatedDate)=CURDATE() - INTERVAL 1 DAY ;
-- WHERE DATE(TBR.CreatedDate)<CURDATE() ;

-- UPDATE

	update db_reporting.Fact_Bloodrequest FBR
   Left JOIN db_iemr.t_Bloodrequest TBR on FBR.BloodReqID  =  TBR.BloodReqID
   LEFT JOIN db_iemr.m_bloodgroup MB ON MB.BloodGroupID  =  TBR.BloodGroupID
   LEFT JOIN db_iemr.m_component MC ON MC.ComponentID  =  TBR.ComponentID
   LEFT JOIN db_iemr.m_componenttype MCT ON MCT.ComponentTypeID  =  TBR.ComponentTypeID
   LEFT JOIN db_iemr.m_gender MG ON MG.GenderID  =  TBR.RecipientGenderID
   LEFT JOIN db_iemr.m_providerservicemapping MPSM ON MPSM.ProviderServiceMapID  =  TBR.ProviderServiceMapID
   LEFT JOIN db_iemr.m_district MD on MD.DistrictID  =  TBR.DistrictID
   set 
   
FBR.BloodReqID = TBR.BloodReqID,
FBR.RequestID =    TBR.RequestID,
FBR.BeneficiaryRegID =    TBR.BeneficiaryRegID,
FBR.BenCallID =    TBR.BenCallID,
FBR.RecipientBeneficiaryID =    TBR.RecipientBeneficiaryID,
FBR.RecipientName =    TBR.RecipientName,
FBR.RecipientAge =    TBR.RecipientAge,
FBR.RecipientGenderID =    MG.GenderID,
FBR.RecipientGenderName =    MG.GenderName,
FBR.TypeOfRequest =    TBR.TypeOfRequest,
FBR.BloodGroupID =    MB.BloodGroupID,
FBR.BloodGroupName =    MB.BloodGroup,
FBR.ComponentTypeID =    MCT.ComponentTypeID,
FBR.ComponentTypeName =    MCT.ComponentType,
FBR.ComponentID =    MC.ComponentID,
FBR.ComponentName =    MC.Component,
FBR.UnitRequired =    TBR.UnitRequired,
FBR.HospitalAdmitted =    TBR.HospitalAdmitted,
FBR.DistrictID =    MD.DistrictID,
FBR.DistrictName =    MD.DistrictName,
FBR.OutboundNeeded = TBR.OutboundNeeded,
FBR.OutboundDate = TBR.OutboundDate,
FBR.BloodBankAddress = TBR.BloodBankAddress,
FBR.BBPersonName = TBR.BBPersonName,
FBR.BBMobileNo = TBR.BBMobileNo,
FBR.BBPersonDesignation = TBR.BBPersonDesignation,
FBR.Remarks = TBR.Remarks,
FBR.Feedback = TBR.Feedback,
FBR.IsSelf = TBR.IsSelf,
FBR.ProviderServiceMapID =    MPSM.ProviderServiceMapID,
FBR.CreatedBy =    TBR.CreatedBy,
FBR.CreatedDate =    TBR.CreatedDate,
FBR.ModifiedBy =    TBR.ModifiedBy,
FBR.LodadedDate =    TBR.LastModDate,
FBR.LastModDate =    NOW()


where 

TBR.LastModDate > FBR.LodadedDate ;


insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_BloodRequest','completed',now());


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ChildCongenitalAnomalies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_ChildCongenitalAnomalies`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_OrganDonation
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           06-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load ChildCongenitalAnomalies from db_iemr database to db_reporing databse.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ChildCongenitalAnomalies','started',now());


INSERT INTO  db_reporting.Fact_ChildCongenitalAnomalies
(
ChildCongenitalAnomaliesID,
BeneficiaryRegID,
MotherID,
ChildID,
ProviderServiceMapID,
BenCallID,
CongenitalAnomalies,
CauseOfDefect,
Remarks,
Deleted,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ID,
BeneficiaryRegID,
MotherID,
ChildID,
ProviderServiceMapID,
-- CallDetailID,
BenCallID,
CongenitalAnomalies,
CauseOfDefect,
Remarks,
Deleted,
-- Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
Replace(DATE(CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_ChildCongenitalAnomalies',
NOW()
FROM   db_iemr.t_ChildCongenitalAnomalies
 WHERE   DATE(CreatedDate)= (CURDATE() - INTERVAL 1 DAY) ;
-- WHERE   DATE(CreatedDate)< CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ChildCongenitalAnomalies','completed',now());


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ChildInValidRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_ChildInValidRecord`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_OrganDonation
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           06-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :
                                                 Load Fact_ChildInValidRecord(db_reporing)
                                                 from   t_ChildInValidRecord(db_iemr)


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ChildInValidRecord','started',now());



INSERT INTO db_reporting.Fact_ChildInValidRecord
(
RowID,
Date_of_Entry,
Entry_type,
MCTSID_no_Child_ID,
Child_Name,
Father_Name,
Mother_Name,
Mother_ID,
DOB,
Place_of_Birth,
Gender,
Caste,
BloodGroup,
Child_Aadhaar_No,
Weight_of_Child,
Child_EID,
Child_EID_Time,
Emamta_Health_ID,
Emamta_Family_ID,
Phone_No_of,
Phone_No,
Registration_Date,
Updated_Date,
CityID,
City,
State_ID,
State_Name,
District_ID,
District_Name,
Taluka_Name,
Taluka_ID,
Block_ID,
Block_Name,
PHC_ID,
PHC_Name,
SubCenter_ID,
SubCenter_Name,
SubCenter_Name1,
Village_ID,
Village_Name,
GP_Village,
Address,
Year,
ANM_ID,
ANM_Name,
ANM_Phone_No,
ASHA_ID,
ASHA_Name,
ASHA_Phone_No,
BCG_Date,
OPV0_Date,
Hepatitis_B1_Date,
DPT1_Date,
OPV1_Date,
Hepatitis_B2_Date,
DPT2_Date,
OPV2_Date,
Hepatitis_B3_Date,
DPT3_Date,
OPV3_Date,
Hepatitis_B4_Date,
Measles_Date,
VitA_Dose1_Date,
MR_Date,
DPTBooster_Date,
OPVBooster_Date,
VitA_Dose2_Date,
VitA_Dose3_Date,
VitA_Dose99_Date,
VitA_Dose5_Date,
VitA_Dose6_Date,
VitA_Dose7_Date,
VitA_Dose8_Date,
VitA_Dose9_Date,
JE_Date,
DT5_Date,
TT10_Date,
TT16_Date,
Measles_2_Date,
PentaValent1_Date,
PentaValent2_Date,
PentaValent3_Date,
is_Upload,
Status,
Remarks,
Delete_Mother,
Delete_Reason,
Deleted_ON,
SMS_Status,
Created_By,
Updated_By,
MDDS_StateID,
MDDS_District_ID,
MDDS_Taluka_ID,
MDDS_Village_ID,
BirthCertificateNo,
Rural_urban,
SNO,
Lead_ID,
My_ID,
CID_NO,
MID_NO,
Duplicate_Bit,
FacilityType,
DueServices,
OverDueServices,
GivenServices,
Source,
ProviderServiceMapID,
Is_Valid,
Is_Error,
Error_Reason,
FileID,
IsAllocated,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
TC.RowID,
TC.Date_of_Entry,
TC.Entry_type,
TC.MCTSID_no_Child_ID,
TC.Child_Name,
TC.Father_Name,
TC.Mother_Name,
TC.Mother_ID,
TC.DOB,
TC.Place_of_Birth,
TC.Gender,
TC.Caste,
TC.BloodGroup,
TC.Child_Aadhaar_No,
TC.Weight_of_Child,
TC.Child_EID,
TC.Child_EID_Time,
TC.Emamta_Health_ID,
TC.Emamta_Family_ID,
TC.Phone_No_of,
TC.Phone_No,
TC.Registration_Date,
TC.Updated_Date,
TC.CityID,
TC.City,
TC.State_ID,
TC.State_Name,
TC.District_ID,
TC.District_Name,
TC.Taluka_Name,
TC.Taluka_ID,
TC.Block_ID,
TC.Block_Name,
TC.PHC_ID,
TC.PHC_Name,
TC.SubCenter_ID,
TC.SubCenter_Name,
TC.SubCenter_Name1,
TC.Village_ID,
TC.Village_Name,
TC.GP_Village,
TC.Address,
TC.Year,
TC.ANM_ID,
TC.ANM_Name,
TC.ANM_Phone_No,
TC.ASHA_ID,
TC.ASHA_Name,
TC.ASHA_Phone_No,
TC.BCG_Date,
TC.OPV0_Date,
TC.Hepatitis_B1_Date,
TC.DPT1_Date,
TC.OPV1_Date,
TC.Hepatitis_B2_Date,
TC.DPT2_Date,
TC.OPV2_Date,
TC.Hepatitis_B3_Date,
TC.DPT3_Date,
TC.OPV3_Date,
TC.Hepatitis_B4_Date,
TC.Measles_Date,
TC.VitA_Dose1_Date,
TC.MR_Date,
TC.DPTBooster_Date,
TC.OPVBooster_Date,
TC.VitA_Dose2_Date,
TC.VitA_Dose3_Date,
TC.VitA_Dose99_Date,
TC.VitA_Dose5_Date,
TC.VitA_Dose6_Date,
TC.VitA_Dose7_Date,
TC.VitA_Dose8_Date,
TC.VitA_Dose9_Date,
TC.JE_Date,
TC.DT5_Date,
TC.TT10_Date,
TC.TT16_Date,
TC.Measles_2_Date,
TC.PentaValent1_Date,
TC.PentaValent2_Date,
TC.PentaValent3_Date,
TC.is_Upload,
TC.Status,
TC.Remarks,
TC.Delete_Mother,
TC.Delete_Reason,
TC.Deleted_ON,
TC.SMS_Status,
TC.Created_By,
TC.Updated_By,
TC.MDDS_StateID,
TC.MDDS_District_ID,
TC.MDDS_Taluka_ID,
TC.MDDS_Village_ID,
TC.BirthCertificateNo,
TC.Rural_urban,
TC.SNO,
TC.Lead_ID,
TC.My_ID,
TC.CID_NO,
TC.MID_NO,
TC.Duplicate_Bit,
TC.FacilityType,
TC.DueServices,
TC.OverDueServices,
TC.GivenServices,
TC.Source,
TK.ProviderServiceMapID,
TC.Is_Valid,
TC.Is_Error,
TC.Error_Reason,
TC.FileID,
TC.IsAllocated,
TC.Deleted,
TC.Processed,
TC.CreatedBy,
TC.CreatedDate,
TC.ModifiedBy,
TC.LastModDate,
Replace(DATE(TC.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_ChildInValidRecord',
NOW()
FROM  db_iemr.t_ChildInValiddata TC
LEFT JOIN `db_iemr`.`t_filemanager` TK ON TC.FileID = TK.FileID
WHERE   DATE(TC.CreatedDate)= (CURDATE() - INTERVAL 1 DAY);
-- WHERE   DATE(TC.CreatedDate)< CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ChildInValidRecord','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ChildValidRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `SP_Load_Fact_ChildValidRecord`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_ChildValidRecord
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           28-05-2017
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Child Validrecord from  Fact_ChildValidRecord(db_iemr)
                                                    to Fact_ChildValidRecord(db_reporing ).


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ChildValidRecord','started',now());


INSERT INTO db_reporting.Fact_ChildValidRecord(
RowID,
BeneficiaryRegID,
Date_of_Entry,
Entry_type,
MCTSID_no_Child_ID,
Child_Name,
Father_Name,
Mother_Name,
Mother_ID,
DOB,
Place_of_Birth,
Gender,
Caste,
BloodGroup,
Child_Aadhaar_No,
Weight_of_Child,
Child_EID,
Child_EID_Time,
Emamta_Health_ID,
Emamta_Family_ID,
Phone_No_of,
Phone_No,
Registration_Date,
Updated_Date,
CityID,
City,
State_ID,
State_Name,
District_ID,
District_Name,
Taluka_Name,
Taluka_ID,
Block_ID,
Block_Name,
PHC_ID,
PHC_Name,
SubCenter_ID,
SubCenter_Name,
SubCenter_Name1,
Village_ID,
Village_Name,
GP_Village,
Address,
Year,
ANM_ID,
ANM_Name,
ANM_Phone_No,
ASHA_ID,
ASHA_Name,
ASHA_Phone_No,
BCG_Date,
OPV0_Date,
Hepatitis_B1_Date,
DPT1_Date,
OPV1_Date,
Hepatitis_B2_Date,
DPT2_Date,
OPV2_Date,
Hepatitis_B3_Date,
DPT3_Date,
OPV3_Date,
Hepatitis_B4_Date,
Measles_Date,
VitA_Dose1_Date,
MR_Date,
DPTBooster_Date,
OPVBooster_Date,
VitA_Dose2_Date,
VitA_Dose3_Date,
VitA_Dose99_Date,
VitA_Dose5_Date,
VitA_Dose6_Date,
VitA_Dose7_Date,
VitA_Dose8_Date,
VitA_Dose9_Date,
JE_Date,
DT5_Date,
TT10_Date,
TT16_Date,
Measles_2_Date,
PentaValent1_Date,
PentaValent2_Date,
PentaValent3_Date,
is_Upload,
Status,
Remarks,
Delete_Mother,
Delete_Reason,
Deleted_ON,
SMS_Status,
Created_By,
Updated_By,
MDDS_StateID,
MDDS_District_ID,
MDDS_Taluka_ID,
MDDS_Village_ID,
BirthCertificateNo,
Rural_urban,
SNO,
Lead_ID,
My_ID,
CID_NO,
MID_NO,
Duplicate_Bit,
FacilityType,
DueServices,
OverDueServices,
GivenServices,
Source,
ProviderServiceMapID,
Is_Valid,
Is_Error,
Error_Reason,
FileID,
IsAllocated,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate,
Child_RCH_ID_No,Mother_RCH_ID_No,HepatitisB0_Dt,
IsHrni,Hrni_Reason,entrytype
)

SELECT
TC.RowID,
TC.BeneficiaryRegID,
TC.Date_of_Entry,
TC.Entry_type,
TC.MCTSID_no_Child_ID,
TC.Child_Name,
TC.Father_Name,
TC.Mother_Name,
TC.Mother_ID,
TC.DOB,
TC.Place_of_Birth,
TC.Gender,
TC.Caste,
TC.BloodGroup,
TC.Child_Aadhaar_No,
TC.Weight_of_Child,
TC.Child_EID,
TC.Child_EID_Time,
TC.Emamta_Health_ID,
TC.Emamta_Family_ID,
TC.Phone_No_of,
TC.Phone_No,
TC.Registration_Date,
TC.Updated_Date,
TC.CityID,
TC.City,
TC.State_ID,
TC.State_Name,
TC.District_ID,
TC.District_Name,
TC.Taluka_Name,
TC.Taluka_ID,
TC.Block_ID,
TC.Block_Name,
TC.PHC_ID,
TC.PHC_Name,
TC.SubCenter_ID,
TC.SubCenter_Name,
TC.SubCenter_Name1,
TC.Village_ID,
TC.Village_Name,
TC.GP_Village,
TC.Address,
TC.Year,
TC.ANM_ID,
TC.ANM_Name,
TC.ANM_Phone_No,
TC.ASHA_ID,
TC.ASHA_Name,
TC.ASHA_Phone_No,
TC.BCG_Date,
TC.OPV0_Date,
TC.Hepatitis_B1_Date,
TC.DPT1_Date,
TC.OPV1_Date,
TC.Hepatitis_B2_Date,
TC.DPT2_Date,
TC.OPV2_Date,
TC.Hepatitis_B3_Date,
TC.DPT3_Date,
TC.OPV3_Date,
TC.Hepatitis_B4_Date,
TC.Measles_Date,
TC.VitA_Dose1_Date,
TC.MR_Date,
TC.DPTBooster_Date,
TC.OPVBooster_Date,
TC.VitA_Dose2_Date,
TC.VitA_Dose3_Date,
TC.VitA_Dose99_Date,
TC.VitA_Dose5_Date,
TC.VitA_Dose6_Date,
TC.VitA_Dose7_Date,
TC.VitA_Dose8_Date,
TC.VitA_Dose9_Date,
TC.JE_Date,
TC.DT5_Date,
TC.TT10_Date,
TC.TT16_Date,
TC.Measles_2_Date,
TC.PentaValent1_Date,
TC.PentaValent2_Date,
TC.PentaValent3_Date,
TC.is_Upload,
TC.Status,
TC.Remarks,
TC.Delete_Mother,
TC.Delete_Reason,
TC.Deleted_ON,
TC.SMS_Status,
TC.Created_By,
TC.Updated_By,
TC.MDDS_StateID,
TC.MDDS_District_ID,
TC.MDDS_Taluka_ID,
TC.MDDS_Village_ID,
TC.BirthCertificateNo,
TC.Rural_urban,
TC.SNO,
TC.Lead_ID,
TC.My_ID,
TC.CID_NO,
TC.MID_NO,
TC.Duplicate_Bit,
TC.FacilityType,
TC.DueServices,
TC.OverDueServices,
TC.GivenServices,
TC.Source,
TF.ProviderServiceMapID,
TC.Is_Valid,
TC.Is_Error,
TC.Error_Reason,
TC.FileID,
TC.IsAllocated,
TC.Deleted,
TC.Processed,
TC.CreatedBy,
TC.CreatedDate,
TC.ModifiedBy,
TC.LastModDate,
Replace(DATE(TC.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_ChildValidRecord',
NOW(),
TC.Child_RCH_ID_No,TC.Mother_RCH_ID_No,TC.HepatitisB0_Dt,
TC.IsHrni,TC.Hrni_Reason,TC.entrytype
 FROM db_iemr.t_childvaliddata TC
LEFT JOIN db_iemr.t_filemanager TF ON TC.FileID = TF.FileID
WHERE DATE(TC.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(TC.CreatedDate)<CURDATE();

update db_reporting.Fact_ChildValidRecord
set IsSelfNo = 0b1 
where Phone_No_of = 'self' and DATE(CreatedDate)=CURDATE() - INTERVAL 1 DAY;

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ChildValidRecord','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_DiaHyperCase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_DiaHyperCase`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_DiaHyperCase
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           25-04-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_diahypercase(db_reporting)
                                                 from  db_iemr (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_DiaHyperCase','started',now());



  INSERT INTO db_reporting.fact_diahypercase

(BeneficiaryRegID,
VisitCode,
ProviderServiceMapID,
VisitDate,
VisitCategory,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
IsDiabetesMellitus,
IsHypertension,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

select 
CC.BeneficiaryRegID,
CC.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
CASE
    WHEN CC.ComorbidCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN CC.ComorbidCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension,
CC.Deleted,
CC.Processed,
CC.CreatedBy,
CC.CreatedDate,
CC.ModifiedBy,
CC.LastModDate,
CC.SyncedBy,
CC.SyncedDate,
Replace(DATE(CC.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
  from
(SELECT 
 BCC.BeneficiaryRegID,
 BCC.VisitCode,
 group_concat(BCC.ComorbidCondition) as ComorbidCondition,
 BCC.Deleted,
 BCC.Processed,
 BCC.CreatedBy,
 BCC.CreatedDate,
 BCC.ModifiedBy,
 BCC.LastModDate,
 BCC.SyncedBy,
 BCC.SyncedDate
FROM db_iemr.t_bencomorbiditycondition BCC
group by BeneficiaryRegID, VisitCode) CC 
inner join db_iemr.t_benvisitdetail BVD 
	on BVD.BeneficiaryRegID = CC.BeneficiaryRegID
		and BVD.VisitCode = CC.VisitCode
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(CC.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(CC.CreatedDate)<CURDATE();

union

select 
Rx.BeneficiaryRegID,
Rx.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
CASE
    WHEN Rx.DiagnosisProvided like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN Rx.DiagnosisProvided like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension,
Rx.Deleted,
Rx.Processed,
Rx.CreatedBy,
Rx.CreatedDate,
Rx.ModifiedBy,
Rx.LastModDate,
Rx.SyncedBy,
Rx.SyncedDate,
Replace(DATE(Rx.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_prescription Rx 
	on BVD.BeneficiaryRegID = Rx.BeneficiaryRegID
		and BVD.VisitCode = Rx.VisitCode
		and (BVD.VisitCategory = 'General OPD' or BVD.VisitCategory = 'General OPD (QC)')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(Rx.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(Rx.CreatedDate)<CURDATE();
	

union

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
CASE
    WHEN PNCD.ProvisionalDiagnosis like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN PNCD.ProvisionalDiagnosis like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension,
PNCD.Deleted,
PNCD.Processed,
PNCD.CreatedBy,
PNCD.CreatedDate,
PNCD.ModifiedBy,
PNCD.LastModDate,
PNCD.SyncedBy,
PNCD.SyncedDate,
Replace(DATE(PNCD.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_pncdiagnosis PNCD
	on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
		and BVD.VisitCode = PNCD.VisitCode
		and (BVD.VisitCategory = 'PNC')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(PNCD.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(PNCD.CreatedDate)<CURDATE();

union

select 
ANCD.BeneficiaryRegID,
ANCD.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN ANCD.ComplicationOfCurrentPregnancy like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension,
ANCD.Deleted,
ANCD.Processed,
ANCD.CreatedBy,
ANCD.CreatedDate,
ANCD.ModifiedBy,
ANCD.LastModDate,
ANCD.SyncedBy,
ANCD.SyncedDate,
Replace(DATE(ANCD.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ancdiagnosis ANCD
	on BVD.BeneficiaryRegID = ANCD.BeneficiaryRegID
		and BVD.VisitCode = ANCD.VisitCode
		and (BVD.VisitCategory = 'ANC')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(ANCD.CreatedDate)=CURDATE() - INTERVAL 1 DAY
-- WHERE DATE(ANCD.CreatedDate)<CURDATE();

union

select 
NCDS.BeneficiaryRegID,
NCDS.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
CASE
    WHEN NCDS.ScreeningCondition like '%Diabetes Mellitus%' THEN True
    ELSE False
END as IsDiabetesMellitus,
CASE
    WHEN NCDS.ScreeningCondition like '%Hypertension%' THEN True
    ELSE False
END as IsHypertension,
NCDS.Deleted,
NCDS.Processed,
NCDS.CreatedBy,
NCDS.CreatedDate,
NCDS.ModifiedBy,
NCDS.LastModDate,
NCDS.SyncedBy,
NCDS.SyncedDate,
Replace(DATE(NCDS.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_DiaHyperCase',
NOW()
 from db_iemr.t_benvisitdetail BVD
inner join db_iemr.t_ncdscreening NCDS
	on BVD.BeneficiaryRegID = NCDS.BeneficiaryRegID
		and BVD.VisitCode = NCDS.VisitCode
		and (BVD.VisitCategory = 'NCD screening')
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(NCDS.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(NCDS.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_DiaHyperCase','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_DirectoryService` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_DirectoryService`()
BEGIN

 /********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_DirectoryService
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra Mohapatra
--    Created Date                  :           11-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load Fact_DirectoryService(reporting)
                                                from db_iemr t_DirectoryService


												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_DirectoryService','started',now());


INSERT INTO db_reporting.Fact_DirectoryService(
DirectoryServiceID,
RequestID,
BeneficiaryRegID,
BenCallID,
InstituteDirectoryID,
InstituteDirectoryName,
InstituteSubDirectoryID,
InstituteSubDirectoryName,
InstitutionID,
AcceptorHospitalName,
AcceptorHospitalState,
AcceptorHospitalDistrict,
AcceptorHospitalSubDistrict,
AcceptorHospitalVillage,
Remarks,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate
)

SELECT
TDS.DirectoryServiceID,
TDS.RequestID,
TDS.BeneficiaryRegID,
TB.BenCallID,
MI.InstituteDirectoryID,
MI.InstituteDirectoryName,
MIS.InstituteSubDirectoryID,
MIS.InstituteSubDirectoryName,
MIT.InstitutionID,
MIT.InstitutionName,
MS.stateName,
MD.districtID,
MB.GovSubDistrictID,
TDS.Remarks,
'',
TDS.ProviderServiceMapID,
TDS.CreatedBy,
TDS.CreatedDate,
TDS.ModifiedBy,
TDS.LastModDate,
Replace(DATE(TDS.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_DirectoryService',
NOW()
  FROM   db_iemr.t_DirectoryService TDS
LEFT JOIN db_iemr.t_bencall TB ON TB.BenCallID = TDS.BenCallID
LEFT JOIN db_iemr.m_institutedirectory MI ON MI.InstituteDirectoryID = TDS.InstituteDirectoryID
LEFT JOIN db_iemr.m_institutesubdirectory MIS ON MIS.InstituteSubDirectoryID = TDS.InstituteSubDirectoryID
LEFT JOIN db_iemr.m_institution MIT ON MIT.InstitutionID = TDS.InstitutionID
LEFT JOIN db_iemr.m_providerservicemapping MP ON MP.ProviderServiceMapID = TDS.ProviderServiceMapID
LEFT JOIN db_iemr.m_state MS ON MS.stateID = MIT.stateID
LEFT JOIN db_iemr.m_district MD ON MD.districtID = MIT.DistrictID
LEFT JOIN db_iemr.m_districtblock MB ON MB.BlockID = MIT.BlockID
 WHERE DATE(TDS.CreatedDate)=CURDATE() - INTERVAL 1 DAY ;
-- WHERE DATE(TDS.CreatedDate)<CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_DirectoryService','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_EpidemicOutbreak` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_EpidemicOutbreak`()
BEGIN
 /********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_EpidemicOutbreak
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra Mohapatra
--    Created Date                  :           11-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To Load fact_EpidemicOutbreak
                                                from t_EpidemicOutbreak
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_EpidemicOutbreak','started',now());



INSERT INTO db_reporting.fact_EpidemicOutbreak (
OutbreakComplaintID,
RequestID,
BeneficiaryRegID,
BenCallID,
NatureOfComplaintID,
NatureOfComplaint,
TotalPeopleAffected,
AffectedDistrictID,
DistrictName,
AffectedDistrictBlockID,
DistrictBlockName,
AffectedDistrictBranchID,
DistrictBranchName,
Remarks,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate
)
SELECT
TEO.OutbreakComplaintID,
TEO.RequestID,
TEO.BeneficiaryRegID,
TEO.BenCallID,
TEO.NatureOfComplaintID,
TEO.NatureOfComplaint,
TEO.TotalPeopleAffected,
TEO.AffectedDistrictID,
MD.DistrictName,
TEO.AffectedDistrictBlockID,
DB.BlockName,
MDBM.DistrictBranchID ,
MDBM.VillageName,
TEO.Remarks,
MP.ProviderServiceMapID ,
TEO.CreatedBy,
TEO.CreatedDate,
TEO.ModifiedBy,
TEO.LastModDate,
Replace(DATE(TEO.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_EpidemicOutbreak',
NOW()
FROM         db_iemr.t_EpidemicOutbreak TEO
LEFT JOIN    db_iemr.m_district MD ON    MD.DistrictID = TEO.AffectedDistrictID
LEFT JOIN    db_iemr.m_DistrictBlock DB ON DB.BlockID = TEO.AffectedDistrictBlockID
LEFT JOIN    db_iemr.m_providerservicemapping MP ON MP.ProviderServiceMapID = TEO.ProviderServiceMapID
LEFT JOIN    db_iemr.m_districtbranchmapping  MDBM ON  MDBM.DistrictBranchID = TEO.AffectedDistrictID
  WHERE DATE(TEO.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
    -- WHERE DATE(TEO.CreatedDate)<CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_EpidemicOutbreak','completed',now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_Feedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_Feedback`()
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_EpidemicOutbreak
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra Mohapatra
--    Created Date                  :           11-04-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To Load fact_feedback table 
                                                from t_Feedback
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_Feedback','started',now());


INSERT INTO   db_reporting.fact_feedback(

  FeedbackID,
  RequestID,
  BenCallID,
  BeneficiaryRegID,
  FeedbackAgainst,
  DesignationID,
  DesignationName,
  InstitutionID,
  InstitutionName,
  StateID,
  StateName,
  DistrictID,
  DistrictName,
  BlockID,
  BlockName,
  DistrictBranchID,
  DistrictBranchName,
  InstitutionTypeID,
  InstituteTypeName,
  SeverityID,
  SeverityName,
  FeedbackTypeID,
  FeedbackTypeName,
  FeedbackNatureID,
  FeedbackNatureName,
  CategoryID,
  CategoryName,
  SubCategoryID,
  SubCategoryName,
  FeedbackStatusID,
  FeedbackStatusName,
  Feedback,
  ProviderServiceMapID,
  UserID,
  SMSPhoneNo,
  ServiceAvailDate,
  EmailStatusID,
  CreatedBy,
  CreatedDate,
  ModifiedBy,
  LastModDate,
  fact_CreatedDate,
  LoadedBy,
  LodadedDate
  )
  SELECT
  TF.FeedbackID,
  TF.RequestID,
  TF.BenCallID,
  TF.BeneficiaryRegID,
  TF.FeedbackAgainst,
  TF.DesignationID,
  MDG.DesignationName,
  MI.InstitutionID,
  MI.InstitutionName,
  MS.StateID,
  MS.stateName,
  MD.DistrictID,
  MD.Districtname,
  MB.BlockID,
  MB.BlockName,
  MDB.DistrictBranchID,
  MDB.villageName,
  MIT.InstitutionTypeID,
  MIT.InstitutionType,
  MST.SeverityID,
  MST.SeverityTypeName,
  MFT.FeedbackTypeID,
  MFT.FeedbackTypeName,
  TF.CategoryID,
  CA.CateGoryName,
  TF.SubCategoryID,
  SCA.SubCategoryName,
  MFN.FeedbackNatureID,
  MFN.FeedbackNature,
  MFS.FeedbackStatusID,
  MFS.FeedbackStatus,
  TF.Feedback,
  MPS.ProviderServiceMapID,
  MU.UserID,
  TF.SMSPhoneNo,
  TF.ServiceAvailDate,
  ME.EmailStatusID,
  TF.CreatedBy,
  TF.CreatedDate,
  TF.ModifiedBy,
  TF.LastModDate,
  Replace(DATE(TF.CreatedDate),'-','')AS fact_CreatedDate ,
  'SP_Load_Fact_Feedback',
  NOW()

  FROM db_iemr.t_feedback TF
    LEFT JOIN  db_iemr.m_designation MDG ON MDG.designationID = TF.DesignationID
    LEFT JOIN  db_iemr.m_institution MI ON MI.InstitutionID = TF.InstitutionID
    LEFT JOIN db_iemr.m_state  MS ON MS.stateID = TF.StateID
    LEFT JOIN db_iemr.m_district MD on MD.DistrictID = TF.DistrictID
    LEFT JOIN db_iemr.m_districtbranchmapping   MDB ON MDB.DistrictBranchID = TF.DistrictBranchID
    LEFT JOIN db_iemr.m_districtblock MB on MB.blockid = MDB.blockid
    LEFT JOIN db_iemr.m_institutiontype  MIT ON MIT.InstitutionTypeID = TF.InstitutionTypeID
    LEFT JOIN db_iemr.m_severity  MST ON MST.SeverityID = TF.SeverityID
    LEFT JOIN db_iemr.m_feedbacktype  MFT ON MFT.FeedbackTypeID = TF.FeedbackTypeID
    LEFT JOIN db_iemr.m_feedbacknature  MFN ON MFN.FeedbackNatureID = TF.FeedbackNatureID
    LEFT JOIN db_iemr.m_feedbackstatus  MFS ON MFS.FeedbackStatusID = TF.FeedbackStatusID
    LEFT JOIN db_iemr.m_providerservicemapping MPS ON MPS.ProviderServiceMapID =TF.ProviderServiceMapID
    LEFT JOIN db_iemr.m_user MU ON MU.userID = TF.userID
    LEFT JOIN db_iemr.m_emailstatus ME ON ME.EmailStatusID = TF.EmailStatusID
    LEFT JOIN db_iemr.m_Category CA ON TF.CategoryID = CA.CategoryID
    LEFT JOIN db_iemr.m_SubCategory SCA ON TF.SubCategoryID = SCA.SubCategoryID
    
    WHERE DATE(TF.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
    -- WHERE DATE(TF.CreatedDate)<CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_Feedback','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_FoodSafetyCopmlaint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_FoodSafetyCopmlaint`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_FoodSafetyCopmlaint
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           18-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_SchemeService
                                                from db_iemr t_SchemeService.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_FoodSafetyCopmlaint','started',now());


INSERT INTO db_reporting.Fact_FoodSafetyCopmlaint
(
FSComplaintID,
RequestID,
BeneficiaryRegID,
BenCallID,
PatientName,
PatientAge,
PatientGenderID,
PatientGenderName,
TypeOfRequest,
isDiarrhea,
isVomiting,
isAbdominalPain,
isChillsOrRigors,
isGiddiness,
isDehydration,
isRashes,
FromWhen,
HistoryOfDiet,
isFoodConsumed,
TypeOfFood,
FoodConsumedFrom,
AssociatedSymptoms,
DistrictID,
DistrictName,
DistrictBlockID,
DistrictBlockName,
VillageID,
VillageName,
FeedbackTypeID,
FeedbackType,
Remarks,
IsSelf,
ProviderServiceMapID,
Deleted,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
Fact_CreatedDate,
LoadedBy,
LodadedDate
)
  SELECT
FSC.FSComplaintID,
FSC.RequestID,
FSC.BeneficiaryRegID,
FSC.BenCallID,
FSC.PatientName,
FSC.PatientAge,
FSC.PatientGenderID,
M.GenderName,
FSC.TypeOfRequest,
FSC.isDiarrhea,
FSC.isVomiting,
FSC.isAbdominalPain,
FSC.isChillsOrRigors,
FSC.isGiddiness,
FSC.isDehydration,
FSC.isRashes,
FSC.FromWhen,
FSC.HistoryOfDiet,
FSC.isFoodConsumed,
FSC.TypeOfFood,
FSC.FoodConsumedFrom,
FSC.AssociatedSymptoms,
FSC.DistrictID,
DIS.DistrictName,
FSC.DistrictBlockID,
DISB.BlockName,
FSC.VillageID,
DISBM.VillageName,
FSC.FeedbackTypeID,
FT.FeedbackTypeName,
FSC.Remarks,
FSC.IsSelf,
FSC.ProviderServiceMapID,
FSC.Deleted,
FSC.CreatedBy,
FSC.CreatedDate,
FSC.ModifiedBy,
FSC.LastModDate,
 Replace(DATE(FSC.CreatedDate),'-','')AS fact_CreatedDate,
 'SP_Load_Fact_FoodSafetyCopmlaint',
 now()

 FROM db_iemr.t_foodsafetycopmlaint FSC
      LEFT JOIN db_iemr.m_FeedbackType FT ON FSC.FeedbackTypeID = FT.FeedbackTypeID
      LEFT JOIN db_iemr.m_gender M ON M.GenderID = FSC.PatientGenderID
      left join db_iemr.m_District DIS ON FSC.DistrictID = DIS.DistrictID
      left join db_iemr.m_DistrictBlock DISB ON FSC.DistrictBlockID = DISB.BlockID
      left join db_iemr.m_DistrictBranchMapping DISBM ON FSC.VillageID = DISBM.DistrictBranchID
      WHERE DATE(FSC.CreatedDate)=CURDATE() - INTERVAL 1 DAY ;


 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_FoodSafetyCopmlaint','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ItemStockEntry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `SP_Load_Fact_ItemStockEntry`()
BEGIN

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ItemStockEntry','started',now());



  INSERT INTO db_reporting.fact_itemstockentry

(ItemStockEntryID,
FacilityID,
FacilityName,
FacilityDesc,
FacilityCode,
FacilityTypeID,
IsMainFacility,
MainFacilityID,
ItemID,
ItemName,
ItemDesc,
ItemCategoryID,
ItemCategoryName,
AlertBeforeDays,
Strength,
BatchNo,
Quantity,
QuantityInHand,
UnitCostPrice,
ExpiryDate,
EntryTypeID,
EntryType,
vanserialno,
vanid,
ProviderServiceMapID,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ISE.ItemStockEntryID,
ISE.FacilityID,
FAC.FacilityName,
FAC.FacilityDesc,
FAC.FacilityCode,
FAC.FacilityTypeID,
FAC.IsMainFacility,
FAC.MainFacilityID,
ISE.ItemID,
ITM.ItemName,
ITM.ItemDesc,
ITM.ItemCategoryID,
ITMC.ItemCategoryName,
ITMC.AlertBeforeDays,
ITM.Strength,
ISE.BatchNo,
ISE.Quantity,
ISE.QuantityInHand,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISE.EntryTypeID,
ISE.EntryType,
ISE.vanserialno,
ISE.vanid,
ISE.ProviderServiceMapID,
ISE.Deleted,
ISE.Processed,
ISE.CreatedBy,
ISE.CreatedDate,
ISE.ModifiedBy,
ISE.LastModDate,
  Replace(DATE(ISE.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_ItemStockEntry',
  NOW()
 FROM db_iemr.t_ItemStockEntry ISE
 inner join db_iemr.m_item ITM on ISE.ItemID = ITM.ItemID
 inner join db_iemr.m_facility FAC on ISE.FacilityID = FAC.FacilityID
 inner join db_iemr.m_itemcategory ITMC on ITM.ItemCategoryID = ITMC.ItemCategoryID
 
	WHERE DATE(ISE.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
  -- WHERE DATE(ISE.CreatedDate)<CURDATE();
  
  set sql_safe_updates=0;

    update db_reporting.fact_itemstockentry f
    inner join db_iemr.t_ItemStockEntry t on t.itemstockentryid=f.itemstockentryid
    set f.quantityinhand=t.quantityinhand
    WHERE DATE(t.CreatedDate)<=CURDATE() - INTERVAL 1 DAY;

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ItemStockEntry','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_ItemStockExit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`localhost` PROCEDURE `SP_Load_Fact_ItemStockExit`()
BEGIN

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ItemStockExit','started',now());



  INSERT INTO db_reporting.fact_itemstockexit

(ItemStockExitID,
ItemStockEntryID,
FacilityID,
FacilityName,
FacilityDesc,
FacilityCode,
FacilityTypeID,
IsMainFacility,
MainFacilityID,
ItemID,
ItemName,
ItemDesc,
ItemCategoryID,
ItemCategoryName,
Strength,
BatchNo,
Quantity,
QuantityInHand,
UnitCostPrice,
ExpiryDate,
EntryTypeID,
EntryType,
QuantityGiven,
ProviderServiceMapID,
ExitTypeID,
ExitType,
vanid,
vanserialno,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ISEx.ItemStockExitID,
ISE.ItemStockEntryID,
ISE.FacilityID,
FAC.FacilityName,
FAC.FacilityDesc,
FAC.FacilityCode,
FAC.FacilityTypeID,
FAC.IsMainFacility,
FAC.MainFacilityID,
ISE.ItemID,
ITM.ItemName,
ITM.ItemDesc,
ITM.ItemCategoryID,
ITMC.ItemCategoryName,
ITM.Strength,
ISE.BatchNo,
ISE.Quantity,
ISE.QuantityInHand,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISE.EntryTypeID,
ISE.EntryType,
ISEx.Quantity,
ISEx.ProviderServiceMapID,
ISEx.ExitTypeID,
ISEx.ExitType,
ISEx.vanid,
Isex.Vanserialno,
ISEx.Deleted,
ISEx.Processed,
ISEx.CreatedBy,
ISEx.CreatedDate,
ISEx.ModifiedBy,
ISEx.LastModDate,
  Replace(DATE(ISEx.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_ItemStockExit',
  NOW()
 FROM db_iemr.t_ItemStockExit ISEx
 inner join db_iemr.t_ItemStockEntry ISE on ISEx.ItemStockEntryID = ISE.VanSerialNo and ISEx.VanID = ISE.VanID
 inner join db_iemr.m_item ITM on ISE.ItemID = ITM.ItemID
 inner join db_iemr.m_facility FAC on ISE.FacilityID = FAC.FacilityID
 inner join db_iemr.m_itemcategory ITMC on ITM.ItemCategoryID = ITMC.ItemCategoryID
 
	WHERE DATE(ISEx.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
  -- WHERE DATE(ISEx.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_ItemStockExit','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_LabTestOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_LabTestOrder`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_LabTestOrder
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_labtestorder(db_reporting)
                                                 from  t_lab_testorder  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_LabTestOrder','started',now());



  INSERT INTO db_reporting.fact_labtestorder

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
VisitDate,
VisitCategory,
PrescriptionID,
ProcedureID,
ProcedureName,
TestingRequirements,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
LTO.ID,
LTO.BeneficiaryRegID,
LTO.BenVisitID,
LTO.ProviderServiceMapID,
LTO.VisitCode,
Date(BVD.CreatedDate) as VisitDate, 
BVD.VisitCategory,
LTO.PrescriptionID,
LTO.ProcedureID,
LTO.ProcedureName,
LTO.TestingRequirements,
LTO.Deleted,
LTO.Processed,
LTO.CreatedBy,
LTO.CreatedDate,
LTO.ModifiedBy,
LTO.LastModDate,
LTO.VanSerialNo,
LTO.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
LTO.SyncedBy,
LTO.SyncedDate,
  Replace(DATE(LTO.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_LabTestOrder',
  NOW()
 FROM db_iemr.t_lab_testorder LTO
 left join db_iemr.m_van VAN on LTO.VanID = VAN.VanID
inner join db_iemr.t_benvisitdetail BVD on LTO.VisitCode = BVD.VisitCode and LTO.BeneficiaryRegID = BVD.BeneficiaryRegID
 WHERE DATE(LTO.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(LTO.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_LabTestOrder','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_LabTestResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_LabTestResult`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_LabTestResult
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           26-02-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_LabTestResult(db_reporting)
                                                 from  t_LabTestResult  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_LabTestResult','started',now());



  INSERT INTO db_reporting.fact_LabTestResult

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
VisitDate,
PrescriptionID,
ProcedureID,
ProcedureName,
TestComponentID,
TestComponentName,
TestResultValue,
TestResultUnit,
TestReportFilePath,
Remarks,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
LTR.ID,
LTR.BeneficiaryRegID,
LTR.BenVisitID,
LTR.ProviderServiceMapID,
LTR.VisitCode,
BVD.CreatedDate,
LTR.PrescriptionID,
LTR.ProcedureID,
PRO.ProcedureName,
LTR.TestComponentID,
TC.TestComponentName,
LTR.TestResultValue,
LTR.TestResultUnit,
LTR.TestReportFilePath,
LTR.Remarks,
LTR.Deleted,
LTR.Processed,
LTR.CreatedBy,
LTR.CreatedDate,
LTR.ModifiedBy,
LTR.LastModDate,
LTR.VanSerialNo,
LTR.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
LTR.SyncedBy,
LTR.SyncedDate,
Replace(DATE(LTR.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_LabTestResult',
NOW()
from db_iemr.t_lab_testresult LTR
		left join db_iemr.m_testcomponent TC on LTR.TestComponentID = TC.TestComponentID
        left join db_iemr.m_procedure PRO on LTR.ProcedureID = PRO.ProcedureID
        left join db_iemr.m_van VAN on LTR.VanID = VAN.VanID 
        inner join db_iemr.t_benvisitdetail BVD on LTR.VisitCode = BVD.VisitCode 
			and LTR.BeneficiaryRegID = BVD.BeneficiaryRegID
 WHERE DATE(LTR.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(LTR.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_LabTestResult','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_MCTSCallResponse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `SP_Load_Fact_MCTSCallResponse`()
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_OrganDonation
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           06-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_MCTSCallResponse(Reporting)
                                                from t_MCTSCallResponse(iemr)


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MCTSCallResponse','started',now());


INSERT INTO  db_reporting.Fact_MCTSCallResponse(
MotherID,
ChildID,
BenCallID,
QuestionID,
Question,
Answer,
Deleted,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate ,
LoadedBy,
LodadedDate,
outboundCallType,SectionID,ReasonsforHrni,OtherHrni,
CongentialAnomalies,OtherCongentialAnomalies,ProbableCauseOfDefect,
ReasonsForHrp,OtherHrpReason,obcallid,Remarks ,ProviderServiceMapID
)

SELECT
TM.MotherID,
TM.ChildID,
TM.BenCallID,
TM.QuestionID,
MQ.Question,
TM.Answer,
TM.Deleted,
TM.CreatedBy,
TM.CreatedDate,
TM.ModifiedBy,
TM.LastModDate,
Replace(DATE(TM.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_MCTSCallResponse',
NOW(),
TM.outboundCallType,TM.SectionID,TM.ReasonsforHrni,TM.OtherHrni,
TM.CongentialAnomalies,TM.OtherCongentialAnomalies,TM.ProbableCauseOfDefect,
TM.ReasonsForHrp,TM.OtherHrpReason,TM.obcallid,TM.Remarks ,TM.ProviderServiceMapID
FROM   db_iemr.t_MCTSCallResponse  TM
LEFT JOIN db_iemr.m_questionnaire MQ ON MQ.QuestionID = TM.QuestionID
WHERE   DATE(TM.CreatedDate)= (CURDATE() - INTERVAL 1 DAY) ;
-- WHERE   DATE(TM.CreatedDate)<CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MCTSCallResponse','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_MctsOutboundCall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `SP_Load_Fact_MctsOutboundCall`()
BEGIN
/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_OrganDonation
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           06-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_MctsOutboundCall(reporting)
                                                from db_iemr  t_MctsOutboundCalls


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MctsOutboundCall','started',now());

INSERT INTO  db_reporting.Fact_MctsOutboundCall(

OBCallID,
MotherID,
ChildID,
BeneficiaryRegID,
AllocatedUserID,
ProviderServiceMapID,
OutboundCallType,
DisplayOBCallType,
CallDateFrom,
CallDateTo,
PrefferedCallDate,
CallStatus,
NoOfTrials,
AllocationStatus,
IsSMSSent,
Deleted,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate,IsHighRisk,HighRisk_Reason,IsHrni,Hrni_Reason,
congenitalanomalies,phoneNumberType)

SELECT
OBCallID,
MotherID,
ChildID,
BeneficiaryRegID,
AllocatedUserID,
ProviderServiceMapID,
OutboundCallType,
DisplayOBCallType,
CallDateFrom,
CallDateTo,
PrefferedCallDate,
CallStatus,
NoOfTrials,
AllocationStatus,
IsSMSSent,
Deleted,
-- Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
Replace(DATE(CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_MctsOutboundCall',
NOW()  
,IsHighRisk,HighRisk_Reason,IsHrni,Hrni_Reason,
congenitalanomalies,phoneNumberType
FROM  db_iemr.t_MctsOutboundCalls
WHERE   DATE(CreatedDate)= (CURDATE() - INTERVAL 1 DAY);
-- WHERE   DATE(CreatedDate)< CURDATE();
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MctsOutboundCall','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_MotherInValidRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_MotherInValidRecord`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_OrganDonation
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           06-06-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_MotherInValidRecord(reporting)
                                                from db_iemr  t_MotherInValidRecord


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MotherInValidRecord','started',now());


INSERT INTO  db_reporting.Fact_MotherInValidRecord(
MotherInValidRecordID,
RowID,
BeneficiaryRegID,
Date_of_Entry,
Entry_type,
MCTSID_no,
Name,
Husband_Name,
PhoneNo_Of_Whom,
Whom_PhoneNo,
Birth_Date,
Age,
Blood_Group,
Caste,
Aadhar_no,
State_ID,
State_Name,
District_ID,
District_Name,
Taluka_Name,
Taluka_ID,
Block_ID,
Block_Name,
SubCenter_ID,
SubCenter_Name,
Village_ID,
Village_Name,
City_ID,
City_Name,
SubCenter_Name1,
ANM_ID,
ANM_Name,
ANM_Ph,
ASHA_ID,
ASHA_Name,
ASHA_Ph,
PHC_ID,
PHC_Name,
SUBPHC_ID,
SUBPHC_Name,
YR,
GP_Village,
Address,
LMP_Date,
ANC1_Date,
ANC2_Date,
ANC3_Date,
ANC4_Date,
ANC_Complication,
TT1_Date,
TT2_Date,
TTBooster_Date,
IFA100_Given_Date,
EDD,
Anemia,
RTI_STI,
Delivery_Lnk_Facility,
Facility_Name,
Delivery_Date,
Delivery_Place_home_type,
Delivery_Place_Public,
Delivery_Place_Private,
Delivery_type,
Delivery_Complications,
Discharge_Date,
Abortion,
PNC_Home_Visit,
PNC_Complication,
PPC_Method,
PNC_Checkup,
Outcome_Nos,
Child1_ID,
Child1_Name,
Child1_Gender,
Child1_Weight,
Child1_BreastFeeding,
Child2_ID,
Child2_Name,
Child2_Gender,
Child2_weight,
Child2_Breastfeeding,
Child3_ID,
Child3_Name,
Child3_Gender,
Child3_Weight,
Child3_Breastfeeding,
Child4_ID,
Child4_Name,
Child4_Gender,
Child4_Weight,
Child4_Breastfeeding,
Mother_Reg_Date,
Last_Update_Date,
EID,
EID_time,
CPSMS_Flag,
JSY_Beneficiary,
JSY_Paid_Date,
Bank_Name,
Bank_Branch_Name,
Acc_No,
IFSC_Code,
Remarks,
Referred_By_Telecaller,
Referred_Date,
No_of_Try,
Call_Answered,
Status,
High_Risk,
Call_Verified,
Associate,
Call_Date,
Due_Services,
Due_Services_Response,
Overdue_Services,
Overdue_Services_Response,
Given_Services,
Given_Services_Response,
Miscarriage,
Baby_Died,
Call_No,
Questions_Asked,
Asnwer_Given_by_Benificary,
Source,
ProviderServiceMapID,
NoCall_Reason,
NoPhone_Reason,
Created_By,
Updated_By,
BPL_APL,
MDDS_StateID,
MDDS_District_ID,
MDDS_Taluka_ID,
MDDS_Village_ID,
Is_Valid,
InValid_Reason,
Is_Error,
Error_Reason,
FileID,
IsAllocated,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
TM.MotherInValidRecordID,
TM.RowID,
TM.BeneficiaryRegID,
TM.Date_of_Entry,
TM.Entry_type,
TM.MCTSID_no,
TM.Name,
TM.Husband_Name,
TM.PhoneNo_Of_Whom,
TM.Whom_PhoneNo,
TM.Birth_Date,
TM.Age,
TM.Blood_Group,
TM.Caste,
TM.Aadhar_no,
TM.State_ID,
TM.State_Name,
TM.District_ID,
TM.District_Name,
TM.Taluka_Name,
TM.Taluka_ID,
TM.Block_ID,
TM.Block_Name,
TM.SubCenter_ID,
TM.SubCenter_Name,
TM.Village_ID,
TM.Village_Name,
TM.City_ID,
TM.City_Name,
TM.SubCenter_Name1,
TM.ANM_ID,
TM.ANM_Name,
TM.ANM_Ph,
TM.ASHA_ID,
TM.ASHA_Name,
TM.ASHA_Ph,
TM.PHC_ID,
TM.PHC_Name,
TM.SUBPHC_ID,
TM.SUBPHC_Name,
TM.YR,
TM.GP_Village,
TM.Address,
TM.LMP_Date,
TM.ANC1_Date,
TM.ANC2_Date,
TM.ANC3_Date,
TM.ANC4_Date,
TM.ANC_Complication,
TM.TT1_Date,
TM.TT2_Date,
TM.TTBooster_Date,
TM.IFA100_Given_Date,
TM.EDD,
TM.Anemia,
TM.RTI_STI,
TM.Delivery_Lnk_Facility,
TM.Facility_Name,
TM.Delivery_Date,
TM.Delivery_Place_home_type,
TM.Delivery_Place_Public,
TM.Delivery_Place_Private,
TM.Delivery_type,
TM.Delivery_Complications,
TM.Discharge_Date,
TM.Abortion,
TM.PNC_Home_Visit,
TM.PNC_Complication,
TM.PPC_Method,
TM.PNC_Checkup,
TM.Outcome_Nos,
TM.Child1_ID,
TM.Child1_Name,
TM.Child1_Gender,
TM.Child1_Weight,
TM.Child1_BreastFeeding,
TM.Child2_ID,
TM.Child2_Name,
TM.Child2_Gender,
TM.Child2_weight,
TM.Child2_Breastfeeding,
TM.Child3_ID,
TM.Child3_Name,
TM.Child3_Gender,
TM.Child3_Weight,
TM.Child3_Breastfeeding,
TM.Child4_ID,
TM.Child4_Name,
TM.Child4_Gender,
TM.Child4_Weight,
TM.Child4_Breastfeeding,
TM.Mother_Reg_Date,
TM.Last_Update_Date,
TM.EID,
TM.EID_time,
TM.CPSMS_Flag,
TM.JSY_Beneficiary,
TM.JSY_Paid_Date,
TM.Bank_Name,
TM.Bank_Branch_Name,
TM.Acc_No,
TM.IFSC_Code,
TM.Remarks,
TM.Referred_By_Telecaller,
TM.Referred_Date,
TM.No_of_Try,
TM.Call_Answered,
TM.Status,
TM.High_Risk,
TM.Call_Verified,
TM.Associate,
TM.Call_Date,
TM.Due_Services,
TM.Due_Services_Response,
TM.Overdue_Services,
TM.Overdue_Services_Response,
TM.Given_Services,
TM.Given_Services_Response,
TM.Miscarriage,
TM.Baby_Died,
TM.Call_No,
TM.Questions_Asked,
TM.Asnwer_Given_by_Benificary,
TM.Source,
TK.ProviderServiceMapID,
TM.NoCall_Reason,
TM.NoPhone_Reason,
TM.Created_By,
TM.Updated_By,
TM.BPL_APL,
TM.MDDS_StateID,
TM.MDDS_District_ID,
TM.MDDS_Taluka_ID,
TM.MDDS_Village_ID,
TM.Is_Valid,
TM.InValid_Reason,
TM.Is_Error,
TM.Error_Reason,
TM.FileID,
TM.IsAllocated,
TM.Deleted,
TM.Processed,
TM.CreatedBy,
TM.CreatedDate,
TM.ModifiedBy,
TM.LastModDate,
Replace(DATE(TM.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_MotherInValidRecord',
NOW()

FROM   db_iemr.t_MotherInValidRecord  TM
LEFT  JOIN `db_iemr`.`t_filemanager` TK ON TM.FileID = TK.FileID
WHERE   DATE(TM.CreatedDate)= CURDATE() - INTERVAL 1 DAY ;
 -- WHERE   DATE(TM.CreatedDate)< CURDATE();

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MotherInValidRecord','completed',now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_MotherValidRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`piramaldev`@`%` PROCEDURE `SP_Load_Fact_MotherValidRecord`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_MotherValidRecord
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           28-05-2017
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load fact_mothervalidrecord (db_reporing)
                                                from db_iemr t_mothervalidrecord.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MotherValidRecord','started',now());


INSERT INTO db_reporting.fact_mothervalidrecord

(MotherValidRecordID,

RowID,

BeneficiaryRegID,

Date_of_Entry,

Entry_type,

MCTSID_no,

Name,

Husband_Name,

PhoneNo_Of_Whom,

Whom_PhoneNo,

Birth_Date,

Age,

Blood_Group,

Caste,

Aadhar_no,

State_ID,

State_Name,

District_ID,

District_Name,

Taluka_Name,

Taluka_ID,

Block_ID,

Block_Name,

SubCenter_ID,

SubCenter_Name,

Village_ID,

Village_Name,

City_ID,

City_Name,

SubCenter_Name1,

ANM_ID,

ANM_Name,

ANM_Ph,

ASHA_ID,

ASHA_Name,

ASHA_Ph,

PHC_ID,

PHC_Name,

SUBPHC_ID,

SUBPHC_Name,

YR,

GP_Village,

Address,

LMP_Date,

ANC1_Date,

ANC2_Date,

ANC3_Date,

ANC4_Date,

ANC_Complication,

TT1_Date,

TT2_Date,

TTBooster_Date,

IFA100_Given_Date,

EDD,

Anemia,

RTI_STI,

Delivery_Lnk_Facility,

Facility_Name,

Delivery_Date,

Delivery_Place_home_type,

Delivery_Place_Public,

Delivery_Place_Private,

Delivery_type,

Delivery_Complications,

Discharge_Date,

Abortion,

PNC_Home_Visit,

PNC_Complication,

PPC_Method,

PNC_Checkup,

Outcome_Nos,

Child1_ID,

Child1_Name,

Child1_Gender,

Child1_Weight,

Child1_BreastFeeding,

Child2_ID,

Child2_Name,

Child2_Gender,

Child2_weight,

Child2_Breastfeeding,

Child3_ID,

Child3_Name,

Child3_Gender,

Child3_Weight,

Child3_Breastfeeding,

Child4_ID,

Child4_Name,

Child4_Gender,

Child4_Weight,

Child4_Breastfeeding,

Mother_Reg_Date,

Last_Update_Date,

EID,

EID_time,

CPSMS_Flag,

JSY_Beneficiary,

JSY_Paid_Date,

Bank_Name,

Bank_Branch_Name,

Acc_No,

IFSC_Code,

Remarks,

Referred_By_Telecaller,

Referred_Date,

No_of_Try,

Call_Answered,

Status,

High_Risk,

High_Risk_Reason,

Call_Verified,

Associate,

Call_Date,

Due_Services,

Due_Services_Response,

Overdue_Services,

Overdue_Services_Response,

Given_Services,

Given_Services_Response,

Miscarriage,

Baby_Died,

Call_No,

Questions_Asked,

Asnwer_Given_by_Benificary,

Source,

NoCall_Reason,

NoPhone_Reason,

Created_By,

Updated_By,

BPL_APL,

MDDS_StateID,

MDDS_District_ID,

MDDS_Taluka_ID,

MDDS_Village_ID,

ProviderServiceMapID,

Is_Valid,

InValid_Reason,

Is_Error,

Error_Reason,

FileID,

IsAllocated,

Deleted,

CreatedBy,

CreatedDate,

ModifiedBy,

LastModDate,

fact_CreatedDate,

LoadedBy,

LodadedDate,
Registration_no,Landline_no,Mother_Weight,ANC1_Symptoms_High_Risk,
     ANC2_Symptoms_High_Risk,ANC3_Symptoms_High_Risk,ANC4_Symptoms_High_Risk,
     Delivery_Place,Delivery_Place_Name)



SELECT

MV.MotherValidRecordID,

    MV.RowID,

    MV.BeneficiaryRegID,

    MV.Date_of_Entry,

    MV.Entry_type,

    MV.MCTSID_no,

    MV.Name,

    MV.Husband_Name,

    MV.PhoneNo_Of_Whom,

    MV.Whom_PhoneNo,

    MV.Birth_Date,

    MV.Age,

    MV.Blood_Group,

    MV.Caste,

    MV.Aadhar_no,

    MV.State_ID,

    MV.State_Name,

    MV.District_ID,

    MV.District_Name,

    MV.Taluka_Name,

    MV.Taluka_ID,

    MV.Block_ID,

    MV.Block_Name,

    MV.SubCenter_ID,

    MV.SubCenter_Name,

    MV.Village_ID,

    MV.Village_Name,

    MV.City_ID,

    MV.City_Name,

    MV.SubCenter_Name1,

    MV.ANM_ID,

    MV.ANM_Name,

    MV.ANM_Ph,

    MV.ASHA_ID,

    MV.ASHA_Name,

    MV.ASHA_Ph,

    MV.PHC_ID,

    MV.PHC_Name,

    MV.SUBPHC_ID,

    MV.SUBPHC_Name,

    MV.YR,

    MV.GP_Village,

    MV.Address,

    MV.LMP_Date,

    MV.ANC1_Date,

    MV.ANC2_Date,

    MV.ANC3_Date,

    MV.ANC4_Date,

    MV.ANC_Complication,

    MV.TT1_Date,

    MV.TT2_Date,

    MV.TTBooster_Date,

    MV.IFA100_Given_Date,

    MV.EDD,

    MV.Anemia,

    MV.RTI_STI,

    MV.Delivery_Lnk_Facility,

    MV.Facility_Name,

    MV.Delivery_Date,

    MV.Delivery_Place_home_type,

    MV.Delivery_Place_Public,

    MV.Delivery_Place_Private,

    MV.Delivery_type,

    MV.Delivery_Complications,

    MV.Discharge_Date,

    MV.Abortion,

    MV.PNC_Home_Visit,

    MV.PNC_Complication,

    MV.PPC_Method,

    MV.PNC_Checkup,

    MV.Outcome_Nos,

    MV.Child1_ID,

    MV.Child1_Name,

    MV.Child1_Gender,

    MV.Child1_Weight,

    MV.Child1_BreastFeeding,

    MV.Child2_ID,

    MV.Child2_Name,

    MV.Child2_Gender,

    MV.Child2_weight,

    MV.Child2_Breastfeeding,

    MV.Child3_ID,

    MV.Child3_Name,

    MV.Child3_Gender,

    MV.Child3_Weight,

    MV.Child3_Breastfeeding,

    MV.Child4_ID,

    MV.Child4_Name,

    MV.Child4_Gender,

    MV.Child4_Weight,

    MV.Child4_Breastfeeding,

    MV.Mother_Reg_Date,

    MV.Last_Update_Date,

    MV.EID,

    MV.EID_time,

    MV.CPSMS_Flag,

    MV.JSY_Beneficiary,

    MV.JSY_Paid_Date,

    MV.Bank_Name,

    MV.Bank_Branch_Name,

    MV.Acc_No,

    MV.IFSC_Code,

    MV.Remarks,

    MV.Referred_By_Telecaller,

    MV.Referred_Date,

    MV.No_of_Try,

    MV.Call_Answered,

    MV.Status,

    MV.High_Risk,

    MV.High_Risk_Reason,

    MV.Call_Verified,

    MV.Associate,

    MV.Call_Date,

    MV.Due_Services,

    MV.Due_Services_Response,

    MV.Overdue_Services,

    MV.Overdue_Services_Response,

    MV.Given_Services,

    MV.Given_Services_Response,

    MV.Miscarriage,

    MV.Baby_Died,

    MV.Call_No,

    MV.Questions_Asked,

    MV.Asnwer_Given_by_Benificary,

    MV.Source,

    MV.NoCall_Reason,

    MV.NoPhone_Reason,

    MV.Created_By,

    MV.Updated_By,

    MV.BPL_APL,

    MV.MDDS_StateID,

    MV.MDDS_District_ID,

    MV.MDDS_Taluka_ID,

    MV.MDDS_Village_ID,

    FM.ProviderServiceMapID,

    MV.Is_Valid,

    MV.InValid_Reason,

    MV.Is_Error,

    MV.Error_Reason,

    MV.FileID,

    MV.IsAllocated,

    MV.Deleted,

    MV.CreatedBy,

    MV.CreatedDate,

    MV.ModifiedBy,

    MV.LastModDate,

   Replace(DATE(MV.CreatedDate),'-','')AS fact_CreatedDate ,

     'SP_Load_Fact_MotherValidRecord',

     NOW(),
     MV.Registration_no,MV.Landline_no,MV.Mother_Weight,MV.ANC1_Symptoms_High_Risk,
     MV.ANC2_Symptoms_High_Risk,MV.ANC3_Symptoms_High_Risk,MV.ANC4_Symptoms_High_Risk,
     MV.Delivery_Place,MV.Delivery_Place_Name

FROM db_iemr.t_mothervalidrecord MV

LEFT JOIN db_iemr.t_filemanager  FM ON MV.FileID = FM.FileID
WHERE DATE(MV.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(t_mothervalidrecord.CreatedDate)<CURDATE() ;

update db_reporting.fact_mothervalidrecord 
set IsSelfNo = 0b1 
where PhoneNo_Of_Whom = 'self' and DATE(CreatedDate)=CURDATE() - INTERVAL 1 DAY;


insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_MotherValidRecord','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_OrganDonation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_OrganDonation`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_OrganDonation
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           28-05-2017
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_OrganDonation
                                                 from db_iemr t_OrganDonation.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_OrganDonation','started',now());

INSERT INTO db_reporting.Fact_OrganDonation(
OrganDonationID,
RequestID,
BeneficiaryRegID,
BenCallID,
DonarName,
DonarAge,
DonarGenderID,
DonarGenderName,
DonationTypeID,
DonationTypeName,
DonatableOrganID,
DonatableOrganName,
AcceptorHospitalID,
AcceptorHospitalName,
AcceptorHospitalState,
AcceptorHospitalDistrict,
AcceptorHospitalSubDistrict,
AcceptorHospitalVillage,
Remarks,
IsSelf,
ProviderServiceMapID,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate )
SELECT
TOG.OrganDonationID,
TOG.RequestID,
TOG.BeneficiaryRegID,
TOG.BenCallID,
DonarName,
DonarAge,
MG.GenderID,
MG.GenderName,
MDT.DonationTypeID,
MDT.DonationType,
MD.DonatableOrganID,
MD.DonatableOrgan,
TOG.AcceptorHospitalID,
MIT.InstitutionName,
MS.stateName,
MDD.DistrictName,
null,
null,
TOG.Remarks,
TOG.IsSelf,
TOG.ProviderServiceMapID,
TOG.CreatedBy,
TOG.CreatedDate,
TOG.ModifiedBy,
TOG.LastModDate,
Replace(DATE(TOG.CreatedDate),'-','')AS fact_CreatedDate ,
'SP_Load_Fact_OrganDonation',
NOW()
FROM  db_iemr.t_OrganDonation    TOG
LEFT JOIN db_iemr.m_providerservicemapping MPM ON MPM.ProviderServiceMapID = TOG.ProviderServiceMapID
LEFT JOIN db_iemr.m_donatableorgan MD ON MD.DonatableOrganID = TOG.DonatableOrganID
LEFT JOIN db_iemr.m_donationtype MDT ON MDT.DonationTypeID = TOG.DonationTypeID
LEFT JOIN db_iemr.m_gender  MG ON MG.GenderID=TOG.DonarGenderID
LEFT JOIN db_iemr.m_institution MIT ON MIT.InstitutionID = TOG.AcceptorHospitalID
LEFT JOIN db_iemr.m_providerservicemapping MP ON MP.ProviderServiceMapID = TOG.ProviderServiceMapID
LEFT JOIN db_iemr.m_state MS ON MS.stateID = MIT.stateID
LEFT JOIN db_iemr.m_district MDD ON MDD.districtID = MIT.districtID
LEFT JOIN db_iemr.m_districtblock MB ON MB.BlockID = MIT.BlockID
WHERE DATE(TOG.CreatedDate)=CURDATE() - INTERVAL 1 DAY ;
-- WHERE DATE(TOG.CreatedDate)<CURDATE()  ;


UPDATE db_reporting.Fact_OrganDonation  FOD
LEFT JOIN db_iemr.t_OrganDonation    TOG ON FOD.OrganDonationID = TOG.OrganDonationID
LEFT JOIN db_iemr.m_providerservicemapping MPM ON MPM.ProviderServiceMapID = TOG.ProviderServiceMapID
LEFT JOIN db_iemr.m_donatableorgan MD ON MD.DonatableOrganID = TOG.DonatableOrganID
LEFT JOIN db_iemr.m_donationtype MDT ON MDT.DonationTypeID = TOG.DonationTypeID
LEFT JOIN db_iemr.m_gender  MG ON MG.GenderID=TOG.DonarGenderID
LEFT JOIN db_iemr.m_institution MIT ON MIT.InstitutionID = TOG.AcceptorHospitalID
LEFT JOIN db_iemr.m_providerservicemapping MP ON MP.ProviderServiceMapID = TOG.ProviderServiceMapID
LEFT JOIN db_iemr.m_state MS ON MS.stateID = MIT.stateID
LEFT JOIN db_iemr.m_district MDD ON MDD.districtID = MIT.districtID
LEFT JOIN db_iemr.m_districtblock MB ON MB.BlockID = MIT.BlockID
 SET

FOD.OrganDonationID = TOG.OrganDonationID,
FOD.RequestID = TOG.RequestID,
FOD.BeneficiaryRegID = TOG.BeneficiaryRegID,
FOD.BenCallID = TOG.BenCallID,
FOD.DonarName = TOG.DonarName,
FOD.DonarAge = TOG.DonarAge,
FOD.DonarGenderID = MG.GenderID,
FOD.DonarGenderName = MG.GenderName,
FOD.DonationTypeID = MDT.DonationTypeID,
FOD.DonationTypeName = MDT.DonationType,
FOD.DonatableOrganID = MD.DonatableOrganID,
FOD.DonatableOrganName = MD.DonatableOrgan,
FOD.AcceptorHospitalID = TOG.AcceptorHospitalID,
FOD.AcceptorHospitalName = MIT.InstitutionName,
FOD.AcceptorHospitalState = MS.stateName,
FOD.AcceptorHospitalDistrict = MDD.DistrictName,
FOD.AcceptorHospitalSubDistrict = null,
FOD.AcceptorHospitalVillage = null,
FOD.Remarks = TOG.Remarks,
FOD.IsSelf = TOG.IsSelf,
FOD.ProviderServiceMapID = TOG.ProviderServiceMapID,
FOD.CreatedBy = TOG.CreatedBy,
FOD.CreatedDate = TOG.CreatedDate,
FOD.ModifiedBy = TOG.ModifiedBy,
FOD.LastModDate = TOG.LastModDate,
FOD.LodadedDate = NOW()

WHERE
TOG.LastModDate >FOD.LodadedDate ;

insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_OrganDonation','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_PatientIssueExit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_PatientIssueExit`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_PatientIssueExit
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           09-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_patientissueexit(db_reporting)
                                                 from  t_patientissue and t_itemstockexit  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PatientIssueExit','started',now());



  INSERT INTO db_reporting.fact_patientissueexit

(ItemStockExitID,
ItemStockEntryID,
ItemID,
ItemName,
ItemDesc,
ItemCategoryID,
ItemCategoryName,
Strength,
BatchNo,
Quantity,
QuantityInHand,
UnitCostPrice,
ExpiryDate,
QuantityGiven,
ProviderServiceMapID,
ExitTypeID,
ExitType,
PatientIssueID,
BeneficiaryRegID,
VisitID,
VisitCode,
FacilityID,
PatientName,
Age,
Gender,
DoctorName,
PrescriptionID,
Reference,
IssueType,
Status,
PatientIssueDeleted,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ISEx.ItemStockExitID,
ISE.ItemStockEntryID,
ISE.ItemID,
ITM.ItemName,
ITM.ItemDesc,
ITM.ItemCategoryID,
ITMC.ItemCategoryName,
ITM.Strength,
ISE.BatchNo,
ISE.Quantity,
ISE.QuantityInHand,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISEx.Quantity,
ISEx.ProviderServiceMapID,
ISEx.ExitTypeID,
ISEx.ExitType,
PI.PatientIssueID,
PI.BeneficiaryRegID,
PI.BenVisitID,
PI.VisitCode,
PI.FacilityID,
PI.PatientName,
PI.Age,
PI.Gender,
PI.DoctorName,
PI.PrescriptionID,
PI.Reference,
PI.IssueType,
PI.Status,
PI.Deleted,
ISEx.Deleted,
ISEx.Processed,
ISEx.CreatedBy,
ISEx.CreatedDate,
ISEx.ModifiedBy,
ISEx.LastModDate,
  Replace(DATE(ISEx.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_PatientIssueExit',
  NOW()
 FROM db_iemr.t_itemstockexit ISEx
inner join db_iemr.t_PatientIssue PI 
			on ISEx.ExitTypeID = PI.VanSerialNo
			and ISEx.VanID = PI.VanID 
            and ISEx.ExitType = 'T_PatientIssue'
inner join db_iemr.t_itemstockentry ISE
			on ISEx.ItemStockEntryID = ISE.VanSerialNo
            and ISEx.VanID = ISE.VanID
inner join db_iemr.m_item ITM 
			on ISE.ItemID = ITM.ItemID
inner join db_iemr.m_itemcategory ITMC
			on ITM.ItemCategoryID = ITMC.ItemCategoryID
 
	WHERE DATE(ISEx.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
  -- WHERE DATE(ISEx.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PatientIssueExit','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_PhoneBlock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_PhoneBlock`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_PhoneBlock
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           31-10-2018
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_PhoneBlock
                                                from db_iemr t_PhoneBlock.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PhoneBlock','started',now());

INSERT INTO db_reporting.Fact_PhoneBlock
(
ID,
phoneNo,
NoOfNuisanceCall,
IsBlocked,
ProviderServiceMapID,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
LoadedBy,
LodadedDate

)
  SELECT

TPB.ID,
TPB.phoneNo,
TPB.NoOfNuisanceCall,
TPB.IsBlocked,
TPB.ProviderServiceMapID,
TPB.Deleted,
TPB.Processed,
TPB.CreatedBy,
TPB.CreatedDate,
TPB.ModifiedBy,
TPB.LastModDate,
 'SP_Load_Fact_PhoneBlock',
 now()

 FROM db_iemr.t_PhoneBlock TPB
      WHERE DATE(TPB.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
      -- WHERE DATE(TPB.CreatedDate)<CURDATE();

  insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PhoneBlock','completed',now());


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_PhyVitals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`localhost` PROCEDURE `SP_Load_Fact_PhyVitals`()
BEGIN
  insert into db_reporting.scheduler_status (proc_name, status ,time) 
  values('SP_Load_Fact_PhyVitals','Started',now());

 insert into db_reporting.fact_PhyVitals(
 BeneficiaryRegID ,
  BenVisitID ,
  ProviderServiceMapID ,
  VisitCode ,
  Temperature ,
  PulseRate ,
  RespiratoryRate ,
  SystolicBP_1stReading ,
  DiastolicBP_1stReading ,
AverageSystolicBP ,
  AverageDiastolicBP ,
  BloodPressureStatusID ,
  BloodPressureStatus ,
  BloodGlucose_Fasting  ,
  BloodGlucose_Random ,
   Deleted ,
  Processed ,
   VanSerialNo ,
  VanID ,
  VehicalNo ,
  ParkingPlaceID  ,
  SyncedBy ,
  SyncedDate ,
CreatedBy ,
Weight_Kg ,
Height_cm  ,
BMI ,
ClinicalObservation  ,
OtherSymptoms  ,
TobaccoUseStatus  ,
  AlcoholIntakeStatus ,fact_CreatedDate,LoadedBy,LodadedDate,createddate
 )
 
select V.BeneficiaryRegID ,
  V.BenVisitID ,
  V.ProviderServiceMapID ,
  V.VisitCode ,
  V.Temperature ,
  V.PulseRate ,
  V.RespiratoryRate ,
  V.SystolicBP_1stReading ,
  V.DiastolicBP_1stReading ,
   V.AverageSystolicBP ,
  V.AverageDiastolicBP ,
  V.BloodPressureStatusID ,
  V.BloodPressureStatus ,
  V.BloodGlucose_Fasting  ,
  V.BloodGlucose_Random ,
   V.Deleted ,
  V.Processed ,
   V.VanSerialNo ,
  V.VanID ,
  V.VehicalNo ,
  V.ParkingPlaceID  ,
  V.SyncedBy ,
  V.SyncedDate ,
   V.CreatedBy ,
      A.Weight_Kg ,
   A.Height_cm  ,
   A.BMI ,
   C.ClinicalObservation  ,
   C.OtherSymptoms  ,
   H.TobaccoUseStatus  ,
   H.AlcoholIntakeStatus  ,

   Replace(DATE(V.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_LabTestOrder',
  NOW(),   V.CreatedDate 
 from db_iemr.t_phy_vitals v
left join db_iemr.t_phy_anthropometry A on A.beneficiaryregid=V.beneficiaryregid and 
A.VisitCode=V.VisitCode
left join db_iemr.t_benclinicalobservation C on C.beneficiaryregid=V.beneficiaryregid and 
C.VisitCode=V.VisitCode
left join db_iemr.t_benpersonalhabit H on H.beneficiaryregid=V.beneficiaryregid and 
H.VisitCode=V.VisitCode
-- left join db_iemr.fact_benchiefcomplaint CC on CC.beneficiaryregid=V.beneficiaryregid and 
-- CC.visitid=V.visitid
  WHERE DATE(V.CreatedDate)=CURDATE() - INTERVAL 1 DAY;

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PhyVitals','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_PNCCare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_PNCCare`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_PNCCare
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_pnccare(db_reporting)
                                                 from  t_pnccare  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PNCCare','started',now());



  INSERT INTO db_reporting.fact_pnccare

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
VisitNo,
DeliveryTypeID,
DeliveryType,
DeliveryPlaceID,
DeliveryPlace,
OtherDeliveryPlace,
DateOfDelivery,
DeliveryComplicationID,
DeliveryComplication,
OtherDeliveryComplication,
PostpartumComplicationID,
PostpartumComplication,
PregOutcomeID,
PregOutcome,
PostNatalComplicationID,
PostNatalComplication,
OtherPostNatalComplication,
GestationID,
GestationName,
GestationalAgeOfNewborn,
BirthWeightOfNewborn,
NewBornHealthStatusID,
NewBornHealthStatus,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
PC.ID,
PC.BeneficiaryRegID,
PC.BenVisitID,
PC.ProviderServiceMapID,
PC.VisitCode,
PC.VisitNo,
PC.DeliveryTypeID,
PC.DeliveryType,
PC.DeliveryPlaceID,
PC.DeliveryPlace,
PC.OtherDeliveryPlace,
PC.DateOfDelivery,
PC.DeliveryComplicationID,
PC.DeliveryComplication,
PC.OtherDeliveryComplication,
PC.PostpartumComplicationID,
PC.PostpartumComplication,
PC.PregOutcomeID,
PC.PregOutcome,
PC.PostNatalComplicationID,
PC.PostNatalComplication,
PC.OtherPostNatalComplication,
PC.GestationID,
PC.GestationName,
PC.GestationalAgeOfNewborn,
PC.BirthWeightOfNewborn,
PC.NewBornHealthStatusID,
PC.NewBornHealthStatus,
PC.Deleted,
PC.Processed,
PC.CreatedBy,
PC.CreatedDate,
PC.ModifiedBy,
PC.LastModDate,
PC.VanSerialNo,
PC.VanID,
PC.VehicalNo,
PC.ParkingPlaceID,
PC.SyncedBy,
PC.SyncedDate,
  Replace(DATE(PC.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_PNCCare',
  NOW()
 FROM db_iemr.t_pnccare PC
 WHERE DATE(PC.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(PC.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PNCCare','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_PNCDiagnosis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_PNCDiagnosis`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_PNCDiagnosis
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           25-04-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_pncdiagnosis(db_reporting)
                                                 from  t_pncdiagnosis  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PNCDiagnosis','started',now());



  INSERT INTO db_reporting.fact_pncdiagnosis

(BeneficiaryRegID,
VisitCode,
ProviderServiceMapID,
VisitDate,
VisitCategory,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
ProvisionalDiagnosis,
ConfirmatoryDiagnosis,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

select 
PNCD.BeneficiaryRegID,
PNCD.VisitCode,
BVD.ProviderServiceMapID,
BVD.CreatedDate,
BVD.VisitCategory,
BVD.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
PNCD.ProvisionalDiagnosis,
PNCD.ConfirmatoryDiagnosis,
PNCD.Deleted,
PNCD.Processed,
PNCD.CreatedBy,
PNCD.CreatedDate,
PNCD.ModifiedBy,
PNCD.LastModDate,
PNCD.SyncedBy,
PNCD.SyncedDate,
Replace(DATE(PNCD.CreatedDate),'-','')AS dim_create_date,
'SP_Load_Fact_PNCDiagnosis',
NOW()
 from db_iemr.t_pncdiagnosis PNCD
inner join db_iemr.t_benvisitdetail BVD
	on BVD.BeneficiaryRegID = PNCD.BeneficiaryRegID
		and BVD.VisitCode = PNCD.VisitCode
inner join db_iemr.m_van VAN 
	on BVD.VanID = Van.VanID
WHERE DATE(PNCD.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(PNCD.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PNCDiagnosis','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_PrescribedDrug` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_PrescribedDrug`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_PrescribedDrug
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_prescribeddrug(db_reporting)
                                                 from  t_prescribeddrug  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PrescribedDrug','started',now());



  INSERT INTO db_reporting.fact_prescribeddrug

(PrescribedDrugID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
PrescriptionID,
DrugForm,
DrugID,
GenericDrugName,
DrugTradeOrBrandName,
DrugStrength,
Dose,
Route,
Frequency,
Duration,
DuartionUnit,
RelationToFood,
SpecialInstruction,
QtyPrescribed,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
RxD.PrescribedDrugID,
RxD.BeneficiaryRegID,
RxD.BenVisitID,
RxD.ProviderServiceMapID,
RxD.VisitCode,
RxD.PrescriptionID,
RxD.DrugForm,
RxD.DrugID,
RxD.GenericDrugName,
RxD.DrugTradeOrBrandName,
RxD.DrugStrength,
RxD.Dose,
RxD.Route,
RxD.Frequency,
RxD.Duration,
RxD.DuartionUnit,
RxD.RelationToFood,
RxD.SpecialInstruction,
RxD.QtyPrescribed,
RxD.Deleted,
RxD.Processed,
RxD.CreatedBy,
RxD.CreatedDate,
RxD.ModifiedBy,
RxD.LastModDate,
RxD.VanSerialNo,
RxD.VanID,
RxD.VehicalNo,
RxD.ParkingPlaceID,
RxD.SyncedBy,
RxD.SyncedDate,
  Replace(DATE(RxD.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_PrescribedDrug',
  NOW()
 FROM db_iemr.t_prescribeddrug RxD
 WHERE DATE(RxD.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(RxD.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_PrescribedDrug','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_Prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_Prescription`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_Prescription
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           03-01-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_Prescription(db_reporting)
                                                 from  t_Prescription  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_Prescription','started',now());



  INSERT INTO db_reporting.fact_prescription

(PrescriptionID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
VisitCode,
DiagnosisProvided,
DiagnosisProvided_SCTCode,
DiagnosisProvided_SCTTerm,
Instruction,
ConfirmatoryDiagnosis,
ExternalInvestigation,
Remarks,
ReferredToInstituteID,
ReferredToInstitute,
RefrredToAdditionalService,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
 Rx.PrescriptionID,
Rx.BeneficiaryRegID,
Rx.BenVisitID,
Rx.ProviderServiceMapID,
Rx.VisitCode,
Rx.DiagnosisProvided,
Rx.DiagnosisProvided_SCTCode,
Rx.DiagnosisProvided_SCTTerm,
Rx.Instruction,
Rx.ConfirmatoryDiagnosis,
Rx.ExternalInvestigation,
Rx.Remarks,
Rx.ReferredToInstituteID,
Rx.ReferredToInstitute,
Rx.RefrredToAdditionalService,
Rx.Deleted,
Rx.Processed,
Rx.CreatedBy,
Rx.CreatedDate,
Rx.ModifiedBy,
Rx.LastModDate,
Rx.VanSerialNo,
Rx.VanID,
Rx.VehicalNo,
Rx.ParkingPlaceID,
Rx.SyncedBy,
Rx.SyncedDate,
  Replace(DATE(Rx.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_Prescription',
  NOW()
 FROM db_iemr.t_prescription Rx
 WHERE DATE(Rx.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 -- WHERE DATE(Rx.CreatedDate)<CURDATE();

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_Prescription','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_SchemeService` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_SchemeService`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_SchemeService
--    Project/Product Name          :           Piramal
--    Created By                    :           Dharmendra
--    Created Date                  :           28-05-2017
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           TO Load Fact_SchemeService
                                                from db_iemr t_SchemeService.


--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_SchemeService','started',now());

INSERT INTO db_reporting.Fact_SchemeService
(
 SchemeServiceID,
 RequestID,
 BeneficiaryRegID,
 BenCallID,
 SchemeID,
 SchemeName,
 SchemeDesc,
 Remarks,
 ProviderServiceMapID,
 CreatedBy,
 CreatedDate,
 ModifiedBy,
 LastModDate,
 fact_CreatedDate,
 LoadedBy,
 LodadedDate

)
  SELECT

 TSS.SchemeServiceID,
 TSS.RequestID,
 TSS.BeneficiaryRegID,
 TSS.BenCallID,
 MS.SchemeID,
 MS.SchemeName,
 MS.SchemeDesc,
 TSS.Remarks,
 MS.ProviderServiceMapID,
 TSS.CreatedBy,
 TSS.CreatedDate,
 TSS.ModifiedBy,
 TSS.LastModDate,
 Replace(DATE(TSS.CreatedDate),'-','')AS fact_CreatedDate,
 'SP_Load_Fact_SchemeService',
 now()

 FROM db_iemr.t_SchemeService TSS
      LEFT  JOIN db_iemr.m_scheme MS ON MS.SchemeID = TSS.SchemeID
      WHERE DATE(TSS.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
      -- WHERE DATE(TSS.CreatedDate)<CURDATE();

  insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_SchemeService','completed',now());


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Load_Fact_TMrequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser1`@`%` PROCEDURE `SP_Load_Fact_TMrequest`()
BEGIN

/********************************************************************************************************************

--    SP/Function Name              :           SP_Load_Fact_TMrequest
--    Project/Product Name          :           Piramal
--    Created By                    :           Prateek
--    Created Date                  :           19-02-2019
--    Reviewed By                   :
--    Reviewed Date                 :           DD-MMM-YYYY
--    Purpose                       :           To load fact_TMRequest(db_reporting)
                                                 from  t_TMRequest  (db_iemr)
												

--    Version History               :
---------------------------------------------------------------------------------------------------------------------
--    Version#          TFS_ID#           Modified By       Modified Date                 Purpose
---------------------------------------------------------------------------------------------------------------------
      1.0         - Initial Write         - XYZ             -  DD-MMM-YYYY             Initial Write

*********************************************************************************************************************/
insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_TMrequest','started',now());



  INSERT INTO db_reporting.fact_TMRequest

(TMRequestID, 
BeneficiaryRegID, 
BenVisitID, 
VisitCode, 
VisitNo, 
SpecializationID, 
Specialization, 
UserID, 
UserName, 
Name, 
RequestDate, 
Duration_minute, 
Status, 
ConsultationStats, 
BeneficiaryArrivalTime, 
Consultation_FirstStart, 
Consultation_LastEnd, 
ProviderServiceMapID, 
VanID, 
VanName, 
VehicalNo,
ParkingPlaceID, 
Deleted, 
Processed, 
CreatedBy, 
CreatedDate, 
ModifiedBy, 
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
TMR.TMRequestID,
TMR.BeneficiaryRegID,
TMR.BenVisitID,
TMR.VisitCode,
BVD.VisitNo,
TMR.SpecializationID,
SP.Specialization,
TMR.UserID,
USR.UserName,
CONCAT(COALESCE(USR.FirstName, '' ),' ',COALESCE(USR.MiddleName, '' ),' ',COALESCE(USR.LastName, '')) AS Name,
TMR.RequestDate,
TMR.Duration_minute,
TMR.Status,
TMR.ConsultationStats,
TMR.BeneficiaryArrivalTime,
TMR.Consultation_FirstStart,
TMR.Consultation_LastEnd,
TMR.ProviderServiceMapID,
TMR.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
TMR.Deleted,
TMR.Processed,
TMR.CreatedBy,
TMR.CreatedDate,
TMR.ModifiedBy,
TMR.LastModDate,
Replace(DATE(TMR.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_TMrequest',
NOW()
FROM db_iemr.t_tmrequest TMR
inner join db_iemr.m_specialization SP on TMR.SpecializationID = SP.SpecializationID
inner join db_iemr.m_user USR on TMR.UserID = USR.UserID
inner join db_iemr.t_benvisitdetail BVD on TMR.VisitCode = BVD.VisitCode and TMR.BeneficiaryRegID = BVD.BeneficiaryRegID
left Join db_iemr.m_Van VAN on TMR.VanID = VAN.VanID 
 WHERE DATE(TMR.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
-- WHERE DATE(TMR.CreatedDate)<CURDATE();



update db_reporting.fact_tmrequest FTMR
inner join db_iemr.t_tmrequest TMR on FTMR.TMRequestID = TMR.TMRequestID
set 
FTMR.Status = TMR.Status,
FTMR.ConsultationStats = TMR.ConsultationStats,
FTMR.BeneficiaryArrivalTime = TMR.BeneficiaryArrivalTime,
FTMR.Consultation_FirstStart = TMR.Consultation_FirstStart,
FTMR.Consultation_LastEnd = TMR.Consultation_LastEnd,
FTMR.ModifiedBy = TMR.ModifiedBy,
FTMR.LastModDate = TMR.LastModDate,
FTMR.LodadedDate = now()
where 
FTMR.LodadedDate < TMR.LastModDate ;

 insert into db_reporting.scheduler_status (proc_name, status ,time) values('SP_Load_Fact_TMrequest','completed',now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PatientAttended` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_PatientAttended`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
select
BVD.BenVisitID,
BVD.VisitCode,
BVD.BeneficiaryRegID,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, BVD.CreatedDate) AS Age,
BVD.VisitNo,
BVD.CreatedDate,
BVD.VanID,
BVD.VehicalNo

from db_reporting.fact_benvisitdetail BVD
left join db_reporting.dim_beneficiary BEN on BVD.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(BVD.createddate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and BVD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or BVD.VanID = P_VanID);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PatientInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_PatientInfo`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN

select
BVD.BenVisitID,
BVD.VisitCode,
BVD.createddate as VisitDate,
BVD.BeneficiaryRegID,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, BVD.CreatedDate) AS Age,
BEN.CreatedDate as RegistrationDate,
BEN.PreferredPhoneNum,
BEN.FatherName,
BVD.VisitCategory,
BVD.VisitNo,
BVD.CreatedDate,
BVD.VanID,
BVD.VanName,
BVD.VehicalNo
from db_reporting.fact_benvisitdetail BVD
left join db_reporting.dim_beneficiary BEN on BVD.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(BVD.createddate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and BVD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or BVD.VanID = P_VanID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PatientVisitInfo_SPARSHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`localhost` PROCEDURE `SP_PatientVisitInfo_SPARSHA`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN

select
BVD.BenVisitID,
BVD.VisitCode,
BVD.createddate as VisitDate,
BVD.BeneficiaryRegID,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.Gender Ben_gender,
DATE(BEN.DOB),
TIMESTAMPDIFF(YEAR, BEN.DOB, BVD.CreatedDate) AS Ben_Age,
BEN.CreatedDate as RegistrationDate,
-- BEN.PreferredPhoneNum,
-- BEN.FatherName,
BVD.VisitReason,
BVD.VisitCategory,
BVD.VisitNo,
BVD.CreatedDate,
BVD.VanID,
BVD.VanName,
BVD.VehicalNo,
BVD.CreatedBy,
BVD.ParkingPlaceID,
 BEN.occupation,
BEN.incomeStatus,
BEN.community,BEN.religion,BEN.MaritalStatus,
BVD.PregnancyStatus,BVD.RCHID
from db_reporting.fact_benvisitdetail BVD
left join db_reporting.dim_beneficiary BEN on BVD.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(BVD.createddate) between date(P_CallDateFrom) and date(P_CallDateTo) 
                and BVD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or BVD.VanID = P_VanID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PhyVitals_SPARSHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`localhost` PROCEDURE `SP_PhyVitals_SPARSHA`(IN P_CallDateFrom DATETIME, 
IN P_CallDateTo DATETIME, 
IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
 

SELECT
 RxD.BeneficiaryRegID ,
   RxD.BenVisitID ,
   RxD.ProviderServiceMapID ,
   RxD.VisitCode ,
   RxD.Temperature ,
   RxD.PulseRate ,
   RxD.RespiratoryRate ,
   RxD.SystolicBP_1stReading ,
   RxD.DiastolicBP_1stReading ,
 RxD.AverageSystolicBP ,
   RxD.AverageDiastolicBP ,
   RxD.BloodPressureStatusID ,
   RxD.BloodPressureStatus ,
   RxD.BloodGlucose_Fasting  ,
   RxD.BloodGlucose_Random ,
--   Deleted ,
 -- Processed ,
    RxD.VanSerialNo ,
   RxD.VanID ,
  -- VehicalNo ,
 -- ParkingPlaceID  ,
 -- SyncedBy ,
 -- SyncedDate ,
-- CreatedBy ,
 RxD.Weight_Kg ,
 RxD.Height_cm  ,
 RxD.BMI ,
 RxD.ClinicalObservation  ,
 RxD.OtherSymptoms  ,
 RxD.TobaccoUseStatus  ,
   RxD.AlcoholIntakeStatus,
  CC.ChiefComplaint
 FROM db_reporting.fact_PhyVitals RxD
 left join db_reporting.fact_benchiefcomplaint CC on CC.visitcode=RxD.visitcode
 and Rxd.BeneficiaryRegid=CC.BeneficiaryRegid
where date(RxD.CreatedDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and rxd.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or RxD.VanID = P_VanID);

 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PNCHighRisk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_PNCHighRisk`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
SELECT 
PNCD.FactPNCDiagnosisID, 
PNCD.BeneficiaryRegID, 
PNCD.ProviderServiceMapID, 
PNCD.VisitCode,
PNCD.VisitDate,
PNCD.ProvisionalDiagnosis,
PNCD.ConfirmatoryDiagnosis,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, PNCD.VisitDate) AS Age,
BEN.PreferredPhoneNum,
PNCD.VanID, 
PNCD.VanName,
PNCD.VehicalNo,
PNCD.ParkingPlaceID,
BRD.referredToInstituteName,
BRD.ServiceName,
PNCD.CreatedDate
 FROM db_reporting.fact_pncdiagnosis PNCD
	left join db_reporting.dim_beneficiary BEN on PNCD.BeneficiaryRegID = BEN.BeneficiaryRegID
	left join db_reporting.fact_benreferdetails BRD on PNCD.BeneficiaryRegID = BRD.BeneficiaryRegID 
		and PNCD.VisitCode = BRD.VisitCode
where date(PNCD.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and PNCD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or PNCD.VanID = P_VanID);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PrescribedDrug_SPARSHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`localhost` PROCEDURE `SP_PrescribedDrug_SPARSHA`(IN P_CallDateFrom DATETIME, 
IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN
 
SELECT
 
RxD.BeneficiaryRegID,
RxD.BenVisitID,
RxD.ProviderServiceMapID,
RxD.VisitCode,
RxD.GenericDrugName,
RxD.DrugStrength,
RxD.QtyPrescribed,
RxD.VanSerialNo,
RxD.VanID,
-- RxD.VehicalNo,
-- RxD.ParkingPlaceID,
 
P.DiagnosisProvided,P.ReferredToInstituteID,P.ReferredToInstitute
  
  FROM db_reporting.fact_prescribeddrug RxD
 left join db_reporting.fact_prescription P on p.PrescriptionID=RxD.PrescriptionID
  and p.benvisitid=RxD.benvisitid
where date(RxD.CreatedDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and RxD.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or RxD.VanID = P_VanID);

 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `sp_test`()
begin

insert into db_reporting.scheduler_status (proc_name, status ,time) values('eventStarted','started',now());

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TestConducted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_TestConducted`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ProviderServiceMapID INT, IN P_VanID INT)
BEGIN

select
LTO.ID,
LTO.VisitCode,
LTO.BeneficiaryRegID,
LTO.VisitDate,
BEN.PermDistrict,
BEN.PermSubDistrict,
BEN.PermVillage,
BEN.PermServicePoint,
BEN.BeneficiaryID,
CONCAT(COALESCE(BEN.FirstName, '' ),' ',COALESCE(BEN.MiddleName, '' ),' ',COALESCE(BEN.LastName, '')) AS Name,
BEN.Gender,
BEN.DOB,
TIMESTAMPDIFF(YEAR, BEN.DOB, LTO.VisitDate) AS Age,
LTO.VisitCategory,
LTO.ProcedureName,
LTO.CreatedDate,
LTO.VanID,
LTO.VanName,
LTO.VehicalNo

from db_reporting.fact_labtestorder LTO
left join db_reporting.dim_beneficiary BEN on LTO.BeneficiaryRegID = BEN.BeneficiaryRegID
where date(LTO.VisitDate) between date(P_CallDateFrom) and date(P_CallDateTo) 
	and LTO.ProviderServiceMApID = P_ProviderServiceMapID
    and (P_VanID is null or LTO.VanID = P_VanID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TMDailyReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_TMDailyReport`(IN P_CallDate DATETIME, IN P_ParkingPlaceID INT)
BEGIN
select monthdata.vanid,monthdata.vanname,count,revisitcount,monthcount,revisitmonthcount from (select vanid,vanname,DATE_FORMAT(RequestDate,'%b-%y') datemonth,count(*) monthcount,count(case when VisitNo>1 then 1 end) revisitmonthcount from db_reporting.fact_tmrequest
where Status in ('A','N','D') and month(requestdate)=month(P_CallDate) and year(requestdate)=year(P_CallDate) and parkingplaceid=P_ParkingPlaceID
group by vanid,year(requestdate),month(requestdate)) monthdata


left join (select vanid,vanname,date(requestdate) date,count(*) count,count(case when VisitNo>1 then 1 end) revisitcount from db_reporting.fact_tmrequest
where Status in ('A','N','D') and date(requestdate)=date(P_CallDate) and parkingplaceid=P_ParkingPlaceID
group by vanid,date(requestdate)) daydata  on daydata.vanid=monthdata.vanid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TMMonthlyReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_TMMonthlyReport`(IN P_CallDateFrom DATETIME, 
 IN P_CallDateTo DATETIME, IN P_ParkingPlaceID INT,IN P_VanID INT)
BEGIN

select * from (
select "Total Consultations"  Indicator,DATE_FORMAT(RequestDate,'%b-%y') date,count(Fact_TMRequestID) count 
 from db_reporting.fact_tmrequest tmreq
left join db_reporting.dim_beneficiary dimben on tmreq.BeneficiaryRegID=dimben.BeneficiaryRegID
 where tmreq.Status in ('A','N','D') and
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
 and     (P_VanID is null or tmreq.VanID = P_VanID)
group by year(requestdate),month(requestdate)
) tc union all

(
select "Re-Consultations" Indicator,DATE_FORMAT(RequestDate,'%b-%y') date,count(case when VisitNo>1 then 1 end) count  from db_reporting.fact_tmrequest tmreq
left join db_reporting.dim_beneficiary dimben on tmreq.BeneficiaryRegID=dimben.BeneficiaryRegID
 where tmreq.Status in ('A','N','D') and
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
  and     (P_VanID is null or tmreq.VanID = P_VanID)
group by year(requestdate),month(requestdate)
) union all(

select concat("Genderwise - ",Gender) Indicator,DATE_FORMAT(RequestDate,'%b-%y') date,count(Fact_TMRequestID) count from db_reporting.fact_tmrequest tmreq
left join db_reporting.dim_beneficiary dimben on tmreq.BeneficiaryRegID=dimben.BeneficiaryRegID
 where tmreq.Status in ('A','N','D') and
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
  and     (P_VanID is null or tmreq.VanID = P_VanID)
group by GenderId,year(RequestDate),month(RequestDate)
)  union all(


select 
case
   when age_c <1 then 'Age group - Under 1 yr'
   when age_c between 1 and 5 then 'Age group - 1-5 yrs'
   when age_c between 6 and 15 then 'Age group - 6-15 yrs'
   when age_c between 16 and 45 then 'Age group - 16-45 yrs'
   else 'Age group - > 45 yrs'
end as Indicator,DATE_FORMAT(RequestDate,'%b-%y') date,
count(*) count
from 
        (select dob,requestdate,floor(DATEDIFF(requestdate,dob)/ 365.25) age_c from db_reporting.fact_tmrequest tmreq
left join db_reporting.dim_beneficiary dimben on tmreq.BeneficiaryRegID=dimben.BeneficiaryRegID
 where tmreq.Status in ('A','N','D') and
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
  and     (P_VanID is null or tmreq.VanID = P_VanID)
) asd group by case
   when age_c <1 then 'Age group - Under 1 yr'
   when age_c between 1 and 5 then 'Age group - 1-5 yrs'
   when age_c between 6 and 15 then 'Age group - 6-15 yrs'
   when age_c between 16 and 45 then 'Age group - 16-45 yrs'
   else ' Age group - > 45 yrs'
 END,year(RequestDate),month(RequestDate)
 )  union all(

select concat("Income wise - ",ifnull(incomeStatus,"Others/NA")) Indicator,DATE_FORMAT(RequestDate,'%b-%y') date,count(Fact_TMRequestID) from db_reporting.fact_tmrequest tmreq
left join db_reporting.dim_beneficiary dimben on tmreq.BeneficiaryRegID=dimben.BeneficiaryRegID
 where tmreq.Status in ('A','N','D') and
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
  and     (P_VanID is null or tmreq.VanID = P_VanID)
group by incomeStatus,year(RequestDate),month(RequestDate)
)  union all(
select concat("Specialization wise - ",Specialization) Indicator,DATE_FORMAT(RequestDate,'%b-%y') date,count(Fact_TMRequestID) count from db_reporting.fact_tmrequest tmreq
left join db_reporting.dim_beneficiary dimben on tmreq.BeneficiaryRegID=dimben.BeneficiaryRegID
 where tmreq.Status in ('A','N','D') and
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
   and     (P_VanID is null or tmreq.VanID = P_VanID)
group by SpecializationID,year(RequestDate),month(RequestDate)
) ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TotalConsultation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `SP_TotalConsultation`(IN P_CallDateFrom DATETIME, IN P_CallDateTo DATETIME, IN P_ParkingPlaceID INT)
BEGIN
SELECT vanid,vanname,DATE_FORMAT(RequestDate,'%b-%y') date ,count(Fact_TMRequestID) count
FROM db_reporting.fact_tmrequest
 where Status in ('A','N','D') and
 
( year(RequestDate) > year(P_CallDateFrom) or(year(RequestDate) = year(P_CallDateFrom) and  month(RequestDate) >= month(P_CallDateFrom)) )and
 (year(RequestDate) < year(P_CallDateTo) or(year(RequestDate) = year(P_CallDateTo) and  month(RequestDate) <= month(P_CallDateTo)) )and
 ParkingPlaceID=P_ParkingPlaceID
 group by vanid,year(RequestDate),month(RequestDate) ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `temp_LoadInventoryReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masteruser`@`%` PROCEDURE `temp_LoadInventoryReport`()
BEGIN

truncate db_reporting.fact_itemstockentry;


  INSERT INTO db_reporting.fact_itemstockentry

(ItemStockEntryID,
FacilityID,
FacilityName,
FacilityDesc,
FacilityCode,
FacilityTypeID,
IsMainFacility,
MainFacilityID,
ItemID,
ItemName,
ItemDesc,
ItemCategoryID,
ItemCategoryName,
AlertBeforeDays,
Strength,
BatchNo,
Quantity,
QuantityInHand,
UnitCostPrice,
ExpiryDate,
EntryTypeID,
EntryType,
ProviderServiceMapID,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ISE.ItemStockEntryID,
ISE.FacilityID,
FAC.FacilityName,
FAC.FacilityDesc,
FAC.FacilityCode,
FAC.FacilityTypeID,
FAC.IsMainFacility,
FAC.MainFacilityID,
ISE.ItemID,
ITM.ItemName,
ITM.ItemDesc,
ITM.ItemCategoryID,
ITMC.ItemCategoryName,
ITMC.AlertBeforeDays,
ITM.Strength,
ISE.BatchNo,
ISE.Quantity,
ISE.QuantityInHand,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISE.EntryTypeID,
ISE.EntryType,
ISE.ProviderServiceMapID,
ISE.Deleted,
ISE.Processed,
ISE.CreatedBy,
ISE.CreatedDate,
ISE.ModifiedBy,
ISE.LastModDate,
  Replace(DATE(ISE.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_ItemStockEntry',
  NOW()
 FROM db_iemr.t_ItemStockEntry ISE
 inner join db_iemr.m_item ITM on ISE.ItemID = ITM.ItemID
 inner join db_iemr.m_facility FAC on ISE.FacilityID = FAC.FacilityID
 inner join db_iemr.m_itemcategory ITMC on ITM.ItemCategoryID = ITMC.ItemCategoryID
 
        -- WHERE DATE(ISE.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
   WHERE DATE(ISE.CreatedDate)<CURDATE();
   
   

/* */


truncate db_reporting.fact_itemstockexit;

 INSERT INTO db_reporting.fact_itemstockexit

(ItemStockExitID,
ItemStockEntryID,
FacilityID,
FacilityName,
FacilityDesc,
FacilityCode,
FacilityTypeID,
IsMainFacility,
MainFacilityID,
ItemID,
ItemName,
ItemDesc,
ItemCategoryID,
ItemCategoryName,
Strength,
BatchNo,
Quantity,
QuantityInHand,
UnitCostPrice,
ExpiryDate,
EntryTypeID,
EntryType,
QuantityGiven,
ProviderServiceMapID,
ExitTypeID,
ExitType,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ISEx.ItemStockExitID,
ISE.ItemStockEntryID,
ISE.FacilityID,
FAC.FacilityName,
FAC.FacilityDesc,
FAC.FacilityCode,
FAC.FacilityTypeID,
FAC.IsMainFacility,
FAC.MainFacilityID,
ISE.ItemID,
ITM.ItemName,
ITM.ItemDesc,
ITM.ItemCategoryID,
ITMC.ItemCategoryName,
ITM.Strength,
ISE.BatchNo,
ISE.Quantity,
ISE.QuantityInHand,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISE.EntryTypeID,
ISE.EntryType,
ISEx.Quantity,
ISEx.ProviderServiceMapID,
ISEx.ExitTypeID,
ISEx.ExitType,
ISEx.Deleted,
ISEx.Processed,
ISEx.CreatedBy,
ISEx.CreatedDate,
ISEx.ModifiedBy,
ISEx.LastModDate,
  Replace(DATE(ISEx.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_ItemStockExit',
  NOW()
 FROM db_iemr.t_ItemStockExit ISEx
 inner join db_iemr.t_ItemStockEntry ISE on ISEx.ItemStockEntryID = ISE.ItemStockEntryID
--  inner join db_iemr.t_ItemStockEntry ISE on ISEx.ItemStockEntryID = ISE.VanSerialNo and ISEx.VanID = ISE.VanID
 inner join db_iemr.m_item ITM on ISE.ItemID = ITM.ItemID
 inner join db_iemr.m_facility FAC on ISE.FacilityID = FAC.FacilityID
 inner join db_iemr.m_itemcategory ITMC on ITM.ItemCategoryID = ITMC.ItemCategoryID
 
        -- WHERE DATE(ISEx.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
   WHERE DATE(ISEx.CreatedDate)<CURDATE();
   
/* */

truncate db_reporting.fact_patientissueexit;

  INSERT INTO db_reporting.fact_patientissueexit

(ItemStockExitID,
ItemStockEntryID,
ItemID,
ItemName,
ItemDesc,
ItemCategoryID,
ItemCategoryName,
Strength,
BatchNo,
Quantity,
QuantityInHand,
UnitCostPrice,
ExpiryDate,
QuantityGiven,
ProviderServiceMapID,
ExitTypeID,
ExitType,
PatientIssueID,
BeneficiaryRegID,
VisitID,
VisitCode,
FacilityID,
PatientName,
Age,
Gender,
DoctorName,
PrescriptionID,
Reference,
IssueType,
Status,
PatientIssueDeleted,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
ISEx.ItemStockExitID,
ISE.ItemStockEntryID,
ISE.ItemID,
ITM.ItemName,
ITM.ItemDesc,
ITM.ItemCategoryID,
ITMC.ItemCategoryName,
concat(ITM.Strength , ' ', UOM.UOMName ) as Strength,
ISE.BatchNo,
ISE.Quantity,
ISE.QuantityInHand,
ISE.UnitCostPrice,
ISE.ExpiryDate,
ISEx.Quantity,
ISEx.ProviderServiceMapID,
ISEx.ExitTypeID,
ISEx.ExitType,
PI.PatientIssueID,
PI.BeneficiaryRegID,
PI.BenVisitID,
PI.VisitCode,
PI.FacilityID,
PI.PatientName,
PI.Age,
PI.Gender,
PI.DoctorName,
PI.PrescriptionID,
PI.Reference,
PI.IssueType,
PI.Status,
PI.Deleted,
ISEx.Deleted,
ISEx.Processed,
ISEx.CreatedBy,
ISEx.CreatedDate,
ISEx.ModifiedBy,
ISEx.LastModDate,
  Replace(DATE(ISEx.CreatedDate),'-','')AS fact_CreatedDate,
  'SP_Load_Fact_PatientIssueExit',
  NOW()
 FROM db_iemr.t_itemstockexit ISEx
inner join db_iemr.t_PatientIssue PI 
                        on ISEx.ExitTypeID = PI.PatientIssueID
--                      on ISEx.ExitTypeID = PI.VanSerialNo
--                      and ISEx.VanID = PI.VanID 
            and ISEx.ExitType = 'T_PatientIssue'
left join db_iemr.t_itemstockentry ISE
                        on ISEx.ItemStockEntryID = ISE.ItemStockEntryID
--                      on ISEx.ItemStockEntryID = ISE.VanSerialNo
--             and ISEx.VanID = ISE.VanID
left join db_iemr.m_item ITM 
                        on ISE.ItemID = ITM.ItemID
left join db_iemr.m_itemcategory ITMC
                        on ITM.ItemCategoryID = ITMC.ItemCategoryID
left join db_iemr.m_uom UOM 
                        on ITM.UOMID = UOM.UOMID
 
--      WHERE DATE(ISEx.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
   WHERE DATE(ISEx.CreatedDate)<CURDATE();
   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `temp_LoadTMReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `temp_LoadTMReport`()
BEGIN

truncate db_reporting.Fact_BenChiefComplaint;
  
INSERT INTO db_reporting.Fact_BenChiefComplaint

(ID,
BeneficiaryRegID,
BenVisitID,
ProviderServiceMapID,
ServiceID,
VisitCode,
ChiefComplaintID,
ChiefComplaint,
SCTDesID,
SCTCode,
SCTChiefComplaint,
Duration,
UnitOfDuration,
Description,
Deleted,
Processed,
CreatedBy,
CreatedDate,
ModifiedBy,
LastModDate,
VanSerialNo,
VanID,
VanName,
VehicalNo,
ParkingPlaceID,
SyncedBy,
SyncedDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

select 
BCC.ID, 
BCC.BeneficiaryRegID, 
BCC.BenVisitID, 
BCC.ProviderServiceMapID,
PSM.ServiceID,  
BCC.VisitCode, 
BCC.ChiefComplaintID, 
BCC.ChiefComplaint, 
BCC.SCTDesID, 
BCC.SCTCode, 
BCC.SCTChiefComplaint, 
BCC.Duration, 
BCC.UnitOfDuration, 
BCC.Description, 
BCC.Deleted, 
BCC.Processed, 
BCC.CreatedBy, 
BCC.CreatedDate, 
BCC.ModifiedBy, 
BCC.LastModDate, 
BCC.VanSerialNo, 
BCC.VanID, 
V.VanName,  
V.VehicalNo, 
V.ParkingPlaceID, 
BCC.SyncedBy, 
BCC.SyncedDate,
Replace(DATE(BCC.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_BenChiefComplaint',
NOW()
from db_iemr.t_BenChiefComplaint BCC
inner join db_iemr.m_Van V on BCC.VanID = V.VanID
inner join db_iemr.m_providerservicemapping PSM on BCC.ProviderServiceMapID = PSM.ProviderServiceMapID
-- WHERE DATE(BCC.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 WHERE DATE(BCC.CreatedDate)<CURDATE();
 
 
truncate   db_reporting.fact_TMRequest;
  
INSERT INTO db_reporting.fact_TMRequest

(TMRequestID, 
BeneficiaryRegID, 
BenVisitID, 
VisitCode, 
VisitNo, 
SpecializationID, 
Specialization, 
UserID, 
UserName, 
Name, 
RequestDate, 
Duration_minute, 
Status, 
ConsultationStats, 
BeneficiaryArrivalTime, 
Consultation_FirstStart, 
Consultation_LastEnd, 
ProviderServiceMapID, 
VanID, 
VanName, 
VehicalNo,
ParkingPlaceID, 
Deleted, 
Processed, 
CreatedBy, 
CreatedDate, 
ModifiedBy, 
LastModDate,
fact_CreatedDate,
LoadedBy,
LodadedDate)

SELECT
TMR.TMRequestID,
TMR.BeneficiaryRegID,
TMR.BenVisitID,
TMR.VisitCode,
BVD.VisitNo,
TMR.SpecializationID,
SP.Specialization,
TMR.UserID,
USR.UserName,
CONCAT(COALESCE(USR.FirstName, '' ),' ',COALESCE(USR.MiddleName, '' ),' ',COALESCE(USR.LastName, '')) AS Name,
TMR.RequestDate,
TMR.Duration_minute,
TMR.Status,
TMR.ConsultationStats,
TMR.BeneficiaryArrivalTime,
TMR.Consultation_FirstStart,
TMR.Consultation_LastEnd,
TMR.ProviderServiceMapID,
TMR.VanID,
VAN.VanName,
VAN.VehicalNo,
VAN.ParkingPlaceID,
TMR.Deleted,
TMR.Processed,
TMR.CreatedBy,
TMR.CreatedDate,
TMR.ModifiedBy,
TMR.LastModDate,
Replace(DATE(TMR.CreatedDate),'-','')AS fact_CreatedDate,
'SP_Load_Fact_TMrequest',
NOW()
FROM db_iemr.t_tmrequest TMR
inner join db_iemr.m_specialization SP on TMR.SpecializationID = SP.SpecializationID
inner join db_iemr.m_user USR on TMR.UserID = USR.UserID
inner join db_iemr.t_benvisitdetail BVD on TMR.VisitCode = BVD.VisitCode and TMR.BeneficiaryRegID = BVD.BeneficiaryRegID
left Join db_iemr.m_Van VAN on TMR.VanID = VAN.VanID 
-- WHERE DATE(TMR.CreatedDate)=CURDATE() - INTERVAL 1 DAY;
 WHERE DATE(TMR.CreatedDate)<CURDATE();


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `assam_104`
--

/*!50001 DROP VIEW IF EXISTS `assam_104`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`piramaldev`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `assam_104` AS (select cast(`t`.`CreatedDate` as date) AS `Date`,count(distinct `t`.`ReceivedAgentID`) AS `Agent_Loggedin`,count(distinct (case when ((`t`.`ReceivedRoleName` like '%HAO%') and (`t`.`IsOutbound` is false) and (`t`.`CallTypeID` is not null)) then `t`.`BenCallID` end)) AS `Inbound Calls`,count(distinct (case when (`t`.`IsOutbound` is true) then `t`.`CallID` end)) AS `Outbound Calls`,(count(distinct (case when ((`t`.`ReceivedRoleName` like '%HAO%') and (`t`.`IsOutbound` is false) and (`t`.`CallTypeID` is not null)) then `t`.`BenCallID` end)) + count(distinct (case when (`t`.`IsOutbound` is true) then `t`.`CallID` end))) AS `Total Calls`,count(distinct (case when (`m`.`CallType` like '%Grievance%') then `t`.`CallID` end)) AS `Grievance Received`,avg((case when ((`m`.`CallGroupType` in ('Valid','Transfer')) and (`t`.`ReceivedRoleName` like '%HAO%')) then timestampdiff(SECOND,`t`.`CallTime`,`t`.`CallEndTime`) end)) AS `Average Call Handling Time` from ((`db_iemr`.`t_bencall` `t` left join `db_iemr`.`m_calltype` `m` on((`m`.`CallTypeID` = `t`.`CallTypeID`))) left join `db_iemr`.`t_feedback` `f` on((`f`.`BenCallID` = `t`.`BenCallID`))) group by cast(`t`.`CreatedDate` as date)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fac_bencall`
--

/*!50001 DROP VIEW IF EXISTS `fac_bencall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`masteruser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `fac_bencall` AS select `dben`.`PermDistrict` AS `PermDistrict`,`fbc`.`CallSubTypeName` AS `CallSubTypeName`,count(`fbc`.`BenCallID`) AS `count(fbc.BenCallID)` from (`fact_bencall` `fbc` join `dim_beneficiary` `dben` on((`fbc`.`BeneficiaryRegID` = `dben`.`BeneficiaryRegID`))) where (`fbc`.`ProviderServiceMapID` = 1247) group by `dben`.`PermDistrict`,`fbc`.`CallSubTypeName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sanjeevani_dashboard`
--

/*!50001 DROP VIEW IF EXISTS `sanjeevani_dashboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`piramaldev`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sanjeevani_dashboard` AS (select `vital`.`CurrDistrict` AS `CurrDistrict`,`vital`.`CreatedBy` AS `CreatedBy`,`vital`.`VisitCode` AS `VisitCode`,`vital`.`servicePoint` AS `servicePoint`,`vital`.`ProviderServiceMapID` AS `ProviderServiceMapID`,`vital`.`VisitCategory` AS `VisitCategory`,`vital`.`visit_date` AS `visit_date`,`vital`.`visit_time` AS `visit_time`,`vital`.`visit_month` AS `visit_month`,`vital`.`visit_year` AS `visit_year`,`vital`.`beneficiary_id` AS `beneficiary_id`,`vital`.`ben_name` AS `ben_name`,`vital`.`FirstName` AS `FirstName`,`vital`.`father_name` AS `father_name`,`vital`.`spouse_name` AS `spouse_name`,`vital`.`ben_phone_no` AS `ben_phone_no`,`vital`.`New/Repeat_visit` AS `New/Repeat_visit`,`vital`.`registrationDate` AS `registrationDate`,`vital`.`ben_dob` AS `ben_dob`,`vital`.`age_part1` AS `age_part1`,`vital`.`age_part2` AS `age_part2`,`vital`.`ben_gender` AS `ben_gender`,`vital`.`maritalstatus` AS `maritalstatus`,`vital`.`community` AS `community`,`vital`.`religion` AS `religion`,`vital`.`incomestatus` AS `incomestatus`,`vital`.`Weight_Kg` AS `Weight_Kg`,`vital`.`Height_cm` AS `Height_cm`,`vital`.`BMI` AS `BMI`,`vital`.`WaistCircumference_cm` AS `WaistCircumference_cm`,`vital`.`ANC/PNC` AS `ANC/PNC`,`vital`.`LMP_Date` AS `LMP_Date`,`vital`.`EDD` AS `EDD`,`vital`.`GestationalAge` AS `GestationalAge`,`vital`.`Temperature` AS `Temperature`,`vital`.`PulseRate` AS `PulseRate`,`vital`.`SystolicBP_1stReading` AS `SystolicBP_1stReading`,`vital`.`DiastolicBP_1stReading` AS `DiastolicBP_1stReading`,`vital`.`DiagnosisProvided1` AS `DiagnosisProvided1`,`vital`.`DiagnosisProvided2` AS `DiagnosisProvided2`,`vital`.`DiagnosisProvided3` AS `DiagnosisProvided3`,`vital`.`DiagnosisProvided4` AS `DiagnosisProvided4`,`vital`.`DiagnosisProvided5` AS `DiagnosisProvided5`,`vital`.`ChiefComplaint` AS `ChiefComplaint`,`vital`.`Reffred_To` AS `Reffred_To`,`vital`.`Referred_For` AS `Referred_For`,`l`.`VisitCode_Test` AS `VisitCode_Test`,`l`.`RBS_Test` AS `RBS_Test`,`l`.`Hemoglobin` AS `Hemoglobin`,`l`.`Vision_Aquity_Test` AS `Vision_Aquity_Test`,`l`.`HbA1c` AS `HbA1c`,`l`.`Malaria` AS `Malaria`,`idrs`.`VisitCode_Screening` AS `VisitCode_Screening`,`idrs`.`BeneficiaryRegID` AS `BeneficiaryRegID`,`idrs`.`Epilepsy_Screenings` AS `Epilepsy_Screenings`,`idrs`.`Asthma_Screenings` AS `Asthma_Screenings`,`idrs`.`Vision_Screenings` AS `Vision_Screenings`,`idrs`.`Tuberculosis_Screenings` AS `Tuberculosis_Screenings`,`idrs`.`Malaria_Screenings` AS `Malaria_Screenings`,`idrs`.`Diabetes_Screenings` AS `Diabetes_Screenings`,`idrs`.`Epilepsy_suspected` AS `Epilepsy_suspected`,`idrs`.`Asthma_suspected` AS `Asthma_suspected`,`idrs`.`Vision_suspected` AS `Vision_suspected`,`idrs`.`Tuberculosis_suspected` AS `Tuberculosis_suspected`,`idrs`.`Malaria_suspected` AS `Malaria_suspected`,`idrs`.`Diabetes_suspected` AS `Diabetes_suspected`,`idrs`.`Hypertension_suspected` AS `Hypertension_suspected`,`idrs`.`Epilepsy_confirmed` AS `Epilepsy_confirmed`,`idrs`.`Asthma_confirmed` AS `Asthma_confirmed`,`idrs`.`Vision_confirmed` AS `Vision_confirmed`,`idrs`.`Tuberculosis_confirmed` AS `Tuberculosis_confirmed`,`idrs`.`Malaria_confirmed` AS `Malaria_confirmed`,`idrs`.`Diabetes_confirmed` AS `Diabetes_confirmed`,`idrs`.`Hypertension_confirmed` AS `Hypertension_confirmed`,`drug`.`VisitCode_Drug` AS `VisitCode_Drug`,`drug`.`Total_drug` AS `Total_drug`,`drug`.`drug_1` AS `drug_1`,`drug`.`drug1_Qty` AS `drug1_Qty`,`drug`.`drug_2` AS `drug_2`,`drug`.`drug2_Qty` AS `drug2_Qty`,`drug`.`drug_3` AS `drug_3`,`drug`.`drug3_Qty` AS `drug3_Qty`,`drug`.`drug_4` AS `drug_4`,`drug`.`drug4_Qty` AS `drug4_Qty`,`drug`.`drug_5` AS `drug_5`,`drug`.`drug5_Qty` AS `drug5_Qty`,`drug`.`drug_6` AS `drug_6`,`drug`.`drug6_Qty` AS `drug6_Qty`,`drug`.`drug_7` AS `drug_7`,`drug`.`drug7_Qty` AS `drug7_Qty` from (((((select substr(`v`.`CreatedBy`,1,(length(`v`.`CreatedBy`) - 5)) AS `CurrDistrict`,substr(`v`.`CreatedBy`,(length(`v`.`CreatedBy`) - 4),2) AS `CreatedBy`,`v`.`VisitCode` AS `VisitCode`,`m`.`servicePoint` AS `servicePoint`,`v`.`ProviderServiceMapID` AS `ProviderServiceMapID`,`v`.`VisitCategory` AS `VisitCategory`,cast(`v`.`CreatedDate` as date) AS `visit_date`,cast(`v`.`CreatedDate` as time) AS `visit_time`,month(`v`.`CreatedDate`) AS `visit_month`,year(`v`.`CreatedDate`) AS `visit_year`,`m`.`beneficiary_id` AS `beneficiary_id`,`m`.`ben_name` AS `ben_name`,`idi`.`FirstName` AS `FirstName`,`m`.`father_name` AS `father_name`,`m`.`spouse_name` AS `spouse_name`,`m`.`ben_phone_no` AS `ben_phone_no`,(case when (`v`.`VisitNo` = 1) then 'New' else 'Revisit' end) AS `New/Repeat_visit`,`m`.`registrationDate` AS `registrationDate`,cast(`m`.`ben_dob` as date) AS `ben_dob`,substring_index(`m`.`ben_age`,'-',1) AS `age_part1`,substring_index(`m`.`ben_age`,'-',-(1)) AS `age_part2`,`m`.`ben_gender` AS `ben_gender`,`idi`.`maritalstatus` AS `maritalstatus`,`idi`.`community` AS `community`,`idi`.`religion` AS `religion`,`idi`.`incomestatus` AS `incomestatus`,`an`.`Weight_Kg` AS `Weight_Kg`,`an`.`Height_cm` AS `Height_cm`,`an`.`BMI` AS `BMI`,`an`.`WaistCircumference_cm` AS `WaistCircumference_cm`,(case when (`v`.`VisitCategory` = 'ANC') then 'ANC' when (`v`.`VisitCategory` = 'PNC') then 'PNC' else NULL end) AS `ANC/PNC`,`anc`.`LastMenstrualPeriod_LMP` AS `LMP_Date`,`anc`.`ExpectedDateofDelivery` AS `EDD`,`anc`.`GestationalAgeOrPeriodofAmenorrhea_POA` AS `GestationalAge`,`p`.`Temperature` AS `Temperature`,`p`.`PulseRate` AS `PulseRate`,`p`.`SystolicBP_1stReading` AS `SystolicBP_1stReading`,`p`.`DiastolicBP_1stReading` AS `DiastolicBP_1stReading`,substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',1),'||',-(1)) AS `DiagnosisProvided1`,(case when (strcmp(substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',1),'||',-(1)),substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',2),'||',-(1))) <> 0) then substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',2),'||',-(1)) end) AS `DiagnosisProvided2`,(case when (strcmp(substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',2),'||',-(1)),substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',3),'||',-(1))) <> 0) then substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',3),'||',-(1)) end) AS `DiagnosisProvided3`,(case when (strcmp(substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',3),'||',-(1)),substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',4),'||',-(1))) <> 0) then substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',4),'||',-(1)) end) AS `DiagnosisProvided4`,(case when (strcmp(substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',4),'||',-(1)),substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',5),'||',-(1))) <> 0) then substring_index(substring_index(`pre`.`DiagnosisProvided`,'||',5),'||',-(1)) end) AS `DiagnosisProvided5`,`chief`.`ChiefComplaint` AS `ChiefComplaint`,`ref`.`referredToInstituteName` AS `Reffred_To`,`ref`.`referralreason` AS `Referred_For` from (((((((((`db_iemr`.`t_benvisitdetail` `v` join `db_iemr`.`i_ben_flow_outreach` `m` on(((`m`.`beneficiary_reg_id` = `v`.`BeneficiaryRegID`) and (`m`.`beneficiary_visit_code` = `v`.`VisitCode`)))) left join `db_iemr`.`t_phy_vitals` `p` on(((`p`.`BeneficiaryRegID` = `v`.`BeneficiaryRegID`) and (`p`.`VisitCode` = `v`.`VisitCode`)))) left join `db_iemr`.`t_phy_anthropometry` `an` on(((`an`.`BeneficiaryRegID` = `v`.`BeneficiaryRegID`) and (`an`.`VisitCode` = `v`.`VisitCode`)))) left join `db_iemr`.`t_anccare` `anc` on(((`anc`.`BeneficiaryRegID` = `v`.`BeneficiaryRegID`) and (`anc`.`VisitCode` = `v`.`VisitCode`)))) left join `db_iemr`.`m_district` `dist` on((`dist`.`DistrictID` = `m`.`districtID`))) left join (select `mp`.`BenRegId` AS `BenRegId`,`mp`.`CreatedDate` AS `registrationdate`,`d`.`Gender` AS `gender`,`d`.`Status` AS `Status`,`d`.`FirstName` AS `FirstName`,`d`.`MaritalStatus` AS `maritalstatus`,`d`.`LiteracyStatus` AS `literacystatus`,`d`.`education` AS `education`,`d`.`occupation` AS `occupation`,`d`.`incomeStatus` AS `incomestatus`,`d`.`community` AS `community`,`d`.`religion` AS `religion`,`ad`.`CurrDistrict` AS `CurrDistrict`,`ad`.`CurrVillage` AS `CurrVillage`,`ad`.`CurrServicePoint` AS `CurrServicePoint` from ((`db_identity`.`i_beneficiarydetails` `d` join `db_identity`.`i_beneficiarymapping` `mp` on(((`mp`.`BenDetailsId` = `d`.`VanSerialNo`) and (`mp`.`VanID` = `d`.`VanID`)))) left join `db_identity`.`i_beneficiaryaddress` `ad` on(((`mp`.`BenAddressId` = `ad`.`VanSerialNo`) and (`mp`.`VanID` = `ad`.`VanID`))))) `idi` on((`idi`.`BenRegId` = `m`.`beneficiary_reg_id`))) left join (select `db_iemr`.`t_benreferdetails`.`VisitCode` AS `visitcode`,`db_iemr`.`t_benreferdetails`.`referredToInstituteName` AS `referredToInstituteName`,`db_iemr`.`t_benreferdetails`.`referralreason` AS `referralreason` from `db_iemr`.`t_benreferdetails` where (`db_iemr`.`t_benreferdetails`.`ProviderServiceMapID` = 18) group by `db_iemr`.`t_benreferdetails`.`VisitCode`) `ref` on((`ref`.`visitcode` = `v`.`VisitCode`))) left join (select `db_iemr`.`t_benchiefcomplaint`.`BeneficiaryRegID` AS `BeneficiaryRegID`,`db_iemr`.`t_benchiefcomplaint`.`VisitCode` AS `VisitCode`,group_concat(distinct `db_iemr`.`t_benchiefcomplaint`.`ChiefComplaint` separator ',') AS `ChiefComplaint` from `db_iemr`.`t_benchiefcomplaint` where (`db_iemr`.`t_benchiefcomplaint`.`ProviderServiceMapID` = 18) group by `db_iemr`.`t_benchiefcomplaint`.`BeneficiaryRegID`,`db_iemr`.`t_benchiefcomplaint`.`VisitCode`) `chief` on(((`chief`.`BeneficiaryRegID` = `v`.`BeneficiaryRegID`) and (`chief`.`VisitCode` = `v`.`VisitCode`)))) left join (select `db_iemr`.`t_prescription`.`BeneficiaryRegID` AS `BeneficiaryRegID`,`db_iemr`.`t_prescription`.`VisitCode` AS `VisitCode`,group_concat(distinct if((`db_iemr`.`t_prescription`.`DiagnosisProvided` = ''),NULL,`db_iemr`.`t_prescription`.`DiagnosisProvided`) separator '||') AS `DiagnosisProvided` from `db_iemr`.`t_prescription` where (`db_iemr`.`t_prescription`.`ProviderServiceMapID` = 18) group by `db_iemr`.`t_prescription`.`BeneficiaryRegID`,`db_iemr`.`t_prescription`.`VisitCode`) `pre` on(((`pre`.`BeneficiaryRegID` = `v`.`BeneficiaryRegID`) and (`pre`.`VisitCode` = `v`.`VisitCode`)))) where ((`v`.`ProviderServiceMapID` = 18) and (`v`.`CreatedDate` >= '2022-03-01 00:00:00')))) `vital` left join (select `temp`.`visitcode` AS `VisitCode_Test`,`temp`.`RBS_Test` AS `RBS_Test`,`temp`.`Hemoglobin` AS `Hemoglobin`,`temp`.`Vision_Aquity_Test` AS `Vision_Aquity_Test`,`temp`.`HbA1c` AS `HbA1c`,`temp`.`Malaria` AS `Malaria` from (select `t`.`VisitCode` AS `visitcode`,group_concat((case when (`tr`.`ProcedureID` = 71) then `tr`.`TestResultValue` end) separator ',') AS `RBS_Test`,group_concat((case when (`tr`.`ProcedureID` = 72) then `tr`.`TestResultValue` end) separator ',') AS `Hemoglobin`,group_concat((case when (`tr`.`ProcedureID` = 79) then `tr`.`TestResultValue` end) separator ',') AS `HbA1c`,group_concat((case when (`tr`.`ProcedureID` = 73) then `tr`.`TestResultValue` end) separator ',') AS `Malaria`,group_concat((case when (`tr`.`ProcedureID` = 75) then `tr`.`TestResultValue` end) separator ',') AS `Vision_Aquity_Test` from (`db_iemr`.`t_lab_testorder` `t` left join `db_iemr`.`t_lab_testresult` `tr` on(((`t`.`VisitCode` = `tr`.`VisitCode`) and (`t`.`ProcedureID` = `tr`.`ProcedureID`)))) where (`t`.`ProviderServiceMapID` = 18) group by `t`.`VisitCode`) `temp`) `l` on((`vital`.`VisitCode` = `l`.`VisitCode_Test`))) left join (select `temp`.`Visitcode` AS `VisitCode_Screening`,`temp`.`BeneficiaryRegID` AS `BeneficiaryRegID`,(case when (`temp`.`screening` like '%Epilepsy%') then 'Yes' else NULL end) AS `Epilepsy_Screenings`,(case when (`temp`.`screening` like '%Asthma%') then 'Yes' else NULL end) AS `Asthma_Screenings`,(case when (`temp`.`screening` like '%Vision%') then 'Yes' else NULL end) AS `Vision_Screenings`,(case when (`temp`.`screening` like '%Tuberculosis%') then 'Yes' else NULL end) AS `Tuberculosis_Screenings`,(case when (`temp`.`screening` like '%Malaria%') then 'Yes' else NULL end) AS `Malaria_Screenings`,(case when (`temp`.`screening` like '%Diabetes%') then 'Yes' else NULL end) AS `Diabetes_Screenings`,(case when (`temp`.`suspected` like '%Epilepsy%') then 'Yes' else NULL end) AS `Epilepsy_suspected`,(case when (`temp`.`suspected` like '%Asthma%') then 'Yes' else NULL end) AS `Asthma_suspected`,(case when (`temp`.`suspected` like '%Vision%') then 'Yes' else NULL end) AS `Vision_suspected`,(case when (`temp`.`suspected` like '%Tuberculosis%') then 'Yes' else NULL end) AS `Tuberculosis_suspected`,(case when (`temp`.`suspected` like '%Malaria%') then 'Yes' else NULL end) AS `Malaria_suspected`,(case when (`temp`.`suspected` like '%Diabetes%') then 'Yes' else NULL end) AS `Diabetes_suspected`,(case when (`temp`.`suspected` like '%Hypertension%') then 'Yes' else NULL end) AS `Hypertension_suspected`,(case when (`temp`.`confirmed` like '%Epilepsy%') then 'Yes' else NULL end) AS `Epilepsy_confirmed`,(case when (`temp`.`confirmed` like '%Asthma%') then 'Yes' else NULL end) AS `Asthma_confirmed`,(case when (`temp`.`confirmed` like '%Vision%') then 'Yes' else NULL end) AS `Vision_confirmed`,(case when (`temp`.`confirmed` like '%Tuberculosis%') then 'Yes' else NULL end) AS `Tuberculosis_confirmed`,(case when (`temp`.`confirmed` like '%Malaria%') then 'Yes' else NULL end) AS `Malaria_confirmed`,(case when (`temp`.`confirmed` like '%Diabetes%') then 'Yes' else NULL end) AS `Diabetes_confirmed`,(case when (`temp`.`confirmed` like '%Hypertension%') then 'Yes' else NULL end) AS `Hypertension_confirmed` from (select `db_iemr`.`t_idrsdetails`.`Visitcode` AS `Visitcode`,`db_iemr`.`t_idrsdetails`.`BeneficiaryRegID` AS `BeneficiaryRegID`,group_concat(distinct `db_iemr`.`t_idrsdetails`.`DiseaseQuestionType` separator ',') AS `screening`,group_concat(distinct `db_iemr`.`t_idrsdetails`.`SuspectedDiseases` separator ',') AS `suspected`,group_concat(distinct `db_iemr`.`t_idrsdetails`.`ConfirmedDiseases` separator ',') AS `confirmed` from `db_iemr`.`t_idrsdetails` where (`db_iemr`.`t_idrsdetails`.`ProviderServiceMapID` = 18) group by `db_iemr`.`t_idrsdetails`.`Visitcode`) `temp`) `idrs` on((`idrs`.`VisitCode_Screening` = `vital`.`VisitCode`))) left join (select `a`.`visitcode` AS `VisitCode_Drug`,`a`.`cnt` AS `Total_drug`,(case when (`a`.`cnt` > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',`a`.`cnt`),',',-(1)) end) AS `drug_1`,(case when (`a`.`cnt` > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',`a`.`cnt`),',',-(1)) end) AS `drug1_Qty`,(case when ((`a`.`cnt` - 1) > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',(`a`.`cnt` - 1)),',',-(1)) end) AS `drug_2`,(case when ((`a`.`cnt` - 1) > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',(`a`.`cnt` - 1)),',',-(1)) end) AS `drug2_Qty`,(case when ((`a`.`cnt` - 2) > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',(`a`.`cnt` - 2)),',',-(1)) end) AS `drug_3`,(case when ((`a`.`cnt` - 2) > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',(`a`.`cnt` - 2)),',',-(1)) end) AS `drug3_Qty`,(case when ((`a`.`cnt` - 3) > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',(`a`.`cnt` - 3)),',',-(1)) end) AS `drug_4`,(case when ((`a`.`cnt` - 3) > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',(`a`.`cnt` - 3)),',',-(1)) end) AS `drug4_Qty`,(case when ((`a`.`cnt` - 4) > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',(`a`.`cnt` - 4)),',',-(1)) end) AS `drug_5`,(case when ((`a`.`cnt` - 4) > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',(`a`.`cnt` - 4)),',',-(1)) end) AS `drug5_Qty`,(case when ((`a`.`cnt` - 5) > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',(`a`.`cnt` - 5)),',',-(1)) end) AS `drug_6`,(case when ((`a`.`cnt` - 5) > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',(`a`.`cnt` - 5)),',',-(1)) end) AS `drug6_Qty`,(case when ((`a`.`cnt` - 6) > 0) then substring_index(substring_index(`a`.`GenericDrugName`,',',(`a`.`cnt` - 6)),',',-(1)) end) AS `drug_7`,(case when ((`a`.`cnt` - 6) > 0) then substring_index(substring_index(`a`.`QtyPrescribed`,',',(`a`.`cnt` - 6)),',',-(1)) end) AS `drug7_Qty` from (select `db_iemr`.`t_prescribeddrug`.`VisitCode` AS `visitcode`,group_concat(`db_iemr`.`t_prescribeddrug`.`GenericDrugName` separator ',') AS `GenericDrugName`,group_concat(`db_iemr`.`t_prescribeddrug`.`QtyPrescribed` separator ',') AS `QtyPrescribed`,count(0) AS `cnt` from `db_iemr`.`t_prescribeddrug` where (`db_iemr`.`t_prescribeddrug`.`ProviderServiceMapID` = 18) group by `db_iemr`.`t_prescribeddrug`.`VisitCode`) `a`) `drug` on((`vital`.`VisitCode` = `drug`.`VisitCode_Drug`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 11:02:08
