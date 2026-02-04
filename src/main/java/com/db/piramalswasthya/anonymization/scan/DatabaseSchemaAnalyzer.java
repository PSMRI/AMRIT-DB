package com.db.piramalswasthya.anonymization.scan;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.model.*;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import javax.sql.DataSource;
import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

/**
 * Extracts complete schema metadata from MySQL databases using JDBC DatabaseMetaData.
 * NO raw data values are queried - metadata only.
 */
@Slf4j
@Service
public class DatabaseSchemaAnalyzer {

    private static final Logger log = LoggerFactory.getLogger(DatabaseSchemaAnalyzer.class);

    /**
     * Analyze a single database and extract all schema metadata.
     *
     * @param dataSource JDBC DataSource for the database
     * @param databaseName Logical name (e.g., "db_identity")
     * @return Complete database metadata
     */
    public DatabaseMetadata analyzeDatabase(DataSource dataSource, String databaseName) {
        log.info("Starting schema analysis for database: {}", databaseName);
        
        try (Connection conn = dataSource.getConnection()) {
            DatabaseMetaData metaData = conn.getMetaData();
            
            DatabaseMetadata dbMetadata = DatabaseMetadata.builder()
                .databaseName(databaseName)
                .productName(metaData.getDatabaseProductName())
                .productVersion(metaData.getDatabaseProductVersion())
                .driverName(metaData.getDriverName())
                .driverVersion(metaData.getDriverVersion())
                .capturedAt(Instant.now().toString())
                .build();
            
            // Get catalog name (MySQL uses catalogs as database names)
            String catalog = conn.getCatalog();
            log.debug("Connected to catalog: {}", catalog);
            
            // Extract all tables
            List<TableMetadata> tables = extractTables(metaData, catalog);
            dbMetadata.setTables(tables);
            
            log.info("Completed analysis for {}: {} tables, {} PII columns", 
                databaseName, tables.size(), dbMetadata.getTotalPiiColumnCount());
            
            return dbMetadata;
            
        } catch (SQLException e) {
            log.error("Failed to analyze database {}: {}", databaseName, e.getMessage(), e);
            throw new AnonymizationException("Database analysis failed for " + databaseName, e);
        }
    }
    
    /**
     * Extract all tables from the database.
     */
    private List<TableMetadata> extractTables(DatabaseMetaData metaData, String catalog) throws SQLException {
        List<TableMetadata> tables = new ArrayList<>();
        
        try (ResultSet rs = metaData.getTables(catalog, null, "%", new String[]{"TABLE"})) {
            while (rs.next()) {
                String tableName = rs.getString("TABLE_NAME");
                String tableType = rs.getString("TABLE_TYPE");
                String remarks = rs.getString("REMARKS");
                
                log.debug("Analyzing table: {}", tableName);
                
                TableMetadata table = TableMetadata.builder()
                    .name(tableName)
                    .tableType(tableType)
                    .remarks(remarks)
                    .canonicalName(tableName) // Default to physical name
                    .build();
                
                // Extract columns
                table.setColumns(extractColumns(metaData, catalog, tableName));
                
                // Extract foreign keys
                table.setForeignKeys(extractForeignKeys(metaData, catalog, tableName));
                
                // Extract indexes
                table.setIndexes(extractIndexes(metaData, catalog, tableName));
                
                // Estimate row count (optional - may be slow for large tables)
                table.setEstimatedRowCount(estimateRowCount(metaData, catalog, tableName));
                
                tables.add(table);
            }
        }
        
        return tables;
    }
    
    /**
     * Extract all columns for a table.
     */
    private List<ColumnMetadata> extractColumns(DatabaseMetaData metaData, String catalog, String tableName) 
            throws SQLException {
        List<ColumnMetadata> columns = new ArrayList<>();
        
        // Get all columns
        try (ResultSet rs = metaData.getColumns(catalog, null, tableName, "%")) {
            while (rs.next()) {
                String columnName = rs.getString("COLUMN_NAME");
                String dataType = rs.getString("TYPE_NAME");
                int columnSize = rs.getInt("COLUMN_SIZE");
                boolean nullable = "YES".equalsIgnoreCase(rs.getString("IS_NULLABLE"));
                String defaultValue = rs.getString("COLUMN_DEF");
                int ordinalPosition = rs.getInt("ORDINAL_POSITION");
                
                ColumnMetadata column = ColumnMetadata.builder()
                    .name(columnName)
                    .dataType(dataType + (columnSize > 0 ? "(" + columnSize + ")" : ""))
                    .columnSize(columnSize)
                    .nullable(nullable)
                    .defaultValue(defaultValue)
                    .ordinalPosition(ordinalPosition)
                    .canonicalName(columnName) // Default to physical name
                    .primaryKey(false) // Will be updated later
                    .uniqueConstraint(false) // Will be updated later
                    .build();
                
                columns.add(column);
            }
        }
        
        // Mark primary keys
        markPrimaryKeys(metaData, catalog, tableName, columns);
        
        // Mark unique constraints
        markUniqueConstraints(metaData, catalog, tableName, columns);
        
        return columns;
    }
    
    /**
     * Mark columns that are primary keys.
     */
    private void markPrimaryKeys(DatabaseMetaData metaData, String catalog, String tableName, 
                                  List<ColumnMetadata> columns) throws SQLException {
        try (ResultSet rs = metaData.getPrimaryKeys(catalog, null, tableName)) {
            while (rs.next()) {
                String pkColumnName = rs.getString("COLUMN_NAME");
                columns.stream()
                    .filter(c -> c.getName().equals(pkColumnName))
                    .forEach(c -> c.setPrimaryKey(true));
            }
        }
    }
    
    /**
     * Mark columns that have unique constraints.
     */
    private void markUniqueConstraints(DatabaseMetaData metaData, String catalog, String tableName, 
                                       List<ColumnMetadata> columns) throws SQLException {
        try (ResultSet rs = metaData.getIndexInfo(catalog, null, tableName, true, false)) {
            while (rs.next()) {
                boolean nonUnique = rs.getBoolean("NON_UNIQUE");
                if (!nonUnique) {
                    String columnName = rs.getString("COLUMN_NAME");
                    if (columnName != null) {
                        columns.stream()
                            .filter(c -> c.getName().equals(columnName))
                            .forEach(c -> c.setUniqueConstraint(true));
                    }
                }
            }
        }
    }
    
    /**
     * Extract foreign key relationships.
     */
    private List<ForeignKeyMetadata> extractForeignKeys(DatabaseMetaData metaData, String catalog, String tableName) 
            throws SQLException {
        List<ForeignKeyMetadata> foreignKeys = new ArrayList<>();
        
        try (ResultSet rs = metaData.getImportedKeys(catalog, null, tableName)) {
            while (rs.next()) {
                ForeignKeyMetadata fk = ForeignKeyMetadata.builder()
                    .fkColumnName(rs.getString("FKCOLUMN_NAME"))
                    .pkTableName(rs.getString("PKTABLE_NAME"))
                    .pkColumnName(rs.getString("PKCOLUMN_NAME"))
                    .pkTableSchema(rs.getString("PKTABLE_CAT")) // Cross-DB relationships
                    .constraintName(rs.getString("FK_NAME"))
                    .updateRule(rs.getInt("UPDATE_RULE"))
                    .deleteRule(rs.getInt("DELETE_RULE"))
                    .build();
                
                foreignKeys.add(fk);
            }
        }
        
        return foreignKeys;
    }
    
    /**
     * Extract index information.
     */
    private List<IndexMetadata> extractIndexes(DatabaseMetaData metaData, String catalog, String tableName) 
            throws SQLException {
        List<IndexMetadata> indexes = new ArrayList<>();
        
        try (ResultSet rs = metaData.getIndexInfo(catalog, null, tableName, false, false)) {
            IndexMetadata currentIndex = null;
            
            while (rs.next()) {
                String indexName = rs.getString("INDEX_NAME");
                if (indexName == null) continue; // Skip table statistics
                
                boolean nonUnique = rs.getBoolean("NON_UNIQUE");
                String columnName = rs.getString("COLUMN_NAME");
                short type = rs.getShort("TYPE");
                
                // Group columns by index name
                if (currentIndex == null || !currentIndex.getIndexName().equals(indexName)) {
                    if (currentIndex != null) {
                        indexes.add(currentIndex);
                    }
                    currentIndex = IndexMetadata.builder()
                        .indexName(indexName)
                        .unique(!nonUnique)
                        .primary("PRIMARY".equalsIgnoreCase(indexName))
                        .indexType(getIndexTypeName(type))
                        .columns(new ArrayList<>())
                        .build();
                }
                
                if (columnName != null && currentIndex != null) {
                    currentIndex.getColumns().add(columnName);
                }
            }
            
            if (currentIndex != null) {
                indexes.add(currentIndex);
            }
        }
        
        return indexes;
    }
    
    /**
     * Estimate row count from table statistics (avoids COUNT(*) queries).
     */
    private Long estimateRowCount(DatabaseMetaData metaData, String catalog, String tableName) {
        // Use MySQL-specific query to get row count from information_schema
        String query = "SELECT TABLE_ROWS FROM information_schema.TABLES " +
                      "WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?";
        
        try (Connection conn = metaData.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, catalog);
            stmt.setString(2, tableName);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getLong("TABLE_ROWS");
                }
            }
        } catch (SQLException e) {
            log.debug("Could not estimate row count for {}.{}: {}", catalog, tableName, e.getMessage());
        }
        
        return null;
    }
    
    /**
     * Convert JDBC index type constant to string.
     */
    private String getIndexTypeName(short type) {
        switch (type) {
            case DatabaseMetaData.tableIndexStatistic:
                return "STATISTIC";
            case DatabaseMetaData.tableIndexClustered:
                return "CLUSTERED";
            case DatabaseMetaData.tableIndexHashed:
                return "HASHED";
            case DatabaseMetaData.tableIndexOther:
            default:
                return "OTHER";
        }
    }
}
