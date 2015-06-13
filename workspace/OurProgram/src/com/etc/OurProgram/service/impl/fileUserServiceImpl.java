package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import com.etc.OurProgram.service.fileUserService;
import com.etc.OurProgram.javabean.fileUser;
import com.etc.OurProgram.util.Conn;

public class fileUserServiceImpl implements fileUserService {
	public List queryUser() {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement("SELECT * FROM project WHERE stutas='进行中'");
			ResultSet rs = pstmt.executeQuery("SELECT * FROM project WHERE stutas='进行中'");
			List list = new ArrayList();
			while(rs.next()){
				fileUser u = new fileUser();
				u.setProjectID(rs.getString("projectID"));
				u.setProjectName(rs.getString("projectName"));
				u.setPigeonholeLeader(rs.getString("pigeonholeLeader"));
				u.setSetupDate(rs.getString("setupDate"));
				u.setSubmitDate(rs.getString("submitDate"));
				u.setAssessor(rs.getString("assessor"));
				u.setAuditingAttitude(rs.getString("auditingAttitude"));
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