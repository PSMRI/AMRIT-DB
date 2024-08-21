package com.piramalswasthya.db;

import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import com.piramalswasthya.db.AmritDbApplication;

@SpringBootTest
class AmritDbApplicationTests {
	@Mock
	AmritDbApplication amritDbApplication;

	@Test
	public void test() {
		amritDbApplication.toString();
	}
}
