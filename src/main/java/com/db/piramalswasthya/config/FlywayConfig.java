package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FlywayConfig {
	 @Bean
	    public Flyway flywayDbiemr(@Qualifier("dbiemrDataSource") DataSource dataSource) {
	        return Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbiemr")
	                .baselineOnMigrate(true)
	                .load();
	    }

	    @Bean
	    public Flyway flywayDbidentity(@Qualifier("dbidentityDataSource") DataSource dataSource) {
	        return Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbidentity")
	                .baselineOnMigrate(true)
	                .load();
	    }

	    @Bean
	    public Flyway flywayDbreporting(@Qualifier("dbreportingDataSource") DataSource dataSource) {
	        return Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbreporting")
	                .baselineOnMigrate(true)
	                .load();
	    }

	    @Bean
	    public Flyway flywayDb1097identity(@Qualifier("db1097identityDataSource") DataSource dataSource) {
	        return Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/db1097identity")
	                .baselineOnMigrate(true)
	                .load();
	    }

}
