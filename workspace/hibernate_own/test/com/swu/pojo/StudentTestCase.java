package com.swu.pojo;

import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import junit.framework.TestCase;

public class StudentTestCase extends TestCase  //extends��ʾ�̳��࣬interfaces��ʾ�̳нӿ�
{
	public void testCreate()
	{
		Configuration cfg = new Configuration().configure();
		SchemaExport export =new SchemaExport(cfg);       //�������ݿ��
		export.create(true, true);                        
		//����Ĳ����в�ͬ�ĺ��壬����ο��ҵİٶȿռ����
		//��һ��ΪTrue���ǰ�DDL ������������̨��
		//�ڶ���ΪTrue���Ǹ��ݳ־����ӳ���ļ���ִ��ɾ����ִ�д�������
	}
	public void testInsert()
	{
		Configuration cfg = new Configuration().configure();    //����������
		SessionFactory sf = cfg.buildSessionFactory();          //�����Ự����
		Session session = sf.openSession();                     //����session
		session.beginTransaction();                             //��ʼ����
		TestStudent student =new TestStudent();
		student.setAge(20);
		student.setName("zcd");
		session.save(student);                                  //���浽session��
		session.getTransaction().commit();                      //�ύ����		
	}
    public void testUpdate()
    {
    	Configuration cfg = new Configuration().configure();
    	SessionFactory sf = cfg.buildSessionFactory();
    	Session session = sf.openSession();
    	session.beginTransaction();
    	
    	TestStudent student = (TestStudent)session.load(TestStudent.class, 2);//��Ӧ���ڶ���
    	
    	student.setName("zhangsan");
    	session.getTransaction().commit();
    }
    public void testSelect(){
		Configuration cfg = new Configuration().configure();
		SessionFactory sf = cfg.buildSessionFactory();	
		Session session = sf.openSession();
		
		TestStudent student = (TestStudent)session.load(TestStudent.class, 2);
		
		System.out.println("������"+student.getName());
		System.out.println("���䣺"+student.getAge());
		System.out.println("id:"+student.getId());   //Ϊʲôֻ��id��ǰ������������
	}
    public void testdelete(){
		Configuration con = new Configuration().configure();
		SessionFactory sf = con.buildSessionFactory();	
		Session session = sf.openSession();
		session.beginTransaction();
		TestStudent student = (TestStudent)session.load(TestStudent.class, 2);		
		session.delete(student);		
		session.getTransaction().commit();
	}
    public void testQuery()
    {
    	Configuration cfg = new Configuration().configure();
		SessionFactory sf = cfg.buildSessionFactory();	
		Session session = sf.openSession();

		//=================================================================
		//1. List list��ѯ
		//������ѯ����������ֵ��0��ʼ������λ�á�
//		String hql = "select name from TestStudent s where s.name = ?";		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//		List list = query.list();                            
//    	System.out.println(list);
//    	System.out.println(list.get(0));
//    	System.out.println(list.size());
    	//=================================================================
    	
    	
    	//=================================================================
    	//2. ��ѯ����ӳ����������ֶ�
//		String hql = "from TestStudent s where s.name = ?";		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//    	List<TestStudent> list1 = query.list();              
//    	for(TestStudent str :list1)
//    	{
//    		System.out.println(str.getId());
//    		System.out.println(str.getName());
//    		System.out.println(str.getAge());
//    	}
    	//=================================================================
    	
    	
    	//=================================================================
    	//3. ��ѯ�����ֶΣ��Ƿ�����ΪString��TestStudent���й�
//		String hql = "select name from TestStudent s where s.name = ?";		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//    	List<String> list2 = query.list();
//    	for(String str :list2)
//    	{
//    		System.out.println(str);
//    	}
    	//=================================================================
    	
    	
    	//=================================================================
    	//4. ��ѯ�����ֶ�
//		String hql = "select age,id from TestStudent s where s.name = ?";		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//    	List<Object[]> list3 = query.list();
//    	for(Object[] object :list3)
//    	{
//    		System.out.println(object[0]);
//    		System.out.println(object[1]);
//
//    	}
    	//=================================================================
		
//		//=================================================================
//    	//5. �޸�Ĭ�ϲ�ѯ���(query.list())����Object[]������ʽ���أ���List��ʽ����
//		String hql = "select new list(name,age) from TestStudent s where s.name = ?";		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//		List<List> list4 = query.list();
//    	for(List user :list4)
//    	{
//    		System.out.println(user.get(0));
//    		System.out.println(user.get(1));
//    	}
//    	//=================================================================
		
		//=================================================================
    	//6. �޸�Ĭ�ϲ�ѯ���(query.list())����Object[]������ʽ���أ���Map��ʽ���� 
//		String hql = "select new map(name,age) from TestStudent s where s.name = ?";
		
		//�����hql��Ϊ��String hql = " select new map(name as n,age as a) from TestStudent";
		//��ôkey�������ַ���0,1,2...�ˣ�����"n","a"��
//		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//		List<Map> list5 = query.list();
//    	for(Map user :list5)
//    	{
//    		System.out.println((String)user.get("0"));   
//    		//get("0");��get(key),ע��:0,1,2...���ַ���������������
//    		System.out.println(user.get("1"));
//    	}
    	//=================================================================
    	
    	
    	//=================================================================
    	//7. �޸�Ĭ�ϲ�ѯ���(query.list())����Object[]������ʽ���أ���Set��ʽ����,
    	//������ΪSet���ǲ��������ظ���Ԫ�أ�����:name��age��ֵ������ͬ��
    	//ֻ�轫hql��Ϊ��String hql = " select new set(name,age) from TestStudent";
    	//=================================================================
    	
    	
//    	//=================================================================
//    	//8. �޸�Ĭ�ϲ�ѯ���(query.list())����Object[]������ʽ���أ����Զ������ͷ���
//    	String hql = "select new com.swu.pojo.User(name,age) from TestStudent s where s.name = ?";
//    	Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//		List<User> list7 = query.list();
//    	for(User user :list7)
//    	{
//    		System.out.println(user.getName());   
//    		System.out.println(user.getAge());
//    	}
//    	//=================================================================
		
    	//=================================================================
    	//9. ������ѯ���Զ���������(������):na,:ag.ͨ��setString,setParameter���ò���
//    	String hql = "from TestStudent s where s.name =:na";
//    	Query query = session.createQuery(hql);
//		query.setString("na", "zcd");   ////��1�ַ�ʽ
//		//query.setParameter("na", "zcd",Hibernate.STRING);//��2�ַ�ʽ,��3������ȷ������
//		List<TestStudent> list8 = query.list();
//    	for(TestStudent user :list8)
//    	{
//    		System.out.println(user.getName());   
//    		System.out.println(user.getAge());
//    	}
    	//=================================================================
		
		//=================================================================
		//10. ������ѯ,ͨ��setProperties���ò���
    	String hql = "from TestStudent s where s.name =:name";
    	Query query = session.createQuery(hql);
		User users =new User("zcd");       //user����һ�����Ա����name��Ӧ
		query.setProperties(users);
		List<TestStudent> list9 = query.list();
    	for(TestStudent user :list9)
    	{
    		System.out.println(user.getName());   
    		System.out.println(user.getAge());
    	}
    	//=================================================================
    }
    
}
