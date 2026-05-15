USE db_iemr;

SET @column_exists = (

    SELECT COUNT(*) 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'form_field_options'
      AND COLUMN_NAME = 'label_bn'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE form_field_options ADD COLUMN label_bn varchar(500) NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'm_translation'
      AND COLUMN_NAME = 'bengali_translation'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE m_translation ADD COLUMN bengali_translation varchar(500) NULL DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
