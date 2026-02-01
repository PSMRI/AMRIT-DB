package com.db.piramalswasthya.anonymization.phase1.cli;

import com.db.piramalswasthya.anonymization.phase1.detect.PIIDetector;
import com.db.piramalswasthya.anonymization.phase1.export.ArtifactExporter;
import com.db.piramalswasthya.anonymization.phase1.model.*;
import com.db.piramalswasthya.anonymization.phase1.registry.RegistryGenerator;
import com.db.piramalswasthya.anonymization.phase1.scan.DatabaseSchemaAnalyzer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.time.Instant;
import java.util.*;

/**
 * CLI runner for Phase 1 anonymization analysis.
 * Activated via --spring.profiles.active=analyzer or --analyze-schema flag.
 */
@Slf4j
@Component
@ConditionalOnProperty(
    prefix = "anonymization.analyzer",
    name = "enabled",
    havingValue = "true",
    matchIfMissing = false
)
public class AnalyzerRunner implements ApplicationRunner {
    
    private static final String TOOL_VERSION = "1.0.0-PHASE1";
    private static final String DEFAULT_OUTPUT_DIR = "docs/phase1-outputs";
    
    @Autowired
    @Qualifier("dbiemrDataSource")
    private DataSource dbiemrDataSource;
    
    @Autowired
    @Qualifier("dbidentityDataSource")
    private DataSource dbidentityDataSource;
    
    @Autowired
    @Qualifier("dbreportingDataSource")
    private DataSource dbreportingDataSource;
    
    @Autowired
    @Qualifier("db1097identityDataSource")
    private DataSource db1097identityDataSource;
    
    @Autowired
    private DatabaseSchemaAnalyzer schemaAnalyzer;
    
    @Autowired
    private PIIDetector piiDetector;
    
    @Autowired
    private RegistryGenerator registryGenerator;
    
    @Autowired
    private ArtifactExporter artifactExporter;
    
    @Override
    public void run(ApplicationArguments args) throws Exception {
        log.info("===== AMRIT Anonymization Phase 1 Analyzer =====");
        log.info("Tool Version: {}", TOOL_VERSION);
        log.info("Started at: {}", Instant.now());
        
        // Parse CLI arguments
        String outputDir = getOutputDirectory(args);
        Set<String> databasesToAnalyze = getDatabaseSelection(args);
        boolean skipExport = args.containsOption("skip-export");
        
        artifactExporter.ensureOutputDirectory(outputDir);
        
        // Step 1: Schema Analysis
        log.info("Step 1: Analyzing database schemas...");
        SchemaCatalog catalog = analyzeDatabases(databasesToAnalyze);
        
        // Step 2: PII Detection
        log.info("Step 2: Detecting PII fields...");
        piiDetector.annotatePII(catalog);
        
        // Step 3: Generate Registry
        log.info("Step 3: Generating anonymization registry...");
        String flywayVersion = args.getOptionValues("flyway-version") != null ? 
            args.getOptionValues("flyway-version").get(0) : "UNKNOWN";
        AnonymizationRegistry registry = registryGenerator.generateRegistry(
            catalog, TOOL_VERSION, flywayVersion);
        
        // Step 4: Export Artifacts
        if (!skipExport) {
            log.info("Step 4: Exporting Phase 1 artifacts...");
            exportAllArtifacts(catalog, registry, outputDir);
        }
        
        // Summary
        printSummary(catalog, registry, outputDir);
        
        log.info("===== Phase 1 Analysis Complete =====");
        log.info("Output directory: {}", outputDir);
        
        // Exit successfully
        System.exit(0);
    }
    
    /**
     * Analyze selected databases and build schema catalog.
     */
    private SchemaCatalog analyzeDatabases(Set<String> databasesToAnalyze) {
        SchemaCatalog catalog = SchemaCatalog.builder()
            .version("1.0")
            .generatedAt(Instant.now())
            .toolVersion(TOOL_VERSION)
            .build();
        
        if (databasesToAnalyze.contains("db_identity")) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(dbidentityDataSource, "db_identity");
            catalog.getDatabases().add(dbMeta);
        }
        
        if (databasesToAnalyze.contains("db_1097_identity")) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(db1097identityDataSource, "db_1097_identity");
            catalog.getDatabases().add(dbMeta);
        }
        
        if (databasesToAnalyze.contains("db_iemr")) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(dbiemrDataSource, "db_iemr");
            catalog.getDatabases().add(dbMeta);
        }
        
        if (databasesToAnalyze.contains("db_reporting")) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(dbreportingDataSource, "db_reporting");
            catalog.getDatabases().add(dbMeta);
        }
        
        return catalog;
    }
    
    /**
     * Export all Phase 1 artifacts.
     */
    private void exportAllArtifacts(SchemaCatalog catalog, AnonymizationRegistry registry, String outputDir) {
        artifactExporter.exportSchemaCatalog(catalog, outputDir);
        artifactExporter.exportPIIInventoryCSV(catalog, outputDir);
        artifactExporter.exportAnonymizationStrategyMap(catalog, outputDir);
        artifactExporter.exportRegistry(registry, outputDir);
        artifactExporter.exportConstraintGraphHTML(catalog, outputDir);
        artifactExporter.exportPIICoverageReport(catalog, outputDir);
    }
    
    /**
     * Print summary statistics.
     */
    private void printSummary(SchemaCatalog catalog, AnonymizationRegistry registry, String outputDir) {
        log.info("\n===== ANALYSIS SUMMARY =====");
        log.info("Databases analyzed: {}", catalog.getDatabases().size());
        log.info("Total tables: {}", catalog.getTotalTableCount());
        log.info("Total PII columns: {}", catalog.getTotalPiiColumnCount());
        
        for (DatabaseMetadata db : catalog.getDatabases()) {
            log.info("  - {}: {} tables, {} PII columns", 
                db.getDatabaseName(), 
                db.getTables().size(), 
                db.getTotalPiiColumnCount());
        }
        
        log.info("\nArtifacts generated in: {}", outputDir);
        log.info("  1. schema-catalog.json");
        log.info("  2. pii-field-inventory.csv");
        log.info("  3. anonymization-strategy-map.json");
        log.info("  4. anonymization-registry.json (PRIMARY)");
        log.info("  5. constraint-dependency-graph.html");
        log.info("  6. pii-coverage-report.json");
    }
    
    /**
     * Get output directory from CLI args or use default.
     */
    private String getOutputDirectory(ApplicationArguments args) {
        if (args.containsOption("output-dir")) {
            return args.getOptionValues("output-dir").get(0);
        }
        return DEFAULT_OUTPUT_DIR;
    }
    
    /**
     * Get database selection from CLI args or analyze all.
     */
    private Set<String> getDatabaseSelection(ApplicationArguments args) {
        Set<String> databases = new HashSet<>();
        
        if (args.containsOption("dbs")) {
            String dbList = args.getOptionValues("dbs").get(0);
            databases.addAll(Arrays.asList(dbList.split(",")));
        } else {
            // Default: analyze all databases
            databases.add("db_identity");
            databases.add("db_1097_identity");
            databases.add("db_iemr");
            databases.add("db_reporting");
        }
        
        log.info("Selected databases: {}", databases);
        return databases;
    }
}
