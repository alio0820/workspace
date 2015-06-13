package com.buy.bean.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection()
	{
		Connection conn = null;
		try{
			Class.forName(Config.CONNECTION_DRIVER).newInstance();
			
			conn = DriverManager.getConnection(Config.CONNECTION_URL, Config.CONNECTION_USER, Config.CONNECTION_PWD);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		if(conn==null){
			System.out.println("no get connection!throws Exception");
		}
		return conn;
	}

}
