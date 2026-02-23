package com.db.piramalswasthya.anonymizer.util;

import java.nio.charset.StandardCharsets;
import java.util.HexFormat;
import java.util.Base64;

/**
 * Small crypto helpers used across the anonymizer to avoid duplicated implementations.
 */
public final class CryptoUtils {
    private CryptoUtils() {}

    public static String sha256Hex(String input) {
        if (input == null) return null;
        return sha256Hex(input.getBytes(StandardCharsets.UTF_8));
    }

    public static String sha256Hex(byte[] input) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(input);
            return HexFormat.of().formatHex(digest);
        } catch (java.security.NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 not available", e);
        }
    }

    public static byte[] decodeSecret(String secret) {
        if (secret == null) return null;
        String s = secret.trim();
        // Hex (even length, hex chars)
        if (s.length() % 2 == 0 && s.matches("[0-9a-fA-F]+")) {
            return HexFormat.of().parseHex(s);
        }
        // Base64
        try {
            return Base64.getDecoder().decode(s);
        } catch (IllegalArgumentException ignored) {
            // fallthrough to raw bytes
        }
        return s.getBytes(StandardCharsets.UTF_8);
    }
}
