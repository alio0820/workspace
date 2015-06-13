package com.zr.js.js.service.impl;
import com.zr.js.js.javabean.User;
import com.zr.js.js.service.AccountingService;
import com.zr.js.js.util.Conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AccountingServiceImpl implements AccountingService {

	public boolean accounting(String num, String name,String flag,String qq) {
		if(qq==null||num==null||name==null||flag==null)
			return false;   //为什么不加这句一直报错呢？
		Conn conn = new Conn();
		Connection connection =  conn.getConnection(null);
		PreparedStatement pstmt;
			try {
				
				if (qq.equals("1"))           
				{
				pstmt = connection.prepareStatement("SELECT * FROM userinfo WHERE id=? ");
				pstmt.setString(1, num);
				ResultSet rs0 = pstmt.executeQuery();
				if (rs0.next())
				{
					return false;
				}
				else
				{
					pstmt = connection.prepareStatement("insert into userinfo(id,flag,username) values(?,?,?)");
					pstmt.setString(1, num);
					pstmt.setString(2, flag);
					pstmt.setString(3, name);
					int rs = pstmt.executeUpdate();
						if (rs>0) {
							return true;
						}					
				}
				}
				else if(qq.equals("2"))         //修改
				{
				
					pstmt = connection.prepareStatement("SELECT * FROM userinfo WHERE id=?");
					pstmt.setString(1, num);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){					
						pstmt = connection.prepareStatement("update userinfo set username=?,flag=? where id=? ");
						pstmt.setString(1, name);
						pstmt.setString(2, flag);
						pstmt.setString(3,num);
						
						int rs = pstmt.executeUpdate();
							if (rs>0) {
								return true;
							}					
					}
				}
				else  if(qq.equals("3"))                           //删除
				{
					pstmt = connection.prepareStatement("SELECT * FROM userinfo WHERE id=?");
					pstmt.setString(1, num);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){
						pstmt = connection.prepareStatement("delete from userinfo where id=?");
						pstmt.setString(1, num);
						int rs = pstmt.executeUpdate();
							if (rs>0) 
							{
								return true;
							}					
					}				
				}
				else
					return false;
			   try 
			   {
					pstmt.close();
				} 
			   catch (SQLException e1) 
			   {
					e1.printStackTrace();
				}
			} 
			
			catch (SQLException e)
			{
				e.printStackTrace();
			} 
			finally 
			{
				try 
				{
					connection.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			return false;
		}
     
	public  List queryUser(int i,int pagesize) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT id,username,flag,score FROM userinfo order by id asc limit "+i+","+pagesize);
			List list = new ArrayList();
			while(rs.next()){
				User u = new User();
				u.setNum(rs.getString("id"));
				//u.setNum(rs.getString("num"));
				u.setName(rs.getString("username"));
				u.setFlag(rs.getString("flag"));
				u.setScore(rs.getString("score"));
				i++;
				list.add(u);
			}
			try 
			{
				pstmt.close();
			}
			catch (SQLException e1) 
			{
				e1.printStackTrace();
			}
			return list;
		} catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		finally
		{
			try 
			{
				connection.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		return null;
	}
	
    //查询总行数
    public int count() {
        int intRowCount = 0;//总行数
        Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;       
        try
        {            
        	pstmt = connection.prepareStatement("SELECT count(id) FROM userinfo");
			ResultSet rsq = pstmt.executeQuery();
            rsq.next();//游标指向第一行
            intRowCount=rsq.getInt(1);//取得总行数
            rsq.close() ;
            pstmt.close();
        }
        catch(Exception e)
        {
            System.out.println(e) ;
        }
        return intRowCount;
    }
}


