package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.util.DBConn;

public class LoginDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public boolean checkLogin(String name,String pwd)
	{
		Connection conn = DBConn.getConn();
		String sql = "select * from UserInfo";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("userName").equalsIgnoreCase(name) && rs.getString("userPwd").equals(pwd))
				{
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
	
		return false;
	}
}
