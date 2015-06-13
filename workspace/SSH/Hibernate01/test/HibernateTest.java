import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.chinasofti.pojo.Person;
import com.chinasofti.pojo.Student;
import com.chinasofti.pojo.StudentId;


public class HibernateTest extends TestCase {
	
	
	public void testCreateTable(){
		Configuration con = new Configuration().configure();
		SchemaExport se = new SchemaExport(con);
		se.create(true, true);
		
	}
	
	public void testInsert(){
		//person类的添加
		//--------------------------------------------------------
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Person p = new Person();
		p.setAge(30);
		p.setName("zhouqi");
		session.save(p);
		session.getTransaction().commit();		
		//--------------------------------------------------------
		//student类的添加
		/*Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Student s = new Student();
		StudentId id = new StudentId();
		id.setName("zhouqi");
		id.setPassWord("1234");
		s.setId(id);
		s.setAge(30);
		session.save(s);	
		session.getTransaction().commit();	*/
		
	}
	
	public void testQuery(){ 
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		Person p = (Person)session.get(Person.class, 1);
		System.out.println("-------------");
		System.out.println(p.getAge());
		System.out.println(p.getName());
		//student 类的查询
		//--------------------------------------------------------
		/*Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		StudentId id = new StudentId();
		id.setName("zhouqi");
		id.setPassWord("1234");
		Student p = (Student)session.get(Student.class, id);
		System.out.println("-------------");
		System.out.println(p.getAge());*/
		//--------------------------------------------------------
		
	}
	public void testDelete(){
		//person类的删除
		//--------------------------------------------------------
		/*Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Person p = (Person)session.get(Person.class, 1);
		session.delete(p);
		session.getTransaction().commit();*/	
		//--------------------------------------------------------
		//student类的删除
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		StudentId id = new StudentId();
		id.setName("zhouqi");
		id.setPassWord("1234");
		Student p = (Student)session.get(Student.class,id);
		session.delete(p);
		session.getTransaction().commit();
	}
	public void testUpdate(){
		//person类的更新
		//--------------------------------------------------------
		/*Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Person p = (Person)session.load(Person.class, 1);
		p.setAge(15);
		p.setName("fdf");
		session.save(p);
		session.getTransaction().commit();*/
		//--------------------------------------------------------
		//student类的更新
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		StudentId id = new StudentId();
		id.setName("zhouqi");
		id.setPassWord("1234");
		Student s = (Student)session.get(Student.class,id);
		s.setAge(15);
		session.save(s);	
		session.getTransaction().commit();
	}
}
