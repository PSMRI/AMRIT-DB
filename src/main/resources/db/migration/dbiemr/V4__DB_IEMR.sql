-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.5.5    Database: db_iemr
-- ------------------------------------------------------
-- Server version	5.7.19-log
 use db_iemr
--
-- Table structure for table `screening`
--
CREATE TABLE if not exists`screening_malaria` (
  `id` bigint(20)  NOT NULL AUTO_INCREMENT,
  `ben_id` bigint(20) DEFAULT NULL,
  `houseHoldDetailsId` bigint(20) DEFAULT NULL,
  `screening_date` date DEFAULT NULL,
  `beneficiary_status` varchar(255) DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `place_of_death` varchar(255) DEFAULT NULL,
  `other_place_of_death` varchar(255) DEFAULT NULL,
  `reason_for_death` varchar(255) DEFAULT NULL,
  `other_reason_for_death` varchar(255) DEFAULT NULL,
  `symptoms` text DEFAULT NULL,
  `case_status` varchar(255) DEFAULT NULL,
  `rapid_diagnostic_test` varchar(255) DEFAULT NULL,
  `date_of_rdt` date DEFAULT NULL,
  `slide_test_pf` varchar(255) DEFAULT NULL,
  `slide_test_pv` varchar(255) DEFAULT NULL,
  `date_of_slide_test` date DEFAULT NULL,
  `slide_no` varchar(255) DEFAULT NULL,
  `referred_to` int(11) DEFAULT NULL,
  `other_referred_facility` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date_of_visit_by_supervisor` date DEFAULT NULL,
  `diseaseTypeID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `date_of_visit_supervisor` date DEFAULT NULL,
  `caseStatusId` int(11) DEFAULT NULL,
  `refer_to_name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


CREATE TABLE  if not exists `screening_leprosy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ben_id` bigint(20) DEFAULT NULL,
  `houseHoldDetailsId` bigint(20) DEFAULT NULL,
  `home_visit_date` date DEFAULT NULL,
  `leprosy_status` varchar(225) DEFAULT NULL,
  `referred_to` varchar(225) DEFAULT NULL,
  `other_referred_to` text DEFAULT NULL,
  `leprosy_status_date` date DEFAULT NULL,
  `type_of_leprosy` varchar(225) DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `disease_status` varchar(225) DEFAULT NULL,
  `remark` varchar(225) DEFAULT NULL,
  `diseaseTypeID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE if not exists `screening_kala_azar` (
  `id` bigint(20) NOT NULL,
  `ben_id` bigint(20) DEFAULT NULL,
  `houseHoldDetailsId` bigint(20) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `beneficiary_status` varchar(50) DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `place_of_death` varchar(50) DEFAULT NULL,
  `other_place_of_death` varchar(255) DEFAULT NULL,
  `reason_for_death` varchar(50) DEFAULT NULL,
  `other_reason_for_death` varchar(255) DEFAULT NULL,
  `kala_azar_case_status` varchar(50) DEFAULT NULL,
  `kala_azar_case_count` int(11) DEFAULT 0,
  `rapid_diagnostic_test` varchar(20) DEFAULT NULL,
  `date_of_rdt` date DEFAULT NULL,
  `follow_up_point` int(11) DEFAULT NULL,
  `referred_to` varchar(100) DEFAULT NULL,
  `other_referred_facility` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `diseaseTypeID` int(11) DEFAULT NULL,
  `beneficiary_statusId` int(11) DEFAULT NULL,
  `refer_to_name` varchar(225) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE if not exists `screening_filaria` (
  `id` bigint(20) NOT NULL,
  `ben_id` bigint(20) DEFAULT NULL,
  `houseHoldDetailsId` bigint(20) DEFAULT NULL,
  `suffering_from_filariasis` tinyint(1) DEFAULT 0,
  `affected_body_part` varchar(50) DEFAULT NULL,
  `mda_home_visit_date` date DEFAULT NULL,
  `dose_status` varchar(5) DEFAULT NULL,
  `filariasis_case_count` int(11) DEFAULT 0,
  `other_dose_status_details` varchar(255) DEFAULT NULL,
  `medicine_side_effect` varchar(5) DEFAULT 'None',
  `other_side_effect_details` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `diseaseTypeID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);



CREATE TABLE if not exists  `screening_aesje` (
  `id` bigint(20) NOT NULL,
  `ben_id` bigint(20) DEFAULT NULL,
  `houseHoldDetailsId` bigint(20) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `beneficiary_status` varchar(50) DEFAULT 'Not Applicable',
  `date_of_death` date DEFAULT NULL,
  `place_of_death` varchar(50) DEFAULT NULL,
  `other_place_of_death` varchar(255) DEFAULT NULL,
  `reason_for_death` varchar(50) DEFAULT NULL,
  `other_reason_for_death` varchar(255) DEFAULT NULL,
  `aes_je_case_status` varchar(50) DEFAULT NULL,
  `aes_je_case_count` int(11) DEFAULT 0,
  `follow_up_point` int(11) DEFAULT NULL CHECK (`follow_up_point` between 1 and 6),
  `referred_to` varchar(100) DEFAULT NULL,
  `other_referred_facility` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `diseaseTypeID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Table structure for table `adolescent health`
--

CREATE TABLE if not exists `adolescent_health` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ben_id` bigint(20) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `ifa_tablet_distribution` tinyint(1) DEFAULT NULL,
  `quantity_of_ifa_tablets` int(11) DEFAULT NULL,
  `menstrual_hygiene_awareness_given` tinyint(1) DEFAULT NULL,
  `sanitary_napkin_distributed` tinyint(1) DEFAULT NULL,
  `no_of_packets_distributed` int(11) DEFAULT NULL,
  `place` varchar(225) DEFAULT NULL,
  `referred_to_health_facility` varchar(225) DEFAULT NULL,
  `counseling_provided` tinyint(1) DEFAULT NULL,
  `counseling_type` varchar(225) DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `referral_status` varchar(225) DEFAULT NULL,
  `health_status` varchar(225) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Table structure for table `vhnc_form`
--

CREATE TABLE if not exists `vhnc_form` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `vhnc_date` varchar(225) NOT NULL,
   `form_type` varchar(225) DEFAULT NULL,
   `created_by` varchar(225) DEFAULT NULL,
   `user_id` int(11) DEFAULT NULL,
   `place` varchar(255) DEFAULT NULL,
   `no_of_beneficiaries_attended` int(11) DEFAULT NULL,
   `image1` varchar(500) DEFAULT NULL,
   `image2` varchar(500) DEFAULT NULL,
   `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

 --
 -- Table structure for table `vhnd_form`
 --

 CREATE TABLE if not exists `vhnd_form` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `place` text DEFAULT NULL,
    `no_of_beneficiaries_attended` int(11) DEFAULT NULL,
    `image1` text DEFAULT NULL,
    `image2` text DEFAULT NULL,
    `created_by` varchar(225) DEFAULT NULL,
    `form_type` varchar(225) DEFAULT NULL,
    `user_id` int(11) DEFAULT NULL,
    `vhnd_date` varchar(225) DEFAULT NULL,
    `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
 -- Table structure for table `ahd_form`
 --
CREATE TABLE if not exists `ahd_form` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `mobilized_for_ahd` varchar(100) DEFAULT NULL,
   `ahd_place` varchar(255) DEFAULT NULL,
   `image1` varchar(500) DEFAULT NULL,
   `image2` varchar(500) DEFAULT NULL,
   `user_id` bigint(20) NOT NULL,
   `created_by` varchar(100) DEFAULT NULL,
   `form_type` varchar(50) DEFAULT NULL,
   `ahd_date` varchar(225) DEFAULT NULL,
   `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
 -- Table structure for table `deworming_form`
 --

CREATE TABLE if not exists `deworming_form` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `deworming_done` varchar(100) DEFAULT NULL,
   `deworming_location` varchar(255) DEFAULT NULL,
   `age_group` int(11) DEFAULT NULL,
   `image1` varchar(500) DEFAULT NULL,
   `image2` varchar(500) DEFAULT NULL,
   `user_id` bigint(20) NOT NULL,
   `created_by` varchar(100) DEFAULT NULL,
   `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
   `form_type` varchar(50) DEFAULT NULL,
   `deworming_date` varchar(225) DEFAULT NULL,
   `registration_date` varchar(225) DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 --
  -- Table structure for table `phc_review_meeting`
  --

 CREATE TABLE if not exists `phc_review_meeting` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `place` varchar(255) DEFAULT NULL,
    `no_of_beneficiaries_attended` int(11) DEFAULT NULL,
    `image1` varchar(500) DEFAULT NULL,
    `image2` varchar(500) DEFAULT NULL,
    `user_id` bigint(20) NOT NULL,
    `created_by` varchar(100) DEFAULT NULL,
    `form_type` varchar(50) DEFAULT NULL,
    `phc_review_date` varchar(225) DEFAULT NULL,
    `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  --
    -- Table structure for table `firebase user token`
    --
  CREATE TABLE if not exists `user_tokens` (
     `user_id` bigint(20) NOT NULL,
     `token` varchar(500) NOT NULL,
     `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
     PRIMARY KEY (`user_id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;