package com.db.piramalswasthya.anonymization.executor;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.lookup.LookupTableManager;
import com.db.piramalswasthya.anonymization.executor.model.LookupEntry;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationResult;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyContext;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyFactory;
import com.db.piramalswasthya.anonymization.model.AnonymizationRegistry.ColumnRegistry;
import com.db.piramalswasthya.anonymization.registry.AnonymizationRegistryService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.sql.DataSource;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Component
public class AnonymizationProcessor {
    private static final Logger log = LoggerFactory.getLogger(AnonymizationProcessor.class);
    private final StrategyFactory strategyFactory;
    private final LookupTableManager lookupManager;
    private final JdbcTemplate jdbcTemplate;
    private final AnonymizationRegistryService registry;
    
    public AnonymizationProcessor(
            StrategyFactory strategyFactory,
            LookupTableManager lookupManager,
            DataSource dataSource,
            AnonymizationRegistryService registry) {
        this.strategyFactory = strategyFactory;
        this.lookupManager = lookupManager;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.registry = registry;
    }
    
    public void initializeProcessor() throws AnonymizationException {
        log.info("Initializing anonymization processor");
        
        lookupManager.initializeLookupTable();
        
        log.info("Processor initialized successfully");
        log.info("Lookup table entries: {}", lookupManager.getLookupCount());
    }
    
    public AnonymizationResult processValue(
            String databaseName,
            String tableName,
            String columnName,
            String originalValue,
            String dataType) throws AnonymizationException {
        
        ColumnRegistry columnMeta = registry.getColumnRule(databaseName, tableName, columnName);
        
        if (columnMeta == null) {
            log.debug("No rule found for {}.{}.{}, preserving value", databaseName, tableName, columnName);
            return AnonymizationResult.generated(originalValue, "PRESERVE");
        }
        
        String strategy = columnMeta.getAnonymizationRule();
        AnonymizationStrategy strategyImpl = strategyFactory.getStrategy(strategy);
        
        if (strategyImpl.supportsCaching() && strategyImpl.isDeterministic()) {
            Optional<LookupEntry> cached = lookupManager.findLookup(
                databaseName, tableName, columnName, originalValue);
            
            if (cached.isPresent()) {
                log.debug("Using cached value for {}.{}.{}", databaseName, tableName, columnName);
                return AnonymizationResult.cached(cached.get().getAnonymizedValue(), strategy);
            }
        }
        
        StrategyContext context = StrategyContext.builder()
            .databaseName(databaseName)
            .tableName(tableName)
            .columnName(columnName)
            .dataType(dataType)
            .maxLength(null)
            .locale("en-IND")
            .options(null)
            .build();
        
        AnonymizationResult result = strategyImpl.anonymize(originalValue, context);
        
        if (strategyImpl.supportsCaching() && strategyImpl.isDeterministic()) {
            lookupManager.saveLookup(
                databaseName, tableName, columnName,
                originalValue, result.anonymizedValue(), strategy, dataType);
        }
        
        return result;
    }
    
    public long anonymizeTable(String databaseName, String tableName) throws AnonymizationException {
        log.info("Starting anonymization for {}.{}", databaseName, tableName);
        
        List<ColumnRegistry> columnsToAnonymize = registry.getTableRules(databaseName, tableName);
        
        if (columnsToAnonymize.isEmpty()) {
            log.info("No columns to anonymize in {}.{}", databaseName, tableName);
            return 0;
        }
        
        jdbcTemplate.execute("USE " + databaseName);
        
        String countSql = "SELECT COUNT(*) FROM " + tableName;
        Long totalRows = jdbcTemplate.queryForObject(countSql, Long.class);
        
        if (totalRows == null || totalRows == 0) {
            log.info("No rows found in {}.{}", databaseName, tableName);
            return 0;
        }
        
        log.info("Found {} rows to process in {}.{}", totalRows, databaseName, tableName);
        
        StringBuilder selectQuery = new StringBuilder("SELECT ");
        columnsToAnonymize.forEach(col -> 
            selectQuery.append(col.getCanonicalName()).append(", ")
        );
        selectQuery.setLength(selectQuery.length() - 2);
        selectQuery.append(" FROM ").append(tableName);
        
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(selectQuery.toString());
        
        long processedRows = 0;
        for (Map<String, Object> row : rows) {
            for (ColumnRegistry column : columnsToAnonymize) {
                String columnName = column.getCanonicalName();
                Object value = row.get(columnName);
                
                if (value != null) {
                    AnonymizationResult result = processValue(
                        databaseName, tableName, columnName,
                        value.toString(), column.getDataType()
                    );
                    
                    log.debug("Anonymized {}.{}.{}: {} -> {} (strategy: {}, cached: {})",
                        databaseName, tableName, columnName,
                        value, result.anonymizedValue(), result.strategy(), result.fromCache());
                }
            }
            processedRows++;
            
            if (processedRows % 1000 == 0) {
                log.info("Processed {}/{} rows from {}.{}", processedRows, totalRows, databaseName, tableName);
            }
        }
        
        log.info("Completed anonymization for {}.{}: {} rows processed", 
            databaseName, tableName, processedRows);
        
        return processedRows;
    }
    
    public void testStrategy(String strategyName) throws AnonymizationException {
        log.info("===== Testing Strategy: {} =====", strategyName);
        
        AnonymizationStrategy strategy = strategyFactory.getStrategy(strategyName);
        
        String[] testValues = {
            "John Doe",
            "jane.smith@example.com",
            "9876543210",
            "123 Main Street",
            "1990-05-15",
            "35"
        };
        
        for (String testValue : testValues) {
            StrategyContext context = StrategyContext.builder()
                .databaseName("test_db")
                .tableName("test_table")
                .columnName("test_column")
                .dataType("VARCHAR(255)")
                .maxLength(255)
                .locale("en-IND")
                .build();
            
            AnonymizationResult result = strategy.anonymize(testValue, context);
            
            log.info("Original: {} -> Anonymized: {} (strategy: {})",
                testValue, result.anonymizedValue(), result.strategy());
        }
    }
}
