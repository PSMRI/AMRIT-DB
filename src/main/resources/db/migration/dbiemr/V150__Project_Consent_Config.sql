-- Per-project consent configuration set from Admin-UI (Provider Admin -> Consent Configuration) and
-- read by the MMU consent dialog through Common-API /customization/consent/*.
--
-- t_projectconsentconfig        = the current configuration of a project (one row per project).
--                                 No row means version 0: never saved, the front end uses its default.
-- t_projectconsentconfighistory = one row per saved version; never updated or deleted. It is both the
--                                 version history and the audit trail of every save.
--
-- RegistrationConfig / RevisitConfig hold the ContextConfig documents of the front-end contract.
-- RevisitConfig NULL means "same rules as registration".
-- No personal data is stored in either table (nothing to add to the anonymisation registry).
-- Spec: Common-API specs/001-consent-config-apis.

CREATE TABLE IF NOT EXISTS `t_projectconsentconfig` (
  `ID`                 BIGINT       NOT NULL AUTO_INCREMENT,
  `ProjectID`          INT          NOT NULL COMMENT 'm_registrationprojects.ProjectID',
  `ProjectName`        VARCHAR(100) NOT NULL,
  `ServiceProviderID`  INT          NOT NULL,
  `Version`            INT          NOT NULL COMMENT 'starts at 1, +1 on every update',
  `RegistrationConfig` JSON         NOT NULL,
  `RevisitConfig`      JSON         NULL COMMENT 'NULL = same as registration',
  `Deleted`            BIT(1)       NOT NULL DEFAULT b'0',
  `CreatedBy`          VARCHAR(50)  NOT NULL,
  `CreatedDate`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy`         VARCHAR(50)  NULL,
  `LastModDate`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_ProjectConsentConfig_ProjectID` (`ProjectID`),
  KEY `IX_ProjectConsentConfig_SP` (`ServiceProviderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `t_projectconsentconfighistory` (
  `ID`                 BIGINT       NOT NULL AUTO_INCREMENT,
  `ProjectID`          INT          NOT NULL,
  `ServiceProviderID`  INT          NOT NULL,
  `Version`            INT          NOT NULL COMMENT 'the version this save produced',
  `BaseVersion`        INT          NOT NULL COMMENT '0 for a first save',
  `Action`             VARCHAR(10)  NOT NULL COMMENT 'CREATE or UPDATE',
  `RegistrationConfig` JSON         NOT NULL,
  `RevisitConfig`      JSON         NULL,
  `CreatedBy`          VARCHAR(50)  NOT NULL COMMENT 'user who saved',
  `CreatedDate`        DATETIME     NOT NULL COMMENT 'saved at (UTC, set by the application)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_ProjectConsentConfigHistory_Version` (`ProjectID`, `Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
