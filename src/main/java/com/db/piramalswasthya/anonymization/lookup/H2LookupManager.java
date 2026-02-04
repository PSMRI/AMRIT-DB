package com.db.piramalswasthya.anonymization.lookup;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.file.Path;
import java.sql.*;
import java.util.Optional;

/**
 * H2 embedded database-based lookup table for anonymization consistency.
 * Stores mappings of original values to anonymized values to ensure
 * the same input always produces the same output across multiple runs.
 * 
 * File-based storage makes it portable and doesn't require external database.
 */
public class H2LookupManager implements AutoCloseable {
    
    private static final Logger log = LoggerFactory.getLogger(H2LookupManager.class);
    
    private final Connection connection;
    private final String salt;
    private final PreparedStatement insertStmt;
    private final PreparedStatement selectStmt;
    private final PreparedStatement updateStmt;
    
    private static final String CREATE_TABLE_SQL = """
        CREATE TABLE IF NOT EXISTS lookup (
            id BIGINT AUTO_INCREMENT PRIMARY KEY,
            database_name VARCHAR(255) NOT NULL,
            table_name VARCHAR(255) NOT NULL,
            column_name VARCHAR(255) NOT NULL,
            original_value_hash VARCHAR(64) NOT NULL,
            anonymized_value CLOB NOT NULL,
            strategy VARCHAR(50) NOT NULL,
            data_type VARCHAR(50),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            last_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            usage_count INT DEFAULT 1,
            UNIQUE (database_name, table_name, column_name, original_value_hash)
        )
        """;
    
    private static final String CREATE_INDEX_SQL = """
        CREATE INDEX IF NOT EXISTS idx_lookup_key 
        ON lookup (database_name, table_name, column_name, original_value_hash)
        """;
    
    private static final String SELECT_SQL = """
        SELECT anonymized_value, strategy 
        FROM lookup 
        WHERE database_name = ? 
          AND table_name = ? 
          AND column_name = ? 
          AND original_value_hash = ?
        """;
    
    private static final String INSERT_SQL = """
        MERGE INTO lookup (
            database_name, table_name, column_name, original_value_hash,
            anonymized_value, strategy, data_type, created_at, last_used_at, usage_count
        ) KEY (database_name, table_name, column_name, original_value_hash)
        VALUES (?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1)
        """;
    
    private static final String UPDATE_SQL = """
        UPDATE lookup 
        SET last_used_at = CURRENT_TIMESTAMP, 
            usage_count = usage_count + 1 
        WHERE database_name = ? 
          AND table_name = ? 
          AND column_name = ? 
          AND original_value_hash = ?
        """;
    
    /**
     * Create a new H2 lookup manager with file-based storage.
     * 
     * @param dbFilePath Path to the H2 database file (without .mv.db extension)
     * @param salt Salt for hashing original values
     * @throws AnonymizationException if initialization fails
     */
    public H2LookupManager(Path dbFilePath, String salt) throws AnonymizationException {
        this.salt = salt != null ? salt : "AMRIT_2024_SECURE_SALT";
        
        try {
            // Create H2 embedded database connection
            String jdbcUrl = "jdbc:h2:" + dbFilePath.toAbsolutePath() + ";MODE=MySQL;AUTO_SERVER=TRUE";
            log.info("Initializing H2 lookup database: {}", jdbcUrl);
            
            this.connection = DriverManager.getConnection(jdbcUrl, "sa", "");
            this.connection.setAutoCommit(true);
            
            // Create table and index
            try (Statement stmt = connection.createStatement()) {
                stmt.execute(CREATE_TABLE_SQL);
                stmt.execute(CREATE_INDEX_SQL);
            }
            
            // Prepare statements
            this.insertStmt = connection.prepareStatement(INSERT_SQL);
            this.selectStmt = connection.prepareStatement(SELECT_SQL);
            this.updateStmt = connection.prepareStatement(UPDATE_SQL);
            
            long count = getLookupCount();
            log.info("H2 lookup database initialized successfully. Current entries: {}", count);
            
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to initialize H2 lookup database", e);
        }
    }
    
    /**
     * Find an anonymized value for the given original value.
     * 
     * @param databaseName Database name
     * @param tableName Table name
     * @param columnName Column name
     * @param originalValue Original value to look up
     * @return Anonymized value if found, empty if not found
     * @throws AnonymizationException if lookup fails
     */
    public Optional<String> findAnonymized(String databaseName, String tableName, 
                                           String columnName, String originalValue) 
                                           throws AnonymizationException {
        try {
            String hash = hashValue(originalValue);
            
            selectStmt.setString(1, databaseName);
            selectStmt.setString(2, tableName);
            selectStmt.setString(3, columnName);
            selectStmt.setString(4, hash);
            
            try (ResultSet rs = selectStmt.executeQuery()) {
                if (rs.next()) {
                    String anonymized = rs.getString("anonymized_value");
                    
                    // Update last_used_at and usage_count
                    updateStmt.setString(1, databaseName);
                    updateStmt.setString(2, tableName);
                    updateStmt.setString(3, columnName);
                    updateStmt.setString(4, hash);
                    updateStmt.executeUpdate();
                    
                    log.debug("Cache hit for {}.{}.{}", databaseName, tableName, columnName);
                    return Optional.of(anonymized);
                }
            }
            
            return Optional.empty();
            
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to lookup value", e);
        }
    }
    
    /**
     * Store a mapping of original to anonymized value.
     * 
     * @param databaseName Database name
     * @param tableName Table name
     * @param columnName Column name
     * @param originalValue Original value
     * @param anonymizedValue Anonymized value
     * @param strategy Strategy used for anonymization
     * @param dataType Data type of the column
     * @throws AnonymizationException if store fails
     */
    public void storeMapping(String databaseName, String tableName, String columnName,
                            String originalValue, String anonymizedValue, 
                            String strategy, String dataType) 
                            throws AnonymizationException {
        try {
            String hash = hashValue(originalValue);
            
            insertStmt.setString(1, databaseName);
            insertStmt.setString(2, tableName);
            insertStmt.setString(3, columnName);
            insertStmt.setString(4, hash);
            insertStmt.setString(5, anonymizedValue);
            insertStmt.setString(6, strategy);
            insertStmt.setString(7, dataType);
            
            insertStmt.executeUpdate();
            
            log.debug("Stored mapping for {}.{}.{}", databaseName, tableName, columnName);
            
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to store mapping", e);
        }
    }
    
    /**
     * Get total number of entries in lookup table.
     */
    public long getLookupCount() throws AnonymizationException {
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM lookup")) {
            
            if (rs.next()) {
                return rs.getLong(1);
            }
            return 0;
            
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to get lookup count", e);
        }
    }
    
    /**
     * Clear all entries from lookup table.
     * Use with caution!
     */
    public void clearAll() throws AnonymizationException {
        try (Statement stmt = connection.createStatement()) {
            log.warn("Clearing all lookup entries");
            stmt.execute("TRUNCATE TABLE lookup");
            log.info("Lookup table cleared");
            
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to clear lookup table", e);
        }
    }
    
    /**
     * Compact the H2 database file (reduce size after deletions).
     */
    public void compact() throws AnonymizationException {
        try (Statement stmt = connection.createStatement()) {
            log.info("Compacting H2 database...");
            stmt.execute("SHUTDOWN COMPACT");
            log.info("Database compacted successfully");
            
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to compact database", e);
        }
    }
    
    /**
     * Hash a value using SHA-256 with salt.
     */
    private String hashValue(String value) {
        if (value == null) {
            return DigestUtils.sha256Hex("");
        }
        String saltedValue = salt + value + salt;
        return DigestUtils.sha256Hex(saltedValue);
    }
    
    @Override
    public void close() throws AnonymizationException {
        try {
            if (selectStmt != null) selectStmt.close();
            if (insertStmt != null) insertStmt.close();
            if (updateStmt != null) updateStmt.close();
            if (connection != null && !connection.isClosed()) {
                connection.close();
                log.info("H2 lookup database connection closed");
            }
        } catch (SQLException e) {
            throw new AnonymizationException("Failed to close H2 connection", e);
        }
    }
}
