package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class FlywayMigrator {
	@Autowired
	private Flyway flywaydbiemr;
	
	@Autowired
	private Flyway flywaydbidentity;
	
	@Autowired
	private Flyway flywaydbreporting;
	
	@Autowired
	private Flyway flywaydb1097identity;
	@PostConstruct
	public void migrate() {
		try {
			flywaydbiemr.migrate();
			flywaydbidentity.migrate();
			flywaydbreporting.migrate();
			flywaydb1097identity.migrate();
		}catch (Exception e) {
			throw new RuntimeException("Flyway Migration Failed ",e);
		}
	}
}

