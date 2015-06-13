package com.chinasoft.s;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		OuterClass out = new OuterClass();
		OuterClass.InnerClass in = new OuterClass.InnerClass();
		
		OuterClass.InnerClass.doTest1(100);
	}

}
