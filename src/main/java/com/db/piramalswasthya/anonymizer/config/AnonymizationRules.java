package com.db.piramalswasthya.anonymizer.config;

import lombok.Data;
import java.util.Map;

/**
 * Anonymization rules (loaded from rules.yaml)
 * 
 * Defines which columns to anonymize and how, with version tracking and schema hints.
 */
@Data
public class AnonymizationRules {
    
    private String rulesVersion;
    private String schemaHint;
    private String lastUpdated;
    private UnknownColumnPolicy unknownColumnPolicy = UnknownColumnPolicy.WARN;
    private Map<String, DatabaseRules> databases;
    
    @Data
    public static class DatabaseRules {
        private Map<String, TableRules> tables;
    }
    
    @Data
    public static class TableRules {
        private String primaryKey;
        private Map<String, ColumnRule> columns;
    }
    
    @Data
    public static class ColumnRule {
        private String strategy;
        private String dataType;
        private String piiLevel;
        private Map<String, Object> options;
    }
    
    public enum UnknownColumnPolicy {
        FAIL,
        WARN,
        PRESERVE
    }
}
