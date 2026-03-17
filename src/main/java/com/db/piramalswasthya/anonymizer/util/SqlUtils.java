package com.db.piramalswasthya.anonymizer.util;

import java.util.regex.Pattern;

/**
 * Small SQL identifier helpers shared across the anonymizer to avoid duplication.
 */
public final class SqlUtils {
    private SqlUtils() {}

    public static final Pattern VALID_IDENTIFIER = Pattern.compile("^\\w+$");

    public static void validateIdentifier(String identifier) {
        if (identifier == null || identifier.isEmpty()) {
            throw new IllegalArgumentException("Identifier cannot be null or empty");
        }
        if (!VALID_IDENTIFIER.matcher(identifier).matches()) {
            throw new IllegalArgumentException(
                "Invalid identifier: " + identifier + " (only alphanumeric and underscore allowed)");
        }
    }

    public static String quoteIdentifier(String identifier) {
        validateIdentifier(identifier);
        return "`" + identifier + "`";
    }
}
