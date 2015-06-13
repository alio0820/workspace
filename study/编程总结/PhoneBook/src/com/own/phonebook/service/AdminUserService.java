package com.own.phonebook.service;

import com.own.phonebook.dao.AdminUserDao;
import com.own.phonebook.entity.AdminUser;

public class AdminUserService {
	public AdminUserDao adminUserDao=new AdminUserDao();
	
	public AdminUser login(AdminUser adminUser){
		AdminUser getUser=adminUserDao.query(adminUser);
		return getUser;
		
	}
	
	public Boolean add(AdminUser adminUser){
		AdminUser aUser=adminUserDao.query(adminUser);
		if(aUser==null){
			adminUserDao.add(adminUser);
			return new Boolean(true);
		}else 
		return new Boolean(false);
		
	}
	public Boolean nameCheck(AdminUser adminUser){
		AdminUser aUser=adminUserDao.query(adminUser);
		if(aUser==null){
			return new Boolean(true);
		}else 
		return new Boolean(false);
	}
}
