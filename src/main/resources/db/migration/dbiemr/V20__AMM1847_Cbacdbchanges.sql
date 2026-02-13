-- alter table t_cbacdetails
--   add column Cbac_OccupationalExposure varchar(100),
--   add column Cbac_BotheredProblem_last2weeks varchar(100),
--   add column Cbac_LittleInterest_Pleasure varchar(100),
--   add column Cbac_Depressed_hopeless varchar(100),
--   add column Cbac_DiscolorationSkin varchar(100);


USE dbiemr;

SET @table := 't_cbacdetails';

-- Function-like snippet to add a column safely
-- Column 1
SET @col := 'Cbac_OccupationalExposure';
SELECT COUNT(*) INTO @exists 
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = @table
  AND column_name = @col;

SET @sql = IF(
  @exists = 0,
  CONCAT('ALTER TABLE ', @table, ' ADD COLUMN ', @col, ' VARCHAR(100);'),
  'SELECT "Column Cbac_OccupationalExposure already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Column 2
SET @col := 'Cbac_BotheredProblem_last2weeks';
SELECT COUNT(*) INTO @exists 
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = @table
  AND column_name = @col;

SET @sql = IF(
  @exists = 0,
  CONCAT('ALTER TABLE ', @table, ' ADD COLUMN ', @col, ' VARCHAR(100);'),
  'SELECT "Column Cbac_BotheredProblem_last2weeks already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Column 3
SET @col := 'Cbac_LittleInterest_Pleasure';
SELECT COUNT(*) INTO @exists 
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = @table
  AND column_name = @col;

SET @sql = IF(
  @exists = 0,
  CONCAT('ALTER TABLE ', @table, ' ADD COLUMN ', @col, ' VARCHAR(100);'),
  'SELECT "Column Cbac_LittleInterest_Pleasure already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Column 4
SET @col := 'Cbac_Depressed_hopeless';
SELECT COUNT(*) INTO @exists 
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = @table
  AND column_name = @col;

SET @sql = IF(
  @exists = 0,
  CONCAT('ALTER TABLE ', @table, ' ADD COLUMN ', @col, ' VARCHAR(100);'),
  'SELECT "Column Cbac_Depressed_hopeless already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Column 5
SET @col := 'Cbac_DiscolorationSkin';
SELECT COUNT(*) INTO @exists 
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = @table
  AND column_name = @col;

SET @sql = IF(
  @exists = 0,
  CONCAT('ALTER TABLE ', @table, ' ADD COLUMN ', @col, ' VARCHAR(100);'),
  'SELECT "Column Cbac_DiscolorationSkin already exists";'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;



  
