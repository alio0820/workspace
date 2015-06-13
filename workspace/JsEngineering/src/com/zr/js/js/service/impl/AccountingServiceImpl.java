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
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM accounting order by id asc limit "+i+","+pagesize);
			List list = new ArrayList();
			while(rs.next()){
				User u = new User();
				u.setId(String.valueOf(rs.getString("id")));
				u.setNum(rs.getString("num"));
				u.setName(rs.getString("name"));
				i++;
				list.add(u);
			}
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
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
        	pstmt = connection.prepareStatement("SELECT count(id) FROM accounting");
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


