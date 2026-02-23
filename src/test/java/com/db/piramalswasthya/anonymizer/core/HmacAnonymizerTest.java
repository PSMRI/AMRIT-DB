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

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for HmacAnonymizer
 */
class HmacAnonymizerTest {
    
    private static final String TEST_SECRET = loadTestSecret();

    private static String loadTestSecret() {
        java.util.Properties props = new java.util.Properties();
        java.nio.file.Path p = java.nio.file.Paths.get("src", "main", "environment", "common_local.properties");
        if (java.nio.file.Files.exists(p)) {
            try (java.io.InputStream is = java.nio.file.Files.newInputStream(p)) {
                props.load(is);
                for (String name : props.stringPropertyNames()) {
                    if (name.toLowerCase().contains("secret")) {
                        String v = props.getProperty(name);
                        if (v != null && !v.trim().isEmpty()) {
                            return v.trim();
                        }
                    }
                }
            } catch (Exception e) {
                // ignore and fall back to default below
            }
        }
        return "test-secret-key-32-characters-long-123456";
    }
    
    @Test
    void testHashId_Deterministic() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String input = "12345";
        String hash1 = anonymizer.hashId(input);
        String hash2 = anonymizer.hashId(input);
        
        // Same input should produce same hash
        assertEquals(hash1, hash2);
        assertNotNull(hash1);
        assertFalse(hash1.isEmpty());
    }
    
    @Test
    void testHashId_DifferentInputs() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String hash1 = anonymizer.hashId("12345");
        String hash2 = anonymizer.hashId("67890");
        
        // Different inputs should produce different hashes
        assertNotEquals(hash1, hash2);
    }
    
    @Test
    void testMaskPhone() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String phone = "9876543210";
        String masked = anonymizer.maskPhone(phone);
        
        assertEquals("XXXXXX3210", masked);
        assertTrue(masked.endsWith("3210"));
    }
    
    @Test
    void testMaskPhone_ShortNumber() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String phone = "123";
        String masked = anonymizer.maskPhone(phone);
        
        assertEquals("XXXX", masked);
    }
    
    @Test
    void testGeneralizeDate() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String date = "1985-05-15";
        String generalized = anonymizer.generalizeDate(date);
        
        assertEquals("1985", generalized);
    }
    
    @Test
    void testGeneralizeDate_ShortInput() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String date = "85";
        String generalized = anonymizer.generalizeDate(date);
        
        assertEquals("****", generalized);
    }
    
    @Test
    void testConstructor_InvalidKey() {
        assertThrows(IllegalArgumentException.class, () -> {
            new HmacAnonymizer("short");
        });
    }
    
    @Test
    void testConstructor_NullKey() {
        assertThrows(IllegalArgumentException.class, () -> {
            new HmacAnonymizer(null);
        });
    }

    @Test
    void testConstructor_HexKey() {
        // 32 bytes hex = 64 hex chars
        String hex = "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
        HmacAnonymizer a = new HmacAnonymizer(hex);
        assertNotNull(a);
        String h = a.hashId("1");
        assertNotNull(h);
        assertFalse(h.isEmpty());
    }

    @Test
    void testConstructor_Base64Key() {
        byte[] raw = new byte[16];
        java.util.Arrays.fill(raw, (byte) 0x1);
        String b64 = java.util.Base64.getEncoder().encodeToString(raw);
        HmacAnonymizer a = new HmacAnonymizer(b64);
        assertNotNull(a);
        String h = a.hashId("1");
        assertNotNull(h);
        assertFalse(h.isEmpty());
    }
}
