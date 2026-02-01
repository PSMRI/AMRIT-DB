package com.db.piramalswasthya.anonymization.phase1.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.regex.Pattern;

/**
 * A PII detection rule loaded from YAML configuration.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PIIDetectionRule {
    private String ruleId;
    private String columnNamePattern;
    private String tableNamePattern;
    private String dataTypePattern;
    private PIICategory piiCategory;
    private RiskLevel riskLevel;
    private String suggestedRuleId;
    private String rationale;
    private Integer priority; // Higher priority rules match first
    
    // Compiled patterns (not serialized)
    private transient Pattern compiledColumnPattern;
    private transient Pattern compiledTablePattern;
    private transient Pattern compiledDataTypePattern;
    
    /**
     * Compiles regex patterns after loading from YAML.
     */
    public void compilePatterns() {
        if (columnNamePattern != null && !columnNamePattern.isEmpty()) {
            compiledColumnPattern = Pattern.compile(columnNamePattern, Pattern.CASE_INSENSITIVE);
        }
        if (tableNamePattern != null && !tableNamePattern.isEmpty()) {
            compiledTablePattern = Pattern.compile(tableNamePattern, Pattern.CASE_INSENSITIVE);
        }
        if (dataTypePattern != null && !dataTypePattern.isEmpty()) {
            compiledDataTypePattern = Pattern.compile(dataTypePattern, Pattern.CASE_INSENSITIVE);
        }
    }
    
    /**
     * Tests whether this rule matches the given column.
     */
    public boolean matches(String columnName, String tableName, String dataType) {
        boolean columnMatch = compiledColumnPattern == null || 
            compiledColumnPattern.matcher(columnName).matches();
        boolean tableMatch = compiledTablePattern == null || 
            compiledTablePattern.matcher(tableName).matches();
        boolean typeMatch = compiledDataTypePattern == null || 
            compiledDataTypePattern.matcher(dataType).matches();
        
        return columnMatch && tableMatch && typeMatch;
    }
}
