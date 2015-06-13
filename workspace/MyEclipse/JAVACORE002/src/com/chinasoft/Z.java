package com.chinasoft;

public class Z extends C {

	
	public void setA(int a) {
		super.setA(a);
		super.setB(a);
	}

	@Override
	public void setB(int b) {
		super.setA(b);
		super.setB(b);
	}
	
}
