package com.chinasoft.domain;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book implements java.io.Serializable {

	// Fields

	private BookId id;

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(BookId id) {
		this.id = id;
	}

	// Property accessors

	public BookId getId() {
		return this.id;
	}

	public void setId(BookId id) {
		this.id = id;
	}

}