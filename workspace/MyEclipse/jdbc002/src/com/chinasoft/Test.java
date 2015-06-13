package com.chinasoft;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class Test {

	/**
	 * @param args
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:myoracle", "user_zhouqi", "123456");
		String str = "(";
		List<Integer> list = new ArrayList<Integer>();
		list.add(123);
		list.add(3456);
		
		for(int i : list ){
			str = str + i +",";
		}
		str = str.substring(0, str.length() - 1) + ")";
		PreparedStatement st = con.prepareStatement("delete from  borrow  where reader_id in " +str);
		//PreparedStatement st = con.prepareStatement("insert into borrow values (SEQ_USER.nextval,?,?)");
		Date d = new Date();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date;
		try {
			date = sdf.parse("1961-2-29 11:11:11");
			System.out.println(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		
		//st.setString(1, "(123,45,7657)");
	
		//st.setTimestamp(2, new java.sql.Timestamp(d.getTime()));
		st.executeUpdate();
//		st.executeUpdate("insert into borrow values (112,332211,to_date('"+date+"','yyyy-mm-dd hh:mi:ss'))");
//		rs.close();
		st.close();
		con.close();
	}

}
