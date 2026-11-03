USE db_identity;

SET @idx_exists = (
    SELECT COUNT(*)
    FROM information_schema.statistics
    WHERE table_schema = 'db_identity'
      AND table_name = 'm_beneficiaryregidmapping'
      AND index_name = 'idx_prov_res_benregid'
);

SET @sql = IF(
    @idx_exists = 0,
    'ALTER TABLE m_beneficiaryregidmapping
     ADD INDEX idx_prov_res_benregid
     (Provisioned, Reserved, BenRegId),
     ALGORITHM=INPLACE,
     LOCK=NONE',
    'SELECT ''idx_prov_res_benregid already exists'''
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;