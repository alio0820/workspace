package com.domain;

import java.io.Serializable;
import java.util.Set;

public class Student implements Serializable {
	private int id;
	private String  studentName;
	private Set<Teacher> teacher;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public Set<Teacher> getTeacher() {
		return teacher;
	}
	public void setTeacher(Set<Teacher> teacher) {
		this.teacher = teacher;
	}
	

	
	
}
