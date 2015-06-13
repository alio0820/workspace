package com.chinasoft;

public class Person implements Comparable{
	
	
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public int compareTo(Object o) {
		
		Person p = (Person)o;
	
		if(this.getAge() < p.getAge()){
			return 1;
		}else if(this.getAge() > p.getAge()){
			return -1;
		}		
		return 1;
	}

	
	
}
