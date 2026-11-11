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

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * The applied Flyway version of each schema, as Flyway itself sees it (the last successful
 * migration, not simply the newest history row). Camp laptops send this to Fleet so it can spot
 * laptops whose databases are behind.
 *
 * @author Piramal Swasthya
 */
@Service
public class SchemaVersionService {

	private static final Logger log = LoggerFactory.getLogger(SchemaVersionService.class);

	/** Flyway bean name -> schema name. db_fleet exists only where configured. */
	static final Map<String, String> SCHEMAS = Map.of(
			"flywayDbiemr", "db_iemr",
			"flywayDbidentity", "db_identity",
			"flywayDbreporting", "db_reporting",
			"flywayDb1097identity", "db_1097_identity",
			"flywayDbfleet", "db_fleet");
	private static final List<String> ORDER = List.of("flywayDbiemr", "flywayDbidentity", "flywayDbreporting",
			"flywayDb1097identity", "flywayDbfleet");

	private final Map<String, Flyway> flyways;

	public SchemaVersionService(Map<String, Flyway> flyways) {
		this.flyways = flyways;
	}

	/** Schema -> applied version; null when nothing is applied or the schema can't be read. */
	public Map<String, String> versions() {
		Map<String, String> out = new LinkedHashMap<>();
		for (String bean : ORDER) {
			Flyway f = flyways.get(bean);
			if (f != null) out.put(SCHEMAS.get(bean), versionOf(f, SCHEMAS.get(bean)));
		}
		return out;
	}

	static String versionOf(Flyway f, String name) {
		try {
			MigrationInfo current = f.info().current();
			return current == null || current.getVersion() == null ? null : current.getVersion().getVersion();
		} catch (Exception e) {
			log.warn("could not read migration state of {}: {}", name, e.getMessage());
			return null;
		}
	}
}
