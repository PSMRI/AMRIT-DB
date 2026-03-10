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

package com.db.piramalswasthya.anonymizer.util;

import com.db.piramalswasthya.anonymizer.config.AnonymizerConfig;
import com.mysql.cj.jdbc.MysqlDataSource;
import lombok.extern.slf4j.Slf4j;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Slf4j
public final class DbUtils {

    private DbUtils() {}

    public static DataSource createDataSource(AnonymizerConfig.DatabaseConfig dbConfig, String schema) {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setServerName(dbConfig.getHost());
        ds.setPort(dbConfig.getPort());
        ds.setDatabaseName(schema);
        ds.setUser(dbConfig.getUsername());
        ds.setPassword(dbConfig.getPassword());

        try {
            ds.setConnectTimeout(dbConfig.getConnectionTimeout());
            ds.setRewriteBatchedStatements(true);
            ds.setUseServerPrepStmts(false);
            try {
                java.lang.reflect.Method m = ds.getClass().getMethod("setIntegerRuntimeProperty", String.class, int.class);
                m.invoke(ds, "socketTimeout", 300000);
            } catch (Exception ex) {
                log.debug("Connector doesn't support setIntegerRuntimeProperty(socketTimeout) via reflection", ex);
            }
        } catch (SQLException e) {
            log.warn("Failed to set advanced connection properties for {}", dbConfig.getHost(), e);
        }


        return new ReadOnlyAwareDataSource(ds, dbConfig.isReadOnly());
    }

    public static java.util.List<String> listTables(DataSource ds, String schema) throws SQLException {
        java.util.List<String> out = new java.util.ArrayList<>();

        // Prefer JDBC metadata for portability. MySQL may expose the database name as
        // TABLE_CAT rather than TABLE_SCHEM, so check both, and also compare to
        // the connection's current catalog.
        try (Connection conn = ds.getConnection()) {
            String catalog = null;
            try {
                catalog = conn.getCatalog();
            } catch (Exception ignored) {
            }

            java.sql.DatabaseMetaData md = conn.getMetaData();
            try {
                String metaUrl = md.getURL();
                log.debug("DbUtils.listTables: requestedSchema='{}' connCatalog='{}' metaUrl='{}'", schema, catalog, metaUrl);
            } catch (Exception e) {
                log.debug("DbUtils.listTables: requestedSchema='{}' connCatalog='{}' (failed to get meta URL)", schema, catalog);
            }

            try (ResultSet rs = md.getTables(catalog, null, "%", new String[]{"TABLE"})) {
                while (rs.next()) {
                    String tableCat = rs.getString("TABLE_CAT");
                    String tableSchem = rs.getString("TABLE_SCHEM");
                    String tableName = rs.getString("TABLE_NAME");
                    if (tableName == null) continue;
                    boolean matches = false;
                    if (schema == null || schema.isBlank()) {
                        matches = true;
                    } else {
                        if (schema.equalsIgnoreCase(tableName)) {
                            // Unlikely, but guard against odd drivers
                            matches = true;
                        }
                        if (!matches && tableCat != null && schema.equalsIgnoreCase(tableCat)) matches = true;
                        if (!matches && tableSchem != null && schema.equalsIgnoreCase(tableSchem)) matches = true;
                        if (!matches && catalog != null && schema.equalsIgnoreCase(catalog)) matches = true;
                    }
                    if (matches) out.add(tableName);
                }
            }
            log.debug("DbUtils.listTables: metadata discovery found {} tables for requested schema='{}'", out.size(), schema);
        }

        // Fallback: query INFORMATION_SCHEMA.TABLES if metadata returned nothing.
        if (out.isEmpty()) {
            String sql = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = ?";
            try (Connection conn = ds.getConnection()) {
                try {
                    String url = conn.getMetaData().getURL();
                    log.debug("DbUtils.listTables: metadata returned no tables; falling back to INFORMATION_SCHEMA on URL='{}', connCatalog='{}'", url, conn.getCatalog());
                } catch (Exception ex) {
                    log.debug("DbUtils.listTables: metadata returned no tables; falling back to INFORMATION_SCHEMA (couldn't read meta)");
                }
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, schema);
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            out.add(rs.getString(1));
                        }
                    }
                }
                log.debug("DbUtils.listTables: INFORMATION_SCHEMA fallback returned {} tables for schema='{}'", out.size(), schema);
            }
        }

        return out;
    }

    public static boolean isSslTrustFailure(Throwable t) {
        while (t != null) {
            if (t instanceof javax.net.ssl.SSLHandshakeException) return true;
            if (t instanceof java.security.cert.CertPathValidatorException) return true;
            String msg = t.getMessage();
            if (msg != null && msg.toLowerCase().contains("trust anchors")) return true;
            t = t.getCause();
        }
        return false;
    }

    private static String sanitizeError(Throwable e) {
        String m = e.getMessage();
        return m == null ? e.getClass().getSimpleName() : (m.length() > 1000 ? m.substring(0,1000) + "..." : m);
    }

    private static class ReadOnlyAwareDataSource implements DataSource {
        private final DataSource delegate;
        private final boolean readOnly;

        ReadOnlyAwareDataSource(DataSource delegate, boolean readOnly) {
            this.delegate = delegate;
            this.readOnly = readOnly;
        }

        @Override
        public java.sql.Connection getConnection() throws SQLException {
            java.sql.Connection conn = delegate.getConnection();
            try {
                conn.setReadOnly(readOnly);
                return conn;
            } catch (SQLException e) {
                conn.close();
                throw e;
            }
        }

        @Override
        public java.sql.Connection getConnection(String username, String password) throws SQLException {
            java.sql.Connection conn = delegate.getConnection(username, password);
            try {
                conn.setReadOnly(readOnly);
                return conn;
            } catch (SQLException e) {
                conn.close();
                throw e;
            }
        }

        @Override
        public java.io.PrintWriter getLogWriter() throws SQLException { return delegate.getLogWriter(); }
        @Override
        public void setLogWriter(java.io.PrintWriter out) throws SQLException { delegate.setLogWriter(out); }
        @Override
        public void setLoginTimeout(int seconds) throws SQLException { delegate.setLoginTimeout(seconds); }
        @Override
        public int getLoginTimeout() throws SQLException { return delegate.getLoginTimeout(); }
        @Override
        public java.util.logging.Logger getParentLogger() { return java.util.logging.Logger.getLogger("ReadOnlyAwareDataSource"); }
        @Override
        public <T> T unwrap(Class<T> iface) throws SQLException { return delegate.unwrap(iface); }
        @Override
        public boolean isWrapperFor(Class<?> iface) throws SQLException { return delegate.isWrapperFor(iface); }
    }
}
