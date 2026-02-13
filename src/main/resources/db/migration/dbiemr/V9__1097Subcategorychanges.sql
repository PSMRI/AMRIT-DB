use dbiemr;

--  ALTER TABLE t_kmfilemanager ADD COLUMN SubCategoryID INT NULL;

-- ALTER TABLE t_kmfilemanager ADD CONSTRAINT FK_KmFileManager_SubCategory
--   FOREIGN KEY (SubCategoryID) REFERENCES m_subcategory(SubCategoryID);



  USE dbiemr;


-- 1) ADD COLUMN IF NOT EXISTS

SELECT COUNT(*) INTO @col_exists
FROM information_schema.columns
WHERE table_schema = 'dbiemr'
  AND table_name = 't_kmfilemanager'
  AND column_name = 'SubCategoryID';

SET @sql := IF(
    @col_exists = 0,
    'ALTER TABLE t_kmfilemanager ADD COLUMN SubCategoryID INT NULL;',
    'SELECT "Column SubCategoryID already exists";'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



-- 2) ADD FOREIGN KEY IF NOT EXISTS

SELECT COUNT(*) INTO @fk_exists
FROM information_schema.table_constraints
WHERE table_schema = 'dbiemr'
  AND table_name = 't_kmfilemanager'
  AND constraint_type = 'FOREIGN KEY'
  AND constraint_name = 'FK_KmFileManager_SubCategory';

SET @sql2 := IF(
    @fk_exists = 0,
    'ALTER TABLE t_kmfilemanager 
        ADD CONSTRAINT FK_KmFileManager_SubCategory
        FOREIGN KEY (SubCategoryID)
        REFERENCES m_subcategory(SubCategoryID);',
    'SELECT "Foreign key FK_KmFileManager_SubCategory already exists";'
);

PREPARE stmt2 FROM @sql2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;




