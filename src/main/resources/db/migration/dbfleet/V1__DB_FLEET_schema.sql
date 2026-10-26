-- db_fleet V1: camp-laptop fleet (Fleet-API). Devices, heartbeats, update events, published
-- configuration and audit for the STOP-TB camp laptops.
--
-- Opt-in: this folder is migrated ONLY where spring.datasource.dbfleet.jdbc-url is set (the
-- STOP-TB central server). State servers and camp laptops run the same db.war and skip it.
-- Camps themselves are NOT stored here: Fleet-API reads db_iemr.m_van / m_state /
-- m_parkingplace live. All DATETIME columns are UTC.
-- Spec: PSMRI plans/amrit-fleet-service-design.md, Part 1.

-- A physical laptop. A van has at most one ACTIVE device (enforced by the generated column).
CREATE TABLE device (
    device_id        CHAR(36)     PRIMARY KEY,                 -- UUID, issued by the server
    machine_id       VARCHAR(64)  NOT NULL UNIQUE,             -- /etc/machine-id (laptops installed individually)
    van_id           INT          NOT NULL,
    hostname         VARCHAR(100) NULL,
    van_key_found    VARCHAR(32)  NULL,                        -- STOPTB_VAN_ID | STOP_VAN_ID
    status           ENUM('active','replaced','retired') NOT NULL DEFAULT 'active',
    token_hash       CHAR(64)     NULL UNIQUE,                 -- sha256(token); NULL once revoked
    agent_version    VARCHAR(48)  NULL,                        -- from the heartbeat (pom.xml version, e.g. 1.4.0)
    last_ip          VARCHAR(45)  NULL,
    enrolled_at      DATETIME     NOT NULL,
    last_seen_at     DATETIME     NULL,
    replaced_by      CHAR(36)     NULL,
    ended_at         DATETIME     NULL,                        -- replaced/retired at
    ended_by         VARCHAR(64)  NULL,                        -- admin username or 'enrolment'
    active_van_id    INT GENERATED ALWAYS AS (IF(status = 'active', van_id, NULL)) STORED,
    UNIQUE KEY ux_one_active_device_per_van (active_van_id),   -- NULLs don't collide
    INDEX ix_device_seen (status, last_seen_at)
);

-- A laptop asked to enrol for a van that already has a LIVE active laptop (seen in the last
-- 14 days). Nothing is replaced and no token is issued until an admin decides (§2.9).
CREATE TABLE enrolment_conflict (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    van_id           INT          NOT NULL,
    machine_id       VARCHAR(64)  NOT NULL,                    -- the newcomer
    hostname         VARCHAR(100) NULL,
    agent_version    VARCHAR(48)  NULL,
    ip               VARCHAR(45)  NULL,
    existing_device  CHAR(36)     NOT NULL,                    -- the active laptop it would replace
    first_at         DATETIME     NOT NULL,
    last_at          DATETIME     NOT NULL,                    -- the newcomer retries; one open row per (van, machine)
    attempts         INT          NOT NULL DEFAULT 1,
    status           ENUM('open','approved','rejected') NOT NULL DEFAULT 'open',
    resolved_by      VARCHAR(64)  NULL,
    resolved_at      DATETIME     NULL,
    open_key         VARCHAR(100) GENERATED ALWAYS AS
                         (IF(status = 'open', CONCAT(van_id, ':', machine_id), NULL)) STORED,
    UNIQUE KEY ux_conf_open (open_key),                        -- one OPEN conflict per (van, machine);
                                                               -- resolved rows may repeat
    INDEX ix_conf_status (status, last_at)
);

-- Latest heartbeat, flattened for list/dashboard queries. One row per device, overwritten.
CREATE TABLE device_snapshot (
    device_id        CHAR(36)     PRIMARY KEY,
    received_at      DATETIME     NOT NULL,
    hb_trigger       VARCHAR(24)  NOT NULL,                    -- interval|startup|update|...
    services_up      SMALLINT     NOT NULL,                    -- UP or DEGRADED
    services_total   SMALLINT     NOT NULL,
    disk_free_mb     INT          NULL,
    uptime_sec       BIGINT       NULL,
    ips              VARCHAR(255) NULL,                        -- comma-separated
    payload          JSON         NOT NULL,                    -- full heartbeat, for the detail page
    payload_hash     CHAR(64)     NOT NULL,                    -- sha256 of the payload minus volatile fields
                                                               -- (uptime, disk, timestamps); drives history
    CONSTRAINT fk_snap_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Deployed artifacts per device, from installed.json. Replaced wholesale on each heartbeat.
-- artifact_key is the name both sides agree on: the war file name (flw-api.war), the UI web
-- folder (mmu: installed.json keys UIs by folder), or the deb file name (tbmja-enrollment.deb).
CREATE TABLE device_artifact (
    device_id        CHAR(36)     NOT NULL,
    artifact         VARCHAR(128) NOT NULL,                    -- artifact_key
    kind             ENUM('war','ui','app') NOT NULL,
    version          VARCHAR(64)  NULL,
    etag             VARCHAR(128) NULL,
    deployed_at      DATETIME     NULL,
    PRIMARY KEY (device_id, artifact),
    INDEX ix_artifact (artifact, etag),
    CONSTRAINT fk_art_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Per-service state per device. Replaced wholesale on each heartbeat.
CREATE TABLE device_service (
    device_id        CHAR(36)     NOT NULL,
    unit             VARCHAR(64)  NOT NULL,                    -- amrit-flw-api, mysql, nginx ...
    active_state     VARCHAR(16)  NOT NULL,                    -- active|failed|inactive
    health           VARCHAR(16)  NULL,                        -- UP|DEGRADED|DOWN|UNKNOWN
    version          VARCHAR(64)  NULL,
    PRIMARY KEY (device_id, unit),
    CONSTRAINT fk_svc_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Phase 2 baseline: each laptop's current .env values, reported once via POST /v1/env-report
-- (and again on request). Non-secret values in clear; secret values ONLY as a hash, so the
-- report can say "same as the majority" without the secret ever leaving the laptop.
CREATE TABLE device_env_value (
    device_id        CHAR(36)     NOT NULL,
    key_name         VARCHAR(128) NOT NULL,
    value_text       TEXT         NULL,                        -- NULL when is_secret
    value_hash       CHAR(64)     NOT NULL,                    -- sha256(value)
    is_secret        BOOLEAN      NOT NULL,                    -- decided on the laptop by key-name pattern
    reported_at      DATETIME     NOT NULL,
    PRIMARY KEY (device_id, key_name),
    INDEX ix_env_key (key_name, value_hash),
    CONSTRAINT fk_env_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

-- Heartbeat history. A row is written only when payload_hash differs from the previous one or
-- the trigger is not 'interval' (startup, update, config-apply ...). Routine "nothing changed"
-- heartbeats just update device_snapshot + last_seen_at. Pruned nightly to 90 days.
-- Size: ~180 × a few changes/day × 90 days ≈ 50–100k rows (~0.5 GB), instead of 1.5M rows /
-- 5–15 GB if every 15-minute heartbeat were kept.
CREATE TABLE heartbeat (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    device_id        CHAR(36)     NOT NULL,
    received_at      DATETIME     NOT NULL,
    hb_trigger       VARCHAR(24)  NOT NULL,
    payload          JSON         NOT NULL,
    INDEX ix_hb_device_time (device_id, received_at)
);

-- Update / redeploy / self-update / config-apply outcomes. Idempotent on (device, run_id),
-- because an offline laptop replays its outbox and may resend the same run.
CREATE TABLE device_event (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    device_id        CHAR(36)     NOT NULL,
    run_id           VARCHAR(64)  NOT NULL,
    kind             ENUM('update','redeploy','self_update','config_apply') NOT NULL,
    result           VARCHAR(32)  NOT NULL,                    -- SUCCESS|NOOP|FAILED|FAILED_BACKUP|ROLLED_BACK_OK|ROLLED_BACK_FAILED
    message          VARCHAR(1000) NULL,
    started_at       DATETIME     NULL,
    finished_at      DATETIME     NOT NULL,
    received_at      DATETIME     NOT NULL,
    UNIQUE KEY ux_event_run (device_id, run_id),
    INDEX ix_event_time (finished_at)
);

-- What the builds server currently publishes, one row per artifact_key. Refreshed every
-- 10 min (see "Release versions" below).
CREATE TABLE artifact_release (
    artifact         VARCHAR(128) PRIMARY KEY,                 -- artifact_key: flw-api.war | mmu | tbmja-enrollment.deb
    file_name        VARCHAR(160) NOT NULL,                    -- what is on the builds server: mmu-3.7.0.zip
    kind             ENUM('war','ui','app') NOT NULL,
    version          VARCHAR(64)  NULL,                        -- see below; NULL = unknown
    etag             VARCHAR(128) NULL,
    size_bytes       BIGINT       NULL,
    published_at     DATETIME     NULL,                        -- Last-Modified
    checked_at       DATETIME     NOT NULL,
    tracked          BOOLEAN      NOT NULL DEFAULT TRUE        -- include in "lagging" computation
);

-- The catalogue of variables. A key exists here before it can have values.
CREATE TABLE config_key (
    key_name         VARCHAR(128) PRIMARY KEY,                 -- [A-Za-z_][A-Za-z0-9_]*
    target           ENUM('env','agent_env') NOT NULL DEFAULT 'env',
    category         VARCHAR(64)  NULL,                        -- "Central URLs", "eSanjeevani" ... (grouping in UI)
    description      VARCHAR(500) NULL,
    is_secret        BOOLEAN      NOT NULL DEFAULT FALSE,
    overridable      BOOLEAN      NOT NULL DEFAULT TRUE,       -- false = global value only
    managed          BOOLEAN      NOT NULL DEFAULT TRUE,       -- true: central value written to the laptop,
                                                               --       read-only in the Console
                                                               -- false: never sent, laptop keeps its own
    restart_scope    ENUM('all_apis','agent','none') NOT NULL DEFAULT 'all_apis',
    validation_regex VARCHAR(255) NULL,
    created_at       DATETIME     NOT NULL,
    updated_at       DATETIME     NOT NULL
);

-- The WORKING COPY that admins edit. Laptops never read this directly: they get the last
-- published revision. scope_ref = 0 for global, state_id for state, van_id for van.
CREATE TABLE config_value (
    scope            ENUM('global','state','van') NOT NULL,
    scope_ref        INT          NOT NULL DEFAULT 0,
    key_name         VARCHAR(128) NOT NULL,
    value_text       TEXT         NULL,                        -- non-secret values
    value_enc        VARBINARY(4096) NULL,                     -- secrets: AES-256-GCM(iv || ciphertext || tag)
    value_hash       CHAR(64)     NOT NULL,                    -- HMAC-SHA256(key, value) with a separate key;
                                                               -- lets "unpublished changes" and diffs compare
                                                               -- secrets without decrypting (random IVs)
    updated_by       VARCHAR(64)  NOT NULL,
    updated_at       DATETIME     NOT NULL,
    PRIMARY KEY (scope, scope_ref, key_name),
    CONSTRAINT fk_val_key FOREIGN KEY (key_name) REFERENCES config_key(key_name) ON UPDATE CASCADE,
    CONSTRAINT ck_one_value CHECK ((value_text IS NULL) <> (value_enc IS NULL))
);

-- Immutable published snapshots. Publishing copies config_key + config_value as they are now.
CREATE TABLE config_revision (
    revision_id      INT          AUTO_INCREMENT PRIMARY KEY,
    published_by     VARCHAR(64)  NOT NULL,
    published_at     DATETIME     NOT NULL,
    note             VARCHAR(500) NOT NULL,
    snapshot         JSON         NOT NULL,                    -- {keys:[...], values:[...]}; secrets stay encrypted
    keys_changed     INT          NOT NULL,
    vans_affected    INT          NOT NULL,
    restored_from    INT          NULL                         -- set when this is a rollback re-publish
);

-- What each van SHOULD have as of the latest revision. Recomputed for every van at publish
-- time, and by the 10-minute m_van refresh when a van's placeholder source (parking place,
-- PSM id ...) changed in AMRIT.
CREATE TABLE van_effective_config (
    van_id           INT          PRIMARY KEY,
    revision_id      INT          NOT NULL,
    etag             CHAR(64)     NOT NULL,                    -- sha256(sorted KEY=value lines actually served)
    key_count        INT          NOT NULL,
    warnings         JSON         NULL,                        -- keys skipped for this van, e.g.
                                                               -- [{"key":"PARKING_PLACE_ID","why":"${van.parking_place_id} is empty"}]
    computed_at      DATETIME     NOT NULL
);

-- What each laptop HAS: last config served, last applied, and drift.
CREATE TABLE device_config (
    device_id          CHAR(36)   PRIMARY KEY,
    served_etag        CHAR(64)   NULL,
    served_revision    INT        NULL,
    served_at          DATETIME   NULL,
    applied_etag       CHAR(64)   NULL,                        -- reported by heartbeat
    applied_revision   INT        NULL,
    applied_at         DATETIME   NULL,
    drifted            BOOLEAN    NOT NULL DEFAULT FALSE,      -- local managed values ≠ applied revision
    last_apply_result  VARCHAR(32) NULL,
    last_apply_at      DATETIME   NULL,
    CONSTRAINT fk_dc_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

CREATE TABLE audit_log (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    at               DATETIME     NOT NULL,
    actor            VARCHAR(80)  NOT NULL,                    -- AMRIT user name (SuperAdmin) | device:<uuid> | system
    action           VARCHAR(48)  NOT NULL,                    -- config_edit, config_publish, config_rollback,
                                                               -- device_enrol, device_replaced, device_retire,
                                                               -- enrol_refused, enrol_conflict,
                                                               -- enrol_conflict_approved, enrol_conflict_rejected
    target_type      VARCHAR(24)  NULL,                        -- van|device|config_key|revision
    target_id        VARCHAR(64)  NULL,
    detail           JSON         NULL,                        -- before/after; secrets as "•••• (changed)"
    ip               VARCHAR(45)  NULL,
    INDEX ix_audit_at (at),
    INDEX ix_audit_target (target_type, target_id)
);
