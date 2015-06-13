package com.chinasoft;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class Test {

	/**
	 * @param args
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:myoracle", "user_zhouqi", "123456");
		
		Statement st = con.createStatement();
		//st.executeUpdate();
		//st.setString(1, "'");
		
		ResultSet rs = st.executeQuery("select count(*) as aa from reader where name = 'select '");
		
//		StringBuffer sb = new StringBuffer();
//		StringBuffer sb1 = new StringBuffer();
//		sb.append("create table book1 (id number(10) , name varchar2(20)  )");
//		sb1.append("select * from book ");	
		
//		st.executeUpdate(sb.toString());
		
		
		
//		boolean  flag = st.execute(sb.toString());		
//		boolean  flag1 = st.execute(sb1.toString());
//		ResultSet rs = st.getResultSet();
//		st.getMoreResults(Statement.KEEP_CURRENT_RESULT);

		
//		rs = st.getResultSet();
		
//		sb.append("select * from book ");
//		ResultSet rs =  st.executeQuery(sb.toString());
		while(rs.next()){
			System.out.println(rs.getLong("aa"));
		}
//		System.out.println(st.getUpdateCount());
//		System.out.println(flag);
		rs.close();
		st.close();
		con.close();
	}

}
