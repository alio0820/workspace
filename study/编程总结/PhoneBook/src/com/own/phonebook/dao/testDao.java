package com.own.phonebook.dao;

import com.own.phonebook.entity.AdminUser;
import com.own.phonebook.service.AdminUserService;

public class testDao {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		AdminUser adminUser=new AdminUser();
		adminUser.setName("刘水");
		adminUser.setPassword("12345");
//		AdminUserDao aud=new AdminUserDao();
//		aud.add(adminUser);
		AdminUserService aus=new AdminUserService();
		System.out.print(aus.add(adminUser));
	}

}
