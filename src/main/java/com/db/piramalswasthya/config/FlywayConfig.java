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

    private Flyway createFlyway(DataSource dataSource, String location) {
        FluentConfiguration configuration = Flyway.configure()
                .dataSource(dataSource)
                .locations(location)
                .baselineOnMigrate(true);

        if (ignoreAppliedMigrationChecksum) {
            configuration.ignoreMigrationPatterns("*:applied");
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
