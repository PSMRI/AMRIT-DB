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

import lombok.extern.slf4j.Slf4j;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import com.db.piramalswasthya.anonymizer.util.SqlUtils;

/**
 * Writes anonymized data directly to target database (DB2).
 * Handles schema reset and supports multi-schema operations.
 *
 * <p><b>Transactionality note (honest contract):</b> MySQL DDL statements cause
 * implicit commits, so the schema reset phase is NOT transactional. Data inserts
 * are committed per table via {@link #commitTable()}; the rollback performed by
 * {@link #close()} when {@link #markSuccess()} was not called only covers the
 * current uncommitted table. A crashed run therefore leaves previously completed
 * tables intact and at most one partially-written table, which is re-created on
 * the next run's reset.</p>
 *
 * <p>Foreign key checks are disabled on the writer session for the lifetime of
 * this writer because tables are copied in arbitrary order.</p>
 */
@Slf4j
public class DirectRestoreWriter implements AutoCloseable {

    private final DataSource targetDataSource;
    private final Connection connection;
    private final int batchSize;
    private final String schema;
    private boolean success = false;

    /**
     * @param targetDataSource DataSource for the target server. Must be able to
     *                         connect without assuming the schema already exists
     *                         (i.e. created without a default database).
     */
    public DirectRestoreWriter(DataSource targetDataSource, int batchSize, String schema) throws SQLException {
        if (batchSize <= 0) {
            throw new IllegalArgumentException("batchSize must be > 0, got: " + batchSize);
        }
        if (targetDataSource == null) {
            throw new IllegalArgumentException("targetDataSource must not be null");
        }
        validateIdentifier(schema);

        this.targetDataSource = com.db.piramalswasthya.anonymizer.util.DbUtils.delegateOf(targetDataSource);
        this.batchSize = batchSize;
        this.schema = schema;
        this.connection = this.targetDataSource.getConnection();
        this.connection.setAutoCommit(false);

        ensureSchemaExists();
        this.connection.setCatalog(schema);
        setForeignKeyChecks(false);

        log.info("Direct restore writer initialized for schema {} (batchSize={})", schema, batchSize);
    }

    private void validateIdentifier(String identifier) {
        SqlUtils.validateIdentifier(identifier);
    }

    /**
     * Quote identifier with backticks after validation.
     *
     * Security: identifiers are validated (backticks and control characters
     * rejected) before backtick-quoting, preventing SQL injection while
     * allowing real-world column names with spaces/dots/slashes.
     */
    private String quoteIdentifier(String identifier) {
        return SqlUtils.quoteIdentifier(identifier);
    }

    // SQL injection safe: schema is validated (backticks/control chars rejected)
    // by quoteIdentifier() before interpolation, and DDL cannot be parameterized.
    @SuppressWarnings({"java:S2077", "java:S3649"})
    private void ensureSchemaExists() throws SQLException {
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("CREATE DATABASE IF NOT EXISTS " + quoteIdentifier(schema));
        }
    }

    private void setForeignKeyChecks(boolean enabled) throws SQLException {
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("SET FOREIGN_KEY_CHECKS=" + (enabled ? "1" : "0"));
        }
    }

    /**
     * Reset target schema so it structurally mirrors the source: per-table
     * DROP + CREATE from the source's SHOW CREATE TABLE, then views.
     * Falls back to DELETE-all-data when the target user lacks DDL permissions
     * (tables must then already exist on the target).
     */
    public void resetSchema(DataSource sourceDataSource) throws SQLException {
        try {
            cloneSchemaFromSource(sourceDataSource);
        } catch (SQLException e) {
            log.warn("Schema clone via DROP/CREATE TABLE failed (likely permissions): {}. " +
                "Falling back to DELETE of existing target tables", e.getMessage());
            deleteAllData();
        }
    }

    /**
     * Clone all base tables (and then views) from source into target.
     * The source connection's default database is taken from its DataSource,
     * which the caller binds to the correct physical schema.
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: all identifiers validated by quoteIdentifier()
    private void cloneSchemaFromSource(DataSource sourceDataSource) throws SQLException {
        List<String> tables = new ArrayList<>();
        List<String> views = new ArrayList<>();

        try (Connection srcConn = sourceDataSource.getConnection();
             Statement stmt = srcConn.createStatement();
             ResultSet rs = stmt.executeQuery("SHOW FULL TABLES")) {
            while (rs.next()) {
                String name = rs.getString(1);
                if ("VIEW".equalsIgnoreCase(rs.getString(2))) {
                    views.add(name);
                } else {
                    tables.add(name);
                }
            }
        }

        log.info("Cloning {} tables and {} views from source into target schema {}",
            tables.size(), views.size(), schema);

        try (Connection srcConn = sourceDataSource.getConnection();
             Statement srcStmt = srcConn.createStatement();
             Statement tgtStmt = connection.createStatement()) {

            for (String table : tables) {
                validateIdentifier(table);
                String quoted = quoteIdentifier(table);
                String ddl = null;
                try (ResultSet rs = srcStmt.executeQuery("SHOW CREATE TABLE " + quoted)) {
                    if (rs.next()) {
                        ddl = rs.getString(2);
                    }
                }
                if (ddl == null) {
                    log.warn("No DDL returned for table {} - skipping", table);
                    continue;
                }
                tgtStmt.execute("DROP TABLE IF EXISTS " + quoted);
                tgtStmt.execute(ddl);
                log.debug("Cloned table: {}", table);
            }

            for (String view : views) {
                validateIdentifier(view);
                String quoted = quoteIdentifier(view);
                try {
                    String ddl = null;
                    try (ResultSet rs = srcStmt.executeQuery("SHOW CREATE VIEW " + quoted)) {
                        if (rs.next()) {
                            ddl = stripDefiner(rs.getString(2));
                        }
                    }
                    if (ddl == null) {
                        log.warn("No DDL returned for view {} - skipping", view);
                        continue;
                    }
                    tgtStmt.execute("DROP VIEW IF EXISTS " + quoted);
                    tgtStmt.execute(ddl);
                    log.debug("Cloned view: {}", view);
                } catch (SQLException e) {
                    // Views can reference other schemas or unavailable definers; they carry
                    // no data, so a failed view clone must not abort the restore.
                    log.warn("Failed to clone view {} - skipping: {}", view, e.getMessage());
                }
            }
        }

        log.info("Schema {} structure cloned successfully", schema);
    }

    /**
     * Remove DEFINER clauses from view DDL so restore does not require the
     * original definer user to exist on the target server.
     */
    static String stripDefiner(String ddl) {
        if (ddl == null) return null;
        return ddl.replaceAll("DEFINER\\s*=\\s*(`[^`]*`|\"[^\"]*\"|\\S+)@(`[^`]*`|\"[^\"]*\"|\\S+)\\s*", "");
    }

    /**
     * Fallback: Delete all data from existing target tables (FK checks are
     * already disabled on this session).
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: table names validated by quoteIdentifier()
    private void deleteAllData() throws SQLException {
        log.info("Deleting all data from existing tables in schema {}", schema);

        List<String> tables = new ArrayList<>();
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SHOW TABLES")) {
            while (rs.next()) {
                tables.add(rs.getString(1));
            }
        }

        if (tables.isEmpty()) {
            log.warn("No tables found in target schema {} and DDL clone failed - " +
                "nothing to restore into", schema);
            return;
        }

        try (Statement stmt = connection.createStatement()) {
            for (String table : tables) {
                validateIdentifier(table);
                stmt.addBatch("DELETE FROM " + quoteIdentifier(table));
            }
            stmt.executeBatch();
            connection.commit();
            log.info("Deleted data from {} tables", tables.size());
        }
    }

    /**
     * Write batch directly to target database.
     */
    @SuppressWarnings("java:S2077") // SQL injection safe: all identifiers validated by quoteIdentifier()
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

        // Safe: quotedTable and columnList contain only validated identifiers
        String sql = String.format("INSERT INTO %s (%s) VALUES (%s)",
            quotedTable, columnList, placeholders);

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            int count = 0;

            for (Map<String, Object> row : rows) {
                for (int i = 0; i < columns.size(); i++) {
                    setParameter(stmt, i + 1, row.get(columns.get(i)));
                }
                stmt.addBatch();
                count++;

                if (count % batchSize == 0) {
                    stmt.executeBatch();
                }
            }

            if (count % batchSize != 0) {
                stmt.executeBatch();
            }

            log.debug("Inserted {} rows into {} (commit deferred to commitTable())", rows.size(), tableName);
        }
    }

    private void setParameter(PreparedStatement stmt, int index, Object v) throws SQLException {
        if (v == null) {
            stmt.setNull(index, java.sql.Types.NULL);
        } else if (v instanceof String string) {
            stmt.setString(index, string);
        } else if (v instanceof byte[] bytes) {
            stmt.setBytes(index, bytes);
        } else {
            // Timestamps, dates, booleans, numbers, BigDecimal etc. - let the
            // driver map the original JDBC object back to the column type.
            stmt.setObject(index, v);
        }
    }

    /**
     * Commit all rows written since the last commit. Called once per completed
     * table so a crash mid-run loses at most the current table.
     */
    public void commitTable() throws SQLException {
        connection.commit();
    }

    /**
     * Mark the operation as successful to enable a final commit on close.
     */
    public void markSuccess() {
        this.success = true;
    }

    @Override
    public void close() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            SQLException primaryException = null;

            try {
                if (success) {
                    connection.commit();
                    log.info("Direct restore writer committed successfully for schema: {}", schema);
                } else {
                    connection.rollback();
                    log.warn("Direct restore writer rolled back current table due to incomplete operation for schema: {}", schema);
                }
                setForeignKeyChecks(true);
            } catch (SQLException e) {
                primaryException = e;
                log.error("Error during commit/rollback for schema {}: {}", schema, e.getMessage());
            } finally {
                try {
                    connection.close();
                    log.info("Direct restore writer closed for schema: {}", schema);
                } catch (SQLException closeException) {
                    log.error("Error closing connection for schema {}: {}", schema, closeException.getMessage());
                    if (primaryException != null) {
                        primaryException.addSuppressed(closeException);
                    } else {
                        primaryException = closeException;
                    }
                }
            }

            if (primaryException != null) {
                throw primaryException;
            }
        }
    }
}
