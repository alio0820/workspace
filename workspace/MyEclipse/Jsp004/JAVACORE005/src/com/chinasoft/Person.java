package com.chinasoft;

public abstract class Person {
	
	public  int i1 = 10;
	
	protected Person(){
		
	}
	
	private  String name;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public  abstract void doWork();
	
	
	public void eat(){
		System.out.println("³Ô·¹");
		
	}
	
}
