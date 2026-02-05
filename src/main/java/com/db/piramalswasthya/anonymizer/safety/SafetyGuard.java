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
        
        // Check allowlist first - if host is explicitly allowed, skip deny pattern checks
        boolean inAllowlist = false;
        if (config.getAllowedHosts() != null && !config.getAllowedHosts().isEmpty()) {
            inAllowlist = config.getAllowedHosts().stream()
                .anyMatch(allowed -> host.equalsIgnoreCase(allowed) || 
                                     host.matches(allowed.replace("*", ".*")));
            
            if (!inAllowlist) {
                throw new SafetyViolationException(
                    String.format("DENIED: Host '%s' not in allowlist %s", 
                        host, config.getAllowedHosts())
                );
            }
        }
        
        // Only check deny patterns if host is NOT in allowlist
        if (!inAllowlist) {
            // Check built-in deny patterns
            for (String pattern : BUILT_IN_DENY_PATTERNS) {
                if (matchesPattern(host, pattern) || matchesPattern(database, pattern)) {
                    throw new SafetyViolationException(
                        String.format("DENIED: Host '%s' or database '%s' matches production pattern '%s'. " +
                            "If this is intentional, add to allowlist and provide approval flag.",
                            host, database, pattern)
                    );
                }
            }
            
            // Check custom deny patterns
            if (config.getDeniedPatterns() != null) {
                for (String pattern : config.getDeniedPatterns()) {
                    if (matchesPattern(host, pattern) || matchesPattern(database, pattern)) {
                        throw new SafetyViolationException(
                            String.format("DENIED: Matches custom deny pattern '%s'", pattern)
                        );
                    }
                }
            }
        }
        
        // Check approval flag if required (applies to all connections)
        if (config.isRequireExplicitApproval()) {
            if (approvalFlag == null || !approvalFlag.equals(config.getApprovalFlag())) {
                throw new SafetyViolationException(
                    "DENIED: Explicit approval flag required but not provided or incorrect. " +
                    "Set in config.yaml:safety.approvalFlag and pass via --approval-flag"
                );
            }
        }
        
        log.info("Safety checks passed for {}:{}", host, database);
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
