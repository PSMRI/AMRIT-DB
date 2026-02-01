package com.db.piramalswasthya.anonymization.phase1.model;

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
}
