package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
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
        if (ignoreAppliedMigrationChecksum) {
            logger.info("Repairing Flyway schema history (realigning checksums and removing failed entries)");
            flywayDbidentity.repair();
            flywayDb1097identity.repair();
            flywayDbiemr.repair();
            flywayDbreporting.repair();
        }
        flywayDbidentity.migrate();
        flywayDb1097identity.migrate();
        flywayDbiemr.migrate();
        flywayDbreporting.migrate();
        System.out.println("SUCCESS");
        logger.info("Flyway migration completed successfully");
    }
}

