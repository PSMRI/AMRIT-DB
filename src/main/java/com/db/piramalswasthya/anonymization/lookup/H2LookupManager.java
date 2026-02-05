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
        this(dbFilePath, salt, generateSecurePassword());
    }
    
    /**
     * Create a new H2 lookup manager with file-based storage and custom password.
     * 
     * @param dbFilePath Path to the H2 database file (without .mv.db extension)
     * @param salt Salt for hashing original values
     * @param password Password for H2 database connection (minimum 16 characters recommended)
     * @throws AnonymizationException if initialization fails
     */
    public H2LookupManager(Path dbFilePath, String salt, String password) throws AnonymizationException {
        // Validate salt security - NEVER use default hardcoded salts
        if (salt == null || salt.isEmpty()) {
            throw new AnonymizationException("Salt cannot be null or empty. Generate a secure salt using: openssl rand -hex 32");
        }
        if (salt.length() < 16) {
            throw new AnonymizationException("Salt must be at least 16 characters for security. Current length: " + salt.length());
        }
        if ("AMRIT_2024_SECURE_SALT".equals(salt) || "default".equalsIgnoreCase(salt) || "salt".equalsIgnoreCase(salt)) {
            throw new AnonymizationException("Hardcoded default salt detected. Generate a unique secure salt for production.");
        }
        this.salt = salt;
        
        // Validate password security
        if (password == null || password.isEmpty()) {
            throw new AnonymizationException("H2 database password cannot be empty for security reasons");
        }
        if (password.length() < 16) {
            throw new AnonymizationException("H2 database password must be at least 16 characters. Current length: " + password.length());
        }
        
        // Validate database file path to prevent path traversal
        if (dbFilePath == null) {
            throw new AnonymizationException("Database file path cannot be null");
        }
        String pathStr = dbFilePath.toAbsolutePath().normalize().toString();
        if (pathStr.contains("..") || pathStr.contains("~")) {
            throw new AnonymizationException("Invalid database path - potential path traversal attack detected");
        }
        
        try {
            // Create H2 embedded database connection
            String jdbcUrl = "jdbc:h2:" + dbFilePath.toAbsolutePath() + ";MODE=MySQL;AUTO_SERVER=TRUE;CIPHER=AES";
            log.info("Initializing H2 lookup database: {}", jdbcUrl);
            
            // H2 with CIPHER requires password format: "file_password user_password"
            String h2Password = password + " " + password;
            this.connection = DriverManager.getConnection(jdbcUrl, "sa", h2Password);
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
            
            // Get count inline to avoid overridable method call in constructor
            long count = 0;
            try (Statement countStmt = connection.createStatement();
                 ResultSet rs = countStmt.executeQuery("SELECT COUNT(*) FROM lookup")) {
                if (rs.next()) {
                    count = rs.getLong(1);
                }
            }
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
     * Generate a secure random password for H2 database.
     * Uses cryptographically strong random number generator (SecureRandom).
     * 
     * SECURITY NOTE: This generates a 256-bit password for H2 database encryption.
     * The password is session-specific and not persisted.
     * 
     * @return SHA-256 hex string of 32 random bytes (64 hex characters)
     */
    private static String generateSecurePassword() {
        java.security.SecureRandom random = new java.security.SecureRandom();
        byte[] bytes = new byte[32]; // 256 bits
        random.nextBytes(bytes);
        return DigestUtils.sha256Hex(bytes);
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
