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

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class SqlUtilsTest {

    @Test
    void allowsRealWorldColumnNames() {
        // Actual column name from production db_iemr (t_lab_microscopy)
        assertEquals("`WBC_TotalCount _/c.mm`", SqlUtils.quoteIdentifier("WBC_TotalCount _/c.mm"));
        assertEquals("`simple_name`", SqlUtils.quoteIdentifier("simple_name"));
        assertEquals("`Value (%)`", SqlUtils.quoteIdentifier("Value (%)"));
    }

    @Test
    void rejectsBreakoutAttempts() {
        assertThrows(IllegalArgumentException.class, () -> SqlUtils.quoteIdentifier("x` DROP TABLE y; --"));
        assertThrows(IllegalArgumentException.class, () -> SqlUtils.quoteIdentifier("bad\nname"));
        assertThrows(IllegalArgumentException.class, () -> SqlUtils.quoteIdentifier(""));
        assertThrows(IllegalArgumentException.class, () -> SqlUtils.quoteIdentifier(null));
    }
}
