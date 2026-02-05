package com.db.piramalswasthya.anonymizer.output;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Writes anonymized data directly to target database (DB2)
 */
public class DirectRestoreWriter implements AutoCloseable {
    
    private static final Logger log = LoggerFactory.getLogger(DirectRestoreWriter.class);
    
    private final DataSource targetDataSource;
    private final Connection connection;
    private final int batchSize;
    
    public DirectRestoreWriter(DataSource targetDataSource, int batchSize) throws SQLException {
        this.targetDataSource = targetDataSource;
        this.batchSize = batchSize;
        this.connection = targetDataSource.getConnection();
        this.connection.setAutoCommit(false);
        
        log.info("Direct restore writer initialized (batchSize={})", batchSize);
    }
    
    /**
     * Write batch directly to target database
     */
    public void writeInsert(String tableName, List<String> columns, 
                           List<Map<String, Object>> rows) throws SQLException {
        
        if (rows.isEmpty()) {
            return;
        }
        
        String placeholders = columns.stream()
            .map(c -> "?")
            .collect(Collectors.joining(", "));
        
        String columnList = columns.stream()
            .map(c -> "`" + c + "`")
            .collect(Collectors.joining(", "));
        
        String sql = String.format("INSERT INTO `%s` (%s) VALUES (%s)",
            tableName, columnList, placeholders);
        
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
     * Truncate table before restore
     */
    public void truncateTable(String tableName) throws SQLException {
        try (PreparedStatement stmt = connection.prepareStatement(
                "TRUNCATE TABLE `" + tableName + "`")) {
            stmt.execute();
            connection.commit();
            log.info("Truncated table: {}", tableName);
        }
    }
    
    @Override
    public void close() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.commit();
            connection.close();
            log.info("Direct restore writer closed");
        }
    }
}
