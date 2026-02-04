package com.db.piramalswasthya.anonymization.executor.strategy.impl;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import com.github.javafaker.Faker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class RandomFakeDataStrategy implements AnonymizationStrategy {
    
    private static final Logger log = LoggerFactory.getLogger(RandomFakeDataStrategy.class);
    
    private final Faker indianFaker;
    
    public RandomFakeDataStrategy() {
        this.indianFaker = new Faker(new Locale("en", "IND"));
    }
    
    @Override
    public AnonymizationResult anonymize(String originalValue, StrategyContext context) throws AnonymizationException {
        if (originalValue == null || originalValue.isEmpty()) {
            return AnonymizationResult.generated(null, getStrategyName());
        }
        
        try {
            String fakeValue = generateFakeData(context);
            
            if (context.getMaxLength() != null && fakeValue != null && fakeValue.length() > context.getMaxLength()) {
                fakeValue = fakeValue.substring(0, context.getMaxLength());
            }
            
            return AnonymizationResult.generated(fakeValue, getStrategyName());
        } catch (Exception e) {
            throw new AnonymizationException("Fake data generation failed for column " + 
                context.getColumnName(), e);
        }
    }
    
    private String generateFakeData(StrategyContext context) {
        String columnName = context.getColumnName().toLowerCase();
        String dataType = context.getDataType().toLowerCase();
        
        if (columnName.contains("name") && !columnName.contains("filename") && !columnName.contains("username")) {
            if (columnName.contains("first") || columnName.contains("fname")) {
                return indianFaker.name().firstName();
            } else if (columnName.contains("last") || columnName.contains("lname")) {
                return indianFaker.name().lastName();
            } else if (columnName.contains("middle")) {
                return indianFaker.name().firstName();
            } else {
                return indianFaker.name().fullName();
            }
        }
        
        if (columnName.contains("email")) {
            return indianFaker.internet().emailAddress();
        }
        
        if (columnName.contains("phone") || columnName.contains("mobile") || columnName.contains("contact")) {
            return "91" + indianFaker.number().digits(10);
        }
        
        if (columnName.contains("address") || columnName.contains("street")) {
            return indianFaker.address().streetAddress();
        }
        
        if (columnName.contains("city")) {
            return indianFaker.address().city();
        }
        
        if (columnName.contains("state")) {
            return indianFaker.address().state();
        }
        
        if (columnName.contains("pincode") || columnName.contains("zipcode") || columnName.contains("postal")) {
            return indianFaker.address().zipCode();
        }
        
        if (columnName.contains("aadhar") || columnName.contains("aadhaar")) {
            return indianFaker.number().digits(12);
        }
        
        if (dataType.contains("int")) {
            return String.valueOf(indianFaker.number().randomNumber());
        }
        
        if (dataType.contains("varchar") || dataType.contains("text")) {
            return indianFaker.lorem().sentence();
        }
        
        log.warn("No specific faker found for column '{}' of type '{}', using generic text", 
            columnName, dataType);
        return indianFaker.lorem().word();
    }
    
    @Override
    public String getStrategyName() {
        return "RANDOM_FAKE_DATA";
    }
    
    @Override
    public boolean isDeterministic() {
        return false;
    }
    
    @Override
    public boolean supportsCaching() {
        return false;
    }
}
