package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.UnitService;
import com.etc.OurProgram.util.Conn;

public class UnitServiceImpl implements UnitService{
	public List queryUnit(){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt = null;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT unitName FROM unit");
			List list = new ArrayList();
			while(rs.next()){
				Unit unit=new Unit();
				//unit.setId(rs.getInt("id"));
				unit.setUnitName(rs.getString("unitName"));
				list.add(unit);			
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
