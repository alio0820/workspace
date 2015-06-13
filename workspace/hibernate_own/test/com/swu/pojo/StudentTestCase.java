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

public class StudentTestCase extends TestCase  //extends表示继承类，interfaces表示继承接口
{
	public void testCreate()
	{
		Configuration cfg = new Configuration().configure();
		SchemaExport export =new SchemaExport(cfg);       //创建数据库表
		export.create(true, true);                        
		//后面的参数有不同的含义，具体参考我的百度空间分享
		//第一个为True就是把DDL 语句输出到控制台，
		//第二个为True就是根据持久类和映射文件先执行删除再执行创建操作
	}
	public void testInsert()
	{
		Configuration cfg = new Configuration().configure();    //创建构造器
		SessionFactory sf = cfg.buildSessionFactory();          //创建会话工厂
		Session session = sf.openSession();                     //创建session
		session.beginTransaction();                             //开始事务
		TestStudent student =new TestStudent();
		student.setAge(20);
		student.setName("zcd");
		session.save(student);                                  //保存到session中
		session.getTransaction().commit();                      //提交事务		
	}
    public void testUpdate()
    {
    	Configuration cfg = new Configuration().configure();
    	SessionFactory sf = cfg.buildSessionFactory();
    	Session session = sf.openSession();
    	session.beginTransaction();
    	
    	TestStudent student = (TestStudent)session.load(TestStudent.class, 2);//对应到第二行
    	
    	student.setName("zhangsan");
    	session.getTransaction().commit();
    }
    public void testSelect(){
		Configuration cfg = new Configuration().configure();
		SessionFactory sf = cfg.buildSessionFactory();	
		Session session = sf.openSession();
		
		TestStudent student = (TestStudent)session.load(TestStudent.class, 2);
		
		System.out.println("姓名："+student.getName());
		System.out.println("年龄："+student.getAge());
		System.out.println("id:"+student.getId());   //为什么只有id在前面就优先输出呢
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
		//1. List list查询
		//条件查询，参数索引值从0开始，索引位置。
//		String hql = "select name from TestStudent s where s.name = ?";		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//		List list = query.list();                            
//    	System.out.println(list);
//    	System.out.println(list.get(0));
//    	System.out.println(list.size());
    	//=================================================================
    	
    	
    	//=================================================================
    	//2. 查询整个映射对象所有字段
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
    	//3. 查询单个字段，是否设置为String与TestStudent类有关
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
    	//4. 查询几个字段
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
//    	//5. 修改默认查询结果(query.list())不以Object[]数组形式返回，以List形式返回
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
    	//6. 修改默认查询结果(query.list())不以Object[]数组形式返回，以Map形式返回 
//		String hql = "select new map(name,age) from TestStudent s where s.name = ?";
		
		//如果将hql改为：String hql = " select new map(name as n,age as a) from TestStudent";
		//那么key将不是字符串0,1,2...了，而是"n","a"了
//		
//		Query query = session.createQuery(hql);
//		query.setParameter(0, "zcd");
//		List<Map> list5 = query.list();
//    	for(Map user :list5)
//    	{
//    		System.out.println((String)user.get("0"));   
//    		//get("0");是get(key),注意:0,1,2...是字符串，而不是整型
//    		System.out.println(user.get("1"));
//    	}
    	//=================================================================
    	
    	
    	//=================================================================
    	//7. 修改默认查询结果(query.list())不以Object[]数组形式返回，以Set形式返回,
    	//但是因为Set里是不允许有重复的元素，所以:name和age的值不能相同。
    	//只需将hql改为：String hql = " select new set(name,age) from TestStudent";
    	//=================================================================
    	
    	
//    	//=================================================================
//    	//8. 修改默认查询结果(query.list())不以Object[]数组形式返回，以自定义类型返回
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
    	//9. 条件查询，自定义索引名(参数名):na,:ag.通过setString,setParameter设置参数
//    	String hql = "from TestStudent s where s.name =:na";
//    	Query query = session.createQuery(hql);
//		query.setString("na", "zcd");   ////第1种方式
//		//query.setParameter("na", "zcd",Hibernate.STRING);//第2种方式,第3个参数确定类型
//		List<TestStudent> list8 = query.list();
//    	for(TestStudent user :list8)
//    	{
//    		System.out.println(user.getName());   
//    		System.out.println(user.getAge());
//    	}
    	//=================================================================
		
		//=================================================================
		//10. 条件查询,通过setProperties设置参数
    	String hql = "from TestStudent s where s.name =:name";
    	Query query = session.createQuery(hql);
		User users =new User("zcd");       //user类有一个属性必须和name对应
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
