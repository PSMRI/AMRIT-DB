package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;

/**
 * db_fleet: the camp-laptop fleet schema used by Fleet-API. Opt-in per server, see
 * {@link DbFleetConfigured}; without spring.datasource.dbfleet.jdbc-url none of these beans exist
 * and db.war behaves exactly as before.
 */
@Configuration
@Conditional(DbFleetConfigured.class)
public class DbFleetConfig {

	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbfleet")
	public DataSource dbfleetDataSource() {
		return DataSourceBuilder.create().build();
	}

	@Bean
	public Flyway flywayDbfleet(@Qualifier("dbfleetDataSource") DataSource dataSource) {
		return Flyway.configure()
				.dataSource(dataSource)
				.locations("classpath:db/migration/dbfleet")
				.baselineOnMigrate(true)
				// db_fleet stores ${van.*} config templates and documents them in comments;
				// Flyway must not treat those as its own placeholders.
				.placeholderReplacement(false)
				.load();
	}
}
