package cn.edu.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.edu.util.DBConn;

public class ReNameDAO {

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void updateUserName(String name,String reName)
	{
		Connection conn = DBConn.getConn();
		
		String sql = "update UserInfo set userName = '"+reName+"' where userName = '"+name+"'";
		
		DBConn.ExecIUD(sql);
	}
}
