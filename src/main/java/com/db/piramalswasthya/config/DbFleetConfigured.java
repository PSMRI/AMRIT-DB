package com.db.piramalswasthya.config;

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * True only when a real db_fleet URL is configured. db_fleet belongs to the camp-laptop Fleet-API
 * and exists only on the STOP-TB central server, but this same db.war also runs on every state
 * server and on every camp laptop, so it must never be created there.
 *
 * Plain @ConditionalOnProperty is not enough: it treats an empty value as "set", and a ci build
 * leaves an unresolved Maven token (e.g. "@env.DATABASE_FLEET_URL@") in place when the variable
 * is missing, which would point Flyway at a garbage URL and stop db.war from starting.
 */
public class DbFleetConfigured implements Condition {

	static final String URL_PROPERTY = "spring.datasource.dbfleet.jdbc-url";

	@Override
	public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
		return isRealUrl(context.getEnvironment().getProperty(URL_PROPERTY));
	}

	static boolean isRealUrl(String url) {
		if (url == null) return false;
		String u = url.trim();
		if (u.isEmpty()) return false;
		if (u.startsWith("@") || u.contains("${")) return false; // unresolved build/env placeholder
		return u.startsWith("jdbc:");
	}
}
