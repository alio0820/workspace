package com.chinasoft;

public class DisablePerson {	
	//关联
	Person[] p = {new Person(),new Person()};
	
	
	public void eat(){
		p[0].eat();
	}
	public void eat1(){
		p[1].eat();
	}
	
	
	
	public void say(){		
		System.out.println("我开的是三轮车");
	}
}
