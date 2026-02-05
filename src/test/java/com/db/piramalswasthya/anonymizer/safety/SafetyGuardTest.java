package com.db.piramalswasthya.anonymizer.safety;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.db.piramalswasthya.anonymizer.safety.SafetyGuard.SafetyViolationException;
import org.junit.jupiter.api.Test;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for SafetyGuard
 */
class SafetyGuardTest {
    
    @Test
    void testValidConnection_Allowed() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(true);
        config.setAllowedHosts(List.of("replica.nonprod.internal"));
        config.setRequireExplicitApproval(false);
        
        SafetyGuard guard = new SafetyGuard(config);
        
        // Should not throw exception
        assertDoesNotThrow(() -> 
            guard.validateSafeToConnect("replica.nonprod.internal", "db_uat", null)
        );
    }
    
    @Test
    void testDenyPattern_Production() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(true);
        config.setAllowedHosts(List.of("db-prod.example.com"));
        
        SafetyGuard guard = new SafetyGuard(config);
        
        // Should throw exception for production pattern
        assertThrows(SafetyViolationException.class, () ->
            guard.validateSafeToConnect("db-prod.example.com", "db_identity", null)
        );
    }
    
    @Test
    void testDenyPattern_Live() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(true);
        
        SafetyGuard guard = new SafetyGuard(config);
        
        assertThrows(SafetyViolationException.class, () ->
            guard.validateSafeToConnect("db-live.example.com", "db_identity", null)
        );
    }
    
    @Test
    void testAllowlist_NotInList() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(true);
        config.setAllowedHosts(List.of("allowed-host.com"));
        
        SafetyGuard guard = new SafetyGuard(config);
        
        assertThrows(SafetyViolationException.class, () ->
            guard.validateSafeToConnect("other-host.com", "db_uat", null)
        );
    }
    
    @Test
    void testApprovalFlag_Required() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(true);
        config.setAllowedHosts(List.of("replica.nonprod.internal"));
        config.setRequireExplicitApproval(true);
        config.setApprovalFlag("CONFIRM_2026_FEB");
        
        SafetyGuard guard = new SafetyGuard(config);
        
        // Missing approval flag
        assertThrows(SafetyViolationException.class, () ->
            guard.validateSafeToConnect("replica.nonprod.internal", "db_uat", null)
        );
        
        // Wrong approval flag
        assertThrows(SafetyViolationException.class, () ->
            guard.validateSafeToConnect("replica.nonprod.internal", "db_uat", "WRONG_FLAG")
        );
        
        // Correct approval flag
        assertDoesNotThrow(() ->
            guard.validateSafeToConnect("replica.nonprod.internal", "db_uat", "CONFIRM_2026_FEB")
        );
    }
    
    @Test
    void testDisabled_AllowsEverything() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(false);
        
        SafetyGuard guard = new SafetyGuard(config);
        
        // Should allow even production-like names when disabled
        assertDoesNotThrow(() ->
            guard.validateSafeToConnect("production-db.com", "live_database", null)
        );
    }
    
    @Test
    void testCustomDenyPattern() {
        AnonymizerConfig.SafetyConfig config = new AnonymizerConfig.SafetyConfig();
        config.setEnabled(true);
        config.setDeniedPatterns(List.of(".*restricted.*"));
        
        SafetyGuard guard = new SafetyGuard(config);
        
        assertThrows(SafetyViolationException.class, () ->
            guard.validateSafeToConnect("restricted-server.com", "db_uat", null)
        );
    }
}
