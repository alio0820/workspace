package com.chinasoft;

public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ProxyFactory pf = new ProxyFactory(new Target());
		pf.getInstance().say1("zhouqi");

	}

}
