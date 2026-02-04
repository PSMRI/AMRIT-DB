package com.db.piramalswasthya.anonymization.registry;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.model.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.stream.Collectors;

/**
 * Computes SHA-256 hashes of database schemas for drift detection.
 * Hashes are computed over canonicalized schema representations.
 */
@Slf4j
@Service
public class SchemaHasher {
    
    /**
     * Compute SHA-256 hash of entire database schema.
     *
     * @param db Database metadata
     * @return Hex-encoded SHA-256 hash
     */
    public String computeDatabaseHash(DatabaseMetadata db) {
        String canonicalRepresentation = canonicalizeDatabase(db);
        return sha256Hex(canonicalRepresentation);
    }
    
    /**
     * Compute SHA-256 hash of a single table schema.
     *
     * @param table Table metadata
     * @return Hex-encoded SHA-256 hash
     */
    public String computeTableHash(TableMetadata table) {
        String canonicalRepresentation = canonicalizeTable(table);
        return sha256Hex(canonicalRepresentation);
    }
    
    /**
     * Create canonical string representation of database schema.
     * Format ensures consistent ordering for hash stability.
     */
    private String canonicalizeDatabase(DatabaseMetadata db) {
        StringBuilder sb = new StringBuilder();
        sb.append("DATABASE:").append(db.getDatabaseName()).append("\n");
        
        // Sort tables alphabetically for consistency
        db.getTables().stream()
            .sorted((t1, t2) -> t1.getName().compareTo(t2.getName()))
            .forEach(table -> {
                sb.append(canonicalizeTable(table));
            });
        
        return sb.toString();
    }
    
    /**
     * Create canonical string representation of table schema.
     */
    private String canonicalizeTable(TableMetadata table) {
        StringBuilder sb = new StringBuilder();
        sb.append("TABLE:").append(table.getName()).append("\n");
        
        // Sort columns by ordinal position (or name if position unavailable)
        table.getColumns().stream()
            .sorted((c1, c2) -> {
                if (c1.getOrdinalPosition() != null && c2.getOrdinalPosition() != null) {
                    return Integer.compare(c1.getOrdinalPosition(), c2.getOrdinalPosition());
                }
                return c1.getName().compareTo(c2.getName());
            })
            .forEach(column -> {
                sb.append("  COLUMN:").append(column.getName())
                  .append(":").append(column.getDataType())
                  .append(":").append(column.getNullable() ? "NULL" : "NOT_NULL");
                
                if (Boolean.TRUE.equals(column.getPrimaryKey())) {
                    sb.append(":PK");
                }
                if (Boolean.TRUE.equals(column.getUniqueConstraint())) {
                    sb.append(":UNIQUE");
                }
                
                sb.append("\n");
            });
        
        // Include foreign keys (sorted by column name)
        table.getForeignKeys().stream()
            .sorted((fk1, fk2) -> fk1.getFkColumnName().compareTo(fk2.getFkColumnName()))
            .forEach(fk -> {
                sb.append("  FK:").append(fk.getFkColumnName())
                  .append("->").append(fk.getPkTableSchema() != null ? fk.getPkTableSchema() + "." : "")
                  .append(fk.getPkTableName()).append(".").append(fk.getPkColumnName())
                  .append("\n");
            });
        
        // Include indexes (sorted by name)
        table.getIndexes().stream()
            .sorted((i1, i2) -> i1.getIndexName().compareTo(i2.getIndexName()))
            .forEach(index -> {
                sb.append("  INDEX:").append(index.getIndexName())
                  .append(":").append(index.getUnique() ? "UNIQUE" : "NON_UNIQUE")
                  .append(":").append(String.join(",", index.getColumns()))
                  .append("\n");
            });
        
        return sb.toString();
    }
    
    /**
     * Compute SHA-256 hash and return as hex string.
     */
    private String sha256Hex(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(input.getBytes(StandardCharsets.UTF_8));
            
            // Convert to hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            
            return "sha256:" + hexString.toString();
            
        } catch (NoSuchAlgorithmException e) {
            log.error("SHA-256 algorithm not available", e);
            throw new AnonymizationException("Failed to compute schema hash", e);
        }
    }
    
    /**
     * Compare two schema hashes to detect drift.
     *
     * @param expectedHash Hash from registry
     * @param actualHash Hash from current schema
     * @return true if hashes match (no drift)
     */
    public boolean compareHashes(String expectedHash, String actualHash) {
        if (expectedHash == null || actualHash == null) {
            return false;
        }
        return expectedHash.equals(actualHash);
    }
}
