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
