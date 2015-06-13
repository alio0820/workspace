package sqlserver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class SQLDB {
	
	public static void main(String[] args) {
		SQLDB.getConn();
	}

		public static Connection getConn() {
			Connection conn = null;
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String url="jdbc:sqlserver://127.0.0.1:1433;databaseName=manageDB"; 
				String user="nc"; 
				String password="123456"; 
				conn= DriverManager.getConnection(url,user,password); 
				  
				if(!conn.isClosed()){
					System.out.println("success");
					PreparedStatement pstmt = null;
					pstmt = conn.prepareStatement("select * from user1");
//					pstmt.setDouble(1,0 );
					//pstmt.setString(2, "12");
				    ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						System.out.println(rs.getString("user"));
						System.out.println(rs.getString("password"));
//						System.out.println(rs.getString("leadDepartmentId"));
					}
				}
				else
					System.out.println("failed!!!");

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return conn;
		}
		
		public static Statement getStatement(Connection conn) {
			Statement stmt = null; 
			try {
				if(conn != null) {
					stmt = conn.createStatement();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return stmt;
		}
		
		public static ResultSet getResultSet(Statement stmt, String sql) {
			ResultSet rs = null;
			try {
				if(stmt != null) {
					rs = stmt.executeQuery(sql);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		public static void closeConn(Connection conn) {
			try {
				if(conn != null) {
					conn.close();
					conn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void closeStmt(Statement stmt) {
			try {
				if(stmt != null) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public static void closeRs(ResultSet rs) {
			try {
				if(rs != null) {
					rs.close();
					rs = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

}

