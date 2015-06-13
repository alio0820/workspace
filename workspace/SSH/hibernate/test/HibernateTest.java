import java.util.List;
import java.util.Set;

import junit.framework.TestCase;

import org.hibernate.Query;
import org.hibernate.Session;

import com.chinasofti.pojo.Student2;
import com.chinasofti.pojo.Teacher2;
import com.chinasofti.pojo.Teacherstudent;
import com.chinasofti.util.HibernateSessionFactory;


public class HibernateTest extends TestCase {
	
	public void testAdd(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Student2 s1 = new Student2();
		Student2 s2 = new Student2();
		s1.setStudentName("A");
		s2.setStudentName("B");
		
		Teacher2 t1 = new Teacher2();
		Teacher2 t2 = new Teacher2();
		t1.setTeacherName("a");
		t2.setTeacherName("b");
		
		Teacherstudent ts1 = new Teacherstudent();
		Teacherstudent ts2 = new Teacherstudent();
		Teacherstudent ts3 = new Teacherstudent();
		
		ts1.setStudent2(s1);
		ts1.setTeacher2(t1);
		
		ts2.setStudent2(s1);
		ts2.setTeacher2(t2);
		
		ts3.setStudent2(s2);
		ts3.setTeacher2(t2);
				
		session.save(t1);
		session.save(t2);
		
		session.save(s1);
		session.save(s2);
		
		session.save(ts1);
		session.save(ts2);
		session.save(ts3);
		
		session.getTransaction().commit();
	}
	
	public void testQuery(){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Teacher2 t where t.teacherName = ?";
		Query query = session.createQuery(hql);
		query.setString(0, "b");
	
		List<Teacher2> list = query.list();
		
		for(Teacher2 t : list){
			Set<Teacherstudent> set = t.getTeacherstudents();
			for(Teacherstudent ts: set){
				System.out.println(ts.getStudent2().getStudentName());
			}
			
		}
	}
	
	public void testQuery2(){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Student2 s where s.teacherstudents.teacher2.teacherName = ?";
		String hql2 ="select s.studentName,s.id from Student2 s inner join s.teacherstudents ts where ts.teacher2.teacherName = ?";
		
		Query query = session.createQuery(hql2);
		query.setString(0, "b");
	
		List<Object[]> list = query.list();
		
		for(Object[] o : list){
			
			System.out.println(o[1]);
		}
	}
	
	public void testQuery3(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String hql = "delete  from Teacherstudent";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	public void Update(){
		//这里输入的并不是数据库的查询语言，而是纯面向对象的
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String hql ="update from Teacherstudent set teacher2=2 where id=1";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	public void select(){
        Long intRowCount;//总行数
        
        Session session =HibernateSessionFactory.getSession();
		session.beginTransaction();        
        	String hql="SELECT count(*) FROM Accounting";
        	Query query = session.createQuery(hql);
    		//query.executeUpdate();        	
    		session.getTransaction().commit();
    		List list=query.list();
    		intRowCount=(Long)list.get(0);
    		System.out.println(intRowCount);
	}
	
}
