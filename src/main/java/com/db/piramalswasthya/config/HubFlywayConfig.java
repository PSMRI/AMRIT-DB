/*
* AMRIT – Accessible Medical Records via Integrated Technologies 
* Integrated EHR (Electronic Health Records) Solution 
*
* Copyright (C) "Piramal Swasthya Management and Research Institute" 
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/
package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;

/**
 * Hub-only migrations for db_iemr and db_identity, see {@link HubConfigured}. They use the same
 * datasources as the main migrations but keep their own history table, so central's history and
 * version numbers are never touched and a hub can be switched on at any time.
 *
 * @author Piramal Swasthya
 */
@Configuration
@Conditional(HubConfigured.class)
public class HubFlywayConfig {

	static final String HISTORY_TABLE = "flyway_schema_history_hub";

	@Bean
	public Flyway flywayDbiemrHub(@Qualifier("dbiemrDataSource") DataSource dataSource) {
		return hubFlyway(dataSource, "classpath:db/migration/dbiemr_hub");
	}

	@Bean
	public Flyway flywayDbidentityHub(@Qualifier("dbidentityDataSource") DataSource dataSource) {
		return hubFlyway(dataSource, "classpath:db/migration/dbidentity_hub");
	}

	private static Flyway hubFlyway(DataSource dataSource, String location) {
		return Flyway.configure()
				.dataSource(dataSource)
				.locations(location)
				.table(HISTORY_TABLE)
				// The schema already holds the main migrations; start this history at version 0.
				.baselineOnMigrate(true)
				.baselineVersion("0")
				.load();
	}
}
