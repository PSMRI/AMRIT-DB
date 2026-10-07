-- ==========================================================
-- Drops the unused tb_screening.bmi flag (Boolean, added in V66). No application code reads or
-- writes it; it has been removed from FLW-API TBScreening / TBScreeningDTO.
--
-- Order matters: tb_screening is synced van<->central via m_synctabledetail, and 'bmi' is listed
-- in both ServerColumnName and VanColumnName. The van SELECTs VanColumnName from its local table
-- and central writes ServerColumnName, so dropping the column while it is still listed fails the
-- whole table's sync with "Unknown column 'bmi'". The mapping is therefore cleaned first, then
-- the column is dropped.
--
-- Rollout: vans hold their own copy of m_synctabledetail and tb_screening, so this migration
-- must be applied on vans together with central.
--
-- Idempotent: the UPDATE only matches rows still listing 'bmi', and the DROP is guarded.
-- ==========================================================

USE db_iemr;

-- ----------------------------------------------------------
-- 1. Remove bmi from the sync column mapping (exact token match only)
-- ----------------------------------------------------------

UPDATE m_synctabledetail
SET ServerColumnName = TRIM(BOTH ',' FROM REPLACE(CONCAT(',', ServerColumnName, ','), ',bmi,', ',')),
    VanColumnName    = TRIM(BOTH ',' FROM REPLACE(CONCAT(',', VanColumnName, ','), ',bmi,', ','))
WHERE TableName = 'tb_screening'
  AND (FIND_IN_SET('bmi', ServerColumnName) > 0 OR FIND_IN_SET('bmi', VanColumnName) > 0);

-- ----------------------------------------------------------
-- 2. Drop tb_screening.bmi
-- ----------------------------------------------------------

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
