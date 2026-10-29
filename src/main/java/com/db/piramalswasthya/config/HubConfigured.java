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
 * The same db.war runs on central, state servers and camp laptops. Some schema objects belong only
 * on a hub, the server that tablets talk to directly: every camp laptop, plus UAT central for
 * testing. They live in the *_hub migration folders and run only when the server says it is a hub:
 *
 *   AMRIT_HUB=true   (amrit.hub; anything else, or unset, means off)
 *
 * The first of these is the STOP-TB sync change log (t_sync_change_log and its triggers). A ci
 * build leaves an unresolved "@env.X@" token in place when the variable is missing; that is not
 * "true", so it also stays off.
 *
 * @author Piramal Swasthya
 */
public class HubConfigured implements Condition {

	static final String HUB_PROPERTY = "amrit.hub";

	@Override
	public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
		return isHub(context.getEnvironment().getProperty(HUB_PROPERTY));
	}

	static boolean isHub(String value) {
		return value != null && "true".equalsIgnoreCase(value.trim());
	}
}
