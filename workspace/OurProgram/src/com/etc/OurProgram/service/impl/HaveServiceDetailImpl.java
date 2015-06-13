package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.HaveUserDetail;
import com.etc.OurProgram.service.HaveServiceDetail;
import com.etc.OurProgram.util.Conn;

public class HaveServiceDetailImpl implements HaveServiceDetail{
	public List queryUserDetail(String projectName) {
		// TODO Auto-generated method stub
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
	//	System.out.println(projectName);   //���ڲ��鴫ֵ�Ƿ�ɹ�
		try {
			pstmt = connection.prepareStatement("SELECT * FROM projectdatum WHERE projectName='"+projectName+"'");
			ResultSet rs = pstmt.executeQuery();
			List list = new ArrayList();
			while(rs.next()){
				HaveUserDetail u = new HaveUserDetail();
                u.setDatumName(rs.getString("datumName"));
                u.setDatumSetupDate(rs.getString("datumSetupDate"));
                u.setDatumAttribute(rs.getString("datumAttribute"));
				list.add(u);
			}
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
