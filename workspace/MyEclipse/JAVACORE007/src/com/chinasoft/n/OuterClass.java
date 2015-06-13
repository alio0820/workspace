package com.chinasoft.n;

import com.chinasoft.IInnerClass;



public class OuterClass {
	
	private static String name;
	
	private String innerName;	

	public String getInnerName() {
		
		return innerName;
	}

	public void setInnerName(String innerName) {
		this.innerName = innerName;
	}
	
	public void aaa(){
	Object i = new Object(){

		@Override
		protected Object clone() throws CloneNotSupportedException {
			// TODO Auto-generated method stub
			return super.clone();
		}
		
	};
		
	}
	

	
	
	

	
	
	
}
