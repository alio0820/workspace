package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import com.etc.OurProgram.service.UserServiceDetailTwo;
import com.etc.OurProgram.util.Conn;

public class UserServiceDetailImplTwo implements UserServiceDetailTwo{
	public List queryUserDetailTwo(String projectName,String auditingAttitude,String pigeonholeDate) {
		// TODO Auto-generated method stub
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt=null;
		//System.out.println(projectName);  //���ڲ��鴫ֵ�Ƿ�ɹ�
		try {
			pstmt=connection.prepareStatement("UPDATE project SET stutas='已完成',auditingAttitude='"+auditingAttitude+"',pigeonholeDate='"+pigeonholeDate+"' WHERE projectName='"+projectName+"'");
		int i=	pstmt.executeUpdate();
		System.out.print(i);
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
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
