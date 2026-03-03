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
        migrateSchema(flywayDbidentity, "db_identity");
        migrateSchema(flywayDb1097identity, "db_1097_identity");
        migrateSchema(flywayDbiemr, "db_iemr");
        migrateSchema(flywayDbreporting, "db_reporting");
        logger.info("Flyway migration completed successfully");
    }

    private void migrateSchema(Flyway flyway, String schemaName) {
        flyway.migrate();
        logger.info("Schema {} migrated successfully", schemaName);
    }
}
