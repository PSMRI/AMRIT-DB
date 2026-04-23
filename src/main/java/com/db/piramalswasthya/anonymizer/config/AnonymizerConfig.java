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
    public static final String DEFAULT_LOGGING_PATH = "./logs";

    private String rulesFile = "anonymization-registry.yml";
    private String loggingPath = DEFAULT_LOGGING_PATH;
    private java.util.Map<String,String> schemaMap;
    
    @Data
    public static class DatabaseConfig {
        public DatabaseConfig() {}

        private String host;
        private int port = 3306;
        private List<String> schemas;  // List of schemas to process
        private String username;
        private String password;
        private boolean readOnly = true;
        private int connectionTimeout = 30000;
        private boolean verifyServerCertificate = true;
        
        public java.util.List<String> getSchemas() {
            return schemas == null ? null : java.util.List.copyOf(schemas);
        }

        // Defensive setter for schemas to avoid storing callers' mutable lists
        public void setSchemas(java.util.List<String> schemas) {
            this.schemas = schemas == null ? null : new java.util.ArrayList<>(schemas);
        }

        // Copy constructor for defensive copying
        public DatabaseConfig(DatabaseConfig other) {
            if (other == null) return;
            this.host = other.host;
            this.port = other.port;
            this.username = other.username;
            this.password = other.password;
            this.readOnly = other.readOnly;
            this.connectionTimeout = other.connectionTimeout;
            this.verifyServerCertificate = other.verifyServerCertificate;
            this.schemas = other.schemas == null ? null : new java.util.ArrayList<>(other.schemas);
        }
    }
    
    @Data
    public static class SafetyConfig {
        // No-arg constructor for property binding
        public SafetyConfig() {}

        private boolean enabled = true; // Secure default - safety checks enabled
        private List<String> allowedHosts;
        private List<String> deniedPatterns;
        private boolean requireExplicitApproval;
        private String approvalFlag;
        
        public java.util.List<String> getAllowedHosts() {
            return allowedHosts == null ? null : java.util.List.copyOf(allowedHosts);
        }
        
        public java.util.List<String> getDeniedPatterns() {
            return deniedPatterns == null ? null : java.util.List.copyOf(deniedPatterns);
        }
        
        // Copy constructor for defensive copying
        public SafetyConfig(SafetyConfig other) {
            if (other == null) return;
            this.enabled = other.enabled;
            this.requireExplicitApproval = other.requireExplicitApproval;
            this.approvalFlag = other.approvalFlag;
            this.allowedHosts = other.allowedHosts == null ? null : new java.util.ArrayList<>(other.allowedHosts);
            this.deniedPatterns = other.deniedPatterns == null ? null : new java.util.ArrayList<>(other.deniedPatterns);
        }

        // Defensive setters to avoid exposing internal mutable lists
        public void setAllowedHosts(java.util.List<String> allowedHosts) {
            this.allowedHosts = allowedHosts == null ? null : new java.util.ArrayList<>(allowedHosts);
        }

        public void setDeniedPatterns(java.util.List<String> deniedPatterns) {
            this.deniedPatterns = deniedPatterns == null ? null : new java.util.ArrayList<>(deniedPatterns);
        }
    }
    
    @Data
    public static class PerformanceConfig {
        // No-arg constructor for property binding
        public PerformanceConfig() {}

        private int batchSize = 1000;
        private int fetchSize = 1000;
        private int maxMemoryMb = 512;
        
        // Copy constructor
        public PerformanceConfig(PerformanceConfig other) {
            if (other == null) return;
            this.batchSize = other.batchSize;
            this.fetchSize = other.fetchSize;
            this.maxMemoryMb = other.maxMemoryMb;
        }
    }
    
    public java.util.Map<String,String> getSchemaMap() {
        return schemaMap == null ? null : java.util.Map.copyOf(schemaMap);
    }

    /**
     * Store a defensive copy of schemaMap to avoid exposing internal representation
     */
    public void setSchemaMap(java.util.Map<String,String> schemaMap) {
        this.schemaMap = schemaMap == null ? null : new java.util.HashMap<>(schemaMap);
    }

    // Defensive getters/setters for mutable object fields
    public DatabaseConfig getSource() {
        return source == null ? null : new DatabaseConfig(source);
    }

    public void setSource(DatabaseConfig source) {
        this.source = source == null ? null : new DatabaseConfig(source);
    }

    public DatabaseConfig getTarget() {
        return target == null ? null : new DatabaseConfig(target);
    }

    public void setTarget(DatabaseConfig target) {
        this.target = target == null ? null : new DatabaseConfig(target);
    }

    public SafetyConfig getSafety() {
        return safety == null ? null : new SafetyConfig(safety);
    }

    public void setSafety(SafetyConfig safety) {
        this.safety = safety == null ? null : new SafetyConfig(safety);
    }

    public PerformanceConfig getPerformance() {
        return performance == null ? null : new PerformanceConfig(performance);
    }

    public void setPerformance(PerformanceConfig performance) {
        this.performance = performance == null ? null : new PerformanceConfig(performance);
    }

}
