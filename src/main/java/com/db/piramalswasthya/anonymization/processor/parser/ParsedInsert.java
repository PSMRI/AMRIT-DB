package com.db.piramalswasthya.anonymization.processor.parser;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ParsedInsert {
    private String tableName;
    private List<String> columns; // null if not specified in INSERT
    private List<List<String>> rows; // Each row is a list of values
    
    public String getTableName() {
        return tableName;
    }
    
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    
    public List<String> getColumns() {
        return columns;
    }
    
    public void setColumns(List<String> columns) {
        this.columns = columns;
    }
    
    public List<List<String>> getRows() {
        return rows;
    }
    
    public void setRows(List<List<String>> rows) {
        this.rows = rows;
    }
}
