package com.db.piramalswasthya.anonymization.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Metadata for a complete database schema.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DatabaseMetadata {
    private String databaseName;
    private String productName;
    private String productVersion;
    private String driverName;
    private String driverVersion;
    
    @Builder.Default
    private List<TableMetadata> tables = new ArrayList<>();
    
    private String schemaHash; // SHA-256 of canonicalized schema
    private String capturedAt;
    
    public String getDatabaseName() {
        return databaseName;
    }
    
    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }
    
    public List<TableMetadata> getTables() {
        return tables;
    }
    
    public void setTables(List<TableMetadata> tables) {
        this.tables = tables;
    }
    
    /**
     * Count of tables with PII.
     */
    public int getPiiTableCount() {
        return (int) tables.stream()
            .filter(TableMetadata::hasPiiData)
            .count();
    }
    
    /**
     * Total count of PII columns across all tables.
     */
    public int getTotalPiiColumnCount() {
        return tables.stream()
            .mapToInt(TableMetadata::getPiiColumnCount)
            .sum();
    }
}
