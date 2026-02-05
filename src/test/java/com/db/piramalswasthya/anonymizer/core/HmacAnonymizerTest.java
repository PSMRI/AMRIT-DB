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
    
    private static final String TEST_SECRET = "test-secret-key-32-characters-long-123456";
    
    @Test
    void testHashId_Deterministic() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String input = "12345";
        String hash1 = anonymizer.hashId(input);
        String hash2 = anonymizer.hashId(input);
        
        // Same input should produce same hash
        assertEquals(hash1, hash2);
        assertNotNull(hash1);
        assertTrue(hash1.length() > 0);
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
    void testFakeName_Deterministic() {
        HmacAnonymizer anonymizer = new HmacAnonymizer(TEST_SECRET);
        
        String input = "John Doe";
        String fake1 = anonymizer.fakeName(input);
        String fake2 = anonymizer.fakeName(input);
        
        // Same input should produce same fake name
        assertEquals(fake1, fake2);
        assertNotNull(fake1);
        assertTrue(fake1.contains(" ")); // Should have first and last name
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
}
