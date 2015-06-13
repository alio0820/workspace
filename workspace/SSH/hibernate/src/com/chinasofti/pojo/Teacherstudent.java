package com.chinasofti.pojo;

/**
 * Teacherstudent entity. @author MyEclipse Persistence Tools
 */

public class Teacherstudent implements java.io.Serializable {

	// Fields

	private Integer id;
	private Teacher2 teacher2;
	private Student2 student2;

	// Constructors

	/** default constructor */
	public Teacherstudent() {
	}

	/** full constructor */
	public Teacherstudent(Integer id, Teacher2 teacher2, Student2 student2) {
		this.id = id;
		this.teacher2 = teacher2;
		this.student2 = student2;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Teacher2 getTeacher2() {
		return this.teacher2;
	}

	public void setTeacher2(Teacher2 teacher2) {
		this.teacher2 = teacher2;
	}

	public Student2 getStudent2() {
		return this.student2;
	}

	public void setStudent2(Student2 student2) {
		this.student2 = student2;
	}

}