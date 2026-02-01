package com.db.piramalswasthya.anonymization.phase1.model;

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
