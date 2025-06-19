-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_identity
-- ------------------------------------------------------
-- Server version	5.7.19-log
use db_identity;

--
-- Table structure for table 'i_beneficiarydetails'
--

use db_identity;

alter table i_beneficiarydetails add isConsent varchar(50) DEFAULT NULL;

alter table i_bornbirthdeatils add birthCertificateFileFrontView varchar(500)  DEFAULT NULL;

alter table i_bornbirthdeatils add birthCertificateFileBackView varchar(500)  DEFAULT NULL;

