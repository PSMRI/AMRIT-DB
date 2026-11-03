/*
* AMRIT – Accessible Medical Records via Integrated Technology
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

package com.db.piramalswasthya.anonymizer.core;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SafetyGuardTest {

    private static AnonymizerConfig config(String srcHost, int srcPort, List<String> srcSchemas,
                                           String tgtHost, int tgtPort, List<String> tgtSchemas,
                                           boolean safetyEnabled, List<String> allowedHosts) {
        AnonymizerConfig cfg = new AnonymizerConfig();
        AnonymizerConfig.DatabaseConfig src = new AnonymizerConfig.DatabaseConfig();
        src.setHost(srcHost);
        src.setPort(srcPort);
        src.setSchemas(srcSchemas);
        AnonymizerConfig.DatabaseConfig tgt = new AnonymizerConfig.DatabaseConfig();
        tgt.setHost(tgtHost);
        tgt.setPort(tgtPort);
        tgt.setSchemas(tgtSchemas);
        AnonymizerConfig.SafetyConfig safety = new AnonymizerConfig.SafetyConfig();
        safety.setEnabled(safetyEnabled);
        safety.setAllowedHosts(allowedHosts);
        cfg.setSource(src);
        cfg.setTarget(tgt);
        cfg.setSafety(safety);
        return cfg;
    }

    @Test
    void refusesHostNotOnAllowlist() {
        AnonymizerConfig cfg = config(
            "prod-master.example.internal", 3306, List.of("db_identity"),
            "127.0.0.1", 3311, List.of("db_identity"),
            true, List.of("127.0.0.1"));
        assertThrows(SafetyGuard.SafetyViolationException.class, () -> SafetyGuard.enforce(cfg));
    }

    @Test
    void refusesEmptyAllowlistWhenSafetyEnabled() {
        AnonymizerConfig cfg = config(
            "127.0.0.1", 3310, List.of("db_identity"),
            "127.0.0.1", 3311, List.of("db_identity"),
            true, null);
        assertThrows(SafetyGuard.SafetyViolationException.class, () -> SafetyGuard.enforce(cfg));
    }

    @Test
    void allowsDifferentPortsOnSameAllowedHost() {
        AnonymizerConfig cfg = config(
            "127.0.0.1", 3310, List.of("db_identity"),
            "127.0.0.1", 3311, List.of("db_identity"),
            true, List.of("127.0.0.1"));
        assertDoesNotThrow(() -> SafetyGuard.enforce(cfg));
    }

    @Test
    void refusesLocalhostAliasOfSameServerWithSharedSchema() {
        // localhost and 127.0.0.1 resolve to the same machine: a string compare
        // would pass this, the resolved-IP compare must not.
        AnonymizerConfig cfg = config(
            "localhost", 3310, List.of("db_identity"),
            "127.0.0.1", 3310, List.of("db_identity"),
            true, List.of("localhost", "127.0.0.1"));
        assertThrows(SafetyGuard.SafetyViolationException.class, () -> SafetyGuard.enforce(cfg));
    }

    @Test
    void hostsEquivalentResolvesAliases() {
        assertTrue(SafetyGuard.hostsEquivalent("localhost", "127.0.0.1"));
        assertTrue(SafetyGuard.hostsEquivalent("LOCALHOST", "localhost"));
    }
}
