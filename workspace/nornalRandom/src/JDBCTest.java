
import java.sql.*;
import hadoop.mysql.table.*;

//
//import javax.naming.spi.DirStateFactory.Result;

public class JDBCTest {  
  public static void main(String[] args){  

	String JDBCDriver = "com.mysql.jdbc.Driver";  				//����������

	String url = "jdbc:mysql://127.0.0.1:3306/hadoopdb";   // URLָ��Ҫ���ʵ����ݿ���infoAgri

	String user = "root";    				// MySQL����ʱ���û���

	String password = "123456";  			   // Java����MySQL����ʱ������
	
	//long unix_time=0; //ʱ���
	Connection conn=null;
	PreparedStatement pstmt = null;
	int oneMinute=60;
	int oneMonth=30*24*3600;
	int oneHour=3600;
	//2010��1��1��0ʱ =1293811200
	int firstTime=1293811200;
	

	try {

		Class.forName(JDBCDriver);   									// ������������

		 conn= DriverManager.getConnection(url, user, password);		// ����MySQL���ݿ�

			if(!conn.isClosed())

				System.out.println("Succeeded connecting to the Database!");
			
		/*
		 *��ѯ���������ҳ��Ѿ���ֲ�ĸ������ı�ʶID
		 */
		 for(int i=0;i<=1000;i++)
		 {

			Statement pstmtC =conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet  rs=pstmtC.executeQuery("select ID,TimeStam ,soilprop from citrTree");
			
			while(rs.next()){    
//				
//				System.out.println(rs.getString("ID"));   //ѡ��ID��������, �Դ��ڵ���ģ���������
//				System.out.println(rs.getInt("TimeStam")); 
				String treeID=rs.getString("ID");
				long  unixTime=rs.getInt("TimeStam"); //�ϴεĲɼ���ʱ��
				String soilProperties=rs.getString("soilprop");
				
				unixTime=unixTime+10*oneMinute; //10����=600��
				
				rs.updateLong("TimeStam",unixTime); //���¼�¼��ʱ���
				rs.updateRow();
				
				
				SoilTempBean soilTempBean1=new SoilTempBean();     //�����¶Ȳɼ�ģ��SoilTemp��10����
				
				soilTempBean1.setID(treeID);				//��ʼ��������
				soilTempBean1.setTimeStam(unixTime);
				
				pstmt = conn.prepareStatement("insert into SoilTemp value(?,?,?,?,?)");
				pstmt.setString(1, soilTempBean1.getID());
				pstmt.setLong(2, soilTempBean1.getTimeStam());
				pstmt.setDouble(3, soilTempBean1.getTemp1());
				pstmt.setDouble(4, soilTempBean1.getTemp2());
				pstmt.setDouble(5, soilTempBean1.getTemp3());
				
				pstmt.execute();
				
				if((unixTime-firstTime)%oneHour==0){				//����ʪ��Bean��һ��Сʱ
					SoilHumiBean soilHumiBean1=new SoilHumiBean();
					soilHumiBean1.setID(treeID);
					soilHumiBean1.setTimeStam(unixTime);
					Decide decide1=new Decide();
					
					//�������
					System.out.println(soilHumiBean1.getHume1());
					System.out.println(decide1.getSeason(unixTime));
					System.out.println(soilProperties);
					System.out.println(decide1.getDecide(unixTime, soilProperties, soilHumiBean1.getHume1()));
					
					pstmt = conn.prepareStatement("insert into SoilHumi value(?,?,?,?,?)");
					pstmt.setString(1, soilHumiBean1.getID());
					pstmt.setLong(2, soilHumiBean1.getTimeStam());
					pstmt.setDouble(3, soilHumiBean1.getHume1());
					pstmt.setDouble(4, soilHumiBean1.getHume2());
					pstmt.setDouble(5, soilHumiBean1.getHume3());
					pstmt.execute();
					
				}
			
				
				if((unixTime-firstTime)%oneMonth==0){		//�������� ��һ����
					SoilFertBean soilFertBean1=new SoilFertBean();
					soilFertBean1.setID(treeID);
					soilFertBean1.setTimeStam(unixTime);
					
					pstmt = conn.prepareStatement("insert into SoilFert value(?,?,?,?,?,?)");
					pstmt.setString(1, soilFertBean1.getID());
					pstmt.setLong(2,soilFertBean1.getTimeStam());
					pstmt.setDouble(3, soilFertBean1.getNCont());
					pstmt.setDouble(4,soilFertBean1.getPCont());
					pstmt.setDouble(5, soilFertBean1.getKCont());
					pstmt.setDouble(6, soilFertBean1.getPHValu());
					pstmt.execute();

				}
				
			
				
				if((unixTime-firstTime)%(12*oneHour)==0){			//����12��Сʱ
					MeteBean meteBean1=new MeteBean();		//��ʼ�����ݱ�JavaBean
					meteBean1.setID(treeID);
					meteBean1.setTimeStam(unixTime);
					
					pstmt = conn.prepareStatement("insert into mete value(?,?,?,?,?,?,?,?)");
					pstmt.setString(1, meteBean1.getID());
					pstmt.setLong(2, meteBean1.getTimeStam());
					pstmt.setDouble(3, meteBean1.getAirTemp());
					pstmt.setDouble(4, meteBean1.getHumi());
					pstmt.setDouble(5, meteBean1.getAtmoPres());
					pstmt.setDouble(6, meteBean1.getUVRadi());
					pstmt.setDouble(7, meteBean1.getEvap());
					pstmt.setDouble(8, meteBean1.getRainFall());
					pstmt.execute();
					
				
					}	
				
			}							

	// Ȼ��ʹ��GB2312�ַ�������ָ�����ֽ�����

	//name = new String(name.getBytes("ISO-8859-1"),"GB2312");

			 pstmtC.close();
		
			}
		 conn.close();   //�Ͽ����ݿ�����
	} 
	catch(ClassNotFoundException e){   
		System.out.println("Sorry,can`t find the Driver!"); 
		e.printStackTrace();   
		} 
	catch(SQLException e){  
		e.printStackTrace();  
		} 
	catch(Exception e) {   
			e.printStackTrace();  
		}  

}
}




