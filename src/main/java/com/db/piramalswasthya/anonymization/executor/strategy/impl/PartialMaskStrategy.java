package com.db.piramalswasthya.anonymization.executor.strategy.impl;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import org.springframework.stereotype.Component;

@Component
public class PartialMaskStrategy implements AnonymizationStrategy {
    
    private static final char MASK_CHAR = 'X';
    private static final int DEFAULT_SHOW_CHARS = 4;
    
    @Override
    public AnonymizationResult anonymize(String originalValue, StrategyContext context) throws AnonymizationException {
        if (originalValue == null || originalValue.isEmpty()) {
            return AnonymizationResult.generated(null, getStrategyName());
        }
        
        try {
            int showChars = parseShowChars(context.getOptions());
            String masked = maskValue(originalValue, showChars);
            
            return AnonymizationResult.generated(masked, getStrategyName());
        } catch (Exception e) {
            throw new AnonymizationException("Partial masking failed for column " + 
                context.getColumnName(), e);
        }
    }
    
    private int parseShowChars(String options) {
        if (options == null || options.isEmpty()) {
            return DEFAULT_SHOW_CHARS;
        }
        
        try {
            if (options.startsWith("show_last_")) {
                return Integer.parseInt(options.substring("show_last_".length()));
            }
            return DEFAULT_SHOW_CHARS;
        } catch (NumberFormatException e) {
            return DEFAULT_SHOW_CHARS;
        }
    }
    
    private String maskValue(String value, int showChars) {
        if (value.length() <= showChars) {
            return MASK_CHAR + value;
        }
        
        int maskLength = value.length() - showChars;
        StringBuilder masked = new StringBuilder();
        
        for (int i = 0; i < maskLength; i++) {
            masked.append(MASK_CHAR);
        }
        
        masked.append(value.substring(maskLength));
        return masked.toString();
    }
    
    @Override
    public String getStrategyName() {
        return "PARTIAL_MASK";
    }
    
    @Override
    public boolean isDeterministic() {
        return true;
    }
    
    @Override
    public boolean supportsCaching() {
        return true;
    }
}
