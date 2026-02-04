package com.db.piramalswasthya.anonymization.executor.strategy.impl;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class HashSha256Strategy implements AnonymizationStrategy {
    
    @Value("${anonymization.hash.salt:AMRIT_2024_SECURE_SALT}")
    private String salt;
    
    @Override
    public AnonymizationResult anonymize(String originalValue, StrategyContext context) throws AnonymizationException {
        if (originalValue == null || originalValue.isEmpty()) {
            return AnonymizationResult.generated(null, getStrategyName());
        }
        
        try {
            String saltedValue = salt + originalValue + salt;
            String hash = DigestUtils.sha256Hex(saltedValue);
            
            if (context.getMaxLength() != null && context.getMaxLength() < hash.length()) {
                hash = hash.substring(0, context.getMaxLength());
            }
            
            return AnonymizationResult.generated(hash, getStrategyName());
        } catch (Exception e) {
            throw new AnonymizationException("SHA-256 hashing failed for column " + 
                context.getColumnName(), e);
        }
    }
    
    @Override
    public String getStrategyName() {
        return "HASH_SHA256";
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
