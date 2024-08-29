package com.piramalswasthya.db.config;

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
	//@ConfigurationProperties(prefix = "spring.flyway.dbiemr")
    public Flyway flyway1(@Qualifier("datasource1") DataSource dataSource1) {
        return Flyway.configure()
                     .dataSource(dataSource1)
                     .locations("classpath:db/migration/dbiemr")
                     .load();
    }
	@Bean
	//@ConfigurationProperties(prefix = "spring.flyway.dbidentity")
    public Flyway flyway2(@Qualifier("datasource2") DataSource dataSource2) {
        return Flyway.configure()
                     .dataSource(dataSource2)
                     .locations("classpath:db/migration/dbidentity")
                     .load();
    }

	@Bean
	//@ConfigurationProperties(prefix = "spring.flyway.dbreporting")
	public Flyway flyway3(@Qualifier("datasource3") DataSource dataSource3) {
		return Flyway.configure().dataSource(dataSource3).locations("classpath:db/migration/dbreporing").load();
	}

	@Bean
	//@ConfigurationProperties(prefix = "spring.flyway.db1097identity")
    public Flyway flyway4(@Qualifier("datasource4") DataSource dataSource4) {
        return Flyway.configure()
                     .dataSource(dataSource4)
                     .locations("classpath:db/migration/db1097identity")
                     .load();
    }


}
