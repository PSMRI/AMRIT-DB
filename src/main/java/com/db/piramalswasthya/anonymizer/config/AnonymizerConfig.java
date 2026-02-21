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
        private boolean verifyServerCertificate = true;
    }
    
    @Data
    public static class SafetyConfig {
        private boolean enabled = true; // Secure default - safety checks enabled
        private List<String> allowedHosts;
        private List<String> deniedPatterns;
        private boolean requireExplicitApproval;
        private String approvalFlag;
    }
    
    @Data
    public static class PerformanceConfig {
        private int batchSize = 1000;
        private int fetchSize = 1000;
        private int maxMemoryMb = 512;
    }

}
