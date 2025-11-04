USE db_iemr;

-- ================================================================
-- Create: Feedback Categories
-- ================================================================

CREATE TABLE IF NOT EXISTS `m_feedback_category` (
   `CategoryID` char(36) NOT NULL,
   `Slug` varchar(64) NOT NULL COMMENT 'Stable machine identifier; lowercase alphanumeric with optional dashes',
   `Label` varchar(128) NOT NULL,
   `Scope` enum('GLOBAL','1097','104','AAM','MMU','TM','ECD') NOT NULL DEFAULT 'GLOBAL',
   `Active` bit(1) NOT NULL DEFAULT b'1',
   `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `UpdatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`CategoryID`),
   UNIQUE KEY `uq_category_slug` (`Slug`),
   CONSTRAINT `chk_category_slug_format` CHECK (regexp_like(`Slug`,_utf8mb4'^[a-z0-9]+(-[a-z0-9]+)*$'))
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- ================================================================
-- Create: Platform Feedback
-- ================================================================
CREATE TABLE IF NOT EXISTS `m_platform_feedback` (
   `FeedbackID` char(36) NOT NULL,
   `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `UpdatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `Rating` tinyint NOT NULL,
   `CategoryID` char(36) NOT NULL,
   `Comment` text,
   `ServiceLine` enum('1097','104','AAM','MMU','TM','ECD') NOT NULL,
   `IsAnonymous` bit(1) NOT NULL DEFAULT b'1',
   `UserID` int DEFAULT NULL,
   PRIMARY KEY (`FeedbackID`),
   KEY `fk_platform_feedback_user` (`UserID`),
   CONSTRAINT `fk_platform_feedback_category` FOREIGN KEY (`CategoryID`) REFERENCES `m_feedback_category` (`CategoryID`),
   CONSTRAINT `fk_platform_feedback_user` FOREIGN KEY (`UserID`) REFERENCES `m_user` (`UserID`),
   CONSTRAINT `m_platform_feedback_chk_1` CHECK ((`Rating` between 1 and 5))
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- ================================================================
-- Helpful indexes
-- ================================================================
CREATE INDEX `ix_feedback_CreatedAt`   ON `m_platform_feedback` (`CreatedAt`);
CREATE INDEX `ix_feedback_ServiceLine` ON `m_platform_feedback` (`ServiceLine`);
CREATE INDEX `ix_feedback_CategoryID`  ON `m_platform_feedback` (`CategoryID`);
CREATE INDEX `ix_feedback_IsAnonymous` ON `m_platform_feedback` (`IsAnonymous`);
