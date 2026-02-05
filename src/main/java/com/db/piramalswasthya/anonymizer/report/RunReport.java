package com.db.piramalswasthya.anonymizer.report;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * PII-safe execution report
 * 
 * Contains ONLY aggregated metrics - no raw data, no PII
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RunReport {
    
    private static final Logger log = LoggerFactory.getLogger(RunReport.class);
    
    private String executionId;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private Long totalDurationMs;
    private String status; // SUCCESS, FAILED, PARTIAL
    private String configHash;
    private String rulesHash;
    private String rulesVersion;
    private String toolVersion = "2.0.0";
    private String errorMessage;
    
    private List<TableReport> tables = new ArrayList<>();
    private Map<String, String> errors = new HashMap<>();
    
    @Data
    public static class TableReport {
        private String tableName;
        private Long rowsProcessed;
        private Long durationMs;
        private Integer columnsAnonymized;
        private Map<String, Integer> strategyCounts = new HashMap<>();
        private String error;
    }
    
    /**
     * Add table processing result
     */
    public void addTableReport(String table, long rows, long durationMs, 
                               int columnsAnonymized, Map<String, Integer> strategies) {
        TableReport tr = new TableReport();
        tr.setTableName(table);
        tr.setRowsProcessed(rows);
        tr.setDurationMs(durationMs);
        tr.setColumnsAnonymized(columnsAnonymized);
        tr.setStrategyCounts(strategies);
        tables.add(tr);
    }
    
    /**
     * Add error (PII-safe - no sensitive details)
     */
    public void addError(String context, String sanitizedMessage) {
        errors.put(context, sanitizedMessage);
    }
    
    /**
     * Write report to JSON file
     */
    public void writeToFile(String outputPath) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        mapper.findAndRegisterModules(); // For LocalDateTime
        
        File file = new File(outputPath);
        file.getParentFile().mkdirs();
        
        mapper.writeValue(file, this);
        log.info("Run report written to: {}", outputPath);
    }
    
    /**
     * Calculate total rows across all tables
     */
    public long getTotalRowsProcessed() {
        return tables.stream()
            .mapToLong(t -> t.getRowsProcessed() != null ? t.getRowsProcessed() : 0)
            .sum();
    }
}
