package com.conn;

import java.sql.*;
public class Conn {
	
	private static Conn instance;
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
				connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/AQI?characterEncoding=utf8","root","");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	   }
}