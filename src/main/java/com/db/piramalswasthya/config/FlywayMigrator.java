package com.db.piramalswasthya.config;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

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

    public FlywayMigrator(Flyway flywayDbiemr,
                          Flyway flywayDbidentity,
                          Flyway flywayDbreporting,
                          Flyway flywayDb1097identity,
                          @Qualifier("flywayDbfleet") ObjectProvider<Flyway> flywayDbfleet) {
        this.flywayDbiemr = flywayDbiemr;
        this.flywayDbidentity = flywayDbidentity;
        this.flywayDbreporting = flywayDbreporting;
        this.flywayDb1097identity = flywayDb1097identity;
        this.flywayDbfleet = flywayDbfleet.getIfAvailable();
    }

    @PostConstruct
    public void migrate() {
        renameReportingV5ToV4();

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
        System.out.println("SUCCESS");
        logger.info("Flyway migration completed successfully");

    }

    /**
     * db_reporting's 1097 division-by-zero fix shipped as V5 (#145, 24 Aug 2026) and was renamed
     * to V4 a week later (#156) with identical content. Databases migrated in between have it
     * recorded as V5, so Flyway now fails validation with "Detected resolved migration not
     * applied to database: 4" and db.war never starts. The script content (and so its checksum)
     * is unchanged, so relabelling the history row is all that's needed. No-op everywhere else.
     */
    void renameReportingV5ToV4() {
        DataSource dataSource = flywayDbreporting.getConfiguration().getDataSource();
        String table = flywayDbreporting.getConfiguration().getTable();
        // The derived table lets MySQL read the table it is updating; it skips the rename if a V4
        // row already exists, so re-runs never create a duplicate version.
        String sql = "UPDATE " + table
                + " SET version = '4', script = 'V4__fix_1097_report_division_by_zero.sql'"
                + " WHERE version = '5' AND script = 'V5__fix_1097_report_division_by_zero.sql'"
                + " AND NOT EXISTS (SELECT 1 FROM (SELECT version FROM " + table
                + " WHERE version = '4') AS existing_v4)";
        try (Connection connection = dataSource.getConnection();
             Statement statement = connection.createStatement()) {
            int renamed = statement.executeUpdate(sql);
            if (renamed > 0) {
                logger.info("db_reporting: relabelled applied migration V5__fix_1097_report_division_by_zero as V4");
            }
        } catch (SQLException e) {
            // Fresh database (no history table yet) or no privilege: let Flyway report anything real.
            logger.debug("db_reporting V5->V4 relabel skipped: {}", e.getMessage());
        }
    }
}

