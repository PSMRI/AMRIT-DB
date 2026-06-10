/*
* AMRIT – Accessible Medical Records via Integrated Technology 
* Integrated EHR (Electronic Health Records) Solution 
*
* Copyright (C) "Piramal Swasthya Management and Research Institute" 
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/

package com.db.piramalswasthya.anonymizer.config;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.Map;

/**
 * Anonymization rules
 * 
 * Defines which columns to anonymize and how
 * with version tracking and schema hints.
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class AnonymizationRules {
    private String rulesVersion;
    private String schemaHint;
    private UnknownColumnPolicy unknownColumnPolicy = UnknownColumnPolicy.WARN;
    private Map<String, DatabaseRules> databases;

    public Map<String, DatabaseRules> getDatabases() {
        return databases == null ? null : java.util.Collections.unmodifiableMap(new java.util.HashMap<>(databases));
    }

    public void setDatabases(Map<String, DatabaseRules> databases) {
        this.databases = databases == null ? null : new java.util.HashMap<>(databases);
    }
    
    public enum UnknownColumnPolicy {
        FAIL,
        WARN,
        PRESERVE
    }
    
    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DatabaseRules {
        private Map<String, TableRules> tables;

        public Map<String, TableRules> getTables() {
            return tables == null ? null : java.util.Collections.unmodifiableMap(new java.util.HashMap<>(tables));
        }

        public void setTables(Map<String, TableRules> tables) {
            this.tables = tables == null ? null : new java.util.HashMap<>(tables);
        }
    }
    
    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TableRules {
        private String primaryKey;
        private String canonicalName;
        private Map<String, ColumnRule> columns;

        public Map<String, ColumnRule> getColumns() {
            return columns == null ? null : java.util.Collections.unmodifiableMap(new java.util.HashMap<>(columns));
        }

        public void setColumns(Map<String, ColumnRule> columns) {
            this.columns = columns == null ? null : new java.util.HashMap<>(columns);
        }
    }
    
    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ColumnRule {
        private String strategy;
        private String format;
        private String description;
        private String canonicalName;
        private String dataType;
        private Boolean nullable;
    }
}
