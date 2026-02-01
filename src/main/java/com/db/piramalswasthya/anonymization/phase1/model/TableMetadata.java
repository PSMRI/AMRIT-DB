package com.db.piramalswasthya.anonymization.phase1.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Metadata for a single database table.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TableMetadata {
    private String name;
    private String tableType; // TABLE, VIEW, etc.
    private String remarks;
    private Long estimatedRowCount;
    
    @Builder.Default
    private List<ColumnMetadata> columns = new ArrayList<>();
    @Builder.Default
    private List<ForeignKeyMetadata> foreignKeys = new ArrayList<>();
    @Builder.Default
    private List<IndexMetadata> indexes = new ArrayList<>();
    
    // Canonical naming
    private String canonicalName;
    @Builder.Default
    private List<String> aliases = new ArrayList<>();
    private String renamedFrom;
    private String addedInMigration;
    
    /**
     * Count of columns requiring anonymization.
     */
    public int getPiiColumnCount() {
        return (int) columns.stream()
            .filter(ColumnMetadata::requiresAnonymization)
            .count();
    }
    
    /**
     * Returns whether this table contains PII.
     */
    public boolean hasPiiData() {
        return getPiiColumnCount() > 0;
    }
}
