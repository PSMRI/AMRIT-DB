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

import com.db.piramalswasthya.anonymizer.util.CryptoUtils;
import com.github.javafaker.Faker;
import java.util.Locale;
import java.util.Random;

/**
 * Provides realistic fake values for columns using JavaFaker.
 */
public class RandomFakeDataAnonymizer {

    private final Locale locale;
    private final FakerFactory fakerFactory;

    /**
     * Faker construction loads locale YAML data and is far too expensive to do
     * per value (hundreds of thousands of rows). One instance is created lazily
     * and shared; determinism is preserved by re-seeding the shared Random
     * before every value.
     */
    // Intentionally not SecureRandom: JavaFaker requires java.util.Random and
    // this path needs repeatable fake values, not cryptographic randomness.
    // The privacy guarantee comes from the keyed HMAC seed, not from this PRNG.
    @SuppressWarnings("java:S2245")
    private final Random sharedRandom = new Random(0);
    private Faker cachedFaker;

    public RandomFakeDataAnonymizer(Locale locale) {
        this(locale, Faker::new);
    }

    RandomFakeDataAnonymizer(Locale locale, FakerFactory fakerFactory) {
        this.locale = locale == null ? Locale.ENGLISH : locale;
        this.fakerFactory = fakerFactory == null ? Faker::new : fakerFactory;
    }

    private Faker fakerWithSeed(long seed) {
        if (cachedFaker == null) {
            Faker created = fakerFactory.create(locale, sharedRandom);
            if (created == null) {
                throw new IllegalStateException("Faker factory returned no instance for locale " + locale);
            }
            cachedFaker = created;
        }
        sharedRandom.setSeed(seed);
        return cachedFaker;
    }

    private boolean isIndiaLocale() {
        if (locale == null) return false;
        String country = locale.getCountry();
        if (country != null && country.equalsIgnoreCase("IN")) return true;
        String tag = locale.toString();
        return tag != null && tag.toUpperCase(java.util.Locale.ROOT).contains("IN");
    }

    /**
     * Deterministic fake value generation using the source value as part of the seed.
     */
    public Object anonymize(String columnName, String original) {
        if (original == null) return null;

        try {
            Faker faker = fakerFor("COLUMN_HEURISTIC", columnName, original);
            return anonymizeByColumn(faker, columnName);
        } catch (RuntimeException e) {
            return fallbackValue("COLUMN_HEURISTIC", columnName, original);
        }
    }

    private Object anonymizeByColumn(Faker faker, String columnName) {
        String c = columnName == null ? "" : columnName.toLowerCase(java.util.Locale.ROOT);
        if (c.contains("name") || c.contains("firstname") || c.contains("lastname")) {
            if (c.contains("firstname")) return faker.name().firstName();
            if (c.contains("lastname")) return faker.name().lastName();
            return faker.name().fullName();
        }

        if (c.contains("email")) return faker.internet().emailAddress();
        if (c.contains("phone") || c.contains("mobile")) return faker.phoneNumber().cellPhone();
        if (c.contains("address")) return faker.address().fullAddress();
        if (c.contains("city")) return faker.address().city();
        if (c.contains("zip") || c.contains("postal")) return faker.address().zipCode();

        // Fallback: return a short lorem word
        return faker.lorem().word();
    }

    /**
     * Strategy-aware deterministic anonymization.
     * If `strategy` is null or unknown, falls back to column-name heuristics.
     */
    public Object anonymize(String strategy, String columnName, String original) {
        if (original == null) return null;
        FakeKind kind = FakeKind.of(strategy);

        try {
            Faker faker = fakerWithSeed(seedFor(strategy, columnName, original));
            return switch (kind) {
                case FIRSTNAME -> faker.name().firstName();
                case LASTNAME -> faker.name().lastName();
                case FULLNAME -> faker.name().fullName();
                case USERNAME -> faker.name().username();
                case EMAIL -> faker.internet().emailAddress();
                case PHONE -> fakePhone(faker);
                case ADDRESS -> faker.address().fullAddress();
                case CITY -> faker.address().city();
                // Preserve country for single-country deployments
                case COUNTRY -> original;
                case ZIP -> faker.address().zipCode();
                case COLUMN_HEURISTIC -> anonymizeByColumn(faker, columnName);
            };
        } catch (RuntimeException e) {
            return fallbackValue(strategy, columnName, original);
        }
    }

    private Object fakePhone(Faker faker) {
        // realistic 10-digit Indian mobile starting with 6-9
        if (isIndiaLocale()) {
            char[] leading = new char[]{'6', '7', '8', '9'};
            char lead = leading[sharedRandom.nextInt(leading.length)];
            return lead + faker.numerify("#########");
        }
        return faker.phoneNumber().cellPhone();
    }

    /**
     * Fake value categories. Matching uses {@code constant.equalsIgnoreCase(input)},
     * which is null-safe and locale-independent by construction.
     */
    private enum FakeKind {
        FIRSTNAME, LASTNAME, FULLNAME, USERNAME, EMAIL, PHONE,
        ADDRESS, CITY, COUNTRY, ZIP, COLUMN_HEURISTIC;

        static FakeKind of(String strategy) {
            if (matches(strategy, "FAKE_FIRSTNAME", "FIRSTNAME")) return FIRSTNAME;
            if (matches(strategy, "FAKE_LASTNAME", "LASTNAME")) return LASTNAME;
            if (matches(strategy, "FAKE_FULLNAME", "FULLNAME", "NAME")) return FULLNAME;
            if (matches(strategy, "FAKE_USERNAME", "USERNAME")) return USERNAME;
            if (matches(strategy, "FAKE_EMAIL", "EMAIL")) return EMAIL;
            if (matches(strategy, "FAKE_PHONE", "PHONE")) return PHONE;
            if (matches(strategy, "FAKE_ADDRESS", "ADDRESS")) return ADDRESS;
            if (matches(strategy, "FAKE_CITY", "CITY")) return CITY;
            if (matches(strategy, "FAKE_COUNTRY", "COUNTRY")) return COUNTRY;
            if (matches(strategy, "FAKE_ZIP", "ZIP")) return ZIP;
            return COLUMN_HEURISTIC;
        }

        private static boolean matches(String strategy, String... names) {
            for (String name : names) {
                if (name.equalsIgnoreCase(strategy)) return true;
            }
            return false;
        }
    }

    private Faker fakerFor(String strategy, String columnName, String original) {
        return fakerWithSeed(seedFor(strategy, columnName, original));
    }

    @SuppressWarnings("java:S2245")
    private long seedFor(String strategy, String columnName, String original) {
        String material = locale.toLanguageTag() + "|" +
            normalize(strategy) + "|" +
            normalize(columnName) + "|" +
            normalize(original);
        String hash = CryptoUtils.sha256Hex(material);
        // Intentionally not SecureRandom: JavaFaker accepts java.util.Random here,
        // and this path needs repeatable fake values, not security-sensitive randomness.
        return Long.parseUnsignedLong(hash.substring(0, 16), 16);
    }

    private String normalize(String value) {
        return value == null ? "" : value;
    }

    private String fallbackValue(String strategy, String columnName, String original) {
        String material = locale.toLanguageTag() + "|" +
            normalize(strategy) + "|" +
            normalize(columnName) + "|" +
            normalize(original);
        return "ANON_" + CryptoUtils.sha256Hex(material).substring(0, 12);
    }

    @FunctionalInterface
    interface FakerFactory {
        Faker create(Locale locale, Random random);
    }
}
