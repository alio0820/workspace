package com.chinasoft;

public class Target implements IProxy {

	@Override
	public void say(String name) {
		System.out.println("���" +name);

	}

	@Override
	public void say1(String name) {
		System.out.println("���1" +name);
		
	}

}
