package com.db.piramalswasthya.anonymization.cli;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.lookup.H2LookupManager;
import com.db.piramalswasthya.anonymization.processor.transformer.DumpAnonymizer;
import com.db.piramalswasthya.anonymization.processor.parser.InsertStatementParser;
import com.db.piramalswasthya.anonymization.registry.AnonymizationRegistryService;
import com.db.piramalswasthya.anonymization.executor.strategy.StrategyFactory;
import com.db.piramalswasthya.anonymization.executor.strategy.AnonymizationStrategy;
import com.db.piramalswasthya.anonymization.executor.strategy.impl.*;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

/**
 * Command-line interface for AMRIT Database Anonymization Tool.
 * 
 * Usage:
 * java -jar amrit-anonymizer.jar anonymize --input prod.sql --output uat.sql
 * 
 * This tool processes SQL dump files and anonymizes sensitive data according to
 * the rules defined in the anonymization registry.
 */
@Command(
    name = "amrit-anonymizer",
    version = "1.0.0",
    description = "AMRIT Database Anonymization Tool - Anonymize SQL dumps for safe UAT testing",
    mixinStandardHelpOptions = true,
    subcommands = {DumpAnonymizerCLI.AnonymizeCommand.class}
)
public class DumpAnonymizerCLI implements Callable<Integer> {

    @Override
    public Integer call() {
        System.out.println("AMRIT Database Anonymization Tool v1.0.0");
        System.out.println("Use --help for usage information");
        System.out.println();
        System.out.println("Available commands:");
        System.out.println("  anonymize  - Anonymize a SQL dump file");
        return 0;
    }

    /**
     * Main anonymization command.
     */
    @Command(
        name = "anonymize",
        description = "Anonymize a SQL dump file",
        mixinStandardHelpOptions = true
    )
    static class AnonymizeCommand implements Callable<Integer> {

        @Option(
            names = {"-i", "--input"},
            description = "Input SQL dump file (required)",
            required = true
        )
        private String inputFile;

        @Option(
            names = {"-o", "--output"},
            description = "Output anonymized SQL dump file (required)",
            required = true
        )
        private String outputFile;

        @Option(
            names = {"-r", "--registry"},
            description = "Anonymization registry YAML file (default: classpath:anonymization-registry.yml)"
        )
        private String registryFile;

        @Option(
            names = {"-l", "--lookup"},
            description = "H2 lookup database path (default: ./lookup-cache)"
        )
        private String lookupDbPath = "./lookup-cache";

        @Option(
            names = {"-s", "--salt"},
            description = "Salt for hashing (REQUIRED for security - use: openssl rand -hex 32)",
            required = true
        )
        private String salt;

        @Option(
            names = {"--dry-run"},
            description = "Dry run mode - validate inputs without processing"
        )
        private boolean dryRun = false;

        @Option(
            names = {"-v", "--verbose"},
            description = "Verbose output"
        )
        private boolean verbose = false;

        @Override
        public Integer call() {
            Instant startTime = Instant.now();
            
            try {
                // Validate inputs
                System.out.println("========================================");
                System.out.println("AMRIT Database Anonymization Tool");
                System.out.println("========================================");
                System.out.println();
                
                if (!validateInputs()) {
                    return 1;
                }
                
                // Validate salt security
                if (!validateSalt()) {
                    return 1;
                }

                if (dryRun) {
                    System.out.println("[DRY RUN] All validations passed. Exiting.");
                    return 0;
                }

                System.out.println("Initializing anonymization components...");
                AnonymizationRegistryService registryService = loadRegistry();
                if (verbose) {
                    System.out.println("  Registry loaded: " + registryService.getTotalRulesCount() + " rules");
                }

                // Initialize strategies
                List<AnonymizationStrategy> strategyList = new ArrayList<>();
                strategyList.add(new PreserveStrategy());
                strategyList.add(new SuppressStrategy());
                strategyList.add(new HashSha256Strategy());
                strategyList.add(new PartialMaskStrategy());
                strategyList.add(new GeneralizeStrategy());
                strategyList.add(new RandomFakeDataStrategy());
                
                StrategyFactory strategyFactory = new StrategyFactory(strategyList);
                if (verbose) {
                    System.out.println("  Strategies registered: " + strategyList.size());
                }

                // Initialize lookup database
                H2LookupManager lookupManager = new H2LookupManager(
                    Paths.get(lookupDbPath),
                    salt
                );
                if (verbose) {
                    System.out.println("  Lookup database initialized: " + lookupManager.getLookupCount() + " cached entries");
                }
                
                // Initialize parser
                InsertStatementParser parser = new InsertStatementParser();

                // Create anonymizer
                DumpAnonymizer anonymizer = new DumpAnonymizer(
                    registryService,
                    strategyFactory,
                    parser
                );

                System.out.println();
                System.out.println("Starting anonymization...");
                System.out.println("  Input:  " + inputFile);
                System.out.println("  Output: " + outputFile);
                System.out.println();

                // Process dump
                Path inputPath = Paths.get(inputFile);
                Path outputPath = Paths.get(outputFile);

                anonymizer.anonymizeDump(inputPath, outputPath);

                // Calculate duration
                Duration duration = Duration.between(startTime, Instant.now());
                long seconds = duration.getSeconds();
                long minutes = seconds / 60;
                long remainingSeconds = seconds % 60;

                // Show results
                System.out.println();
                System.out.println("========================================");
                System.out.println("Anonymization Complete!");
                System.out.println("========================================");
                System.out.println("  Time taken: " + minutes + "m " + remainingSeconds + "s");
                System.out.println("  Output file: " + outputPath.toAbsolutePath());
                System.out.println();
                System.out.println("The anonymized dump is ready for UAT deployment.");

                // Cleanup
                lookupManager.close();

                return 0;

            } catch (AnonymizationException e) {
                System.err.println();
                System.err.println("ERROR: Anonymization failed");
                System.err.println("Reason: " + e.getMessage());
                if (verbose && e.getCause() != null) {
                    System.err.println("Cause: " + e.getCause().getMessage());
                    e.printStackTrace();
                }
                return 1;

            } catch (Exception e) {
                System.err.println();
                System.err.println("ERROR: Unexpected error occurred");
                System.err.println("Message: " + e.getMessage());
                if (verbose) {
                    e.printStackTrace();
                }
                return 2;
            }
        }

        /**
         * Validate salt security requirements.
         */
        private boolean validateSalt() {
            System.out.println("Validating salt security...");
            
            if (salt == null || salt.trim().isEmpty()) {
                System.err.println("  ERROR: Salt cannot be empty");
                return false;
            }
            
            if (salt.length() < 32) {
                System.err.println("  ERROR: Salt must be at least 32 characters for security");
                System.err.println("  Current length: " + salt.length());
                System.err.println("  Generate a secure salt: openssl rand -hex 32");
                return false;
            }
            
            // Check for weak default salts
            String[] weakSalts = {
                "AMRIT_2024_SECURE_SALT",
                "default",
                "password",
                "secret",
                "salt",
                "12345678",
                "test"
            };
            
            for (String weak : weakSalts) {
                if (salt.toLowerCase().contains(weak.toLowerCase())) {
                    System.err.println("  ERROR: Detected weak/default salt pattern");
                    System.err.println("  Generate a secure salt: openssl rand -hex 32");
                    return false;
                }
            }
            
            System.out.println("  Salt validation passed (length: " + salt.length() + " characters)");
            System.out.println();
            return true;
        }
        
        /**
         * Validate all input parameters and files.
         */
        private boolean validateInputs() {
            System.out.println("Validating inputs...");
            boolean valid = true;

            // Check input file exists
            Path inputPath = Paths.get(inputFile);
            if (!Files.exists(inputPath)) {
                System.err.println("  ERROR: Input file not found: " + inputFile);
                valid = false;
            } else if (!Files.isReadable(inputPath)) {
                System.err.println("  ERROR: Input file not readable: " + inputFile);
                valid = false;
            } else {
                try {
                    long sizeBytes = Files.size(inputPath);
                    double sizeMB = sizeBytes / (1024.0 * 1024.0);
                    System.out.println("  Input file: " + inputFile + " (" + String.format("%.2f", sizeMB) + " MB, " + sizeBytes + " bytes)");
                } catch (Exception e) {
                    System.err.println("  WARNING: Could not read input file size: " + e.getMessage());
                }
            }

            // Check output file can be created
            Path outputPath = Paths.get(outputFile);
            Path outputParent = outputPath.getParent();
            if (outputParent != null && !Files.exists(outputParent)) {
                try {
                    Files.createDirectories(outputParent);
                    System.out.println("  Created output directory: " + outputParent);
                } catch (Exception e) {
                    System.err.println("  ERROR: Cannot create output directory: " + outputParent);
                    valid = false;
                }
            }

            if (Files.exists(outputPath)) {
                System.out.println("  WARNING: Output file exists and will be overwritten: " + outputFile);
            }

            // Check registry file
            if (registryFile != null) {
                Path registryPath = Paths.get(registryFile);
                if (!Files.exists(registryPath)) {
                    System.err.println("  ERROR: Registry file not found: " + registryFile);
                    valid = false;
                } else {
                    System.out.println("  Registry file: " + registryFile);
                }
            } else {
                System.out.println("  Registry: Using default (classpath:anonymization-registry.yml)");
            }

            System.out.println();

            if (!valid) {
                System.err.println("Validation failed. Please fix the errors and try again.");
            }

            return valid;
        }

        /**
         * Load the anonymization registry.
         */
        private AnonymizationRegistryService loadRegistry() throws AnonymizationException {
            try {
                AnonymizationRegistryService service = new AnonymizationRegistryService();
                
                if (registryFile != null) {
                    // Load from file
                    service.loadRegistryFromFile(Paths.get(registryFile));
                } else {
                    // Load from classpath
                    service.loadRegistry();
                }
                
                return service;
                
            } catch (Exception e) {
                throw new AnonymizationException("Failed to load anonymization registry", e);
            }
        }
    }

    /**
     * Main entry point.
     */
    public static void main(String[] args) {
        int exitCode = new CommandLine(new DumpAnonymizerCLI()).execute(args);
        System.exit(exitCode);
    }
}
