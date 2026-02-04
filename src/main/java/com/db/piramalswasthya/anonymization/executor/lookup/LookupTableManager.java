package com.db.piramalswasthya.anonymization.executor.lookup;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.executor.model.LookupEntry;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;


@Component
public class LookupTableManager {
    private static final Logger log = LoggerFactory.getLogger(LookupTableManager.class);
    private final JdbcTemplate jdbcTemplate;
    
    @Value("${anonymization.lookup.database:db_iemr}")
    private String lookupDatabase;
    
    @Value("${anonymization.lookup.table:anonymization_lookup}")
    private String lookupTable;
    
    @Value("${anonymization.hash.salt:AMRIT_2024_SECURE_SALT}")
    private String salt;
    
    public LookupTableManager(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public void initializeLookupTable() throws AnonymizationException {
        try {
            log.info("Initializing lookup table in database '{}'", lookupDatabase);
            
            jdbcTemplate.execute("USE " + lookupDatabase);
            
            String createTableSql = """
                CREATE TABLE IF NOT EXISTS anonymization_lookup (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    database_name VARCHAR(255) NOT NULL,
                    table_name VARCHAR(255) NOT NULL,
                    column_name VARCHAR(255) NOT NULL,
                    original_value_hash VARCHAR(64) NOT NULL,
                    anonymized_value TEXT NOT NULL,
                    strategy VARCHAR(50) NOT NULL,
                    data_type VARCHAR(50),
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                    last_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    usage_count INT DEFAULT 1,
                    INDEX idx_lookup_key (database_name, table_name, column_name, original_value_hash),
                    UNIQUE KEY uk_lookup (database_name, table_name, column_name, original_value_hash)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
                """;
            
            jdbcTemplate.execute(createTableSql);
            
            log.info("Lookup table '{}' initialized successfully", lookupTable);
        } catch (DataAccessException e) {
            throw new AnonymizationException("Failed to initialize lookup table", e);
        }
    }
    
    public Optional<LookupEntry> findLookup(String databaseName, String tableName, 
                                            String columnName, String originalValue) {
        try {
            String hash = hashValue(originalValue);
            
            String sql = """
                SELECT id, database_name, table_name, column_name, original_value_hash,
                       anonymized_value, strategy, data_type, created_at, last_used_at, usage_count
                FROM anonymization_lookup
                WHERE database_name = ? AND table_name = ? AND column_name = ? AND original_value_hash = ?
                """;
            
            return Optional.ofNullable(jdbcTemplate.queryForObject(
                sql, 
                new LookupEntryRowMapper(),
                databaseName, tableName, columnName, hash
            ));
        } catch (DataAccessException e) {
            log.debug("No cached value found for {}.{}.{}", databaseName, tableName, columnName);
            return Optional.empty();
        }
    }
    
    public void saveLookup(String databaseName, String tableName, String columnName,
                          String originalValue, String anonymizedValue, String strategy, String dataType) 
                          throws AnonymizationException {
        try {
            String hash = hashValue(originalValue);
            
            String sql = """
                INSERT INTO anonymization_lookup 
                (database_name, table_name, column_name, original_value_hash, 
                 anonymized_value, strategy, data_type, created_at, last_used_at, usage_count)
                VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW(), 1)
                ON DUPLICATE KEY UPDATE 
                    last_used_at = NOW(),
                    usage_count = usage_count + 1
                """;
            
            jdbcTemplate.update(sql, databaseName, tableName, columnName, hash,
                anonymizedValue, strategy, dataType);
            
        } catch (DataAccessException e) {
            throw new AnonymizationException("Failed to save lookup entry", e);
        }
    }
    
    public long getLookupCount() {
        try {
            String sql = "SELECT COUNT(*) FROM " + lookupTable;
            Long count = jdbcTemplate.queryForObject(sql, Long.class);
            return count != null ? count : 0;
        } catch (DataAccessException e) {
            log.error("Failed to get lookup count", e);
            return 0;
        }
    }
    
    public void clearLookupTable() throws AnonymizationException {
        try {
            log.warn("Clearing all entries from lookup table '{}'", lookupTable);
            
            String sql = "TRUNCATE TABLE " + lookupTable;
            jdbcTemplate.execute(sql);
            
            log.info("Lookup table cleared successfully");
        } catch (DataAccessException e) {
            throw new AnonymizationException("Failed to clear lookup table", e);
        }
    }
    
    private String hashValue(String value) {
        if (value == null) {
            return DigestUtils.sha256Hex("");
        }
        String saltedValue = salt + value + salt;
        return DigestUtils.sha256Hex(saltedValue);
    }
    
    private static class LookupEntryRowMapper implements RowMapper<LookupEntry> {
        @Override
        public LookupEntry mapRow(ResultSet rs, int rowNum) throws SQLException {
            return LookupEntry.builder()
                .id(rs.getLong("id"))
                .databaseName(rs.getString("database_name"))
                .tableName(rs.getString("table_name"))
                .columnName(rs.getString("column_name"))
                .originalValueHash(rs.getString("original_value_hash"))
                .anonymizedValue(rs.getString("anonymized_value"))
                .strategy(rs.getString("strategy"))
                .dataType(rs.getString("data_type"))
                .createdAt(rs.getTimestamp("created_at").toInstant())
                .lastUsedAt(rs.getTimestamp("last_used_at").toInstant())
                .usageCount(rs.getInt("usage_count"))
                .build();
        }
    }
}
