package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.db.piramalswasthya.controller.VersionController;

import jakarta.annotation.PostConstruct;

@Component
public class FlywayMigrator {
	private Logger logger = LoggerFactory.getLogger(FlywayMigrator.class);
	private final Flyway flywayDbiemr;
    private final Flyway flywayDbidentity;
    private final Flyway flywayDbreporting;
    private final Flyway flywayDb1097identity;
    /** Only present where db_fleet is configured (STOP-TB central); see DbFleetConfigured. */
    private final Flyway flywayDbfleet;
    /** Only present on hubs (camp laptops, UAT central); see HubConfigured. */
    private final Flyway flywayDbiemrHub;
    private final Flyway flywayDbidentityHub;

    public FlywayMigrator(Flyway flywayDbiemr,
                          Flyway flywayDbidentity,
                          Flyway flywayDbreporting,
                          Flyway flywayDb1097identity,
                          @Qualifier("flywayDbfleet") ObjectProvider<Flyway> flywayDbfleet,
                          @Qualifier("flywayDbiemrHub") ObjectProvider<Flyway> flywayDbiemrHub,
                          @Qualifier("flywayDbidentityHub") ObjectProvider<Flyway> flywayDbidentityHub) {
        this.flywayDbiemr = flywayDbiemr;
        this.flywayDbidentity = flywayDbidentity;
        this.flywayDbreporting = flywayDbreporting;
        this.flywayDb1097identity = flywayDb1097identity;
        this.flywayDbfleet = flywayDbfleet.getIfAvailable();
        this.flywayDbiemrHub = flywayDbiemrHub.getIfAvailable();
        this.flywayDbidentityHub = flywayDbidentityHub.getIfAvailable();
    }

    @PostConstruct
    public void migrate() {
        flywayDbiemr.repair();
        flywayDbidentity.repair();
        flywayDbreporting.repair();
        flywayDb1097identity.repair();

        flywayDbiemr.migrate();
        flywayDbidentity.migrate();
        flywayDbreporting.migrate();
        flywayDb1097identity.migrate();
        if (flywayDbfleet != null) {
            flywayDbfleet.repair();
            flywayDbfleet.migrate();
            logger.info("db_fleet migrated");
        }
        // Hub-only objects (sync change log triggers) sit on top of the main schema, so they run last.
        if (flywayDbiemrHub != null && flywayDbidentityHub != null) {
            flywayDbiemrHub.repair();
            flywayDbidentityHub.repair();
            flywayDbiemrHub.migrate();
            flywayDbidentityHub.migrate();
            logger.info("Hub migrations applied (AMRIT_HUB=true)");
        }
        System.out.println("SUCCESS");
        logger.info("Flyway migration completed successfully");
        
    }
}

