package com.chinasoft;

public class AdaptorImpl extends Object implements Adaptor {

	@Override
	public void doTest1() {
		System.out.println("------ziji ");

	}

	@Override
	public void doTest2() {
		try {
			super.wait();
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}

	}

}
