package com.etc.OurProgram.service.impl;

import java.sql.SQLException;

import com.etc.OurProgram.service.financeDeleteService;
import com.etc.OurProgram.util.Conn;
import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import freemarker.template.utility.Execute;

public class financeDeleteServiceImpl implements financeDeleteService {

	public boolean delete(int id) {
		Conn conn=new Conn();
		try {
			Connection connection=conn.getConnection(null);
			PreparedStatement pst=(PreparedStatement) connection.prepareStatement("delete  from finance where id=?");
			pst.setInt(1,id);
			int i=pst.executeUpdate();
			if(i==1)
				return true;
			else
				return false;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

}
