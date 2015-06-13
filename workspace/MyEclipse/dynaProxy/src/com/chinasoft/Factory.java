package com.chinasoft;

import java.lang.reflect.Proxy;

public class Factory {
	
	public IHello getInstance(){
		IHello hello = new HelloImpl();
		MyHandler myh = new MyHandler(hello);
		Class[] c = {IHello.class};
		
		
		return (IHello)Proxy.newProxyInstance(hello.getClass().getClassLoader(),c , myh);
		
	}
}
