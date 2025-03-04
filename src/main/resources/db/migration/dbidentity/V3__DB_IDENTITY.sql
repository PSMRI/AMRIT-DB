-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_identity
-- ------------------------------------------------------
-- Server version	5.7.19-log
use db_identity;

--
-- Table structure for table 'i_beneficiarydetails'
--
DROP TABLE IF EXISTS `i_beneficiarydetails`;
CREATE TABLE `i_beneficiarydetails` (
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
  `areaId` int(11) DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `phcId` int(11) DEFAULT NULL,
  `Remarks` varchar(300) DEFAULT NULL,
  `familyid` varchar(50) DEFAULT NULL,
  `HeadofFamily_RelationID` int(11) DEFAULT NULL,
  `HeadofFamily_Relation` varchar(50) DEFAULT NULL,
  `Others` varchar(100) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `Reserved` bit(1) DEFAULT b'0',
  `ReservedFor` varchar(45) DEFAULT NULL,
  `ReservedOn` varchar(45) DEFAULT NULL,
  `ReservedById` int(11) DEFAULT NULL,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `faceEmbedding` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`faceEmbedding`)),
  `ExtraFields` varchar(500) DEFAULT NULL,
  `isConsent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`BeneficiaryDetailsId`),
  UNIQUE KEY `BeneficiaryRegID_UNIQUE` (`BeneficiaryRegID`),
  KEY `IX_CreatedDate` (`CreatedDate`),
  KEY `inx_VanSerialNo` (`VanSerialNo`),
  KEY `inx_vanid` (`VanID`),
  KEY `inx_GenderId` (`GenderId`),
  KEY `inx_familyid` (`familyid`)
) ENGINE=InnoDB AUTO_INCREMENT=5048668 DEFAULT CHARSET=utf8


use db_identity
 alter table i_beneficiarydetails add isConsent varchar  DEFAULT NULL;

 alter table i_bornbirthdeatils add birthCertificateFileFrontView varchar(500)  DEFAULT NULL;

 alter table i_bornbirthdeatils add birthCertificateFileBackView varchar(500)  DEFAULT NULL;




-- Dump completed on 2024-08-09 10:43:44
