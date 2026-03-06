package com.db.piramalswasthya.anonymizer.util;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class StringUtilsTest {

    @Test
    void commaSepToList_nullOrEmpty() {
        assertTrue(StringUtils.commaSepToList(null).isEmpty());
        assertTrue(StringUtils.commaSepToList(" ").isEmpty());
    }

    @Test
    void commaSepToList_basic() {
        List<String> res = StringUtils.commaSepToList("a,b,c");
        assertEquals(3, res.size());
        assertEquals(List.of("a","b","c"), res);
    }

    @Test
    void commaSepToList_spacesAndEmptyParts() {
        List<String> res = StringUtils.commaSepToList(" a ,  b, , c , ");
        assertEquals(3, res.size());
        assertEquals(List.of("a","b","c"), res);
    }

}
