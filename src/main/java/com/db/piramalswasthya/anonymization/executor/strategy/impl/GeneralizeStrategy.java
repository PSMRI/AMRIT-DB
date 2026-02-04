package com.db.piramalswasthya.anonymization.executor.strategy.impl;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Component
public class GeneralizeStrategy implements AnonymizationStrategy {
    
    private static final Logger log = LoggerFactory.getLogger(GeneralizeStrategy.class);
    
    @Override
    public AnonymizationResult anonymize(String originalValue, StrategyContext context) throws AnonymizationException {
        if (originalValue == null || originalValue.isEmpty()) {
            return AnonymizationResult.generated(null, getStrategyName());
        }
        
        try {
            String generalized = generalizeValue(originalValue, context);
            return AnonymizationResult.generated(generalized, getStrategyName());
        } catch (Exception e) {
            throw new AnonymizationException("Generalization failed for column " + 
                context.getColumnName(), e);
        }
    }
    
    private String generalizeValue(String value, StrategyContext context) {
        String columnName = context.getColumnName().toLowerCase();
        String dataType = context.getDataType().toLowerCase();
        
        if (columnName.contains("dob") || columnName.contains("birth") || columnName.contains("date")) {
            return generalizeDate(value);
        }
        
        if (columnName.contains("age")) {
            return generalizeAge(value);
        }
        
        if (dataType.contains("int") || dataType.contains("number")) {
            return generalizeNumber(value);
        }
        
        return value.substring(0, Math.min(3, value.length())) + "***";
    }
    
    private String generalizeDate(String dateValue) {
        try {
            DateTimeFormatter[] formatters = {
                DateTimeFormatter.ofPattern("yyyy-MM-dd"),
                DateTimeFormatter.ofPattern("dd-MM-yyyy"),
                DateTimeFormatter.ofPattern("dd/MM/yyyy"),
                DateTimeFormatter.ofPattern("yyyy/MM/dd")
            };
            
            for (DateTimeFormatter formatter : formatters) {
                try {
                    LocalDate date = LocalDate.parse(dateValue, formatter);
                    return String.valueOf(date.getYear());
                } catch (Exception e) {
                    // Try next formatter
                }
            }
            
            return dateValue;
        } catch (Exception e) {
            log.warn("Failed to parse date '{}', returning as-is", dateValue);
            return dateValue;
        }
    }
    
    private String generalizeAge(String ageValue) {
        try {
            int age = Integer.parseInt(ageValue);
            
            if (age < 18) return "0-17";
            if (age < 30) return "18-29";
            if (age < 45) return "30-44";
            if (age < 60) return "45-59";
            return "60+";
        } catch (NumberFormatException e) {
            log.warn("Failed to parse age '{}', returning as-is", ageValue);
            return ageValue;
        }
    }
    
    private String generalizeNumber(String numberValue) {
        try {
            long num = Long.parseLong(numberValue);
            
            if (num < 0) {
                return "<0";
            }
            
            int magnitude = (int) Math.log10(num + 1);
            long roundTo = (long) Math.pow(10, Math.max(1, magnitude - 1));
            long rounded = (num / roundTo) * roundTo;
            
            return String.valueOf(rounded);
        } catch (NumberFormatException e) {
            log.warn("Failed to parse number '{}', returning as-is", numberValue);
            return numberValue;
        }
    }
    
    @Override
    public String getStrategyName() {
        return "GENERALIZE";
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
