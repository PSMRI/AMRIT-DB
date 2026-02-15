package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class FlywayMigrator {
	private Logger logger = LoggerFactory.getLogger(FlywayMigrator.class);
	private final Flyway flywaydbiemr;
    private final Flyway flywayDbidentity;
    private final Flyway flywayDbreporting;
    private final Flyway flywayDb1097identity;

    public FlywayMigrator(Flyway flywaydbiemr,
                          Flyway flywayDbidentity,
                          Flyway flywayDbreporting,
                          Flyway flywayDb1097identity) {
        this.flywaydbiemr = flywaydbiemr;
        this.flywayDbidentity = flywayDbidentity;
        this.flywayDbreporting = flywayDbreporting;
        this.flywayDb1097identity = flywayDb1097identity;
    }

    @PostConstruct
    public void migrate() {
        flywaydbiemr.migrate();
        flywayDbidentity.migrate();
        flywayDbreporting.migrate();
        flywayDb1097identity.migrate();
        logger.info("Flyway migration completed successfully");
        
    }
}

