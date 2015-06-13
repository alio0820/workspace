package com.chinasoft.dao.impl;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.dao.IBookDao;
import com.chinasoft.domain.Book;
import com.chinasoft.domain.BookId;

public class BookDaoImpl extends HibernateDaoSupport implements IBookDao {

	public void addBook() {
		System.out.println("½øÈëµ½dao");
		Session session = getSession();
		Book book = new Book();
		BookId id = new BookId();
		id.setId(1001L);
		id.setName("aaqqq");
		book.setId(id);
		session.save(book);


	}

}
