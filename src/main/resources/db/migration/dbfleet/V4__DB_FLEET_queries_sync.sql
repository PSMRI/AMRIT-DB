-- db_fleet V4: read-only SQL queries run on camp laptops, and MMU data-sync health per laptop.
--  * query_template: the query library admins pick from (and save to)
--  * fleet_query / fleet_query_target: a query an admin scheduled for one or more camps; each laptop
--    runs it when it next checks in (or when the camp console presses "Check now") and uploads the
--    result as a gzipped CSV
--  * device_sync / device_sync_table: rows the laptop has not yet uploaded to central (Processed N/U)
--    and rows central rejected (Processed F, with SyncFailureReason), from the heartbeat
-- All DATETIME columns are UTC.

USE db_fleet;

CREATE TABLE IF NOT EXISTS query_template (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(128) NOT NULL,
    description      VARCHAR(500) NULL,
    sql_text         TEXT         NOT NULL,
    max_rows         INT          NOT NULL DEFAULT 5000,
    created_by       VARCHAR(64)  NULL,
    created_at       DATETIME     NOT NULL,
    updated_by       VARCHAR(64)  NULL,
    updated_at       DATETIME     NULL,
    UNIQUE KEY ux_template_name (name)
);

CREATE TABLE IF NOT EXISTS fleet_query (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    title            VARCHAR(200) NOT NULL,
    sql_text         TEXT         NOT NULL,
    template_id      BIGINT       NULL,
    max_rows         INT          NOT NULL DEFAULT 5000,
    timeout_sec      INT          NOT NULL DEFAULT 60,
    created_by       VARCHAR(64)  NULL,
    created_at       DATETIME     NOT NULL,
    cancelled_at     DATETIME     NULL,
    cancelled_by     VARCHAR(64)  NULL,
    INDEX ix_query_created (created_at)
);

-- One row per camp a query was sent to. result_gz holds the CSV exactly as the laptop gzipped it.
CREATE TABLE IF NOT EXISTS fleet_query_target (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    query_id         BIGINT       NOT NULL,
    van_id           INT          NOT NULL,
    device_id        CHAR(36)     NULL,                        -- laptop that picked it up
    status           ENUM('QUEUED','SENT','DONE','FAILED','CANCELLED','EXPIRED') NOT NULL DEFAULT 'QUEUED',
    sent_at          DATETIME     NULL,
    finished_at      DATETIME     NULL,
    row_count        INT          NULL,
    truncated        BOOLEAN      NOT NULL DEFAULT FALSE,
    duration_ms      INT          NULL,
    error            VARCHAR(1000) NULL,
    run_by           ENUM('central','console') NULL,           -- console: camp admin pressed "Check now"
    result_gz        MEDIUMBLOB   NULL,
    result_bytes     INT          NULL,
    UNIQUE KEY ux_target (query_id, van_id),
    INDEX ix_target_van (van_id, status),
    INDEX ix_target_status (status, sent_at),
    CONSTRAINT fk_target_query FOREIGN KEY (query_id) REFERENCES fleet_query(id) ON DELETE CASCADE
);

-- Sync summary per laptop. Replaced on each heartbeat that carries a sync block.
CREATE TABLE IF NOT EXISTS device_sync (
    device_id        CHAR(36)     PRIMARY KEY,
    failed_rows      INT          NOT NULL DEFAULT 0,
    pending_rows     INT          NOT NULL DEFAULT 0,
    oldest_pending_at DATETIME    NULL,
    last_synced_at   DATETIME     NULL,
    checked_at       DATETIME     NULL,                        -- when the laptop counted
    CONSTRAINT fk_sync_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Only tables with failed or pending rows (or that could not be counted). Replaced wholesale.
CREATE TABLE IF NOT EXISTS device_sync_table (
    device_id        CHAR(36)     NOT NULL,
    schema_name      VARCHAR(64)  NOT NULL,
    table_name       VARCHAR(64)  NOT NULL,
    failed           INT          NOT NULL DEFAULT 0,
    pending          INT          NOT NULL DEFAULT 0,
    oldest_pending_at DATETIME    NULL,
    last_synced_at   DATETIME     NULL,
    reasons          JSON         NULL,                        -- [{reason, count, lastTried}], top 5
    error            VARCHAR(500) NULL,
    PRIMARY KEY (device_id, schema_name, table_name),
    CONSTRAINT fk_synctab_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Starter library. Edit the table name / filters before sending.
INSERT IGNORE INTO query_template (name, description, sql_text, max_rows, created_by, created_at) VALUES
('Synced tables',
 'Tables MMU-API uploads to central, by sync group.',
 'SELECT SyncTableGroupID, SchemaName, TableName, IsMaster\nFROM db_iemr.m_synctabledetail\nWHERE Deleted = 0\nORDER BY SyncTableGroupID, SchemaName, TableName',
 1000, 'system', UTC_TIMESTAMP()),
('Failed sync rows (visit details)',
 'Rows central rejected, with the reason. Change the table to look at another one.',
 'SELECT *\nFROM db_iemr.t_benvisitdetail\nWHERE Processed = ''F''\nORDER BY SyncedDate DESC',
 1000, 'system', UTC_TIMESTAMP()),
('Pending sync rows (visit details)',
 'Rows not uploaded to central yet (N = new, U = updated). Change the table to look at another one.',
 'SELECT VanSerialNo, BeneficiaryRegID, VisitCode, Processed, CreatedDate, SyncedDate\nFROM db_iemr.t_benvisitdetail\nWHERE Processed IN (''N'', ''U'')\nORDER BY CreatedDate',
 5000, 'system', UTC_TIMESTAMP()),
('Flyway history (db_iemr)',
 'Migrations applied to db_iemr, newest first. Change the schema for db_identity, db_reporting ...',
 'SELECT installed_rank, version, description, script, checksum, installed_on, success\nFROM db_iemr.flyway_schema_history\nORDER BY installed_rank DESC',
 500, 'system', UTC_TIMESTAMP()),
('Table sizes',
 'Approximate rows and size per table in the AMRIT schemas.',
 'SELECT table_schema, table_name, table_rows, ROUND((data_length + index_length) / 1048576, 1) AS size_mb\nFROM information_schema.tables\nWHERE table_schema IN (''db_iemr'', ''db_identity'', ''db_reporting'', ''db_1097_identity'')\nORDER BY size_mb DESC',
 1000, 'system', UTC_TIMESTAMP());
