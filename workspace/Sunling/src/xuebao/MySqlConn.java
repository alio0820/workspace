package xuebao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class MySqlConn {
	
	
	
	/* private static Map paramsMap = new HashMap();
	 private ArrayList result = new ArrayList();
	 private static  ConnectionPool connPool = new ConnectionPool(null);*/
	public void conSql(){
		Connection connection=null;
		PreparedStatement pstmt;
	    	try{
				 Class.forName("com.mysql.jdbc.Driver");
				 connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xuebao?useUnicode=true&characterEncoding=utf-8","root","sunling");
				 File  f   = new  File("result.txt"); 
				  if   (f.exists())   { 
				  FileReader fileReader=new   FileReader(f); 
				  BufferedReader   bfr=new BufferedReader(fileReader); 
				  String   tmp_str;
				  while  ((tmp_str=bfr.readLine())!= null)   { 

					pstmt = connection.prepareStatement("insert into ComputerNewspaper(subject," +
							"author,author_unit,publish_vintage,publish_month,abstract) values(?,?,?,?,?,?)");
					//String str = new String(bfr.readLine().getBytes("UTF-8"),"GBK");
					pstmt.setString(1,  bfr.readLine());
					bfr.readLine();
					pstmt.setString(2, bfr.readLine());
					bfr.readLine();
					pstmt.setString(3, bfr.readLine());
					bfr.readLine();
					pstmt.setString(4, (bfr.readLine()));
					bfr.readLine();
					pstmt.setString(5, bfr.readLine());
					bfr.readLine();
					pstmt.setString(6, bfr.readLine());     
				  pstmt.executeUpdate();
				  pstmt.close(); 
				
				  } 
		  
				  }  
	    	}
	    	
		
	    catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (FileNotFoundException e) {
	
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		finally {
			
				
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				 
			} 
	}
}
	/*  public static List query(String sql, Map param, String className) {

		  

			
             String sql="select \"id\",\"����\"��\"���ߵ�λ\" from all_tab";

			      try{
				  Connection conn = connPool.getConnection();   
				   PreparedStatement p = conn.prepareStatement(sql);
				   boolean flag = fillParameters(p, param);
				   if (flag) {
				    ResultSet rs = p.executeQuery();
				    result = buildResult(rs, className);
				   }
				  } catch (SQLException e) {

				   e.printStackTrace();
				  }
                    System.out.println(result.getItems());
				  close();
				  
				  return result;
				 }*/
	
	


		
		  
	
	
