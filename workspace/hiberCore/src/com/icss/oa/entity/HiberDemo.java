package com.icss.oa.entity;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.icss.oa.utils.HibernateSessionFactory;

public class HiberDemo {



	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
//		addUser();
		optimisticLock();

	}
	public static void addUser(){
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();//启动一个事务
		User user = new User();//transient object
		user.setUsername("gaoqqqqqqqqqqq");
		//setUserName时，先找到属性，从而得到相应的表字段
		user.setPasswd("2333333333333");
		session.save(user);//persistent object---user
		//在saveuser的时候，首先找到的是user.hbm.xml里的对象User，从而找到对应的表
		t.commit();
		System.out.println("============事务提交成功========");
	}

	public static void pessimisticLoc(){
		
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		
		//注意起别名一定要使用as
		
		//Query query = session.createQuery("select count(*) as c,studentname   from Student as student group by student.studentname");

		Query query = session.createQuery("from User as user");

		//更新锁,相当于for update,与数据库有关
		query.setLockMode("user", LockMode.UPGRADE);
		
		List list = query.list();
		

		/*
		Object [] obj = (Object[])list.get(0);
		
		System.out.println(obj[0]);
		
		System.out.println(obj[1]);*/
		
		
		t.commit();
		
		
	}
	
	public static void optimisticLock(){
		
		try{
			
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 

		User user = (User) session.get(User.class,new Long(181));
	    
		user.setUsername("google26");
		
		System.out.println("optimisticLock=============demo11");

		session.update(user);
		
		
		System.out.println("optimisticLock=============demo12");
		
		t.commit();
		
		}catch(Exception e){
			
			e.printStackTrace();
		}
	}
	

}
