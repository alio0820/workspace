package com.service.impl;
import com.Accounting;
import com.chinasofti.util.HibernateSessionFactory;
import com.service.AccountingService;
import com.zr.js.js.util.Conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class AccountingServiceImpl implements AccountingService {

	public boolean accounting(String num, String name,String qq,String id) {
		if(qq==null||num==null||name==null)
			return false;                           //为什么不加这句一直报错呢？
		Conn conn = new Conn();
		Connection connection =  conn.getConnection(null);
		PreparedStatement pstmt;
		
			try {
				
				if (qq.equals("1"))           
				{
				pstmt = connection.prepareStatement("SELECT * FROM accounting WHERE name=?");
				pstmt.setString(1, name);
				ResultSet rs0 = pstmt.executeQuery();
				if ( rs0.next()){
					return false;
				}else
				{
					pstmt = connection.prepareStatement("insert into accounting(num,name) values(?,?)");
					pstmt.setString(1, num);
					pstmt.setString(2, name);
					int rs = pstmt.executeUpdate();
						if (rs>0) {
							return true;
						}					
				}
				}
				else if(qq.equals("2"))         //修改
				{
					pstmt = connection.prepareStatement("SELECT * FROM accounting WHERE name=?");
					pstmt.setString(1, name);
					ResultSet rs2 = pstmt.executeQuery();
					if ( rs2.next()){
						return false;
					}
					pstmt = connection.prepareStatement("SELECT * FROM accounting WHERE id=?");
					pstmt.setString(1, id);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){					
						pstmt = connection.prepareStatement("update accounting set num=? ,name=? where  id=? ");
						pstmt.setString(1, num);
						pstmt.setString(2,name);
						pstmt.setString(3,id);
						int rs = pstmt.executeUpdate();
							if (rs>0) {
								return true;
							}					
					}
				}
				else  if(qq.equals("3"))                           //删除
				{
					pstmt = connection.prepareStatement("SELECT * FROM accounting WHERE id=?");
					pstmt.setString(1, id);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){
					
					
						pstmt = connection.prepareStatement("delete from accounting where id=?");
						pstmt.setString(1, id);
						int rs = pstmt.executeUpdate();
							if (rs>0) {
								return true;
							}					
					}				
				}
				else
					return false;
			   try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} 
			
			catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return false;
		}
     
	public  List queryUser(int i,int pagesize) {
		Session session = com.chinasofti.pojo.HibernateSessionFactory.getSession();
		session.beginTransaction();
		try {
			
			String hql="SELECT * FROM Accounting";
			Query query = session.createQuery(hql);
			query.setFirstResult(i);
			query.setMaxResults(pagesize);
			List list=query.list();
			
			try {
				session.getTransaction().commit();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				session.getTransaction().commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
    //查询总行数
    public int count() {
        int intRowCount = 0;//总行数
        
        Session session = com.chinasofti.pojo.HibernateSessionFactory.getSession();
		session.beginTransaction();
           
        try
        {            
        	String hql="SELECT count(*) FROM Accounting";
        	Query query = session.createQuery(hql);
    		//query.executeUpdate();
        	
    		session.getTransaction().commit();
    		System.out.println(intRowCount);
    		
    		List list=query.list();
    		intRowCount=(Integer)list.get(0);
    		System.out.println(intRowCount);
        }
        catch(Exception e)
        {
            System.out.println(e) ;
        }
        return intRowCount;
    }
}


