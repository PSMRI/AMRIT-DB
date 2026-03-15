package com.db.piramalswasthya.anonymizer.demo;

import com.db.piramalswasthya.anonymizer.core.AnonymizationEngine;
import com.db.piramalswasthya.anonymizer.core.HmacAnonymizer;
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator.RowData;
import com.db.piramalswasthya.anonymizer.core.RandomFakeDataAnonymizer;
import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;

import java.util.*;

/**
 * Simple demo runner that constructs an AnonymizationEngine and runs it on a small in-memory sample.
 */
public class SampleRunner {
    public static void main(String[] args) {
        String secret = "0123456789abcdef0123456789abcdef"; // 32-hex chars -> 16 bytes
        HmacAnonymizer hmac = new HmacAnonymizer(secret);
        RandomFakeDataAnonymizer faker = new RandomFakeDataAnonymizer(Locale.ENGLISH);
        AnonymizationEngine engine = new AnonymizationEngine(hmac, buildRules(), faker);

        // sample row
        RowData row = new RowData();
        row.put("FirstName", "Rajesh");
        row.put("MiddleName", "Kumar");
        row.put("LastName", "Sharma");
        row.put("DOB", "1990-05-21");
        row.put("PreferredPhoneNum", "9876543210");
        row.put("EmailId", "raj.sharma@example.com");
        row.put("PermPinCode", "560076");
        row.put("PermCoordinate", "12.9715987,77.5945627");

        List<RowData> rows = new ArrayList<>();
        rows.add(row);

        System.out.println("Before anonymization:");
        printRow(row.getData());

        Map<String,Integer> counts = engine.anonymizeBatch("db_identity", "i_beneficiarydetails", rows);

        System.out.println("\nAfter anonymization:");
        printRow(row.getData());

        System.out.println("\nStrategy counts: " + counts);
    }

    private static void printRow(Map<String,Object> m) {
        for (Map.Entry<String,Object> e : m.entrySet()) {
            System.out.println(e.getKey() + ": " + e.getValue());
        }
    }

    private static AnonymizationRules buildRules() {
        AnonymizationRules rules = new AnonymizationRules();
        rules.setRulesVersion("demo");
        Map<String, AnonymizationRules.DatabaseRules> dbs = new HashMap<>();

        AnonymizationRules.DatabaseRules db = new AnonymizationRules.DatabaseRules();
        Map<String, AnonymizationRules.TableRules> tables = new HashMap<>();

        AnonymizationRules.TableRules tr = new AnonymizationRules.TableRules();
        Map<String, AnonymizationRules.ColumnRule> cols = new LinkedHashMap<>();

        AnonymizationRules.ColumnRule cr;

        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("FAKE_FIRSTNAME"); cols.put("FirstName", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("PARTIAL_MASK"); cols.put("MiddleName", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("FAKE_LASTNAME"); cols.put("LastName", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("GENERALIZE"); cols.put("DOB", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("PARTIAL_MASK"); cols.put("PreferredPhoneNum", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("FAKE_EMAIL"); cols.put("EmailId", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("PARTIAL_MASK"); cols.put("PermPinCode", cr);
        cr = new AnonymizationRules.ColumnRule(); cr.setStrategy("GENERALIZE"); cols.put("PermCoordinate", cr);

        tr.setColumns(cols);
        tr.setPrimaryKey("id");
        tables.put("i_beneficiarydetails", tr);

        db.setTables(tables);
        dbs.put("db_identity", db);
        rules.setDatabases(dbs);
        return rules;
    }
}
