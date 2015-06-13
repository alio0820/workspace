package com.chinasoft.p;

public class OuterClass {
	
	private static String name;
	
	private String innerName;	

	public String getInnerName() {
		return innerName;
	}

	public void setInnerName(String innerName) {
		this.innerName = innerName;
	}
	

	
	public static void doTest(final int j){		
		
		 class InnerClass{			
			String  InnerName = "aaaa";			
			public void doTest(int i){
				//OuterClass.this.innerName = "zz";
				OuterClass.name = "qq";
				
			}	
			public void doTest1(int i){
				i = 50;
				doTest(j);
			}
		}
			new InnerClass().InnerName = "kkk";
			new InnerClass().doTest1(100);

	}
	
	

	
	
	
}
