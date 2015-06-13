package com.chinasofti.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Teacher2 entity. @author MyEclipse Persistence Tools
 */

public class Teacher2 implements java.io.Serializable {

	// Fields

	private Integer TId;
	private String teacherName;
	private Set teacherstudents = new HashSet(0);

	// Constructors

	/** default constructor */
	public Teacher2() {
	}

	/** full constructor */
	public Teacher2(String teacherName, Set teacherstudents) {
		this.teacherName = teacherName;
		this.teacherstudents = teacherstudents;
	}

	// Property accessors

	public Integer getTId() {
		return this.TId;
	}

	public void setTId(Integer TId) {
		this.TId = TId;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Set getTeacherstudents() {
		return this.teacherstudents;
	}

	public void setTeacherstudents(Set teacherstudents) {
		this.teacherstudents = teacherstudents;
	}

}