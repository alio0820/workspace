package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.Teammates;
import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.TeammatesServce;
import com.etc.OurProgram.util.Conn;

public class TeammatesServceImpl implements TeammatesServce  {
	public List queryTeammates(){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt = null;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT teammatesName FROM teammates");
			
			List<Teammates> list = new ArrayList<Teammates>();
			while(rs.next()){
				Teammates mates=new Teammates();
				mates.setTeammatesName(rs.getString("teammatesName"));
			//	System.out.print(mates.getTeammatesName());
				list.add(mates);			
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
