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
package com.db.piramalswasthya.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.Map;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.MigrationInfoService;
import org.flywaydb.core.api.MigrationVersion;
import org.junit.jupiter.api.Test;

/**
 * @author Piramal Swasthya
 */
class SchemaVersionServiceTest {

	private static Flyway flyway(String currentVersion) {
		Flyway f = mock(Flyway.class);
		MigrationInfoService info = mock(MigrationInfoService.class);
		when(f.info()).thenReturn(info);
		if (currentVersion != null) {
			MigrationInfo m = mock(MigrationInfo.class);
			when(m.getVersion()).thenReturn(MigrationVersion.fromVersion(currentVersion));
			when(info.current()).thenReturn(m);
		}
		return f;
	}

	@Test
	void appliedVersionPerSchema() {
		assertEquals("135", SchemaVersionService.versionOf(flyway("135"), "db_iemr"));
		assertNull(SchemaVersionService.versionOf(flyway(null), "db_reporting"));   // nothing applied

		Flyway broken = mock(Flyway.class);
		when(broken.info()).thenThrow(new IllegalStateException("Communications link failure"));
		assertNull(SchemaVersionService.versionOf(broken, "db_iemr"));
	}

	@Test
	void onlyConfiguredSchemasInFixedOrder() {
		Map<String, Flyway> beans = Map.of("flywayDb1097identity", flyway("5"), "flywayDbiemr", flyway("135"), "somethingElse", flyway("1"));
		Map<String, String> v = new SchemaVersionService(beans).versions();
		assertEquals(List.of("db_iemr", "db_1097_identity"), List.copyOf(v.keySet()));
		assertEquals("135", v.get("db_iemr"));
	}
}
