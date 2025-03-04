-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_iemr
-- ------------------------------------------------------
-- Server version	5.7.19-log
 
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
-- Table structure for table `asha_profile`
--


CREATE TABLE `asha_profile` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `name` varchar(255) NOT NULL,
   `village` varchar(255) NOT NULL,
   `employee_id` varchar(100) NOT NULL,
   `dob` varchar(15) DEFAULT NULL,
   `mobile_number` varchar(10) NOT NULL CHECK (`mobile_number` regexp '^[6789][0-9]{9}$'),
   `alternate_mobile_number` varchar(10) DEFAULT NULL CHECK (`alternate_mobile_number` regexp '^[6789][0-9]{9}$'),
   `father_or_spouse_name` varchar(255) NOT NULL,
   `date_of_joining` varchar(15) DEFAULT NULL,
   `bank_account` varchar(18) NOT NULL CHECK (`bank_account` regexp '^[0-9]{9,18}$'),
   `ifsc` varchar(11) DEFAULT NULL CHECK (`ifsc` regexp '^[A-Z]{4}[0-9]{7}$'),
   `population_covered` int(11) NOT NULL CHECK (`population_covered` > 0),
   `cho_name` varchar(255) NOT NULL,
   `cho_mobile` varchar(10) NOT NULL CHECK (`cho_mobile` regexp '^[6789][0-9]{9}$'),
   `aww_name` varchar(255) NOT NULL,
   `aww_mobile` varchar(10) NOT NULL CHECK (`aww_mobile` regexp '^[6789][0-9]{9}$'),
   `anm1_name` varchar(255) NOT NULL,
   `anm1_mobile` varchar(10) NOT NULL CHECK (`anm1_mobile` regexp '^[6789][0-9]{9}$'),
   `anm2_name` varchar(255) NOT NULL,
   `anm2_mobile` varchar(10) NOT NULL CHECK (`anm2_mobile` regexp '^[6789][0-9]{9}$'),
   `abha_number` varchar(14) NOT NULL CHECK (`abha_number` regexp '^[A-Za-z0-9]{14}$'),
   `asha_household_registration` varchar(255) NOT NULL,
   `asha_family_member` varchar(255) NOT NULL,
   `ProviderServiceMapID` varchar(100) DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `employee_id` (`employee_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4

--
-- Table structure for table `m_otp_beneficiary`
--

 CREATE TABLE `m_otp_beneficiary` (
   `Id` int(11) NOT NULL AUTO_INCREMENT,
   `phoneNumber` varchar(45) NOT NULL,
   `isOtpVerify` tinyint(1) DEFAULT 0,
   `otp` int(11) NOT NULL,
   `createdAt` timestamp NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`Id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4

--
-- Table structure for table `t_micro_birth_plan`
--

 CREATE TABLE `t_micro_birth_plan` (
   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
   `contact_no_1` varchar(10) DEFAULT NULL,
   `contact_no_2` varchar(10) DEFAULT NULL,
   `sc_hwc_tg_hosp` varchar(100) DEFAULT NULL,
   `block` varchar(100) DEFAULT NULL,
   `nearest_sc_hwc` varchar(100) DEFAULT NULL,
   `nearest_phc` varchar(100) DEFAULT NULL,
   `nearest_fru` varchar(100) DEFAULT NULL,
   `nearest_usg` varchar(100) DEFAULT NULL,
   `blood_group` varchar(10) DEFAULT NULL,
   `blood_donors` varchar(50) DEFAULT NULL,
   `birth_companion` varchar(50) DEFAULT NULL,
   `child_caretaker` varchar(50) DEFAULT NULL,
   `community_support` varchar(100) DEFAULT NULL,
   `transportation_mode` varchar(100) DEFAULT NULL,
   `user_id` bigint(20) NOT NULL,
   `community_support_contact` varchar(11) DEFAULT NULL,
   `ben_id` mediumtext DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4


 use db_iemr;

 alter table eligible_couple_tracking add lmp_date VARCHAR(50)  DEFAULT NULL;

 alter table t_eligible_couple_register add lmp_date VARCHAR(50)  DEFAULT NULL;

alter table anc_visit add file_path varchar(500) DEFAULT NULL;

