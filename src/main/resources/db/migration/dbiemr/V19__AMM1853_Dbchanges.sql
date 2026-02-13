
-- alter table t_pmsma
--   add column visitDate datetime null,
--   add column visitNo smallint null,
--   add column anyOtherHighRiskCondition varchar(100) null;

USE dbiemr;

-- =============================
-- Add visitDate
-- =============================
SELECT COUNT(*) INTO @c1
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = 't_pmsma'
  AND column_name = 'visitDate';

SET @sql1 = IF(
    @c1 = 0,
    'ALTER TABLE t_pmsma ADD COLUMN visitDate DATETIME NULL;',
    'SELECT "visitDate already exists";'
);
PREPARE stmt1 FROM @sql1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;


-- =============================
-- Add visitNo
-- =============================
SELECT COUNT(*) INTO @c2
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = 't_pmsma'
  AND column_name = 'visitNo';

SET @sql2 = IF(
    @c2 = 0,
    'ALTER TABLE t_pmsma ADD COLUMN visitNo SMALLINT NULL;',
    'SELECT "visitNo already exists";'
);
PREPARE stmt2 FROM @sql2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;


-- =============================
-- Add anyOtherHighRiskCondition
-- =============================
SELECT COUNT(*) INTO @c3
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = 't_pmsma'
  AND column_name = 'anyOtherHighRiskCondition';

SET @sql3 = IF(
    @c3 = 0,
    'ALTER TABLE t_pmsma ADD COLUMN anyOtherHighRiskCondition VARCHAR(100) NULL;',
    'SELECT "anyOtherHighRiskCondition already exists";'
);
PREPARE stmt3 FROM @sql3;
EXECUTE stmt3;
DEALLOCATE PREPARE stmt3;



