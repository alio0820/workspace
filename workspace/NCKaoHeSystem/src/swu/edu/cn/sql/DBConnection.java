package swu.edu.cn.sql;
import java.sql.*;
import java.util.LinkedList;
/**
 * ����:������
 * ����:2012-04-16
 * ������ɶ����ݿ�Ĵ򿪣��رյȻ�����������
 * ��һ�����ݿ����ӣ�		public void  OpenDB()��
 * �ر����ݿ����ӣ�			public void CloseDB()��
 * ִ��һ����̬sql��ѯ��䣺	public ResultSet SelectDB(String sql)��
 * ִ��һ����̬������䣺		public boolean insertDB(String insertSQL)��
 * ִ��һ����̬ɾ����			public int  deleteDB(String deleteSQL)��
 * ִ��һ����̬������䣺		public int  updateDB(String updateSQL)��
 * ����ѯ���ݼ�תΪΪһ���ַ�������	public LinkedList<String> ResultSetToList(ResultSet rs)��
 */
public class DBConnection {
	
	public Connection conn;
	
	public  static void main(String[]  args){
			DBConnection  DBConn =new DBConnection();
			DBConn.OpenDB();
			
			ResultSet rs=DBConn.SelectDB("select * from department");
			try {
				while(rs.next()){
					
					System.out.println(rs.getString("departmentName"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			DBConn.CloseDB();
		
	}
	
	
/***********************************************************************************************/
public	DBConnection(Connection conn){							
		
		this.conn=conn;
	}
	
public DBConnection(){								//��ʼ�������캯��
		conn=null;
		
	}
	
	/***********************************************************************************************/
	/*
	* �����ݿ����ӣ��������ݿ�����Connection
	*/
	public void  OpenDB(){
			//		����mysql �Ĵ���
			//		String MySQLJDBCDriver = "com.mysql.jdbc.Driver";  					//����������
			//		String url = "jdbc:mysql://127.0.0.1:3306/managedb";  		// URLָ��Ҫ���ʵ����ݿ���infoAgri
			//		String user = "root";    										// MySQL����ʱ���û���	
			//		String password = "123456";  			 						// Java����MySQL����ʱ������
					
   //����sqlserver2005�Ĵ���		
		String SQLServerJDBCDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
		String SQLServerURL = "jdbc:sqlserver://192.168.0.12:1433; DatabaseName=manageDB"; 
		String user = "nc";    										// MySQL����ʱ���û���	
		String password = "123456";  			 						// Java����MySQL����ʱ������
		
		
		try {
			Class.forName(SQLServerJDBCDriver);   								// ������������
			conn= DriverManager.getConnection(SQLServerURL, user, password);		// ����MySQL���ݿ�
			if(conn!=null)
				System.out.println("DMMS is collected Successfull!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/***********************************************************************************************/
	/*
	 * �ر����ݿ�����
	 * ������ݿ�����Ϊ�رգ���ر����ݿ�����
	 */
	public void CloseDB(){	
		
		try {
			if(!conn.isClosed()){
				conn.close();
				if(conn.isClosed())
					System.out.println("DBMS is closed successfully!");
				
			}else{
				System.out.println("DBMS is not connected!");	
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
		
	
	/***********************************************************************************************/
	/**
	 *ǰ�������ݿ������Ѿ��򿪣�����������Ӧ���е���һ�º�������������OpenDB�����ݿ�����
	 *�������ݿ����CloseDB�ر����ݿ����ӣ�
	 *SelectDB()ִ�в�ѯ���ܣ�����һ��ResultSet����
	 */
	public ResultSet SelectDB(String selectSQL){
		ResultSet rs=null;
		Statement st=null;
		try {
			if(conn.isClosed()){
				return null;	
			}	
			
			st=conn.createStatement();
			rs=st.executeQuery(selectSQL);
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	/***********************************************************************************************/	
/**
 * �����ݱ��в���һ����¼��
 * �ü�¼ϸ��ͨ��sql�����ɣ����������֣��ֶ���������ֵ��
 */
	
public boolean insertDB(String insertSQL){
	boolean  res=false;
	Statement  st=null;
	
	try {
		st=conn.createStatement();
		int sum=st.executeUpdate(insertSQL);
		if(sum>0)
				res=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return res;
}

/***********************************************************************************************/	
/**
 * �����ݱ���ɾ��һ����¼��
 * �ü�¼ϸ��ͨ��sql�����ɣ����������֣��ֶ���������ֵ��
 * ����ɾ����¼������
 */

public int  deleteDB(String deleteSQL){
	int sum=0;
	Statement  st=null;
	try {
		st=conn.createStatement();
		sum=st.executeUpdate(deleteSQL);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return sum;
	
}

/***********************************************************************************************/	
/**
 * �����ݱ��и��¼�¼��
 * �ü�¼ϸ��ͨ��sql�����ɣ����������֣��ֶ���������ֵ��
 * ���ظ��¼�¼������
 * 
 */

public int  updateDB(String updateSQL){
	int sum=0;
	Statement  st=null;
	try {
		st=conn.createStatement();
		sum=st.executeUpdate(updateSQL);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return sum;
	
}

/**
 * 
 *�����ݲ�ѯ���ResultSetת��Ϊһ��String����
 */
public LinkedList<String> ResultSetToList(ResultSet rs){
	LinkedList<String> list=new LinkedList<String>();
	
	try {
		while(rs.next()){
			ResultSetMetaData meta=rs.getMetaData();
			String str="#";
			
			for(int i=1;i<=meta.getColumnCount();i++){
				str=str+";"+rs.getObject(i);
			}
			list.add(str);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return list;
}

	
}
