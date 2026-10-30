-- db_fleet V3: problems per camp, as Fleet-API last worked them out (laptop offline, apps or
-- databases behind, tablets on old or mixed app versions, failed migrations ...). One OPEN row per
-- (camp, code, subject); a row is resolved when the problem goes away and reopened if it comes back
-- soon after. Admins can acknowledge ("someone is on it") or snooze an issue. All DATETIME columns are UTC.

USE db_fleet;

CREATE TABLE IF NOT EXISTS camp_issue (
    id               BIGINT       AUTO_INCREMENT PRIMARY KEY,
    van_id           INT          NOT NULL,
    device_id        CHAR(36)     NULL,                        -- laptop at the time it opened
    code             VARCHAR(48)  NOT NULL,                    -- LAPTOP_OFFLINE, TABLETS_MIXED ...
    subject          VARCHAR(128) NOT NULL DEFAULT '',         -- e.g. a tablet id; '' for camp-wide issues
    severity         ENUM('critical','warning','info') NOT NULL,
    source           ENUM('rule','job') NOT NULL DEFAULT 'rule',  -- 'job': raised by a future camp operation
    title            VARCHAR(255) NOT NULL,
    detail           JSON         NULL,
    first_seen_at    DATETIME     NOT NULL,
    last_seen_at     DATETIME     NOT NULL,
    occurrences      INT          NOT NULL DEFAULT 1,          -- times it reopened
    resolved_at      DATETIME     NULL,
    acked_at         DATETIME     NULL,
    acked_by         VARCHAR(64)  NULL,
    ack_note         VARCHAR(500) NULL,
    snoozed_until    DATETIME     NULL,
    snoozed_by       VARCHAR(64)  NULL,
    open_key         VARCHAR(200) GENERATED ALWAYS AS
                         (IF(resolved_at IS NULL, CONCAT(van_id, ':', code, ':', subject), NULL)) STORED,
    UNIQUE KEY ux_issue_open (open_key),                       -- NULLs don't collide
    INDEX ix_issue_van (van_id, resolved_at),
    INDEX ix_issue_open (resolved_at, severity, code)
);
