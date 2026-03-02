package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FlywayConfig {

	private Flyway createFlyway(DataSource dataSource, String location) {
		return Flyway.configure()
				.dataSource(dataSource)
				.locations(location)
				.baselineOnMigrate(true)
				.load();
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
