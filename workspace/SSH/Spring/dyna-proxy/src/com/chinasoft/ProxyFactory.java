package com.chinasoft;

import java.lang.reflect.Proxy;

import sun.misc.Launcher;

public class ProxyFactory {
	
	public IProxy target;	
	
	public ProxyFactory(IProxy target) {
		super();
		this.target = target;
	}

	public  IProxy getInstance(){			
		
		ClassLoader classLoader = IProxy.class.getClassLoader();
		
		
		Object o = Proxy.newProxyInstance(IProxy.class.getClassLoader(), 
				target.getClass().getInterfaces(),
				new MyIH(target));			
		
		return (IProxy)o;
		
	}
}
