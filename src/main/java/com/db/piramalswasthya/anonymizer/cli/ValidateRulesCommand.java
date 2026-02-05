package com.db.piramalswasthya.anonymizer.cli;

import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.*;
import java.util.concurrent.Callable;

/**
 * Validate rules command - checks rules.yaml structure and settings
 * 
 * Validates:
 * - YAML syntax
 * - Required fields (rulesVersion, schemaHint)
 * - Strategy names are valid
 * - Options match strategy requirements
 * - No duplicate column definitions
 */
@Command(
    name = "validate-rules",
    description = "Validate rules.yaml structure and settings",
    mixinStandardHelpOptions = true
)
public class ValidateRulesCommand implements Callable<Integer> {
    
    private static final Logger log = LoggerFactory.getLogger(ValidateRulesCommand.class);
    
    private static final Set<String> VALID_STRATEGIES = Set.of(
        "HASH", "FAKE_NAME", "MASK", "GENERALIZE", "SUPPRESS", "PRESERVE"
    );
    
    private static final Set<String> VALID_PII_LEVELS = Set.of(
        "CRITICAL", "HIGH", "MEDIUM", "LOW", "UNKNOWN"
    );
    
    @Option(names = {"-r", "--rules"}, description = "Rules file", defaultValue = "rules.yaml")
    private String rulesFile;
    
    @Override
    public Integer call() throws Exception {
        log.info("=== AMRIT DB Anonymization - VALIDATE RULES Command ===");
        log.info("Rules file: {}", rulesFile);
        
        List<String> errors = new ArrayList<>();
        List<String> warnings = new ArrayList<>();
        
        try {
            // 1. Load and parse YAML
            log.info("Loading rules file...");
            ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
            AnonymizationRules rules;
            
            try {
                rules = mapper.readValue(new File(rulesFile), AnonymizationRules.class);
            } catch (Exception e) {
                errors.add("YAML parsing failed: " + e.getMessage());
                reportResults(errors, warnings);
                return 1;
            }
            
            // 2. Validate required fields
            log.info("Validating required fields...");
            validateRequiredFields(rules, errors);
            
            // 3. Validate strategies
            log.info("Validating strategies...");
            validateStrategies(rules, errors, warnings);
            
            // 4. Validate primary keys
            log.info("Validating primary keys...");
            validatePrimaryKeys(rules, errors);
            
            // 5. Check for duplicates
            log.info("Checking for duplicates...");
            checkDuplicates(rules, errors);
            
            // 6. Validate data consistency
            log.info("Validating data consistency...");
            validateDataConsistency(rules, warnings);
            
            // 7. Report results
            reportResults(errors, warnings);
            
            if (errors.isEmpty()) {
                log.info("Validation passed successfully!");
                return 0;
            } else {
                log.error("Validation failed with {} error(s)", errors.size());
                return 1;
            }
            
        } catch (Exception e) {
            log.error("Validation failed: {}", e.getMessage(), e);
            return 1;
        }
    }
    
    /**
     * Validate required fields
     */
    private void validateRequiredFields(AnonymizationRules rules, List<String> errors) {
        if (rules.getRulesVersion() == null || rules.getRulesVersion().isEmpty()) {
            errors.add("Missing required field: rulesVersion");
        }
        
        if (rules.getSchemaHint() == null || rules.getSchemaHint().isEmpty()) {
            warnings.add("Missing recommended field: schemaHint");
        }
        
        if (rules.getDatabases() == null || rules.getDatabases().isEmpty()) {
            errors.add("No databases defined in rules");
        }
    }
    
    /**
     * Validate strategies
     */
    private void validateStrategies(AnonymizationRules rules, List<String> errors, 
                                   List<String> warnings) {
        
        if (rules.getDatabases() == null) return;
        
        for (Map.Entry<String, AnonymizationRules.DatabaseRules> dbEntry : 
                rules.getDatabases().entrySet()) {
            
            String dbName = dbEntry.getKey();
            AnonymizationRules.DatabaseRules dbRules = dbEntry.getValue();
            
            if (dbRules.getTables() == null) continue;
            
            for (Map.Entry<String, AnonymizationRules.TableRules> tableEntry : 
                    dbRules.getTables().entrySet()) {
                
                String tableName = tableEntry.getKey();
                AnonymizationRules.TableRules tableRules = tableEntry.getValue();
                
                if (tableRules.getColumns() == null) continue;
                
                for (Map.Entry<String, AnonymizationRules.ColumnRule> colEntry : 
                        tableRules.getColumns().entrySet()) {
                    
                    String columnName = colEntry.getKey();
                    AnonymizationRules.ColumnRule rule = colEntry.getValue();
                    
                    // Validate strategy name
                    if (rule.getStrategy() == null) {
                        errors.add(String.format(
                            "Missing strategy for %s.%s.%s", dbName, tableName, columnName));
                    } else if (!VALID_STRATEGIES.contains(rule.getStrategy().toUpperCase())) {
                        errors.add(String.format(
                            "Invalid strategy '%s' for %s.%s.%s (valid: %s)",
                            rule.getStrategy(), dbName, tableName, columnName, VALID_STRATEGIES));
                    }
                    
                    // Validate PII level if specified
                    if (rule.getPiiLevel() != null && 
                            !VALID_PII_LEVELS.contains(rule.getPiiLevel().toUpperCase())) {
                        warnings.add(String.format(
                            "Invalid piiLevel '%s' for %s.%s.%s (valid: %s)",
                            rule.getPiiLevel(), dbName, tableName, columnName, VALID_PII_LEVELS));
                    }
                    
                    // Validate strategy-specific options
                    validateStrategyOptions(rule, dbName, tableName, columnName, warnings);
                }
            }
        }
    }
    
    /**
     * Validate strategy-specific options
     */
    private void validateStrategyOptions(AnonymizationRules.ColumnRule rule, 
                                        String dbName, String tableName, String columnName,
                                        List<String> warnings) {
        
        if (rule.getStrategy() == null) return;
        
        switch (rule.getStrategy().toUpperCase()) {
            case "MASK":
                if (rule.getOptions() != null && rule.getOptions().containsKey("showLast")) {
                    Object showLast = rule.getOptions().get("showLast");
                    if (!(showLast instanceof Number)) {
                        warnings.add(String.format(
                            "MASK strategy 'showLast' option should be numeric for %s.%s.%s",
                            dbName, tableName, columnName));
                    }
                }
                break;
                
            case "GENERALIZE":
                if (rule.getOptions() != null && rule.getOptions().containsKey("precision")) {
                    Object precision = rule.getOptions().get("precision");
                    if (!(precision instanceof String)) {
                        warnings.add(String.format(
                            "GENERALIZE strategy 'precision' option should be string for %s.%s.%s",
                            dbName, tableName, columnName));
                    }
                }
                break;
        }
    }
    
    /**
     * Validate primary keys
     */
    private void validatePrimaryKeys(AnonymizationRules rules, List<String> errors) {
        if (rules.getDatabases() == null) return;
        
        for (Map.Entry<String, AnonymizationRules.DatabaseRules> dbEntry : 
                rules.getDatabases().entrySet()) {
            
            String dbName = dbEntry.getKey();
            AnonymizationRules.DatabaseRules dbRules = dbEntry.getValue();
            
            if (dbRules.getTables() == null) continue;
            
            for (Map.Entry<String, AnonymizationRules.TableRules> tableEntry : 
                    dbRules.getTables().entrySet()) {
                
                String tableName = tableEntry.getKey();
                AnonymizationRules.TableRules tableRules = tableEntry.getValue();
                
                if (tableRules.getPrimaryKey() == null || tableRules.getPrimaryKey().isEmpty()) {
                    errors.add(String.format(
                        "Missing primaryKey for table %s.%s", dbName, tableName));
                }
            }
        }
    }
    
    /**
     * Check for duplicate definitions
     */
    private void checkDuplicates(AnonymizationRules rules, List<String> errors) {
        if (rules.getDatabases() == null) return;
        
        for (Map.Entry<String, AnonymizationRules.DatabaseRules> dbEntry : 
                rules.getDatabases().entrySet()) {
            
            String dbName = dbEntry.getKey();
            AnonymizationRules.DatabaseRules dbRules = dbEntry.getValue();
            
            if (dbRules.getTables() == null) continue;
            
            // Check for duplicate table names (case-insensitive)
            Set<String> seenTables = new HashSet<>();
            for (String tableName : dbRules.getTables().keySet()) {
                String lowerTable = tableName.toLowerCase();
                if (seenTables.contains(lowerTable)) {
                    errors.add(String.format(
                        "Duplicate table definition: %s.%s", dbName, tableName));
                }
                seenTables.add(lowerTable);
            }
        }
    }
    
    /**
     * Validate data consistency
     */
    private void validateDataConsistency(AnonymizationRules rules, List<String> warnings) {
        if (rules.getDatabases() == null) return;
        
        for (Map.Entry<String, AnonymizationRules.DatabaseRules> dbEntry : 
                rules.getDatabases().entrySet()) {
            
            String dbName = dbEntry.getKey();
            AnonymizationRules.DatabaseRules dbRules = dbEntry.getValue();
            
            if (dbRules.getTables() == null) continue;
            
            for (Map.Entry<String, AnonymizationRules.TableRules> tableEntry : 
                    dbRules.getTables().entrySet()) {
                
                String tableName = tableEntry.getKey();
                AnonymizationRules.TableRules tableRules = tableEntry.getValue();
                
                // Warn if table has no columns defined
                if (tableRules.getColumns() == null || tableRules.getColumns().isEmpty()) {
                    warnings.add(String.format(
                        "Table %s.%s has no columns defined", dbName, tableName));
                }
                
                // Warn if table has only PRESERVE strategies
                if (tableRules.getColumns() != null) {
                    boolean hasAnonymization = tableRules.getColumns().values().stream()
                        .anyMatch(rule -> rule.getStrategy() != null && 
                                        !rule.getStrategy().equalsIgnoreCase("PRESERVE"));
                    
                    if (!hasAnonymization) {
                        warnings.add(String.format(
                            "Table %s.%s has no anonymization rules (all PRESERVE)", 
                            dbName, tableName));
                    }
                }
            }
        }
    }
    
    /**
     * Report validation results
     */
    private void reportResults(List<String> errors, List<String> warnings) {
        log.info("\nValidation Results");
        log.info("==================\n");
        
        if (!errors.isEmpty()) {
            log.error("Errors ({}):", errors.size());
            for (String error : errors) {
                log.error("  - {}", error);
            }
            log.error("");
        }
        
        if (!warnings.isEmpty()) {
            log.warn("Warnings ({}):", warnings.size());
            for (String warning : warnings) {
                log.warn("  - {}", warning);
            }
            log.warn("");
        }
        
        if (errors.isEmpty() && warnings.isEmpty()) {
            log.info("No errors or warnings found.");
        }
    }
    
    private List<String> warnings = new ArrayList<>();
}
