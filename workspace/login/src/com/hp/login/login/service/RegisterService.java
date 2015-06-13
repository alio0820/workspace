package com.hp.login.login.service;

public interface RegisterService {
	public boolean register(String username,String password);
	public boolean nameCheck(String username);
}
