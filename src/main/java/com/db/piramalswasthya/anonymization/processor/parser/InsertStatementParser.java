package com.db.piramalswasthya.anonymization.processor.parser;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.processor.SQLStatement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Parser for MySQL INSERT statements.
 * Handles both single-row and batch INSERT statements.
 * 
 * Supported formats:
 * - INSERT INTO table (col1, col2) VALUES (val1, val2);
 * - INSERT INTO table VALUES (val1, val2);
 * - INSERT INTO `table` (`col1`, `col2`) VALUES (val1, val2), (val3, val4);
 * - INSERT INTO db.table (col1) VALUES (val1);
 */
public class InsertStatementParser {
    
    private static final Logger log = LoggerFactory.getLogger(InsertStatementParser.class);
    
    // Regex patterns for parsing INSERT statements
    private static final Pattern INSERT_PATTERN = Pattern.compile(
        "INSERT\\s+INTO\\s+(?:`?([^`\\s.]+)`?\\.)?`?([^`\\s(]+)`?\\s*(?:\\(([^)]+)\\))?\\s*VALUES\\s*(.+)",
        Pattern.CASE_INSENSITIVE | Pattern.DOTALL
    );
    
    private static final Pattern CREATE_TABLE_PATTERN = Pattern.compile(
        "CREATE\\s+TABLE\\s+(?:IF\\s+NOT\\s+EXISTS\\s+)?(?:`?([^`\\s.]+)`?\\.)?`?([^`\\s(]+)`?\\s*\\(",
        Pattern.CASE_INSENSITIVE
    );
    
    private static final Pattern USE_DATABASE_PATTERN = Pattern.compile(
        "USE\\s+`?([^`;\\s]+)`?",
        Pattern.CASE_INSENSITIVE
    );
    
    /**
     * Parse a SQL statement and determine its type
     * 
     * @param sql SQL statement to parse
     * @return Parsed SQLStatement object
     * @throws AnonymizationException if parsing fails
     */
    public SQLStatement parse(String sql) throws AnonymizationException {
        if (sql == null || sql.trim().isEmpty()) {
            return null;
        }
        
        String trimmed = sql.trim();
        
        // Detect statement type
        if (trimmed.toUpperCase().startsWith("INSERT INTO")) {
            return parseInsert(trimmed);
        } else if (trimmed.toUpperCase().startsWith("CREATE TABLE")) {
            return parseCreateTable(trimmed);
        } else if (trimmed.toUpperCase().startsWith("USE ")) {
            return parseUseDatabase(trimmed);
        } else if (trimmed.toUpperCase().startsWith("SET ")) {
            return createSimpleStatement(SQLStatement.StatementType.SET_VARIABLE, trimmed);
        } else if (trimmed.startsWith("--") || trimmed.startsWith("#") || trimmed.startsWith("/*")) {
            return createSimpleStatement(SQLStatement.StatementType.COMMENT, trimmed);
        } else {
            return createSimpleStatement(SQLStatement.StatementType.OTHER, trimmed);
        }
    }
    
    /**
     * Parse INSERT statement
     */
    private SQLStatement parseInsert(String sql) throws AnonymizationException {
        Matcher matcher = INSERT_PATTERN.matcher(sql);
        
        if (!matcher.find()) {
            throw new AnonymizationException("Failed to parse INSERT statement: " + sql.substring(0, Math.min(100, sql.length())));
        }
        
        String databaseName = matcher.group(1);
        String tableName = matcher.group(2);
        String columnsStr = matcher.group(3);
        String valuesStr = matcher.group(4);
        
        // Parse column names
        List<String> columnNames = parseColumnNames(columnsStr);
        
        // Parse values (handles batch inserts)
        List<List<String>> rowValues = parseValues(valuesStr);
        
        return SQLStatement.builder()
            .type(SQLStatement.StatementType.INSERT)
            .originalSQL(sql)
            .databaseName(databaseName)
            .tableName(tableName)
            .columnNames(columnNames)
            .rowValues(rowValues)
            .build();
    }
    
    /**
     * Parse column names from column list
     * Example: "`col1`, `col2`, col3" -> ["col1", "col2", "col3"]
     */
    private List<String> parseColumnNames(String columnsStr) {
        List<String> columns = new ArrayList<>();
        
        if (columnsStr == null || columnsStr.trim().isEmpty()) {
            return columns; // No column list means all columns in table order
        }
        
        // Split by comma, handling backticks
        String[] parts = columnsStr.split(",");
        for (String part : parts) {
            String column = part.trim()
                .replaceAll("`", "")
                .replaceAll("\"", "")
                .trim();
            columns.add(column);
        }
        
        return columns;
    }
    
    /**
     * Parse VALUES clause, handling batch inserts
     * Example: "(1,'abc',NULL), (2,'def','xyz')" -> [[1, abc, NULL], [2, def, xyz]]
     */
    private List<List<String>> parseValues(String valuesStr) throws AnonymizationException {
        List<List<String>> allRows = new ArrayList<>();
        
        // Remove trailing semicolon
        valuesStr = valuesStr.trim();
        if (valuesStr.endsWith(";")) {
            valuesStr = valuesStr.substring(0, valuesStr.length() - 1).trim();
        }
        
        // Parse each row (value tuple)
        int pos = 0;
        while (pos < valuesStr.length()) {
            // Skip whitespace and commas
            while (pos < valuesStr.length() && (Character.isWhitespace(valuesStr.charAt(pos)) || valuesStr.charAt(pos) == ',')) {
                pos++;
            }
            
            if (pos >= valuesStr.length()) {
                break;
            }
            
            // Expect opening parenthesis
            if (valuesStr.charAt(pos) != '(') {
                throw new AnonymizationException("Expected '(' at position " + pos + " in VALUES clause");
            }
            pos++; // Skip '('
            
            // Parse values until closing parenthesis
            List<String> rowValues = new ArrayList<>();
            StringBuilder valueBuffer = new StringBuilder();
            boolean inString = false;
            char stringDelimiter = 0;
            boolean escaped = false;
            int depth = 0;
            
            while (pos < valuesStr.length()) {
                char c = valuesStr.charAt(pos);
                
                if (escaped) {
                    valueBuffer.append(c);
                    escaped = false;
                    pos++;
                    continue;
                }
                
                if (c == '\\') {
                    valueBuffer.append(c);
                    escaped = true;
                    pos++;
                    continue;
                }
                
                if (!inString && (c == '\'' || c == '"')) {
                    inString = true;
                    stringDelimiter = c;
                    valueBuffer.append(c);
                    pos++;
                    continue;
                }
                
                if (inString && c == stringDelimiter) {
                    inString = false;
                    valueBuffer.append(c);
                    pos++;
                    continue;
                }
                
                if (!inString && c == '(') {
                    depth++;
                    valueBuffer.append(c);
                    pos++;
                    continue;
                }
                
                if (!inString && c == ')') {
                    if (depth > 0) {
                        depth--;
                        valueBuffer.append(c);
                        pos++;
                        continue;
                    }
                    // End of row
                    String value = cleanValue(valueBuffer.toString().trim());
                    if (!value.isEmpty()) {
                        rowValues.add(value);
                    }
                    pos++; // Skip ')'
                    break;
                }
                
                if (!inString && c == ',' && depth == 0) {
                    // End of value
                    String value = cleanValue(valueBuffer.toString().trim());
                    rowValues.add(value);
                    valueBuffer.setLength(0);
                    pos++;
                    continue;
                }
                
                valueBuffer.append(c);
                pos++;
            }
            
            allRows.add(rowValues);
        }
        
        return allRows;
    }
    
    /**
     * Clean a value by stripping quotes and unescaping
     */
    private String cleanValue(String value) {
        if (value == null || value.isEmpty()) {
            return value;
        }
        
        // Check if value is a quoted string
        if ((value.startsWith("'") && value.endsWith("'")) || 
            (value.startsWith("\"") && value.endsWith("\""))) {
            // Remove surrounding quotes
            value = value.substring(1, value.length() - 1);
            // Unescape internal quotes
            value = value.replace("\\'" , "'").replace("\\\"", "\"");
        }
        
        return value;
    }
    
    /**
     * Parse CREATE TABLE statement
     */
    private SQLStatement parseCreateTable(String sql) {
        Matcher matcher = CREATE_TABLE_PATTERN.matcher(sql);
        
        if (!matcher.find()) {
            return createSimpleStatement(SQLStatement.StatementType.OTHER, sql);
        }
        
        String databaseName = matcher.group(1);
        String tableName = matcher.group(2);
        
        return SQLStatement.builder()
            .type(SQLStatement.StatementType.CREATE_TABLE)
            .originalSQL(sql)
            .databaseName(databaseName)
            .tableName(tableName)
            .tableDefinition(sql)
            .build();
    }
    
    /**
     * Parse USE database statement
     */
    private SQLStatement parseUseDatabase(String sql) {
        Matcher matcher = USE_DATABASE_PATTERN.matcher(sql);
        
        if (!matcher.find()) {
            return createSimpleStatement(SQLStatement.StatementType.OTHER, sql);
        }
        
        String databaseName = matcher.group(1);
        
        return SQLStatement.builder()
            .type(SQLStatement.StatementType.USE_DATABASE)
            .originalSQL(sql)
            .databaseName(databaseName)
            .build();
    }
    
    /**
     * Create simple statement without parsing
     */
    private SQLStatement createSimpleStatement(SQLStatement.StatementType type, String sql) {
        return SQLStatement.builder()
            .type(type)
            .originalSQL(sql)
            .build();
    }
    
    /**
     * Unescape a SQL string value
     * Example: "'John\\'s Book'" -> "John's Book"
     */
    public static String unescapeValue(String value) {
        if (value == null) {
            return null;
        }
        
        String trimmed = value.trim();
        
        // Handle NULL
        if (trimmed.equalsIgnoreCase("NULL")) {
            return null;
        }
        
        // Remove quotes if present
        if ((trimmed.startsWith("'") && trimmed.endsWith("'")) ||
            (trimmed.startsWith("\"") && trimmed.endsWith("\""))) {
            trimmed = trimmed.substring(1, trimmed.length() - 1);
        }
        
        // Unescape special characters
        return trimmed
            .replace("\\'", "'")
            .replace("\\\"", "\"")
            .replace("\\n", "\n")
            .replace("\\r", "\r")
            .replace("\\t", "\t")
            .replace("\\\\", "\\");
    }
    
    /**
     * Escape a value for SQL
     * Example: "John's Book" -> "'John\\'s Book'"
     */
    public static String escapeValue(String value) {
        if (value == null) {
            return "NULL";
        }
        
        String escaped = value
            .replace("\\", "\\\\")
            .replace("'", "\\'")
            .replace("\"", "\\\"")
            .replace("\n", "\\n")
            .replace("\r", "\\r")
            .replace("\t", "\\t");
        
        return "'" + escaped + "'";
    }
}
