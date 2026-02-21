/*
* AMRIT – Accessible Medical Records via Integrated Technology 
* Integrated EHR (Electronic Health Records) Solution 
*
* Copyright (C) "Piramal Swasthya Management and Research Institute" 
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/
package com.db.piramalswasthya.anonymizer;

import com.db.piramalswasthya.anonymizer.cli.*;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import lombok.extern.slf4j.Slf4j;

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
        DiffSchemaCommand.class
    }
)
@Slf4j
public class AmritDbAnonymizer implements Runnable {

    @Override
    public void run() {
        log.info("AMRIT DB Anonymization Tool v2.0.0");
        log.info("");
        log.info("Commands:");
        log.info("  run           - Execute anonymization (DB1 → DB2)");
        log.info("  diff-schema   - Compare DB schema to rules.yaml");
        log.info("");
        log.info("Use --help with any command for details");
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new AmritDbAnonymizer()).execute(args);
        System.exit(exitCode);
    }
}
