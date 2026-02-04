package com.db.piramalswasthya.anonymization.executor.strategy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StrategyContext {
    private String databaseName;
    private String tableName;
    private String columnName;
    private String dataType;
    private Integer maxLength;
    private String locale;
    private String options;
    
    public static StrategyContext.StrategyContextBuilder builder() {
        return new StrategyContext.StrategyContextBuilder();
    }
    
    public static class StrategyContextBuilder {
        private String databaseName;
        private String tableName;
        private String columnName;
        private String dataType;
        private Integer maxLength;
        private String locale;
        private String options;
        
        public StrategyContextBuilder databaseName(String databaseName) {
            this.databaseName = databaseName;
            return this;
        }
        
        public StrategyContextBuilder tableName(String tableName) {
            this.tableName = tableName;
            return this;
        }
        
        public StrategyContextBuilder columnName(String columnName) {
            this.columnName = columnName;
            return this;
        }
        
        public StrategyContextBuilder dataType(String dataType) {
            this.dataType = dataType;
            return this;
        }
        
        public StrategyContextBuilder maxLength(Integer maxLength) {
            this.maxLength = maxLength;
            return this;
        }
        
        public StrategyContextBuilder locale(String locale) {
            this.locale = locale;
            return this;
        }
        
        public StrategyContextBuilder options(String options) {
            this.options = options;
            return this;
        }
        
        public StrategyContext build() {
            StrategyContext context = new StrategyContext();
            context.databaseName = this.databaseName;
            context.tableName = this.tableName;
            context.columnName = this.columnName;
            context.dataType = this.dataType;
            context.maxLength = this.maxLength;
            context.locale = this.locale;
            context.options = this.options;
            return context;
        }
    }
    
    public String getDatabaseName() {
        return databaseName;
    }
    
    public String getTableName() {
        return tableName;
    }
    
    public String getColumnName() {
        return columnName;
    }
    
    public String getDataType() {
        return dataType;
    }
    
    public Integer getMaxLength() {
        return maxLength;
    }
    
    public String getLocale() {
        return locale;
    }
    
    public String getOptions() {
        return options;
    }
}
