package com.db.piramalswasthya.anonymization.processor.parser;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class SQLDumpReaderTest {
    
    @Test
    void testReadSimpleInsertStatements(@TempDir Path tempDir) throws IOException {
        // Create test SQL file
        Path sqlFile = tempDir.resolve("test.sql");
        String content = """
            -- Test SQL
            INSERT INTO users VALUES (1,'John','john@test.com');
            INSERT INTO users VALUES (2,'Jane','jane@test.com');
            """;
        Files.writeString(sqlFile, content);
        
        // Read and parse
        List<String> statements = new ArrayList<>();
        try (SQLDumpReader reader = new SQLDumpReader(sqlFile)) {
            String statement;
            while ((statement = reader.readStatement()) != null) {
                if (statement.trim().startsWith("INSERT")) {
                    statements.add(statement);
                }
            }
        }
        
        assertEquals(2, statements.size());
        assertTrue(statements.get(0).contains("John"));
        assertTrue(statements.get(1).contains("Jane"));
    }
    
    @Test
    void testSkipCommentsAndEmptyLines(@TempDir Path tempDir) throws IOException {
        Path sqlFile = tempDir.resolve("test.sql");
        String content = """
            -- Comment line
            
            INSERT INTO users VALUES (1,'Test');
            # Another comment
            
            INSERT INTO users VALUES (2,'Test2');
            """;
        Files.writeString(sqlFile, content);
        
        List<String> nonEmptyLines = new ArrayList<>();
        try (SQLDumpReader reader = new SQLDumpReader(sqlFile)) {
            String statement;
            while ((statement = reader.readStatement()) != null) {
                if (!statement.isEmpty()) {
                    nonEmptyLines.add(statement);
                }
            }
        }
        
        assertEquals(2, nonEmptyLines.size());
    }
    
    @Test
    void testHandleLargeFile(@TempDir Path tempDir) throws IOException {
        Path sqlFile = tempDir.resolve("large.sql");
        
        // Generate 10000 INSERT statements
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < 10000; i++) {
            content.append(String.format("INSERT INTO test VALUES (%d,'name_%d');\n", i, i));
        }
        Files.writeString(sqlFile, content.toString());
        
        int count = 0;
        try (SQLDumpReader reader = new SQLDumpReader(sqlFile)) {
            while (reader.readStatement() != null) {
                count++;
            }
        }
        
        assertEquals(10000, count);
    }
}
