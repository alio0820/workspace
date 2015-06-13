package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.ProjectID;
import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.ProjectIDServce;
import com.etc.OurProgram.util.Conn;

public class ProjectIDServceImpl implements ProjectIDServce{

	public List queryProjectID() {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt = null;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT projectID FROM projectID");
			List list = new ArrayList();
			while(rs.next()){
				ProjectID proID=new ProjectID();
				//unit.setId(rs.getInt("id"));
				proID.setProjectID(rs.getString("projectID"));			
				list.add(proID);			
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		

	return null;
	}

}
