package com.chinasoft;

public class Target implements IProxy {

	@Override
	public void say(String name) {
		System.out.println("ÄãºÃ" +name);

	}

	@Override
	public void say1(String name) {
		System.out.println("ÄãºÃ1" +name);
		
	}

}
