-- Sample SQL Dump for Testing
-- AMRIT Database Anonymization

-- Create database
CREATE DATABASE IF NOT EXISTS `test_db`;
USE `test_db`;

-- Create table
CREATE TABLE IF NOT EXISTS `m_user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `PhoneNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert single row
INSERT INTO `m_user` (`UserID`, `UserName`, `Password`, `EmailID`, `PhoneNo`) VALUES (1, 'John Doe', 'hashed_password_123', 'john@example.com', '9876543210');

-- Insert batch rows
INSERT INTO `m_user` VALUES 
(2, 'Jane Smith', 'password456', 'jane@example.com', '9123456789'),
(3, 'Bob Johnson', 'pass789', 'bob@example.com', NULL),
(4, 'Alice Brown', 'alice_pass', NULL, '9998887777');

-- Insert with special characters
INSERT INTO `m_user` (`UserID`, `UserName`, `Password`) VALUES (5, 'O\'Connor', 'p@ss"word');

-- Create another table
CREATE TABLE `t_beneficiary` (
  `BenRegID` varchar(50) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BenRegID`)
) ENGINE=InnoDB;

-- Insert into second table
INSERT INTO t_beneficiary (BenRegID, FirstName, LastName) VALUES ('BEN001', 'Rajesh', 'Kumar');
INSERT INTO t_beneficiary VALUES ('BEN002', 'Priya', 'Sharma'), ('BEN003', 'Amit', 'Patel');

-- Comments are preserved
-- This is important metadata

/* Multi-line comment
   for documentation
   purposes */

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
