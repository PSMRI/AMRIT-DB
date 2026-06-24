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

    public RandomFakeDataAnonymizer(Locale locale) {
        this(locale, Faker::new);
    }

    RandomFakeDataAnonymizer(Locale locale, FakerFactory fakerFactory) {
        this.locale = locale == null ? Locale.ENGLISH : locale;
        this.fakerFactory = fakerFactory == null ? Faker::new : fakerFactory;
    }

    private boolean isIndiaLocale() {
        if (locale == null) return false;
        String country = locale.getCountry();
        if (country != null && country.equalsIgnoreCase("IN")) return true;
        String tag = locale.toString();
        return tag != null && tag.toUpperCase().contains("IN");
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
        String c = columnName == null ? "" : columnName.toLowerCase();
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
        String s = strategy == null ? "" : strategy.toUpperCase();
        Random random = randomFor(s, columnName, original);

        try {
            Faker faker = fakerFactory.create(locale, random);
            switch (s) {
                case "FAKE_FIRSTNAME", "FIRSTNAME":
                    return faker.name().firstName();
                case "FAKE_LASTNAME", "LASTNAME":
                    return faker.name().lastName();
                case "FAKE_FULLNAME", "FULLNAME", "NAME":
                    return faker.name().fullName();
                case "FAKE_USERNAME", "USERNAME":
                    return faker.name().username();
                case "FAKE_EMAIL", "EMAIL":
                    return faker.internet().emailAddress();
                case "FAKE_PHONE", "PHONE":
                    // realistic 10-digit mobile starting with 6-9
                    if (isIndiaLocale()) {
                        char[] leading = new char[]{'6', '7', '8', '9'};
                        char lead = leading[random.nextInt(leading.length)];
                        String rest = faker.numerify("#########");
                        return lead + rest;
                    }
                    return faker.phoneNumber().cellPhone();
                case "FAKE_ADDRESS", "ADDRESS":
                    return faker.address().fullAddress();
                case "FAKE_CITY", "CITY":
                    return faker.address().city();
                case "FAKE_COUNTRY", "COUNTRY":
                    // Preserve country for single-country deployments
                    return original;
                case "FAKE_ZIP", "ZIP":
                    return faker.address().zipCode();
                default:
                    return anonymizeByColumn(faker, columnName);
            }
        } catch (RuntimeException e) {
            return fallbackValue(s, columnName, original);
        }
    }

    private Faker fakerFor(String strategy, String columnName, String original) {
        return fakerFactory.create(locale, randomFor(strategy, columnName, original));
    }

    @SuppressWarnings("java:S2245")
    private Random randomFor(String strategy, String columnName, String original) {
        String material = locale.toLanguageTag() + "|" +
            normalize(strategy) + "|" +
            normalize(columnName) + "|" +
            normalize(original);
        String hash = CryptoUtils.sha256Hex(material);
        long seed = Long.parseUnsignedLong(hash.substring(0, 16), 16);
        // Intentionally not SecureRandom: JavaFaker accepts java.util.Random here,
        // and this path needs repeatable fake values, not security-sensitive randomness.
        return new Random(seed);
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
