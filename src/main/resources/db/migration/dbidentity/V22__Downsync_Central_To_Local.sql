USE db_identity;

-- =============================================================================
-- Down-sync (central -> local) support for the db_identity tables.
--
-- Companion to db_iemr V102, which holds m_downsynctabledetail, the db_iemr
-- tables and the configuration. This script runs in EVERY environment -
-- central, local (van), prod, UAT - so both sides of the sync end up with the
-- same columns.
--
--   DownSynced             'N' not yet delivered to the van | 'P' delivered
--                          | 'F' delivery failed / conflict | 'U' queued by hand
--   DownSyncDate           when the record was last delivered to a van
--   DownSyncFailureReason  why delivery failed, e.g. 'CONFLICT'
--   LastDownSyncDate       when this record was last received from central
--
-- The first three are written by central and the fourth by the van, but all four
-- exist everywhere. Neither side reads the columns it does not own, and the sync
-- never copies any of the four.
--
-- Processed, SyncFailureReason, LastModDate, VanSerialNo and VanID are already
-- on both tables (V1 and V20), so only the down-sync columns are added here.
-- There are no triggers: which records travel down is decided by the down-sync
-- query alone - see the header of db_iemr V102.
-- =============================================================================

DROP PROCEDURE IF EXISTS amrit_add_column_if_missing;
DROP PROCEDURE IF EXISTS amrit_add_index_if_missing;

DELIMITER $$

CREATE PROCEDURE amrit_add_column_if_missing(
	IN in_schema     VARCHAR(64),
	IN in_table      VARCHAR(64),
	IN in_column     VARCHAR(64),
	IN in_definition TEXT
)
BEGIN
	DECLARE column_count INT DEFAULT 0;

	SELECT COUNT(*) INTO column_count
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = in_schema AND TABLE_NAME = in_table AND COLUMN_NAME = in_column;

	IF column_count = 0 THEN
		SET @ddl = CONCAT('ALTER TABLE `', in_schema, '`.`', in_table, '` ADD COLUMN `', in_column, '` ',
		                  in_definition);
		PREPARE add_column FROM @ddl;
		EXECUTE add_column;
		DEALLOCATE PREPARE add_column;
	END IF;
END $$

CREATE PROCEDURE amrit_add_index_if_missing(
	IN in_schema  VARCHAR(64),
	IN in_table   VARCHAR(64),
	IN in_index   VARCHAR(64),
	IN in_columns VARCHAR(255)
)
BEGIN
	DECLARE index_count INT DEFAULT 0;

	SELECT COUNT(*) INTO index_count
	FROM information_schema.STATISTICS
	WHERE TABLE_SCHEMA = in_schema AND TABLE_NAME = in_table AND INDEX_NAME = in_index;

	IF index_count = 0 THEN
		SET @ddl = CONCAT('ALTER TABLE `', in_schema, '`.`', in_table, '` ADD KEY `', in_index, '` (',
		                  in_columns, ')');
		PREPARE add_index FROM @ddl;
		EXECUTE add_index;
		DEALLOCATE PREPARE add_index;
	END IF;
END $$

DELIMITER ;

CALL amrit_add_column_if_missing('db_identity', 'i_householddetails', 'DownSynced',            'CHAR(1) NOT NULL DEFAULT ''N''');
CALL amrit_add_column_if_missing('db_identity', 'i_householddetails', 'DownSyncDate',          'DATETIME NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_identity', 'i_householddetails', 'DownSyncFailureReason', 'VARCHAR(255) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_identity', 'i_householddetails', 'LastDownSyncDate',      'DATETIME NULL DEFAULT NULL');

CALL amrit_add_column_if_missing('db_identity', 'i_beneficiarydetails_rmnch', 'DownSynced',            'CHAR(1) NOT NULL DEFAULT ''N''');
CALL amrit_add_column_if_missing('db_identity', 'i_beneficiarydetails_rmnch', 'DownSyncDate',          'DATETIME NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_identity', 'i_beneficiarydetails_rmnch', 'DownSyncFailureReason', 'VARCHAR(255) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_identity', 'i_beneficiarydetails_rmnch', 'LastDownSyncDate',      'DATETIME NULL DEFAULT NULL');

CALL amrit_add_index_if_missing('db_identity', 'i_householddetails',         'idx_i_householddetails_downsync', '`VanID`, `DownSynced`');
CALL amrit_add_index_if_missing('db_identity', 'i_beneficiarydetails_rmnch', 'idx_i_bendetails_rmnch_downsync', '`VanID`, `DownSynced`');

DROP PROCEDURE IF EXISTS amrit_add_column_if_missing;
DROP PROCEDURE IF EXISTS amrit_add_index_if_missing;

-- =============================================================================
-- Backfill the rows that existed before this script ran - see the note in
-- db_iemr V102.
--
-- A row that carries a VanSerialNo reached central through the up-sync, so the
-- van it belongs to already has it: mark it delivered. A row without a
-- VanSerialNo was created in central, has never been on a van, and is left at
-- 'N' so that it travels down on the first sync of the van whose VanID it
-- carries.
--
-- LastModDate is assigned to itself so that MySQL does not fire its ON UPDATE
-- CURRENT_TIMESTAMP and make every backfilled row look as if it had just been
-- edited in central.
--
-- To deliberately re-deliver a record, set DownSynced = 'N' for it.
-- =============================================================================
UPDATE i_householddetails
SET DownSynced = 'P', DownSyncDate = now(), LastModDate = LastModDate
WHERE DownSynced = 'N' AND VanSerialNo IS NOT NULL;

UPDATE i_beneficiarydetails_rmnch
SET DownSynced = 'P', DownSyncDate = now(), LastModDate = LastModDate
WHERE DownSynced = 'N' AND VanSerialNo IS NOT NULL;
