USE db_iemr;

-- =============================================================================
-- Roll the four down-sync tracking columns out to the tables that actually sync.
--
-- V102 added them to the four tables of the first cut. This script extends that
-- to the whole up-sync set - every table configured in m_synctabledetail - so
-- that any of those tables can be added to m_downsynctabledetail and tracked
-- per-record without another DDL migration first.
--
--   DownSynced             'N' not yet delivered to the van | 'P' delivered
--                          | 'F' delivery failed / conflict | 'U' queued by hand
--   DownSyncDate           when the record was last delivered to a van
--   DownSyncFailureReason  why delivery failed, e.g. 'CONFLICT'
--   LastDownSyncDate       when this record was last received from central
--
-- SCOPE - the table set is exactly:
--
--   * every table in db_iemr.m_synctabledetail with Deleted = b'0' whose
--     SchemaName is this schema - the same filter the up-sync itself applies
--     (SyncUtilityClassRepo.findBySyncTableGroupIDAndDeletedOrderBy...), so the
--     two stay in step by construction;
--   * plus the db_iemr tables of the first cut, tb_screening / tb_suspected,
--     which are down-synced but are not part of the up-sync configuration.
--
-- Every other table in db_iemr is deliberately left alone. A table that does
-- not sync has nothing to track, and the columns would be dead weight on
-- hundreds of tables.
--
-- Runs in EVERY environment - central and every laptop - so both sides carry
-- the same columns. The first three columns are written by central and the
-- fourth by the van; MMU-API excludes all four from the column list it syncs.
--
-- Idempotent: a column already present is left alone, so re-running is a no-op,
-- as is running this after V102. Re-run it after adding rows to
-- m_synctabledetail to bring the new tables up to the same state.
--
-- -----------------------------------------------------------------------------
-- WHAT THIS DOES NOT DO
--
-- These four columns make a table *trackable*, not *syncable*. A TRANSACTIONAL
-- down-sync of a table also needs VanID, VanSerialNo, LastModDate and Processed
-- on both sides, and an AUTO_INCREMENT primary key (the down-sync omits the PK
-- on INSERT so the local DB mints its own id). The last query in the comment
-- block at the end of this script lists what is still missing, per table -
-- consult it before activating a table in m_downsynctabledetail.
--
-- -----------------------------------------------------------------------------
-- COST, AND HOW TO CONTROL IT
--
-- One ALTER per table in the set - all four columns in a single statement, not
-- four.
--
--   * MySQL 8.0.12+  - ADD COLUMN at the end of the table is ALGORITHM=INSTANT,
--                      metadata only. Fast even on a large central DB. This
--                      script tries INSTANT first and falls back per table.
--   * MySQL 5.7      - no INSTANT: every ALTER rebuilds the table. Budget a
--                      maintenance window sized by your largest tables.
--
-- The backfill (see below) is the expensive half, because it rewrites rows
-- rather than metadata, and the up-sync set is exactly the set of large
-- transactional tables. To defer it, set @amrit_downsync_backfill = 0 below and
-- call amrit_downsync_backfill_table(schema, table) for a table at the moment
-- you activate it in m_downsynctabledetail.
--
-- Nothing here aborts on a single table failing - a failure is recorded in
-- t_downsynccolumnrollout and the loop moves on. ALWAYS read that table when
-- this script finishes.
-- =============================================================================

-- 1 = mark the pre-existing up-synced rows as already delivered (recommended).
-- 0 = add the columns only, and backfill each table when you activate it.
SET @amrit_downsync_backfill = 1;

-- -----------------------------------------------------------------------------
-- Rollout report. Persistent on purpose: it is the record of what this
-- migration did, and the worklist for anything it could not do.
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS db_iemr.t_downsynccolumnrollout (
	RolloutID      INT          NOT NULL AUTO_INCREMENT,
	SchemaName     VARCHAR(64)  NOT NULL,
	TableName      VARCHAR(64)  NOT NULL,
	ColumnsAdded   VARCHAR(255) NULL     COMMENT 'the columns this run added; NULL when none were missing',
	BackfilledRows BIGINT       NULL     COMMENT 'rows the backfill moved to DownSynced = P',
	Status         VARCHAR(30)  NOT NULL COMMENT 'ADDED / ALREADY_PRESENT / FAILED / BACKFILL_FAILED / MISSING_TABLE',
	ErrNo          INT          NULL,
	ErrMessage     VARCHAR(512) NULL,
	RunDate        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (RolloutID),
	KEY idx_downsynccolumnrollout_status (Status),
	KEY idx_downsynccolumnrollout_table (SchemaName, TableName)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- The whole script is driven by m_synctabledetail, so its absence means the
-- rollout would silently do nothing. Fail loudly instead.
DROP PROCEDURE IF EXISTS amrit_require_synctabledetail;

DELIMITER $$

CREATE PROCEDURE amrit_require_synctabledetail()
BEGIN
	DECLARE cfg INT DEFAULT 0;

	SELECT COUNT(*) INTO cfg
	FROM information_schema.TABLES
	WHERE TABLE_SCHEMA = 'db_iemr' AND TABLE_NAME = 'm_synctabledetail';

	IF cfg = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'db_iemr.m_synctabledetail is missing - it defines the table set for this rollout. Run the db_iemr baseline migrations first.';
	END IF;
END $$

DELIMITER ;

CALL amrit_require_synctabledetail();
DROP PROCEDURE IF EXISTS amrit_require_synctabledetail;

DROP PROCEDURE IF EXISTS amrit_downsync_backfill_table;
DROP PROCEDURE IF EXISTS amrit_downsync_columns_for_synced_tables;

DELIMITER $$

-- -----------------------------------------------------------------------------
-- Mark the rows that were already up-synced from a van as delivered.
--
-- A row carrying a VanSerialNo reached central through the up-sync, so the van
-- it belongs to already has it. Left at 'N', the first down-sync of every van
-- would pull its entire history back down.
--
-- DownSyncDate is stamped alongside, because the "edited in central after
-- delivery" test is LastModDate > DownSyncDate and a NULL DownSyncDate would
-- never satisfy it. LastModDate is assigned to itself so that MySQL does not
-- fire its ON UPDATE CURRENT_TIMESTAMP and make every backfilled row look as
-- if it had just been edited in central.
--
-- Safe to call by hand, at any time, for a table you are about to activate.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE amrit_downsync_backfill_table(
	IN in_schema VARCHAR(64),
	IN in_table  VARCHAR(64),
	OUT out_rows BIGINT
)
BEGIN
	DECLARE has_downsynced  INT DEFAULT 0;
	DECLARE has_vanserialno INT DEFAULT 0;
	DECLARE has_lastmoddate INT DEFAULT 0;

	SET out_rows = 0;

	SELECT
		SUM(COLUMN_NAME = 'DownSynced'),
		SUM(COLUMN_NAME = 'VanSerialNo'),
		SUM(COLUMN_NAME = 'LastModDate')
	INTO has_downsynced, has_vanserialno, has_lastmoddate
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = in_schema AND TABLE_NAME = in_table;

	-- No VanSerialNo means nothing ever came up from a van: nothing to backfill.
	IF IFNULL(has_downsynced, 0) > 0 AND IFNULL(has_vanserialno, 0) > 0 THEN
		SET @bf = CONCAT('UPDATE `', in_schema, '`.`', in_table, '` SET DownSynced = ''P'', DownSyncDate = now()',
		                 IF(IFNULL(has_lastmoddate, 0) > 0, ', LastModDate = LastModDate', ''),
		                 ' WHERE DownSynced = ''N'' AND VanSerialNo IS NOT NULL');
		PREPARE run_bf FROM @bf;
		EXECUTE run_bf;
		SET out_rows = ROW_COUNT();
		DEALLOCATE PREPARE run_bf;
	END IF;
END $$

-- -----------------------------------------------------------------------------
-- The rollout itself.
--
-- @param in_schema the schema to work on
-- @param in_extra  comma-separated, lower-case table names to include on top of
--                  the m_synctabledetail set - the first-cut down-sync tables,
--                  which are not part of the up-sync configuration
-- -----------------------------------------------------------------------------
CREATE PROCEDURE amrit_downsync_columns_for_synced_tables(
	IN in_schema VARCHAR(64),
	IN in_extra  TEXT
)
BEGIN
	DECLARE v_done       INT DEFAULT 0;
	DECLARE v_table      VARCHAR(64);
	DECLARE v_clause     TEXT;
	DECLARE v_added      VARCHAR(255);
	DECLARE v_failed     INT DEFAULT 0;
	DECLARE v_errno      INT DEFAULT 0;
	DECLARE v_msg        VARCHAR(512) DEFAULT NULL;
	DECLARE v_rows       BIGINT DEFAULT 0;
	DECLARE v_downsynced INT DEFAULT 0;
	DECLARE v_syncdate   INT DEFAULT 0;
	DECLARE v_failreason INT DEFAULT 0;
	DECLARE v_lastdown   INT DEFAULT 0;

	-- Driven from information_schema and filtered by the configuration, so
	-- v_table is always a real BASE TABLE (a view cannot take a column) and the
	-- name is the one the DB actually uses, whatever case the configuration
	-- happens to store.
	DECLARE table_cursor CURSOR FOR
		SELECT t.TABLE_NAME
		FROM information_schema.TABLES t
		WHERE t.TABLE_SCHEMA = in_schema
		  AND t.TABLE_TYPE = 'BASE TABLE'
		  AND ( LOWER(t.TABLE_NAME) IN (
		            SELECT LOWER(TRIM(s.TableName))
		            FROM db_iemr.m_synctabledetail s
		            WHERE IFNULL(s.Deleted, b'0') = b'0'
		              AND s.TableName IS NOT NULL
		              AND LOWER(TRIM(IFNULL(s.SchemaName, ''))) = LOWER(in_schema))
		        OR FIND_IN_SET(LOWER(t.TABLE_NAME), in_extra) > 0 )
		ORDER BY t.TABLE_NAME;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

	-- One bad table must not abort the rollout: record it, carry on.
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 v_errno = MYSQL_ERRNO, v_msg = MESSAGE_TEXT;
		SET v_failed = 1;
	END;

	OPEN table_cursor;

	rollout: LOOP
		FETCH table_cursor INTO v_table;
		IF v_done = 1 THEN
			LEAVE rollout;
		END IF;

		SELECT
			SUM(COLUMN_NAME = 'DownSynced'),
			SUM(COLUMN_NAME = 'DownSyncDate'),
			SUM(COLUMN_NAME = 'DownSyncFailureReason'),
			SUM(COLUMN_NAME = 'LastDownSyncDate')
		INTO v_downsynced, v_syncdate, v_failreason, v_lastdown
		FROM information_schema.COLUMNS
		WHERE TABLE_SCHEMA = in_schema AND TABLE_NAME = v_table;

		SET v_clause = '';
		SET v_added  = '';

		IF IFNULL(v_downsynced, 0) = 0 THEN
			SET v_clause = CONCAT(v_clause, 'ADD COLUMN `DownSynced` CHAR(1) NOT NULL DEFAULT ''N''');
			SET v_added  = 'DownSynced';
		END IF;
		IF IFNULL(v_syncdate, 0) = 0 THEN
			SET v_clause = CONCAT(v_clause, IF(v_clause = '', '', ', '),
			                      'ADD COLUMN `DownSyncDate` DATETIME NULL DEFAULT NULL');
			SET v_added  = CONCAT(v_added, IF(v_added = '', '', ','), 'DownSyncDate');
		END IF;
		IF IFNULL(v_failreason, 0) = 0 THEN
			SET v_clause = CONCAT(v_clause, IF(v_clause = '', '', ', '),
			                      'ADD COLUMN `DownSyncFailureReason` VARCHAR(255) NULL DEFAULT NULL');
			SET v_added  = CONCAT(v_added, IF(v_added = '', '', ','), 'DownSyncFailureReason');
		END IF;
		IF IFNULL(v_lastdown, 0) = 0 THEN
			SET v_clause = CONCAT(v_clause, IF(v_clause = '', '', ', '),
			                      'ADD COLUMN `LastDownSyncDate` DATETIME NULL DEFAULT NULL');
			SET v_added  = CONCAT(v_added, IF(v_added = '', '', ','), 'LastDownSyncDate');
		END IF;

		IF v_clause = '' THEN
			INSERT INTO db_iemr.t_downsynccolumnrollout (SchemaName, TableName, ColumnsAdded, Status)
			VALUES (in_schema, v_table, NULL, 'ALREADY_PRESENT');
		ELSE
			-- INSTANT first: metadata-only on MySQL 8.0.12+. On 5.7 the syntax
			-- itself is rejected, and on a table that has exhausted its instant
			-- row versions MySQL rejects it too; the handler catches either and
			-- the retry below runs the plain ALTER.
			SET v_failed = 0;
			SET v_errno  = 0;
			SET v_msg    = NULL;
			SET @ddl = CONCAT('ALTER TABLE `', in_schema, '`.`', v_table, '` ', v_clause, ', ALGORITHM=INSTANT');
			PREPARE alter_instant FROM @ddl;
			EXECUTE alter_instant;
			DEALLOCATE PREPARE alter_instant;

			IF v_failed = 1 THEN
				SET v_failed = 0;
				SET v_errno  = 0;
				SET v_msg    = NULL;
				SET @ddl = CONCAT('ALTER TABLE `', in_schema, '`.`', v_table, '` ', v_clause);
				PREPARE alter_plain FROM @ddl;
				EXECUTE alter_plain;
				DEALLOCATE PREPARE alter_plain;
			END IF;

			IF v_failed = 1 THEN
				INSERT INTO db_iemr.t_downsynccolumnrollout
					(SchemaName, TableName, ColumnsAdded, Status, ErrNo, ErrMessage)
				VALUES (in_schema, v_table, v_added, 'FAILED', v_errno, v_msg);
			ELSE
				SET v_rows = 0;
				IF @amrit_downsync_backfill = 1 THEN
					SET v_failed = 0;
					SET v_errno  = 0;
					SET v_msg    = NULL;
					CALL amrit_downsync_backfill_table(in_schema, v_table, v_rows);
				END IF;

				IF v_failed = 1 THEN
					INSERT INTO db_iemr.t_downsynccolumnrollout
						(SchemaName, TableName, ColumnsAdded, Status, ErrNo, ErrMessage)
					VALUES (in_schema, v_table, v_added, 'BACKFILL_FAILED', v_errno, v_msg);
				ELSE
					INSERT INTO db_iemr.t_downsynccolumnrollout
						(SchemaName, TableName, ColumnsAdded, BackfilledRows, Status)
					VALUES (in_schema, v_table, v_added, v_rows, 'ADDED');
				END IF;
			END IF;
		END IF;
	END LOOP rollout;

	CLOSE table_cursor;

	-- A configured table that does not exist in this schema is a configuration
	-- error, not a rollout failure - but it must not pass unnoticed, because the
	-- up-sync of that table cannot be working either.
	INSERT INTO db_iemr.t_downsynccolumnrollout (SchemaName, TableName, Status, ErrMessage)
	SELECT DISTINCT in_schema, TRIM(s.TableName), 'MISSING_TABLE',
	       'listed in m_synctabledetail but no such base table in this schema'
	FROM db_iemr.m_synctabledetail s
	WHERE IFNULL(s.Deleted, b'0') = b'0'
	  AND s.TableName IS NOT NULL
	  AND LOWER(TRIM(IFNULL(s.SchemaName, ''))) = LOWER(in_schema)
	  AND LOWER(TRIM(s.TableName)) NOT IN (
	        SELECT LOWER(t.TABLE_NAME) FROM information_schema.TABLES t
	        WHERE t.TABLE_SCHEMA = in_schema AND t.TABLE_TYPE = 'BASE TABLE');
END $$

DELIMITER ;

-- tb_screening / tb_suspected are down-synced but are not in m_synctabledetail,
-- hence the second argument.
CALL amrit_downsync_columns_for_synced_tables('db_iemr', 'tb_screening,tb_suspected');

DROP PROCEDURE IF EXISTS amrit_downsync_columns_for_synced_tables;
-- amrit_downsync_backfill_table is deliberately KEPT: it is the procedure to
-- call for a table at the moment it is activated in m_downsynctabledetail,
-- especially when this script ran with @amrit_downsync_backfill = 0.

-- =============================================================================
-- Read these when the migration finishes.
--
-- 1. Anything that did not work, and any configuration that points at nothing:
--      SELECT * FROM db_iemr.t_downsynccolumnrollout
--      WHERE Status IN ('FAILED','BACKFILL_FAILED','MISSING_TABLE') ORDER BY TableName;
--
-- 2. What it did:
--      SELECT Status, COUNT(*), SUM(IFNULL(BackfilledRows,0))
--      FROM db_iemr.t_downsynccolumnrollout GROUP BY Status;
--
-- 3. Which tables are trackable but NOT yet syncable - they now carry the four
--    down-sync columns but still lack a prerequisite. Consult this before
--    activating a table in m_downsynctabledetail:
--
--      SELECT c.TABLE_SCHEMA, c.TABLE_NAME,
--             MAX(c.COLUMN_NAME = 'VanID')       AS has_vanid,
--             MAX(c.COLUMN_NAME = 'VanSerialNo') AS has_vanserialno,
--             MAX(c.COLUMN_NAME = 'LastModDate') AS has_lastmoddate,
--             MAX(c.COLUMN_NAME = 'Processed')   AS has_processed,
--             MAX(c.EXTRA LIKE '%auto_increment%') AS has_autoinc_pk,
--             MAX(c.COLUMN_NAME = 'LastModDate' AND c.EXTRA LIKE '%on update%') AS lastmoddate_auto
--      FROM information_schema.COLUMNS c
--      JOIN db_iemr.t_downsynccolumnrollout r
--        ON r.SchemaName = c.TABLE_SCHEMA AND r.TableName = c.TABLE_NAME
--       AND r.Status IN ('ADDED','ALREADY_PRESENT')
--      GROUP BY c.TABLE_SCHEMA, c.TABLE_NAME
--      HAVING has_vanid = 0 OR has_vanserialno = 0 OR has_lastmoddate = 0
--          OR has_processed = 0 OR has_autoinc_pk = 0 OR lastmoddate_auto = 0
--      ORDER BY c.TABLE_SCHEMA, c.TABLE_NAME;
-- =============================================================================
