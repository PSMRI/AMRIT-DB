

use db_identity;

-- make ALTER add operations idempotent: only add columns if they do NOT already exist
-- alter table i_beneficiarydetails add column if not exists ExtraFields JSON after `Others`;
 
-- alter table i_beneficiarydetails add column if not exists faceEmbedding longtext after `Others`;


USE db_identity;

-- ==========================================
-- Add ExtraFields column only if NOT exists
-- ==========================================

SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'ExtraFields'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN ExtraFields JSON AFTER `Others`;',
    'SELECT "Column ExtraFields already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- ==========================================
-- Add faceEmbedding column only if NOT exists
-- ==========================================

SET @col_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_beneficiarydetails'
      AND COLUMN_NAME = 'faceEmbedding'
);

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE i_beneficiarydetails ADD COLUMN faceEmbedding LONGTEXT AFTER `Others`;',
    'SELECT "Column faceEmbedding already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
