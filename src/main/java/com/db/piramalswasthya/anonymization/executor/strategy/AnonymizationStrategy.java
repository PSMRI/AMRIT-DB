package com.db.piramalswasthya.anonymization.executor.strategy;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;

public interface AnonymizationStrategy {
    
    AnonymizationResult anonymize(String originalValue, StrategyContext context) throws AnonymizationException;
    
    String getStrategyName();
    
    boolean isDeterministic();
    
    boolean supportsCaching();
}
