-- ============================================================
-- Stop TB Visit - Migration Script (idempotent)
-- ============================================================

USE db_iemr;

-- 1. Shared visit row for TB Screening / OPD / General Examination
CREATE TABLE IF NOT EXISTS tb_stoptb_visit (
  id                          BIGINT AUTO_INCREMENT PRIMARY KEY,
  beneficiary_reg_id          BIGINT,
  visit_no                    INT,
  visit_date                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  provider_service_map_id     INT,
  created_by                  VARCHAR(50),
  nurse_completed_flag        CHAR(1) DEFAULT 'N',
  doctor_completed_flag       CHAR(1) DEFAULT 'N',
  counsellor_completed_flag   CHAR(1) DEFAULT 'N',
  vanID                       INT,
  parkingPlaceID              INT,
  processed                   CHAR(1) DEFAULT 'N',
  vanSerialNo                 BIGINT,
  SyncedDate                  DATETIME,
  Syncedby                    VARCHAR(50),
  SyncFailureReason           VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. tb_suspected.visitCode
SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_iemr'
AND table_name = 'tb_suspected'
AND column_name = 'visitCode'
);
SET @sql = IF(@col_exists = 0,
'ALTER TABLE tb_suspected ADD COLUMN visitCode BIGINT NOT NULL DEFAULT 0',
'SELECT ''tb_suspected.visitCode skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 3. tb_confirmed_cases.visitCode
SET @col_exists = (
SELECT COUNT(*) FROM information_schema.columns
WHERE table_schema = 'db_iemr'
AND table_name = 'tb_confirmed_cases'
AND column_name = 'visitCode'
);
SET @sql = IF(@col_exists = 0,
'ALTER TABLE tb_confirmed_cases ADD COLUMN visitCode BIGINT NOT NULL DEFAULT 0',
'SELECT ''tb_confirmed_cases.visitCode skipped'''
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
