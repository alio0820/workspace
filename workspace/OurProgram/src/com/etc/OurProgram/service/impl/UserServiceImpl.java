package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.User;
import com.etc.OurProgram.service.UserService;
import com.etc.OurProgram.util.Conn;


public class UserServiceImpl implements UserService {

	public List queryUser() {
		// TODO Auto-generated method stub
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM login");
			List list = new ArrayList();
			while(rs.next()){
				User u = new User();

				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPower(rs.getString("power"));
				u.setDepartment(rs.getString("department"));
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
