package com.chinasofti.pojo;

/**
 * Accounting entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Accounting implements java.io.Serializable {

	// Fields

	private Integer id;
	private String num;
	private String name;

	// Constructors

	/** default constructor */
	public Accounting() {
	}

	/** full constructor */
	public Accounting(String num, String name) {
		this.num = num;
		this.name = name;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}