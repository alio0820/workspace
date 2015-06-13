import java.sql.*;

public class Decide {


	private String JDBCDriver = "com.mysql.jdbc.Driver";  				//驱动程序名

	private String url = "jdbc:mysql://127.0.0.1:3306/hadoopdb";        // URL指向要访问的数据库名infoAgri

	private String user = "root";    								// MySQL配置时的用户名

	private String password = "123456";  						   // Java连接MySQL配置时的密码
	
	private Connection conn=null;
	public PreparedStatement pstmt = null;
	
	public String getSeason(Long timeStamp){   //根据时间戳返回季节
		  Date date =(Date) new java.sql.Date( timeStamp);
		  int month =date.getMonth()+1;
		  month =month/3;
		  String season ="";
		  if(month==1||month==4)
			  season ="春季";
		  else if(month==2)
			  season ="夏季";
		  else if(month==3)
			  season ="秋季";
		  else
			  season ="冬季";
		  return season;
	  }
	
/*
 *根据时间戳、季节、和含水量 查询专家决策
 */
		
	public String  getDecide(Long timeStamp,String  SoilProperties,double d) throws ClassNotFoundException, SQLException
		{
			Class.forName(JDBCDriver);   									// 加载驱动程序

			 conn= DriverManager.getConnection(url, user, password);		// 连接MySQL数据库

				if(!conn.isClosed())

			System.out.println("Succeeded connecting to the Database!");
				String SQL="select IrriSugg.expeSugg from IrriSugg,soilProp where  soilProp.seas=? and soilProp.expeSugg=irriSugg.expeSuggNumb and soilProp.soilProp=? and soilProp.minCont<?  and soilProp.maxCont>?  ";
				pstmt=conn.prepareStatement( SQL);


				String res="";
				pstmt.setString(1, getSeason(timeStamp));
				pstmt.setString(2, SoilProperties);;
				pstmt.setDouble(3, d);
				pstmt.setDouble(4, d);
			
				ResultSet  rs=pstmt.executeQuery();
				if(rs.next())
					res=rs.getString("expeSugg");
				else
					res="These is no suggestion!";
				rs.close();
				conn.close();
				return  res;
	
		}

		
		public static void main(String[] args) throws ClassNotFoundException, SQLException{ 
			
			Decide whaterDecide=new	Decide();
			System.out.println(whaterDecide.getSeason((long)0));
			System.out.println(whaterDecide.getDecide((long)0,"沙土",14));
		}

	
}
