package com.chinasoft;

public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Factory f = new Factory();
		System.out.println(f.getInstance().sayHello("zhouqi"));

	}

}
