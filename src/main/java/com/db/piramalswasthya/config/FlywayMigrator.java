package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class FlywayMigrator {
	private Logger logger = LoggerFactory.getLogger(FlywayMigrator.class);
	private final Flyway flywayDbiemr;
    private final Flyway flywayDbidentity;
    private final Flyway flywayDbreporting;
    private final Flyway flywayDb1097identity;

    public FlywayMigrator(Flyway flywayDbiemr,
                          Flyway flywayDbidentity,
                          Flyway flywayDbreporting,
                          Flyway flywayDb1097identity) {
        this.flywayDbiemr = flywayDbiemr;
        this.flywayDbidentity = flywayDbidentity;
        this.flywayDbreporting = flywayDbreporting;
        this.flywayDb1097identity = flywayDb1097identity;
    }

    @PostConstruct
    public void migrate() {
        try {
            migrateDatabase(flywayDbiemr, "db_iemr");
            migrateDatabase(flywayDbidentity, "db_identity");
            migrateDatabase(flywayDbreporting, "db_reporting");
            migrateDatabase(flywayDb1097identity, "db_1097_identity");
            System.out.println("SUCCESS");
            logger.info("Flyway migration completed successfully");
        } catch (Exception e) {
            logger.error("Error during migration: " + e.getMessage(), e);
            throw e;
        }
    }
    
    private void migrateDatabase(Flyway flyway, String dbName) {
        try {
            logger.info("Starting migration for database: " + dbName);
            flyway.migrate();
            logger.info("Successfully migrated database: " + dbName);
        } catch (org.flywaydb.core.api.exception.FlywayValidateException e) {
            logger.warn("Validation error for " + dbName + ": " + e.getMessage() + ". Attempting repair...");
            try {
                flyway.repair();
                logger.info("Repair completed for " + dbName + ". Retrying migration...");
                flyway.migrate();
                logger.info("Successfully migrated database after repair: " + dbName);
            } catch (Exception repairException) {
                logger.error("Failed to repair and migrate " + dbName + ": " + repairException.getMessage(), repairException);
                throw repairException;
            }
        }
    }
}

