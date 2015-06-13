package com.zr.js.js.service;

import java.util.List;

public interface PropertyService {
	boolean property(String str,String num, String name,String qq,String id,String id_forward);
	List queryUser(int i,int pagesize,String str,String id_forward);
	public int count(String str);
}
