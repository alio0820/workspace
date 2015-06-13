package com;

import java.util.Date;



/**
 * Borrow entity. @author MyEclipse Persistence Tools
 */

public class Borrow  implements java.io.Serializable {


    // Fields    

    private Short reader_id;
    private Long book_id;
    private Date borrow_date;
    
    public Borrow(){}

	public Short getReader_id() {
		return reader_id;
	}

	public void setReader_id(Short reader_id) {
		this.reader_id = reader_id;
	}

	public Long getBook_id() {
		return book_id;
	}

	public void setBook_id(Long book_id) {
		this.book_id = book_id;
	}

	public Date getBorrow_date() {
		return borrow_date;
	}

	public void setBorrow_date(Date borrow_date) {
		this.borrow_date = borrow_date;
	}
    
    



  








}