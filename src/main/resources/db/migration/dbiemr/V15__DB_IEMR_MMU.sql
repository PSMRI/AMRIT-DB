-- Only modify if datatype is NOT already TEXT
SET @need_change := (
    SELECT CASE 
        WHEN DATA_TYPE <> 'text' THEN 1
        ELSE 0
    END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 't_cancergynecologicalexamination'
      AND COLUMN_NAME = 'FilePath'
);

SET @sql := IF(@need_change = 1,
    'ALTER TABLE t_cancergynecologicalexamination MODIFY COLUMN FilePath TEXT NULL;',
    'SELECT "Column already correct — no change applied."'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
