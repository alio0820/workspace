package com.icss.oa.entity;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.icss.oa.utils.HibernateSessionFactory;

public class One2ManyDemo {

	
	public static void main(String[] args) {
//		addReader();
//		cascadeDelete();
		queryReader();
		
	}
	
	public static void addReader(){
		

		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		Reader reader = new Reader();
		
		reader.setReadername("che100");
		
		
		Book book1 = new Book();
		
		book1.setBookname("delphi");
		
//		book1.setStartdate(new Date());
		
		
		//����ע�Ϳ������Ч��,������Ҫ��inverse����true
		book1.setTReader(reader);
		
		
		
		Book book2 = new Book();
		
		book2.setBookname("design pattern");
		
//		book2.setStartdate(new Date());

		reader.getTBooks().add(book1);
		reader.getTBooks().add(book2);
		
		//����ע�Ϳ������Ч��,������Ҫ��inverse����true
		book2.setTReader(reader);

		session.save(reader);
		
		t.commit();
		
	}
	
	
	//lazyʵ������,����reader.hbm.xml������Ϊtrue����false,��̨��ӡ������ǲ�һ����.
	
	public static void queryReader(){
		
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		Query query  = session.createQuery("from Reader where readerid=57");
		
		List lists = query.list();
		
		Reader reader =(Reader) lists.get(0);
		
//		Set books = reader.getTBooks();
		
//		System.out.println("books:"+books.size());
		
		t.commit();
		
		
	}
	
	
	//����ɾ��ʾ��
	public static void cascadeDelete(){
		
		
		Session session = HibernateSessionFactory.getSession();
		
		Transaction t = session.beginTransaction(); 
		
		Query query  = session.createQuery("delete from Reader where readerid=553");
	
		int amount = query.executeUpdate();
		
		t.commit();
		
	}

}
