package com.db.piramalswasthya.anonymization.processor.parser;

import com.db.piramalswasthya.anonymization.processor.model.SQLStatement;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class InsertStatementParserTest {
    
    private final InsertStatementParser parser = new InsertStatementParser();
    
    @Test
    void testParseSingleRowInsert() {
        String sql = "INSERT INTO `m_user` VALUES (1,'John Doe','john@test.com','9876543210');";
        
        SQLStatement result = parser.parse(sql);
        
        assertNotNull(result);
        assertEquals("m_user", result.getTableName());
        assertEquals(1, result.getRowValues().size());
        
        List<String> values = result.getRowValues().get(0);
        assertEquals(4, values.size());
        assertEquals("1", values.get(0));
        assertEquals("John Doe", values.get(1));
        assertEquals("john@test.com", values.get(2));
        assertEquals("9876543210", values.get(3));
    }
    
    @Test
    void testParseBatchInsert() {
        String sql = """
            INSERT INTO `m_user` VALUES 
            (1,'John','john@test.com'),
            (2,'Jane','jane@test.com'),
            (3,'Bob','bob@test.com');
            """;
        
        SQLStatement result = parser.parse(sql);
        
        assertNotNull(result);
        assertEquals("m_user", result.getTableName());
        assertEquals(3, result.getRowValues().size());
        
        assertEquals("John", result.getRowValues().get(0).get(1));
        assertEquals("Jane", result.getRowValues().get(1).get(1));
        assertEquals("Bob", result.getRowValues().get(2).get(1));
    }
    
    @Test
    void testParseWithNullValues() {
        String sql = "INSERT INTO `m_user` VALUES (1,'John',NULL,'9876543210');";
        
        SQLStatement result = parser.parse(sql);
        
        assertNotNull(result);
        assertEquals(1, result.getRowValues().size());
        
        List<String> values = result.getRowValues().get(0);
        assertEquals("NULL", values.get(2));
    }
    
    @Test
    void testParseWithSpecialCharacters() {
        String sql = "INSERT INTO `m_user` VALUES (1,'O\\'Brien','test@domain.com');";
        
        SQLStatement result = parser.parse(sql);
        
        assertNotNull(result);
        List<String> values = result.getRowValues().get(0);
        assertEquals("O'Brien", values.get(1));
    }
    
    @Test
    void testParseWithColumnList() {
        String sql = "INSERT INTO `m_user` (UserID, UserName, EmailID) VALUES (1,'John','john@test.com');";
        
        SQLStatement result = parser.parse(sql);
        
        assertNotNull(result);
        assertEquals("m_user", result.getTableName());
        assertNotNull(result.getColumnNames());
        assertEquals(3, result.getColumnNames().size());
        assertEquals("UserID", result.getColumnNames().get(0));
        assertEquals("UserName", result.getColumnNames().get(1));
        assertEquals("EmailID", result.getColumnNames().get(2));
    }
    
    @Test
    void testIsInsertStatement() {
        SQLStatement result1 = parser.parse("INSERT INTO users VALUES (1,'test');");
        assertEquals(SQLStatement.StatementType.INSERT, result1.getType());
        
        SQLStatement result2 = parser.parse("  INSERT INTO users VALUES (1,'test');");
        assertEquals(SQLStatement.StatementType.INSERT, result2.getType());
        
        SQLStatement result3 = parser.parse("CREATE TABLE users (id INT);");
        assertEquals(SQLStatement.StatementType.CREATE_TABLE, result3.getType());
        
        SQLStatement result4 = parser.parse("-- INSERT INTO users");
        assertEquals(SQLStatement.StatementType.COMMENT, result4.getType());
        
        SQLStatement result5 = parser.parse("UPDATE users SET name='test';");
        assertEquals(SQLStatement.StatementType.OTHER, result5.getType());
    }
}
