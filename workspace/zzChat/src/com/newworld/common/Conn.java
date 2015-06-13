package com.newworld.common;
import java.sql.*;
/**author:翟灿东
 * Time:2012-07-21  15:41
 * Last change:
 * function: 连接Mysql数据库
 */
public class Conn {
	
	private static Conn instance;
//	private Conn(){
//		
//	}
	/**单例模式,只创建一个Conn对象
	 * 
	 */
	public static Conn getConnInstance(){
		if(instance == null){
			instance = new Conn();
		}
		return instance;
	}
	/**创建一个连接
	 * 
	 */
	public Connection getConnection(Connection connection){
    	try {
			if(connection != null && connection.isClosed() == false){
			}else{
				Class.forName("com.mysql.jdbc.Driver");


				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/newworld","root","xingye");


			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	   }
}