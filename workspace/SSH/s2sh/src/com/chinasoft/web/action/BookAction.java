package com.chinasoft.web.action;

import com.chinasoft.service.IBookService;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	
	IBookService bookService;	
	
	public void setBookService(IBookService bookService) {
		this.bookService = bookService;
	}

	public String addBook(){
		System.out.println("���뵽action");
		bookService.addBook();		
		return "success";
		
	}
}
