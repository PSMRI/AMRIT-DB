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

import com.github.javafaker.Faker;
import java.security.SecureRandom;
import java.util.Locale;

/**
 * Provides realistic fake values for columns using JavaFaker.
 */
public class RandomFakeDataAnonymizer {

    private final Faker faker;
    private final Locale locale;
    private final SecureRandom secureRandom = new SecureRandom();

    public RandomFakeDataAnonymizer(Locale locale) {
        this.locale = locale == null ? Locale.ENGLISH : locale;
        this.faker = new Faker(this.locale);
    }

    private boolean isIndiaLocale() {
        if (locale == null) return false;
        String country = locale.getCountry();
        if (country != null && country.equalsIgnoreCase("IN")) return true;
        String tag = locale.toString();
        return tag != null && tag.toUpperCase().contains("IN");
    }

    /**
     * Non-deterministic fake value generation using a shared Faker instance.
     */
    public Object anonymize(String columnName, String original) {
        if (original == null) return null;

        String c = columnName == null ? "" : columnName.toLowerCase();
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
            if (c.contains("zip") || c.contains("postal")) return faker.address().zipCode();

            // Fallback: return a short lorem word
            return faker.lorem().word();
        } catch (RuntimeException e) {
            return original;
        }
    }

    /**
     * Strategy-aware non-deterministic anonymization.
     * If `strategy` is null or unknown, falls back to column-name heuristics.
     */
    public Object anonymize(String strategy, String columnName, String original) {
        if (original == null) return null;
        String s = strategy == null ? "" : strategy.toUpperCase();

        try {
            switch (s) {
                case "FAKE_FIRSTNAME":
                case "FIRSTNAME":
                    return faker.name().firstName();
                case "FAKE_LASTNAME":
                case "LASTNAME":
                    return faker.name().lastName();
                case "FAKE_FULLNAME":
                case "FULLNAME":
                case "NAME":
                    return faker.name().fullName();
                case "FAKE_USERNAME":
                case "USERNAME":
                    return faker.name().username();
                case "FAKE_EMAIL":
                case "EMAIL":
                    return faker.internet().emailAddress();
                case "FAKE_PHONE":
                case "PHONE":
                    // realistic 10-digit mobile starting with 6-9
                    if (isIndiaLocale()) {
                        char[] leading = new char[]{'6', '7', '8', '9'};
                        char lead = leading[secureRandom.nextInt(leading.length)];
                        String rest = faker.numerify("#########");
                        return lead + rest;
                    }
                    return faker.phoneNumber().cellPhone();
                case "FAKE_ADDRESS":
                case "ADDRESS":
                    return faker.address().fullAddress();
                case "FAKE_CITY":
                case "CITY":
                    return faker.address().city();
                case "FAKE_COUNTRY":
                case "COUNTRY":
                    // Preserve country for single-country deployments
                    return original;
                case "FAKE_ZIP":
                case "ZIP":
                    return faker.address().zipCode();
                default:
                    return anonymize(columnName, original);
            }
        } catch (RuntimeException e) {
            return original;
        }
    }

}
