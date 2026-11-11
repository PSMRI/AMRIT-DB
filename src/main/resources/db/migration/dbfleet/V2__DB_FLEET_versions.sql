-- db_fleet V2: what else each laptop reports and what it should be running.
--  * device_tablet: STOP-TB tablets that reported their app version to the camp laptop
--  * device_schema: each laptop's Flyway version per AMRIT schema (db.war /db/migration/version)
--  * schema_release: the Flyway version per schema in the db.war on the builds server (db-schema.json)
--  * fleet_setting: small admin settings, e.g. the STOP-TB app version tablets should run
-- All DATETIME columns are UTC.

USE db_fleet;

-- Tablets per laptop, from the heartbeat. Replaced wholesale on each heartbeat.
CREATE TABLE IF NOT EXISTS device_tablet (
    device_id        CHAR(36)     NOT NULL,
    tablet_id        VARCHAR(64)  NOT NULL,                    -- Android ID
    user_name        VARCHAR(64)  NULL,                        -- AMRIT user last signed in on the tablet
    app              VARCHAR(128) NULL,                        -- application id
    version_name     VARCHAR(32)  NULL,
    version_code     INT          NULL,
    first_seen       DATETIME     NULL,
    last_seen        DATETIME     NULL,
    PRIMARY KEY (device_id, tablet_id),
    INDEX ix_tablet (tablet_id),
    CONSTRAINT fk_tab_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Migration state per laptop and schema, from the heartbeat. Replaced wholesale on each heartbeat.
CREATE TABLE IF NOT EXISTS device_schema (
    device_id        CHAR(36)     NOT NULL,
    db_name          VARCHAR(64)  NOT NULL,                    -- db_iemr | db_identity | ...
    version          VARCHAR(32)  NULL,                        -- last applied Flyway version; NULL = none
    failed           BOOLEAN      NOT NULL DEFAULT FALSE,      -- a migration failed (db.war down, service failed)
    stale            BOOLEAN      NOT NULL DEFAULT FALSE,      -- db.war not reachable; last known values
    reported_at      DATETIME     NULL,
    PRIMARY KEY (device_id, db_name),
    CONSTRAINT fk_schema_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- The latest Flyway version per schema in the published db.war. Refreshed by the builds poller.
CREATE TABLE IF NOT EXISTS schema_release (
    db_name          VARCHAR(64)  PRIMARY KEY,
    version          VARCHAR(32)  NOT NULL,
    checked_at       DATETIME     NOT NULL
);

CREATE TABLE IF NOT EXISTS fleet_setting (
    name             VARCHAR(64)  PRIMARY KEY,                 -- tablet_app_version
    value            VARCHAR(255) NULL,
    updated_at       DATETIME     NOT NULL,
    updated_by       VARCHAR(64)  NULL
);
