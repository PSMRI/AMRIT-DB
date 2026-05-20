USE db_iemr;

SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 't_delivery_outcome'
      AND COLUMN_NAME = 'gestational_age_at_delivery'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE t_delivery_outcome
        ADD COLUMN gestational_age_at_delivery VARCHAR(255) DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 't_delivery_outcome'
      AND COLUMN_NAME = 'delivery_conducted_by'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE t_delivery_outcome
        ADD COLUMN delivery_conducted_by VARCHAR(255) DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 't_delivery_outcome'
      AND COLUMN_NAME = 'modeOf_delivery'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE t_delivery_outcome
        ADD COLUMN modeOf_delivery VARCHAR(255) DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @column_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 't_delivery_outcome'
      AND COLUMN_NAME = 'mother_condition'
);

SET @sql = IF(@column_exists = 0,
    'ALTER TABLE t_delivery_outcome
        ADD COLUMN mother_condition VARCHAR(255) DEFAULT NULL',
    'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;