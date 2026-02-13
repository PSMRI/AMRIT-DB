USE dbiemr;

SET @table_exists = (
      SELECT COUNT(*)
      FROM information_schema.TABLES
      WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_cdr'
  );

  -- Proceed only if table exists
  SET @sql_check = IF(
      @table_exists > 0,
      'SELECT "Table t_cdr exists. Proceeding with migration..." AS status',
      'SELECT "ERROR: Table t_cdr does not exist!" AS status'
  );
  PREPARE stmt FROM @sql_check;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  -- Add cdr_image_1 (LONGTEXT)
  SET @column_exists_1 = (
      SELECT COUNT(*)
      FROM information_schema.COLUMNS
      WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_cdr'
      AND COLUMN_NAME = 'cdr_image_1'
  );

  SET @sql_add_column_1 = IF(
      @column_exists_1 = 0,
      'ALTER TABLE dbiemr.t_cdr ADD COLUMN cdr_image_1 LONGTEXT DEFAULT NULL COMMENT "First CDR image (base64 encoded or file path)"',
      'SELECT "Column cdr_image_1 already exists, skipping..." AS status'
  );
  PREPARE stmt FROM @sql_add_column_1;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  -- Add cdr_image_2 (LONGTEXT)
  SET @column_exists_2 = (
      SELECT COUNT(*)
      FROM information_schema.COLUMNS
      WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_cdr'
      AND COLUMN_NAME = 'cdr_image_2'
  );

  SET @sql_add_column_2 = IF(
      @column_exists_2 = 0,
      'ALTER TABLE dbiemr.t_cdr ADD COLUMN cdr_image_2 LONGTEXT DEFAULT NULL COMMENT "Second CDR image (base64 encoded or file path)"',
      'SELECT "Column cdr_image_2 already exists, skipping..." AS status'
  );
  PREPARE stmt FROM @sql_add_column_2;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  -- Add death_cert_image_1 (LONGTEXT)
  SET @column_exists_3 = (
      SELECT COUNT(*)
      FROM information_schema.COLUMNS
      WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_cdr'
      AND COLUMN_NAME = 'death_cert_image_1'
  );

  SET @sql_add_column_3 = IF(
      @column_exists_3 = 0,
      'ALTER TABLE dbiemr.t_cdr ADD COLUMN death_cert_image_1 LONGTEXT DEFAULT NULL COMMENT "First death certificate image (base64 encoded or file path)"',
      'SELECT "Column death_cert_image_1 already exists, skipping..." AS status'
  );
  PREPARE stmt FROM @sql_add_column_3;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

  -- Add death_cert_image_2 (LONGTEXT)
  SET @column_exists_4 = (
      SELECT COUNT(*)
      FROM information_schema.COLUMNS
      WHERE TABLE_SCHEMA = 'dbiemr'
      AND TABLE_NAME = 't_cdr'
      AND COLUMN_NAME = 'death_cert_image_2'
  );

  SET @sql_add_column_4 = IF(
      @column_exists_4 = 0,
      'ALTER TABLE dbiemr.t_cdr ADD COLUMN death_cert_image_2 LONGTEXT DEFAULT NULL COMMENT "Second death certificate image (base64 encoded or file path)"',
      'SELECT "Column death_cert_image_2 already exists, skipping..." AS status'
  );
  PREPARE stmt FROM @sql_add_column_4;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;


 SET @table_exists = (
     SELECT COUNT(*)
     FROM information_schema.TABLES
     WHERE TABLE_SCHEMA = 'dbiemr'
     AND TABLE_NAME = 't_mdsr'
  );

  SET @sql_check = IF(
     @table_exists > 0,
     'SELECT "✓ Table t_mdsr exists. Proceeding with migration..." AS status',
     'SELECT "✗ ERROR: Table t_mdsr does not exist!" AS status'
  );
 PREPARE stmt FROM @sql_check;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;

 -- Stop if table doesn't exist
 SET @proceed = IF(@table_exists > 0, 1, 0);

 -- =====================================================
 -- Step 2: Add mdsr1_file column
 -- =====================================================
 SET @column_exists_1 = (
     SELECT COUNT(*)
     FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA = 'dbiemr'
     AND TABLE_NAME = 't_mdsr'
     AND COLUMN_NAME = 'mdsr1_file'
 );

 SET @sql_add_column_1 = IF(
     @column_exists_1 = 0 AND @proceed = 1,
     'ALTER TABLE dbiemr.t_mdsr ADD COLUMN mdsr1_file LONGTEXT DEFAULT NULL COMMENT "MDSR File 1 (base64 encoded or file path)"',
     IF(@column_exists_1 > 0,
         'SELECT "⚠ Column mdsr1_file already exists, skipping..." AS status',
         'SELECT "✗ Skipping due to table not found" AS status'
     )
 );
 PREPARE stmt FROM @sql_add_column_1;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;

 -- =====================================================
 -- Step 3: Add mdsr2_file column
 -- =====================================================
 SET @column_exists_2 = (
     SELECT COUNT(*)
     FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA = 'dbiemr'
     AND TABLE_NAME = 't_mdsr'
     AND COLUMN_NAME = 'mdsr2_file'
 );

 SET @sql_add_column_2 = IF(
     @column_exists_2 = 0 AND @proceed = 1,
     'ALTER TABLE dbiemr.t_mdsr ADD COLUMN mdsr2_file LONGTEXT DEFAULT NULL COMMENT "MDSR File 2 (base64 encoded or file path)"',
     IF(@column_exists_2 > 0,
         'SELECT "⚠ Column mdsr2_file already exists, skipping..." AS status',
         'SELECT "✗ Skipping due to table not found" AS status'
     )
 );
 PREPARE stmt FROM @sql_add_column_2;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;

 -- =====================================================
 -- Step 4: Add mdsr_death_cert_file column
 -- =====================================================
 SET @column_exists_3 = (
     SELECT COUNT(*)
     FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA = 'dbiemr'
     AND TABLE_NAME = 't_mdsr'
     AND COLUMN_NAME = 'mdsr_death_cert_file'
 );

 SET @sql_add_column_3 = IF(
     @column_exists_3 = 0 AND @proceed = 1,
     'ALTER TABLE dbiemr.t_mdsr ADD COLUMN mdsr_death_cert_file LONGTEXT DEFAULT NULL COMMENT "MDSR Death Certificate File (base64 encoded or file path)"',
     IF(@column_exists_3 > 0,
         'SELECT "⚠ Column mdsr_death_cert_file already exists, skipping..." AS status',
         'SELECT "✗ Skipping due to table not found" AS status'
     )
 );
 PREPARE stmt FROM @sql_add_column_3;
 EXECUTE stmt;
 DEALLOCATE PREPARE stmt;
