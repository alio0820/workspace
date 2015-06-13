package com.chinasoft;

public class Client {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {

		AbstractFactory factory = new Factory1();
		
		Fruit f = factory.getInstance(1);
		f.eat();

	}

}
