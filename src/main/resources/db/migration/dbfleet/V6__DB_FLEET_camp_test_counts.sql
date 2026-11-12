-- Fleet V6: X-ray and TrueNat counts per laptop, from the heartbeat's tests block (console 1.4.7+).
--  * device_tests: when the laptop last counted, and its all-time totals per test.
--  * device_test_day: per local (camp) day and test, for the last 30 days the laptop reports.
-- Counted from the laptop's own db_iemr.tb_diagnostic_order (XRAY_CHEST = X-ray, MTB = TrueNat), so they
-- include orders not yet synced to central. No row = the console did not report test counts.
-- All DATETIME columns are UTC; day is the camp's local date.

USE db_fleet;

CREATE TABLE IF NOT EXISTS device_tests (
    device_id        CHAR(36)     PRIMARY KEY,
    checked_at       DATETIME     NULL,                        -- when the laptop counted
    totals           JSON         NULL,                        -- {xray:{ordered,done,failed}, truenat:{...}}
    error            VARCHAR(500) NULL,
    CONSTRAINT fk_tests_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS device_test_day (
    device_id        CHAR(36)     NOT NULL,
    day              DATE         NOT NULL,
    test             VARCHAR(16)  NOT NULL,                    -- xray | truenat
    ordered          INT          NOT NULL DEFAULT 0,          -- distinct beneficiary + visit
    done             INT          NOT NULL DEFAULT 0,          -- COMPLETED or MANUAL_ENTRY
    failed           INT          NOT NULL DEFAULT 0,          -- FAILED or CLOSED
    PRIMARY KEY (device_id, day, test),
    CONSTRAINT fk_testday_device FOREIGN KEY (device_id) REFERENCES device(device_id) ON DELETE CASCADE
);
