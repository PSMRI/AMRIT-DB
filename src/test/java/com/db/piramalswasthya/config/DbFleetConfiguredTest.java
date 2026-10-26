package com.db.piramalswasthya.config;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

class DbFleetConfiguredTest {

	@Test
	void realJdbcUrlEnablesDbFleet() {
		assertTrue(DbFleetConfigured.isRealUrl("jdbc:mysql://localhost:3306/db_fleet?createDatabaseIfNotExist=true"));
	}

	@Test
	void anythingElseKeepsDbFleetOff() {
		assertFalse(DbFleetConfigured.isRealUrl(null));
		assertFalse(DbFleetConfigured.isRealUrl(""));
		assertFalse(DbFleetConfigured.isRealUrl("   "));
		assertFalse(DbFleetConfigured.isRealUrl("@env.DATABASE_FLEET_URL@"));   // ci build, variable missing
		assertFalse(DbFleetConfigured.isRealUrl("${DATABASE_FLEET_URL}"));      // unresolved placeholder
		assertFalse(DbFleetConfigured.isRealUrl("<Enter DB_FLEET URL here>"));
	}
}
