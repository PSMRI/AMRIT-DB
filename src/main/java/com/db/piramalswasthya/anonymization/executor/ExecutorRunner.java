package com.db.piramalswasthya.anonymization.executor;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyFactory;
import com.db.piramalswasthya.anonymization.registry.AnonymizationRegistryService;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Map;

@Component
@ConditionalOnProperty(name = "spring.profiles.active", havingValue = "executor")
public class ExecutorRunner implements ApplicationRunner {
    
    private static final Logger log = LoggerFactory.getLogger(ExecutorRunner.class);
    private final AnonymizationProcessor processor;
    private final StrategyFactory strategyFactory;
    private final AnonymizationRegistryService registry;
    
    public ExecutorRunner(
            AnonymizationProcessor processor,
            StrategyFactory strategyFactory,
            AnonymizationRegistryService registry) {
        this.processor = processor;
        this.strategyFactory = strategyFactory;
        this.registry = registry;
    }
    
    @Override
    public void run(ApplicationArguments args) throws Exception {
        try {
            logInitialization();
            
            processor.initializeProcessor();
            
            if (args.containsOption("test-strategies")) {
                testAllStrategies();
                return;
            }
            
            if (args.containsOption("test-strategy")) {
                String strategy = args.getOptionValues("test-strategy").get(0);
                processor.testStrategy(strategy);
                return;
            }
            
            if (args.containsOption("database") && args.containsOption("table")) {
                String database = args.getOptionValues("database").get(0);
                String table = args.getOptionValues("table").get(0);
                
                log.info("Processing single table: {}.{}", database, table);
                long rows = processor.anonymizeTable(database, table);
                log.info("Completed processing: {} rows anonymized", rows);
                return;
            }
            
            log.info("Starting full database anonymization");
            processAllDatabases();
            
            log.info("===== Anonymization Completed Successfully =====");
            
        } catch (AnonymizationException e) {
            log.error("Anonymization failed", e);
            throw e;
        }
    }
    
    private void logInitialization() {
        log.info("===== AMRIT Database Anonymization Executor =====");
        log.info("Java Version: {}", System.getProperty("java.version"));
        log.info("Spring Profile: executor");
        
        Map<String, AnonymizationStrategy> strategies = strategyFactory.getAllStrategies();
        log.info("Available strategies: {}", strategies.keySet());
    }
    
    private void testAllStrategies() throws AnonymizationException {
        log.info("===== Testing All Anonymization Strategies =====");
        
        Map<String, AnonymizationStrategy> strategies = strategyFactory.getAllStrategies();
        
        for (String strategyName : strategies.keySet()) {
            processor.testStrategy(strategyName);
            log.info("");
        }
        
        log.info("===== Strategy Testing Completed =====");
    }
    
    private void processAllDatabases() throws AnonymizationException {
        String[] databases = {"db_identity", "db_iemr", "db_reporting", "db_1097_identity"};
        
        for (String database : databases) {
            log.info("Processing database: {}", database);
            
            var tables = registry.getDatabaseRules(database);
            
            if (tables.isEmpty()) {
                log.info("No tables configured for anonymization in database: {}", database);
                continue;
            }
            
            long totalRows = 0;
            for (String tableName : tables.keySet()) {
                try {
                    long rows = processor.anonymizeTable(database, tableName);
                    totalRows += rows;
                } catch (Exception e) {
                    log.error("Failed to process table {}.{}", database, tableName, e);
                }
            }
            
            log.info("Database {} completed: {} total rows processed", database, totalRows);
        }
    }
}
