package test;

import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.chinasoft.domain.Person;
import com.chinasoft.domain.Student;
import com.chinasoft.domain.StudentId;

public class HibernateTest extends TestCase {
	public void testCreateTable(){
		Configuration con = new Configuration().configure();
		SchemaExport se = new SchemaExport(con);
		se.create(true, true);

	}
	
	public void testAdd(){
		Configuration con = new Configuration().configure();		
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();		
		session.beginTransaction();
		Person p = new Person();
		p.setAge(29);
		p.setUserName("zhouqi");
		session.save(p);
		System.out.println("---------");
		Student s = new Student();
		StudentId id = new StudentId();
		id.setFristName("zhou");
		id.setLastName("qi");
		s.setId(id);
		s.setAge(29);
		session.save(s);
		session.getTransaction().commit();
	}
	
	public void testRemove(){
		Configuration con = new Configuration().configure();		
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();		
		session.beginTransaction();
		Person p = new Person();
		p.setId(1);
	
		System.out.println("---------");
		
		
		session.delete(p);
		session.getTransaction().commit();
	}
	
	public void testUpdate(){
		Configuration con = new Configuration().configure();		
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();		
		
		session.beginTransaction();
		Person p = new Person();
		p.setId(1);
		p.setAge(30);

		System.out.println("---------");
		
		
		session.update(p);
		session.getTransaction().commit();
	}
	
	public void testSearch(){
		Configuration con = new Configuration().configure();		
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();		
		session.beginTransaction();
		Person p = (Person)session.get(Person.class, 1);
		System.out.println(p.getId());
		p.setUserName("wangwu");
		session.update(p);
		session.getTransaction().commit();
		//System.out.println(p);
		//System.out.println(p.getUserName());
	}
	
}
