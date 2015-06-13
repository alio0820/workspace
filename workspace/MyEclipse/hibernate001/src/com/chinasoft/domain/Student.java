package com.chinasoft.domain;

import java.io.Serializable;

public class Student implements Serializable {
	private StudentId id;
	private int age;
	public StudentId getId() {
		return id;
	}
	public void setId(StudentId id) {
		this.id = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
