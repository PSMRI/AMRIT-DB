package com.db.piramalswasthya.anonymizer.output;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPOutputStream;

/**
 * Writes anonymized data to SQL dump file (optionally compressed)
 */
public class SqlDumpWriter implements AutoCloseable {
    
    private static final Logger log = LoggerFactory.getLogger(SqlDumpWriter.class);
    
    private final BufferedWriter writer;
    private final String outputPath;
    private final boolean compress;
    
    public SqlDumpWriter(String outputPath, boolean compress) throws IOException {
        this.outputPath = outputPath;
        this.compress = compress;
        
        Path path = Paths.get(outputPath);
        Files.createDirectories(path.getParent());
        
        OutputStream os = new FileOutputStream(outputPath);
        if (compress) {
            os = new GZIPOutputStream(os);
        }
        
        this.writer = new BufferedWriter(new OutputStreamWriter(os));
        
        log.info("SQL dump writer initialized: {} (compress={})", outputPath, compress);
        writeHeader();
    }
    
    private void writeHeader() throws IOException {
        writer.write("-- AMRIT Database Anonymization Output\n");
        writer.write("-- Generated: " + java.time.LocalDateTime.now() + "\n");
        writer.write("-- WARNING: This file contains anonymized data\n");
        writer.write("\n");
        writer.write("SET FOREIGN_KEY_CHECKS=0;\n");
        writer.write("SET UNIQUE_CHECKS=0;\n");
        writer.write("SET AUTOCOMMIT=0;\n");
        writer.write("\n");
    }
    
    /**
     * Write INSERT statement for a batch of rows
     */
    public void writeInsert(String tableName, List<String> columns, 
                           List<Map<String, Object>> rows) throws IOException {
        
        if (rows.isEmpty()) {
            return;
        }
        
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO `").append(tableName).append("` (");
        sql.append(String.join(", ", columns.stream()
            .map(c -> "`" + c + "`")
            .toList()));
        sql.append(") VALUES\n");
        
        for (int i = 0; i < rows.size(); i++) {
            Map<String, Object> row = rows.get(i);
            sql.append("(");
            
            for (int j = 0; j < columns.size(); j++) {
                String column = columns.get(j);
                Object value = row.get(column);
                
                if (value == null) {
                    sql.append("NULL");
                } else if (value instanceof String) {
                    sql.append("'").append(escapeSql((String) value)).append("'");
                } else if (value instanceof Number) {
                    sql.append(value.toString());
                } else {
                    sql.append("'").append(escapeSql(value.toString())).append("'");
                }
                
                if (j < columns.size() - 1) {
                    sql.append(", ");
                }
            }
            
            sql.append(")");
            if (i < rows.size() - 1) {
                sql.append(",\n");
            }
        }
        
        sql.append(";\n");
        writer.write(sql.toString());
    }
    
    /**
     * Escape SQL special characters
     */
    private String escapeSql(String value) {
        return value.replace("\\", "\\\\")
                   .replace("'", "\\'")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r")
                   .replace("\0", "");
    }
    
    public void writeFooter() throws IOException {
        writer.write("\n");
        writer.write("COMMIT;\n");
        writer.write("SET FOREIGN_KEY_CHECKS=1;\n");
        writer.write("SET UNIQUE_CHECKS=1;\n");
        writer.write("SET AUTOCOMMIT=1;\n");
        log.info("SQL dump completed: {}", outputPath);
    }
    
    @Override
    public void close() throws IOException {
        if (writer != null) {
            writeFooter();
            writer.close();
        }
    }
}
