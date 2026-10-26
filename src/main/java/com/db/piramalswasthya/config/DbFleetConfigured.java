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

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * db_fleet belongs to the camp-laptop Fleet-API and exists only on the STOP-TB central server,
 * but this same db.war also runs on every state server and on every camp laptop, where that
 * database does not exist. So db_fleet is touched ONLY when the server opts in explicitly:
 *
 *   FLEET_ENABLED=true            (amrit.fleet.enabled; anything else, or unset, means off)
 *   DATABASE_FLEET_URL=jdbc:...   (spring.datasource.dbfleet.jdbc-url; must be a real jdbc: URL)
 *
 * When either is missing no dbfleet datasource or Flyway bean is created at all, so db.war never
 * even tries to connect to db_fleet. A ci build leaves an unresolved "@env.X@" token in place when
 * the variable is missing; that is neither "true" nor a jdbc: URL, so it also stays off.
 *
 * @author Piramal Swasthya
 */
public class DbFleetConfigured implements Condition {

	static final String ENABLED_PROPERTY = "amrit.fleet.enabled";
	static final String URL_PROPERTY = "spring.datasource.dbfleet.jdbc-url";

	@Override
	public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
		return isEnabled(context.getEnvironment().getProperty(ENABLED_PROPERTY))
				&& isRealUrl(context.getEnvironment().getProperty(URL_PROPERTY));
	}

	static boolean isEnabled(String value) {
		return value != null && "true".equalsIgnoreCase(value.trim());
	}

	static boolean isRealUrl(String url) {
		if (url == null) return false;
		String u = url.trim();
		if (u.isEmpty()) return false;
		if (u.startsWith("@") || u.contains("${")) return false; // unresolved build/env placeholder
		return u.startsWith("jdbc:");
	}
}
