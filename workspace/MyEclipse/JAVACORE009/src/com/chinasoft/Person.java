package com.chinasoft;

public class Person {
	private String name;
	private int age;
	public String sex;
	
	
	public Person() {

	}
	
	
	public Person(String name, int age, String sex) {
		super();
		this.name = name;
		this.age = age;
		this.sex = sex;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	private String getName() {
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
	public String toString() {

		return "name="+ name + "age=" + age;
	}
	
	public void doTest(String[] s ){
		System.out.println(s);
	}


	@Override
	protected void finalize() throws Throwable {
		System.out.println("该对象正在被销毁");
	}
	
	
	
}
