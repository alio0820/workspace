package com.icss.oa.entity;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.icss.oa.utils.HibernateSessionFactory;

public class HibernateDemo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
//		HibernateDemo hd = new HibernateDemo();
//		hd.addUser();
		
//		addUser();
//		queryUser();
//		queryUser1();
//		getUserById();
//		deleteUser();
//		updateUser();
//		queryUserEvict();
		optimisticLock();
//		entityLifeCycle();

	}
	public static void addUser(){
//		HibernateSessionFactory hsf = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		
		User user = new User();
		user.setUsername("gaoqing");
		user.setPasswd("1234");
		session.save(user);
		
		t.commit();
		System.out.println("========���=====�����ύ�ɹ�============");
	}
	public static void queryUser(){
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		
		String hql = "from User";
		Query query = session.createQuery(hql);
		List users = query.list();
		System.out.println("users:"+users.size());
		for(int i=0;i<users.size();i++){
			User user = (User)users.get(i);
			System.out.println("user["+i+"]="+user.getUsername());
//			System.out.println("user["+i+']'+((User)users.get(i)).getUsername());
		}
		
		t.commit();
		System.out.println("========��ѯ=====�����ύ�ɹ�============");
	
	}
	public static void queryUser1(){
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		
		String hql = "select username,passwd from User";
		Query query = session.createQuery(hql);
		List users = query.list();
		System.out.println("users:"+users.size());
		for(int i=0;i<users.size();i++){
			Object [] objs = (Object[])users.get(i);
			System.out.println("username["+i+"]="+objs[0]);
			System.out.println("passwd["+i+"]="+objs[1]);
		}
		
		t.commit();
		System.out.println("========��ѯ=====�����ύ�ɹ�============");
	
	}
	//query��get��ʽ����idȡ��һ������
	public static void getUserById(){//queryUserByGetMethod
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		
		User user = (User) session.get(User.class, new Long(21));//�࣬����
		//�൱��select username from User where id=3;//ʵ��-����-����ģ����ڵģ���-class-�����
		System.out.println("username="+user.getUsername());
		
		t.commit();		
		System.out.println("========��ѯ=====�����ύ�ɹ�============");
	}
	public static void deleteUser(){
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		
		User user = (User)session.get(User.class, new Long(22));
		session.delete(user);
		
		t.commit();
		System.out.println("========ɾ��=====�����ύ�ɹ�============");
	}
	public static void updateUser(){
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		
		User user = (User)session.get(User.class, new Long(21));
		user.setUsername("liuyinyin");
		session.update(user);
		
		t.commit();
		System.out.println("========�޸�=====�����ύ�ɹ�============");
	}
	//evict ʵ��
	public static void queryUserEvict(){
		

		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		User  user = (User) session.get(User.class, new Long(181));	
		
		System.out.println("==username:==" + user.getUsername());		
		
		session.evict(user);//��һ��ʵ���ӻ�����ȥ��
		
		//���ӻ�����ȡ�ˣ��Ͳ����ٵ���sqlȥ�����ݿ���
		User  user1 = (User) session.get(User.class, new Long(181));

		System.out.println("==username111111111:==" + user1.getUsername());	
		
		
		t.commit();
		
		//return user;
	}
	//������ʾ��
	public static void pessimisticLockDemo(){
		
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		Query query = session.createQuery("from User user");

		query.setLockMode("user", LockMode.UPGRADE);
		
		List list = query.list();
		
		t.commit();
		
		
	}
	
	public static void optimisticLock(){
		
		try{
			
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 


		User user = (User) session.get(User.class,new Long(181));
	    		
		
		user.setUsername("google25");
	
		 try {
	         Thread.sleep(20000);//����

		 } catch (InterruptedException e) {
			 
			         e.printStackTrace();
		 }

		 
		 session.update(user);
		 
		 System.out.println("optimisticLock=======version");
	
		 
		 t.commit();

		 
		}catch(Exception e){
			
			e.printStackTrace();
		}
	}
	//��ʾʵ�����������
	public static void entityLifeCycle(){
		
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 

		User user = new User();
		
		user.setUsername("che300");
		
		session.save(user);//persistent
		
		System.out.println("studentname:"+user.getUsername());
		

		User user1 =(User) session.load(User.class,user.getId());
		
		user1.setUsername("che301");

//		session.update(user1);
		
//		session.delete(user1);
				
		t.commit();
		
	}

}
