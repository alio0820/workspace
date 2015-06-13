package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.HaveUser;
import com.etc.OurProgram.service.HaveService;
import com.etc.OurProgram.util.Conn;

public class HaveServiceImpl implements HaveService{
	public List queryUser() {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement("SELECT * FROM project WHERE stutas='已完成'");
			ResultSet rs = pstmt.executeQuery("SELECT * FROM project WHERE stutas='已完成'");
			List list = new ArrayList();
			while(rs.next()){
				HaveUser u = new HaveUser();
				u.setProjectID(rs.getString("projectID"));
				u.setProjectName(rs.getString("projectName"));
				u.setPigeonholeLeader(rs.getString("pigeonholeLeader"));
				u.setAuditingAttitude(rs.getString("auditingAttitude"));
				u.setAssessor(rs.getString("assessor"));
				u.setPigeonholeDate(rs.getString("pigeonholeDate"));
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
