package com.db.piramalswasthya.anonymization.phase1.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Metadata for a foreign key constraint.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ForeignKeyMetadata {
    private String fkColumnName;
    private String pkTableName;
    private String pkColumnName;
    private String pkTableSchema; // Database name for cross-DB relationships
    private String constraintName;
    private Integer updateRule;
    private Integer deleteRule;
}
