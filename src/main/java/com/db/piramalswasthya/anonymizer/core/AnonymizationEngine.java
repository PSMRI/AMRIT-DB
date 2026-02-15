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

package com.db.piramalswasthya.anonymizer.core;

import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Core anonymization engine - applies rules to data.
 */
public class AnonymizationEngine {

    private static final Logger log = LoggerFactory.getLogger(AnonymizationEngine.class);

    private final HmacAnonymizer anonymizer;
    private final AnonymizationRules rules;

    public AnonymizationEngine(HmacAnonymizer anonymizer, AnonymizationRules rules) {
        this.anonymizer = anonymizer;
        this.rules = rules;
    }

    /**
     * Anonymize a batch of rows according to rules.
     *
     * @param database Database name
     * @param table Table name
     * @param rows Batch of rows to anonymize (modified in place)
     * @return Strategy counts for reporting
     */
    public Map<String, Integer> anonymizeBatch(
            String database,
            String table,
            List<KeysetPaginator.RowData> rows
    ) {
        Map<String, Integer> strategyCounts = new HashMap<>();

        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(database);
        if (dbRules == null) {
            log.warn("No rules found for database: {}", database);
            return strategyCounts;
        }

        AnonymizationRules.TableRules tableRules = dbRules.getTables().get(table);
        if (tableRules == null) {
            log.warn("No rules found for table: {}.{}", database, table);
            return strategyCounts;
        }

        Map<String, AnonymizationRules.ColumnRule> columnRules = tableRules.getColumns();
        if (columnRules == null || columnRules.isEmpty()) {
            return strategyCounts;
        }

        for (KeysetPaginator.RowData row : rows) {
            Map<String, Object> rowData = row.getData();

            // Snapshot of keys to avoid ConcurrentModificationException if columns are modified
            List<String> columnSnapshot = new ArrayList<>(rowData.keySet());

            for (String column : columnSnapshot) {
                Object originalValue = row.get(column);

                AnonymizationRules.ColumnRule rule = columnRules.get(column);
                if (rule == null) {
                    handleUnknownColumn(database, table, column);
                    continue;
                }

                if (originalValue == null) {
                    continue;
                }

                Object anonymizedValue = applyStrategy(rule.getStrategy(), originalValue.toString());
                row.put(column, anonymizedValue);

                strategyCounts.merge(rule.getStrategy(), 1, Integer::sum);
            }
        }

        return strategyCounts;
    }

    /**
     * Apply anonymization strategy.
     */
    private Object applyStrategy(String strategy, String value) {
        return switch (strategy.toUpperCase()) {
            case "HMAC_HASH" -> anonymizer.hashId(value);
            case "PRESERVE" -> value;
            default -> {
                log.warn("Unknown strategy: {} - preserving value", strategy);
                yield value;
            }
        };
    }

    private void handleUnknownColumn(String database, String table, String column) {
        switch (rules.getUnknownColumnPolicy()) {
            case FAIL -> throw new UnknownColumnException(database, table, column);
            case WARN -> log.warn("Unknown column {}.{}.{} - preserving", database, table, column);
            case PRESERVE -> log.debug("Unknown column {}.{}.{} - preserving", database, table, column);
        }
    }
}

/**
 * Thrown when the input data contains a column that is not present in the rules
 * and the policy is configured as FAIL.
 */
class UnknownColumnException extends RuntimeException {

    UnknownColumnException(String database, String table, String column) {
        super(String.format("Unknown column %s.%s.%s - policy is FAIL", database, table, column));
    }
}
