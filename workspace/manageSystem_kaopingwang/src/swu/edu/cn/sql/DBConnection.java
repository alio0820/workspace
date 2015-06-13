package swu.edu.cn.sql;
import java.sql.*;
import java.util.LinkedList;
/**
 * author:handonghai
 * date:2012-04-16
 * 该类完成对数据库的打开，关闭等基本基本操作
 * 打开一个数据库连接：		public void  OpenDB()；
 * 关闭数据库连接：			public void CloseDB()；
 * 执行一条静态sql查询语句：	public ResultSet SelectDB(String sql)；
 * 执行一条静态插入语句：		public boolean insertDB(String insertSQL)；
 * 执行一条静态删除：			public int  deleteDB(String deleteSQL)；
 * 执行一条静态更新语句：		public int  updateDB(String updateSQL)；
 * 将查询数据集转为为一个字符串队列	public LinkedList<String> ResultSetToList(ResultSet rs)；
 */
public class DBConnection {
	
	public Connection conn;
	
	DBConnection(Connection conn){								
		
		this.conn=conn;
	}
	
	public DBConnection(){								//初始化、构造函数
		conn=null;
	}
	/***********************************************************************************************/
	/*
	 * 打开数据库连接，返回数据库连接Connection
	 */
	public void  OpenDB(){
		String MySQLJDBCDriver = "com.mysql.jdbc.Driver";  					//驱动程序名

		String url = "jdbc:mysql://127.0.0.1:3306/managedb";  		// URL指向要访问的数据库名infoAgri

		String user = "root";    										// MySQL配置时的用户名

		String password = "123456";  			 						// Java连接MySQL配置时的密码
		
		try {
			Class.forName(MySQLJDBCDriver);   								// 加载驱动程序
			conn= DriverManager.getConnection(url, user, password);		// 连接MySQL数据库
			if(conn!=null)
				System.out.println("DMMS is collected Successfull!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/***********************************************************************************************/
	/*
	 * 关闭数据库连接
	 * 如果数据库连接为关闭，则关闭数据库连接
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
		
	/**
	 * 查询数据库某条记录是否存在，存在返回true，不存在返回false
	 * 详情由SQL语句控制
	 * 
	 */
	
	public boolean  isKeyExist(String sql){
		boolean  res=false;
		
		return  res;
		
	}
	
	/***********************************************************************************************/
	/**
	 *前提是数据库练级已经打开，所以在其他应用中调用一下函数，必须先用OpenDB打开数据库连接
	 *用完数据库后用CloseDB关闭数据库连接！
	 *SelectDB()执行查询功能，返回一个ResultSet对象
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
	
	
	/**
	 * 
	 *将数据查询结果ResultSet转化为一个String队列
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
	
	
/***********************************************************************************************/	
/**
 * 向数据表中插入一条记录，
 * 该记录细节通过sql语句完成，包括表名字，字段名，属性值等
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
 * 向数据表中删除一条记录，
 * 该记录细节通过sql语句完成，包括表名字，字段名，属性值等
 * 返回删除记录的条数
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
 * 向数据表中更新记录，
 * 该记录细节通过sql语句完成，包括表名字，字段名，属性值等
 * 返回更新记录的条数
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

public void  showList(LinkedList<String> list){
	
	while(!list.isEmpty()){
		System.out.println(list.getFirst());
		list.removeFirst();
	}
}

public  static void main(String[]  args){
		DBConnection  DBConn =new DBConnection();
		DBConn.OpenDB();
		String sql="select projectName,responsibleDepartment,Department.departmentName,progress01, status from (((project left outer join  ProjectRecord on  Project.projectID=ProjectRecord.projectID and taskMonth=2) left outer   join   TaskProgress   on   TaskProgress.departmentID='yuan001'  and TaskProgress.projectID=ProjectRecord.projectID )left outer   join   Department   on   Department.departmentID=Project.leadDepartment) where Project.responsibleDepartment='yuan001'; ";
		ResultSet rs=DBConn.SelectDB(sql);
		
		LinkedList<String> list=DBConn.ResultSetToList(rs);
		
		DBConn.showList(list);
	
}

	
}
