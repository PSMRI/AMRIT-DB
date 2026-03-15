package com.db.piramalswasthya.anonymizer.core;

import org.junit.jupiter.api.Test;

import java.util.Locale;

import static org.junit.jupiter.api.Assertions.*;

public class RandomFakeDataAnonymizerTest {

    private final RandomFakeDataAnonymizer faker = new RandomFakeDataAnonymizer(Locale.ENGLISH);

    @Test
    void firstNameProducesNonEmpty() {
        Object v = faker.anonymize("FAKE_FIRSTNAME", "FirstName", "Amit");
        assertNotNull(v);
        assertFalse(v.toString().isBlank());
    }

    @Test
    void lastNameProducesNonEmpty() {
        Object v = faker.anonymize("FAKE_LASTNAME", "LastName", "Kumar");
        assertNotNull(v);
        assertFalse(v.toString().isBlank());
    }

    @Test
    void emailLooksLikeEmail() {
        Object v = faker.anonymize("FAKE_EMAIL", "EmailID", "a.kumar@example.org");
        assertNotNull(v);
        assertTrue(v.toString().contains("@"));
    }

    @Test
    void phoneLooksLikeDigits() {
        Object v = faker.anonymize("FAKE_PHONE", "PhoneNo", "9999999999");
        assertNotNull(v);
        String digits = v.toString().replaceAll("\\D", "");
        assertTrue(digits.length() >= 7, "phone should have at least 7 digits");
    }

    @Test
    void addressAndCityNonEmpty() {
        Object a = faker.anonymize("FAKE_ADDRESS", "Address", "Some address");
        Object c = faker.anonymize("FAKE_CITY", "City", "Pune");
        assertNotNull(a);
        assertFalse(a.toString().isBlank());
        assertNotNull(c);
        assertFalse(c.toString().isBlank());
    }

    @Test
    void countryIsPreserved() {
        Object v = faker.anonymize("FAKE_COUNTRY", "Country", "India");
        assertEquals("India", v);
    }

    @Test
    void usernameNonEmpty() {
        Object v = faker.anonymize("FAKE_USERNAME", "UserName", "amit123");
        assertNotNull(v);
        assertFalse(v.toString().isBlank());
    }
}
