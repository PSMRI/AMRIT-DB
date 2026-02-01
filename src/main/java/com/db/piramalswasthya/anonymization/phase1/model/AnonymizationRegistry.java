package com.db.piramalswasthya.anonymization.phase1.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The Anonymization Registry - primary Phase 1 deliverable.
 * Metadata-only registry for schema drift protection and fail-closed enforcement.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AnonymizationRegistry {
    private String version;
    private Instant lastUpdated;
    private String schemaVersion; // Flyway version
    private String toolVersion;
    
    @Builder.Default
    private Map<String, DatabaseRegistry> databases = new HashMap<>();
    
    @Builder.Default
    private Map<String, String> piiRiskLevels = new HashMap<>();
    
    private String piiRiskThreshold; // e.g., "MEDIUM"
    
    @Builder.Default
    private List<String> trackedFlywayMigrations = new ArrayList<>();
    
    private String lastValidatedMigration;
    
    /**
     * Registry data for a single database.
     */
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class DatabaseRegistry {
        private String schemaHash;
        
        @Builder.Default
        private Map<String, TableRegistry> tables = new HashMap<>();
    }
    
    /**
     * Registry data for a single table.
     */
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class TableRegistry {
        private String canonicalName;
        
        @Builder.Default
        private List<String> aliases = new ArrayList<>();
        
        @Builder.Default
        private Map<String, ColumnRegistry> columns = new HashMap<>();
    }
    
    /**
     * Registry data for a single column.
     */
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ColumnRegistry {
        private String canonicalName;
        private String dataType;
        private Boolean nullable;
        private String piiRisk; // CRITICAL, HIGH, MEDIUM, LINKING_KEY, LOW
        private String anonymizationRule; // Rule ID like FAKE_NAME, BENREGID_MAPPING
        
        @Builder.Default
        private List<String> aliases = new ArrayList<>();
        
        private String addedInMigration;
        private String renamedFrom;
    }
}
