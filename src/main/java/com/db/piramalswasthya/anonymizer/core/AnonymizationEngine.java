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
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Core anonymization engine - applies rules to data.
 */
@Slf4j
public class AnonymizationEngine {

    private final HmacAnonymizer anonymizer;
    private final AnonymizationRules rules;
    private final RandomFakeDataAnonymizer faker;

    /**
     * Construct engine with an injected `HmacAnonymizer`, rules and faker locale.
     */
    public AnonymizationEngine(HmacAnonymizer anonymizer, AnonymizationRules rules, RandomFakeDataAnonymizer faker) {
        this.anonymizer = anonymizer;
        if (rules == null) {
            this.rules = null;
        } else {
            // Defensive copy to avoid exposing internal mutable rules instance
            this.rules = new AnonymizationRules();
            this.rules.setRulesVersion(rules.getRulesVersion());
            this.rules.setSchemaHint(rules.getSchemaHint());
            this.rules.setUnknownColumnPolicy(rules.getUnknownColumnPolicy());
            this.rules.setDatabases(rules.getDatabases());
        }
        this.faker = faker;
    }

    /**
     * Anonymize a batch of rows according to rules (no column metadata available;
     * outputs are not fitted to column definitions).
     */
    public Map<String, Integer> anonymizeBatch(
            String database,
            String table,
            List<KeysetPaginator.RowData> rows
    ) {
        return anonymizeBatch(database, table, rows, java.util.Collections.emptyMap());
    }

    /**
     * Anonymize a batch of rows according to rules.
     *
     * <p>Columns whose strategy is PRESERVE (or which have no rule) are left
     * completely untouched - the original JDBC object (Timestamp, Boolean,
     * byte[], BigDecimal, ...) is kept so the writer can restore it with full
     * type fidelity. Only columns with an active anonymization strategy are
     * converted through their string representation.</p>
     *
     * @param database Database name
     * @param table Table name
     * @param rows Batch of rows to anonymize (modified in place)
     * @param columnMeta source column metadata by column name, used to fit
     *                   outputs to the column type/length (may be empty)
     * @return Strategy counts for reporting
     */
    public Map<String, Integer> anonymizeBatch(
            String database,
            String table,
            List<KeysetPaginator.RowData> rows,
            Map<String, ColumnMeta> columnMeta
    ) {
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get(database);
        if (dbRules == null) {
            log.warn("No rules found for database: {}", database);
            return new HashMap<>();
        }

        AnonymizationRules.TableRules tableRules = dbRules.getTables().get(table);
        if (tableRules == null) {
            log.warn("No rules found for table: {}.{}", database, table);
            return new HashMap<>();
        }

        return anonymizeBatch(database, table, tableRules, rows, columnMeta);
    }

    /**
     * Anonymize a batch of rows using explicitly provided (effective) table
     * rules. Used by the full-copy pipeline, where tables absent from the
     * registry still get copied with their effective rules computed by the
     * caller (registry overlay + PII detection screening).
     */
    public Map<String, Integer> anonymizeBatch(
            String database,
            String table,
            AnonymizationRules.TableRules tableRules,
            List<KeysetPaginator.RowData> rows,
            Map<String, ColumnMeta> columnMeta
    ) {
        Map<String, Integer> strategyCounts = new HashMap<>();

        Map<String, AnonymizationRules.ColumnRule> columnRules = tableRules.getColumns();
        if (columnRules == null || columnRules.isEmpty()) {
            return strategyCounts;
        }

        for (KeysetPaginator.RowData row : rows) {
            Map<String, Object> rowData = row.getData();

            // Snapshot of keys to avoid ConcurrentModificationException if columns are modified
            List<String> columnSnapshot = new ArrayList<>(rowData.keySet());

            for (String column : columnSnapshot) {
                AnonymizationRules.ColumnRule rule = columnRules.get(column);

                if (rule == null) {
                    handleUnknownColumn(database, table, column);
                    continue;
                }

                String strategy = rule.getStrategy() == null ? "" : rule.getStrategy().toUpperCase();
                if ("PRESERVE".equals(strategy)) {
                    continue; // keep original JDBC object untouched
                }

                Object originalValue = row.get(column);
                if (originalValue == null) {
                    continue;
                }

                Object anonymizedValue = applyStrategy(strategy, column, originalValue.toString());
                row.put(column, fitToColumn(anonymizedValue, columnMeta.get(column)));
                strategyCounts.merge(rule.getStrategy(), 1, Integer::sum);
            }
        }

        return strategyCounts;
    }

    /**
     * Fit a strategy output to the target column definition (target tables are
     * structural clones of the source, so source metadata applies).
     */
    private Object fitToColumn(Object value, ColumnMeta meta) {
        if (meta == null) {
            return value;
        }
        if (value == null) {
            // SUPPRESS on a NOT NULL column: use a neutral non-PII placeholder
            if (!meta.nullable()) {
                return meta.isNumeric() ? 0 : "";
            }
            return null;
        }
        if (value instanceof String s) {
            if (meta.isNumeric()) {
                // Hash/fake output destined for a numeric column: derive a stable
                // positive number that fits the column type.
                return deriveNumeric(s, meta);
            }
            if (meta.isTemporal()) {
                // GENERALIZE reduces dates to the year; a DATE/DATETIME column
                // needs a full value, so anchor to January 1st of that year.
                return fitTemporal(s, meta);
            }
            if (meta.isCharacter() && meta.precision() > 0 && s.length() > meta.precision()) {
                return s.substring(0, meta.precision());
            }
        }
        return value;
    }

    /**
     * Fit a string output to a DATE/DATETIME column: a bare year becomes
     * January 1st of that year; anything unparsable is suppressed.
     */
    private Object fitTemporal(String s, ColumnMeta meta) {
        java.util.regex.Matcher year = java.util.regex.Pattern.compile("^(\\d{4})").matcher(s);
        if (year.find()) {
            String anchored = year.group(1) + "-01-01";
            return meta.jdbcType() == java.sql.Types.TIMESTAMP
                || meta.jdbcType() == java.sql.Types.TIMESTAMP_WITH_TIMEZONE
                ? anchored + " 00:00:00" : anchored;
        }
        return meta.nullable() ? null : "1900-01-01";
    }

    /**
     * Deterministically derive a positive number fitting the column from a string.
     */
    private long deriveNumeric(String s, ColumnMeta meta) {
        String hex = com.db.piramalswasthya.anonymizer.util.CryptoUtils.sha256Hex(s).substring(0, 15);
        long h = Long.parseLong(hex, 16); // 60 bits, always positive
        return h % (meta.numericCap() + 1);
    }

    /**
     * Apply anonymization strategy.
     */
    private Object applyStrategy(String strategy, String column, String value) {
        String s = strategy == null ? "" : strategy.toUpperCase();
        switch (s) {
            case "HMAC_HASH":
                return anonymizer.hashId(value);
            case "HASH_SHA256":
                return anonymizer.sha256Hash(value);
            case "PRESERVE":
                return value;
            case "SUPPRESS":
                return null;
            case "RANDOM_FAKE_DATA":
                // column-name heuristics pick an appropriate fake value type
                return faker.anonymize(column, value);
            case "FAKE_FULLNAME":
            case "FAKE_FIRSTNAME":
            case "FAKE_LASTNAME":
            case "FAKE_EMAIL":
            case "FAKE_PHONE":
            case "FAKE_ADDRESS":
            case "FAKE_CITY":
            case "FAKE_ZIP":
            case "FAKE_USERNAME":
                // fake generation (single shared Faker)

                return faker.anonymize(strategy, column, value);
            case "GENERALIZE":
                return generalize(column, value);
            case "PARTIAL_MASK":
                String lc = column == null ? "" : column.toLowerCase();
                if (lc.contains("phone") || lc.contains("mobile") || lc.contains("msisdn")) {
                    return anonymizer.maskPhone(value);
                } else if (lc.contains("pin") || lc.contains("pincode") || lc.contains("zip") || lc.contains("postal")) {
                    return anonymizer.maskPartial(value, 2);
                } else {
                    return anonymizer.maskPartial(value, 3);
                }
            default:
                // A typo'd or unimplemented strategy must fail the run: silently
                // preserving would ship raw PII to the target.
                throw new UnknownStrategyException(strategy, column);
        }
    }

    /**
     * Generalize dates/datetimes to year and coordinates to 2-decimal precision.
     */
    private Object generalize(String column, String value) {
        // Date or datetime: 2023-06-15, 2023-06-15 10:30:00[.0], 2023-06-15T10:30:00
        if (value.matches("\\d{4}-\\d{2}-\\d{2}([ T].*)?")) {
            return anonymizer.generalizeDate(value);
        } else if (value.matches("\\d{2}/\\d{2}/\\d{4}")) {
            return anonymizer.generalizeDate(value.replace('/', '-'));
        }

        // Coordinate pattern: lat,lon  (e.g. 12.9715987,77.5945627)
        String coordRegex = "^-?\\d+(?:\\.\\d+)?,\\s*-?\\d+(?:\\.\\d+)?$";
        if (value.matches(coordRegex)) {
            try {
                String[] parts = value.split(",");
                double lat = Double.parseDouble(parts[0].trim());
                double lon = Double.parseDouble(parts[1].trim());
                String latStr = String.format("%.2f", lat);
                String lonStr = String.format("%.2f", lon);
                return latStr + "," + lonStr;
            } catch (NumberFormatException e) {
                log.warn("GENERALIZE coordinate parse failed for column {} - suppressing", column);
                return null;
            }
        }

        // Free-text values marked GENERALIZE (e.g. address lines): the safe
        // generalization is suppression, never pass-through of raw PII.
        log.debug("GENERALIZE on non-date/coordinate column {} - suppressing value", column);
        return null;
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

/**
 * Thrown when a rule references a strategy the engine does not implement.
 * Failing the run is mandatory: silently preserving would leak raw PII.
 */
class UnknownStrategyException extends RuntimeException {

    UnknownStrategyException(String strategy, String column) {
        super(String.format("Unknown anonymization strategy '%s' on column %s - refusing to run. " +
            "Fix the rules file: valid strategies are HMAC_HASH, HASH_SHA256, PRESERVE, SUPPRESS, " +
            "RANDOM_FAKE_DATA, FAKE_*, GENERALIZE, PARTIAL_MASK", strategy, column));
    }
}
