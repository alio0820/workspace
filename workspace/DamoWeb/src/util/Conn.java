package util;
import java.sql.*;
public class Conn {
	private static Conn instance;
	Connection connection;
	
	public static Conn getConnInstance(){
		if(instance == null){
			instance = new Conn();
		}
		return instance;
	}
	public Connection getConnection(){
    	try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","xingye");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	   }
}