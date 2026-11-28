package com.db.piramalswasthya.config;

import java.util.Map;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FlywayConfig {
	 /**
	  * {@code ${isProduction}} in db_iemr migrations: "true" only when is.production (IS_PRODUCTION) is
	  * exactly true, otherwise "false". Used by V151 to skip its camp-only backfills on production.
	  * <p>
	  * {@code ${vanId}}: this camp's van ID from stoptb.van.id (STOPTB_VAN_ID), or "" when it is unset or
	  * not a number (e.g. an unresolved "@env.STOPTB_VAN_ID@" in a CI build). Used by V151 to fill vanID on
	  * diagnostic rows that have none; "" makes V151 skip that step.
	  */
	 @Bean
	    public Flyway flywayDbiemr(@Qualifier("dbiemrDataSource") DataSource dataSource,
	                               @Value("${is.production:false}") String isProduction,
	                               @Value("${stoptb.van.id:}") String vanId) {
	        boolean production = "true".equalsIgnoreCase(isProduction == null ? "" : isProduction.trim());
	        String van = vanId == null ? "" : vanId.trim();
	        if (!van.matches("[1-9][0-9]{0,9}")) van = "";
	        return Flyway.configure()
	                .dataSource(dataSource)
	                .locations("classpath:db/migration/dbiemr")
	                .baselineOnMigrate(true)
	                .placeholders(Map.of("isProduction", Boolean.toString(production), "vanId", van))
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
