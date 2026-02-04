package com.db.piramalswasthya.anonymization.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

/**
 * Complete catalog of all analyzed database schemas.
 * Primary Phase 1 artifact: schema-catalog.json
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SchemaCatalog {
    private String version;
    private Instant generatedAt;
    private String toolVersion;
    
    @Builder.Default
    private List<DatabaseMetadata> databases = new ArrayList<>();
    
    public List<DatabaseMetadata> getDatabases() {
        return databases;
    }
    
    public void setDatabases(List<DatabaseMetadata> databases) {
        this.databases = databases;
    }
    
    public static SchemaCatalogBuilder builder() {
        return new SchemaCatalogBuilder();
    }
    
    /**
     * Total count of tables across all databases.
     */
    public int getTotalTableCount() {
        return databases.stream()
            .mapToInt(db -> db.getTables().size())
            .sum();
    }
    
    /**
     * Total count of PII columns across all databases.
     */
    public int getTotalPiiColumnCount() {
        return databases.stream()
            .mapToInt(DatabaseMetadata::getTotalPiiColumnCount)
            .sum();
    }
    
    public static class SchemaCatalogBuilder {
        private String version;
        private Instant generatedAt;
        private String toolVersion;
        private List<DatabaseMetadata> databases = new ArrayList<>();
        
        public SchemaCatalogBuilder version(String version) {
            this.version = version;
            return this;
        }
        
        public SchemaCatalogBuilder generatedAt(Instant generatedAt) {
            this.generatedAt = generatedAt;
            return this;
        }
        
        public SchemaCatalogBuilder toolVersion(String toolVersion) {
            this.toolVersion = toolVersion;
            return this;
        }
        
        public SchemaCatalogBuilder databases(List<DatabaseMetadata> databases) {
            this.databases = databases;
            return this;
        }
        
        public SchemaCatalog build() {
            SchemaCatalog catalog = new SchemaCatalog();
            catalog.version = this.version;
            catalog.generatedAt = this.generatedAt;
            catalog.toolVersion = this.toolVersion;
            catalog.databases = this.databases;
            return catalog;
        }
    }
}
