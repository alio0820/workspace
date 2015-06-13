package com.chinasoft.service.impl;

import com.chinasoft.service.ILoginService;

public class LoginServiceImpl1 implements ILoginService {

	@Override
	public void doLogin() {
		System.out.println("进行登录处理");

	}

	@Override
	public void doLogout() {
		System.out.println("进行注销处理");
		
	}

}
