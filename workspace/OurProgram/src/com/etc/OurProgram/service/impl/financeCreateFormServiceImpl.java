package com.etc.OurProgram.service.impl;

import java.sql.SQLException;

import com.etc.OurProgram.service.financeCreateFormService;
import com.etc.OurProgram.util.Conn;
import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;

public class financeCreateFormServiceImpl implements financeCreateFormService {

	public boolean createForm(int id) {
		// TODO Auto-generated method stub
		 Conn conn=new Conn();
		 Connection connection=conn.getConnection(null);
		String issubmit="issubmit";
		 try {
			
			PreparedStatement psmt=(PreparedStatement) connection.prepareStatement("update finance set isSubmit=? where id=?");
			psmt.setString(1, "已提交");
			psmt.setInt(2, id);
			int i=psmt.executeUpdate();
			if(i==1)
				return true;
			else
				return false;
		}  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
