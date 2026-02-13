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

package com.db.piramalswasthya.anonymizer.output;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * Writes anonymized data directly to target database (DB2)
 * Handles schema reset and supports multi-schema operations.
 */
public class DirectRestoreWriter implements AutoCloseable {
    
    private static final Logger log = LoggerFactory.getLogger(DirectRestoreWriter.class);
    private static final Pattern VALID_IDENTIFIER = Pattern.compile("^\\w+$");
    
    private final DataSource targetDataSource;
    private final Connection connection;
    private final int batchSize;
    private final String schema;
    
    public DirectRestoreWriter(DataSource targetDataSource, int batchSize, String schema) throws SQLException {
        this.targetDataSource = targetDataSource;
        this.batchSize = batchSize;
        this.schema = schema;
        this.connection = targetDataSource.getConnection();
        this.connection.setAutoCommit(false);
        this.connection.setCatalog(schema);  // Set schema context
        
        log.info("Direct restore writer initialized for schema {} (batchSize={})", schema, batchSize);
    }
    
    /**
     * Validate identifier to prevent SQL injection via YAML
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
     * Quote identifier with backticks after validation
     */
    private String quoteIdentifier(String identifier) {
        validateIdentifier(identifier);
        return "`" + identifier + "`";
    }
    
    /**
     * Reset schema - tries DROP/CREATE, falls back to DELETE if no permissions
     */
    public void resetSchema(DataSource sourceDataSource) throws SQLException {
        validateIdentifier(schema);
        
        try {
            // Try DROP DATABASE approach (preferred - clean and fast)
            dropAndRecreateSchema(sourceDataSource);
        } catch (SQLException e) {
            log.warn("DROP DATABASE failed (likely permissions): {}. Falling back to DELETE", e.getMessage());
            // Fallback: disable FK checks and delete all data
            deleteAllData();
        }
    }
    
    /**
     * Drop and recreate schema, then clone tables from source
     */
    private void dropAndRecreateSchema(DataSource sourceDataSource) throws SQLException {
        String quotedSchema = quoteIdentifier(schema);
        
        log.info("Attempting to drop and recreate schema: {}", schema);
        
        try (Connection adminConn = targetDataSource.getConnection();
             Statement stmt = adminConn.createStatement()) {
            
            // Drop and recreate
            stmt.execute("DROP DATABASE IF EXISTS " + quotedSchema);
            stmt.execute("CREATE DATABASE " + quotedSchema);
            adminConn.commit();
            
            log.info("Schema {} dropped and recreated", schema);
        }
        
        // Clone table structures from source
        cloneTableStructures(sourceDataSource);
    }
    
    /**
     * Clone table DDL from source to target
     */
    private void cloneTableStructures(DataSource sourceDataSource) throws SQLException {
        log.info("Cloning table structures from source schema: {}", schema);
        
        List<String> tables = new ArrayList<>();
        
        // Get table list from source
        try (Connection srcConn = sourceDataSource.getConnection();
             Statement stmt = srcConn.createStatement()) {
            
            srcConn.setCatalog(schema);
            ResultSet rs = stmt.executeQuery("SHOW TABLES");
            while (rs.next()) {
                tables.add(rs.getString(1));
            }
            rs.close();
        }
        
        log.info("Found {} tables to clone", tables.size());
        
        // Clone each table structure
        try (Connection srcConn = sourceDataSource.getConnection();
             Statement srcStmt = srcConn.createStatement();
             Statement tgtStmt = connection.createStatement()) {
            
            srcConn.setCatalog(schema);
            
            for (String table : tables) {
                validateIdentifier(table);
                String quotedTable = quoteIdentifier(table);
                
                // Get CREATE TABLE statement from source
                ResultSet rs = srcStmt.executeQuery("SHOW CREATE TABLE " + quotedTable);
                if (rs.next()) {
                    String createDdl = rs.getString(2);
                    tgtStmt.addBatch(createDdl);
                    log.debug("Queued table creation: {}", table);
                }
                rs.close();
            }
            
            // Execute all CREATE TABLE statements in batch
            tgtStmt.executeBatch();
            connection.commit();
            log.info("Successfully cloned {} tables", tables.size());
        }
    }
    
    /**
     * Fallback: Delete all data with FK checks disabled
     */
    private void deleteAllData() throws SQLException {
        log.info("Deleting all data from schema {} with FK checks disabled", schema);
        
        List<String> tables = new ArrayList<>();
        
        // Get table list
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SHOW TABLES")) {
            
            while (rs.next()) {
                tables.add(rs.getString(1));
            }
        }
        
        if (tables.isEmpty()) {
            log.info("No tables found in schema {}", schema);
            return;
        }
        
        log.info("Deleting data from {} tables", tables.size());
        
        try (Statement stmt = connection.createStatement()) {
            // Disable FK checks
            stmt.execute("SET FOREIGN_KEY_CHECKS=0");
            
            // Delete from each table
            for (String table : tables) {
                String quotedTable = quoteIdentifier(table);
                stmt.execute("DELETE FROM " + quotedTable);
                log.debug("Deleted data from: {}", table);
            }
            
            // Re-enable FK checks
            stmt.execute("SET FOREIGN_KEY_CHECKS=1");
            connection.commit();
            
            log.info("Successfully deleted data from {} tables", tables.size());
        }
    }
    
    /**
     * Write batch directly to target database
     */
    public void writeInsert(String tableName, List<String> columns, 
                           List<Map<String, Object>> rows) throws SQLException {
        
        if (rows.isEmpty()) {
            return;
        }
        
        String quotedTable = quoteIdentifier(tableName);
        
        String placeholders = columns.stream()
            .map(c -> "?")
            .collect(Collectors.joining(", "));
        
        String columnList = columns.stream()
            .map(this::quoteIdentifier)
            .collect(Collectors.joining(", "));
        
        String sql = String.format("INSERT INTO %s (%s) VALUES (%s)",
            quotedTable, columnList, placeholders);
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            int count = 0;
            
            for (Map<String, Object> row : rows) {
                for (int i = 0; i < columns.size(); i++) {
                    stmt.setObject(i + 1, row.get(columns.get(i)));
                }
                stmt.addBatch();
                count++;
                
                if (count % batchSize == 0) {
                    stmt.executeBatch();
                    connection.commit();
                }
            }
            
            // Execute remaining batch
            if (count % batchSize != 0) {
                stmt.executeBatch();
                connection.commit();
            }
            
            log.debug("Inserted {} rows into {}", rows.size(), tableName);
        }
    }
    
    /**
     * Truncate table before restore (optional, lighter than full reset)
     */
    public void truncateTable(String tableName) throws SQLException {
        String quotedTable = quoteIdentifier(tableName);
        
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("TRUNCATE TABLE " + quotedTable);
            connection.commit();
            log.info("Truncated table: {}", tableName);
        }
    }
    
    private boolean success = false;
    
    /**
     * Mark the operation as successful to enable commit on close
     */
    public void markSuccess() {
        this.success = true;
    }
    
    @Override
    public void close() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            try {
                if (success) {
                    connection.commit();
                    log.info("Direct restore writer committed successfully for schema: {}", schema);
                } else {
                    connection.rollback();
                    log.warn("Direct restore writer rolled back due to incomplete operation for schema: {}", schema);
                }
            } catch (SQLException e) {
                log.error("Error during commit/rollback for schema {}: {}", schema, e.getMessage());
                throw e;
            } finally {
                try {
                    connection.close();
                    log.info("Direct restore writer closed for schema: {}", schema);
                } catch (SQLException e) {
                    log.error("Error closing connection for schema {}: {}", schema, e.getMessage());
                    throw e;
                }
            }
        }
    }
}
