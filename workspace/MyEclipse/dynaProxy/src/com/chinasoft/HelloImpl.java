package com.chinasoft;

public class HelloImpl implements IHello {

	@Override
	public String sayHello(String name) {
		System.out.println("ÄãµÄÃû×ÖÊÇ"+name);
		return "hello" + name;
	}

}
