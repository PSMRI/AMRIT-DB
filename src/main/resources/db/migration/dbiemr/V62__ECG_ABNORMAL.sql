-- ============================================================
-- Migration: Add abnormal_findings column to t_lab_testresult
-- ============================================================
SET @col_exists = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME   = 't_lab_testresult'
      AND COLUMN_NAME  = 'abnormal_findings'
);

SET @alter_col = IF(
    @col_exists = 0,
    'ALTER TABLE t_lab_testresult ADD COLUMN abnormal_findings JSON',
    'SELECT ''Column abnormal_findings already exists, skipping.'' AS migration_note'
);

PREPARE stmt FROM @alter_col;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- ============================================================
-- Migration: Create m_ecgAbnormalFindings table
-- ============================================================
CREATE TABLE IF NOT EXISTS m_ecgAbnormalFindings (
    FindingID   INT          PRIMARY KEY AUTO_INCREMENT,
    FindingName VARCHAR(255) NOT NULL,
    Deleted     BOOLEAN      DEFAULT FALSE,
    Processed   VARCHAR(50),
    CreatedBy   VARCHAR(255),
    CreatedDate TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    ModifiedBy  VARCHAR(255),
    LastModDate TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);