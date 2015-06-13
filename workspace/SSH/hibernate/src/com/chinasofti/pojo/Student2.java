package com.chinasofti.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Student2 entity. @author MyEclipse Persistence Tools
 */

public class Student2 implements java.io.Serializable {

	// Fields

	private Integer SId;
	private String studentName;
	private Set teacherstudents = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student2() {
	}

	/** full constructor */
	public Student2(String studentName, Set teacherstudents) {
		this.studentName = studentName;
		this.teacherstudents = teacherstudents;
	}

	// Property accessors

	public Integer getSId() {
		return this.SId;
	}

	public void setSId(Integer SId) {
		this.SId = SId;
	}

	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Set getTeacherstudents() {
		return this.teacherstudents;
	}

	public void setTeacherstudents(Set teacherstudents) {
		this.teacherstudents = teacherstudents;
	}

}