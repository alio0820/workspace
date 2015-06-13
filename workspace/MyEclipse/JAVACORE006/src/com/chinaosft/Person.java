package com.chinaosft;

import java.io.Serializable;

public class Person implements Serializable,Cloneable {
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 758981559518015439L;
	private String name;
	private transient int age;
	private Car car;
	private String a;
	
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
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
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	
	


	
	
	
	
}
