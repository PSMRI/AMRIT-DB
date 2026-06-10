package com.db.piramalswasthya.anonymizer.core;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Locale;

import org.junit.jupiter.api.Test;

class RandomFakeDataAnonymizerTest {

    @Test
    void strategyBasedFakeValuesAreDeterministicAcrossCallsAndInstances() {
        RandomFakeDataAnonymizer first = new RandomFakeDataAnonymizer(Locale.ENGLISH);
        RandomFakeDataAnonymizer second = new RandomFakeDataAnonymizer(Locale.ENGLISH);

        Object firstCall = first.anonymize("FAKE_EMAIL", "email", "patient@example.org");
        Object secondCall = first.anonymize("FAKE_EMAIL", "email", "patient@example.org");
        Object otherInstanceCall = second.anonymize("FAKE_EMAIL", "email", "patient@example.org");

        assertEquals(firstCall, secondCall);
        assertEquals(firstCall, otherInstanceCall);
    }

    @Test
    void columnHeuristicFakeValuesAreDeterministic() {
        RandomFakeDataAnonymizer anonymizer = new RandomFakeDataAnonymizer(Locale.ENGLISH);

        Object firstCall = anonymizer.anonymize("firstName", "Asha");
        Object secondCall = anonymizer.anonymize("firstName", "Asha");

        assertEquals(firstCall, secondCall);
    }

    @Test
    void indiaPhoneGenerationIsDeterministicAndUsesMobileShape() {
        RandomFakeDataAnonymizer first = new RandomFakeDataAnonymizer(Locale.forLanguageTag("en-IN"));
        RandomFakeDataAnonymizer second = new RandomFakeDataAnonymizer(Locale.forLanguageTag("en-IN"));

        Object firstCall = first.anonymize("FAKE_PHONE", "mobileNo", "9876543210");
        Object secondCall = second.anonymize("FAKE_PHONE", "mobileNo", "9876543210");

        assertEquals(firstCall, secondCall);
        assertTrue(firstCall.toString().matches("[6-9]\\d{9}"));
    }

    @Test
    void fakerFailuresUseDeterministicFallbackInsteadOfOriginalValue() {
        RandomFakeDataAnonymizer anonymizer = new RandomFakeDataAnonymizer(
            Locale.ENGLISH,
            (locale, random) -> {
                throw new IllegalStateException("faker unavailable");
            }
        );

        Object firstCall = anonymizer.anonymize("FAKE_EMAIL", "email", "patient@example.org");
        Object secondCall = anonymizer.anonymize("FAKE_EMAIL", "email", "patient@example.org");

        assertEquals(firstCall, secondCall);
        assertNotEquals("patient@example.org", firstCall);
        assertTrue(firstCall.toString().startsWith("ANON_"));
    }
}
