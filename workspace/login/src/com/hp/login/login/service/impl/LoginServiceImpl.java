package com.hp.login.login.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.hp.login.login.service.LoginService;
import com.hp.login.login.util.Conn;

public class LoginServiceImpl implements LoginService {

	public boolean login(String username, String password) {
		
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement("SELECT * FROM user WHERE name='"+username+"' and password = "+password+"");
//			pstmt.setString(1, username);
//			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if ( rs.next()){
//				String pw = rs.getString("password");
//				if ( password.equals(pw) ) {
//					return true;
//				}else{
//					return false;
//				}
				return true;
			}
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
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
		return false;
	}

}
