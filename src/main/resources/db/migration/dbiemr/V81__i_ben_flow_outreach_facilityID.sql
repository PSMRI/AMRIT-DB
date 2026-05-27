USE db_iemr;

SET @dbname = DATABASE();

SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = @dbname
      AND TABLE_NAME = 'i_ben_flow_outreach'
      AND COLUMN_NAME = 'facilityID'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE i_ben_flow_outreach ADD COLUMN facilityID INT NULL',
    'SELECT "Column facilityID already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
