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

package com.db.piramalswasthya.anonymizer.util;

import java.util.regex.Pattern;

/**
 * Small SQL identifier helpers shared across the anonymizer to avoid duplication.
 */
public final class SqlUtils {
    private SqlUtils() {}

    /**
     * Characters that could break out of a backtick-quoted MySQL identifier or
     * smuggle statements: backticks and control characters. Everything else is
     * legal inside backticks - real AMRIT schemas contain column names with
     * spaces, dots and slashes (e.g. "WBC_TotalCount _/c.mm").
     */
    private static final Pattern FORBIDDEN_CHARS = Pattern.compile("[`\\x00-\\x1f\\x7f]");

    public static void validateIdentifier(String identifier) {
        if (identifier == null || identifier.isEmpty()) {
            throw new IllegalArgumentException("Identifier cannot be null or empty");
        }
        if (FORBIDDEN_CHARS.matcher(identifier).find()) {
            throw new IllegalArgumentException(
                "Invalid identifier: " + identifier + " (backticks and control characters not allowed)");
        }
    }

    /**
     * Quote identifier with backticks after validation.
     *
     * Security: backticks are rejected by validateIdentifier, so the quoted
     * identifier cannot break out of its backtick delimiters.
     */
    public static String quoteIdentifier(String identifier) {
        validateIdentifier(identifier);
        return "`" + identifier + "`";
    }
}
