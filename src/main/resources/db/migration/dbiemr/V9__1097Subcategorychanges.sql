use db_iemr;

ALTER TABLE t_kmfilemanager
ADD COLUMN IF NOT EXISTS SubCategoryID INT NULL;

ALTER TABLE t_kmfilemanager ADD CONSTRAINT FK_KmFileManager_SubCategory
  FOREIGN KEY (SubCategoryID) REFERENCES m_subcategory(SubCategoryID);