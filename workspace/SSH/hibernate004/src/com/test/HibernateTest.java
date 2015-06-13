package com.test;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import junit.framework.TestCase;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.HibernateSessionFactory;
import com.domain.Student;
import com.domain.Teacher;

public class HibernateTest extends TestCase {
	public void testCreateTable(){
		Configuration con = HibernateSessionFactory.getConfiguration();
		SchemaExport se = new SchemaExport(con);
		se.create(true, true);
	}
	
	public void testAddTeacher(){
		Session session = HibernateSessionFactory.getSession();
			 
		session.beginTransaction();		
		Teacher teacher = new Teacher();
		teacher.setTeacherName("zhouqi");	
		session.save(teacher);
		session.getTransaction().commit();
	}
	
	public void testAddStudent(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Student student = new Student();
		student.setStudentName("zhangsan");
		session.save(student);
		session.getTransaction().commit();
	}
	
	public void testAddTeacherAndStudent(){
		Session session = HibernateSessionFactory.getSession();
		Student student = new Student();
		student.setStudentName("lisi");
		Teacher teacher = new Teacher();
		teacher.setTeacherName("zhou");
		//---------------
		//Set set1 = new HashSet();
		//set1.add(student);		
		//teacher.setStudent(set1);
		
		//------------------
		Set set = new HashSet();
		set.add(teacher);		
		student.setTeacher(set);		
		
		//--------------------------------
		session.beginTransaction();			
		session.save(student);	
		session.save(teacher);	
		
		session.getTransaction().commit();
	}
	
	public void testAddStudentByTeacher(){
		Session session = HibernateSessionFactory.getSession();
		Student student = new Student();
		student.setStudentName("zhangsan");
		Teacher teacher = (Teacher)session.get(Teacher.class, 1);
		Set<Teacher> set = new HashSet();
		set.add(teacher);
		student.setTeacher(set);
		session.beginTransaction();			
		session.save(student);
		session.getTransaction().commit();
		
	}
	
	public void testSearch(){
		Session session = HibernateSessionFactory.getSession();
		List<Student> list =  session.createCriteria(Student.class).setMaxResults(20).setFirstResult(1).list();
		for(Student s : list){
			Set<Teacher> set = s.getTeacher();
			System.out.println(s.getStudentName());
			System.out.println("他的老师有:");
			for(Teacher t : set){
				System.out.println(t.getTeacherName());
			}
		}
	}
	
	public void testSearchvByHql(){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Student s inner join s.teacher t where t.teacherName = :aa");
		//query.setString("aa", "zhangsan");
		query.setParameter("aa",  "zhou");
		List<Object[]> list = query.list();
		for(Object[] o : list){
			Set<Teacher> set = ((Student)o[0]).getTeacher();
			System.out.println(((Student)o[0]).getStudentName());
			System.out.println("他的老师有:");
			for(Teacher t : set){
				System.out.println(t.getTeacherName());
			}
		}
		
	}
	
	public void testSearchvByHql1(){
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Teacher t where t.student.studentName = :aa");
		//query.setString("aa", "zhangsan");
		query.setParameter("aa",  "zhangsan");
		List<Object[]> list = query.list();
		for(Object[] o : list){
			Set<Teacher> set = ((Student)o[0]).getTeacher();
			System.out.println(((Student)o[0]).getStudentName());
			System.out.println("他的老师有:");
			for(Teacher t : set){
				System.out.println(t.getTeacherName());
			}
		}
	}
	
}
