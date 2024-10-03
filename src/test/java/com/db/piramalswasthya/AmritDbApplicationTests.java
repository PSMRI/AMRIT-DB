package com.db.piramalswasthya;

import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AmritDbApplicationTests {
	@Mock
	AmritDbApplication amritDbApplication;

	@Test
	public void test() {
		amritDbApplication.toString();
	}
}
