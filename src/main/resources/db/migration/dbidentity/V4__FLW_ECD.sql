-- use db_identity;

-- alter table i_cbac_additional_details modify cbacAdditionalDetailId bigint NOT NULL  AUTO_INCREMENT;


USE db_identity;

-- Check if cbacAdditionalDetailId is NOT already BIGINT AUTO_INCREMENT
SET @need_change := (
    SELECT CASE
        WHEN DATA_TYPE = 'bigint'
             AND EXTRA LIKE '%auto_increment%'
        THEN 0 ELSE 1 END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'db_identity'
      AND TABLE_NAME = 'i_cbac_additional_details'
      AND COLUMN_NAME = 'cbacAdditionalDetailId'
);

-- Build ALTER TABLE query only if needed
SET @sql := IF(
    @need_change = 1,
    'ALTER TABLE db_identity.i_cbac_additional_details MODIFY cbacAdditionalDetailId BIGINT NOT NULL AUTO_INCREMENT;',
    'SELECT "cbacAdditionalDetailId already BIGINT AUTO_INCREMENT";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
