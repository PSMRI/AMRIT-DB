USE db_iemr;

-- =============================================================================
-- Down-sync (central -> local) support.
--
-- The up-sync (van -> central) is driven by m_synctabledetail. This script adds
-- the mirror image of that configuration, m_downsynctabledetail, plus the
-- per-record bookkeeping columns the down-sync needs, and the standard AMRIT
-- sync columns that tb_screening / tb_suspected never had even though the
-- up-sync already carries both tables.
--
-- This script runs in EVERY environment - central, local (van), prod, UAT - so
-- both sides of the sync end up with the same columns. The down-sync resolves
-- the column list from information_schema on the van and asks central for
-- exactly that list, so a column that exists on one side only breaks the sync
-- of that table.
--
-- Columns added
--   Processed, SyncFailureReason, SyncedDate, Syncedby, LastModDate,
--   VanSerialNo, VanID   the standard AMRIT sync columns (tb_* tables only)
--   DownSynced             'N' not yet delivered to the van | 'P' delivered
--                          | 'F' delivery failed / conflict | 'U' queued by hand
--   DownSyncDate           when the record was last delivered to a van
--   DownSyncFailureReason  why delivery failed, e.g. 'CONFLICT'
--   LastDownSyncDate       when this record was last received from central
--
-- DownSynced / DownSyncDate / DownSyncFailureReason are written by central and
-- LastDownSyncDate by the van, but all four exist everywhere. Neither side
-- reads the columns it does not own, and the sync never copies any of the four.
--
-- No triggers. Which records travel down is decided by the down-sync query
-- alone:
--
--   WHERE VanID = ?
--     AND ( DownSynced IS NULL OR DownSynced IN ('N','U')
--           OR ( DownSynced = 'P' AND DownSyncDate IS NOT NULL
--                AND LastModDate > DownSyncDate ) )
--
-- so an edit made directly in central is detected from LastModDate, which the
-- application (and the ON UPDATE CURRENT_TIMESTAMP default below) already
-- maintains. A record that reached central through the up-sync is stamped
-- DownSynced = 'P' / DownSyncDate = now() by the up-sync itself and is
-- therefore not echoed back to the van it came from.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Temporary helpers: MySQL has no ADD COLUMN / ADD KEY IF NOT EXISTS, and this
-- script adds eleven columns to two tables. Dropped at the end.
-- -----------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS amrit_add_column_if_missing;
DROP PROCEDURE IF EXISTS amrit_add_index_if_missing;
DROP PROCEDURE IF EXISTS amrit_ensure_auto_increment;

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

-- The down-sync inserts a record it has never seen without its primary key, so
-- that the local DB mints its own id and reports it back to central. A primary
-- key that is not AUTO_INCREMENT makes that insert fail with "Field 'id' doesn't
-- have a default value". tb_screening / tb_suspected were created without it in
-- V1 (db_iemr), so ensure it here; a no-op wherever the table already has it.
-- MODIFY COLUMN rebuilds the table, so on a central DB with a large tb_screening
-- expect this one statement to take a while.
CREATE PROCEDURE amrit_ensure_auto_increment(
	IN in_schema VARCHAR(64),
	IN in_table  VARCHAR(64),
	IN in_column VARCHAR(64),
	IN in_type   VARCHAR(64)
)
BEGIN
	DECLARE needs_change INT DEFAULT 0;

	SELECT COUNT(*) INTO needs_change
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = in_schema AND TABLE_NAME = in_table AND COLUMN_NAME = in_column
	  AND EXTRA NOT LIKE '%auto_increment%';

	IF needs_change > 0 THEN
		SET @ddl = CONCAT('ALTER TABLE `', in_schema, '`.`', in_table, '` MODIFY COLUMN `', in_column, '` ',
		                  in_type, ' NOT NULL AUTO_INCREMENT');
		PREPARE fix_pk FROM @ddl;
		EXECUTE fix_pk;
		DEALLOCATE PREPARE fix_pk;
	END IF;
END $$

DELIMITER ;

-- -----------------------------------------------------------------------------
-- Down-sync configuration table. Present in every environment: the van reads it
-- to know what to pull and in which order, central reads it to know which
-- tables carry the DownSynced flag. Analogous to m_synctabledetail, which
-- drives the up-sync.
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS m_downsynctabledetail (
	DownSyncTableDetailID INT           NOT NULL AUTO_INCREMENT,
	SchemaName            VARCHAR(100)  NOT NULL COMMENT 'db_identity / db_iemr',
	TableName             VARCHAR(200)  NOT NULL COMMENT 'table to down-sync',
	ServerColumnName      TEXT          NULL     COMMENT 'columns to SELECT from central; NULL = resolve from information_schema',
	VanColumnName         TEXT          NULL     COMMENT 'columns in local, positionally mapped with ServerColumnName',
	VanAutoIncColumnName  VARCHAR(200)  NULL     COMMENT 'local auto-increment PK - skipped on INSERT so local generates its own value',
	TableType             VARCHAR(20)   NOT NULL DEFAULT 'MASTER' COMMENT 'MASTER = full pull, no VanID filter / TRANSACTIONAL = filter by VanID + DownSynced',
	SyncOrder             INT           NOT NULL DEFAULT 1000 COMMENT 'lower number syncs first - enforces the FK dependency chain',
	IsActive              BIT(1)        NOT NULL DEFAULT b'1',
	PRIMARY KEY (DownSyncTableDetailID),
	UNIQUE KEY uk_downsynctabledetail_table (SchemaName, TableName),
	KEY idx_downsynctabledetail_order (SyncOrder)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- -----------------------------------------------------------------------------
-- tb_screening / tb_suspected: the standard sync columns, then the down-sync
-- columns.
-- -----------------------------------------------------------------------------
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'Processed',             'CHAR(4) NOT NULL DEFAULT ''N''');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'SyncFailureReason',     'VARCHAR(255) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'SyncedDate',            'DATETIME NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'Syncedby',              'VARCHAR(50) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'LastModDate',           'DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'VanSerialNo',           'BIGINT(20) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'VanID',                 'INT(11) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'DownSynced',            'CHAR(1) NOT NULL DEFAULT ''N''');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'DownSyncDate',          'DATETIME NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'DownSyncFailureReason', 'VARCHAR(255) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_screening', 'LastDownSyncDate',      'DATETIME NULL DEFAULT NULL');

CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'Processed',             'CHAR(4) NOT NULL DEFAULT ''N''');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'SyncFailureReason',     'VARCHAR(255) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'SyncedDate',            'DATETIME NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'Syncedby',              'VARCHAR(50) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'LastModDate',           'DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'VanSerialNo',           'BIGINT(20) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'VanID',                 'INT(11) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'DownSynced',            'CHAR(1) NOT NULL DEFAULT ''N''');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'DownSyncDate',          'DATETIME NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'DownSyncFailureReason', 'VARCHAR(255) NULL DEFAULT NULL');
CALL amrit_add_column_if_missing('db_iemr', 'tb_suspected', 'LastDownSyncDate',      'DATETIME NULL DEFAULT NULL');

CALL amrit_ensure_auto_increment('db_iemr', 'tb_screening', 'id', 'BIGINT(20)');
CALL amrit_ensure_auto_increment('db_iemr', 'tb_suspected', 'id', 'BIGINT(20)');

-- (VanID, Processed) serves the up-sync select, (VanID, DownSynced) the
-- down-sync select.
CALL amrit_add_index_if_missing('db_iemr', 'tb_screening', 'idx_tb_screening_sync',     '`VanID`, `Processed`');
CALL amrit_add_index_if_missing('db_iemr', 'tb_suspected', 'idx_tb_suspected_sync',     '`VanID`, `Processed`');
CALL amrit_add_index_if_missing('db_iemr', 'tb_screening', 'idx_tb_screening_downsync', '`VanID`, `DownSynced`');
CALL amrit_add_index_if_missing('db_iemr', 'tb_suspected', 'idx_tb_suspected_downsync', '`VanID`, `DownSynced`');

DROP PROCEDURE IF EXISTS amrit_add_column_if_missing;
DROP PROCEDURE IF EXISTS amrit_add_index_if_missing;
DROP PROCEDURE IF EXISTS amrit_ensure_auto_increment;

-- =============================================================================
-- Down-sync configuration. SyncOrder reproduces the FK dependency chain:
-- masters, then the beneficiary root tables, then the transactional tables.
-- =============================================================================
INSERT INTO m_downsynctabledetail
	(SchemaName, TableName, VanAutoIncColumnName, TableType, SyncOrder, IsActive)
VALUES
	-- ---------------- master / reference data ----------------
	('db_iemr',     'm_state',                    NULL, 'MASTER',  10, b'1'),
	('db_iemr',     'm_district',                 NULL, 'MASTER',  20, b'1'),
	('db_iemr',     'm_districtblock',            NULL, 'MASTER',  30, b'1'),
	('db_iemr',     'm_providerservicemapping',   NULL, 'MASTER',  40, b'1'),
	('db_iemr',     'm_vantype',                  NULL, 'MASTER',  50, b'1'),
	('db_iemr',     'm_van',                      NULL, 'MASTER',  60, b'1'),
	('db_iemr',     'm_parkingplace',             NULL, 'MASTER',  70, b'1'),
	('db_iemr',     'm_servicepoint',             NULL, 'MASTER',  80, b'1'),
	('db_iemr',     'm_servicepointvillagemap',   NULL, 'MASTER',  90, b'1'),
	('db_iemr',     'm_vanservicepointmap',       NULL, 'MASTER', 100, b'1'),
	('db_iemr',     'm_user',                     NULL, 'MASTER', 110, b'1'),
	('db_iemr',     'm_uservanmapping',           NULL, 'MASTER', 120, b'1'),
	('db_iemr',     'm_userparkingplacemap',      NULL, 'MASTER', 130, b'1'),

	-- ---------------- beneficiary root tables ----------------
	-- Seeded INACTIVE on purpose. Two things have to be settled first:
	--
	--   * volume - these are the largest tables in db_identity (millions of rows,
	--     the whole country), so a MASTER full pull is not something a laptop can
	--     take. They need the VanID filter, i.e. TRANSACTIONAL.
	--   * primary keys - the down-sync mints a local id for an inserted record,
	--     but i_beneficiarymapping *points at* the primary keys of
	--     i_beneficiarydetails / i_beneficiaryaddress / i_beneficiarycontacts /
	--     i_beneficiaryidentity, and those are per-DB auto-increments that do not
	--     agree between central and a van. Delivering the beneficiary graph needs
	--     the pointers rewritten to the ids the van minted; copying the columns
	--     verbatim would leave them pointing at central's rows.
	--     BeneficiaryRegID itself is safe - it comes from the provisioned pool in
	--     m_beneficiaryregidmapping and is globally unique.
	--
	-- Until then the down-sync delivers records *of beneficiaries the van already
	-- knows* (registered on the van, then created or edited in central). A
	-- beneficiary first registered in central - the phone-registration case -
	-- needs these rows active and the two points above resolved.
	('db_identity', 'm_beneficiaryregidmapping',  NULL, 'MASTER', 200, b'0'),
	('db_identity', 'i_beneficiarymapping',       NULL, 'MASTER', 210, b'0'),

	-- ---------------- transactional / clinical ----------------
	-- VanAutoIncColumnName must be the real auto-increment PK of the table: the
	-- down-sync leaves it out of the INSERT so that local generates its own id.
	('db_identity', 'i_householddetails',         'houseHoldDetailsId',         'TRANSACTIONAL', 300, b'1'),
	('db_identity', 'i_beneficiarydetails_rmnch', 'beneficiaryDetails_RmnchId', 'TRANSACTIONAL', 310, b'1'),
	('db_iemr',     'tb_screening',               'id',                         'TRANSACTIONAL', 320, b'1'),
	('db_iemr',     'tb_suspected',               'id',                         'TRANSACTIONAL', 330, b'1')
ON DUPLICATE KEY UPDATE
	VanAutoIncColumnName = VALUES(VanAutoIncColumnName),
	TableType            = VALUES(TableType),
	SyncOrder            = VALUES(SyncOrder),
	IsActive             = VALUES(IsActive);

-- -----------------------------------------------------------------------------
-- ServerColumnName and VanColumnName are deliberately left NULL.
--
-- MMU-API resolves the column list from information_schema at sync time,
-- ordered by column name and with the bookkeeping columns excluded, and sends
-- that list to central as the SELECT list. Resolving it per sync is what keeps
-- the two sides in step: a list snapshotted here would go stale the moment a
-- later migration adds a column, and the new column would never sync.
--
-- Ordering by name rather than by ordinal position matters as well - ordinal
-- position depends on the order in which an environment happened to acquire its
-- columns, the name does not.
--
-- Set these columns only to override the resolved list for a specific table,
-- for instance when a column is named differently in central and on the van. If
-- one is set, both must be set, with the same number of columns in the same
-- order.
-- -----------------------------------------------------------------------------

-- Sanity checks - run on central and on a van and compare the two outputs:
--   SELECT SyncOrder, SchemaName, TableName, TableType, VanAutoIncColumnName,
--          ServerColumnName, VanColumnName
--   FROM m_downsynctabledetail WHERE IsActive = b'1' ORDER BY SyncOrder;
--
--   -- the column list each side would resolve, and its fingerprint
--   SELECT TABLE_SCHEMA, TABLE_NAME, COUNT(*) AS column_count,
--          MD5(GROUP_CONCAT(COLUMN_NAME ORDER BY COLUMN_NAME SEPARATOR ',')) AS column_list_hash
--   FROM information_schema.COLUMNS
--   WHERE TABLE_SCHEMA IN ('db_iemr', 'db_identity')
--     AND COLUMN_NAME NOT IN ('DownSynced', 'DownSyncDate', 'DownSyncFailureReason', 'LastDownSyncDate')
--     AND TABLE_NAME IN (SELECT TableName FROM db_iemr.m_downsynctabledetail WHERE IsActive = b'1')
--   GROUP BY TABLE_SCHEMA, TABLE_NAME ORDER BY TABLE_SCHEMA, TABLE_NAME;
--
-- A column_list_hash that differs between central and a van is schema drift and
-- will break the down-sync of that table.

-- =============================================================================
-- Backfill the rows that existed before this script ran.
--
-- A row that carries a VanSerialNo reached central through the up-sync, so the
-- van it belongs to already has it: mark it delivered, otherwise the first
-- down-sync of every van would pull its entire history back down.
--
-- A row without a VanSerialNo was created in central and has never been on a
-- van, so it is left at 'N' and travels down on the first sync - but only if it
-- carries the VanID of the van that is syncing, which is what the down-sync
-- filters on.
--
-- DownSyncDate is stamped alongside, because the "edited in central after
-- delivery" test is LastModDate > DownSyncDate and a NULL DownSyncDate would
-- never satisfy it.
--
-- LastModDate is assigned to itself so that MySQL does not fire its ON UPDATE
-- CURRENT_TIMESTAMP and make every backfilled row look as if it had just been
-- edited in central.
--
-- To deliberately re-deliver a record, set DownSynced = 'N' for it.
-- =============================================================================
UPDATE tb_screening
SET DownSynced = 'P', DownSyncDate = now(), LastModDate = LastModDate
WHERE DownSynced = 'N' AND VanSerialNo IS NOT NULL;

UPDATE tb_suspected
SET DownSynced = 'P', DownSyncDate = now(), LastModDate = LastModDate
WHERE DownSynced = 'N' AND VanSerialNo IS NOT NULL;
