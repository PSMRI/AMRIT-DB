USE dbiemr;

-- ================================================================
-- Create: Feedback Categories
-- ================================================================
CREATE TABLE if not EXISTS m_feedback_category (
  CategoryID CHAR(36) PRIMARY KEY,
  Slug VARCHAR(64) NOT NULL COMMENT 'Stable machine identifier; lowercase alphanumeric with optional dashes',
  Label VARCHAR(128) NOT NULL,
  Scope ENUM('GLOBAL','1097','104','AAM','MMU','TM','ECD') NOT NULL DEFAULT 'GLOBAL',
  Active BIT(1) NOT NULL DEFAULT b'1',

  -- DB-managed timestamps
  CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT uq_category_slug UNIQUE (Slug),
  CONSTRAINT chk_category_slug_format CHECK (Slug REGEXP '^[a-z0-9]+(-[a-z0-9]+)*$')
);

-- ================================================================
-- Create: Platform Feedback
-- ================================================================
CREATE TABLE if not EXISTS  m_platform_feedback (
  FeedbackID CHAR(36) PRIMARY KEY,

  -- DB-managed timestamps
  CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  Rating TINYINT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
  CategoryID CHAR(36) NOT NULL,

  -- Comment optional (nullable) since FE allows blank
  Comment TEXT NULL,

  ServiceLine ENUM('1097','104','AAM','MMU','TM','ECD') NOT NULL,
  IsAnonymous BIT(1) NOT NULL DEFAULT b'1',
  UserID INT,

  CONSTRAINT fk_platform_feedback_user FOREIGN KEY (UserID) REFERENCES m_user(UserID),
  CONSTRAINT fk_platform_feedback_category FOREIGN KEY (CategoryID) REFERENCES m_feedback_category(CategoryID)
);

-- ================================================================
-- Helpful indexes
-- ================================================================
-- CREATE INDEX  ix_feedback_ServiceLine ON m_platform_feedback (ServiceLine);
-- CREATE INDEX  ix_feedback_CategoryID  ON m_platform_feedback (CategoryID);
-- CREATE INDEX  ix_feedback_IsAnonymous ON m_platform_feedback (IsAnonymous);

USE dbiemr;

SET @idx_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'm_platform_feedback'
      AND INDEX_NAME = 'ix_feedback_ServiceLine'
);

SET @sql := IF(
    @idx_exists = 0,
    'ALTER TABLE m_platform_feedback ADD INDEX ix_feedback_ServiceLine (ServiceLine);',
    'SELECT "Index ix_feedback_ServiceLine already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;




SET @idx_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'm_platform_feedback'
      AND INDEX_NAME = 'ix_feedback_CategoryID'
);

SET @sql := IF(
    @idx_exists = 0,
    'ALTER TABLE m_platform_feedback ADD INDEX ix_feedback_CategoryID (CategoryID);',
    'SELECT "Index ix_feedback_CategoryID already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



SET @idx_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'm_platform_feedback'
      AND INDEX_NAME = 'ix_feedback_IsAnonymous'
);

SET @sql := IF(
    @idx_exists = 0,
    'ALTER TABLE m_platform_feedback ADD INDEX ix_feedback_IsAnonymous (IsAnonymous);',
    'SELECT "Index ix_feedback_IsAnonymous already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

