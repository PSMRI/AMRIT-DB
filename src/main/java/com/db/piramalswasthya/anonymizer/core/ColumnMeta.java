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

import java.sql.Types;

/**
 * Column metadata captured from the source table, used to make anonymization
 * outputs fit the target column (type and length) since target tables are
 * structural clones of the source.
 *
 * @param name      column name as reported by the database
 * @param jdbcType  {@link java.sql.Types} constant
 * @param precision column length for character types, numeric precision otherwise
 * @param nullable  whether the column accepts NULL
 */
public record ColumnMeta(String name, int jdbcType, int precision, boolean nullable) {

    public boolean isNumeric() {
        return switch (jdbcType) {
            case Types.TINYINT, Types.SMALLINT, Types.INTEGER, Types.BIGINT,
                 Types.DECIMAL, Types.NUMERIC, Types.FLOAT, Types.DOUBLE, Types.REAL -> true;
            default -> false;
        };
    }

    public boolean isCharacter() {
        return switch (jdbcType) {
            case Types.CHAR, Types.VARCHAR, Types.LONGVARCHAR,
                 Types.NCHAR, Types.NVARCHAR, Types.LONGNVARCHAR -> true;
            default -> false;
        };
    }

    public boolean isTemporal() {
        return switch (jdbcType) {
            case Types.DATE, Types.TIME, Types.TIMESTAMP,
                 Types.TIME_WITH_TIMEZONE, Types.TIMESTAMP_WITH_TIMEZONE -> true;
            default -> false;
        };
    }

    /**
     * Largest value that safely fits this numeric column type.
     */
    public long numericCap() {
        return switch (jdbcType) {
            case Types.TINYINT -> 99L;
            case Types.SMALLINT -> 9_999L;
            case Types.INTEGER -> 999_999_999L;
            default -> 999_999_999_999_999L; // BIGINT/DECIMAL etc.
        };
    }
}
