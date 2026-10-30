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
import org.flywaydb.core.api.MigrationInfoService;
import org.flywaydb.core.api.MigrationState;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Where each schema's migrations stand, as Flyway sees it: the last applied version, how many
 * bundled migrations are not applied yet, and whether any failed. Camp laptops report this to
 * Fleet so it can spot laptops whose databases are behind.
 *
 * @author Piramal Swasthya
 */
@Service
public class SchemaVersionService {

	private static final Logger log = LoggerFactory.getLogger(SchemaVersionService.class);

	/** Flyway bean name -> schema name, in report order. db_fleet exists only where configured. */
	static final Map<String, String> SCHEMAS = Map.of(
			"flywayDbiemr", "db_iemr",
			"flywayDbidentity", "db_identity",
			"flywayDbreporting", "db_reporting",
			"flywayDb1097identity", "db_1097_identity",
			"flywayDbfleet", "db_fleet");
	private static final List<String> ORDER = List.of("flywayDbiemr", "flywayDbidentity", "flywayDbreporting",
			"flywayDb1097identity", "flywayDbfleet");

	public record Schema(String version, int pending, boolean failed, String installedOn, String error) {}

	private final Map<String, Flyway> flyways;

	public SchemaVersionService(Map<String, Flyway> flyways) {
		this.flyways = flyways;
	}

	public Map<String, Schema> versions() {
		Map<String, Schema> out = new LinkedHashMap<>();
		for (String bean : ORDER) {
			Flyway f = flyways.get(bean);
			if (f != null) out.put(SCHEMAS.get(bean), of(f, SCHEMAS.get(bean)));
		}
		return out;
	}

	static Schema of(Flyway f, String name) {
		try {
			MigrationInfoService info = f.info();
			MigrationInfo current = info.current();
			boolean failed = false;
			for (MigrationInfo m : info.all()) {
				if (isFailed(m.getState())) failed = true;
			}
			int pending = info.pending() == null ? 0 : info.pending().length;
			return new Schema(current == null || current.getVersion() == null ? null : current.getVersion().getVersion(),
					pending, failed,
					current == null || current.getInstalledOn() == null ? null : current.getInstalledOn().toInstant().toString(),
					null);
		} catch (Exception e) {
			log.warn("could not read migration state of {}: {}", name, e.getMessage());
			return new Schema(null, 0, false, null, "could not read migration state");
		}
	}

	static boolean isFailed(MigrationState s) {
		return s != null && s.isFailed();
	}
}
