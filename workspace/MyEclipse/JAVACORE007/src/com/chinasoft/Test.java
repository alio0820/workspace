package com.chinasoft;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		OuterClass out = new OuterClass();
		IInnerClass in  = out.getInstance();
		in.doTest("zhouqi");

	}

}
