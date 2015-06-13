package com.chinasoft.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUitls {
	
	private static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String URL = "jdbc:oracle:thin:@172.18.21.2:1521:orcl";
	private static String USERNAME = "user_zhouqi";
	private static String PASSWORD = "123456";
	
	public static Connection getConnection(String driver ,String url ,String userName,String password){
		
		try {
			Class.forName(driver);
			return DriverManager.getConnection(url,userName,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	public static Connection getConnection(){
		
		try {
			Class.forName(DRIVER);
			return DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
}
