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
import lombok.extern.slf4j.Slf4j;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Runtime safety enforcement for anonymization runs.
 *
 * <p>Hosts are compared by their resolved IP addresses, not raw strings, so
 * {@code localhost} and {@code 127.0.0.1} (or a DNS alias of the production
 * server) cannot be used to slip past the checks.</p>
 */
@Slf4j
public final class SafetyGuard {

    private SafetyGuard() {}

    /**
     * Enforce all configured safety checks. Throws {@link SafetyViolationException}
     * when a check fails.
     */
    public static void enforce(AnonymizerConfig config) {
        AnonymizerConfig.SafetyConfig safety = config.getSafety();
        if (safety == null || !safety.isEnabled()) {
            log.warn("Safety checks are DISABLED (safety.enabled=false) - " +
                "host allowlist will not be enforced");
            validateSourceTargetDistinct(config);
            return;
        }

        enforceAllowlist(config.getSource(), "source", safety.getAllowedHosts());
        enforceAllowlist(config.getTarget(), "target", safety.getAllowedHosts());
        validateSourceTargetDistinct(config);
    }

    private static void enforceAllowlist(AnonymizerConfig.DatabaseConfig db, String role,
                                         List<String> allowedHosts) {
        if (db == null || db.getHost() == null || db.getHost().isBlank()) {
            return; // connection validation happens elsewhere
        }
        if (allowedHosts == null || allowedHosts.isEmpty()) {
            throw new SafetyViolationException(
                "Safety is enabled but anonymizer.safety.allowedHosts is empty. " +
                "List every host this tool may touch, or set safety.enabled=false explicitly.");
        }

        String host = db.getHost();
        for (String allowed : allowedHosts) {
            if (hostsEquivalent(host, allowed)) {
                log.info("Safety: {} host {} matches allowlist entry {}", role, host, allowed);
                return;
            }
        }
        throw new SafetyViolationException(String.format(
            "%s host '%s' is not in the allowed hosts list %s - refusing to run",
            role, host, allowedHosts));
    }

    /**
     * Prevent accidental overwrite: source and target must not be the same
     * server (by resolved IP + port) with overlapping schema names.
     */
    static void validateSourceTargetDistinct(AnonymizerConfig config) {
        if (config == null) return;
        AnonymizerConfig.DatabaseConfig src = config.getSource();
        AnonymizerConfig.DatabaseConfig tgt = config.getTarget();
        if (src == null || tgt == null) return;
        if (src.getHost() == null || tgt.getHost() == null) return;

        boolean sameServer = src.getPort() == tgt.getPort()
            && hostsEquivalent(src.getHost(), tgt.getHost());
        if (!sameServer) {
            return;
        }

        List<String> sourceSchemas = src.getSchemas() == null ? Collections.emptyList() : src.getSchemas();
        List<String> targetSchemas = tgt.getSchemas() == null ? Collections.emptyList() : tgt.getSchemas();
        for (String s : sourceSchemas) {
            for (String t : targetSchemas) {
                if (s != null && s.equalsIgnoreCase(t)) {
                    throw new SafetyViolationException(String.format(
                        "Source and target resolve to the same server (%s:%d) and share schema '%s'. " +
                        "Refusing to run: the target reset would destroy the source data.",
                        src.getHost(), src.getPort(), s));
                }
            }
        }
    }

    /**
     * Compare two hosts by resolved IP addresses so aliases of the same machine
     * are treated as equal. Falls back to case-insensitive string comparison
     * when resolution fails.
     */
    static boolean hostsEquivalent(String a, String b) {
        if (a == null || b == null) return false;
        if (a.trim().equalsIgnoreCase(b.trim())) return true;

        Set<String> ipsA = resolve(a);
        Set<String> ipsB = resolve(b);
        if (ipsA.isEmpty() || ipsB.isEmpty()) {
            return false; // resolution failed; string comparison above already said "different"
        }
        Set<String> intersection = new HashSet<>(ipsA);
        intersection.retainAll(ipsB);
        return !intersection.isEmpty();
    }

    private static Set<String> resolve(String host) {
        try {
            Set<String> ips = new HashSet<>();
            for (InetAddress addr : InetAddress.getAllByName(host.trim())) {
                ips.add(addr.getHostAddress().toLowerCase(Locale.ROOT));
            }
            return ips;
        } catch (UnknownHostException e) {
            log.warn("Could not resolve host '{}' for safety comparison", host);
            return Collections.emptySet();
        }
    }

    /**
     * Thrown when a safety check refuses the run.
     */
    public static class SafetyViolationException extends RuntimeException {
        public SafetyViolationException(String message) {
            super(message);
        }
    }
}
