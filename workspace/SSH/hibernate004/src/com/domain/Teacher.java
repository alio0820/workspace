package com.domain;

import java.io.Serializable;
import java.util.Set;

public class Teacher implements Serializable {
	private int id;
	private String teacherName;
	private Set<Student> student;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public Set<Student> getStudent() {
		return student;
	}
	public void setStudent(Set<Student> student) {
		this.student = student;
	}

	
}
