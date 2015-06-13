package com.chinasoft.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.dto.User;

public class UserDaoImpl extends HibernateDaoSupport implements IUserDao {
	
	public void addUser(User user) {
		System.out.println("dao: add User");
		Session session = this.getSessionFactory().openSession();
	
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}

	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

	public List<User> listUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub

	}

	public boolean userLogin(User user) {
		// TODO Auto-generated method stub
		return false;
	}

}
