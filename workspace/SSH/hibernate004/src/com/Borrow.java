package com;

/**
 * Borrow entity. @author MyEclipse Persistence Tools
 */

public class Borrow implements java.io.Serializable {

	// Fields

	private BorrowId id;

	// Constructors

	/** default constructor */
	public Borrow() {
	}

	/** full constructor */
	public Borrow(BorrowId id) {
		this.id = id;
	}

	// Property accessors

	public BorrowId getId() {
		return this.id;
	}

	public void setId(BorrowId id) {
		this.id = id;
	}

}