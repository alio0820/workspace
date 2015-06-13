package com.chinasoft;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.Borrow;



public class Test {

	/**
	 * @param args
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.18.21.2:1521:orcl", "user_zhouqi", "123456");
		
		//System.out.println(con);
		PreparedStatement ps = con.prepareStatement("select * from borrow where BOOK_ID = 332211",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE );
	/*	QueryRunner qr = new QueryRunner();
		BeanListHandler<Borrow> blh = new BeanListHandler<Borrow>(Borrow.class);
		List<Borrow> list = qr.query(con, "select * from borrow ", blh);
		for(Borrow b :list){
			System.out.println(b.getBook_id());
			System.out.println(b.getBorrow_date());
			System.out.println(b.getReader_id());
		}*/
		
		ResultSet rs  = ps.executeQuery();
		
//		DECIMAL===========READER_ID-----------112
//		DECIMAL===========BOOK_ID-----------332211
//		DATE===========BORROW_DATE-----------2010-09-26 01:54:25.0
		
		ResultSetMetaData rms = rs.getMetaData();
		while(rs.next()){
			for(int i=0;i<rms.getColumnCount();i++){
				System.out.println(rms.getColumnTypeName(i+1)+"==========="+rms.getColumnName(i+1)+"-----------"+rs.getObject(i+1));				
		}
			rs.updateInt("READER_ID", 277);
			rs.updateRow();
		}
//		String str ="";
//		CallableStatement cs = con.prepareCall("{? = call AddStudent(101,'d','e',101,?)}");
//		
//		cs.registerOutParameter(1, Types.VARCHAR);	
//		cs.registerOutParameter(2, Types.OTHER);	
//		cs.execute();
//		//str = cs.getString(1);
//		ResultSet rs = (ResultSet)cs.getObject(1);
//		while(rs.next()){
//			System.out.println(rs.getInt(1));
//			System.out.println(rs.getString(2));
//		}
//		System.out.println(str);
//		ps.close();
		con.close();
	}

}
