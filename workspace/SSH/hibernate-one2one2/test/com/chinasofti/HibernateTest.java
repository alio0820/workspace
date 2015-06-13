package com.chinasofti;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;



import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.chinasofti.pojo.Student;
import com.chinasofti.pojo.Teacher;
import com.chinasofti.util.HibernateSessionFactory;

public class HibernateTest extends TestCase {
	public void CreateTable(){
		Configuration con = new Configuration().configure();
		SchemaExport se = new SchemaExport(con);
		se.create(true, true);
	}
	
	public void add(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Teacher t = new Teacher();
		Student s = new Student();
		s.setStudentName("zhangsan");
		Set<Teacher> set = new HashSet<Teacher>();
		set.add(t);
		s.setTeacher(set);
		
		t.setTeacherName("zhouqi");
		t.setStudent(s);	
		
		session.save(s);
		session.save(t);
		
		
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
	public void deleteStudent(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		Student s = (Student)session.get(Student.class,3);
		session.delete(s);
		Set set=s.getTeacher();
		for (Object o:set)       //加强的for循环
		{
		    Teacher t= (Teacher)o;
		    session.delete(t);
		}
//		Iterator it = set.iterator();
//		while(it.hasNext()){
//			it.next();
//			session.delete(it);
//		}		
		session.getTransaction().commit();
	}
	public void deleteTeacher(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Teacher t=(Teacher)session.get(Teacher.class,4);
		session.delete(t);
		session.getTransaction().commit();
	}
	public void updateStudent(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Student s = (Student)session.get(Student.class,4);
		s.setStudentName("zqs");
		session.save(s);	
		session.getTransaction().commit();
	}
	public void updateTeacher(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Teacher t = (Teacher)session.get(Teacher.class,4);
		t.setTeacherName("zh");
		session.save(t);	
		session.getTransaction().commit();
	}
	public void Query(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		Student s = (Student)session.get(Student.class,4);
		
		Set set=s.getTeacher();
		for (Object o:set)       //加强的for循环
		{
		    Teacher t= (Teacher)o;
		    System.out.println("老师名："+t.getTeacherName());
		}
		System.out.println("学生名："+s.getStudentName());
	}
}
