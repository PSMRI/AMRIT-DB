package com.db.piramalswasthya.anonymizer;

import com.db.piramalswasthya.anonymizer.cli.*;
import picocli.CommandLine;
import picocli.CommandLine.Command;

/**
 * AMRIT Database Anonymization Tool - Main Entry Point
 * 
 * Connects directly to DB1 (read replica), streams data with keyset pagination,
 * anonymizes using HMAC-based deterministic strategies, and outputs to SQL dump or DB2.
 * 
 * NON-NEGOTIABLE SAFETY:
 * - Refuses to run against production databases without explicit allowlist
 * - PII-safe logging (no raw sensitive data in logs)
 * - Keyset pagination only (no OFFSET queries)
 * - Deterministic HMAC-based anonymization
 * 
 * @version 2.0.0
 * @since 2026-02-05
 */
@Command(
    name = "amrit-db-anonymize",
    version = "2.0.0",
    description = "AMRIT Database Anonymization Tool - Production-safe DB anonymization with streaming",
    mixinStandardHelpOptions = true,
    subcommands = {
        RunCommand.class,
        DiffSchemaCommand.class,
        ValidateRulesCommand.class
    }
)
public class AmritDbAnonymizer implements Runnable {

    @Override
    public void run() {
        System.out.println("AMRIT DB Anonymization Tool v2.0.0");
        System.out.println();
        System.out.println("Commands:");
        System.out.println("  run           - Execute anonymization (DB1 → Output)");
        System.out.println("  diff-schema   - Compare DB schema to rules.yaml");
        System.out.println("  validate-rules - Validate rules.yaml structure");
        System.out.println();
        System.out.println("Use --help with any command for details");
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new AmritDbAnonymizer()).execute(args);
        System.exit(exitCode);
    }
}
