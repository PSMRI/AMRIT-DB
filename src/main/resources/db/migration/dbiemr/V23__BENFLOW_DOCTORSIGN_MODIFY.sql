SELECT COUNT(*) INTO @c1
FROM information_schema.columns
WHERE table_schema = 'db_iemr'
  AND table_name = 'i_ben_flow_outreach'
  AND column_name = 'doctor_signature_flag';

SET @sql1 = IF(
    @c1 = 0,
    'ALTER TABLE db_iemr.i_ben_flow_outreach ADD COLUMN doctor_signature_flag TINYINT(1) DEFAULT 0;',
    'SELECT "doctor_signature_flag already exists";'
);

PREPARE stmt1 FROM @sql1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;