-- Indexes for the STOP-TB read paths (village worklist, TB getAll lists, diagnostic order status).
-- Without them these reads scan whole tables; the diagnostic status summary in particular runs a
-- correlated MAX(id) per order and was quadratic (minutes per call on a 20k village).
-- Each index is created only if it is missing and every column it needs exists, so this is safe to
-- re-run and does nothing on a database that lacks a STOP-TB table or column.

-- Village worklist paging: PSM + village + deleted, ordered by registration date
SET @need = 4;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'i_ben_flow_outreach' AND column_name IN ('providerServiceMapID', 'villageID', 'deleted', 'registrationDate'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'i_ben_flow_outreach' AND index_name = 'idx_flow_psm_village_reg');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_flow_psm_village_reg` ON `i_ben_flow_outreach` (`providerServiceMapID`, `villageID`, `deleted`, `registrationDate`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Diagnostic order: latest order per beneficiary and type (status summary, order push)
SET @need = 3;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_diagnostic_order' AND column_name IN ('beneficiary_id', 'order_type', 'id'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_diagnostic_order' AND index_name = 'idx_dorder_ben_type_id');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_dorder_ben_type_id` ON `tb_diagnostic_order` (`beneficiary_id`, `order_type`, `id`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Diagnostic order: poll scheduler and outstanding-order scans by type, status and day
SET @need = 3;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_diagnostic_order' AND column_name IN ('order_type', 'status', 'created_date'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_diagnostic_order' AND index_name = 'idx_dorder_type_status_created');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_dorder_type_status_created` ON `tb_diagnostic_order` (`order_type`, `status`, `created_date`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- General examination by beneficiary (getAll village filter, save upsert by visit)
SET @need = 2;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_stoptb_general_examination' AND column_name IN ('beneficiary_reg_id', 'visitCode'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_stoptb_general_examination' AND index_name = 'idx_genexam_ben_visit');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_genexam_ben_visit` ON `tb_stoptb_general_examination` (`beneficiary_reg_id`, `visitCode`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- TB screening by beneficiary (getAll village filter, save upsert by visit)
SET @need = 2;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_screening' AND column_name IN ('ben_reg_id', 'visitCode'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_screening' AND index_name = 'idx_screen_ben_visit');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_screen_ben_visit` ON `tb_screening` (`ben_reg_id`, `visitCode`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Diagnostics by beneficiary (getAll village filter)
SET @need = 1;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_stoptb_diagnostics' AND column_name IN ('ben_reg_id'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_stoptb_diagnostics' AND index_name = 'idx_diag_ben');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_diag_ben` ON `tb_stoptb_diagnostics` (`ben_reg_id`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- TB suspected by beneficiary (getAll village filter)
SET @need = 1;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_suspected' AND column_name IN ('ben_id'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_suspected' AND index_name = 'idx_susp_ben');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_susp_ben` ON `tb_suspected` (`ben_id`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- TB confirmed by beneficiary (getAll village filter, save upsert by visit)
SET @need = 2;
SET @cols = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = DATABASE()
  AND table_name = 'tb_confirmed_cases' AND column_name IN ('ben_id', 'visitCode'));
SET @idx = (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE()
  AND table_name = 'tb_confirmed_cases' AND index_name = 'idx_conf_ben_visit');
SET @sql = IF(@cols = @need AND @idx = 0,
  'CREATE INDEX `idx_conf_ben_visit` ON `tb_confirmed_cases` (`ben_id`, `visitCode`)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
