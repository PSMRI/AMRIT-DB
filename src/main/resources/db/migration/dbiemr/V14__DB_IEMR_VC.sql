-- use dbiemr;

-- ALTER TABLE dbiemr.t_videocallparameter ADD COLUMN IF NOT EXISTS RecordingFileName VARCHAR(255);
 


 USE dbiemr;

-- 1) Check if column exists
SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = 'dbiemr'
  AND table_name = 't_videocallparameter'
  AND column_name = 'RecordingFileName';


SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE dbiemr.t_videocallparameter ADD COLUMN RecordingFileName VARCHAR(255);',
    'SELECT "Column already exists";'
);


PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;