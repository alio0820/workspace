package com.hp.login.login.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hp.login.login.service.RegisterService;
import com.hp.login.login.util.Conn;

public class RegisterServiceImpl implements RegisterService
{

	public boolean register(String username, String password)

	{
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;

		boolean flag = true;
		try
		{
			pstmt = connection
					.prepareStatement("SELECT * FROM user WHERE name=?");
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				String name = rs.getString("name");
				if (username.equals(name))
				{
					flag = false;
					return false;
				}
			}
			if (flag == true)
			{
				pstmt = connection
						.prepareStatement("insert into user(name,password) values ('"
								+ username + "' , '" + password + "')");
				pstmt.executeUpdate();

			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			try
			{
				pstmt.close();
				connection.close();
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		return flag;
	}
    public boolean nameCheck(String username)
    {
    	Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;

		try
		{
			pstmt = connection
					.prepareStatement("SELECT * FROM user WHERE name=?");
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			if (!rs.next())
			{
				return true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			try
			{
				pstmt.close();
				connection.close();
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		return false;
    }
}