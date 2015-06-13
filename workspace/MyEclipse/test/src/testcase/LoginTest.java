package testcase;


import junit.framework.Assert;
import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LoginTest extends TestCase{

	public LoginTest(String string) {
		super(string);
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void loginTest() throws Exception{
		assertEquals("abc", "1fgdgabc");
		
	}
}
