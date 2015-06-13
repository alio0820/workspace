package com.chinasofti.pojo;

import java.io.Serializable;
import java.util.Set;

public class Student implements Serializable {

	private Integer id;
	private String studentName;
	private Set<Teacher> teacher;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
