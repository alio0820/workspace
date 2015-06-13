package com.common;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
/**
 * author:�ԲӶ�
 * ����:2013-04-14
 * �޸�����:2013-07-21
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
	
	private Connection conn;
	
	public  static void main(String[]  args){
		DBConnection  DBConn =new DBConnection();
		System.out.println((DBConn.isUserExistAndLegal("a", "123456")));
	}
/***********************************************************************************************/
	public	DBConnection(Connection conn){							
		this.conn=conn;
	}		
	public DBConnection(){								//��ʼ�������캯��
		conn=null;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	/***********************************************************************************************/
	/*
	* �����ݿ����ӣ��������ݿ�����Connection
	*/
//	public void  OpenDB(){
//			//		����mysql �Ĵ���
//			//		String MySQLJDBCDriver = "com.mysql.jdbc.Driver";  			//����������
//			//		String url = "jdbc:mysql://127.0.0.1:3306/managedb";  		// URLָ��Ҫ���ʵ����ݿ���infoAgri
//			//		String user = "root";    									// MySQL����ʱ���û���	
//			//		String password = "123456";  			 					// Java����MySQL����ʱ������
//					
//   //����sqlserver2005�Ĵ���		
////		String SQLServerJDBCDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
////		String SQLServerURL = "jdbc:sqlserver://192.168.0.13:1433;DatabaseName=manageDB"; 
////		String user = "nc";    										// MySQL����ʱ���û���	
////		String password = "123456";  			 						// Java����MySQL����ʱ������
//		
//		
//		try {
////			Class.forName(SQLServerJDBCDriver);   								// ������������
////			conn= DriverManager.getConnection(SQLServerURL, user, password);		// ����MySQL���ݿ�
//			
//			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
//			conn = DriverManager.getConnection("proxool.proxoolPool");
//			if(conn!=null)
//				System.out.println("DMMS is connected Successfull!");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	
	public void  OpenDB(){
		//		����mysql �Ĵ���
		//		String MySQLJDBCDriver = "com.mysql.jdbc.Driver";  			//����������
		//		String url = "jdbc:mysql://127.0.0.1:3306/managedb";  		// URLָ��Ҫ���ʵ����ݿ���infoAgri
		//		String user = "root";    									// MySQL����ʱ���û���	
		//		String password = "123456";  			 					// Java����MySQL����ʱ������
				
		//����sqlserver2005�Ĵ���		
		//	String SQLServerJDBCDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
		//	String SQLServerURL = "jdbc:sqlserver://192.168.0.13:1433;DatabaseName=manageDB"; 
		//	String user = "nc";    										// MySQL����ʱ���û���	
		//	String password = "123456";  			 					// Java����MySQL����ʱ������
	try {
		//		Class.forName(SQLServerJDBCDriver);   								// ������������
		//		conn= DriverManager.getConnection(SQLServerURL, user, password);		// ����MySQL���ݿ�
		
		Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		conn = DriverManager.getConnection("proxool.proxoolPool");
//		if(conn!=null)
//			System.out.println("DMMS is connected Successfull!");
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
//				if(conn.isClosed())
//					System.out.println("DBMS is closed successfully!");
				
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
		return -1;
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

/**
 * ����ִ��SQL���,�����ڲ��Ѿ�ʵ�����ݿ����Ӵ�򿪺͹رգ���
 */
public  boolean BatchExecuteSQL(ArrayList<String>  sqlList){	
	this.OpenDB();
	try {
		this.conn.setAutoCommit(false);		
		Statement  st=conn.createStatement();		
		for(String  sql:sqlList){
			//System.out.println(sql);
			st.addBatch(sql.toString());
		}		
		//int res[]=
		st.executeBatch();
		this.conn.commit();						//�ֶ��ύ����
//		if(res.length!=sqlList.size()){
//			this.conn.rollback();
//			return  false;
//		}			
	} catch (Exception e) {					//�쳣�����ع�����
		e.printStackTrace();
		try {
			this.conn.rollback();		
		} catch (SQLException e1) {
			e1.printStackTrace();
			return  false;
		}
		return  false;
	}	
	this.CloseDB();	
	return  true;
}
/**
 * �ú����������ĳ�ű������ã���
 * ������ձ��¼������
 * ����-1��ʾ���ʧ�ܣ�
 */

public  int  dropTable(String  tableName){
	Statement  st=null;
	int sum=0;
	String dropSQL="delete  from "+tableName;
	try {
		st=conn.createStatement();
		sum=st.executeUpdate(dropSQL);
	} catch (SQLException e) {
		e.printStackTrace();
		return  -1;
	}
	return  sum;
}


/**
 *	�ж��û��ĺϷ��ԣ�ͨ��Ԥ��������sqlע�빥�������� 
 * @param userName
 * @param password
 * @return	�����û�bean���û��Ƿ��򲻴��ڣ�����null
 */
public  UserBean  isUserExistAndLegal(String userId,String password){
	this.OpenDB();
	PreparedStatement ps=null;
	ResultSet rs=null;
	UserBean ub=null;
	try {
		ps=conn.prepareStatement("select * from user_info where valid =1 and userId=? and password=?");
		ps.setString(1, userId);
		ps.setString(2, password);
		rs=ps.executeQuery();
		
		ub=new UserBean();
		if(rs.next()){
			ub.setUserId(userId);
			ub.setPassword(password);
			ub.setUserName(rs.getString("userName"));
			ub.setNickName(rs.getString("nickName"));
			ub.setRoleId(rs.getInt("roleId")+"");
			ub.setRemark(rs.getString("remark"));
			ub.setValid("1");
			ub.setRegisterTime(rs.getString("registerTime"));
			ub.setRegisterIp(rs.getString("registerIp"));
			ub.setRecentTime(rs.getString("recentTime"));
			ub.setRecentIp(rs.getString("recentIp"));
			ub.setUpdateTime(rs.getString("updateTime"));
		}
		else{
			return null;
		}	
		ps.close();
		rs.close();
		return  ub;
	} catch (SQLException e) {
		e.printStackTrace();
		this.CloseDB();
		return ub;
	}finally{
		this.CloseDB();
	}
}
}
