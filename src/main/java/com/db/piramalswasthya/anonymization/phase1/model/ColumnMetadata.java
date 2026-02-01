package com.db.piramalswasthya.anonymization.phase1.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Metadata for a single database column.
 * Captures schema information and PII classification.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ColumnMetadata {
    private String name;
    private String dataType;
    private Integer columnSize;
    private Boolean nullable;
    private Boolean primaryKey;
    private Boolean uniqueConstraint;
    private String defaultValue;
    private Integer ordinalPosition;
    
    // PII Classification
    private PIICategory piiCategory;
    private RiskLevel riskLevel;
    private String detectionRationale; // Why this classification was assigned
    private String proposedRuleId; // Suggested anonymization rule (can be "TBD")
    
    // Canonical naming and lineage (for future migrations)
    private String canonicalName;
    @Builder.Default
    private List<String> aliases = new ArrayList<>();
    private String renamedFrom;
    private String addedInMigration;
    
    // Statistics (if computed)
    private Double nullPercentage;
    private Integer estimatedDistinctValues;
    
    /**
     * Returns whether this column requires PII anonymization.
     */
    public boolean requiresAnonymization() {
        return riskLevel != null && riskLevel.getPriority() >= 3;
    }
    
    /**
     * Returns whether this column is a linking key requiring special handling.
     */
    public boolean isLinkingKey() {
        return piiCategory == PIICategory.LINKING_KEY;
    }
}
