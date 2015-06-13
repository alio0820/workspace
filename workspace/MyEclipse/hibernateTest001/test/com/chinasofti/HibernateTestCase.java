package com.chinasofti;

import java.util.List;

import junit.framework.TestCase;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.chinasofti.pojo.Student;

public class HibernateTestCase extends TestCase {
	
	public void testHibernateCreate(){
		
		Configuration con = new Configuration().configure();
		
		SchemaExport se = new SchemaExport(con);
		
		se.create(true, true);
		
		//SessionFactory sf = con.buildSessionFactory();		
		
	}
	
	public void testInsert(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();	
		Session session = sf.openSession();
		session.beginTransaction();
		Student student = new Student();
		student.setAge(30);
		student.setName("zhouqi");		
		session.save(student);
		session.getTransaction().commit();
	}
	
	public void testUpdate(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();	
		Session session = sf.openSession();
		session.beginTransaction();
		Student student = (Student)session.load(Student.class, 2);		
		student.setName("zhangsan");		
		session.getTransaction().commit();
		
	}
	
	public void testSelect(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();	
		Session session = sf.openSession();
		
		Student student = (Student)session.load(Student.class, 2);
		
		System.out.println(student.getId());
		System.out.println(student.getName());
		System.out.println(student.getAge());
		
	}
	
	public void testdelete(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();	
		Session session = sf.openSession();
		session.beginTransaction();
		Student student = (Student)session.load(Student.class, 2);
		
		session.delete(student);
		
		session.getTransaction().commit();
	}
	
	public void testQuery(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();	
		Session session = sf.openSession();
		String hql = "from Student s where s.name = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, "zhouqi");
		
		List list = query.list();
		System.out.println(list.size());
	}
	
}
