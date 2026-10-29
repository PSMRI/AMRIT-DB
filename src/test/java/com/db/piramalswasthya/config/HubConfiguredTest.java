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

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;

/**
 * Hub-only migrations must stay off unless AMRIT_HUB=true.
 *
 * @author Piramal Swasthya
 */
class HubConfiguredTest {

	@Test
	void onlyTheLiteralTrueMeansHub() {
		assertTrue(HubConfigured.isHub("true"));
		assertTrue(HubConfigured.isHub(" TRUE "));
		assertFalse(HubConfigured.isHub(null));
		assertFalse(HubConfigured.isHub(""));
		assertFalse(HubConfigured.isHub("false"));
		assertFalse(HubConfigured.isHub("1"));
		assertFalse(HubConfigured.isHub("@env.AMRIT_HUB@"));   // ci build, variable missing
	}

	/** The beans themselves: absent unless amrit.hub=true (Flyway.load() does not connect). */
	@Test
	void hubFlywayBeansExistOnlyOnHubs() {
		ApplicationContextRunner runner = new ApplicationContextRunner()
				.withBean("dbiemrDataSource", DataSource.class, () -> Mockito.mock(DataSource.class))
				.withBean("dbidentityDataSource", DataSource.class, () -> Mockito.mock(DataSource.class))
				.withUserConfiguration(HubFlywayConfig.class);
		runner.run(ctx -> assertFalse(ctx.containsBean("flywayDbiemrHub")));
		runner.withPropertyValues("amrit.hub=false")
				.run(ctx -> assertFalse(ctx.containsBean("flywayDbiemrHub")));
		runner.withPropertyValues("amrit.hub=@env.AMRIT_HUB@")
				.run(ctx -> assertFalse(ctx.containsBean("flywayDbidentityHub")));
		runner.withPropertyValues("amrit.hub=true")
				.run(ctx -> assertTrue(ctx.containsBean("flywayDbiemrHub") && ctx.containsBean("flywayDbidentityHub")));
	}
}
