-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_identity
-- ------------------------------------------------------
-- Server version	5.7.19-log
use db_identity;
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


/*!50001 DROP VIEW IF EXISTS `v_benadvancesearch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `v_benadvancesearch` AS select `benmap`.`BenMapId` AS `BenMapId`,`benmap`.`BenRegId` AS `BenRegId`,`benmap`.`BenDetailsId` AS `BenDetailsId`,`benmap`.`BenAddressId` AS `BenAddressId`,`benmap`.`BenImageId` AS `BenImageId`,`benmap`.`BenContactsId` AS `BenContactsId`,`benmap`.`BenConsentId` AS `BenConsentId`,`benmap`.`BenAccountID` AS `BenAccountID`,`benmap`.`BenSecureStackId` AS `BenSecureStackId`,`benmap`.`VanSerialNo` AS `VanSerialNo`,`benmap`.`VanID` AS `VanID`,`benadd`.`CurrStateId` AS `CurrStateId`,`benadd`.`CurrDistrictId` AS `CurrDistrictId`,`benadd`.`CurrSubDistrictId` AS `CurrSubDistrictId`,`benadd`.`CurrVillageId` AS `CurrVillageId`,`bendetail`.`FirstName` AS `FirstName`,`bendetail`.`MiddleName` AS `MiddleName`,`bendetail`.`LastName` AS `LastName`,`bendetail`.`GenderId` AS `GenderId`,`bendetail`.`FatherName` AS `fathername`,`bendetail`.`DOB` AS `DOB`,`bendetailr`.`houseoldId` AS `houseoldId`,`bendetailr`.`guidelineid` AS `guidelineid`,`bendetailr`.`rchid` AS `rchid` from (((`i_beneficiarymapping` `benmap` join `i_beneficiarydetails` `bendetail` on(((`benmap`.`BenDetailsId` = `bendetail`.`VanSerialNo`) and (`benmap`.`VanID` = `bendetail`.`VanID`)))) join `i_beneficiaryaddress` `benadd` on(((`benmap`.`BenAddressId` = `benadd`.`VanSerialNo`) and (`benmap`.`VanID` = `benadd`.`VanID`)))) left join `i_beneficiarydetails_rmnch` `bendetailr` on((`benmap`.`BenRegId` = `bendetailr`.`BeneficiaryRegID`))) */;
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

-- Dump completed on 2024-08-09 10:43:44
