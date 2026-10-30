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
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.MigrationInfoService;
import org.flywaydb.core.api.MigrationState;
import org.flywaydb.core.api.MigrationVersion;
import org.junit.jupiter.api.Test;

/**
 * @author Piramal Swasthya
 */
class SchemaVersionServiceTest {

	private static MigrationInfo migration(String version, MigrationState state) {
		MigrationInfo m = mock(MigrationInfo.class);
		when(m.getVersion()).thenReturn(MigrationVersion.fromVersion(version));
		when(m.getState()).thenReturn(state);
		when(m.getInstalledOn()).thenReturn(new Date(0));
		return m;
	}

	private static Flyway flyway(MigrationInfo current, MigrationInfo[] all, MigrationInfo[] pending) {
		Flyway f = mock(Flyway.class);
		MigrationInfoService info = mock(MigrationInfoService.class);
		when(f.info()).thenReturn(info);
		when(info.current()).thenReturn(current);
		when(info.all()).thenReturn(all);
		when(info.pending()).thenReturn(pending);
		return f;
	}

	@Test
	void reportsCurrentPendingAndFailed() {
		MigrationInfo v134 = migration("134", MigrationState.SUCCESS);
		MigrationInfo v135 = migration("135", MigrationState.SUCCESS);
		MigrationInfo v136 = migration("136", MigrationState.PENDING);
		SchemaVersionService.Schema s = SchemaVersionService.of(
				flyway(v135, new MigrationInfo[] { v134, v135, v136 }, new MigrationInfo[] { v136 }), "db_iemr");
		assertEquals("135", s.version());
		assertEquals(1, s.pending());
		assertFalse(s.failed());
		assertEquals("1970-01-01T00:00:00Z", s.installedOn());

		MigrationInfo bad = migration("33", MigrationState.FAILED);
		assertTrue(SchemaVersionService.of(flyway(bad, new MigrationInfo[] { bad }, new MigrationInfo[0]), "db_identity").failed());
	}

	@Test
	void emptySchemaAndUnreadableSchema() {
		SchemaVersionService.Schema empty = SchemaVersionService.of(flyway(null, new MigrationInfo[0], new MigrationInfo[0]), "db_reporting");
		assertNull(empty.version());
		assertNull(empty.error());

		Flyway broken = mock(Flyway.class);
		when(broken.info()).thenThrow(new IllegalStateException("Communications link failure"));
		SchemaVersionService.Schema s = SchemaVersionService.of(broken, "db_iemr");
		assertNull(s.version());
		assertEquals("could not read migration state", s.error());
	}

	@Test
	void onlyConfiguredSchemasInFixedOrder() {
		MigrationInfo v = migration("5", MigrationState.SUCCESS);
		Flyway f = flyway(v, new MigrationInfo[] { v }, new MigrationInfo[0]);
		Map<String, Flyway> beans = Map.of("flywayDb1097identity", f, "flywayDbiemr", f, "somethingElse", f);
		assertEquals(List.of("db_iemr", "db_1097_identity"), List.copyOf(new SchemaVersionService(beans).versions().keySet()));
	}
}
