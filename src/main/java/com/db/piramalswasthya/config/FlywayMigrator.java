package com.db.piramalswasthya.config;

import org.flywaydb.core.Flyway;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

import jakarta.annotation.PostConstruct;
import java.util.Map;

@Component
@Slf4j
@ConditionalOnProperty(name = "spring.flyway.enabled", havingValue = "true", matchIfMissing = true)
public class FlywayMigrator {
    private final Map<String, Flyway> flyways;

    public FlywayMigrator(Map<String, Flyway> flyways) {
        this.flyways = flyways;
    }

    @PostConstruct
    public void migrate() {
        if (flyways == null || flyways.isEmpty()) {
            log.info("No Flyway beans found; skipping migrations");
            return;
        }

        flyways.entrySet().stream()
                .sorted((e1, e2) -> String.valueOf(e1.getKey()).compareTo(String.valueOf(e2.getKey())))
                .forEach(entry -> {
                    String name = entry.getKey();
                    Flyway flyway = entry.getValue();
                    try {
                        log.info("Starting Flyway migration for bean '{}'.", name);
                        flyway.migrate();
                        log.info("Completed Flyway migration for bean '{}'.", name);
                    } catch (Exception ex) {
                        log.error("Flyway migration failed for bean '{}'. Continuing with others.", name, ex);
                    }
                });

        log.info("Processed all Flyway migrations");
    }
}
