package com.etc.OurProgram.service;

import java.util.List;

public interface DataAttributeService {
	boolean accounting(String num,String st,String qq,String id);
	List queryUser(int i,int pagesize);
	public int count();
}
