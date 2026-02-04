package com.db.piramalswasthya.anonymization.executor.strategy.impl;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import org.springframework.stereotype.Component;

@Component
public class PreserveStrategy implements AnonymizationStrategy {
    
    @Override
    public AnonymizationResult anonymize(String originalValue, StrategyContext context) throws AnonymizationException {
        return AnonymizationResult.generated(originalValue, getStrategyName());
    }
    
    @Override
    public String getStrategyName() {
        return "PRESERVE";
    }
    
    @Override
    public boolean isDeterministic() {
        return true;
    }
    
    @Override
    public boolean supportsCaching() {
        return false;
    }
}
