package com.db.piramalswasthya.anonymization.phase1.export;

import com.db.piramalswasthya.anonymization.phase1.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Exports Phase 1 artifacts to various formats (JSON, CSV, HTML).
 */
@Slf4j
@Service
public class ArtifactExporter {
    
    private final ObjectMapper jsonMapper;
    
    public ArtifactExporter() {
        this.jsonMapper = new ObjectMapper();
        this.jsonMapper.registerModule(new JavaTimeModule());
        this.jsonMapper.enable(SerializationFeature.INDENT_OUTPUT);
        this.jsonMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
    }
    
    /**
     * Ensure output directory exists.
     */
    public void ensureOutputDirectory(String outputDir) {
        try {
            Path path = Paths.get(outputDir);
            if (!Files.exists(path)) {
                Files.createDirectories(path);
                log.info("Created output directory: {}", outputDir);
            }
        } catch (IOException e) {
            log.error("Failed to create output directory: {}", outputDir, e);
            throw new RuntimeException("Cannot create output directory", e);
        }
    }
    
    /**
     * Export schema catalog as JSON.
     */
    public void exportSchemaCatalog(SchemaCatalog catalog, String outputDir) {
        String outputPath = outputDir + File.separator + "schema-catalog.json";
        try {
            jsonMapper.writeValue(new File(outputPath), catalog);
            log.info("Exported schema catalog to: {}", outputPath);
        } catch (IOException e) {
            log.error("Failed to export schema catalog", e);
            throw new RuntimeException("Failed to export schema catalog", e);
        }
    }
    
    /**
     * Export PII field inventory as CSV.
     */
    public void exportPIIInventoryCSV(SchemaCatalog catalog, String outputDir) {
        String outputPath = outputDir + File.separator + "pii-field-inventory.csv";
        
        try (FileWriter writer = new FileWriter(outputPath)) {
            // CSV Header
            writer.write("Database,Table,Column,DataType,PIICategory,RiskLevel,Rationale,ProposedRule,Nullable,PrimaryKey,UniqueConstraint\n");
            
            for (DatabaseMetadata db : catalog.getDatabases()) {
                for (TableMetadata table : db.getTables()) {
                    for (ColumnMetadata column : table.getColumns()) {
                        // Only export columns with PII risk (or unknown that needs review)
                        if (column.getRiskLevel() != null && column.getRiskLevel() != RiskLevel.NONE) {
                            writer.write(String.format("%s,%s,%s,\"%s\",%s,%s,\"%s\",%s,%s,%s,%s\n",
                                escapeCsv(db.getDatabaseName()),
                                escapeCsv(table.getName()),
                                escapeCsv(column.getName()),
                                escapeCsv(column.getDataType()),
                                column.getPiiCategory(),
                                column.getRiskLevel(),
                                escapeCsv(column.getDetectionRationale()),
                                escapeCsv(column.getProposedRuleId()),
                                column.getNullable(),
                                column.getPrimaryKey(),
                                column.getUniqueConstraint()
                            ));
                        }
                    }
                }
            }
            
            log.info("Exported PII inventory CSV to: {}", outputPath);
            
        } catch (IOException e) {
            log.error("Failed to export PII inventory CSV", e);
            throw new RuntimeException("Failed to export PII inventory CSV", e);
        }
    }
    
    /**
     * Export anonymization strategy map as JSON.
     */
    public void exportAnonymizationStrategyMap(SchemaCatalog catalog, String outputDir) {
        String outputPath = outputDir + File.separator + "anonymization-strategy-map.json";
        
        Map<String, Object> strategyMap = new LinkedHashMap<>();
        
        for (DatabaseMetadata db : catalog.getDatabases()) {
            Map<String, Object> dbMap = new LinkedHashMap<>();
            
            for (TableMetadata table : db.getTables()) {
                if (!table.hasPiiData()) continue; // Skip tables without PII
                
                Map<String, Object> tableMap = new LinkedHashMap<>();
                tableMap.put("tableName", table.getName());
                tableMap.put("piiColumnCount", table.getPiiColumnCount());
                tableMap.put("estimatedRows", table.getEstimatedRowCount());
                
                Map<String, Object> columnsMap = new LinkedHashMap<>();
                for (ColumnMetadata column : table.getColumns()) {
                    if (column.requiresAnonymization() || column.isLinkingKey()) {
                        Map<String, Object> columnStrategy = new LinkedHashMap<>();
                        columnStrategy.put("piiCategory", column.getPiiCategory());
                        columnStrategy.put("riskLevel", column.getRiskLevel());
                        columnStrategy.put("proposedRule", column.getProposedRuleId());
                        columnStrategy.put("rationale", column.getDetectionRationale());
                        columnStrategy.put("dataType", column.getDataType());
                        columnStrategy.put("nullable", column.getNullable());
                        
                        columnsMap.put(column.getName(), columnStrategy);
                    }
                }
                tableMap.put("columns", columnsMap);
                
                dbMap.put(table.getName(), tableMap);
            }
            
            strategyMap.put(db.getDatabaseName(), dbMap);
        }
        
        try {
            jsonMapper.writeValue(new File(outputPath), strategyMap);
            log.info("Exported anonymization strategy map to: {}", outputPath);
        } catch (IOException e) {
            log.error("Failed to export strategy map", e);
            throw new RuntimeException("Failed to export strategy map", e);
        }
    }
    
    /**
     * Export anonymization registry as JSON.
     */
    public void exportRegistry(AnonymizationRegistry registry, String outputDir) {
        String outputPath = outputDir + File.separator + "anonymization-registry.json";
        
        try {
            jsonMapper.writeValue(new File(outputPath), registry);
            log.info("Exported anonymization registry to: {}", outputPath);
        } catch (IOException e) {
            log.error("Failed to export registry", e);
            throw new RuntimeException("Failed to export registry", e);
        }
    }
    
    /**
     * Export constraint dependency graph as HTML with simple visualization.
     */
    public void exportConstraintGraphHTML(SchemaCatalog catalog, String outputDir) {
        String outputPath = outputDir + File.separator + "constraint-dependency-graph.html";
        
        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>\n");
        html.append("<html>\n<head>\n");
        html.append("<title>AMRIT Database Constraint Dependency Graph</title>\n");
        html.append("<style>\n");
        html.append("body { font-family: Arial, sans-serif; margin: 20px; }\n");
        html.append("h1 { color: #333; }\n");
        html.append(".database { margin: 20px 0; padding: 15px; border: 2px solid #4CAF50; border-radius: 5px; }\n");
        html.append(".table { margin: 10px 0; padding: 10px; background-color: #f9f9f9; border-left: 4px solid #2196F3; }\n");
        html.append(".pii-table { border-left: 4px solid #f44336; }\n");
        html.append(".fk { margin: 5px 0; padding: 5px; background-color: #fff3cd; font-family: monospace; font-size: 12px; }\n");
        html.append(".stats { color: #666; font-size: 14px; }\n");
        html.append("</style>\n");
        html.append("</head>\n<body>\n");
        html.append("<h1>AMRIT Database Constraint Dependency Graph</h1>\n");
        html.append("<p class='stats'>Generated: ").append(catalog.getGeneratedAt()).append("</p>\n");
        
        for (DatabaseMetadata db : catalog.getDatabases()) {
            html.append("<div class='database'>\n");
            html.append("<h2>").append(db.getDatabaseName()).append("</h2>\n");
            html.append("<p class='stats'>Tables: ").append(db.getTables().size())
                .append(" | PII Tables: ").append(db.getPiiTableCount())
                .append(" | PII Columns: ").append(db.getTotalPiiColumnCount())
                .append("</p>\n");
            
            for (TableMetadata table : db.getTables()) {
                String tableClass = table.hasPiiData() ? "table pii-table" : "table";
                html.append("<div class='").append(tableClass).append("'>\n");
                html.append("<h3>").append(table.getName()).append("</h3>\n");
                html.append("<p class='stats'>Columns: ").append(table.getColumns().size())
                    .append(" | PII Columns: ").append(table.getPiiColumnCount())
                    .append(" | Estimated Rows: ").append(table.getEstimatedRowCount())
                    .append("</p>\n");
                
                if (!table.getForeignKeys().isEmpty()) {
                    html.append("<h4>Foreign Keys:</h4>\n");
                    for (ForeignKeyMetadata fk : table.getForeignKeys()) {
                        html.append("<div class='fk'>");
                        html.append(fk.getFkColumnName()).append(" → ");
                        if (fk.getPkTableSchema() != null) {
                            html.append(fk.getPkTableSchema()).append(".");
                        }
                        html.append(fk.getPkTableName()).append(".").append(fk.getPkColumnName());
                        html.append("</div>\n");
                    }
                }
                
                html.append("</div>\n");
            }
            
            html.append("</div>\n");
        }
        
        html.append("</body>\n</html>");
        
        try (FileWriter writer = new FileWriter(outputPath)) {
            writer.write(html.toString());
            log.info("Exported constraint graph HTML to: {}", outputPath);
        } catch (IOException e) {
            log.error("Failed to export constraint graph HTML", e);
            throw new RuntimeException("Failed to export constraint graph HTML", e);
        }
    }
    
    /**
     * Export PII coverage report as JSON.
     */
    public void exportPIICoverageReport(SchemaCatalog catalog, String outputDir) {
        String outputPath = outputDir + File.separator + "pii-coverage-report.json";
        
        Map<String, Object> report = new LinkedHashMap<>();
        report.put("reportVersion", "1.0");
        report.put("generatedAt", catalog.getGeneratedAt());
        report.put("toolVersion", catalog.getToolVersion());
        
        // Summary
        int totalPiiColumns = catalog.getTotalPiiColumnCount();
        int coveredPiiColumns = 0;
        int uncoveredPiiColumns = 0;
        
        for (DatabaseMetadata db : catalog.getDatabases()) {
            for (TableMetadata table : db.getTables()) {
                for (ColumnMetadata column : table.getColumns()) {
                    if (column.requiresAnonymization() || column.isLinkingKey()) {
                        if ("TBD".equals(column.getProposedRuleId()) || 
                            column.getProposedRuleId() == null) {
                            uncoveredPiiColumns++;
                        } else {
                            coveredPiiColumns++;
                        }
                    }
                }
            }
        }
        
        Map<String, Object> summary = new LinkedHashMap<>();
        summary.put("totalTables", catalog.getTotalTableCount());
        summary.put("piiColumns", totalPiiColumns);
        summary.put("coveredPiiColumns", coveredPiiColumns);
        summary.put("uncoveredPiiColumns", uncoveredPiiColumns);
        summary.put("coveragePercentage", totalPiiColumns > 0 ? 
            (coveredPiiColumns * 100.0 / totalPiiColumns) : 100.0);
        summary.put("validationStatus", uncoveredPiiColumns == 0 ? "PASS" : "NEEDS_REVIEW");
        
        report.put("summary", summary);
        
        try {
            jsonMapper.writeValue(new File(outputPath), report);
            log.info("Exported PII coverage report to: {}", outputPath);
        } catch (IOException e) {
            log.error("Failed to export PII coverage report", e);
            throw new RuntimeException("Failed to export PII coverage report", e);
        }
    }
    
    /**
     * Escape special characters for CSV output.
     */
    private String escapeCsv(String value) {
        if (value == null) {
            return "";
        }
        // Escape double quotes and wrap in quotes if contains comma
        value = value.replace("\"", "\"\"");
        if (value.contains(",") || value.contains("\"") || value.contains("\n")) {
            return "\"" + value + "\"";
        }
        return value;
    }
}
