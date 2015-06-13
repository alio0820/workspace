package com.chinasofti;

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
		s.setTeacher(t);
		t.setTeacherName("zhouqi");
		t.setStudent(s);
		session.save(s);
		session.save(t);
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
	public void deleteStudent(){
		//删除的时候要分顺序，teacher指向student,所以先删除teacher
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		Student s = (Student)session.get(Student.class,1);
		
		Teacher t=s.getTeacher();
        session.delete(t);
        session.delete(s);
		session.getTransaction().commit();
	}
	public void updateStudent(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Student s = (Student)session.get(Student.class,1);
		s.setStudentName("zqs");
		session.save(s);	
		session.getTransaction().commit();
	}
	public void updateTeacher(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Teacher t = (Teacher)session.get(Teacher.class,1);
		t.setTeacherName("zh");
		session.save(t);	
		session.getTransaction().commit();
	}
	public void Query(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		Student s = (Student)session.get(Student.class,1);
		
		Teacher t=s.getTeacher();
		
		System.out.println("老师名："+t.getTeacherName());
		System.out.println("学生名："+s.getStudentName());
	}
	
}
