package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.etc.OurProgram.service.AddService;
import com.etc.OurProgram.util.Conn;

public class AddServiceImpl implements AddService {

	public boolean add(String username, String password, String power,
			String department) {
		// TODO Auto-generated method stub
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		
		
		try {
		pstmt = connection.prepareStatement("insert into login (username,password,power,department) values(?,?,?,?)");
			
		    pstmt.setString(1,username);
			pstmt.setString(2,password);
			pstmt.setString(3,power);
			pstmt.setString(4,department);
			
			int i = pstmt.executeUpdate();
			if(i>0){
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
