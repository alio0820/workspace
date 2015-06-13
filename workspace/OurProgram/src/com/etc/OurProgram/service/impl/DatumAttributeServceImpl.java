package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.DatumAttribute;
import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.DatumAttributeServce;
import com.etc.OurProgram.util.Conn;


public class DatumAttributeServceImpl implements DatumAttributeServce{
	public List queryDatumAttribute(){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt = null;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT datumAttribute FROM datumattribute");
			List list = new ArrayList();
			while(rs.next()){
				DatumAttribute da=new DatumAttribute();
				da.setDatumAttribute(rs.getString("datumAttribute"));			
				list.add(da);			
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
