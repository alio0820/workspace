import java.awt.AWTException;


public class Test {

	public void doTest1() throws Exception{
		doTest2();
	}
	
	public void doTest2() throws Exception{
		
			doTest3();
		
	}
	
	public void doTest3() throws Exception{
		
		Class.forName("dsfsdf");
	}
	
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) {
		
		
				try {
					new Test().doTest1();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					//System.out.println(e);
				}

			System.out.println("-----");
			
			return;
		
	}

}
