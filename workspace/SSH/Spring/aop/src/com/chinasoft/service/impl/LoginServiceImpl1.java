package com.chinasoft.service.impl;

import com.chinasoft.service.ILoginService;

public class LoginServiceImpl1 implements ILoginService {

	@Override
	public void doLogin() {
		System.out.println("���е�¼����");

	}

	@Override
	public void doLogout() {
		System.out.println("����ע������");
		
	}

}
