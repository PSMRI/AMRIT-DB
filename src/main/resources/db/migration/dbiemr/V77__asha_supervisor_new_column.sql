USE db_iemr;

SET @column_exists = (

    SELECT COUNT(*) 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'm_incentive_activity'
      AND COLUMN_NAME = 'is_default_activity'
);

SET @sql = IF(@column_exists = 0,
        'ALTER TABLE m_translation ADD COLUMN is_default_activity tinyint(1) NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'approval_status'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN approval_status INT NULL DEFAULT 102',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- verifiedBy_userId
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'verifiedBy_userId'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN verifiedBy_userId INT NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- verifiedBy_userName
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'verifiedBy_userName'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN verifiedBy_userName VARCHAR(250) NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- reason
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'reason'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN reason VARCHAR(5000) NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- other_reason
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'other_reason'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN other_reason VARCHAR(2000) NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- is_claimed
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'is_claimed'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN is_claimed TINYINT(1) DEFAULT 0',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- approval_date
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'approval_date'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN approval_date DATETIME NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- claimed_date
SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'incentive_activity_record'
      AND COLUMN_NAME = 'claimed_date'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE incentive_activity_record
        ADD COLUMN claimed_date DATETIME NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
