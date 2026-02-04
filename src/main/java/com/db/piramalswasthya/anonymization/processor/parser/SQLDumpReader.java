package com.db.piramalswasthya.anonymization.processor.parser;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.zip.GZIPInputStream;

/**
 * Streaming SQL dump file reader.
 * Handles large multi-GB dump files with constant memory usage.
 * Supports both plain .sql and compressed .sql.gz files.
 */
public class SQLDumpReader implements AutoCloseable {
    
    private static final Logger log = LoggerFactory.getLogger(SQLDumpReader.class);
    
    private final BufferedReader reader;
    private final Path filePath;
    private final long fileSize;
    private long bytesRead;
    private int lineNumber;
    private StringBuilder statementBuffer;
    private String currentLine;
    
    /**
     * Create a reader for a SQL dump file
     * 
     * @param filePath Path to .sql or .sql.gz file
     * @throws AnonymizationException if file cannot be opened
     */
    public SQLDumpReader(Path filePath) throws AnonymizationException {
        this.filePath = filePath;
        this.lineNumber = 0;
        this.bytesRead = 0;
        this.statementBuffer = new StringBuilder(8192);
        
        try {
            if (!Files.exists(filePath)) {
                throw new AnonymizationException("SQL dump file not found: " + filePath);
            }
            
            this.fileSize = Files.size(filePath);
            
            // Detect compressed files
            if (filePath.toString().endsWith(".gz")) {
                log.info("Opening compressed SQL dump: {}", filePath);
                this.reader = new BufferedReader(
                    new InputStreamReader(
                        new GZIPInputStream(new FileInputStream(filePath.toFile())),
                        StandardCharsets.UTF_8
                    )
                );
            } else {
                log.info("Opening SQL dump: {}", filePath);
                this.reader = new BufferedReader(
                    new InputStreamReader(
                        new FileInputStream(filePath.toFile()),
                        StandardCharsets.UTF_8
                    ),
                    65536 // 64KB buffer
                );
            }
            
            log.info("SQL dump file size: {} MB", fileSize / (1024 * 1024));
            
        } catch (IOException e) {
            throw new AnonymizationException("Failed to open SQL dump file: " + filePath, e);
        }
    }
    
    /**
     * Read the next complete SQL statement from the dump.
     * Handles multi-line statements ending with semicolon.
     * 
     * @return Complete SQL statement, or null if end of file
     * @throws AnonymizationException if read error occurs
     */
    public String readStatement() throws AnonymizationException {
        statementBuffer.setLength(0);
        
        try {
            while ((currentLine = reader.readLine()) != null) {
                lineNumber++;
                bytesRead += currentLine.getBytes(StandardCharsets.UTF_8).length + 1; // +1 for newline
                
                // Skip empty lines
                String trimmed = currentLine.trim();
                if (trimmed.isEmpty()) {
                    continue;
                }
                
                // Handle single-line comments
                if (trimmed.startsWith("--") || trimmed.startsWith("#")) {
                    if (statementBuffer.length() == 0) {
                        return trimmed; // Return comment as statement
                    }
                    continue; // Skip inline comments
                }
                
                // Handle multi-line comments (/* ... */)
                if (trimmed.startsWith("/*")) {
                    if (trimmed.endsWith("*/")) {
                        if (statementBuffer.length() == 0) {
                            return trimmed; // Return single-line block comment
                        }
                        continue;
                    }
                    // Multi-line comment start - skip until */
                    while ((currentLine = reader.readLine()) != null) {
                        lineNumber++;
                        if (currentLine.trim().endsWith("*/")) {
                            break;
                        }
                    }
                    continue;
                }
                
                // Append line to statement buffer
                if (statementBuffer.length() > 0) {
                    statementBuffer.append(' ');
                }
                statementBuffer.append(trimmed);
                
                // Check if statement is complete (ends with semicolon)
                if (trimmed.endsWith(";")) {
                    String statement = statementBuffer.toString();
                    statementBuffer.setLength(0);
                    return statement;
                }
            }
            
            // End of file - return any remaining buffered content
            if (statementBuffer.length() > 0) {
                String statement = statementBuffer.toString();
                statementBuffer.setLength(0);
                return statement;
            }
            
            return null; // EOF
            
        } catch (IOException e) {
            throw new AnonymizationException("Error reading SQL dump at line " + lineNumber, e);
        }
    }
    
    /**
     * Get current reading progress (0.0 to 1.0)
     * Note: For compressed files, this is an estimate
     */
    public double getProgress() {
        if (fileSize == 0) {
            return 0.0;
        }
        return Math.min(1.0, (double) bytesRead / fileSize);
    }
    
    /**
     * Get current line number being processed
     */
    public int getLineNumber() {
        return lineNumber;
    }
    
    /**
     * Get number of bytes read so far
     */
    public long getBytesRead() {
        return bytesRead;
    }
    
    /**
     * Get total file size in bytes
     */
    public long getFileSize() {
        return fileSize;
    }
    
    /**
     * Get file path being read
     */
    public Path getFilePath() {
        return filePath;
    }
    
    @Override
    public void close() throws AnonymizationException {
        try {
            if (reader != null) {
                reader.close();
            }
            log.info("Closed SQL dump reader. Total lines read: {}, bytes: {}", lineNumber, bytesRead);
        } catch (IOException e) {
            throw new AnonymizationException("Error closing SQL dump reader", e);
        }
    }
}
