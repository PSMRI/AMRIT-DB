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
    
    // Database name constants
    private static final String DB_IDENTITY = "db_identity";
    private static final String DB_1097_IDENTITY = "db_1097_identity";
    private static final String DB_IEMR = "db_iemr";
    private static final String DB_REPORTING = "db_reporting";
    
    // Step message constants (extracted to reduce cognitive complexity)
    private static final String STEP_1_ANALYZING = "Step 1: Analyzing database schemas...";
    private static final String STEP_2_DETECTING = "Step 2: Detecting PII fields...";
    private static final String STEP_3_GENERATING = "Step 3: Generating anonymization registry...";
    private static final String STEP_4_EXPORTING = "Step 4: Exporting Phase 1 artifacts...";
    private static final String ANALYSIS_COMPLETE = "===== Phase 1 Analysis Complete =====";
    private static final String OUTPUT_DIRECTORY_PREFIX = "Output directory: ";
    private static final String REGISTRY_PRIMARY = "anonymization-registry.json (PRIMARY)";
    
    // Dependencies injected via constructor (preferred over field injection)
    private final DataSource dbiemrDataSource;
    private final DataSource dbidentityDataSource;
    private final DataSource dbreportingDataSource;
    private final DataSource db1097identityDataSource;
    private final DatabaseSchemaAnalyzer schemaAnalyzer;
    private final PIIDetector piiDetector;
    private final RegistryGenerator registryGenerator;
    private final ArtifactExporter artifactExporter;
    
    /**
     * Constructor injection for all dependencies.
     */
    public AnalyzerRunner(
            @Qualifier("dbiemrDataSource") DataSource dbiemrDataSource,
            @Qualifier("dbidentityDataSource") DataSource dbidentityDataSource,
            @Qualifier("dbreportingDataSource") DataSource dbreportingDataSource,
            @Qualifier("db1097identityDataSource") DataSource db1097identityDataSource,
            DatabaseSchemaAnalyzer schemaAnalyzer,
            PIIDetector piiDetector,
            RegistryGenerator registryGenerator,
            ArtifactExporter artifactExporter) {
        this.dbiemrDataSource = dbiemrDataSource;
        this.dbidentityDataSource = dbidentityDataSource;
        this.dbreportingDataSource = dbreportingDataSource;
        this.db1097identityDataSource = db1097identityDataSource;
        this.schemaAnalyzer = schemaAnalyzer;
        this.piiDetector = piiDetector;
        this.registryGenerator = registryGenerator;
        this.artifactExporter = artifactExporter;
    }
    
    @Override
    public void run(ApplicationArguments args) throws Exception {
        logInitialization();
        AnalysisConfig config = initializeAnalysisConfig(args);
        
        SchemaCatalog catalog = performSchemaAnalysis(config.databasesToAnalyze);
        AnonymizationRegistry registry = performPIIDetectionAndRegistryGeneration(catalog, config.flywayVersion);
        
        if (!config.skipExport) {
            performArtifactExport(catalog, registry, config.outputDir);
        }

        printSummary(catalog, registry, config.outputDir);
        logCompletion(config.outputDir);
        System.exit(0);
    }
    
    private void logInitialization() {
        log.info("===== AMRIT Anonymization Phase 1 Analyzer =====");
        log.info("Tool Version: {}", TOOL_VERSION);
        log.info("Started at: {}", Instant.now());
    }
    
    private AnalysisConfig initializeAnalysisConfig(ApplicationArguments args) {
        String outputDir = getOutputDirectory(args);
        Set<String> databasesToAnalyze = getDatabaseSelection(args);
        boolean skipExport = args.containsOption("skip-export");
        String flywayVersion = extractFlywayVersion(args);
        
        artifactExporter.ensureOutputDirectory(outputDir);
        
        return new AnalysisConfig(outputDir, databasesToAnalyze, skipExport, flywayVersion);
    }
    
    private String extractFlywayVersion(ApplicationArguments args) {
        return args.getOptionValues("flyway-version") != null ? 
            args.getOptionValues("flyway-version").get(0) : "UNKNOWN";
    }
    
    private SchemaCatalog performSchemaAnalysis(Set<String> databasesToAnalyze) {
        log.info(STEP_1_ANALYZING);
        return analyzeDatabases(databasesToAnalyze);
    }
    
    private AnonymizationRegistry performPIIDetectionAndRegistryGeneration(
            SchemaCatalog catalog, String flywayVersion) {
        log.info(STEP_2_DETECTING);
        piiDetector.annotatePII(catalog);

        log.info(STEP_3_GENERATING);
        return registryGenerator.generateRegistry(catalog, TOOL_VERSION, flywayVersion);
    }
    
    private void performArtifactExport(SchemaCatalog catalog, AnonymizationRegistry registry, String outputDir) {
        log.info(STEP_4_EXPORTING);
        exportAllArtifacts(catalog, registry, outputDir);
    }
    
    private void logCompletion(String outputDir) {
        log.info(ANALYSIS_COMPLETE);
        log.info(OUTPUT_DIRECTORY_PREFIX + "{}", outputDir);
    }
    
    private static class AnalysisConfig {
        final String outputDir;
        final Set<String> databasesToAnalyze;
        final boolean skipExport;
        final String flywayVersion;
        
        AnalysisConfig(String outputDir, Set<String> databasesToAnalyze, 
                      boolean skipExport, String flywayVersion) {
            this.outputDir = outputDir;
            this.databasesToAnalyze = databasesToAnalyze;
            this.skipExport = skipExport;
            this.flywayVersion = flywayVersion;
        }
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
        
        if (databasesToAnalyze.contains(DB_IDENTITY)) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(dbidentityDataSource, DB_IDENTITY);
            catalog.getDatabases().add(dbMeta);
        }
        
        if (databasesToAnalyze.contains(DB_1097_IDENTITY)) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(db1097identityDataSource, DB_1097_IDENTITY);
            catalog.getDatabases().add(dbMeta);
        }
        
        if (databasesToAnalyze.contains(DB_IEMR)) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(dbiemrDataSource, DB_IEMR);
            catalog.getDatabases().add(dbMeta);
        }
        
        if (databasesToAnalyze.contains(DB_REPORTING)) {
            DatabaseMetadata dbMeta = schemaAnalyzer.analyzeDatabase(dbreportingDataSource, DB_REPORTING);
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
        log.info("  4. {}", REGISTRY_PRIMARY);
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
            databases.add(DB_IDENTITY);
            databases.add(DB_1097_IDENTITY);
            databases.add(DB_IEMR);
            databases.add(DB_REPORTING);
        }
        
        log.info("Selected databases: {}", databases);
        return databases;
    }
}
