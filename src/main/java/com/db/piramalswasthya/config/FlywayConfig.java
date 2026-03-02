package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.configuration.FluentConfiguration;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FlywayConfig {

	 @Bean
	    public Flyway flywayDbiemr(@Qualifier("dbiemrDataSource") DataSource dataSource) {
	        FluentConfiguration config = Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbiemr")
	                .baselineOnMigrate(true)
	                .initSql("SET FOREIGN_KEY_CHECKS=0");
	        return config.load();
	    }

	    @Bean
	    public Flyway flywayDbidentity(@Qualifier("dbidentityDataSource") DataSource dataSource) {
	        FluentConfiguration config = Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbidentity")
	                .baselineOnMigrate(true)
	                .initSql("SET FOREIGN_KEY_CHECKS=0");
	        return config.load();
	    }

	    @Bean
	    public Flyway flywayDbreporting(@Qualifier("dbreportingDataSource") DataSource dataSource) {
	        FluentConfiguration config = Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbreporting")
	                .baselineOnMigrate(true)
	                .initSql("SET FOREIGN_KEY_CHECKS=0");
	        return config.load();
	    }

	    @Bean
	    public Flyway flywayDb1097identity(@Qualifier("db1097identityDataSource") DataSource dataSource) {
	        FluentConfiguration config = Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/db1097identity")
	                .baselineOnMigrate(true)
	                .initSql("SET FOREIGN_KEY_CHECKS=0");
	        return config.load();
	    }

}
