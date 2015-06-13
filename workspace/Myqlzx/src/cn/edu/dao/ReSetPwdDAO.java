package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.util.DBConn;

public class ReSetPwdDAO {

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	/**
	 * 
	 * 检查旧密码是否正确
	 * @param name
	 * @param pwd
	 * @return
	 */
	public boolean checkPwd(String name ,String pwd)
	{
		Connection conn = DBConn.getConn();
		String sql = "select userPwd from UserInfo where userName = '"+name+"'";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getString("userPwd").equals(pwd))
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
	
	/**
	 * 
	 * 更改密码的操作
	 * @param name
	 * @param pwd
	 */
	public void updatePwd(String name,String newPwd)
	{
		String sql = "update userInfo set userPwd = "+newPwd+" where userName = '"+name+"'";
		
		DBConn.ExecIUD(sql);
	}
}
