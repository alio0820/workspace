package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.etc.OurProgram.service.LoginService;
import com.etc.OurProgram.util.Conn;

public class LoginServiceImpl implements LoginService {

	public boolean login(String username, String password, String power, String department) {
		// TODO Auto-generated method stub 
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement("select * from login where username='"+username+"'");
			//'" +username+"'
		    //pstmt.setString(1,username);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				String pw = rs.getString("password");
				String pw2 = rs.getString("power");
				String pw3 =rs.getString("department");
				
				System.out.println(pw3);
				
				if (password.equals(pw) ) {
					if(power.equals(pw2)){
						if(department.equals(pw3)){
							return true;	
						}
					}
				}else{
					return false;
				}
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
