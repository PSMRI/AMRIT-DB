package com.db.piramalswasthya.anonymizer.config;

import lombok.Data;
import java.util.List;

/**
 * Configuration for anonymization tool (loaded from config.yaml)
 * 
 * Defines database connections, safety settings, and performance tuning.
 * Supports multiple schemas on single MySQL instance.
 */
@Data
public class AnonymizerConfig {
    
    private DatabaseConfig source;
    private DatabaseConfig target;
    private SafetyConfig safety;
    private PerformanceConfig performance;
    private String rulesFile = "rules.yaml";
    private String loggingPath = "./logs";
    
    @Data
    public static class DatabaseConfig {
        private String host;
        private int port = 3306;
        private List<String> schemas;  // List of schemas to process
        private String username;
        private String password;
        private boolean readOnly = true;
        private int connectionTimeout = 30000;
    }
    
    @Data
    public static class SafetyConfig {
        private boolean enabled = true;
        private List<String> allowedHosts;
        private List<String> deniedPatterns;
        private boolean requireExplicitApproval = true;
        private String approvalFlag;
    }
    
    @Data
    public static class PerformanceConfig {
        private int batchSize = 1000;
        private int fetchSize = 1000;
        private int maxMemoryMb = 512;
    }
}
