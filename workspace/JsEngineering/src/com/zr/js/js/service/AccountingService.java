package com.zr.js.js.service;

import java.util.List;

public interface AccountingService {
	boolean accounting(String num,String st,String qq,String id);
	List queryUser(int i,int pagesize);
	public int count();
}
