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
    private static final Pattern VALID_IDENTIFIER = Pattern.compile("^[A-Za-z0-9_]+$");
    
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
    public void streamTable(String table, String primaryKey, List<String> columns,
                           BatchHandler handler) throws SQLException {
        
        // Validate and quote all identifiers
        String quotedTable = quoteIdentifier(table);
        String quotedPk = quoteIdentifier(primaryKey);
        
        StringBuilder columnList = new StringBuilder();
        for (int i = 0; i < columns.size(); i++) {
            if (i > 0) columnList.append(", ");
            columnList.append(quoteIdentifier(columns.get(i)));
        }
        
        String selectSql = String.format(
            "SELECT %s FROM %s WHERE %s > ? ORDER BY %s LIMIT ?",
            columnList, quotedTable, quotedPk, quotedPk
        );
        
        log.info("Streaming table {} with keyset pagination (batch={})", table, batchSize);
        
        // Validate PK is numeric on first query
        validateNumericPrimaryKey(table, primaryKey);
        
        long lastKey = 0L;
        long totalRows = 0;
        int batchCount = 0;
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(selectSql)) {
            
            stmt.setFetchSize(batchSize);
            
            while (true) {
                stmt.setLong(1, lastKey);
                stmt.setInt(2, batchSize);
                
                List<RowData> batch = new ArrayList<>();
                long newLastKey = lastKey;
                
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        RowData row = new RowData();
                        for (String column : columns) {
                            row.put(column, rs.getObject(column));
                        }
                        batch.add(row);
                        
                        // Get numeric PK value
                        Object pkValue = rs.getObject(primaryKey);
                        if (pkValue instanceof Number) {
                            newLastKey = ((Number) pkValue).longValue();
                        } else {
                            throw new SQLException("Primary key must be numeric: " + primaryKey);
                        }
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
     * Validate that primary key is numeric (required for keyset pagination)
     */
    private void validateNumericPrimaryKey(String table, String primaryKey) throws SQLException {
        String quotedTable = quoteIdentifier(table);
        String quotedPk = quoteIdentifier(primaryKey);
        String sql = String.format("SELECT %s FROM %s LIMIT 1", quotedPk, quotedTable);
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
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
