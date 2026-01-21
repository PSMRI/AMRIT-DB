USE db_iemr;

-- Add village_name column if it doesn't exist
SET @dbname = 'db_iemr';
SET @tablename = 'vhnc_form';
SET @columnname = 'village_name';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(255) COMMENT "Village name where meeting held";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add auxiliary_nurse_midwife_multipurpose_worker_attended column if it doesn't exist
SET @columnname = 'auxiliary_nurse_midwife_multipurpose_worker_attended';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT 0 COMMENT "Number of Auxiliary Nurse Midwife/Multi Purpose Worker attended";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add anganwadi_worker_attended column if it doesn't exist
SET @columnname = 'anganwadi_worker_attended';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT 0 COMMENT "Number of Anganwadi Worker attended";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add pregnant_women_count column if it doesn't exist
SET @columnname = 'pregnant_women_count';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT 0 COMMENT "Number of pregnant women attended";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add lactating_mothers_count column if it doesn't exist
SET @columnname = 'lactating_mothers_count';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT 0 COMMENT "Number of lactating mothers attended";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add committee_members_present column if it doesn't exist
SET @columnname = 'committee_members_present';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT 0 COMMENT "Number of committee members present";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- Add previous_meeting_followup column if it doesn't exist
SET @columnname = 'previous_meeting_followup';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (TABLE_SCHEMA = @dbname)
      AND (TABLE_NAME = @tablename)
      AND (COLUMN_NAME = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @dbname, '.', @tablename, ' ADD COLUMN ', @columnname, ' TEXT COMMENT "Follow-up notes from previous meeting";')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;