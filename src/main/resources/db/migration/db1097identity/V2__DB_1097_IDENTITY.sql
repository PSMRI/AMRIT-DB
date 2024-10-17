use db_1097_identity;

Delimiter $$
SET @dbname = "db_1097_identity";
SET @tablename = "i_beneficiarydetails";
SET @columnname = "ExtraFields";
SET @preparedStatement = (select if (
    exists(
       SELECT Distinct column_name  FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
    )
    ,'select ''Column exists'';'
    ,CONCAT("ALTER TABLE ", @tablename, " ADD ", @columnname, " JSON after `Others`;")) );
PREPARE stmt1 FROM @preparedStatement;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1 $$
Delimiter ;

Delimiter $$
SET @dbname = "db_1097_identity";
SET @tablename = "i_beneficiarydetails";
SET @columnname = "faceEmbedding";
SET @preparedStatement = (select if (
    exists(
       SELECT Distinct column_name  FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
    )
    ,'select ''Column exists'';'
    ,CONCAT("ALTER TABLE ", @tablename, " ADD ", @columnname, " longtext after Others;")) );
PREPARE stmt1 FROM @preparedStatement;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1 $$
Delimiter ;




