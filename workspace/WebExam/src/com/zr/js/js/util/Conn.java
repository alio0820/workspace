package com.zr.js.js.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
	private static Conn instance;
//	private Conn(){
//		
//	}
	public static Conn getConnInstance(){
		if(instance == null){
			instance = new Conn();
		}
		return instance;
	}
	public Connection getConnection(Connection connection){
    	try {
			if(connection != null && connection.isClosed() == false){
			}else{
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/examsystem","root","xingye");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	   }
}