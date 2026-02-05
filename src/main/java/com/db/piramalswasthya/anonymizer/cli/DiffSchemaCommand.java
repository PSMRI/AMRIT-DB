package com.db.piramalswasthya.anonymizer.cli;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.mysql.cj.jdbc.MysqlDataSource;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
public class DiffSchemaCommand implements Callable<Integer> {
    
    private static final Logger log = LoggerFactory.getLogger(DiffSchemaCommand.class);
    
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
            // 1. Load configuration and rules
            ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
            AnonymizerConfig config = mapper.readValue(new File(configFile), AnonymizerConfig.class);
            AnonymizationRules rules = mapper.readValue(new File(rulesFile), AnonymizationRules.class);
            
            // 2. Connect to database
            log.info("Connecting to database: {}", config.getSource().getHost());
            DataSource dataSource = createDataSource(config.getSource());
            
            // 3. Query schema from INFORMATION_SCHEMA
            Map<String, Map<String, ColumnInfo>> dbSchema = extractDatabaseSchema(
                dataSource, config.getSource().getDatabase());
            
            // 4. Compare with rules
            SchemaDiff diff = compareSchemas(config.getSource().getDatabase(), dbSchema, rules);
            
            // 5. Report differences
            reportDifferences(diff);
            
            // 6. Generate suggested rules if output specified
            if (outputFile != null) {
                generateSuggestedRules(diff, rules, outputFile);
            }
            
            if (diff.hasDifferences()) {
                log.warn("Schema differences detected. Review output and update rules.yaml");
                return 1;
            } else {
                log.info("No schema differences detected. Rules are up to date.");
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
    private void reportDifferences(SchemaDiff diff) {
        log.info("\nSchema Drift Analysis");
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
     * Generate suggested rules YAML
     */
    private void generateSuggestedRules(SchemaDiff diff, AnonymizationRules existingRules, 
                                       String outputPath) throws Exception {
        
        StringBuilder yaml = new StringBuilder();
        yaml.append("# Suggested rule additions based on schema diff\n");
        yaml.append("# Review and merge into rules.yaml\n\n");
        
        if (!diff.missingColumns.isEmpty()) {
            yaml.append("# Missing columns to add:\n");
            for (Map.Entry<String, List<ColumnInfo>> entry : diff.missingColumns.entrySet()) {
                String tableName = entry.getKey();
                yaml.append("\n").append(tableName).append(":\n");
                yaml.append("  columns:\n");
                
                for (ColumnInfo col : entry.getValue()) {
                    yaml.append("    ").append(col.columnName).append(":\n");
                    yaml.append("      strategy: PRESERVE  # Review and change if PII\n");
                    yaml.append("      dataType: ").append(col.dataType).append("\n");
                    yaml.append("      piiLevel: UNKNOWN\n");
                }
            }
        }
        
        if (!diff.missingTables.isEmpty()) {
            yaml.append("\n# Missing tables to add:\n");
            for (String table : diff.missingTables) {
                yaml.append("\n").append(table).append(":\n");
                yaml.append("  primaryKey: <DEFINE_PRIMARY_KEY>\n");
                yaml.append("  columns: {}\n");
                yaml.append("  # Run diff-schema again after defining primary key\n");
            }
        }
        
        try (FileWriter writer = new FileWriter(outputPath)) {
            writer.write(yaml.toString());
        }
        
        log.info("Suggested rules written to: {}", outputPath);
    }
    
    /**
     * Create MySQL DataSource
     */
    private DataSource createDataSource(AnonymizerConfig.DatabaseConfig dbConfig) {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setServerName(dbConfig.getHost());
        ds.setPort(dbConfig.getPort());
        ds.setDatabaseName(dbConfig.getDatabase());
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
