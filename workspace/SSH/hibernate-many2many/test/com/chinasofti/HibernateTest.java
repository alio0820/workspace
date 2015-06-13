package com.chinasofti;

import java.util.HashSet;
import java.util.Set;

import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.chinasofti.pojo.Student;
import com.chinasofti.pojo.Teacher;
import com.chinasofti.util.HibernateSessionFactory;

public class HibernateTest extends TestCase {
	public void testCreateTable(){
		Configuration con = new Configuration().configure();
		SchemaExport se = new SchemaExport(con);
		se.create(true, true);
	}
	
	public void testAdd(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Teacher t = new Teacher();
		Student s = new Student();
		s.setStudentName("zhangsan");
		Set<Teacher> set = new HashSet<Teacher>();
		set.add(t);		
		s.setTeacher(set);
		
		t.setTeacherName("zhouqi");
		
		session.save(s);
		session.save(t);
			
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
	public void deleteStudent(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Student s = (Student)session.get(Student.class,3);
		Set<Teacher> t= s.getTeacher();
		for(Teacher tt:t)
		{	
			tt.getStudent().remove(s);
		}
		session.delete(s);
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
	public void deleteTeacher(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Teacher t = (Teacher)session.get(Teacher.class,3);
		Set<Student> s= t.getStudent();
		for(Student ss:s)
		{	
			//session.delete();
			ss.getTeacher().remove(t);
		}
		session.delete(t);
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
	public void Query(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Student s = (Student)session.get(Student.class,3);
		Set<Teacher> t= s.getTeacher();
		for(Teacher tt:t)
		{	
			System.out.println("老师名："+tt.getTeacherName());
		}
		System.out.println("学生名:"+s.getStudentName());
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
	public void Update(){
		
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Student s = (Student)session.get(Student.class,3);
		Set<Teacher> t= s.getTeacher();
		//添加一个变量i,通过i的自增逐个修改每个Teacher中的值
		for(Teacher tt:t)
		{
			tt.setTeacherName("zhou");
		}
		s.setStudentName("lisi");
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();
	}
}
