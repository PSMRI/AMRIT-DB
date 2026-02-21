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

package com.db.piramalswasthya.anonymizer.cli;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.mysql.cj.jdbc.MysqlDataSource;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import lombok.extern.slf4j.Slf4j;

import javax.sql.DataSource;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.*;
import java.util.concurrent.Callable;

/**
 * Schema diff command - compares live DB schema to rules.yaml
 * 
 * Outputs:
 * - Missing tables in rules
 * - Missing columns in rules
 * - Data type mismatches
 * - Suggested rule entries
 */
@Command(
    name = "diff-schema",
    description = "Compare DB schema to rules.yaml and suggest updates",
    mixinStandardHelpOptions = true
)
@Slf4j
public class DiffSchemaCommand implements Callable<Integer> {
    
    @Option(names = {"-c", "--config"}, description = "Config file", defaultValue = "config.yaml")
    private String configFile;
    
    @Option(names = {"-r", "--rules"}, description = "Rules file", defaultValue = "rules.yaml")
    private String rulesFile;
    
    @Option(names = {"-o", "--output"}, description = "Output file for suggested rules (optional)")
    private String outputFile;
    
    @Override
    public Integer call() throws Exception {
        log.info("=== AMRIT DB Anonymization - DIFF SCHEMA Command ===");
        log.info("Config: {}, Rules: {}", configFile, rulesFile);
        
        try {
            // Load configuration and rules
            ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
            AnonymizerConfig config = mapper.readValue(new File(configFile), AnonymizerConfig.class);
            AnonymizationRules rules = mapper.readValue(new File(rulesFile), AnonymizationRules.class);
            
            // Process each schema
            log.info("Connecting to database: {}", config.getSource().getHost());
            boolean anyDifferences = false;
            Map<String, SchemaDiff> allDiffs = new LinkedHashMap<>();
            
            for (String schema : config.getSource().getSchemas()) {
                log.info("\n=== Processing schema: {} ===", schema);
                
                // Create DataSource for this schema
                DataSource dataSource = createDataSource(config.getSource(), schema);
                
                // Query schema from INFORMATION_SCHEMA
                Map<String, Map<String, ColumnInfo>> dbSchema = extractDatabaseSchema(
                    dataSource, schema);
                
                // Compare with rules
                SchemaDiff diff = compareSchemas(schema, dbSchema, rules);
                allDiffs.put(schema, diff);
                
                // Report differences for this schema
                reportDifferences(schema, diff);
                
                if (diff.hasDifferences()) {
                    anyDifferences = true;
                }
            }
            
            // Generate suggested rules if output specified
            if (outputFile != null) {
                generateSuggestedRules(allDiffs, outputFile);
            }
            
            if (anyDifferences) {
                log.warn("\nSchema differences detected. Review output and update rules.yaml");
                return 1;
            } else {
                log.info("\nNo schema differences detected. Rules are up to date.");
                return 0;
            }
            
        } catch (Exception e) {
            log.error("Schema diff failed: {}", e.getMessage(), e);
            return 1;
        }
    }
    
    /**
     * Extract schema from database
     */
    private Map<String, Map<String, ColumnInfo>> extractDatabaseSchema(
            DataSource dataSource, String database) throws Exception {
        
        Map<String, Map<String, ColumnInfo>> schema = new HashMap<>();
        
        try (Connection conn = dataSource.getConnection()) {
            DatabaseMetaData metaData = conn.getMetaData();
            
            // Get all tables
            try (ResultSet tables = metaData.getTables(database, null, "%", 
                    new String[]{"TABLE"})) {
                
                while (tables.next()) {
                    String tableName = tables.getString("TABLE_NAME");
                    Map<String, ColumnInfo> columns = new HashMap<>();
                    
                    // Get columns for this table
                    try (ResultSet cols = metaData.getColumns(database, null, tableName, "%")) {
                        while (cols.next()) {
                            ColumnInfo colInfo = new ColumnInfo();
                            colInfo.columnName = cols.getString("COLUMN_NAME");
                            colInfo.dataType = cols.getString("TYPE_NAME");
                            colInfo.columnSize = cols.getInt("COLUMN_SIZE");
                            colInfo.nullable = cols.getInt("NULLABLE") == DatabaseMetaData.columnNullable;
                            
                            columns.put(colInfo.columnName, colInfo);
                        }
                    }
                    
                    schema.put(tableName, columns);
                    log.debug("Extracted schema for table: {} ({} columns)", tableName, columns.size());
                }
            }
        }
        
        log.info("Extracted schema: {} tables", schema.size());
        return schema;
    }
    
    /**
     * Compare database schema with rules
     */
    private SchemaDiff compareSchemas(String database, 
                                     Map<String, Map<String, ColumnInfo>> dbSchema,
                                     AnonymizationRules rules) {
        
        SchemaDiff diff = new SchemaDiff();
        
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases() != null 
            ? rules.getDatabases().get(database) 
            : null;
        
        if (dbRules == null || dbRules.getTables() == null) {
            // All tables are missing from rules
            dbSchema.keySet().forEach(diff.missingTables::add);
            return diff;
        }
        
        Map<String, AnonymizationRules.TableRules> rulesTables = dbRules.getTables();
        
        // Check for missing tables
        for (String tableName : dbSchema.keySet()) {
            if (!rulesTables.containsKey(tableName)) {
                diff.missingTables.add(tableName);
            }
        }
        
        // Check for missing columns in existing tables
        for (Map.Entry<String, AnonymizationRules.TableRules> entry : rulesTables.entrySet()) {
            String tableName = entry.getKey();
            AnonymizationRules.TableRules tableRules = entry.getValue();
            
            if (!dbSchema.containsKey(tableName)) {
                log.warn("Table {} exists in rules but not in database", tableName);
                continue;
            }
            
            Map<String, ColumnInfo> dbColumns = dbSchema.get(tableName);
            Map<String, AnonymizationRules.ColumnRule> rulesColumns = tableRules.getColumns();
            
            if (rulesColumns == null) {
                rulesColumns = new HashMap<>();
            }
            
            for (Map.Entry<String, ColumnInfo> colEntry : dbColumns.entrySet()) {
                String columnName = colEntry.getKey();
                ColumnInfo colInfo = colEntry.getValue();
                
                if (!rulesColumns.containsKey(columnName)) {
                    diff.missingColumns.computeIfAbsent(tableName, k -> new ArrayList<>())
                        .add(colInfo);
                }
            }
        }
        
        return diff;
    }
    
    /**
     * Report differences to console
     */
    private void reportDifferences(String schemaName, SchemaDiff diff) {
        log.info("\nSchema Drift Analysis - {}", schemaName);
        log.info("=====================\n");
        
        if (!diff.missingTables.isEmpty()) {
            log.info("Missing Tables (in DB, not in rules):");
            for (String table : diff.missingTables) {
                log.info("  - {}", table);
            }
            log.info("");
        }
        
        if (!diff.missingColumns.isEmpty()) {
            log.info("Missing Columns:");
            for (Map.Entry<String, List<ColumnInfo>> entry : diff.missingColumns.entrySet()) {
                log.info("  Table: {}", entry.getKey());
                for (ColumnInfo col : entry.getValue()) {
                    log.info("    - {} ({})", col.columnName, col.dataType);
                }
            }
            log.info("");
        }
        
        if (!diff.hasDifferences()) {
            log.info("No differences found. Schema and rules are in sync.");
        }
    }
    
    /**
     * Generate suggested rules
     */
    private void generateSuggestedRules(Map<String, SchemaDiff> allDiffs, 
                                       String outputPath) throws Exception {
        
        StringBuilder yaml = new StringBuilder();
        yaml.append("# Suggested rule additions based on schema diff\n");
        yaml.append("# Review and merge into rules.yaml\n\n");
        
        for (Map.Entry<String, SchemaDiff> schemaEntry : allDiffs.entrySet()) {
            String schemaName = schemaEntry.getKey();
            SchemaDiff diff = schemaEntry.getValue();
            
            if (!diff.hasDifferences()) {
                continue;
            }
            
            yaml.append("# Schema: ").append(schemaName).append("\n");
            yaml.append("databases:\n");
            yaml.append("  ").append(schemaName).append(":\n");
            yaml.append("    tables:\n");
            
            if (!diff.missingColumns.isEmpty()) {
                yaml.append("      # Missing columns to add:\n");
                for (Map.Entry<String, List<ColumnInfo>> entry : diff.missingColumns.entrySet()) {
                    String tableName = entry.getKey();
                    yaml.append("      ").append(tableName).append(":\n");
                    yaml.append("        columns:\n");
                    
                    for (ColumnInfo col : entry.getValue()) {
                        yaml.append("          ").append(col.columnName).append(":\n");
                        yaml.append("            strategy: PRESERVE  # Review and change if PII\n");
                        yaml.append("            dataType: ").append(col.dataType).append("\n");
                        yaml.append("            piiLevel: UNKNOWN\n");
                    }
                }
            }
            
            if (!diff.missingTables.isEmpty()) {
                yaml.append("      # Missing tables to add:\n");
                for (String table : diff.missingTables) {
                    yaml.append("      ").append(table).append(":\n");
                    yaml.append("        primaryKey: <DEFINE_PRIMARY_KEY>\n");
                    yaml.append("        columns: {}\n");
                    yaml.append("        # Run diff-schema again after defining primary key\n");
                }
            }
            
            yaml.append("\n");
        }
        
        try (FileWriter writer = new FileWriter(outputPath)) {
            writer.write(yaml.toString());
        }
        
        log.info("Suggested rules written to: {}", outputPath);
    }
    
    /**
     * Create MySQL DataSource for specific schema
     */
    private DataSource createDataSource(AnonymizerConfig.DatabaseConfig dbConfig, String schema) {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setServerName(dbConfig.getHost());
        ds.setPort(dbConfig.getPort());
        ds.setDatabaseName(schema);
        ds.setUser(dbConfig.getUsername());
        ds.setPassword(dbConfig.getPassword());
        return ds;
    }
    
    /**
     * Column metadata
     */
    private static class ColumnInfo {
        String columnName;
        String dataType;
        int columnSize;
        boolean nullable;
    }
    
    /**
     * Schema differences
     */
    private static class SchemaDiff {
        List<String> missingTables = new ArrayList<>();
        Map<String, List<ColumnInfo>> missingColumns = new HashMap<>();
        
        boolean hasDifferences() {
            return !missingTables.isEmpty() || !missingColumns.isEmpty();
        }
    }
}
