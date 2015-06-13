package testsuite;

import junit.framework.Test;
import junit.framework.TestSuite;
import testcase.LoginTest;

public class AllTests {

	public static Test suite() {
		TestSuite suite = new TestSuite("Test for testsuite");
		//$JUnit-BEGIN$
		suite.addTest(new LoginTest("loginTest"));
		//$JUnit-END$
		return suite;
	}

}
