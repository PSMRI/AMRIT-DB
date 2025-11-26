-- Check and modify Range_normal_min
SET @need_change1 := (
    SELECT CASE 
        WHEN DATA_TYPE <> 'decimal' 
             OR NUMERIC_PRECISION <> 10 
             OR NUMERIC_SCALE <> 2 
        THEN 1 ELSE 0 END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 'm_testcomponent'
      AND COLUMN_NAME = 'Range_normal_min'
);

SET @sql1 := IF(@need_change1 = 1,
    'ALTER TABLE db_iemr.m_testcomponent MODIFY Range_normal_min DECIMAL(10,2);',
    'SELECT "Range_normal_min already correct";'
);

PREPARE stmt1 FROM @sql1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;


-- Check and modify Range_normal_max
SET @need_change2 := (
    SELECT CASE 
        WHEN DATA_TYPE <> 'decimal' 
             OR NUMERIC_PRECISION <> 10 
             OR NUMERIC_SCALE <> 2 
        THEN 1 ELSE 0 END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 'm_testcomponent'
      AND COLUMN_NAME = 'Range_normal_max'
);

SET @sql2 := IF(@need_change2 = 1,
    'ALTER TABLE db_iemr.m_testcomponent MODIFY Range_normal_max DECIMAL(10,2);',
    'SELECT "Range_normal_max already correct";'
);

PREPARE stmt2 FROM @sql2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;


-- Check and modify Range_max
SET @need_change3 := (
    SELECT CASE 
        WHEN DATA_TYPE <> 'decimal' 
             OR NUMERIC_PRECISION <> 10 
             OR NUMERIC_SCALE <> 2 
        THEN 1 ELSE 0 END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_iemr'
      AND TABLE_NAME = 'm_testcomponent'
      AND COLUMN_NAME = 'Range_max'
);

SET @sql3 := IF(@need_change3 = 1,
    'ALTER TABLE db_iemr.m_testcomponent MODIFY Range_max DECIMAL(10,2);',
    'SELECT "Range_max already correct";'
);

PREPARE stmt3 FROM @sql3;
EXECUTE stmt3;
DEALLOCATE PREPARE stmt3;
