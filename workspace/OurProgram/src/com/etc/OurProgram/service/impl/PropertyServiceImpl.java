package com.etc.OurProgram.service.impl;

import com.etc.OurProgram.javabean.User_propertySort;
import com.etc.OurProgram.service.PropertyService;
import com.etc.OurProgram.util.Conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PropertyServiceImpl implements PropertyService {

	public boolean property(String str,String num, String name,String qq,String id,String id_forward) {
		if(qq==null||num==null||name==null)
		return false;
		Conn conn = new Conn();
		Connection connection =  conn.getConnection(null);
		PreparedStatement pstmt;
		
			try {
				if(str.equals("1"))
				{
				if(qq.equals("1"))           //添加 
				{
				pstmt = connection.prepareStatement("SELECT * FROM property_next WHERE name=?");
				pstmt.setString(1, name);
				ResultSet rs0 = pstmt.executeQuery();
				if ( rs0.next()){
					return false;
				}else
				{
					pstmt = connection.prepareStatement("insert into property_next(num,name,id_forward) values(?,?,?)");
					pstmt.setString(1, num);
					pstmt.setString(2, name);
					pstmt.setString(3, id_forward);
					int rs = pstmt.executeUpdate();
						if (rs>0) {
							return true;
						}					
				}
				}
				else if(qq.equals("2"))         //修改
				{
					//我的这种判断方法有问题，可以修改使数据一样，
					pstmt = connection.prepareStatement("SELECT * FROM property_next WHERE name=?");
					pstmt.setString(1, name);
					ResultSet rs2 = pstmt.executeQuery();
					if ( rs2.next()){
						return false;
					}
					pstmt = connection.prepareStatement("SELECT * FROM property_next WHERE id=?");
					pstmt.setString(1, id);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){					
						pstmt = connection.prepareStatement("update property_next set num=? ,name=? where  id=? ");
						pstmt.setString(1, num);
						pstmt.setString(2,name);
						pstmt.setString(3,id);
						int rs = pstmt.executeUpdate();
							if (rs>0) {
								return true;
							}					
					}
				}
				else if (qq.equals("3"))                           //删除
				{
					pstmt = connection.prepareStatement("SELECT * FROM property_next WHERE id=?");
					pstmt.setString(1, id);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){
					
					
						pstmt = connection.prepareStatement("delete from property_next where id=?");
						pstmt.setString(1, id);
						int rs = pstmt.executeUpdate();
							if (rs>0) {
								return true;
							}					
					}				
				}
				else
					return false;
				}
				else
				{
					if(qq.equals("1"))           //添加 
					{
					pstmt = connection.prepareStatement("SELECT * FROM property WHERE name=?");
					pstmt.setString(1, name);
					ResultSet rs0 = pstmt.executeQuery();
					if ( rs0.next()){
						return false;
					}else
					{
						pstmt = connection.prepareStatement("insert into property(num,name) values(?,?)");
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
						pstmt = connection.prepareStatement("SELECT * FROM property WHERE name=?");
						pstmt.setString(1, name);
						ResultSet rs2 = pstmt.executeQuery();
						if ( rs2.next()){
							return false;
						}
						pstmt = connection.prepareStatement("SELECT * FROM property WHERE id=?");
						pstmt.setString(1, id);
						ResultSet rs0 = pstmt.executeQuery();
						if ( rs0.next()){					
							pstmt = connection.prepareStatement("update property set num=? ,name=? where  id=? ");
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
						pstmt = connection.prepareStatement("SELECT * FROM property WHERE id=?");
						pstmt.setString(1, id);
						ResultSet rs0 = pstmt.executeQuery();
						if ( rs0.next()){
						
						
							pstmt = connection.prepareStatement("delete from property where id=?");
							pstmt.setString(1, id);
							int rs = pstmt.executeUpdate();
							pstmt = connection.prepareStatement("delete from property_next where id_forward=?");
							pstmt.setString(1, id_forward);
							pstmt.executeUpdate();
								if (rs>0) {
									return true;
								}					
						}				
					}
					else
						return false;
				}
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
	
	public  List queryUser(int i,int pagesize,String str,String id_forward) {
		
		
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt;
		try {
			if(str.equals("1"))
			{
			    pstmt = connection.createStatement();
			    ResultSet rs = pstmt.executeQuery("SELECT * FROM property_next where id_forward="+id_forward+" order by id asc limit "+i+","+pagesize);
			    List list = new ArrayList();
			    while(rs.next()){
				   User_propertySort u = new User_propertySort();
				   u.setId(String.valueOf(rs.getString("id")));
				   u.setNum(rs.getString("num"));
				   u.setName(rs.getString("name"));
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
		     }
			else
			{
				pstmt = connection.createStatement();
			    ResultSet rs = pstmt.executeQuery("SELECT * FROM property order by id asc limit "+i+","+pagesize);
			    List list = new ArrayList();
			    while(rs.next()){
				   User_propertySort u = new User_propertySort();
				   u.setId(String.valueOf(rs.getString("id")));
				   u.setNum(rs.getString("num"));
				   u.setName(rs.getString("name"));
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
			}
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
	public int count(String str) {
        int intRowCount = 0;//总行数
        Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;       
        try
        {   if(str.equals("1"))
           {
        	pstmt = connection.prepareStatement("SELECT count(id) FROM property_next ");
			ResultSet rsq = pstmt.executeQuery();
            rsq.next();//游标指向第一行
            intRowCount=rsq.getInt(1);//取得总行数
            rsq.close() ;
            pstmt.close();
           }
          else
          {
        	  pstmt = connection.prepareStatement("SELECT count(id) FROM property ");
  			  ResultSet rsq = pstmt.executeQuery();
              rsq.next();//游标指向第一行
              intRowCount=rsq.getInt(1);//取得总行数
              rsq.close() ;
              pstmt.close();
          }
        }
        catch(Exception e)
        {
            System.out.println(e) ;
        }
        return intRowCount;
    }

}
