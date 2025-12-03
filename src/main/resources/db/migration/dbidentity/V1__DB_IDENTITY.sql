-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_identity
-- ------------------------------------------------------
-- Server version	5.7.19-log
use db_identity;
-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!50503 SET NAMES utf8 */;
-- /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- /*!40103 SET TIME_ZONE='+00:00' */;
-- /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datamigrationtable`
--

-- DROP TABLE IF EXISTS `datamigrationtable`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `datamigrationtable` (
  `created_date` varchar(300) DEFAULT NULL,
  `ben_phone_no` varchar(300) DEFAULT NULL,
  `ben_name` varchar(300) DEFAULT NULL,
  `dob` varchar(300) DEFAULT NULL,
  `ben_gender` varchar(10) DEFAULT NULL,
  `GenderID` varchar(300) DEFAULT NULL,
  `state_id` varchar(300) DEFAULT NULL,
  `DistrictId` varchar(300) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `Blockid` varchar(300) DEFAULT NULL,
  `BlockName` varchar(100) DEFAULT NULL,
  `DistrictBranchId` varchar(300) DEFAULT NULL,
  `VillageName` varchar(300) DEFAULT NULL,
  `BenRegID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

-- DROP TABLE IF EXISTS `hibernate_sequence`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `i_beneficiaryaccount`
--

-- DROP TABLE IF EXISTS `i_beneficiaryaccount`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryaccount` (
  `BenAccountID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BankName` varchar(100) DEFAULT NULL,
  `BranchName` varchar(100) DEFAULT NULL,
  `IFSCCode` varchar(20) DEFAULT NULL,
  `AccountNo` varchar(50) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT NULL,
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenAccountID`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=5048092 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryaddress`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryaddress`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryaddress` (
  `BenAddressID` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenAddressID`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`),
  KEY `inx_CurrStateId` (`CurrStateId`),
  KEY `inx_CurrDistrictId` (`CurrDistrictId`),
  KEY `inx_createdby` (`CreatedBy`)
) ENGINE=InnoDB AUTO_INCREMENT=5048697 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryaddress_bkp_14122021`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryaddress_bkp_14122021`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryaddress_bkp_14122021` (
  `BenAddressID` bigint(20) NOT NULL DEFAULT '0',
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
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryconsent`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryconsent`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryconsent` (
  `BenConsentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenConsent` bit(1) DEFAULT NULL,
  `SharePersonalDetailsWithSpouse` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsWithSpouse` bit(1) DEFAULT NULL,
  `SharePersonalDetailsWithFamily` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsWithFamily` bit(1) DEFAULT NULL,
  `SharePersonalDetailsWithFriends` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsWithFriends` bit(1) DEFAULT NULL,
  `SharePersonalDetailsWithDoctor` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsWithDoctor` bit(1) DEFAULT NULL,
  `ShareAnonymousWithGovt` bit(1) DEFAULT NULL,
  `SharePersonalDetailsWithGovt` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsWithGovt` bit(1) DEFAULT NULL,
  `ShareAnonymousWithMedicalCommunity` bit(1) DEFAULT NULL,
  `SharePersonalDetailsForMedicalStudy` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsForMedicalStudy` bit(1) DEFAULT NULL,
  `ShareAnonymousWithNGO` bit(1) DEFAULT NULL,
  `SharePersonalDetailsWithNGO` bit(1) DEFAULT NULL,
  `ShareMedicalDetailsWithNGO` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenConsentID`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=3755957 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarycontacts`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarycontacts`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarycontacts` (
  `BenContactsID` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenContactsID`),
  KEY `inx_PNO` (`PreferredPhoneNum`),
  KEY `inx_PNO1` (`PhoneNum1`),
  KEY `inx_PNO2` (`PhoneNum2`),
  KEY `inx_PNO3` (`PhoneNum3`),
  KEY `inx_PNO4` (`PhoneNum4`),
  KEY `inx_PNO5` (`PhoneNum5`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=5048659 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarycontacts_bkp_24092019`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarycontacts_bkp_24092019`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarycontacts_bkp_24092019` (
  `BenContactsID` bigint(20) NOT NULL DEFAULT '0',
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
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarydetails`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarydetails`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarydetails` (
  `BeneficiaryDetailsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
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
  `MarriageAge` smallint(6) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `FatherName` varchar(50) DEFAULT NULL,
  `MotherName` varchar(50) DEFAULT NULL,
  `SpouseName` varchar(50) DEFAULT NULL,
  `EmergencyRegistration` bit(1) DEFAULT b'0',
  `HealthCareWorkerId` int(11) DEFAULT NULL,
  `HealthCareWorker` varchar(45) DEFAULT NULL,
  `PlaceOfWork` varchar(30) DEFAULT NULL,
  `LiteracyStatus` varchar(30) DEFAULT NULL,
  `educationId` int(11) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `occupationId` smallint(6) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `incomeStatusId` smallint(6) DEFAULT NULL,
  `incomeStatus` varchar(45) DEFAULT NULL,
  `communityId` int(11) DEFAULT NULL,
  `community` varchar(45) DEFAULT NULL,
  `religionId` smallint(6) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `preferredLanguageId` int(11) DEFAULT NULL,
  `preferredLanguage` varchar(45) DEFAULT NULL,
  `sourceOfInfo` varchar(300) DEFAULT NULL,
  `servicePointId` bigint(20) DEFAULT NULL,
  `areaId` int(15) DEFAULT NULL,
  `zoneId` int(15) DEFAULT NULL,
  `phcId` int(15) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `familyid` varchar(50) DEFAULT NULL,
  `HeadofFamily_RelationID` int(11) DEFAULT NULL,
  `HeadofFamily_Relation` varchar(50) DEFAULT NULL,
  `Others` varchar(100) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SexualOrientationID` int(11) DEFAULT NULL,
  `SexualOrientationType` varchar(30) DEFAULT NULL,
  `IsHIVPositive` bit(1) DEFAULT b'0',
  `HIVStatus` smallint(6) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  `MonthlyFamilyIncome` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BeneficiaryDetailsId`),
  UNIQUE KEY `BeneficiaryRegID_UNIQUE` (`BeneficiaryRegID`),
  KEY `IX_CreatedDate` (`CreatedDate`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`),
  KEY `inx_GenderId` (`GenderId`),
  KEY `inx_familyid` (`familyid`)
) ENGINE=InnoDB AUTO_INCREMENT=5048645 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarydetails_bkp_chirangv1`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarydetails_bkp_chirangv1`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarydetails_bkp_chirangv1` (
  `BeneficiaryDetailsId` bigint(20) NOT NULL DEFAULT '0',
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
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
  `MarriageAge` smallint(6) DEFAULT NULL,
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
  `incomeStatusId` smallint(6) DEFAULT NULL,
  `incomeStatus` varchar(45) DEFAULT NULL,
  `communityId` int(11) DEFAULT NULL,
  `community` varchar(45) DEFAULT NULL,
  `religionId` smallint(6) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `preferredLanguageId` int(11) DEFAULT NULL,
  `preferredLanguage` varchar(45) DEFAULT NULL,
  `sourceOfInfo` varchar(300) DEFAULT NULL,
  `servicePointId` bigint(20) DEFAULT NULL,
  `areaId` int(15) DEFAULT NULL,
  `zoneId` int(15) DEFAULT NULL,
  `phcId` int(15) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SexualOrientationID` int(11) DEFAULT NULL,
  `SexualOrientationType` varchar(30) DEFAULT NULL,
  `IsHIVPositive` bit(1) DEFAULT b'0',
  `HIVStatus` smallint(6) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarydetails_bkp_kamrupv4`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarydetails_bkp_kamrupv4`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarydetails_bkp_kamrupv4` (
  `BeneficiaryDetailsId` bigint(20) NOT NULL DEFAULT '0',
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
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
  `MarriageAge` smallint(6) DEFAULT NULL,
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
  `incomeStatusId` smallint(6) DEFAULT NULL,
  `incomeStatus` varchar(45) DEFAULT NULL,
  `communityId` int(11) DEFAULT NULL,
  `community` varchar(45) DEFAULT NULL,
  `religionId` smallint(6) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `preferredLanguageId` int(11) DEFAULT NULL,
  `preferredLanguage` varchar(45) DEFAULT NULL,
  `sourceOfInfo` varchar(300) DEFAULT NULL,
  `servicePointId` bigint(20) DEFAULT NULL,
  `areaId` int(15) DEFAULT NULL,
  `zoneId` int(15) DEFAULT NULL,
  `phcId` int(15) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SexualOrientationID` int(11) DEFAULT NULL,
  `SexualOrientationType` varchar(30) DEFAULT NULL,
  `IsHIVPositive` bit(1) DEFAULT b'0',
  `HIVStatus` smallint(6) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarydetails_rmnch`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarydetails_rmnch`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarydetails_rmnch` (
  `beneficiaryDetails_RmnchId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `aadhaNo` varchar(500) DEFAULT NULL,
  `aadha_no` varchar(500) DEFAULT NULL,
  `aadha_noId` int(11) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `ageAtMarriage` int(2) DEFAULT NULL,
  `age_unit` varchar(500) DEFAULT NULL,
  `age_unitId` int(2) DEFAULT NULL,
  `childRegisteredAWCID` bigint(20) DEFAULT NULL,
  `childRegisteredSchoolID` int(2) DEFAULT NULL,
  `dateofdelivey` datetime DEFAULT NULL,
  `expectedDateofDelivery` datetime DEFAULT NULL,
  `facilitySectionID` int(2) DEFAULT NULL,
  `guidelineid` varchar(250) DEFAULT NULL,
  `houseoldId` bigint(20) DEFAULT NULL,
  `lastDeliveryConductedID` int(2) DEFAULT NULL,
  `lastMenstrualPeriod` varchar(500) DEFAULT NULL,
  `latitude` float(20,5) DEFAULT NULL,
  `lengthofMenstrualCycleId` int(2) DEFAULT NULL,
  `literacyId` int(2) DEFAULT NULL,
  `longitude` float(20,5) DEFAULT NULL,
  `menstrualBFDId` int(2) DEFAULT NULL,
  `menstrualProblemId` int(2) DEFAULT NULL,
  `menstrualStatusId` int(2) DEFAULT NULL,
  `mobileOthers` varchar(500) DEFAULT NULL,
  `mobilenoofRelation` varchar(500) DEFAULT NULL,
  `mobilenoofRelationId` int(2) DEFAULT NULL,
  `motherName` varchar(500) DEFAULT NULL,
  `ncd_priority` int(2) DEFAULT NULL,
  `need_opcareId` int(2) DEFAULT NULL,
  `previousLiveBirth` varchar(500) DEFAULT NULL,
  `rchid` varchar(500) DEFAULT NULL,
  `registrationDate` datetime DEFAULT NULL,
  `registrationType` varchar(500) DEFAULT NULL,
  `regularityofMenstrualCycleId` int(2) DEFAULT NULL,
  `religionOthers` varchar(500) DEFAULT NULL,
  `reproductiveStatus` varchar(500) DEFAULT NULL,
  `reproductiveStatusId` int(2) DEFAULT NULL,
  `serverUpdatedStatus` int(2) DEFAULT NULL,
  `typeofSchoolID` int(2) DEFAULT NULL,
  `whoConductedDeliveryID` int(2) DEFAULT NULL,
  `nayiPahalDeliveryStatus` varchar(300) DEFAULT NULL,
  `nayiPahalDeliveryStatusPosition` int(11) DEFAULT NULL,
  `dateMarriage` datetime DEFAULT NULL,
  `noOfDaysForDelivery` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(500) DEFAULT NULL,
  `ReservedOn` varchar(500) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(500) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(500) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `deviceId` int(11) DEFAULT NULL,
  `beneficiaryId` bigint(20) DEFAULT NULL,
  `RelatedBeneficiaryIds` varchar(500) DEFAULT NULL,
  `HRPStatus` bit(1) DEFAULT NULL,
  `ImmunizationStatus` bit(1) DEFAULT NULL,
  `NishchayPregnancyStatus` varchar(100) DEFAULT NULL,
  `NishchayPregnancyStatusPosition` int(11) DEFAULT NULL,
  `NishchayDeliveryStatus` varchar(100) DEFAULT NULL,
  `NishchayDeliveryStatusPosition` int(11) DEFAULT NULL,
  `FamilyHeadRelation` varchar(100) DEFAULT NULL,
  `FamilyHeadRelationPosition` int(11) DEFAULT NULL,
  `MenstrualStatus` varchar(100) DEFAULT NULL,
  `ComplicationsOthers` varchar(100) DEFAULT NULL,
  `WhoConductedDelivery` varchar(100) DEFAULT NULL,
  `LastDeliveryConducted` varchar(100) DEFAULT NULL,
  `FacilitySelection` varchar(100) DEFAULT NULL,
  `DeliveryDate` varchar(100) DEFAULT NULL,
  `ChildRegisteredSchool` varchar(100) DEFAULT NULL,
  `TypeOfSchool` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`beneficiaryDetails_RmnchId`),
  KEY `benregID` (`BeneficiaryRegID`),
  KEY `houseHoldID` (`houseoldId`)
) ENGINE=InnoDB AUTO_INCREMENT=156853 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryfamilymapping`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryfamilymapping`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryfamilymapping` (
  `BenFamilyMapId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenMapId` bigint(20) DEFAULT NULL,
  `AssociatedBenRegID` bigint(20) DEFAULT NULL,
  `RelationshipID` int(11) DEFAULT NULL,
  `RelationshipToSelf` varchar(15) DEFAULT NULL,
  `IsEmergencyContact` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenFamilyMapId`),
  KEY `inx_AssociatedBenRegID` (`AssociatedBenRegID`),
  KEY `inx_RelationshipID` (`RelationshipID`),
  KEY `inx_BenmapId` (`BenMapId`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_VanID` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=5043059 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryidentity`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryidentity`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryidentity` (
  `BenIdentityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenMapId` bigint(20) NOT NULL,
  `IdentityName` varchar(20) DEFAULT NULL,
  `IdentityNameId` int(11) DEFAULT NULL,
  `IdentityType` varchar(20) DEFAULT NULL,
  `IdentityTypeId` int(11) DEFAULT NULL,
  `IdentityNo` varchar(30) DEFAULT NULL,
  `IdentityFilePath` varchar(100) DEFAULT NULL,
  `IssueDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `IsVerified` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenIdentityId`),
  KEY `FK_BenIdentity_BeneficiaryMapping_idx` (`BenMapId`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_VanID` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=545614 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryimage`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryimage`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryimage` (
  `BenImageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenImage` longtext,
  `BenBiometric` longtext,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenImageId`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=5045474 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiarymapping`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiarymapping`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiarymapping` (
  `BenMapId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenRegId` bigint(20) NOT NULL,
  `BenDetailsId` bigint(20) NOT NULL,
  `BenAddressId` bigint(20) NOT NULL,
  `BenImageId` bigint(20) DEFAULT NULL,
  `BenContactsId` bigint(20) NOT NULL,
  `BenConsentId` bigint(20) DEFAULT NULL,
  `BenAccountID` bigint(20) DEFAULT NULL,
  `BenSecureStackId` int(11) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenMapId`),
  UNIQUE KEY `BenRegId_UNIQUE` (`BenRegId`),
  KEY `inx_conid` (`BenContactsId`),
  KEY `inx_BenRegID` (`BenRegId`),
  KEY `inx_BenDetailsId` (`BenDetailsId`),
  KEY `inx_BenAddressID` (`BenAddressId`),
  KEY `inx_BenImageID` (`BenImageId`),
  KEY `inx_BenContactsID` (`BenContactsId`),
  KEY `inx_BenConsentID` (`BenConsentId`),
  KEY `inx_BenAccountID` (`BenAccountID`),
  KEY `inx_BenSecureStackID` (`BenSecureStackId`),
  KEY `inx_vanid` (`VanID`),
  KEY `inx_VanSerialNo` (`VanSerialNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11594169 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_beneficiaryservicemapping`
-- --

-- -- DROP TABLE IF EXISTS `i_beneficiaryservicemapping`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_beneficiaryservicemapping` (
  `BenServiceMapID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BenMapID` bigint(20) NOT NULL,
  `ServiceId` int(15) DEFAULT NULL,
  `ServiceName` varchar(45) DEFAULT NULL,
  `StateId` int(15) DEFAULT NULL,
  `StateName` varchar(45) DEFAULT NULL,
  `ServiceProviderId` int(15) DEFAULT NULL,
  `ServiceProviderName` varchar(45) DEFAULT NULL,
  `ProviderServiceMapId` int(15) DEFAULT NULL,
  `FirstAvailedOn` datetime DEFAULT NULL,
  `RegisteredById` int(15) DEFAULT NULL,
  `RegisteredByName` varchar(45) DEFAULT NULL,
  `RegisteredDate` datetime DEFAULT NULL,
  `Deleted` bit(1) NOT NULL DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenServiceMapID`),
  KEY `inx_BenMapID` (`BenMapID`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_VanID` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=3750293 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_benfamilytag`
-- --

-- -- DROP TABLE IF EXISTS `i_benfamilytag`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_benfamilytag` (
  `BenFamilyTagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Familyid` varchar(50) DEFAULT NULL,
  `FamilyName` varchar(100) DEFAULT NULL,
  `FamilyHeadName` varchar(100) DEFAULT NULL,
  `noofmembers` int(11) DEFAULT NULL,
  `Villageid` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`BenFamilyTagId`),
  KEY `inx_Familyid` (`Familyid`),
  KEY `inx_Vanid` (`VanID`),
  KEY `inx_vanserialno` (`VanSerialNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_bornbirthdeatils`
-- --

-- -- DROP TABLE IF EXISTS `i_bornbirthdeatils`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_bornbirthdeatils` (
  `BornBirthDeatilsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `beneficiaryId` bigint(20) DEFAULT NULL,
  `countryid` int(2) DEFAULT NULL,
  `bcdBatchNo` varchar(500) DEFAULT NULL,
  `bcgDate` datetime DEFAULT NULL,
  `bcgGivenDueDate` datetime DEFAULT NULL,
  `birthDefects` varchar(500) DEFAULT NULL,
  `birthDefectsOthers` varchar(500) DEFAULT NULL,
  `birthDefectsid` int(2) DEFAULT NULL,
  `birthDosage` varchar(500) DEFAULT NULL,
  `birthDosageid` int(2) DEFAULT NULL,
  `birthPlace` varchar(500) DEFAULT NULL,
  `birthPlaceid` int(2) DEFAULT NULL,
  `childName` varchar(500) DEFAULT NULL,
  `complecations` varchar(500) DEFAULT NULL,
  `complecationsid` int(2) DEFAULT NULL,
  `conductedDelivery` varchar(500) DEFAULT NULL,
  `conductedDeliveryOther` varchar(500) DEFAULT NULL,
  `conductedDeliveryid` int(2) DEFAULT NULL,
  `corticosteroidGivenMother` varchar(500) DEFAULT NULL,
  `corticosteroidGivenMotherid` int(2) DEFAULT NULL,
  `criedImmediately` varchar(500) DEFAULT NULL,
  `criedImmediatelyid` int(2) DEFAULT NULL,
  `deliveryType` varchar(500) DEFAULT NULL,
  `deliveryTypeOther` varchar(500) DEFAULT NULL,
  `deliveryTypeid` int(2) DEFAULT NULL,
  `facilityName` varchar(500) DEFAULT NULL,
  `facilityOther` varchar(500) DEFAULT NULL,
  `facilityid` int(2) DEFAULT NULL,
  `feedingStarted` varchar(500) DEFAULT NULL,
  `feedingStartedid` int(2) DEFAULT NULL,
  `gestationalAge` varchar(500) DEFAULT NULL,
  `gestationalAgeid` int(2) DEFAULT NULL,
  `heightAtBirth` int(2) DEFAULT NULL,
  `hptDate` datetime DEFAULT NULL,
  `hptGivenDueDate` datetime DEFAULT NULL,
  `hptdBatchNo` varchar(500) DEFAULT NULL,
  `hptdBatchID` int(2) DEFAULT NULL,
  `opvBatchNo` varchar(500) DEFAULT NULL,
  `opvDate` datetime DEFAULT NULL,
  `opvGivenDueDate` datetime DEFAULT NULL,
  `placeName` varchar(500) DEFAULT NULL,
  `serverUpdatedStatus` int(2) DEFAULT NULL,
  `term` varchar(500) DEFAULT NULL,
  `termid` int(2) DEFAULT NULL,
  `vitaminkBatchNo` varchar(500) DEFAULT NULL,
  `vitaminkDate` datetime DEFAULT NULL,
  `vitaminkGivenDueDate` datetime DEFAULT NULL,
  `weightAtBirth` decimal(5,2) DEFAULT NULL,
  `stateid` int(11) DEFAULT NULL,
  `districtid` int(11) DEFAULT NULL,
  `villageid` int(11) DEFAULT NULL,
  `birthBCG` bit(1) DEFAULT NULL,
  `birthHepB` bit(1) DEFAULT NULL,
  `birthOPV` bit(1) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(500) DEFAULT NULL,
  `ReservedOn` varchar(500) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(500) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(500) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `deviceId` int(11) DEFAULT NULL,
  `ComplicationsOther` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`BornBirthDeatilsId`),
  KEY `inx_bornbirthdetails_benregID` (`BeneficiaryRegID`)
) ENGINE=InnoDB AUTO_INCREMENT=20543 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_cbac_additional_details`
-- --

-- -- DROP TABLE IF EXISTS `i_cbac_additional_details`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_cbac_additional_details` (
  `cbacAdditionalDetailId` bigint(20) NOT NULL,
  `cbacCloudy` varchar(255) DEFAULT NULL,
  `cbacCloudyPosi` int(11) DEFAULT NULL,
  `cbacDetailsId` bigint(20) DEFAULT NULL,
  `cbacDiffInhearing` varchar(255) DEFAULT NULL,
  `cbacDiffInhearingPosi` int(11) DEFAULT NULL,
  `cbacDiffreading` varchar(255) DEFAULT NULL,
  `cbacDiffreadingPosi` int(11) DEFAULT NULL,
  `cbacFeelingUnsteady` varchar(255) DEFAULT NULL,
  `cbacFeelingUnsteadyPosi` int(11) DEFAULT NULL,
  `cbacForgettingNames` varchar(255) DEFAULT NULL,
  `cbacForgettingNamesPosi` int(11) DEFAULT NULL,
  `cbacNeedingHelp` varchar(255) DEFAULT NULL,
  `cbacNeedingHelpPosi` int(11) DEFAULT NULL,
  `cbacPainIneyes` varchar(255) DEFAULT NULL,
  `cbacPainIneyesPosi` int(11) DEFAULT NULL,
  `cbacRednessIneyes` varchar(255) DEFAULT NULL,
  `cbacRednessIneyesPosi` int(11) DEFAULT NULL,
  `cbacSufferPhysicalDisability` varchar(255) DEFAULT NULL,
  `cbacSufferPhysicalDisabilityPosi` int(11) DEFAULT NULL,
  `cbacTinglingPalm` varchar(255) DEFAULT NULL,
  `cbacTinglingPalmPosi` int(11) DEFAULT NULL,
  `cbacWhiteOrRedPatch` varchar(255) DEFAULT NULL,
  `cbacWhiteOrRedPatchPosi` int(11) DEFAULT NULL,
  `filledDate` datetime DEFAULT NULL,
  PRIMARY KEY (`cbacAdditionalDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_cbacdetails`
-- --

-- -- DROP TABLE IF EXISTS `i_cbacdetails`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_cbacdetails` (
  `CBACDetailsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `cbac_age` varchar(500) DEFAULT NULL,
  `cbac_age_posi` int(2) DEFAULT NULL,
  `cbac_alcohol` varchar(500) DEFAULT NULL,
  `cbac_alcohol_posi` int(2) DEFAULT NULL,
  `cbac_antitbdrugs` varchar(500) DEFAULT NULL,
  `cbac_antitbdrugs_pos` int(2) DEFAULT NULL,
  `cbac_bleedingafterintercourse` varchar(500) DEFAULT NULL,
  `cbac_bleedingafterintercourse_pos` int(2) DEFAULT NULL,
  `cbac_bleedingaftermenopause` varchar(500) DEFAULT NULL,
  `cbac_bleedingaftermenopause_pos` int(2) DEFAULT NULL,
  `cbac_bleedingbtwnperiods` varchar(500) DEFAULT NULL,
  `cbac_bleedingbtwnperiods_pos` int(2) DEFAULT NULL,
  `cbac_blooddischage` varchar(500) DEFAULT NULL,
  `cbac_blooddischage_pos` int(2) DEFAULT NULL,
  `cbac_bloodsputum` varchar(500) DEFAULT NULL,
  `cbac_bloodsputum_pos` int(2) DEFAULT NULL,
  `cbac_changeinbreast` varchar(500) DEFAULT NULL,
  `cbac_changeinbreast_pos` int(2) DEFAULT NULL,
  `cbac_coughing` varchar(500) DEFAULT NULL,
  `cbac_coughing_pos` int(2) DEFAULT NULL,
  `cbac_difficultyinmouth` varchar(500) DEFAULT NULL,
  `cbac_difficultyinmouth_pos` int(2) DEFAULT NULL,
  `cbac_familyhistory` varchar(500) DEFAULT NULL,
  `cbac_familyhistory_posi` int(2) DEFAULT NULL,
  `cbac_fivermore` varchar(500) DEFAULT NULL,
  `cbac_fivermore_pos` int(2) DEFAULT NULL,
  `cbac_foulveginaldischarge` varchar(500) DEFAULT NULL,
  `cbac_foulveginaldischarge_pos` int(2) DEFAULT NULL,
  `cbac_historyoffits` varchar(500) DEFAULT NULL,
  `cbac_historyoffits_pos` int(2) DEFAULT NULL,
  `cbac_loseofweight` varchar(500) DEFAULT NULL,
  `cbac_loseofweight_pos` int(2) DEFAULT NULL,
  `cbac_lumpinbreast` varchar(500) DEFAULT NULL,
  `cbac_lumpinbreast_pos` int(2) DEFAULT NULL,
  `cbac_nightsweats` varchar(500) DEFAULT NULL,
  `cbac_nightsweats_pos` int(2) DEFAULT NULL,
  `cbac_pa` varchar(500) DEFAULT NULL,
  `cbac_pa_posi` int(2) DEFAULT NULL,
  `cbac_referpatient_mo` int(2) DEFAULT NULL,
  `cbac_smoke` varchar(500) DEFAULT NULL,
  `cbac_smoke_posi` int(2) DEFAULT NULL,
  `cbac_sortnesofbirth` varchar(500) DEFAULT NULL,
  `cbac_sortnesofbirth_pos` int(2) DEFAULT NULL,
  `cbac_sputemcollection` int(2) DEFAULT NULL,
  `cbac_sufferingtb` varchar(500) DEFAULT NULL,
  `cbac_sufferingtb_pos` int(2) DEFAULT NULL,
  `cbac_tbhistory` varchar(500) DEFAULT NULL,
  `cbac_tbhistory_pos` int(2) DEFAULT NULL,
  `cbac_toneofvoice` varchar(500) DEFAULT NULL,
  `cbac_toneofvoice_pos` int(2) DEFAULT NULL,
  `cbac_tracing_all_fm` varchar(500) DEFAULT NULL,
  `cbac_uicers` varchar(500) DEFAULT NULL,
  `cbac_uicers_pos` int(2) DEFAULT NULL,
  `cbac_waist` varchar(500) DEFAULT NULL,
  `cbac_waist_posi` int(2) DEFAULT NULL,
  `houseoldId` bigint(20) DEFAULT NULL,
  `countryid` int(2) DEFAULT NULL,
  `stateid` int(11) DEFAULT NULL,
  `districtid` int(11) DEFAULT NULL,
  `districtname` varchar(500) DEFAULT NULL,
  `villageid` int(11) DEFAULT NULL,
  `serverUpdatedStatus` int(2) DEFAULT NULL,
  `total_score` int(2) DEFAULT NULL,
  `cbac_Pain_while_chewing` varchar(45) DEFAULT NULL,
  `cbac_Pain_while_chewing_posi` int(2) DEFAULT NULL,
  `cbac_any_thickend_skin` varchar(45) DEFAULT NULL,
  `cbac_any_thickend_skin_posi` int(2) DEFAULT NULL,
  `cbac_clawing_of_fingers` varchar(45) DEFAULT NULL,
  `cbac_clawing_of_fingers_posi` int(2) DEFAULT NULL,
  `cbac_diff_holding_obj` varchar(45) DEFAULT NULL,
  `cbac_diff_holding_obj_posi` int(2) DEFAULT NULL,
  `cbac_feeling_down` varchar(200) DEFAULT NULL,
  `cbac_feeling_down_posi` int(2) DEFAULT NULL,
  `cbac_feeling_down_score` int(2) DEFAULT NULL,
  `cbac_fuel_used` varchar(45) DEFAULT NULL,
  `cbac_fuel_used_posi` int(2) DEFAULT NULL,
  `cbac_growth_in_mouth` varchar(45) DEFAULT NULL,
  `cbac_growth_in_mouth_posi` int(2) DEFAULT NULL,
  `cbac_hyper_pigmented_patch` varchar(45) DEFAULT NULL,
  `cbac_hyper_pigmented_patch_posi` int(2) DEFAULT NULL,
  `cbac_inability_close_eyelid` varchar(45) DEFAULT NULL,
  `cbac_inability_close_eyelid_posi` int(2) DEFAULT NULL,
  `cbac_little_interest` varchar(45) DEFAULT NULL,
  `cbac_little_interest_posi` int(2) DEFAULT NULL,
  `cbac_little_interest_score` int(2) DEFAULT NULL,
  `cbac_nodules_on_skin` varchar(45) DEFAULT NULL,
  `cbac_nodules_on_skin_posi` int(2) DEFAULT NULL,
  `cbac_numbness_on_palm` varchar(45) DEFAULT NULL,
  `cbac_numbness_on_palm_posi` int(2) DEFAULT NULL,
  `cbac_occupational_exposure` varchar(200) DEFAULT NULL,
  `cbac_occupational_exposure_posi` int(2) DEFAULT NULL,
  `cbac_tingling_or_numbness` varchar(45) DEFAULT NULL,
  `cbac_tingling_or_numbness_posi` int(2) DEFAULT NULL,
  `cbac_weekness_in_feet` varchar(45) DEFAULT NULL,
  `cbac_weekness_in_feet_posi` int(2) DEFAULT NULL,
  `suspected_hrp` varchar(45) DEFAULT NULL,
  `suspected_ncd` varchar(45) DEFAULT NULL,
  `suspected_tb` varchar(45) DEFAULT NULL,
  `suspected_ncd_diseases` varchar(300) DEFAULT NULL,
  `confirmed_ncd` varchar(45) DEFAULT NULL,
  `confirmed_hrp` varchar(45) DEFAULT NULL,
  `confirmed_tb` varchar(45) DEFAULT NULL,
  `confirmed_ncd_diseases` varchar(300) DEFAULT NULL,
  `diagnosis_status` varchar(45) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(500) DEFAULT NULL,
  `ReservedOn` varchar(500) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(500) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(500) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `deviceId` int(11) DEFAULT NULL,
  `beneficiaryId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CBACDetailsId`),
  KEY `inx_cbacdetails_benregID` (`BeneficiaryRegID`),
  KEY `inx_cbacdetails_houseHoldID` (`houseoldId`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `i_householddetails`
-- --

-- -- DROP TABLE IF EXISTS `i_householddetails`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `i_householddetails` (
  `houseHoldDetailsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryRegID` bigint(20) DEFAULT NULL,
  `Countyid` int(11) DEFAULT NULL,
  `availabilityofToilet` varchar(500) DEFAULT NULL,
  `availabilityofToiletId` int(2) DEFAULT NULL,
  `avalabilityofElectricity` varchar(500) DEFAULT NULL,
  `avalabilityofElectricityId` int(2) DEFAULT NULL,
  `block` varchar(500) DEFAULT NULL,
  `bpl_aplId` int(2) DEFAULT NULL,
  `colony` varchar(500) DEFAULT NULL,
  `district` varchar(500) DEFAULT NULL,
  `districtid` int(2) DEFAULT NULL,
  `districtname` varchar(500) DEFAULT NULL,
  `familyHeadName` varchar(500) DEFAULT NULL,
  `familyHeadPhoneNo` varchar(500) DEFAULT NULL,
  `familyName` varchar(500) DEFAULT NULL,
  `fuelUsed` varchar(500) DEFAULT NULL,
  `fuelUsedId` int(2) DEFAULT NULL,
  `houseOwnerShip` varchar(500) DEFAULT NULL,
  `houseOwnerShipId` int(2) DEFAULT NULL,
  `houseType` varchar(500) DEFAULT NULL,
  `houseTypeId` int(2) DEFAULT NULL,
  `houseno` varchar(500) DEFAULT NULL,
  `houseoldId` bigint(20) DEFAULT NULL,
  `landIrregatedId` int(2) DEFAULT NULL,
  `landOwnedId` int(2) DEFAULT NULL,
  `liveStockOwnerShipId` int(2) DEFAULT NULL,
  `motarizedVehicleId` int(2) DEFAULT NULL,
  `other_availabilityofToilet` varchar(500) DEFAULT NULL,
  `other_avalabilityofElectricity` varchar(500) DEFAULT NULL,
  `other_fuelUsed` varchar(500) DEFAULT NULL,
  `other_houseType` varchar(500) DEFAULT NULL,
  `other_motarizedVehicle` varchar(500) DEFAULT NULL,
  `other_residentialArea` varchar(500) DEFAULT NULL,
  `other_sourceofDrinkingWater` varchar(500) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `rationCardDetails` varchar(500) DEFAULT NULL,
  `residentialArea` varchar(500) DEFAULT NULL,
  `residentialAreaId` int(2) DEFAULT NULL,
  `seperateKitchen` varchar(500) DEFAULT NULL,
  `seperateKitchenId` int(2) DEFAULT NULL,
  `serverUpdatedStatus` int(2) DEFAULT NULL,
  `sourceofDrinkingWater` varchar(500) DEFAULT NULL,
  `sourceofDrinkingWaterId` int(2) DEFAULT NULL,
  `state` varchar(500) DEFAULT NULL,
  `stateid` int(11) DEFAULT NULL,
  `street` varchar(500) DEFAULT NULL,
  `type_bpl_apl` varchar(500) DEFAULT NULL,
  `village` varchar(500) DEFAULT NULL,
  `villageid` int(11) DEFAULT NULL,
  `houseNum` varchar(200) DEFAULT NULL,
  `wardNo` varchar(100) DEFAULT NULL,
  `wardName` varchar(100) DEFAULT NULL,
  `mohallaName` varchar(300) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(500) DEFAULT NULL,
  `ReservedOn` varchar(500) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(500) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(500) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `deviceId` int(11) DEFAULT NULL,
  `beneficiaryId` int(11) DEFAULT NULL,
  `LiveStockOwnerShip` varchar(100) DEFAULT NULL,
  `MotarizedVehicle` varchar(100) DEFAULT NULL,
  `LandOwned` varchar(100) DEFAULT NULL,
  `Blockid` int(11) DEFAULT NULL,
  `landIrregated` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`houseHoldDetailsId`),
  KEY `inx_householddetails_benregID` (`BeneficiaryRegID`),
  KEY `inx_householddetails_houseoldId` (`houseoldId`)
) ENGINE=InnoDB AUTO_INCREMENT=89265 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `m_beneficiaryregidmapping`
-- --

-- -- DROP TABLE IF EXISTS `m_beneficiaryregidmapping`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `m_beneficiaryregidmapping` (
  `BenRegId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BeneficiaryID` bigint(20) NOT NULL,
  `Provisioned` bit(1) DEFAULT b'0',
  `ProviderServiceMapID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedById` int(15) DEFAULT NULL,
  `ReservedOn` datetime DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(30) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BenRegId`),
  UNIQUE KEY `BeneficiaryID_UNIQUE` (`BeneficiaryID`),
  KEY `inx_Reserved` (`Reserved`),
  KEY `inx_provisioned` (`Provisioned`),
  KEY `inx_PSMapID` (`ProviderServiceMapID`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`)
) ENGINE=InnoDB AUTO_INCREMENT=9025341 DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `m_bensecurestack`
-- --

-- -- DROP TABLE IF EXISTS `m_bensecurestack`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `m_bensecurestack` (
  `BenSecureStackId` int(15) NOT NULL AUTO_INCREMENT,
  `BenSecureStackSchemeId` int(15) NOT NULL,
  `BenSecureStackSchemeName` varchar(50) DEFAULT NULL,
  `BenKey1` varchar(128) NOT NULL,
  `BenKey2` varchar(128) NOT NULL,
  `BenKey3` varchar(128) NOT NULL,
  `BenKey4` varchar(256) NOT NULL,
  `BenKey5` varchar(256) NOT NULL,
  `BenKey6` varchar(256) NOT NULL,
  `BenSalt1` varchar(32) NOT NULL,
  `BenSalt2` varchar(32) NOT NULL,
  `BenSalt3` varchar(64) NOT NULL,
  `BenSalt4` varchar(64) NOT NULL,
  `BenSalt5` varchar(128) NOT NULL,
  `BenSalt6` varchar(128) NOT NULL,
  `StartDate` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BenSecureStackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `replicationtest`
-- --

-- -- DROP TABLE IF EXISTS `replicationtest`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `replicationtest` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `samjeevani_zolt_datamigration`
-- --

-- -- DROP TABLE IF EXISTS `samjeevani_zolt_datamigration`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `samjeevani_zolt_datamigration` (
  `created_date` varchar(300) DEFAULT NULL,
  `ben_phone_no` varchar(300) DEFAULT NULL,
  `ben_name` varchar(300) DEFAULT NULL,
  `dob` varchar(300) DEFAULT NULL,
  `ben_gender` varchar(10) DEFAULT NULL,
  `GenderID` varchar(300) DEFAULT NULL,
  `state_id` varchar(300) DEFAULT NULL,
  `DistrictId` varchar(300) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `Blockid` varchar(300) DEFAULT NULL,
  `BlockName` varchar(100) DEFAULT NULL,
  `DistrictBranchId` varchar(300) DEFAULT NULL,
  `VillageName` varchar(300) DEFAULT NULL,
  `BenRegID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Table structure for table `t_bendataaccess`
-- --

-- -- DROP TABLE IF EXISTS `t_bendataaccess`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `t_bendataaccess` (
  `AccessId` bigint(20) NOT NULL AUTO_INCREMENT,
  `AuthId` varchar(150) NOT NULL,
  `BenConsentId` bigint(20) NOT NULL,
  `BenMapId` bigint(20) NOT NULL,
  `IsAgent` bit(1) NOT NULL,
  `UserAgentId` int(15) NOT NULL,
  `UserAgentName` varchar(45) DEFAULT NULL,
  `UserAgentRoleId` int(15) NOT NULL,
  `UserAgentRoleName` varchar(45) DEFAULT NULL,
  `UserAgentServiceId` int(15) NOT NULL,
  `UserAgentServiceName` varchar(45) DEFAULT NULL,
  `UserAgentPSMapId` int(15) NOT NULL,
  `UserAgentIpAddrV4` varchar(20) NOT NULL,
  `UserAgentIpAddrV6` varchar(50) DEFAULT NULL,
  `AccessedBy` varchar(50) NOT NULL,
  `AccessedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AccessedType` varchar(45) NOT NULL,
  `Processed` char(1) DEFAULT NULL,
  `VanSerialNo` bigint(20) DEFAULT NULL,
  `VanID` int(11) DEFAULT NULL,
  `VehicalNo` varchar(30) DEFAULT NULL,
  `ParkingPlaceID` int(11) DEFAULT NULL,
  `SyncedBy` varchar(30) DEFAULT NULL,
  `SyncedDate` datetime DEFAULT NULL,
  `ReservedForChange` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AccessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_benadvancesearch`
--

-- DROP TABLE IF EXISTS `v_benadvancesearch`;
/*!50001 DROP VIEW IF EXISTS `v_benadvancesearch`*/;
-- SET @saved_cs_client     = @@character_set_client;
-- /*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_benadvancesearch` AS SELECT 
 1 AS `BenMapId`,
 1 AS `BenRegId`,
 1 AS `BenDetailsId`,
 1 AS `BenAddressId`,
 1 AS `BenImageId`,
 1 AS `BenContactsId`,
 1 AS `BenConsentId`,
 1 AS `BenAccountID`,
 1 AS `BenSecureStackId`,
 1 AS `VanSerialNo`,
 1 AS `VanID`,
 1 AS `CurrStateId`,
 1 AS `CurrDistrictId`,
 1 AS `CurrSubDistrictId`,
 1 AS `CurrVillageId`,
 1 AS `FirstName`,
 1 AS `MiddleName`,
 1 AS `LastName`,
 1 AS `GenderId`,
 1 AS `fathername`,
 1 AS `DOB`,
 1 AS `houseoldId`,
 1 AS `guidelineid`,
 1 AS `rchid`*/;
-- SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_identity'
--

--
-- Dumping routines for database 'db_identity'
--

--
-- Final view structure for view `v_benadvancesearch`
--

/*!50001 DROP VIEW IF EXISTS `v_benadvancesearch`*/;
-- /*!50001 SET @saved_cs_client          = @@character_set_client */;
-- /*!50001 SET @saved_cs_results         = @@character_set_results */;
-- /*!50001 SET @saved_col_connection     = @@collation_connection */;
-- /*!50001 SET character_set_client      = utf8mb4 */;
-- /*!50001 SET character_set_results     = utf8mb4 */;
-- /*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `v_benadvancesearch` AS select `benmap`.`BenMapId` AS `BenMapId`,`benmap`.`BenRegId` AS `BenRegId`,`benmap`.`BenDetailsId` AS `BenDetailsId`,`benmap`.`BenAddressId` AS `BenAddressId`,`benmap`.`BenImageId` AS `BenImageId`,`benmap`.`BenContactsId` AS `BenContactsId`,`benmap`.`BenConsentId` AS `BenConsentId`,`benmap`.`BenAccountID` AS `BenAccountID`,`benmap`.`BenSecureStackId` AS `BenSecureStackId`,`benmap`.`VanSerialNo` AS `VanSerialNo`,`benmap`.`VanID` AS `VanID`,`benadd`.`CurrStateId` AS `CurrStateId`,`benadd`.`CurrDistrictId` AS `CurrDistrictId`,`benadd`.`CurrSubDistrictId` AS `CurrSubDistrictId`,`benadd`.`CurrVillageId` AS `CurrVillageId`,`bendetail`.`FirstName` AS `FirstName`,`bendetail`.`MiddleName` AS `MiddleName`,`bendetail`.`LastName` AS `LastName`,`bendetail`.`GenderId` AS `GenderId`,`bendetail`.`FatherName` AS `fathername`,`bendetail`.`DOB` AS `DOB`,`bendetailr`.`houseoldId` AS `houseoldId`,`bendetailr`.`guidelineid` AS `guidelineid`,`bendetailr`.`rchid` AS `rchid` from (((`i_beneficiarymapping` `benmap` join `i_beneficiarydetails` `bendetail` on(((`benmap`.`BenDetailsId` = `bendetail`.`VanSerialNo`) and (`benmap`.`VanID` = `bendetail`.`VanID`)))) join `i_beneficiaryaddress` `benadd` on(((`benmap`.`BenAddressId` = `benadd`.`VanSerialNo`) and (`benmap`.`VanID` = `benadd`.`VanID`)))) left join `i_beneficiarydetails_rmnch` `bendetailr` on((`benmap`.`BenRegId` = `bendetailr`.`BeneficiaryRegID`))) */;
-- /*!50001 SET character_set_client      = @saved_cs_client */;
-- /*!50001 SET character_set_results     = @saved_cs_results */;
-- /*!50001 SET collation_connection      = @saved_col_connection */;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 10:43:44
