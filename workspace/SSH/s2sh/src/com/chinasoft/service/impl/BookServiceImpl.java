package com.chinasoft.service.impl;

import com.chinasoft.dao.IBookDao;
import com.chinasoft.service.IBookService;

public class BookServiceImpl implements IBookService {

	private IBookDao bookDao;	
	
	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}

	public void addBook() {
		System.out.println("½øÈëµ½service");
		bookDao.addBook();

	}

}
