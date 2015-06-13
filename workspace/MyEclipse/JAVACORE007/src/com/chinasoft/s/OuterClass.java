package com.chinasoft.s;

public class OuterClass {
	
	private static String name;
	
	private String innerName;	

	public String getInnerName() {
		return innerName;
	}

	public void setInnerName(String innerName) {
		this.innerName = innerName;
	}
	
	public void doTest(){
		new InnerClass().innerName = "aaa";
		InnerClass.staticName = "zhouqi";
		new InnerClass().doTest("avc");
		InnerClass.doTest1(10);
	}
	


	protected static class InnerClass {
		
		
		private static  String staticName = "";
		
		private String innerName;

		/* (non-Javadoc)
		 * @see com.chinasoft.IInnerClass#getInnerName()
		 */
		public String getInnerName() {
			return innerName;
		}

		/* (non-Javadoc)
		 * @see com.chinasoft.IInnerClass#setInnerName(java.lang.String)
		 */
		public void setInnerName(String innerName) {
			this.innerName = innerName;
		}
		
		public static void doTest1(int i){
			staticName = "100";
			new InnerClass().innerName = "zz";
			OuterClass.name = "zzz";
		} 
		
		/* (non-Javadoc)
		 * @see com.chinasoft.IInnerClass#doTest(java.lang.String)
		 */
		public void doTest(String innerName){
			this.innerName = "zhouqi";			
			OuterClass.name = "zhou";
		}
		
	}
	
}
