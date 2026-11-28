-- ==========================================================
-- V151: camp-only data backfills
--   Part A - dynamic form response UUIDs added in V150 (STOP-745)
--   Part B - diagnostic sync keys (vanID, vanSerialNo) on rows that have none
--
-- Skipped on production/central (${isProduction} = true, from IS_PRODUCTION; see FlywayConfig). The
-- migration still completes, so Flyway records V151 as applied either way.
--   Part A: rows uploaded to central carry the camp's numeric IDs, which central cannot resolve.
--           Central gets the UUIDs when each camp uploads its rows again (step A2 re-queues them).
--   Part B: central's rows came from many camps, so its own id is not a van's serial number and it
--           has no single van ID.
--
-- Part A - on a camp every numeric ID is the camp's own, so it is resolved against the camp's definitions:
--   A1. vanSerialNo: rows that never got one (e.g. a response created by /complete without a prior
--       submit) get their own ID, so the upload can match them.
--   A2. Own UUID for every row, without joins, so no row is left unreadable by the UUID-based FLW-API.
--       Rows already uploaded (processed = 'P') are queued again so central receives the UUIDs;
--       'F' rows are retried by the sync as they are.
--   A3. Parent UUIDs, parents first.
--   A4. Definition UUIDs. The numeric definition IDs are kept for tracing; nothing reads or uploads
--       them any more.
--
-- Part B - older FLW builds saved some diagnostic rows without sync keys: no-vendor (MANUAL_ENTRY)
-- orders were never stamped with vanSerialNo, and the 3.8.3 van builds set neither vanID nor
-- vanSerialNo. Without vanID a row is never uploaded (the upload only picks rows with vanID set);
-- without vanSerialNo central cannot match it on the next upload and rejects it as a duplicate.
--   B1. vanSerialNo = the row's own id where it is NULL - the same value FLW-API stamps on new rows.
--   B2. vanID = this camp's van ID (${vanId}, from STOPTB_VAN_ID) where it is NULL. Skipped when
--       STOPTB_VAN_ID is unset or not a number.
--   processed is left as it is: 'N' and 'F' rows go up on the next sync with their keys. Rows already
--   uploaded ('P') are not queued again - central's copy of those is repaired on central.
--
-- Idempotent: every UPDATE only fills columns that are still NULL.
-- Note: the V132 change-log triggers fire on the Part A UPDATEs, so tablets re-download each form
-- response once. They do not watch vanID or vanSerialNo, so Part B triggers no re-download.
-- ==========================================================

USE db_iemr;

DROP PROCEDURE IF EXISTS v151_camp_only_backfill;

DELIMITER $$

CREATE PROCEDURE v151_camp_only_backfill()
BEGIN
    IF '${isProduction}' = 'false' THEN

        -- ===== Part A: dynamic form response UUIDs =====

        -- A1) vanSerialNo
        UPDATE t_form_response     SET vanSerialNo = responseId         WHERE vanSerialNo IS NULL;
        UPDATE t_section_response  SET vanSerialNo = sectionResponseId  WHERE vanSerialNo IS NULL;
        UPDATE t_question_response SET vanSerialNo = questionResponseId WHERE vanSerialNo IS NULL;

        -- A2) Own UUID for every row; uploaded rows are queued again
        UPDATE t_form_response
        SET responseUuid = UUID(),
            processed    = IF(processed = 'P', 'N', processed)
        WHERE responseUuid IS NULL;

        UPDATE t_section_response
        SET sectionResponseUuid = UUID(),
            processed           = IF(processed = 'P', 'N', processed)
        WHERE sectionResponseUuid IS NULL;

        UPDATE t_question_response
        SET questionResponseUuid = UUID(),
            processed            = IF(processed = 'P', 'N', processed)
        WHERE questionResponseUuid IS NULL;

        -- A3) Parent UUIDs (parents first)
        UPDATE t_section_response sr
        JOIN t_form_response r ON r.responseId = sr.responseId
        SET sr.responseUuid = r.responseUuid
        WHERE sr.responseUuid IS NULL;

        UPDATE t_question_response qr
        JOIN t_section_response sr ON sr.sectionResponseId = qr.sectionResponseId
        SET qr.sectionResponseUuid = sr.sectionResponseUuid
        WHERE qr.sectionResponseUuid IS NULL;

        -- A4) Definition UUIDs. The version's own formId is used, not the response's, since V147
        --     re-linked versions that pointed to the wrong form. An option is used only if it belongs
        --     to the question.
        UPDATE t_form_response r
        JOIN t_form_version v ON v.versionId = r.versionId
        JOIN t_dynamic_form f ON f.formId = v.formId
        SET r.formUuid      = f.formUuid,
            r.versionNumber = v.versionNumber
        WHERE r.formUuid IS NULL;

        UPDATE t_section_response sr
        JOIN t_form_section s ON s.sectionId = sr.sectionId
        SET sr.sectionUuid = s.sectionUuid
        WHERE sr.sectionUuid IS NULL;

        UPDATE t_question_response qr
        JOIN t_section_question q ON q.questionId = qr.questionId
        LEFT JOIN t_question_option o ON o.optionId = qr.optionId AND o.questionId = q.questionId
        SET qr.questionUuid = q.questionUuid,
            qr.optionUuid   = o.optionUuid
        WHERE qr.questionUuid IS NULL;

        -- ===== Part B: diagnostic sync keys =====

        -- B1) vanSerialNo
        UPDATE tb_diagnostic_order    SET vanSerialNo = id WHERE vanSerialNo IS NULL;
        UPDATE tb_diagnostic_result   SET vanSerialNo = id WHERE vanSerialNo IS NULL;
        UPDATE tb_diagnostic_document SET vanSerialNo = id WHERE vanSerialNo IS NULL;

        -- B2) vanID, only when STOPTB_VAN_ID is set
        IF '${vanId}' <> '' THEN
            UPDATE tb_diagnostic_order    SET vanID = CAST('${vanId}' AS UNSIGNED) WHERE vanID IS NULL;
            UPDATE tb_diagnostic_result   SET vanID = CAST('${vanId}' AS UNSIGNED) WHERE vanID IS NULL;
            UPDATE tb_diagnostic_document SET vanID = CAST('${vanId}' AS UNSIGNED) WHERE vanID IS NULL;
        END IF;

    ELSE
        SELECT 'V151 skipped: IS_PRODUCTION=true (camp-only backfills run on camps only)' AS message;
    END IF;
END$$

DELIMITER ;

SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;
CALL v151_camp_only_backfill();
SET SQL_SAFE_UPDATES = @old_safe_updates;

DROP PROCEDURE IF EXISTS v151_camp_only_backfill;
