package com;

import java.sql.Timestamp;

/**
 * BorrowId entity. @author MyEclipse Persistence Tools
 */

public class BorrowId implements java.io.Serializable {

	// Fields

	private Short readerId;
	private Long bookId;
	private Timestamp borrowDate;

	// Constructors

	/** default constructor */
	public BorrowId() {
	}

	/** full constructor */
	public BorrowId(Short readerId, Long bookId, Timestamp borrowDate) {
		this.readerId = readerId;
		this.bookId = bookId;
		this.borrowDate = borrowDate;
	}

	// Property accessors

	public Short getReaderId() {
		return this.readerId;
	}

	public void setReaderId(Short readerId) {
		this.readerId = readerId;
	}

	public Long getBookId() {
		return this.bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Timestamp getBorrowDate() {
		return this.borrowDate;
	}

	public void setBorrowDate(Timestamp borrowDate) {
		this.borrowDate = borrowDate;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof BorrowId))
			return false;
		BorrowId castOther = (BorrowId) other;

		return ((this.getReaderId() == castOther.getReaderId()) || (this
				.getReaderId() != null
				&& castOther.getReaderId() != null && this.getReaderId()
				.equals(castOther.getReaderId())))
				&& ((this.getBookId() == castOther.getBookId()) || (this
						.getBookId() != null
						&& castOther.getBookId() != null && this.getBookId()
						.equals(castOther.getBookId())))
				&& ((this.getBorrowDate() == castOther.getBorrowDate()) || (this
						.getBorrowDate() != null
						&& castOther.getBorrowDate() != null && this
						.getBorrowDate().equals(castOther.getBorrowDate())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getReaderId() == null ? 0 : this.getReaderId().hashCode());
		result = 37 * result
				+ (getBookId() == null ? 0 : this.getBookId().hashCode());
		result = 37
				* result
				+ (getBorrowDate() == null ? 0 : this.getBorrowDate()
						.hashCode());
		return result;
	}

}