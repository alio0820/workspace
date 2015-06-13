package com.chinasoft;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class MyHandler implements InvocationHandler {

	private Object hello;
	
	
	public MyHandler(Object hello) {
		super();
		this.hello = hello;
	}


	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		System.out.println("haha");
		Object re = method.invoke(hello, args);
		System.out.println("hehe");
		
		return re;
	}

}
