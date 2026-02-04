package com.db.piramalswasthya.anonymization.model;

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
    
    public String getVersion() {
        return version;
    }
    
    public void setVersion(String version) {
        this.version = version;
    }
    
    public Instant getLastUpdated() {
        return lastUpdated;
    }
    
    public void setLastUpdated(Instant lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
    
    public String getSchemaVersion() {
        return schemaVersion;
    }
    
    public void setSchemaVersion(String schemaVersion) {
        this.schemaVersion = schemaVersion;
    }
    
    public String getToolVersion() {
        return toolVersion;
    }
    
    public void setToolVersion(String toolVersion) {
        this.toolVersion = toolVersion;
    }
    
    public Map<String, DatabaseRegistry> getDatabases() {
        return databases;
    }
    
    public void setDatabases(Map<String, DatabaseRegistry> databases) {
        this.databases = databases;
    }
    
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
        
        public String getSchemaHash() {
            return schemaHash;
        }
        
        public void setSchemaHash(String schemaHash) {
            this.schemaHash = schemaHash;
        }
        
        public Map<String, TableRegistry> getTables() {
            return tables;
        }
        
        public void setTables(Map<String, TableRegistry> tables) {
            this.tables = tables;
        }
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
        
        public String getCanonicalName() {
            return canonicalName;
        }
        
        public void setCanonicalName(String canonicalName) {
            this.canonicalName = canonicalName;
        }
        
        public List<String> getAliases() {
            return aliases;
        }
        
        public void setAliases(List<String> aliases) {
            this.aliases = aliases;
        }
        
        public Map<String, ColumnRegistry> getColumns() {
            return columns;
        }
        
        public void setColumns(Map<String, ColumnRegistry> columns) {
            this.columns = columns;
        }
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
        
        public String getCanonicalName() {
            return canonicalName;
        }
        
        public void setCanonicalName(String canonicalName) {
            this.canonicalName = canonicalName;
        }
        
        public String getDataType() {
            return dataType;
        }
        
        public void setDataType(String dataType) {
            this.dataType = dataType;
        }
        
        public Boolean getNullable() {
            return nullable;
        }
        
        public void setNullable(Boolean nullable) {
            this.nullable = nullable;
        }
        
        public String getPiiRisk() {
            return piiRisk;
        }
        
        public void setPiiRisk(String piiRisk) {
            this.piiRisk = piiRisk;
        }
        
        public String getAnonymizationRule() {
            return anonymizationRule;
        }
        
        public void setAnonymizationRule(String anonymizationRule) {
            this.anonymizationRule = anonymizationRule;
        }
        
        public List<String> getAliases() {
            return aliases;
        }
        
        public void setAliases(List<String> aliases) {
            this.aliases = aliases;
        }
        
        public String getAddedInMigration() {
            return addedInMigration;
        }
        
        public void setAddedInMigration(String addedInMigration) {
            this.addedInMigration = addedInMigration;
        }
        
        public String getRenamedFrom() {
            return renamedFrom;
        }
        
        public void setRenamedFrom(String renamedFrom) {
            this.renamedFrom = renamedFrom;
        }
    }
}
