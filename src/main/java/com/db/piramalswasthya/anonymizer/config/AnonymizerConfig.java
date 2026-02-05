package com.db.piramalswasthya.anonymizer.config;

import lombok.Data;
import java.util.List;

/**
 * Configuration for anonymization tool (loaded from config.yaml)
 * 
 * Defines database connections, safety settings, performance tuning, and output options.
 */
@Data
public class AnonymizerConfig {
    
    private DatabaseConfig source;
    private DatabaseConfig target;
    private SafetyConfig safety;
    private PerformanceConfig performance;
    private OutputConfig output;
    private String rulesFile = "rules.yaml";
    private String loggingPath = "./logs";
    
    @Data
    public static class DatabaseConfig {
        private String host;
        private int port = 3306;
        private String database;
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
        private int threadPoolSize = 4;
    }
    
    @Data
    public static class OutputConfig {
        private OutputMode mode = OutputMode.SQL_DUMP;
        private String path;
        private boolean compress = true;
        private boolean includeSchema = false;
    }
    
    public enum OutputMode {
        SQL_DUMP,
        DIRECT_RESTORE
    }
}
