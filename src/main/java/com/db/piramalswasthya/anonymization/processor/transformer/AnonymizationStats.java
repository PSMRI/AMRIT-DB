package com.db.piramalswasthya.anonymization.processor.transformer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Statistics from an anonymization run
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AnonymizationStats {
    private long totalStatements;
    private long insertStatements;
    private long rowsProcessed;
    private long valuesAnonymized;
    private long durationMs;
    private String inputFilePath;
    private String outputFilePath;
    
    public long getTotalStatements() {
        return totalStatements;
    }
    
    public long getInsertStatements() {
        return insertStatements;
    }
    
    public long getRowsProcessed() {
        return rowsProcessed;
    }
    
    public long getValuesAnonymized() {
        return valuesAnonymized;
    }
    
    public long getDurationMs() {
        return durationMs;
    }
    
    public String getInputFilePath() {
        return inputFilePath;
    }
    
    public String getOutputFilePath() {
        return outputFilePath;
    }
    
    public static AnonymizationStatsBuilder builder() {
        return new AnonymizationStatsBuilder();
    }
    
    public double getThroughputRowsPerSecond() {
        if (durationMs == 0) return 0;
        return rowsProcessed / (durationMs / 1000.0);
    }
    
    public static class AnonymizationStatsBuilder {
        private long totalStatements;
        private long insertStatements;
        private long rowsProcessed;
        private long valuesAnonymized;
        private long durationMs;
        private String inputFilePath;
        private String outputFilePath;
        
        public AnonymizationStatsBuilder totalStatements(long totalStatements) {
            this.totalStatements = totalStatements;
            return this;
        }
        
        public AnonymizationStatsBuilder insertStatements(long insertStatements) {
            this.insertStatements = insertStatements;
            return this;
        }
        
        public AnonymizationStatsBuilder rowsProcessed(long rowsProcessed) {
            this.rowsProcessed = rowsProcessed;
            return this;
        }
        
        public AnonymizationStatsBuilder valuesAnonymized(long valuesAnonymized) {
            this.valuesAnonymized = valuesAnonymized;
            return this;
        }
        
        public AnonymizationStatsBuilder durationMs(long durationMs) {
            this.durationMs = durationMs;
            return this;
        }
        
        public AnonymizationStatsBuilder inputFilePath(String inputFilePath) {
            this.inputFilePath = inputFilePath;
            return this;
        }
        
        public AnonymizationStatsBuilder outputFilePath(String outputFilePath) {
            this.outputFilePath = outputFilePath;
            return this;
        }
        
        public AnonymizationStats build() {
            AnonymizationStats stats = new AnonymizationStats();
            stats.totalStatements = this.totalStatements;
            stats.insertStatements = this.insertStatements;
            stats.rowsProcessed = this.rowsProcessed;
            stats.valuesAnonymized = this.valuesAnonymized;
            stats.durationMs = this.durationMs;
            stats.inputFilePath = this.inputFilePath;
            stats.outputFilePath = this.outputFilePath;
            return stats;
        }
    }
}
