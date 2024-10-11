package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
public class FlywayConfig {
	@Bean
    public Flyway flywaydbiemr(@Qualifier("datasourcedbiemr") DataSource dbiemr) {
        return Flyway.configure()
                     .dataSource(dbiemr)
                     .locations("classpath:db/migration/dbiemr")
                     .load();
    }
	@Bean
    public Flyway flywaydbidentity(@Qualifier("datasourcedbidentity") DataSource dbidentity) {
        return Flyway.configure()
                     .dataSource(dbidentity)
                     .locations("classpath:db/migration/dbidentity")
                     .load();
    }

	@Bean
	public Flyway flywaydbreporting(@Qualifier("datasourcedbreporting") DataSource dbreporting) {
		return Flyway.configure().dataSource(dbreporting).locations("classpath:db/migration/dbreporting").load();
	}

	@Bean
    public Flyway flywaydb1097identity(@Qualifier("datasourcedb1097identity") DataSource db1097identity) {
        return Flyway.configure()
                     .dataSource(db1097identity)
                     .locations("classpath:db/migration/db1097identity")
                     .load();
    }

}
