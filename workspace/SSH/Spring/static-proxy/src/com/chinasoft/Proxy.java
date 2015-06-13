package com.chinasoft;

public class Proxy implements IProxy {

	private IProxy target = new Target();
	
	@Override
	public void say(String name) {
		System.out.println("---------");
		target.say(name);
		System.out.println("||||||||||");
	}

}
