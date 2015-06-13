package com;

/**
 * Reader entity. @author MyEclipse Persistence Tools
 */

public class Reader implements java.io.Serializable {

	// Fields

	private ReaderId id;

	// Constructors

	/** default constructor */
	public Reader() {
	}

	/** full constructor */
	public Reader(ReaderId id) {
		this.id = id;
	}

	// Property accessors

	public ReaderId getId() {
		return this.id;
	}

	public void setId(ReaderId id) {
		this.id = id;
	}

}