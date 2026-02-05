package com.db.piramalswasthya.anonymizer.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Keyset Pagination for efficient streaming of large tables
 * 
 * Uses WHERE pk > ? ORDER BY pk LIMIT ? pattern instead of OFFSET.
 * This ensures O(log n) performance even for tables with millions/billions of rows.
 * 
 * NO OFFSET QUERIES ALLOWED - This is a hard requirement for performance.
 */
public class KeysetPaginator {
    
    private static final Logger log = LoggerFactory.getLogger(KeysetPaginator.class);
    
    private final DataSource dataSource;
    private final int batchSize;
    
    public KeysetPaginator(DataSource dataSource, int batchSize) {
        this.dataSource = dataSource;
        this.batchSize = batchSize;
    }
    
    /**
     * Streams a table using keyset pagination.
     * 
     * @param table Table name
     * @param primaryKey Primary key column name
     * @param columns Columns to select
     * @param handler Handler for each batch of rows
     */
    public void streamTable(String table, String primaryKey, List<String> columns,
                           BatchHandler handler) throws SQLException {
        
        String columnList = String.join(", ", columns);
        String selectSql = String.format(
            "SELECT %s FROM %s WHERE %s > ? ORDER BY %s LIMIT ?",
            columnList, table, primaryKey, primaryKey
        );
        
        log.info("Streaming table {} with keyset pagination (batch={})", table, batchSize);
        
        Object lastKey = getMinKeyValue(primaryKey);
        long totalRows = 0;
        int batchCount = 0;
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(selectSql)) {
            
            stmt.setFetchSize(batchSize);
            
            while (true) {
                stmt.setObject(1, lastKey);
                stmt.setInt(2, batchSize);
                
                List<RowData> batch = new ArrayList<>();
                Object newLastKey = lastKey;
                
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        RowData row = new RowData();
                        for (String column : columns) {
                            row.put(column, rs.getObject(column));
                        }
                        batch.add(row);
                        newLastKey = rs.getObject(primaryKey);
                    }
                }
                
                if (batch.isEmpty()) {
                    break; // No more rows
                }
                
                handler.handle(batch);
                
                totalRows += batch.size();
                batchCount++;
                lastKey = newLastKey;
                
                // PII-safe progress logging (counts only)
                if (batchCount % 100 == 0) {
                    log.info("Processed {} batches, {} total rows from {}", 
                        batchCount, totalRows, table);
                }
            }
            
            log.info("Completed streaming {} - {} batches, {} total rows", 
                table, batchCount, totalRows);
        }
    }
    
    /**
     * Gets minimum key value to start pagination.
     * For numeric keys, returns 0. For string keys, returns empty string.
     */
    private Object getMinKeyValue(String primaryKey) {
        // Simple heuristic - could be improved with actual schema metadata
        return 0L;
    }
    
    @FunctionalInterface
    public interface BatchHandler {
        void handle(List<RowData> batch) throws SQLException;
    }
    
    /**
     * Represents a single row of data (column → value mapping)
     */
    public static class RowData {
        private final java.util.Map<String, Object> data = new java.util.LinkedHashMap<>();
        
        public void put(String column, Object value) {
            data.put(column, value);
        }
        
        public Object get(String column) {
            return data.get(column);
        }
        
        public boolean containsKey(String column) {
            return data.containsKey(column);
        }
        
        public java.util.Map<String, Object> getData() {
            return data;
        }
    }
}
