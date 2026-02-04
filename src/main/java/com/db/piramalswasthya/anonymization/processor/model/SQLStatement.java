package com.db.piramalswasthya.anonymization.processor.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Represents a parsed SQL statement from a dump file.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SQLStatement {

    private StatementType type;

    public StatementType getType() {
        return type;
    }

    public void setType(StatementType type) {
        this.type = type;
    }

    public String getOriginalSQL() {
        return originalSQL;
    }

    public void setOriginalSQL(String originalSQL) {
        this.originalSQL = originalSQL;
    }

    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<String> getColumnNames() {
        return columnNames;
    }

    public void setColumnNames(List<String> columnNames) {
        this.columnNames = columnNames;
    }

    public List<List<String>> getRowValues() {
        return rowValues;
    }

    public void setRowValues(List<List<String>> rowValues) {
        this.rowValues = rowValues;
    }

    public String getTableDefinition() {
        return tableDefinition;
    }

    public void setTableDefinition(String tableDefinition) {
        this.tableDefinition = tableDefinition;
    }

    public static SQLStatement.SQLStatementBuilder builder() {
        return new SQLStatement.SQLStatementBuilder();
    }

    public static class SQLStatementBuilder {
        private StatementType type;
        private String originalSQL;
        private String databaseName;
        private String tableName;
        private List<String> columnNames;
        private List<List<String>> rowValues;
        private String tableDefinition;

        public SQLStatementBuilder type(StatementType type) {
            this.type = type;
            return this;
        }

        public SQLStatementBuilder originalSQL(String originalSQL) {
            this.originalSQL = originalSQL;
            return this;
        }

        public SQLStatementBuilder databaseName(String databaseName) {
            this.databaseName = databaseName;
            return this;
        }

        public SQLStatementBuilder tableName(String tableName) {
            this.tableName = tableName;
            return this;
        }

        public SQLStatementBuilder columnNames(List<String> columnNames) {
            this.columnNames = columnNames;
            return this;
        }

        public SQLStatementBuilder rowValues(List<List<String>> rowValues) {
            this.rowValues = rowValues;
            return this;
        }

        public SQLStatementBuilder tableDefinition(String tableDefinition) {
            this.tableDefinition = tableDefinition;
            return this;
        }

        public SQLStatement build() {
            SQLStatement statement = new SQLStatement();
            statement.type = this.type;
            statement.originalSQL = this.originalSQL;
            statement.databaseName = this.databaseName;
            statement.tableName = this.tableName;
            statement.columnNames = this.columnNames;
            statement.rowValues = this.rowValues;
            statement.tableDefinition = this.tableDefinition;
            return statement;
        }
    }

    /**
     * Type of SQL statement
     */
    public enum StatementType {
        INSERT,
        CREATE_TABLE,
        CREATE_DATABASE,
        USE_DATABASE,
        SET_VARIABLE,
        COMMENT,
        OTHER
    }
    
    private String originalSQL;
    private String databaseName;
    private String tableName;
    
    // For INSERT statements
    private List<String> columnNames;
    private List<List<String>> rowValues; // Multiple rows for batch inserts
    
    // For CREATE TABLE statements
    private String tableDefinition;
    
    /**
     * Check if this statement needs anonymization
     */
    public boolean requiresAnonymization() {
        return type == StatementType.INSERT && columnNames != null && !columnNames.isEmpty();
    }
    
    /**
     * Get the number of rows in this statement (for batch inserts)
     */
    public int getRowCount() {
        return rowValues != null ? rowValues.size() : 0;
    }
}
