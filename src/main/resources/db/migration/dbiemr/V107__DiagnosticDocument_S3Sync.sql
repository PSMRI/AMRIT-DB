USE db_iemr;

SET @schema = 'db_iemr';
SET @table = 'tb_diagnostic_document';

SET @col = 'docsProcessed';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(1) NOT NULL DEFAULT ''N'''),
    'SELECT "docsProcessed already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'docSyncedDate';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` DATETIME NULL'),
    'SELECT "docSyncedDate already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 'docSyncFailureReason';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` TEXT NULL'),
    'SELECT "docSyncFailureReason already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col = 's3_path';
SET @sql = (
  SELECT IF(COUNT(*) = 0,
    CONCAT('ALTER TABLE `', @schema, '`.`', @table, '` ADD COLUMN `', @col, '` VARCHAR(512) NULL'),
    'SELECT "s3_path already exists"')
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = @schema
    AND TABLE_NAME   = @table
    AND COLUMN_NAME  = @col
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ==========================================================
-- Register the columns above in the generic van<->central sync column mapping
-- (m_synctabledetail.ServerColumnName / VanColumnName) for tb_diagnostic_document, following
-- the same pattern as V105 for external_order_id.
--
-- Skipped, not failed, when the row is absent: see V105's header -- the m_synctabledetail row
-- for tb_diagnostic_document is not seeded by any migration in this repo, so on a server with
-- no such row the UPDATEs below simply match nothing.
--
-- Idempotent: FIND_IN_SET guards every append, so re-running only touches columns not already
-- present in the list.
-- ==========================================================

UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('docsProcessed', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',docsProcessed')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('docsProcessed', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',docsProcessed')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('docsProcessed', ServerColumnName) = 0
      OR FIND_IN_SET('docsProcessed', VanColumnName) = 0
  );

UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('docSyncedDate', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',docSyncedDate')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('docSyncedDate', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',docSyncedDate')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('docSyncedDate', ServerColumnName) = 0
      OR FIND_IN_SET('docSyncedDate', VanColumnName) = 0
  );

UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('docSyncFailureReason', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',docSyncFailureReason')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('docSyncFailureReason', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',docSyncFailureReason')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('docSyncFailureReason', ServerColumnName) = 0
      OR FIND_IN_SET('docSyncFailureReason', VanColumnName) = 0
  );

UPDATE m_synctabledetail
SET ServerColumnName = CASE
        WHEN FIND_IN_SET('s3_path', ServerColumnName) = 0
        THEN CONCAT(ServerColumnName, ',s3_path')
        ELSE ServerColumnName
    END,
    VanColumnName = CASE
        WHEN FIND_IN_SET('s3_path', VanColumnName) = 0
        THEN CONCAT(VanColumnName, ',s3_path')
        ELSE VanColumnName
    END
WHERE TableName = 'tb_diagnostic_document'
  AND (
      FIND_IN_SET('s3_path', ServerColumnName) = 0
      OR FIND_IN_SET('s3_path', VanColumnName) = 0
  );

-- ----------------------------------------------------------
-- Post-state, for anyone running this by hand
-- ----------------------------------------------------------

SELECT s.TableName,
       IF(FIND_IN_SET('docsProcessed', s.ServerColumnName) > 0, 'ok', 'MISSING') AS docsProcessed_server,
       IF(FIND_IN_SET('docsProcessed', s.VanColumnName) > 0, 'ok', 'MISSING') AS docsProcessed_van,
       IF(FIND_IN_SET('docSyncedDate', s.ServerColumnName) > 0, 'ok', 'MISSING') AS docSyncedDate_server,
       IF(FIND_IN_SET('docSyncedDate', s.VanColumnName) > 0, 'ok', 'MISSING') AS docSyncedDate_van,
       IF(FIND_IN_SET('docSyncFailureReason', s.ServerColumnName) > 0, 'ok', 'MISSING') AS docSyncFailureReason_server,
       IF(FIND_IN_SET('docSyncFailureReason', s.VanColumnName) > 0, 'ok', 'MISSING') AS docSyncFailureReason_van,
       IF(FIND_IN_SET('s3_path', s.ServerColumnName) > 0, 'ok', 'MISSING') AS s3_path_server,
       IF(FIND_IN_SET('s3_path', s.VanColumnName) > 0, 'ok', 'MISSING') AS s3_path_van
FROM m_synctabledetail s
WHERE s.TableName = 'tb_diagnostic_document';
