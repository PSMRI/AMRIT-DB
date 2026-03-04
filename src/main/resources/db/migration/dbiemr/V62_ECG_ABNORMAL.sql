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


-- ============================================================
-- Migration: Seed m_ecgAbnormalFindings (idempotent insert)
-- ============================================================
INSERT INTO db_iemr.m_ecgAbnormalFindings (FindingName)
SELECT val FROM (
    SELECT 'Atrial Fibrillation'                              AS val UNION ALL
    SELECT 'Atrial Flutter'                                   UNION ALL
    SELECT 'Cardiomyopathy'                                   UNION ALL
    SELECT 'Digoxin Toxicity'                                 UNION ALL
    SELECT 'Heart Block – First Degree'                       UNION ALL
    SELECT 'Heart Block – Second Degree (Mobitz I)'           UNION ALL
    SELECT 'Heart Block – Second Degree (Mobitz II)'          UNION ALL
    SELECT 'Heart Block – Third Degree (Complete Heart Block)' UNION ALL
    SELECT 'Hypercalcemia'                                    UNION ALL
    SELECT 'Hyperkalemia'                                     UNION ALL
    SELECT 'Hypocalcemia'                                     UNION ALL
    SELECT 'Hypokalemia'                                      UNION ALL
    SELECT 'Hypothermia'                                      UNION ALL
    SELECT 'Left Atrial Enlargement (LAE)'                    UNION ALL
    SELECT 'Left Bundle Branch Block (LBBB)'                  UNION ALL
    SELECT 'Left Ventricular Hypertrophy (LVH)'               UNION ALL
    SELECT 'Myocardial Infarction (STEMI)'                    UNION ALL
    SELECT 'Myocardial Ischemia (NSTEMI/Unstable Angina)'     UNION ALL
    SELECT 'Myocarditis'                                      UNION ALL
    SELECT 'Normal Sinus Rhythm'                              UNION ALL
    SELECT 'Old Myocardial Infarction'                        UNION ALL
    SELECT 'Pericarditis'                                     UNION ALL
    SELECT 'Pulmonary Embolism'                               UNION ALL
    SELECT 'Right Atrial Enlargement (RAE)'                   UNION ALL
    SELECT 'Right Bundle Branch Block (RBBB)'                 UNION ALL
    SELECT 'Right Ventricular Hypertrophy (RVH)'              UNION ALL
    SELECT 'Sinus Bradycardia'                                UNION ALL
    SELECT 'Sinus Tachycardia'                                UNION ALL
    SELECT 'Supraventricular Tachycardia (SVT)'               UNION ALL
    SELECT 'Ventricular Fibrillation (VF)'                    UNION ALL
    SELECT 'Ventricular Tachycardia (VT)'
) AS candidates
WHERE val NOT IN (
    SELECT FindingName FROM db_iemr.m_ecgAbnormalFindings
);