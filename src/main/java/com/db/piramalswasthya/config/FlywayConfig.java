package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.configuration.FluentConfiguration;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FlywayConfig {

    @Value("${amrit.flyway.ignore-applied-migration-checksum:false}")
    private boolean ignoreAppliedMigrationChecksum;

    /**
     * Helper method to create a Flyway instance with centralized configuration.
     * Updated to use valid ignoreMigrationPatterns status.
     */
    private Flyway createFlyway(DataSource dataSource, String location) {
        FluentConfiguration configuration = Flyway.configure()
                .dataSource(dataSource)
                .locations(location)
                .baselineOnMigrate(true);

        if (ignoreAppliedMigrationChecksum) {
            // Updated from "*:applied" to "*:Ignored" to fix invalid pattern syntax
            // This allows the app to start even if checksums for applied migrations have changed locally
            configuration.ignoreMigrationPatterns("*:Ignored");
        }

        return configuration.load();
    }

    @Bean
    public Flyway flywayDbiemr(@Qualifier("dbiemrDataSource") DataSource dataSource) {
        return createFlyway(dataSource, "classpath:db/migration/dbiemr");
    }

    @Bean
    public Flyway flywayDbidentity(@Qualifier("dbidentityDataSource") DataSource dataSource) {
        return createFlyway(dataSource, "classpath:db/migration/dbidentity");
    }

    @Bean
    public Flyway flywayDbreporting(@Qualifier("dbreportingDataSource") DataSource dataSource) {
        return createFlyway(dataSource, "classpath:db/migration/dbreporting");
    }

    @Bean
    public Flyway flywayDb1097identity(@Qualifier("db1097identityDataSource") DataSource dataSource) {
        return createFlyway(dataSource, "classpath:db/migration/db1097identity");
    }
}
