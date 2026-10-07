USE db_iemr;

UPDATE m_synctabledetail
SET ServerColumnName = TRIM(BOTH ',' FROM REPLACE(CONCAT(',', ServerColumnName, ','), ',bmi,', ',')),
    VanColumnName    = TRIM(BOTH ',' FROM REPLACE(CONCAT(',', VanColumnName, ','), ',bmi,', ','))
WHERE TableName = 'tb_screening'
  AND (FIND_IN_SET('bmi', ServerColumnName) > 0 OR FIND_IN_SET('bmi', VanColumnName) > 0);

SET @col_exists = (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema = 'db_iemr'
      AND table_name = 'tb_screening'
      AND column_name = 'bmi'
);

SET @sql = IF(@col_exists > 0,
    'ALTER TABLE tb_screening DROP COLUMN bmi;',
    'SELECT "bmi already dropped";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
