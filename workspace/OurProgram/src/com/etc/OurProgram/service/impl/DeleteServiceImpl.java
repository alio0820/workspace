package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.etc.OurProgram.service.DeleteService;
import com.etc.OurProgram.util.Conn;

public class DeleteServiceImpl implements DeleteService {

	public boolean delete(String username) {
		// TODO Auto-generated method stub
		
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		try {
		pstmt = connection.prepareStatement("delete from login where username=?");
			
			pstmt.setString(1,username);
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
