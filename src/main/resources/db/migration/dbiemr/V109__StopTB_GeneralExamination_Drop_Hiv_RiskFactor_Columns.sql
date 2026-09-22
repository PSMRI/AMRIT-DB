USE db_iemr;

-- tb_screening is the source of truth for these 4 fields; backfill it from
-- tb_stoptb_general_examination before dropping the duplicate columns below.
--
-- Join key: direct via beneficiary_reg_id/ben_reg_id (nurse flow), or via
-- ben_id -> db_identity.m_beneficiaryregidmapping -> beneficiary_reg_id
-- (legacy ASHA flow). Per-column correlated subqueries (not a plain JOIN),
-- picking the most recent match (ORDER BY ge.id DESC LIMIT 1) per column,
-- because the ASHA bridge can match one tb_screening row to more than one
-- tb_stoptb_general_examination row.

UPDATE db_iemr.tb_screening s
SET
    s.key_population_risk_factor_ids = IF(
        s.key_population_risk_factor_ids IS NULL,
        (SELECT ge.key_population_risk_factor_ids
         FROM db_iemr.tb_stoptb_general_examination ge
         WHERE ge.key_population_risk_factor_ids IS NOT NULL
           AND (ge.beneficiary_reg_id = s.ben_reg_id
                OR EXISTS (
                    SELECT 1 FROM db_identity.m_beneficiaryregidmapping m
                    WHERE m.BeneficiaryID = s.ben_id AND m.benRegId = ge.beneficiary_reg_id
                ))
         ORDER BY ge.id DESC
         LIMIT 1),
        s.key_population_risk_factor_ids
    ),
    s.key_population_risk_factors = IF(
        s.key_population_risk_factors IS NULL,
        (SELECT ge.key_population_risk_factors
         FROM db_iemr.tb_stoptb_general_examination ge
         WHERE ge.key_population_risk_factors IS NOT NULL
           AND (ge.beneficiary_reg_id = s.ben_reg_id
                OR EXISTS (
                    SELECT 1 FROM db_identity.m_beneficiaryregidmapping m
                    WHERE m.BeneficiaryID = s.ben_id AND m.benRegId = ge.beneficiary_reg_id
                ))
         ORDER BY ge.id DESC
         LIMIT 1),
        s.key_population_risk_factors
    ),
    s.hiv_status_id = IF(
        s.hiv_status_id IS NULL,
        (SELECT ge.hiv_status_id
         FROM db_iemr.tb_stoptb_general_examination ge
         WHERE ge.hiv_status_id IS NOT NULL
           AND (ge.beneficiary_reg_id = s.ben_reg_id
                OR EXISTS (
                    SELECT 1 FROM db_identity.m_beneficiaryregidmapping m
                    WHERE m.BeneficiaryID = s.ben_id AND m.benRegId = ge.beneficiary_reg_id
                ))
         ORDER BY ge.id DESC
         LIMIT 1),
        s.hiv_status_id
    ),
    s.hiv_status = IF(
        s.hiv_status IS NULL,
        (SELECT ge.hiv_status
         FROM db_iemr.tb_stoptb_general_examination ge
         WHERE ge.hiv_status IS NOT NULL
           AND (ge.beneficiary_reg_id = s.ben_reg_id
                OR EXISTS (
                    SELECT 1 FROM db_identity.m_beneficiaryregidmapping m
                    WHERE m.BeneficiaryID = s.ben_id AND m.benRegId = ge.beneficiary_reg_id
                ))
         ORDER BY ge.id DESC
         LIMIT 1),
        s.hiv_status
    )
WHERE EXISTS (
    SELECT 1
    FROM db_iemr.tb_stoptb_general_examination ge
    WHERE (ge.beneficiary_reg_id = s.ben_reg_id
           OR EXISTS (
               SELECT 1 FROM db_identity.m_beneficiaryregidmapping m
               WHERE m.BeneficiaryID = s.ben_id AND m.benRegId = ge.beneficiary_reg_id
           ))
      AND ((s.key_population_risk_factor_ids IS NULL AND ge.key_population_risk_factor_ids IS NOT NULL)
        OR (s.key_population_risk_factors    IS NULL AND ge.key_population_risk_factors    IS NOT NULL)
        OR (s.hiv_status_id                  IS NULL AND ge.hiv_status_id                  IS NOT NULL)
        OR (s.hiv_status                     IS NULL AND ge.hiv_status                     IS NOT NULL))
);

-- Drop the now-redundant columns (idempotent, matches V94's convention).
SET @col_exists = (
    SELECT COUNT(*) FROM information_schema.columns
    WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination'
      AND column_name = 'key_population_risk_factor_ids'
);
SET @sql = IF(@col_exists > 0,
    'ALTER TABLE db_iemr.tb_stoptb_general_examination DROP COLUMN key_population_risk_factor_ids;',
    'SELECT "Column key_population_risk_factor_ids already dropped";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
    SELECT COUNT(*) FROM information_schema.columns
    WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination'
      AND column_name = 'key_population_risk_factors'
);
SET @sql = IF(@col_exists > 0,
    'ALTER TABLE db_iemr.tb_stoptb_general_examination DROP COLUMN key_population_risk_factors;',
    'SELECT "Column key_population_risk_factors already dropped";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
    SELECT COUNT(*) FROM information_schema.columns
    WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination'
      AND column_name = 'hiv_status_id'
);
SET @sql = IF(@col_exists > 0,
    'ALTER TABLE db_iemr.tb_stoptb_general_examination DROP COLUMN hiv_status_id;',
    'SELECT "Column hiv_status_id already dropped";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
    SELECT COUNT(*) FROM information_schema.columns
    WHERE table_schema = 'db_iemr' AND table_name = 'tb_stoptb_general_examination'
      AND column_name = 'hiv_status'
);
SET @sql = IF(@col_exists > 0,
    'ALTER TABLE db_iemr.tb_stoptb_general_examination DROP COLUMN hiv_status;',
    'SELECT "Column hiv_status already dropped";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
