import java.sql.*;

public class Decide {


	private String JDBCDriver = "com.mysql.jdbc.Driver";  				//����������

	private String url = "jdbc:mysql://127.0.0.1:3306/hadoopdb";        // URLָ��Ҫ���ʵ����ݿ���infoAgri

	private String user = "root";    								// MySQL����ʱ���û���

	private String password = "123456";  						   // Java����MySQL����ʱ������
	
	private Connection conn=null;
	public PreparedStatement pstmt = null;
	
	public String getSeason(Long timeStamp){   //����ʱ������ؼ���
		  Date date =(Date) new java.sql.Date( timeStamp);
		  int month =date.getMonth()+1;
		  month =month/3;
		  String season ="";
		  if(month==1||month==4)
			  season ="����";
		  else if(month==2)
			  season ="�ļ�";
		  else if(month==3)
			  season ="�＾";
		  else
			  season ="����";
		  return season;
	  }
	
/*
 *����ʱ��������ڡ��ͺ�ˮ�� ��ѯר�Ҿ���
 */
		
	public String  getDecide(Long timeStamp,String  SoilProperties,double d) throws ClassNotFoundException, SQLException
		{
			Class.forName(JDBCDriver);   									// ������������

			 conn= DriverManager.getConnection(url, user, password);		// ����MySQL���ݿ�

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
			System.out.println(whaterDecide.getDecide((long)0,"ɳ��",14));
		}

	
}
