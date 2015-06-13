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
		Transaction t = session.beginTransaction();//����һ������
		User user = new User();//transient object
		user.setUsername("gaoqqqqqqqqqqq");
		//setUserNameʱ�����ҵ����ԣ��Ӷ��õ���Ӧ�ı��ֶ�
		user.setPasswd("2333333333333");
		session.save(user);//persistent object---user
		//��saveuser��ʱ�������ҵ�����user.hbm.xml��Ķ���User���Ӷ��ҵ���Ӧ�ı�
		t.commit();
		System.out.println("============�����ύ�ɹ�========");
	}

	public static void pessimisticLoc(){
		
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		
		//ע�������һ��Ҫʹ��as
		
		//Query query = session.createQuery("select count(*) as c,studentname   from Student as student group by student.studentname");

		Query query = session.createQuery("from User as user");

		//������,�൱��for update,�����ݿ��й�
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
