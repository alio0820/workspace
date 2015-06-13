package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.PigeonholeLeader;
import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.PigeonholeLeaderServce;
import com.etc.OurProgram.util.Conn;


public class PigeonholeLeaderServceImpl implements PigeonholeLeaderServce{
	public List queryPigeonholeLeader(){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt = null;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT pigeonholeLeader FROM pigeonholeleader");
			List list = new ArrayList();
			while(rs.next()){
				PigeonholeLeader pl=new PigeonholeLeader();
				pl.setPigeonholeLeader(rs.getString("pigeonholeLeader"));
				list.add(pl);			
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
