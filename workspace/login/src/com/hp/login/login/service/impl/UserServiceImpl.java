/**
 * 
 */
package com.hp.login.login.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hp.login.login.javabean.User;
import com.hp.login.login.service.UserService;
import com.hp.login.login.util.Conn;

/**
 * @author Administrator
 *
 */
public class UserServiceImpl implements UserService {

	/* (non-Javadoc)
	 * @see com.hp.login.login.service.UserService#queryUser()
	 */
	public List queryUser() {
		// TODO Auto-generated method stub
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM user");
			List list = new ArrayList();
			while(rs.next()){
				User u = new User();
				u.setId(String.valueOf(rs.getString("id")));
				u.setUserName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
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

}
