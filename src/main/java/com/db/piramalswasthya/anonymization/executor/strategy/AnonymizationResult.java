package com.db.piramalswasthya.anonymization.executor.strategy;

public record AnonymizationResult(
    String anonymizedValue,
    boolean fromCache,
    String strategy
) {
    public static AnonymizationResult generated(String value, String strategy) {
        return new AnonymizationResult(value, false, strategy);
    }
    
    public static AnonymizationResult cached(String value, String strategy) {
        return new AnonymizationResult(value, true, strategy);
    }
}
