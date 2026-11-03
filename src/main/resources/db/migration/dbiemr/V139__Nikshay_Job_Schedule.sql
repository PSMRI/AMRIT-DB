USE db_iemr;

CREATE TABLE IF NOT EXISTS nikshay_job_schedule (
    id INT NOT NULL PRIMARY KEY COMMENT 'Always 1: one row for the whole job',
    enabled TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 = on, 0 = off',
    cron_expression VARCHAR(100) NULL COMMENT 'Spring cron: second minute hour day month weekday, e.g. 0 0 2 * * *',
    updated_by VARCHAR(50) NULL COMMENT 'Username of the last change',
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT IGNORE INTO nikshay_job_schedule (id, enabled, cron_expression, updated_by)
VALUES (1, 0, NULL, 'system');
