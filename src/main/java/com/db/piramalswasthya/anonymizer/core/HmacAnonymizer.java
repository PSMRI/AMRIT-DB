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

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import com.db.piramalswasthya.anonymizer.util.CryptoUtils;
import java.util.HexFormat;

/**
 * HMAC-based deterministic anonymization.
 *
 * Uses HMAC-SHA256(key, stable_id) to generate consistent fake values.
 * Same input always produces same output (deterministic).
 */
public class HmacAnonymizer {

    private static final String HMAC_ALGORITHM = "HmacSHA256";

    private final SecretKeySpec keySpec;

    public HmacAnonymizer(String secretKey) {
        if (secretKey == null || secretKey.isBlank()) {
            throw new IllegalArgumentException("Secret key must not be null or empty");
        }
        byte[] raw = CryptoUtils.decodeSecret(secretKey);
        if (raw == null || raw.length < 16) {
            throw new IllegalArgumentException("Secret key raw bytes must be at least 16 bytes");
        }
        this.keySpec = new SecretKeySpec(raw, HMAC_ALGORITHM);
    }

    /**
     * Generate deterministic hash for an ID.
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
        } catch (NoSuchAlgorithmException e) {
            throw new HmacAnonymizerException("HMAC algorithm not available: " + HMAC_ALGORITHM, e);
        } catch (InvalidKeyException e) {
            throw new HmacAnonymizerException("Invalid HMAC key material for algorithm: " + HMAC_ALGORITHM, e);
        }
    }
    /**
     * Compute a plain SHA-256 hex digest (non-keyed).
     * This supports the HASH_SHA256 strategy used in the registry.
     */
    public String sha256Hash(String input) {
        return CryptoUtils.sha256Hex(input);
    }
    /**
     * Mask phone number - show last 4 digits only.
     */
    public String maskPhone(String phone) {
        if (phone == null || phone.length() < 4) {
            return "XXXX";
        }
        int len = phone.length();
        return "X".repeat(len - 4) + phone.substring(len - 4);
    }

    /**
     * Generic partial mask helper.
     * Masks all characters except the last `showLast` characters.
     * If input is shorter than or equal to `showLast`, masks entire string.
     */
    public String maskPartial(String s, int showLast) {
        if (s == null || s.isEmpty()) {
            return "".isEmpty() ? "" : ""; // keep return type consistent
        }
        if (showLast < 0) showLast = 0;
        int len = s.length();
        if (len <= showLast) {
            return "X".repeat(len);
        }
        int maskLen = Math.max(0, len - showLast);
        return "X".repeat(maskLen) + s.substring(len - showLast);
    }

    /**
     * Generalize date to year only.
     */
    public String generalizeDate(String date) {
        if (date == null || date.length() < 4) {
            return "****";
        }
        return date.substring(0, 4);
    }
}
class HmacAnonymizerException extends RuntimeException {
    HmacAnonymizerException(String message, Throwable cause) {
        super(message, cause);
    }
}
