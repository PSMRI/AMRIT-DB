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

package com.db.piramalswasthya.anonymizer.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Keyset Pagination for efficient streaming of large tables
 * 
 * Uses WHERE pk > ? ORDER BY pk LIMIT ? pattern instead of OFFSET.
 * This ensures O(log n) performance even for tables with lakhs/crores of rows.
 * 
 * NO OFFSET QUERIES ALLOWED - This is a hard requirement for performance.
 * 
 * Security: All identifiers are validated and quoted to prevent SQL injection.
 */
public class KeysetPaginator {
    
    private static final Logger log = LoggerFactory.getLogger(KeysetPaginator.class);
    private static final Pattern VALID_IDENTIFIER = Pattern.compile("^\\w+$");
    
    private final DataSource dataSource;
    private final int batchSize;
    
    public KeysetPaginator(DataSource dataSource, int batchSize) {
        this.dataSource = dataSource;
        this.batchSize = batchSize;
    }
    
    /**
     * Validate identifier to prevent SQL injection via YAML rules
     */
    private void validateIdentifier(String identifier) {
        if (identifier == null || identifier.isEmpty()) {
            throw new IllegalArgumentException("Identifier cannot be null or empty");
        }
        if (!VALID_IDENTIFIER.matcher(identifier).matches()) {
            throw new IllegalArgumentException(
                "Invalid identifier: " + identifier + " (only alphanumeric and underscore allowed)");
        }
    }
    
    /**
     * Quote identifier with backticks
     * 
     * Security: All identifiers are validated against ^[A-Za-z0-9_]+$ pattern before quoting,
     * preventing SQL injection. This allows safe use in dynamic SQL construction.
     */
    private String quoteIdentifier(String identifier) {
        validateIdentifier(identifier);
        return "`" + identifier + "`";
    }
    
    /**
     * Streams a table using keyset pagination.
     * 
     * @param table Table name
     * @param primaryKey Primary key column name (must be numeric)
     * @param columns Columns to select
     * @param handler Handler for each batch of rows
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: all identifiers validated by quoteIdentifier()
    public void streamTable(String table, String primaryKey, List<String> columns,
                           BatchHandler handler) throws SQLException {
        
        // Validate and quote all identifiers
        String quotedTable = quoteIdentifier(table);
        String quotedPk = quoteIdentifier(primaryKey);
        
        // Build column list, ensuring primary key is included
        StringBuilder columnList = new StringBuilder();
        boolean pkIncluded = false;
        for (int i = 0; i < columns.size(); i++) {
            if (i > 0) columnList.append(", ");
            String quotedCol = quoteIdentifier(columns.get(i));
            columnList.append(quotedCol);
            if (quotedCol.equals(quotedPk)) {
                pkIncluded = true;
            }
        }
        
        // Add primary key if not already present
        if (!pkIncluded) {
            if (!columns.isEmpty()) columnList.append(", ");
            columnList.append(quotedPk);
        }
        
        String selectSql = String.format(
            "SELECT %s FROM %s WHERE %s > ? ORDER BY %s LIMIT ?",
            columnList, quotedTable, quotedPk, quotedPk
        );
        
        log.info("Streaming table {} with keyset pagination (batch={})", table, batchSize);
        
        long lastKey = 0L;
        long totalRows = 0;
        int batchCount = 0;
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(selectSql)) {
            
            // Validate PK is numeric using existing connection
            validateNumericPrimaryKey(conn, table, primaryKey);
            
            stmt.setFetchSize(batchSize);
            stmt.setInt(2, batchSize); // Loop-invariant
            
            while (true) {
                stmt.setLong(1, lastKey);
                
                BatchResult batchResult = processBatch(stmt, columns, primaryKey);
                
                if (batchResult.batch.isEmpty()) {
                    break; // No more rows
                }
                
                handler.handle(batchResult.batch);
                
                totalRows += batchResult.batch.size();
                batchCount++;
                lastKey = batchResult.lastKey;
                
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
     * Process a single batch of rows from the result set
     */
    private BatchResult processBatch(PreparedStatement stmt, List<String> columns, String primaryKey) 
            throws SQLException {
        List<RowData> batch = new ArrayList<>();
        long lastKey = 0L;
        
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                RowData row = new RowData();
                for (String column : columns) {
                    row.put(column, rs.getObject(column));
                }
                // Ensure PK is in RowData even if not in the original columns list
                if (!columns.contains(primaryKey)) {
                    row.put(primaryKey, rs.getObject(primaryKey));
                }
                batch.add(row);

                Object pkValue = rs.getObject(primaryKey);
                if (pkValue instanceof Number number) {
                    lastKey = number.longValue();
                } else {
                    throw new SQLException("Primary key must be numeric: " + primaryKey);
                }
            }
        }
        
        return new BatchResult(batch, lastKey);
    }
    
    /**
     * Validate that primary key is numeric (required for keyset pagination)
     * 
     * @param conn Existing database connection to reuse
     * @param table Table name
     * @param primaryKey Primary key column name
     * @throws SQLException if primary key is not numeric or validation fails
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: identifiers validated by quoteIdentifier()
    private void validateNumericPrimaryKey(Connection conn, String table, String primaryKey) throws SQLException {
        String quotedTable = quoteIdentifier(table);
        String quotedPk = quoteIdentifier(primaryKey);
        // Use WHERE 1=0 to get metadata even for empty tables
        String sql = String.format("SELECT %s FROM %s WHERE 1=0", quotedPk, quotedTable);
        
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            // Get metadata directly - works even when table is empty
            ResultSetMetaData metaData = rs.getMetaData();
            int type = metaData.getColumnType(1);
            
            if (type != Types.TINYINT && type != Types.SMALLINT && 
                type != Types.INTEGER && type != Types.BIGINT) {
                throw new SQLException(
                    "Primary key must be numeric (TINYINT/SMALLINT/INTEGER/BIGINT). " +
                    "Table: " + table + ", Column: " + primaryKey + ", Type: " + 
                    metaData.getColumnTypeName(1));
            }
        }
    }
    
    /**
     * Result of processing a batch
     */
    private static class BatchResult {
        final List<RowData> batch;
        final long lastKey;
        
        BatchResult(List<RowData> batch, long lastKey) {
            this.batch = batch;
            this.lastKey = lastKey;
        }
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
