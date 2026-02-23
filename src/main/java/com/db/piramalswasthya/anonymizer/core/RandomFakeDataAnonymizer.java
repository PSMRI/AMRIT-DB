package com.db.piramalswasthya.anonymizer.core;

import net.datafaker.Faker;

import java.util.Locale;

/**
 * Provides realistic fake values for columns using DataFaker.
 */
public class RandomFakeDataAnonymizer {

    private final Faker faker;

    public RandomFakeDataAnonymizer(Locale locale, Long seed) {
        // DataFaker provides constructors with Locale; seeded reproducible runs are not required here.
        this.faker = new Faker(locale);
    }

    public RandomFakeDataAnonymizer(Locale locale) {
        this(locale, null);
    }

    public Object anonymize(String columnName, String original) {
        if (original == null) return null;

        String c = columnName.toLowerCase();
        try {
            if (c.contains("name") || c.contains("firstname") || c.contains("lastname")) {
                if (c.contains("firstname")) return faker.name().firstName();
                if (c.contains("lastname")) return faker.name().lastName();
                return faker.name().fullName();
            }

            if (c.contains("email")) return faker.internet().emailAddress();
            if (c.contains("phone") || c.contains("mobile")) return faker.phoneNumber().cellPhone();
            if (c.contains("address")) return faker.address().fullAddress();
            if (c.contains("city")) return faker.address().city();
            if (c.contains("country")) return faker.address().country();
            if (c.contains("zip") || c.contains("postal")) return faker.address().zipCode();

            // Dates and numeric types are preserved by default; use generalize or mask strategies instead
            // Fallback: return a short lorem word
            return faker.lorem().word();
        } catch (Exception e) {
            // On any faker failure, fall back to original value to avoid breaking the pipeline
            return original;
        }
    }
}
