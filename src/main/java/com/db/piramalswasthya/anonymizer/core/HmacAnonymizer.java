package com.db.piramalswasthya.anonymizer.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HexFormat;

/**
 * HMAC-based deterministic anonymization
 * 
 * Uses HMAC-SHA256(key, stable_id) to generate consistent fake values.
 * Same input always produces same output (deterministic).
 * 
 * NO LOOKUP TABLES NEEDED - HMAC is deterministic by design.
 */
public class HmacAnonymizer {
    
    private static final Logger log = LoggerFactory.getLogger(HmacAnonymizer.class);
    private static final String HMAC_ALGORITHM = "HmacSHA256";
    
    private final SecretKeySpec keySpec;
    
    public HmacAnonymizer(String secretKey) {
        if (secretKey == null || secretKey.length() < 32) {
            throw new IllegalArgumentException("Secret key must be at least 32 characters");
        }
        this.keySpec = new SecretKeySpec(
            secretKey.getBytes(StandardCharsets.UTF_8), 
            HMAC_ALGORITHM
        );
    }
    
    /**
     * Generate deterministic hash for an ID
     * 
     * @param stableId Stable identifier (e.g., BenRegID, phone number)
     * @return Deterministic hash (hex string)
     */
    public String hashId(String stableId) {
        try {
            Mac mac = Mac.getInstance(HMAC_ALGORITHM);
            mac.init(keySpec);
            byte[] hash = mac.doFinal(stableId.getBytes(StandardCharsets.UTF_8));
            return HexFormat.of().formatHex(hash);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new RuntimeException("HMAC hashing failed", e);
        }
    }
    
    /**
     * Generate deterministic fake name
     * 
     * Uses HMAC to seed a predictable name generator.
     */
    public String fakeName(String originalName) {
        String hash = hashId(originalName);
        int seed = Math.abs(hash.hashCode());
        
        // Simple deterministic name generator
        String[] firstNames = {"Amit", "Priya", "Raj", "Anjali", "Vikram", "Neha"};
        String[] lastNames = {"Kumar", "Sharma", "Singh", "Patel", "Gupta", "Reddy"};
        
        String firstName = firstNames[seed % firstNames.length];
        String lastName = lastNames[(seed / 10) % lastNames.length];
        
        return firstName + " " + lastName;
    }
    
    /**
     * Mask phone number - show last 4 digits only
     */
    public String maskPhone(String phone) {
        if (phone == null || phone.length() < 4) {
            return "XXXX";
        }
        int len = phone.length();
        return "X".repeat(len - 4) + phone.substring(len - 4);
    }
    
    /**
     * Generalize date to year only
     */
    public String generalizeDate(String date) {
        if (date == null || date.length() < 4) {
            return "****";
        }
        return date.substring(0, 4); // Keep year only
    }
}
