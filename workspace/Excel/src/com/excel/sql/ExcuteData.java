package com.excel.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.citrus.info.util.Conn;

public class ExcuteData {
	private PreparedStatement pstmt;
	public boolean ExcuData(String sql) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		boolean flag=false;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
