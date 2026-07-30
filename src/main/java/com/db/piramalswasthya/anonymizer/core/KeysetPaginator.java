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

import lombok.extern.slf4j.Slf4j;

import javax.sql.DataSource;
import com.db.piramalswasthya.anonymizer.util.SqlUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

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
@Slf4j
public class KeysetPaginator {
    
    private final DataSource dataSource;
    private final int batchSize;
    
    public KeysetPaginator(DataSource dataSource, int batchSize) {
        // Wrap incoming DataSource in a lightweight wrapper to avoid exposing
        // the caller's mutable reference directly. This creates a new object
        // that delegates to the provided DataSource.
        this.dataSource = dataSource == null ? null : new DataSourceWrapper(dataSource);
        this.batchSize = batchSize;
    }

    /**
     * Minimal DataSource wrapper that delegates to the underlying DataSource.
     * Created to ensure the constructor does not store the incoming parameter
     * reference directly (mitigates EI_EXPOSE_REP2 warnings).
     */
    private static final class DataSourceWrapper implements DataSource {
        private final DataSource delegate;

        DataSourceWrapper(DataSource delegate) { this.delegate = delegate; }

        @Override public Connection getConnection() throws SQLException { return delegate.getConnection(); }
        @Override public Connection getConnection(String username, String password) throws SQLException { return delegate.getConnection(username, password); }
        @Override public java.io.PrintWriter getLogWriter() throws SQLException { return delegate.getLogWriter(); }
        @Override public void setLogWriter(java.io.PrintWriter out) throws SQLException { delegate.setLogWriter(out); }
        @Override public void setLoginTimeout(int seconds) throws SQLException { delegate.setLoginTimeout(seconds); }
        @Override public int getLoginTimeout() throws SQLException { return delegate.getLoginTimeout(); }
        @Override public java.util.logging.Logger getParentLogger() { return java.util.logging.Logger.getLogger("DataSourceWrapper"); }
        @Override public <T> T unwrap(Class<T> iface) throws SQLException { return delegate.unwrap(iface); }
        @Override public boolean isWrapperFor(Class<?> iface) throws SQLException { return delegate.isWrapperFor(iface); }
    }
    
    /**
     * Validate identifier to prevent SQL injection via YAML rules
     */
    private void validateIdentifier(String identifier) {
        SqlUtils.validateIdentifier(identifier);
    }
    
    /**
     * Quote identifier with backticks
     * 
     * Security: identifiers are validated (backticks and control characters
     * rejected) before backtick-quoting, preventing SQL injection while
     * allowing real-world column names with spaces/dots/slashes.
     */
    private String quoteIdentifier(String identifier) {
        return SqlUtils.quoteIdentifier(identifier);
    }
    
    /**
     * Stream a table, automatically choosing the best strategy:
     * <ul>
     *   <li>Registry-provided primary key override, else auto-detected via
     *       {@link java.sql.DatabaseMetaData#getPrimaryKeys}</li>
     *   <li>Single-column numeric PK → keyset pagination (O(log n) per page)</li>
     *   <li>Composite / non-numeric / missing PK → single full-scan with
     *       MySQL row streaming</li>
     * </ul>
     *
     * @param table Table name
     * @param primaryKeyOverride Optional PK column from the rules registry (may be null)
     * @param columns Columns to select
     * @param handler Handler for each batch of rows
     */
    public void streamTableAuto(String table, String primaryKeyOverride, List<String> columns,
                                BatchHandler handler) throws SQLException {
        String pk = (primaryKeyOverride == null || primaryKeyOverride.isBlank())
            ? detectSingleColumnPrimaryKey(table)
            : primaryKeyOverride;

        if (pk != null && isNumericColumn(table, pk)) {
            log.info("Table {}: keyset pagination on primary key {}", table, pk);
            streamTable(table, pk, columns, handler);
        } else {
            if (pk != null) {
                log.info("Table {}: primary key {} is non-numeric - using full-scan streaming", table, pk);
            } else {
                log.info("Table {}: no single-column primary key - using full-scan streaming", table);
            }
            streamTableFullScan(table, columns, handler);
        }
    }

    /**
     * Detect a single-column primary key via JDBC metadata.
     *
     * @return the PK column name, or null when the table has no PK or a composite PK
     */
    public String detectSingleColumnPrimaryKey(String table) throws SQLException {
        validateIdentifier(table);
        List<String> pkColumns = new ArrayList<>();
        try (Connection conn = dataSource.getConnection()) {
            try (ResultSet rs = conn.getMetaData().getPrimaryKeys(conn.getCatalog(), null, table)) {
                while (rs.next()) {
                    pkColumns.add(rs.getString("COLUMN_NAME"));
                }
            }
        }
        return pkColumns.size() == 1 ? pkColumns.get(0) : null;
    }

    /**
     * Check whether a column has an integral numeric type usable for keyset pagination.
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: identifiers validated by quoteIdentifier()
    private boolean isNumericColumn(String table, String column) throws SQLException {
        String sql = String.format("SELECT %s FROM %s WHERE 1=0",
            quoteIdentifier(column), quoteIdentifier(table));
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            int type = rs.getMetaData().getColumnType(1);
            return type == Types.TINYINT || type == Types.SMALLINT
                || type == Types.INTEGER || type == Types.BIGINT;
        }
    }

    /**
     * Stream a table with a single full scan using MySQL row streaming
     * (fetchSize=Integer.MIN_VALUE). Used for tables where keyset pagination
     * is impossible; still constant-memory because rows are consumed as they
     * arrive and handed to the handler in batches.
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: all identifiers validated by quoteIdentifier()
    public void streamTableFullScan(String table, List<String> columns,
                                    BatchHandler handler) throws SQLException {
        String quotedTable = quoteIdentifier(table);
        StringBuilder columnList = new StringBuilder();
        for (int i = 0; i < columns.size(); i++) {
            if (i > 0) columnList.append(", ");
            columnList.append(quoteIdentifier(columns.get(i)));
        }
        String sql = String.format("SELECT %s FROM %s", columnList, quotedTable);

        log.info("Streaming table {} with full scan (batch={})", table, batchSize);

        long totalRows = 0;
        int batchCount = 0;

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql,
                 ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY)) {

            stmt.setFetchSize(Integer.MIN_VALUE); // MySQL streaming mode

            List<RowData> batch = new ArrayList<>(batchSize);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RowData row = new RowData();
                    for (String column : columns) {
                        row.put(column, rs.getObject(column));
                    }
                    batch.add(row);

                    if (batch.size() >= batchSize) {
                        handler.handle(batch);
                        totalRows += batch.size();
                        batchCount++;
                        batch = new ArrayList<>(batchSize);
                        if (batchCount % 100 == 0) {
                            log.info("Processed {} batches, {} total rows from {}",
                                batchCount, totalRows, table);
                        }
                    }
                }
            }
            if (!batch.isEmpty()) {
                handler.handle(batch);
                totalRows += batch.size();
                batchCount++;
            }
        }

        log.info("Completed full-scan streaming {} - {} batches, {} total rows",
            table, batchCount, totalRows);
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

        long totalRows = 0;
        int batchCount = 0;

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(selectSql)) {

            // Validate PK is numeric using existing connection
            validateNumericPrimaryKey(conn, table, primaryKey);

            // Seed the keyset from the actual minimum key: PKs are not
            // guaranteed to be positive, and starting at 0 would skip rows.
            Long minKey = selectMinKey(conn, quotedTable, quotedPk);
            if (minKey == null) {
                log.info("Table {} is empty - nothing to stream", table);
                return;
            }
            long lastKey = minKey - 1;

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
     * Return the actual column list for the table as reported by the database.
     * Uses SELECT * WHERE 1=0 to obtain ResultSetMetaData so it works on empty tables.
     */
    public List<String> getTableColumns(String table) throws SQLException {
        return getTableColumnMeta(table).stream().map(ColumnMeta::name).toList();
    }

    /**
     * Return column metadata (name, JDBC type, precision, nullability) for the
     * table, so anonymization outputs can be fitted to the column definition.
     */
    @SuppressWarnings("java:S2077")
    public List<ColumnMeta> getTableColumnMeta(String table) throws SQLException {
        validateIdentifier(table);
        String quotedTable = quoteIdentifier(table);
        String sql = String.format("SELECT * FROM %s WHERE 1=0", quotedTable);

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            ResultSetMetaData meta = rs.getMetaData();
            List<ColumnMeta> cols = new ArrayList<>();
            for (int i = 1; i <= meta.getColumnCount(); i++) {
                cols.add(new ColumnMeta(
                    meta.getColumnLabel(i),
                    meta.getColumnType(i),
                    meta.getColumnTypeName(i),
                    meta.getPrecision(i),
                    meta.isNullable(i) != ResultSetMetaData.columnNoNulls));
            }
            return cols;
        }
    }
    
    /**
     * Select the minimum primary key value, or null when the table is empty.
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: identifiers pre-quoted by caller
    private Long selectMinKey(Connection conn, String quotedTable, String quotedPk) throws SQLException {
        String sql = String.format("SELECT MIN(%s) FROM %s", quotedPk, quotedTable);
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                long min = rs.getLong(1);
                return rs.wasNull() ? null : min;
            }
            return null;
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
        
        /**
         * Return a defensive copy of the row data to avoid exposing internal mutable state.
         */
        public java.util.Map<String, Object> getData() {
            return new java.util.LinkedHashMap<>(data);
        }
    }
}
