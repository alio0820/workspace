package com.chinasoft.service.impl;

import com.chinasoft.service.ILoginService;

public class LoginServiceImpl implements ILoginService {

	@Override
	public void doLogin() {
		System.out.println("���е�¼����");
		//throw new NullPointerException();

	}

	@Override
	public void doLogout() {
		System.out.println("����ע������");
		
	}

}
