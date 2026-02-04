package com.db.piramalswasthya.anonymization.executor.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LookupEntry {
    private Long id;
    private String databaseName;
    private String tableName;
    private String columnName;
    private String originalValueHash;
    private String anonymizedValue;
    private String strategy;
    private String dataType;
    private Instant createdAt;
    private Instant lastUsedAt;
    private Integer usageCount;
    
    public String getAnonymizedValue() {
        return anonymizedValue;
    }
    
    public void setAnonymizedValue(String anonymizedValue) {
        this.anonymizedValue = anonymizedValue;
    }
}
