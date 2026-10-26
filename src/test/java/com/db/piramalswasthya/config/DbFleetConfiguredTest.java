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

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.AutoConfigurations;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;

/**
 * db_fleet must stay off unless FLEET_ENABLED=true and FLEET_DATABASE_URL is a real jdbc: URL.
 *
 * @author Piramal Swasthya
 */
class DbFleetConfiguredTest {

	private static final String URL = "jdbc:mysql://localhost:3306/db_fleet?createDatabaseIfNotExist=true";

	@Test
	void onlyTheLiteralTrueEnables() {
		assertTrue(DbFleetConfigured.isEnabled("true"));
		assertTrue(DbFleetConfigured.isEnabled(" TRUE "));
		assertFalse(DbFleetConfigured.isEnabled(null));
		assertFalse(DbFleetConfigured.isEnabled(""));
		assertFalse(DbFleetConfigured.isEnabled("false"));
		assertFalse(DbFleetConfigured.isEnabled("yes"));
		assertFalse(DbFleetConfigured.isEnabled("@env.FLEET_ENABLED@"));   // ci build, variable missing
	}

	@Test
	void onlyARealJdbcUrlCounts() {
		assertTrue(DbFleetConfigured.isRealUrl(URL));
		assertFalse(DbFleetConfigured.isRealUrl(null));
		assertFalse(DbFleetConfigured.isRealUrl("   "));
		assertFalse(DbFleetConfigured.isRealUrl("@env.FLEET_DATABASE_URL@"));
		assertFalse(DbFleetConfigured.isRealUrl("${FLEET_DATABASE_URL}"));
		assertFalse(DbFleetConfigured.isRealUrl("<Enter DB_FLEET URL here>"));
	}

	/** The beans themselves: absent unless BOTH settings are given (no DB connection is attempted). */
	@Test
	void dbFleetBeansExistOnlyWhenEnabledAndConfigured() {
		ApplicationContextRunner runner = new ApplicationContextRunner()
				.withConfiguration(AutoConfigurations.of())
				.withUserConfiguration(DbFleetConfig.class);
		runner.run(ctx -> assertFalse(ctx.containsBean("flywayDbfleet")));
		runner.withPropertyValues("spring.datasource.dbfleet.jdbc-url=" + URL)
				.run(ctx -> assertFalse(ctx.containsBean("flywayDbfleet")));                 // URL but not enabled
		runner.withPropertyValues("amrit.fleet.enabled=true")
				.run(ctx -> assertFalse(ctx.containsBean("flywayDbfleet")));                 // enabled but no URL
		runner.withPropertyValues("amrit.fleet.enabled=false", "spring.datasource.dbfleet.jdbc-url=" + URL)
				.run(ctx -> assertFalse(ctx.containsBean("flywayDbfleet")));
		runner.withPropertyValues("amrit.fleet.enabled=true", "spring.datasource.dbfleet.jdbc-url=" + URL)
				.run(ctx -> assertTrue(ctx.containsBean("dbfleetDataSource") && ctx.containsBean("flywayDbfleet")));
	}
}
