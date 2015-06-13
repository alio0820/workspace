package com.chinasoft.test;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasoft.service.IBookService;

public class BookTest extends TestCase {
	
	public void testAddBook(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IBookService bookService = (IBookService)context.getBean("bookService");
		bookService.addBook();
	}
	
	
}
