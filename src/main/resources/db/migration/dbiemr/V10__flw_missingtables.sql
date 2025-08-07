

use db_iemr;

CREATE TABLE if not exists `m_outreach` (
  `OutreachID` int(11) NOT NULL AUTO_INCREMENT,
  `OutreachType` varchar(20) DEFAULT NULL,
  `OutreachDesc` varchar(50) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OutreachID`),
  KEY `m_outreach_StateID_Fk` (`State_ID`),
  CONSTRAINT `m_outreach_StateID_Fk` FOREIGN KEY (`State_ID`) REFERENCES `m_state` (`StateID`)
) ;



CREATE TABLE  if not exists `t_outreach_activity` (
  `ActivityId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `ActivityName` varchar(100) DEFAULT NULL,
  `EventDesc` varchar(255) DEFAULT NULL,
  `NoOfParticipants` int(11) DEFAULT NULL,
  `ActivityDate` datetime DEFAULT NULL,
  `Img1` mediumblob,
  `Img1TimeStamp` datetime DEFAULT NULL,
  `Img1Latitude` double DEFAULT NULL,
  `Img1Longitude` double DEFAULT NULL,
  `Img1Address` varchar(255) DEFAULT NULL,
  `Img2` mediumblob,
  `Img2TimeStamp` datetime DEFAULT NULL,
  `Img2Latitude` double DEFAULT NULL,
  `Img2Longitude` double DEFAULT NULL,
  `Img2Address` varchar(255) DEFAULT NULL,
  `Deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ActivityId`)
) ;

ALTER TABLE t_outreach_activity ADD CONSTRAINT FK_t_outreach_activity_userid_idx 
  FOREIGN KEY (UserId) REFERENCES m_user(UserId);



CREATE TABLE  if not exists `t_user_activity_logs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LoginType` varchar(50) DEFAULT NULL,
  `LoginOption` varchar(50) DEFAULT NULL,
  `LogoutType` varchar(50) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `LogoutTime` datetime DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `UserImage` mediumblob,
  `IsOutOfReach` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
);





CREATE TABLE if not exists `t_prescription_templates` (
   `id` bigint NOT NULL AUTO_INCREMENT,
   `UserID` int NOT NULL,
   `TemplateID` int DEFAULT NULL,
   `TemplateName` varchar(100) NOT NULL,
   `DrugName` varchar(255) DEFAULT NULL,
   `DrugID` int DEFAULT NULL,
   `Frequency` varchar(100) DEFAULT NULL,
   `Unit` varchar(50) DEFAULT NULL,
   `Duration` varchar(50) DEFAULT NULL,
   `Instructions` varchar(255) DEFAULT NULL,
   `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `ModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `t_presc_templates_user_fk` (`UserID`),
   CONSTRAINT `t_presc_templates_user_fk` FOREIGN KEY (`UserID`) REFERENCES `m_user` (`UserID`) ON DELETE CASCADE
 ) ;



CREATE TABLE  if not exists `t_usermastervillagemapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `masterVillage_id` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `t_usermastervillagemapping_masterVillage_id_FK` (`masterVillage_id`),
  KEY `t_usermastervillagemapping_user_id_FK` (`user_id`),
  CONSTRAINT `t_usermastervillagemapping_masterVillage_id_FK` FOREIGN KEY (`masterVillage_id`) REFERENCES `m_districtbranchmapping` (`DistrictBranchID`),
  CONSTRAINT `t_usermastervillagemapping_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`UserID`)
) ;



CREATE TABLE  if not exists `m_userbiometricmapping` (
  `UserBiometricMapID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `GUID_LeftFinger` varchar(100) DEFAULT NULL,
  `GUID_RightFinger` varchar(100) DEFAULT NULL,
  `IsCompleted` bit(1) DEFAULT b'0',
  `Deleted` bit(1) DEFAULT b'0',
  `Processed` char(4) NOT NULL DEFAULT 'N',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` varchar(50) DEFAULT NULL,
  `LastModDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `right_thumb` blob,
  `right_index_finger` blob,
  `left_thumb` blob,
  `left_index_finger` blob,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UserBiometricMapID`),
  UNIQUE KEY `FK_UserBiometricMapping_User_idx` (`UserID`),
  CONSTRAINT `FK_UserBiometricMapping_User` FOREIGN KEY (`UserID`) REFERENCES `m_user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;


