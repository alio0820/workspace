package com.chinasoft;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class MyIH implements InvocationHandler {
	
	private IProxy target;

	public MyIH(IProxy target) {
		super();
		this.target = target;
	}

	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		System.out.println(method.getName());
		if(method.getName().equals("say")){
			System.out.println("х╗очеп╤о");
			method.invoke(target, args);
		}else{
			method.invoke(target, args);
		}
		
		for(Object arg :args){
			System.out.println(arg);
		}		
		
		
		return null;
	}

}
