package com.piramalswasthya.db.config;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class FlywayMigrator {
	@Autowired
	private Flyway flyway1;
	
	@Autowired
	private Flyway flyway2;
	
	@Autowired
	private Flyway flyway3;
	
	@Autowired
	private Flyway flyway4;
	@PostConstruct
	public void migrate() {
		try {
		flyway1.migrate();
		flyway2.migrate();
		flyway3.migrate();
		flyway4.migrate();
		}catch (Exception e) {
			throw new RuntimeException("Flyway Migration Failed ",e);
		}
	}
}
