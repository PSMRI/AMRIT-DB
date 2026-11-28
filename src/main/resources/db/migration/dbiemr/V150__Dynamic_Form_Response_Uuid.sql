-- ==========================================================
-- V150: dynamic form responses linked by UUID (STOP-745) - schema and sync mapping.
--       The backfill of existing rows is in V151.
--
-- Problem: response rows linked to the form definition by numeric IDs (formId, versionId,
-- sectionId, questionId, optionId) and to their parent by laptop auto-increment IDs
-- (responseId, sectionResponseId). Every FLW-API seeds its own definitions, so these IDs differ
-- between a laptop and central: uploads failed on FK_section_response_section /
-- FK_question_response_section_response, or were saved against the wrong form/response.
--
-- From now on rows link by UUID only, so the upload copies them as they are:
--   * each response row has its own UUID (responseUuid, sectionResponseUuid, questionResponseUuid)
--     and carries its parent's UUID; FLW-API finds children by the parent's UUID.
--     The numeric parent IDs (responseId, sectionResponseId) are still written on the machine that
--     creates the row (the V132 change-log triggers use them) but are not uploaded: NULL on central.
--   * the definition is referenced only by UUID: formUuid + versionNumber, sectionUuid,
--     questionUuid, optionUuid. The numeric definition-ID columns stay but are NULL.
--     sectionUuid / questionUuid repeat in every version and optionUuid is shared between
--     questions, so they are resolved along response -> version -> section -> question -> option.
--
-- Steps:
--   1. Add the UUID columns, make the definition-ID and parent-ID columns NULL-able, drop the
--      definition FKs and the parent FKs.
--   2. Unique / lookup indexes on the response tables, and unique keys on the definition
--      tables so each UUID lookup finds one row. A definition key is skipped (with a message)
--      when this machine already holds duplicates.
--   3. m_synctabledetail: upload the UUID columns instead of the definition and parent IDs.
--   (Existing rows are backfilled in V151.)
--
-- Idempotent: every DDL is guarded.
-- ==========================================================

USE db_iemr;

SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;

DROP PROCEDURE IF EXISTS v150_add_column;
DROP PROCEDURE IF EXISTS v150_drop_fk;
DROP PROCEDURE IF EXISTS v150_add_index;
DROP PROCEDURE IF EXISTS v150_sync_columns;

DELIMITER $$

CREATE PROCEDURE v150_add_column(IN p_table VARCHAR(64), IN p_column VARCHAR(64), IN p_ddl VARCHAR(255))
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables
               WHERE table_schema = 'db_iemr' AND table_name = p_table)
       AND NOT EXISTS (SELECT 1 FROM information_schema.columns
                       WHERE table_schema = 'db_iemr' AND table_name = p_table AND column_name = p_column) THEN
        SET @v150_sql = CONCAT('ALTER TABLE db_iemr.', p_table, ' ADD COLUMN ', p_column, ' ', p_ddl);
        PREPARE s FROM @v150_sql;
        EXECUTE s;
        DEALLOCATE PREPARE s;
    END IF;
END$$

CREATE PROCEDURE v150_drop_fk(IN p_table VARCHAR(64), IN p_fk VARCHAR(64))
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.table_constraints
               WHERE constraint_schema = 'db_iemr' AND table_name = p_table
                 AND constraint_name = p_fk AND constraint_type = 'FOREIGN KEY') THEN
        SET @v150_sql = CONCAT('ALTER TABLE db_iemr.', p_table, ' DROP FOREIGN KEY ', p_fk);
        PREPARE s FROM @v150_sql;
        EXECUTE s;
        DEALLOCATE PREPARE s;
    END IF;
END$$

-- Adds the index when the table exists and the index does not. A UNIQUE index that fails on
-- existing duplicates (1062) is skipped with a message instead of failing the migration.
CREATE PROCEDURE v150_add_index(IN p_table VARCHAR(64), IN p_index VARCHAR(64), IN p_columns VARCHAR(255),
                                IN p_unique TINYINT)
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
        SELECT CONCAT('SKIPPED: ', p_table, '.', p_index, ' - duplicate rows exist, resolve them and add the key') AS message;
    IF EXISTS (SELECT 1 FROM information_schema.tables
               WHERE table_schema = 'db_iemr' AND table_name = p_table)
       AND NOT EXISTS (SELECT 1 FROM information_schema.statistics
                       WHERE table_schema = 'db_iemr' AND table_name = p_table AND index_name = p_index) THEN
        SET @v150_sql = CONCAT('ALTER TABLE db_iemr.', p_table, ' ADD ', IF(p_unique = 1, 'UNIQUE ', ''),
                               'INDEX ', p_index, ' (', p_columns, ')');
        PREPARE s FROM @v150_sql;
        EXECUTE s;
        DEALLOCATE PREPARE s;
    END IF;
END$$

-- Removes p_remove and appends p_add (comma lists of plain column names) in both
-- ServerColumnName and VanColumnName of the table's m_synctabledetail row.
CREATE PROCEDURE v150_sync_columns(IN p_table VARCHAR(64), IN p_remove VARCHAR(255), IN p_add VARCHAR(255))
BEGIN
    DECLARE v_item VARCHAR(64);
    DECLARE v_rest VARCHAR(255);

    IF EXISTS (SELECT 1 FROM information_schema.columns
               WHERE table_schema = 'db_iemr' AND table_name = 'm_synctabledetail' AND column_name = 'VanColumnName') THEN

        SET v_rest = p_remove;
        WHILE v_rest IS NOT NULL AND v_rest <> '' DO
            SET v_item = SUBSTRING_INDEX(v_rest, ',', 1);
            SET v_rest = IF(LOCATE(',', v_rest) > 0, SUBSTRING(v_rest, LOCATE(',', v_rest) + 1), '');
            UPDATE db_iemr.m_synctabledetail
            SET ServerColumnName = TRIM(BOTH ',' FROM REPLACE(CONCAT(',', ServerColumnName, ','), CONCAT(',', v_item, ','), ',')),
                VanColumnName    = TRIM(BOTH ',' FROM REPLACE(CONCAT(',', VanColumnName, ','), CONCAT(',', v_item, ','), ','))
            WHERE SchemaName = 'db_iemr' AND TableName = p_table
              AND (FIND_IN_SET(v_item, ServerColumnName) > 0 OR FIND_IN_SET(v_item, VanColumnName) > 0);
        END WHILE;

        SET v_rest = p_add;
        WHILE v_rest IS NOT NULL AND v_rest <> '' DO
            SET v_item = SUBSTRING_INDEX(v_rest, ',', 1);
            SET v_rest = IF(LOCATE(',', v_rest) > 0, SUBSTRING(v_rest, LOCATE(',', v_rest) + 1), '');
            UPDATE db_iemr.m_synctabledetail
            SET ServerColumnName = IF(FIND_IN_SET(v_item, ServerColumnName) = 0, CONCAT(ServerColumnName, ',', v_item), ServerColumnName),
                VanColumnName    = IF(FIND_IN_SET(v_item, VanColumnName) = 0, CONCAT(VanColumnName, ',', v_item), VanColumnName)
            WHERE SchemaName = 'db_iemr' AND TableName = p_table
              AND (FIND_IN_SET(v_item, ServerColumnName) = 0 OR FIND_IN_SET(v_item, VanColumnName) = 0);
        END WHILE;
    END IF;
END$$

DELIMITER ;

-- ----------------------------------------------------------
-- 1) Columns and foreign keys
-- ----------------------------------------------------------
CALL v150_add_column('t_form_response', 'responseUuid',  'VARCHAR(36) NULL AFTER responseId');
CALL v150_add_column('t_form_response', 'formUuid',      'VARCHAR(100) NULL AFTER formId');
CALL v150_add_column('t_form_response', 'versionNumber', 'INT NULL AFTER versionId');

CALL v150_add_column('t_section_response', 'sectionResponseUuid', 'VARCHAR(36) NULL AFTER sectionResponseId');
CALL v150_add_column('t_section_response', 'responseUuid',        'VARCHAR(36) NULL AFTER responseId');
CALL v150_add_column('t_section_response', 'sectionUuid',         'VARCHAR(100) NULL AFTER sectionId');

CALL v150_add_column('t_question_response', 'questionResponseUuid', 'VARCHAR(36) NULL AFTER questionResponseId');
CALL v150_add_column('t_question_response', 'sectionResponseUuid',  'VARCHAR(36) NULL AFTER sectionResponseId');
CALL v150_add_column('t_question_response', 'questionUuid',         'VARCHAR(100) NULL AFTER questionId');
CALL v150_add_column('t_question_response', 'optionUuid',           'VARCHAR(255) NULL AFTER optionId');

CALL v150_drop_fk('t_section_response',  'FK_section_response_section');
CALL v150_drop_fk('t_question_response', 'FK_question_response_question');
CALL v150_drop_fk('t_question_response', 'FK_question_response_option');
CALL v150_drop_fk('t_section_response',  'FK_section_response_form_response');
CALL v150_drop_fk('t_question_response', 'FK_question_response_section_response');

ALTER TABLE t_form_response     MODIFY formId     BIGINT NULL, MODIFY versionId BIGINT NULL;
ALTER TABLE t_section_response  MODIFY responseId BIGINT NULL, MODIFY sectionId BIGINT NULL;
ALTER TABLE t_question_response MODIFY sectionResponseId BIGINT NULL, MODIFY questionId BIGINT NULL;

-- ----------------------------------------------------------
-- 2) Indexes
-- ----------------------------------------------------------
CALL v150_add_index('t_form_response',     'UK_form_response_uuid',                 'responseUuid', 1);
CALL v150_add_index('t_form_response',     'IDX_form_response_beneficiary_formUuid', 'beneficiaryId, formUuid', 0);
CALL v150_add_index('t_section_response',  'UK_section_response_uuid',              'sectionResponseUuid', 1);
CALL v150_add_index('t_section_response',  'IDX_section_response_responseUuid',     'responseUuid', 0);
CALL v150_add_index('t_question_response', 'UK_question_response_uuid',             'questionResponseUuid', 1);
CALL v150_add_index('t_question_response', 'IDX_question_response_sectionRespUuid', 'sectionResponseUuid', 0);

CALL v150_add_index('t_form_version',     'UK_form_version_form_number',     'formId, versionNumber', 1);
CALL v150_add_index('t_form_section',     'UK_form_section_version_uuid',    'version_id, sectionUuid', 1);
CALL v150_add_index('t_section_question', 'UK_section_question_section_uuid', 'sectionId, questionUuid', 1);
CALL v150_add_index('t_question_option',  'UK_question_option_question_uuid', 'questionId, optionUuid', 1);

-- ----------------------------------------------------------
-- 3) Upload mapping (m_synctabledetail): UUIDs instead of definition IDs
-- ----------------------------------------------------------
CALL v150_sync_columns('t_form_response',     'formId,versionId',   'responseUuid,formUuid,versionNumber');
CALL v150_sync_columns('t_section_response',  'responseId,sectionId', 'sectionResponseUuid,responseUuid,sectionUuid');
CALL v150_sync_columns('t_question_response', 'sectionResponseId,questionId,optionId', 'questionResponseUuid,sectionResponseUuid,questionUuid,optionUuid');

DROP PROCEDURE IF EXISTS v150_add_column;
DROP PROCEDURE IF EXISTS v150_drop_fk;
DROP PROCEDURE IF EXISTS v150_add_index;
DROP PROCEDURE IF EXISTS v150_sync_columns;

SET SQL_SAFE_UPDATES = @old_safe_updates;
