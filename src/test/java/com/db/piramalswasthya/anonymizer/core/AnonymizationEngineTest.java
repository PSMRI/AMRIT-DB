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
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class AnonymizationEngineTest {

    private static final String SECRET = "test-secret-key-for-unit-tests-0123456789abcdef";

    private AnonymizationEngine engine;

    @BeforeEach
    void setUp() {
        engine = new AnonymizationEngine(
            new HmacAnonymizer(SECRET),
            rulesFor(Map.of(
                "BenBiometric", rule("SUPPRESS"),
                "SomePii", rule("RANDOM_FAKE_DATA"),
                "CreatedDate", rule("PRESERVE"),
                "Deleted", rule("PRESERVE"),
                "RawBlob", rule("PRESERVE"),
                "DOB", rule("GENERALIZE")
            )),
            new RandomFakeDataAnonymizer(Locale.ENGLISH)
        );
    }

    @Test
    void suppressStrategyNullsValue() {
        KeysetPaginator.RowData row = row(Map.of("BenBiometric", "FINGERPRINT-TEMPLATE"));
        engine.anonymizeBatch("db_identity", "t", List.of(row));
        assertNull(row.get("BenBiometric"), "SUPPRESS must replace PII with NULL");
    }

    @Test
    void randomFakeDataStrategyReplacesValue() {
        KeysetPaginator.RowData row = row(Map.of("SomePii", "REAL-PII-VALUE"));
        engine.anonymizeBatch("db_identity", "t", List.of(row));
        assertNotEquals("REAL-PII-VALUE", row.get("SomePii"),
            "RANDOM_FAKE_DATA must not preserve the original value");
        assertNotNull(row.get("SomePii"));
    }

    @Test
    void preserveKeepsOriginalObjectUntouched() {
        Timestamp ts = Timestamp.valueOf("2023-06-15 10:30:00");
        byte[] blob = new byte[]{(byte) 0xDE, (byte) 0xAD};
        KeysetPaginator.RowData row = new KeysetPaginator.RowData();
        row.put("CreatedDate", ts);
        row.put("Deleted", Boolean.FALSE);
        row.put("RawBlob", blob);
        engine.anonymizeBatch("db_identity", "t", List.of(row));
        assertSame(ts, row.get("CreatedDate"), "PRESERVE must not convert Timestamp to String");
        assertSame(Boolean.FALSE, row.get("Deleted"), "PRESERVE must not convert Boolean to String");
        assertSame(blob, row.get("RawBlob"), "PRESERVE must not convert byte[] to String");
    }

    @Test
    void generalizeHandlesDatetimeValues() {
        KeysetPaginator.RowData row = row(Map.of("DOB", "1985-03-12 00:00:00"));
        engine.anonymizeBatch("db_identity", "t", List.of(row));
        assertEquals("1985", String.valueOf(row.get("DOB")),
            "GENERALIZE must reduce DATETIME values to year, not preserve them");
    }

    @Test
    void unknownStrategyFailsRunInsteadOfLeaking() {
        AnonymizationEngine badEngine = new AnonymizationEngine(
            new HmacAnonymizer(SECRET),
            rulesFor(Map.of("Sensitive", rule("SUPRESS"))), // typo'd strategy
            new RandomFakeDataAnonymizer(Locale.ENGLISH)
        );
        KeysetPaginator.RowData row = row(Map.of("Sensitive", "PII"));
        assertThrows(RuntimeException.class,
            () -> badEngine.anonymizeBatch("db_identity", "t", List.of(row)),
            "A typo'd strategy must fail the run, never silently preserve PII");
    }

    private static AnonymizationRules.ColumnRule rule(String strategy) {
        AnonymizationRules.ColumnRule r = new AnonymizationRules.ColumnRule();
        r.setStrategy(strategy);
        return r;
    }

    private static AnonymizationRules rulesFor(Map<String, AnonymizationRules.ColumnRule> columns) {
        AnonymizationRules.TableRules tr = new AnonymizationRules.TableRules();
        tr.setPrimaryKey("id");
        tr.setColumns(new HashMap<>(columns));
        AnonymizationRules.DatabaseRules dbr = new AnonymizationRules.DatabaseRules();
        dbr.setTables(Map.of("t", tr));
        AnonymizationRules rules = new AnonymizationRules();
        rules.setDatabases(Map.of("db_identity", dbr));
        return rules;
    }

    private static KeysetPaginator.RowData row(Map<String, Object> values) {
        KeysetPaginator.RowData r = new KeysetPaginator.RowData();
        values.forEach(r::put);
        return r;
    }
}
