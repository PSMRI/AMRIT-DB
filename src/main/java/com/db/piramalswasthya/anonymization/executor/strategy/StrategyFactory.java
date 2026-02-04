package com.db.piramalswasthya.anonymization.executor.strategy;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class StrategyFactory {
    private static final Logger log = LoggerFactory.getLogger(StrategyFactory.class);
    private final Map<String, AnonymizationStrategy> strategies;
    
    public StrategyFactory(List<AnonymizationStrategy> strategyList) {
        this.strategies = new HashMap<>();
        
        for (AnonymizationStrategy strategy : strategyList) {
            strategies.put(strategy.getStrategyName(), strategy);
            log.info("Registered anonymization strategy: {}", strategy.getStrategyName());
        }
        
        log.info("Total strategies registered: {}", strategies.size());
    }
    
    public AnonymizationStrategy getStrategy(String strategyName) throws AnonymizationException {
        AnonymizationStrategy strategy = strategies.get(strategyName);
        
        if (strategy == null) {
            throw new AnonymizationException("Unknown anonymization strategy: " + strategyName);
        }
        
        return strategy;
    }
    
    public boolean isValidStrategy(String strategyName) {
        return strategies.containsKey(strategyName);
    }
    
    public Map<String, AnonymizationStrategy> getAllStrategies() {
        return new HashMap<>(strategies);
    }
}
