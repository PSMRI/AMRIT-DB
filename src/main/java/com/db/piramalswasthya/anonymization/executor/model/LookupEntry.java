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
    
    public static LookupEntry.LookupEntryBuilder builder() {
        return new LookupEntry.LookupEntryBuilder();
    }
    
    public static class LookupEntryBuilder {
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
        
        public LookupEntryBuilder id(Long id) {
            this.id = id;
            return this;
        }
        
        public LookupEntryBuilder databaseName(String databaseName) {
            this.databaseName = databaseName;
            return this;
        }
        
        public LookupEntryBuilder tableName(String tableName) {
            this.tableName = tableName;
            return this;
        }
        
        public LookupEntryBuilder columnName(String columnName) {
            this.columnName = columnName;
            return this;
        }
        
        public LookupEntryBuilder originalValueHash(String originalValueHash) {
            this.originalValueHash = originalValueHash;
            return this;
        }
        
        public LookupEntryBuilder anonymizedValue(String anonymizedValue) {
            this.anonymizedValue = anonymizedValue;
            return this;
        }
        
        public LookupEntryBuilder strategy(String strategy) {
            this.strategy = strategy;
            return this;
        }
        
        public LookupEntryBuilder dataType(String dataType) {
            this.dataType = dataType;
            return this;
        }
        
        public LookupEntryBuilder createdAt(Instant createdAt) {
            this.createdAt = createdAt;
            return this;
        }
        
        public LookupEntryBuilder lastUsedAt(Instant lastUsedAt) {
            this.lastUsedAt = lastUsedAt;
            return this;
        }
        
        public LookupEntryBuilder usageCount(Integer usageCount) {
            this.usageCount = usageCount;
            return this;
        }
        
        public LookupEntry build() {
            LookupEntry entry = new LookupEntry();
            entry.id = this.id;
            entry.databaseName = this.databaseName;
            entry.tableName = this.tableName;
            entry.columnName = this.columnName;
            entry.originalValueHash = this.originalValueHash;
            entry.anonymizedValue = this.anonymizedValue;
            entry.strategy = this.strategy;
            entry.dataType = this.dataType;
            entry.createdAt = this.createdAt;
            entry.lastUsedAt = this.lastUsedAt;
            entry.usageCount = this.usageCount;
            return entry;
        }
    }
}
