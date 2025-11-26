-- use db_iemr;

-- ALTER TABLE db_iemr.t_videocallparameter ADD COLUMN IF NOT EXISTS RecordingFileName VARCHAR(255);
 


 USE db_iemr;

-- 1) Check if column exists
SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = 'db_iemr'
  AND table_name = 't_videocallparameter'
  AND column_name = 'RecordingFileName';

-- 2) Build dynamic ALTER TABLE only if missing
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE db_iemr.t_videocallparameter ADD COLUMN RecordingFileName VARCHAR(255);',
    'SELECT "Column already exists";'
);

-- 3) Execute
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;