USE db_iemr;

-- =============================================================================
-- Register every up-synced table for down-sync.
--
-- V102 seeded m_downsynctabledetail with the 13 masters and the 4 transactional
-- tables of the first cut - 19 rows. This script adds the rest: every
-- transactional table configured in m_synctabledetail, so that the down-sync
-- covers the same table set as the up-sync.
--
-- On this codebase's configuration that is 92 tables (80 db_iemr + 12
-- db_identity); every row in m_synctabledetail is IsMaster = 0, so the whole
-- up-sync set is transactional.
--
-- Two things are deliberately NOT taken from m_synctabledetail:
--
--   * VanAutoIncColumnName. In the up-sync configuration this column holds the
--     literal string 'vanSerialNo' for 16 of the tables, not the table's primary
--     key - which is what the down-sync needs, because it omits the PK on INSERT
--     so the local DB mints its own id. The value is therefore resolved from
--     information_schema: the table's actual AUTO_INCREMENT column. All 92
--     tables have exactly one.
--
--   * The table name's case. m_synctabledetail stores names like
--     't_BenVisitDetail' while information_schema reports the real name, and
--     comparisons against information_schema are case-sensitive on MySQL 8, so
--     every join here is on LOWER().
--
-- PART A adds LastModDate where it is missing. PART B does the registration.
-- =============================================================================

-- =============================================================================
-- PART A - LastModDate
--
-- 11 db_iemr tables in the up-sync set have no LastModDate column: the StopTB
-- tb_* tables and the dynamic-form t_*_response tables. The down-sync cannot
-- work on them without it, and not because of a nicety:
--
--   * central selects the records to send with
--       ... OR ( DownSynced = 'P' AND DownSyncDate IS NOT NULL
--                AND LastModDate > DownSyncDate )
--     (DataSyncRepositoryCentralDownload) - the column is in the SQL text
--     unconditionally, so the query fails with "Unknown column 'LastModDate'";
--   * the van looks its local copy up with
--       SELECT <pk>, Processed, LastModDate, LastDownSyncDate ...
--     (DataSyncRepository.getLocalRecordForDownSync) - same thing;
--   * and conflict detection is central.LastModDate > local.LastModDate, which
--     without the column has nothing to compare.
--
-- The definition matches the one V102 used for tb_screening / tb_suspected, so
-- all 92 tables end up consistent.
--
-- Existing rows take the default, i.e. the time this ALTER runs, which would
-- leave them looking edited-in-central more recently than the DownSyncDate that
-- V103's backfill stamped - and every one of them would travel down on the first
-- sync. The re-stamp below fixes that by moving DownSyncDate back ahead of
-- LastModDate. LastModDate is assigned to itself so ON UPDATE does not fire.
-- =============================================================================

DROP PROCEDURE IF EXISTS amrit_downsync_add_lastmoddate;

DELIMITER $$

CREATE PROCEDURE amrit_downsync_add_lastmoddate()
BEGIN
	DECLARE v_done   INT DEFAULT 0;
	DECLARE v_schema VARCHAR(64);
	DECLARE v_table  VARCHAR(64);

	-- Every table of the up-sync set, in either schema, that has no LastModDate.
	DECLARE table_cursor CURSOR FOR
		SELECT t.TABLE_SCHEMA, t.TABLE_NAME
		FROM information_schema.TABLES t
		JOIN (SELECT DISTINCT LOWER(TRIM(SchemaName)) sch, LOWER(TRIM(TableName)) tbl
		      FROM db_iemr.m_synctabledetail
		      WHERE IFNULL(Deleted, b'0') = b'0'
		        AND TableName IS NOT NULL AND SchemaName IS NOT NULL) cfg
		  ON cfg.sch = LOWER(t.TABLE_SCHEMA) AND cfg.tbl = LOWER(t.TABLE_NAME)
		WHERE t.TABLE_TYPE = 'BASE TABLE'
		  AND NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS c
		                  WHERE c.TABLE_SCHEMA = t.TABLE_SCHEMA
		                    AND c.TABLE_NAME = t.TABLE_NAME
		                    AND c.COLUMN_NAME = 'LastModDate')
		ORDER BY t.TABLE_SCHEMA, t.TABLE_NAME;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

	OPEN table_cursor;

	add_loop: LOOP
		FETCH table_cursor INTO v_schema, v_table;
		IF v_done = 1 THEN
			LEAVE add_loop;
		END IF;

		SET @ddl = CONCAT('ALTER TABLE `', v_schema, '`.`', v_table,
		                  '` ADD COLUMN `LastModDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP',
		                  ' ON UPDATE CURRENT_TIMESTAMP');
		PREPARE add_col FROM @ddl;
		EXECUTE add_col;
		DEALLOCATE PREPARE add_col;

		-- Keep the rows that V103 marked delivered out of the next down-sync.
		IF EXISTS (SELECT 1 FROM information_schema.COLUMNS
		           WHERE TABLE_SCHEMA = v_schema AND TABLE_NAME = v_table
		             AND COLUMN_NAME = 'DownSynced') THEN
			SET @restamp = CONCAT('UPDATE `', v_schema, '`.`', v_table,
			                      '` SET DownSyncDate = now(), LastModDate = LastModDate',
			                      ' WHERE DownSynced = ''P''',
			                      '   AND ( DownSyncDate IS NULL OR DownSyncDate <= LastModDate )');
			PREPARE restamp FROM @restamp;
			EXECUTE restamp;
			DEALLOCATE PREPARE restamp;
		END IF;
	END LOOP add_loop;

	CLOSE table_cursor;
END $$

DELIMITER ;

CALL amrit_downsync_add_lastmoddate();
DROP PROCEDURE IF EXISTS amrit_downsync_add_lastmoddate;

-- =============================================================================
-- PART B - register the tables
--
-- SyncOrder: the up-sync order is reused as the down-sync order. It is the same
-- FK dependency chain, walked in the direction the records were created, and
-- m_synctabledetail already encodes it as (SyncTableGroupID, SyncTableDetailID)
-- - group 1 the beneficiary identity tables, then the clinical groups. Rows with
-- no group sort last. The offset of 1000 used by the INSERT only places the new
-- rows behind V102's, which kept their original numbers; PART C then renumbers
-- everything densely, so the offset never survives the migration.
--
-- IsActive: a table is activated only when it can actually be down-synced -
-- VanID, VanSerialNo, Processed and LastModDate present, exactly one
-- AUTO_INCREMENT column, and LastModDate auto-maintained. Everything else is
-- registered but left inactive; the queries at the end of this script say which
-- and why.
--
-- The beneficiary identity graph is registered INACTIVE regardless, and must
-- stay that way until the down-sync learns to rewrite primary keys.
-- i_beneficiarymapping carries BenDetailsId / BenAddressId / BenImageId /
-- BenContactsId / BenConsentId / BenAccountID / BenSecureStackId, which point at
-- the primary keys of the other identity tables. Those keys are per-DB
-- AUTO_INCREMENTs that do not agree between central and a van, and the down-sync
-- mints a fresh local id on INSERT - so copying the pointer columns verbatim
-- leaves them addressing central's rows. Activating these tables does not fail
-- loudly, it silently mis-links beneficiaries. BenRegId is the exception: it
-- comes from the provisioned pool and is globally unique.
--
-- ON DUPLICATE KEY UPDATE deliberately leaves SyncOrder and IsActive alone, so
-- re-running this cannot reorder or re-activate anything an operator has since
-- tuned by hand - including V102's two inactive identity rows.
--
-- NOTE ON PRIVILEGES: the db_identity rows are registered from this db_iemr
-- script, which needs to see db_identity in information_schema. Running as a
-- user without rights there silently registers only the db_iemr tables - check
-- the per-schema count at the end.
-- =============================================================================

INSERT INTO m_downsynctabledetail
	(SchemaName, TableName, VanAutoIncColumnName, TableType, SyncOrder, IsActive)
SELECT
	src.SchemaName,
	src.TableName,
	src.PkColumn,
	'TRANSACTIONAL',
	1000 + 10 * ROW_NUMBER() OVER (ORDER BY src.grp IS NULL, src.grp, src.min_id, src.TableName),
	IF(src.identity_graph = 0
	   AND src.PkColumn IS NOT NULL AND src.autoinc_count = 1
	   AND src.has_vanid = 1 AND src.has_vanserialno = 1
	   AND src.has_processed = 1 AND src.has_lastmoddate = 1
	   AND src.lastmoddate_auto = 1, b'1', b'0') AS IsActive
FROM (
	SELECT
		t.TABLE_SCHEMA AS SchemaName,
		t.TABLE_NAME   AS TableName,
		cfg.grp,
		cfg.min_id,
		MAX(IF(c.EXTRA LIKE '%auto_increment%', c.COLUMN_NAME, NULL))            AS PkColumn,
		SUM(c.EXTRA LIKE '%auto_increment%')                                     AS autoinc_count,
		MAX(c.COLUMN_NAME = 'VanID')                                             AS has_vanid,
		MAX(c.COLUMN_NAME = 'VanSerialNo')                                       AS has_vanserialno,
		MAX(c.COLUMN_NAME = 'Processed')                                         AS has_processed,
		MAX(c.COLUMN_NAME = 'LastModDate')                                       AS has_lastmoddate,
		MAX(c.COLUMN_NAME = 'LastModDate' AND c.EXTRA LIKE '%on update%')        AS lastmoddate_auto,
		LOWER(t.TABLE_NAME) IN ('i_beneficiarydetails', 'i_beneficiaryaddress',
		                        'i_beneficiarycontacts', 'i_beneficiaryaccount',
		                        'i_beneficiarymapping', 'i_beneficiaryfamilymapping',
		                        'i_beneficiaryidentity', 'm_beneficiaryregidmapping')
		                                                                         AS identity_graph
	FROM (SELECT LOWER(TRIM(SchemaName)) sch, LOWER(TRIM(TableName)) tbl,
	             MIN(SyncTableGroupID) grp, MIN(SyncTableDetailID) min_id
	      FROM db_iemr.m_synctabledetail
	      WHERE IFNULL(Deleted, b'0') = b'0'
	        AND TableName IS NOT NULL AND SchemaName IS NOT NULL
	      GROUP BY 1, 2) cfg
	JOIN information_schema.TABLES t
	  ON LOWER(t.TABLE_SCHEMA) = cfg.sch AND LOWER(t.TABLE_NAME) = cfg.tbl
	 AND t.TABLE_TYPE = 'BASE TABLE'
	JOIN information_schema.COLUMNS c
	  ON c.TABLE_SCHEMA = t.TABLE_SCHEMA AND c.TABLE_NAME = t.TABLE_NAME
	GROUP BY t.TABLE_SCHEMA, t.TABLE_NAME, cfg.grp, cfg.min_id
) src
ON DUPLICATE KEY UPDATE
	VanAutoIncColumnName = VALUES(VanAutoIncColumnName),
	TableType            = VALUES(TableType);

-- =============================================================================
-- PART C - dense SyncOrder
--
-- Renumber every row 1, 2, 3 ... in the order it already has. Purely cosmetic:
-- the van walks the configuration with ORDER BY SyncOrder, DownSyncTableDetailID
-- (DownSyncTableDetailRepo), so only the relative order has ever mattered - but
-- a dense sequence is easier to read than V102's bands (10-130, 200-210,
-- 300-330) mixed with the INSERT's 1000+ values.
--
-- Order-preserving, therefore idempotent: on an already-dense table this
-- assigns every row the number it has.
--
-- The numbers do NOT have to agree between central and a van. Each van orders
-- its own down-sync from its own copy of this table, and central only ever looks
-- a table up by name (getActiveDownSyncTableByName) - it never reads SyncOrder.
-- So an environment whose m_synctabledetail differs simply gets its own dense
-- sequence.
--
-- Inserting a table later means picking a number that is already taken. Either
-- renumber again with the statement below, or give the new row a fractional slot
-- by re-running PART C afterwards - the sequence is rebuilt from the current
-- order either way.
--
-- The derived table is materialised into a temporary table first: updating a
-- table while selecting from it in the same statement is error 1093.
-- =============================================================================

DROP TEMPORARY TABLE IF EXISTS tmp_downsync_order;

CREATE TEMPORARY TABLE tmp_downsync_order AS
SELECT DownSyncTableDetailID,
       ROW_NUMBER() OVER (ORDER BY SyncOrder, DownSyncTableDetailID) AS NewSyncOrder
FROM m_downsynctabledetail;

UPDATE m_downsynctabledetail d
JOIN tmp_downsync_order t ON t.DownSyncTableDetailID = d.DownSyncTableDetailID
SET d.SyncOrder = t.NewSyncOrder;

DROP TEMPORARY TABLE IF EXISTS tmp_downsync_order;

-- =============================================================================
-- Verify - run these after the migration.
--
-- 1. What is registered now, and how much of it is live:
--      SELECT TableType, IsActive, COUNT(*) FROM db_iemr.m_downsynctabledetail
--      GROUP BY TableType, IsActive;
--
-- 2. Per schema, so a privilege problem on db_identity is visible:
--      SELECT SchemaName, TableType, IsActive, COUNT(*)
--      FROM db_iemr.m_downsynctabledetail GROUP BY SchemaName, TableType, IsActive;
--
-- 3. Registered but inactive, and why. The beneficiary identity graph is
--    expected here; anything else is a table that cannot be down-synced yet:
--      SELECT d.SchemaName, d.TableName, d.VanAutoIncColumnName,
--             MAX(c.COLUMN_NAME = 'VanID')       AS has_vanid,
--             MAX(c.COLUMN_NAME = 'VanSerialNo') AS has_vanserialno,
--             MAX(c.COLUMN_NAME = 'Processed')   AS has_processed,
--             MAX(c.COLUMN_NAME = 'LastModDate') AS has_lastmoddate,
--             MAX(c.COLUMN_NAME = 'LastModDate' AND c.EXTRA LIKE '%on update%') AS lastmoddate_auto,
--             SUM(c.EXTRA LIKE '%auto_increment%') AS autoinc_count
--      FROM db_iemr.m_downsynctabledetail d
--      JOIN information_schema.COLUMNS c
--        ON c.TABLE_SCHEMA = d.SchemaName AND c.TABLE_NAME = d.TableName
--      WHERE d.IsActive = b'0'
--      GROUP BY d.SchemaName, d.TableName, d.VanAutoIncColumnName
--      ORDER BY d.SchemaName, d.TableName;
--
-- 4. The down-sync order, as the van will walk it:
--      SELECT SyncOrder, SchemaName, TableName, TableType, VanAutoIncColumnName
--      FROM db_iemr.m_downsynctabledetail WHERE IsActive = b'1' ORDER BY SyncOrder;
--
-- 5. Nothing eligible should appear immediately after this migration - PART A's
--    re-stamp exists precisely so history does not travel down. Per active
--    table:
--      SELECT DownSynced, COUNT(*) FROM db_iemr.tb_stoptb_visit GROUP BY DownSynced;
--
-- 6. The sequence is dense and gap-free:
--      SELECT COUNT(*) AS rows_found, MIN(SyncOrder) AS lowest, MAX(SyncOrder) AS highest
--      FROM db_iemr.m_downsynctabledetail;   -- highest must equal rows_found
--
-- To phase the testing, deactivate the transactional tables this script added
-- and bring them back a few at a time (the first cut keeps its own rows):
--      UPDATE db_iemr.m_downsynctabledetail SET IsActive = b'0'
--      WHERE TableType = 'TRANSACTIONAL'
--        AND TableName NOT IN ('tb_screening','tb_suspected',
--                              'i_householddetails','i_beneficiarydetails_rmnch');
-- =============================================================================
