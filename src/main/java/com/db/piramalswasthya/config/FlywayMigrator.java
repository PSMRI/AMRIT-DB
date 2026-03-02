package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.exception.FlywayValidateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class FlywayMigrator {
	private Logger logger = LoggerFactory.getLogger(FlywayMigrator.class);
	private final Flyway flywayDbiemr;
    private final Flyway flywayDbidentity;
    private final Flyway flywayDbreporting;
    private final Flyway flywayDb1097identity;

    @Value("${amrit.flyway.ignore-applied-migration-checksum:false}")
    private boolean ignoreAppliedMigrationChecksum;

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
        migrateSchema(flywayDbidentity, "db_identity");
        migrateSchema(flywayDb1097identity, "db_1097_identity");
        migrateSchema(flywayDbiemr, "db_iemr");
        migrateSchema(flywayDbreporting, "db_reporting");
        System.out.println("SUCCESS");
        logger.info("Flyway migration completed successfully");
    }

    private void migrateSchema(Flyway flyway, String schemaName) {
        try {
            flyway.migrate();
        } catch (FlywayValidateException e) {
            if (ignoreAppliedMigrationChecksum) {
                logger.warn("Checksum mismatch detected for {}: {}. Repairing schema history...",
                        schemaName, e.getMessage());
                flyway.repair();
                flyway.migrate();
            } else {
                throw e;
            }
        }
    }
}
