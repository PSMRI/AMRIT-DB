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

package com.db.piramalswasthya.anonymizer.safety;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.regex.Pattern;

/**
 * Production Safety Guard
 *
 * Prevents accidental execution against production databases.
 * Checks hostname/database name against deny patterns and allowlist.
 *
 * CRITICAL SAFETY LAYER - DO NOT BYPASS WITHOUT EXPLICIT APPROVAL FLAG
 */
public class SafetyGuard {

    private static final Logger log = LoggerFactory.getLogger(SafetyGuard.class);

    private final AnonymizerConfig.SafetyConfig config;

    // Built-in deny patterns (case-insensitive)
    private static final String[] BUILT_IN_DENY_PATTERNS = {
            ".*prod.*",
            ".*production.*",
            ".*prd.*",
            ".*live.*"
    };

    public SafetyGuard(AnonymizerConfig.SafetyConfig config) {
        this.config = config;
    }

    /**
     * Validates that it's safe to connect to the given database.
     *
     * @param host Database hostname
     * @param database Database name
     * @param approvalFlag Explicit approval flag (if required)
     * @throws SafetyViolationException if safety check fails
     */
    public void validateSafeToConnect(String host, String database, String approvalFlag)
            throws SafetyViolationException {

        if (!config.isEnabled()) {
            log.warn("SAFETY GUARD DISABLED - Proceeding without safety checks");
            return;
        }

        log.info("Running safety checks for {}:{}", host, database);

        boolean hostAllowlisted = enforceAllowlistIfConfigured(host);

        // Allowlist takes precedence over deny patterns.
        if (!hostAllowlisted) {
            checkBuiltInDenials(host, database, approvalFlag);
            checkCustomDenials(host, database);
        }

        enforceApprovalFlagIfRequired(approvalFlag);

        log.info("Safety checks passed for {}:{}", host, database);
    }

    /**
     * If an allowlist is configured, the host must match it. When a host is allowlisted,
     * deny pattern checks are skipped.
     */
    private boolean enforceAllowlistIfConfigured(String host) throws SafetyViolationException {
        if (config.getAllowedHosts() == null || config.getAllowedHosts().isEmpty()) {
            return false;
        }

        boolean inAllowlist = config.getAllowedHosts().stream()
                .anyMatch(allowed -> hostEqualsIgnoreCase(host, allowed) || hostMatchesWildcard(host, allowed));

        if (!inAllowlist) {
            throw new SafetyViolationException(
                    String.format("DENIED: Host '%s' not in allowlist %s", host, config.getAllowedHosts())
            );
        }

        return true;
    }

    private void checkBuiltInDenials(String host, String database, String approvalFlag)
            throws SafetyViolationException {

        for (String pattern : BUILT_IN_DENY_PATTERNS) {
            boolean patternMatches = matchesPattern(host, pattern) || matchesPattern(database, pattern);
            
            if (patternMatches && !canBypassBuiltInDenyWithApprovalFlag(approvalFlag)) {
                throw new SafetyViolationException(
                        String.format(
                                "DENIED: Host '%s' or database '%s' matches production pattern '%s'. " +
                                        "If this is intentional, add to allowlist and provide approval flag.",
                                host, database, pattern
                        )
                );
            }
            
            if (patternMatches) {
                log.warn(
                        "Built-in deny pattern '{}' matched but bypassed with approval flag for {}:{}",
                        pattern, host, database
                );
            }
        }
    }

    private void checkCustomDenials(String host, String database) throws SafetyViolationException {
        if (config.getDeniedPatterns() == null || config.getDeniedPatterns().isEmpty()) {
            return;
        }

        for (String pattern : config.getDeniedPatterns()) {
            if (matchesPattern(host, pattern) || matchesPattern(database, pattern)) {
                throw new SafetyViolationException(
                        String.format("DENIED: Matches custom deny pattern '%s'", pattern)
                );
            }
        }
    }

    private void enforceApprovalFlagIfRequired(String approvalFlag) throws SafetyViolationException {
        if (config.isRequireExplicitApproval() && !hasValidApprovalFlag(approvalFlag)) {
            throw new SafetyViolationException(
                    "DENIED: Explicit approval flag required but not provided or incorrect. " +
                            "Set in config.yaml:safety.approvalFlag and pass via --approval-flag"
            );
        }
    }

    private boolean canBypassBuiltInDenyWithApprovalFlag(String approvalFlag) {
        return config.isRequireExplicitApproval() && hasValidApprovalFlag(approvalFlag);
    }

    private boolean hasValidApprovalFlag(String approvalFlag) {
        return approvalFlag != null && approvalFlag.equals(config.getApprovalFlag());
    }

    private boolean hostEqualsIgnoreCase(String host, String allowed) {
        return host != null && allowed != null && host.equalsIgnoreCase(allowed);
    }

    private boolean hostMatchesWildcard(String host, String allowed) {
        if (host == null || allowed == null) {
            return false;
        }
        String regex = Pattern.quote(allowed).replace("\\*", ".*");
        return host.matches(regex);
    }

    private boolean matchesPattern(String value, String pattern) {
        if (value == null || pattern == null) {
            return false;
        }
        return Pattern.compile(pattern, Pattern.CASE_INSENSITIVE).matcher(value).matches();
    }

    public static class SafetyViolationException extends Exception {
        public SafetyViolationException(String message) {
            super(message);
        }
    }
}
