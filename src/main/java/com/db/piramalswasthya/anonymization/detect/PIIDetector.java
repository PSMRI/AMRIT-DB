package com.db.piramalswasthya.anonymization.detect;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;

import java.io.IOException;
import java.util.*;

/**
 * Detects PII-risk fields using configurable YAML rules and fallback heuristics.
 * Annotates column metadata with PII classifications.
 */
@Slf4j
@Service
public class PIIDetector {
    private List<PIIDetectionRule> rules = new ArrayList<>();
    private PIIDetectionRule defaultClassification;
    
    @PostConstruct
    public void initialize() {
        loadRulesFromYaml();
        log.info("PII Detector initialized with {} rules", rules.size());
    }
    
    /**
     * Load PII detection rules from YAML configuration.
     */
    private void loadRulesFromYaml() {
        try {
            ClassPathResource resource = new ClassPathResource("anonymization/pii-detection-rules.yml");
            ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
            
            PIIRulesConfig config = mapper.readValue(resource.getInputStream(), PIIRulesConfig.class);
            
            this.rules = config.getRules();
            
            // Compile regex patterns
            rules.forEach(PIIDetectionRule::compilePatterns);
            
            // Sort by priority (higher first)
            rules.sort((r1, r2) -> Integer.compare(
                r2.getPriority() != null ? r2.getPriority() : 0,
                r1.getPriority() != null ? r1.getPriority() : 0
            ));
            
            // Set default classification
            if (config.getDefaultClassification() != null) {
                this.defaultClassification = convertToRule(config.getDefaultClassification());
                this.defaultClassification.compilePatterns();
            }
            
        } catch (IOException e) {
            log.error("Failed to load PII detection rules: {}", e.getMessage(), e);
            throw new AnonymizationException("Failed to initialize PII detector", e);
        }
    }
    
    /**
     * Annotate all columns in the schema catalog with PII classifications.
     *
     * @param catalog Schema catalog to annotate
     */
    public void annotatePII(SchemaCatalog catalog) {
        log.info("Starting PII detection across all databases");
        
        for (DatabaseMetadata db : catalog.getDatabases()) {
            for (TableMetadata table : db.getTables()) {
                for (ColumnMetadata column : table.getColumns()) {
                    classifyColumn(column, table.getName());
                }
            }
        }
        
        log.info("PII detection completed: {} total PII columns identified", 
            catalog.getTotalPiiColumnCount());
    }
    
    /**
     * Classify a single column using detection rules.
     *
     * @param column Column to classify
     * @param tableName Table name for context
     */
    private void classifyColumn(ColumnMetadata column, String tableName) {
        // Try matching against rules in priority order
        for (PIIDetectionRule rule : rules) {
            if (rule.matches(column.getName(), tableName, column.getDataType())) {
                applyRuleToColumn(column, rule);
                return;
            }
        }
        
        // No rule matched - try fallback heuristics first
        // This allows common patterns (like primary key IDs) to be classified before default
        PIICategory heuristicCategory = applyFallbackClassificationAndReturn(column, tableName);
        
        // If heuristic didn't find a match (returned UNKNOWN), apply default classification from YAML
        if (heuristicCategory == PIICategory.UNKNOWN && defaultClassification != null) {
            applyRuleToColumn(column, defaultClassification);
        }
    }
    
    /**
     * Apply a detection rule to a column.
     */
    private void applyRuleToColumn(ColumnMetadata column, PIIDetectionRule rule) {
        column.setPiiCategory(rule.getPiiCategory());
        column.setRiskLevel(rule.getRiskLevel());
        column.setDetectionRationale(rule.getRationale());
        column.setProposedRuleId(rule.getSuggestedRuleId());
    }
    
    /**
     * Fallback heuristic classification if no YAML rule matches.
     * Uses simple keyword matching on normalized column names.
     * Returns the category assigned for decision-making by caller.
     */
    private PIICategory applyFallbackClassificationAndReturn(ColumnMetadata column, String tableName) {
        String normalizedName = column.getName().toLowerCase();
        
        // Check for common PII patterns not in YAML
        if (normalizedName.contains("username") || normalizedName.contains("login")) {
            column.setPiiCategory(PIICategory.PERSONAL_IDENTIFIER);
            column.setRiskLevel(RiskLevel.HIGH);
            column.setDetectionRationale("Fallback: Username pattern detected");
            column.setProposedRuleId("FAKE_USERNAME");
            return PIICategory.PERSONAL_IDENTIFIER;
        } else if (normalizedName.contains("password") || normalizedName.contains("secret")) {
            column.setPiiCategory(PIICategory.METADATA);
            column.setRiskLevel(RiskLevel.CRITICAL);
            column.setDetectionRationale("Fallback: Credential field detected");
            column.setProposedRuleId("HASH_CREDENTIAL");
            return PIICategory.METADATA;
        } else if (normalizedName.contains("token") || normalizedName.contains("session")) {
            column.setPiiCategory(PIICategory.METADATA);
            column.setRiskLevel(RiskLevel.MEDIUM);
            column.setDetectionRationale("Fallback: Token/session field detected");
            column.setProposedRuleId("REGENERATE_TOKEN");
            return PIICategory.METADATA;
        } else if (normalizedName.contains("id") && Boolean.TRUE.equals(column.getPrimaryKey())) {
            column.setPiiCategory(PIICategory.NON_PII);
            column.setRiskLevel(RiskLevel.NONE);
            column.setDetectionRationale("Fallback: Primary key ID (non-PII)");
            column.setProposedRuleId("RETAIN");
            return PIICategory.NON_PII;
        } else {
            // Unknown - mark for manual review
            column.setPiiCategory(PIICategory.UNKNOWN);
            column.setRiskLevel(RiskLevel.NONE);
            column.setDetectionRationale("No rule matched - requires manual review");
            column.setProposedRuleId("TBD");
            return PIICategory.UNKNOWN;
        }
    }
    
    /**
     * Convert default classification configuration to a PIIDetectionRule.
     */
    private PIIDetectionRule convertToRule(Map<String, Object> config) {
        PIIDetectionRule rule = new PIIDetectionRule();
        rule.setRuleId("DEFAULT");
        rule.setPiiCategory(PIICategory.valueOf((String) config.get("piiCategory")));
        rule.setRiskLevel(RiskLevel.valueOf((String) config.get("riskLevel")));
        rule.setSuggestedRuleId((String) config.get("suggestedRuleId"));
        rule.setRationale((String) config.get("rationale"));
        return rule;
    }
    
    /**
     * YAML configuration structure.
     */
    @Data
    private static class PIIRulesConfig {
        private List<PIIDetectionRule> rules;
        private Map<String, Object> defaultClassification;
    }
}
