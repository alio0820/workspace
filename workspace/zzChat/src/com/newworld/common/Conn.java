package com.newworld.common;
import java.sql.*;
/**author:�ԲӶ�
 * Time:2012-07-21  15:41
 * Last change:
 * function: ����Mysql���ݿ�
 */
public class Conn {
	
	private static Conn instance;
//	private Conn(){
//		
//	}
	/**����ģʽ,ֻ����һ��Conn����
	 * 
	 */
	public static Conn getConnInstance(){
		if(instance == null){
			instance = new Conn();
		}
		return instance;
	}
	/**����һ������
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