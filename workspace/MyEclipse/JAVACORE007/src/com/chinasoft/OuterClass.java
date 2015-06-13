package com.chinasoft;

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
		new InnerClass().doTest("avc");
		
	}
	
	public IInnerClass getInstance(){
		return new InnerClass();
	}

	private  class InnerClass implements IInnerClass{
		
		
		private static final String staticName = "";
		
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
		
		/* (non-Javadoc)
		 * @see com.chinasoft.IInnerClass#doTest(java.lang.String)
		 */
		public void doTest(String innerName){
			this.innerName = "zhouqi";
			OuterClass.this.innerName= "zhouqi";
			OuterClass.this.getInnerName();
			OuterClass.name = "zhou";
		}
		
	}
	
}
