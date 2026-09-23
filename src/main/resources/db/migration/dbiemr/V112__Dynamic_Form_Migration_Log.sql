-- ==========================================================
-- Tracks applied FormStructureMigrations so that
-- DynamicFormMigrationRunner can skip ones already run.
-- One row per migration, keyed by its stable migrationId.
-- ==========================================================

USE db_iemr;

CREATE TABLE IF NOT EXISTS t_dynamic_form_migration_log (
    migrationId VARCHAR(50) NOT NULL,
    appliedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (migrationId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
