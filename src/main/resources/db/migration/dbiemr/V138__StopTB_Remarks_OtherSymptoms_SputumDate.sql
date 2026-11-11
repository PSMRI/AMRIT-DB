USE db_iemr;

SET @schema_name = 'db_iemr';

SET @tbl_name = 'tb_confirmed_cases';
SET @col_name = 'remarks';
SET @col_def = 'VARCHAR(500) NULL';
SET @tbl_exists = 0;
SET @col_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' ', @col_def),
IF(@tbl_exists = 0,
CONCAT('SELECT ''', @tbl_name, ' does not exist'''),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_screening';
SET @col_name = 'OtherSymptomsDetails';
SET @col_def = 'VARCHAR(200) NULL';
SET @tbl_exists = 0;
SET @col_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' ', @col_def),
IF(@tbl_exists = 0,
CONCAT('SELECT ''', @tbl_name, ' does not exist'''),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @tbl_name = 'tb_stoptb_diagnostics';
SET @col_name = 'SputumCollectionDate';
SET @col_def = 'DATETIME NULL';
SET @tbl_exists = 0;
SET @col_exists = 0;
PREPARE chk_tbl FROM 'SELECT COUNT(*) INTO @tbl_exists FROM information_schema.tables WHERE table_schema = ? AND table_name = ?';
EXECUTE chk_tbl USING @schema_name, @tbl_name;
DEALLOCATE PREPARE chk_tbl;
PREPARE chk_col FROM 'SELECT COUNT(*) INTO @col_exists FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ?';
EXECUTE chk_col USING @schema_name, @tbl_name, @col_name;
DEALLOCATE PREPARE chk_col;
SET @sql = IF(@tbl_exists > 0 AND @col_exists = 0,
CONCAT('ALTER TABLE ', @tbl_name, ' ADD COLUMN ', @col_name, ' ', @col_def),
IF(@tbl_exists = 0,
CONCAT('SELECT ''', @tbl_name, ' does not exist'''),
CONCAT('SELECT ''', @tbl_name, '.', @col_name, ' already exists''')
)
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sync_tbl_exists = (SELECT COUNT(*) FROM information_schema.tables
                        WHERE table_schema = 'db_iemr' AND table_name = 'm_synctabledetail');

SET @sync_id = NULL;
SET @sql = IF(@sync_tbl_exists > 0,
"SELECT MIN(SyncTableDetailID) INTO @sync_id FROM db_iemr.m_synctabledetail
  WHERE TableName = 'tb_confirmed_cases'
    AND CONCAT(',', VanColumnName, ',') NOT LIKE '%,remarks,%'
    AND CONCAT(',', ServerColumnName, ',') NOT LIKE '%,remarks,%'",
"SELECT 'm_synctabledetail does not exist - remarks sync registration skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @sql = IF(@sync_id IS NOT NULL,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',remarks'),
        ServerColumnName = CONCAT(ServerColumnName, ',remarks')
  WHERE SyncTableDetailID = @sync_id",
"SELECT 'tb_confirmed_cases sync row missing or remarks already registered - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sync_id = NULL;
SET @sql = IF(@sync_tbl_exists > 0,
"SELECT MIN(SyncTableDetailID) INTO @sync_id FROM db_iemr.m_synctabledetail
  WHERE TableName = 'tb_screening'
    AND VanColumnName NOT LIKE '%OtherSymptomsDetails%'
    AND ServerColumnName NOT LIKE '%OtherSymptomsDetails%'",
"SELECT 'm_synctabledetail does not exist - OtherSymptomsDetails sync registration skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @sql = IF(@sync_id IS NOT NULL,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',OtherSymptomsDetails'),
        ServerColumnName = CONCAT(ServerColumnName, ',OtherSymptomsDetails')
  WHERE SyncTableDetailID = @sync_id",
"SELECT 'tb_screening sync row missing or OtherSymptomsDetails already registered - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sync_id = NULL;
SET @sql = IF(@sync_tbl_exists > 0,
"SELECT MIN(SyncTableDetailID) INTO @sync_id FROM db_iemr.m_synctabledetail
  WHERE TableName = 'tb_stoptb_diagnostics'
    AND VanColumnName NOT LIKE '%SputumCollectionDate%'
    AND ServerColumnName NOT LIKE '%SputumCollectionDate%'",
"SELECT 'm_synctabledetail does not exist - SputumCollectionDate sync registration skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @sql = IF(@sync_id IS NOT NULL,
"UPDATE db_iemr.m_synctabledetail
    SET VanColumnName    = CONCAT(VanColumnName, ',SputumCollectionDate'),
        ServerColumnName = CONCAT(ServerColumnName, ',SputumCollectionDate')
  WHERE SyncTableDetailID = @sync_id",
"SELECT 'tb_stoptb_diagnostics sync row missing or SputumCollectionDate already registered - skipped'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
