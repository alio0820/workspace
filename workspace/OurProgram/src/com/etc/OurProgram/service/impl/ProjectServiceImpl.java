package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.etc.OurProgram.javabean.ProjectList;
import com.etc.OurProgram.service.ProjectService;
import com.etc.OurProgram.util.Conn;

public class ProjectServiceImpl implements ProjectService{
	@SuppressWarnings("unchecked")
	public List queryUser(ProjectList pl) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		try {
			String sql="SELECT * FROM project WHERE pigeonholeLeader='"+pl.getPigeonholeLeader()+"'";
			pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			List list = new ArrayList();
			while(rs.next()){
				ProjectList u = new ProjectList();
				u.setId(rs.getInt("id"));
				u.setProjectID(rs.getString("projectID"));
				u.setProjectName(rs.getString("projectName"));
				u.setUnit(rs.getString("unit"));
				u.setPigeonholeLeader(rs.getString("pigeonholeLeader"));
				u.setSetupDate(rs.getString("setupDate"));
                u.setStutas(rs.getString("stutas"));
               /* u.setPigeonholeType(rs.getString("pigeonholeType"));
                u.setAssessor(rs.getString("assessor"));
                u.setPigeonholeDate(rs.getDate("pigeonholeDate"));
                u.setAuditingAttitude(rs.getString("auditingAttitude"));*/
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

	public List querySubmit(ProjectList pl) {
	
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
		SimpleDateFormat dtCurrent=new   SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Date date2 = null;
		Date date3=null;
		try {
			date2 = dtCurrent.parse(dtCurrent.format(date));
			date3=new java.sql.Date(date2.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}

		List list = new ArrayList();
		try {
			String sql="update project set stutas='已提交', submitDate='"+date3+"' where id="+pl.getId();
			pstmt = connection.prepareStatement(sql);
			int i=pstmt.executeUpdate();
			if(i==1){
			    sql="SELECT * FROM project WHERE pigeonholeLeader='"+pl.getPigeonholeLeader()+"'";
				pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(sql);
				
				while(rs.next()){
					ProjectList u = new ProjectList();
					u.setId(rs.getInt("id"));
					u.setProjectID(rs.getString("projectID"));
					u.setProjectName(rs.getString("projectName"));
					u.setUnit(rs.getString("unit"));
					u.setPigeonholeLeader(rs.getString("pigeonholeLeader"));
					u.setSetupDate(rs.getString("setupDate"));
	                u.setStutas(rs.getString("stutas"));
					list.add(u);
				}
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
	
	
	public List querySubmitRecord(ProjectList pl){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt;
 	    List list = new ArrayList();
		try {
			String sql="select * from project where id='"+pl.getId()+"'";
			pstmt = connection.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				ProjectList u = new ProjectList();
				u.setId(rs.getInt("id"));				
				u.setProjectName(rs.getString("projectName"));				
                u.setPigeonholeType(rs.getString("pigeonholeType"));
                u.setAssessor(rs.getString("assessor"));
                u.setPigeonholeDate(rs.getDate("pigeonholeDate"));
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
