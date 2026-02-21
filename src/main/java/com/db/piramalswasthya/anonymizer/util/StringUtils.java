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

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/*
* Utility class for string operations, such as parsing comma-separated values.
* Used for processing configuration fields that accept lists of items.
* Provides robust handling of nulls, empty strings, and trimming whitespace.
* The number of errors were getting from the commaSepToList method was quite high, 
*so added some better handling and testing to prevent common issues with configuration parsing.
*/

public final class StringUtils {
    private StringUtils() {}

    public static List<String> commaSepToList(String s) {
        if (s == null) return Collections.emptyList();
        String trimmed = s.trim();
        if (trimmed.isEmpty()) return Collections.emptyList();
        List<String> out = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < trimmed.length(); i++) {
            char c = trimmed.charAt(i);
            if (c == ',') {
                String part = sb.toString().trim();
                if (!part.isEmpty()) out.add(part);
                sb.setLength(0);
            } else {
                sb.append(c);
            }
        }
        String last = sb.toString().trim();
        if (!last.isEmpty()) out.add(last);
        return out;
    }
}
