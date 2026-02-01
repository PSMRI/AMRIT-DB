package com.db.piramalswasthya.anonymization.phase1.registry;

import com.db.piramalswasthya.anonymization.phase1.model.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Instant;
import java.util.*;

/**
 * Generates the Anonymization Registry from schema catalog.
 * Includes schema hashing for drift detection.
 */
@Slf4j
@Service
public class RegistryGenerator {
    
    private final SchemaHasher schemaHasher;
    
    public RegistryGenerator(SchemaHasher schemaHasher) {
        this.schemaHasher = schemaHasher;
    }
    
    /**
     * Generate the anonymization registry from analyzed schema.
     *
     * @param catalog Analyzed schema catalog with PII annotations
     * @param toolVersion Version of the analyzer tool
     * @param flywayVersion Current Flyway schema version
     * @return Complete anonymization registry
     */
    public AnonymizationRegistry generateRegistry(SchemaCatalog catalog, String toolVersion, 
                                                   String flywayVersion) {
        log.info("Generating anonymization registry from schema catalog");
        
        AnonymizationRegistry registry = AnonymizationRegistry.builder()
            .version("1.0")
            .lastUpdated(Instant.now())
            .schemaVersion(flywayVersion)
            .toolVersion(toolVersion)
            .piiRiskThreshold("MEDIUM")
            .build();
        
        // Set PII risk level descriptions
        registry.setPiiRiskLevels(createRiskLevelDescriptions());
        
        // Process each database
        for (DatabaseMetadata db : catalog.getDatabases()) {
            AnonymizationRegistry.DatabaseRegistry dbRegistry = generateDatabaseRegistry(db);
            registry.getDatabases().put(db.getDatabaseName(), dbRegistry);
        }
        
        log.info("Registry generation complete: {} databases processed", registry.getDatabases().size());
        
        return registry;
    }
    
    /**
     * Generate registry for a single database.
     */
    private AnonymizationRegistry.DatabaseRegistry generateDatabaseRegistry(DatabaseMetadata db) {
        AnonymizationRegistry.DatabaseRegistry dbRegistry = AnonymizationRegistry.DatabaseRegistry.builder()
            .schemaHash(schemaHasher.computeDatabaseHash(db))
            .build();
        
        for (TableMetadata table : db.getTables()) {
            AnonymizationRegistry.TableRegistry tableRegistry = generateTableRegistry(table);
            dbRegistry.getTables().put(table.getName(), tableRegistry);
        }
        
        return dbRegistry;
    }
    
    /**
     * Generate registry for a single table.
     */
    private AnonymizationRegistry.TableRegistry generateTableRegistry(TableMetadata table) {
        AnonymizationRegistry.TableRegistry tableRegistry = AnonymizationRegistry.TableRegistry.builder()
            .canonicalName(table.getCanonicalName())
            .aliases(new ArrayList<>(table.getAliases()))
            .build();
        
        for (ColumnMetadata column : table.getColumns()) {
            AnonymizationRegistry.ColumnRegistry columnRegistry = generateColumnRegistry(column);
            tableRegistry.getColumns().put(column.getName(), columnRegistry);
        }
        
        return tableRegistry;
    }
    
    /**
     * Generate registry entry for a single column.
     */
    private AnonymizationRegistry.ColumnRegistry generateColumnRegistry(ColumnMetadata column) {
        return AnonymizationRegistry.ColumnRegistry.builder()
            .canonicalName(column.getCanonicalName())
            .dataType(column.getDataType())
            .nullable(column.getNullable())
            .piiRisk(mapRiskLevelToString(column.getRiskLevel()))
            .anonymizationRule(column.getProposedRuleId() != null ? column.getProposedRuleId() : "TBD")
            .aliases(new ArrayList<>(column.getAliases()))
            .addedInMigration(column.getAddedInMigration())
            .renamedFrom(column.getRenamedFrom())
            .build();
    }
    
    /**
     * Map RiskLevel enum to string for registry.
     */
    private String mapRiskLevelToString(RiskLevel riskLevel) {
        if (riskLevel == null) {
            return "NONE";
        }
        
        switch (riskLevel) {
            case CRITICAL:
                return "CRITICAL";
            case HIGH:
                return "HIGH";
            case MEDIUM:
                return "MEDIUM";
            case LOW:
                return "LOW";
            case LINKING_KEY:
                return "LINKING_KEY";
            case NONE:
            default:
                return "NONE";
        }
    }
    
    /**
     * Create PII risk level descriptions for the registry.
     */
    private Map<String, String> createRiskLevelDescriptions() {
        Map<String, String> descriptions = new LinkedHashMap<>();
        descriptions.put("CRITICAL", "Direct PII (name, phone, Aadhar) - MUST anonymize");
        descriptions.put("HIGH", "Indirect identifiers (email, address) - MUST anonymize");
        descriptions.put("MEDIUM", "Health data (diagnosis, prescriptions) - MUST anonymize");
        descriptions.put("LINKING_KEY", "Cross-table linkage (BenRegID) - MUST remap consistently");
        descriptions.put("LOW", "Metadata (timestamps, status codes) - MAY retain");
        descriptions.put("NONE", "Non-sensitive data - RETAIN");
        return descriptions;
    }
}
