package com.common;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Random;

import com.bean.UserBean;
/**
 * author:翟灿东
 * 日期:2013-04-14
 * 修改日期:2013-07-21 2014-2-21
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
	
	private Connection conn;
	
	public  static void main(String[]  args){
		DBConnection  DBConn =new DBConnection();
		System.out.println((DBConn.isUserExistAndLegal("a", "123456")));
	}
/***********************************************************************************************/
	public	DBConnection(Connection conn){							
		this.conn=conn;
	}		
	public DBConnection(){								//初始化、构造函数
		conn=null;
	}
	public Connection getConn() {
		try {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
			conn = DriverManager.getConnection("proxool.proxoolPool");
		} catch (Exception e) {
			MyLog.getLogError(e,"获取连接出错...");
		}
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	public void  OpenDB(){
		//		连接mysql 的代码
		//		String MySQLJDBCDriver = "com.mysql.jdbc.Driver";  			//驱动程序名
		//		String url = "jdbc:mysql://127.0.0.1:3306/managedb";  		// URL指向要访问的数据库名infoAgri
		//		String user = "root";    									// MySQL配置时的用户名	
		//		String password = "123456";  			 					// Java连接MySQL配置时的密码
				
		//连接sqlserver2005的代码		
		//	String SQLServerJDBCDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
		//	String SQLServerURL = "jdbc:sqlserver://192.168.0.13:1433;DatabaseName=manageDB"; 
		//	String user = "nc";    										// MySQL配置时的用户名	
		//	String password = "123456";  			 					// Java连接MySQL配置时的密码
	try {
		//		Class.forName(SQLServerJDBCDriver);   								// 加载驱动程序
		//		conn= DriverManager.getConnection(SQLServerURL, user, password);		// 连接MySQL数据库
		
		Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		conn = DriverManager.getConnection("proxool.proxoolPool");
//		if(conn!=null)
//			System.out.println("DMMS is connected Successfull!");
	} catch (Exception e) {
		MyLog.getLogError(e,"初始化连接出错...");
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
//				if(conn.isClosed())
//					System.out.println("DBMS is closed successfully!");
			}else{
//				System.out.println("DBMS is not connected!");
			}
		
		} catch (Exception e) {
			MyLog.getLogError(e,"关闭数据库连接出错...");
		}
			
	}
		
	/***********************************************************************************************/
	/**
	 *前提是数据库链接已经打开，所以在其他应用中调用一下函数，必须先用OpenDB打开数据库连接
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
			MyLog.getLogError(e,"获取结果集出错...");
		}
		return rs;
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
			MyLog.getLogError(e,"插入数据出错...");
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
			MyLog.getLogError(e,"删除数据出错...");
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
			MyLog.getLogError(e,"更新数据出错...");
			return -1;
		}
		return sum;
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
			MyLog.getLogError(e,"结果集转换为list出错...");
		}
		return list;
	}

	/**
	 * 批量执行SQL语句,函数内部已经实现数据库连接大打开和关闭！！
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
			this.conn.commit();						//手动提交事务
	//		if(res.length!=sqlList.size()){
	//			this.conn.rollback();
	//			return  false;
	//		}			
		} catch (Exception e) {					//异常处理，回滚事务！
			e.printStackTrace();
			try {
				this.conn.rollback();		
			} catch (SQLException e1) {
				MyLog.getLogError(e,"批量执行SQL语句出错...");
				return  false;
			}
			return  false;
		}	
		this.CloseDB();	
		return  true;
	}
	/**
	 * 该函数用于清空某张表！！慎用！！
	 * 返回清空表记录的条数
	 * 返回-1表示清空失败！
	 */
	
	public  int  dropTable(String  tableName){
		Statement  st=null;
		int sum=0;
		String dropSQL="delete  from "+tableName;
		try {
			st=conn.createStatement();
			sum=st.executeUpdate(dropSQL);
		} catch (SQLException e) {
			MyLog.getLogError(e,"清空表出错...");
			return  -1;
		}
		return  sum;
	}


	/**
	 *	判断用户的合法性，通过预处理，防治sql注入攻击！！！ 
	 * @param userName
	 * @param password
	 * @return	返回用户bean，用户非法或不存在；返回null
	 */
	public  UserBean  isUserExistAndLegal(String userName,String password){
		this.OpenDB();
		ResultSet rs=null;
		UserBean ub=null;
		password = Common.encodeByMD5(password);
		try {
			String querySql = "select * from user_info where valid =1 and userName=?";
			rs = DBConnection.executeQuery(conn, querySql,userName);
			ub=new UserBean();
			if(rs!=null&&rs.next()){
				if(!password.equals(rs.getString("password")))
					return null;
				ub.setUserName(rs.getString("userName"));
				ub.setNickName(rs.getString("nickName"));
				ub.setHead(rs.getString("head"));
				ub.setRank(rs.getInt("rank"));
				ub.setSex(rs.getString("sex"));
				ub.setBirthday(rs.getString("birthday"));
				ub.setBirthplace(rs.getString("birthplace"));
				ub.setSchool(rs.getString("school"));
				ub.setPhone(rs.getString("phone"));
				ub.setRoleId(rs.getString("roleId"));
				ub.setValid(1);
				ub.setRegisterTime(rs.getString("registerTime"));
				ub.setRegisterIp(rs.getString("registerIp"));
				ub.setRecentTime(rs.getString("recentTime"));
				ub.setRecentIp(rs.getString("recentIp"));
				ub.setUpdateTime(rs.getString("updateTime"));
				ub.setRemark(rs.getString("remark"));
			}
			else{
				return null;
			}
			rs.close();
			return  ub;
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取用户出错...");
			return ub;
		}finally{
			this.CloseDB();
		}
	}
	
	/**
	 *	判断用户是否存在
	 * @param userName
	 * @return	boolean
	 * @throws SQLException 
	 */
	public boolean  isUserExist(String userName){
		this.OpenDB();
		ResultSet rs=null;
		try {
			String querySql = "select * from user_info where userName=?";
			rs = DBConnection.executeQuery(conn, querySql,userName);
			if(rs!=null&&rs.next()){
				return true;
			}
			else{
				return false;
			}
		} catch (SQLException e) {
			MyLog.getLogError(e,"判断用户是否存在出错...");
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				MyLog.getLogError(e,"关闭结果集或者statement出错...");
			}
			this.CloseDB();
		}
		return true;
	}
	
	public boolean register(String userName,String password,String nickName,String remark){
		Connection conn = this.getConn();
		password = Common.encodeByMD5(password);
		String sql = "insert into user_info(userName,password,nickName,head,rank,registerTime,roleId,remark,valid) values(?,?,?,?,1,?,?,?,1)";
        int num = (int)(Math.random()*14);
        String head_num ="";
        if(num<10) head_num = "0"+num;
        else head_num = ""+num;
		String head = "images/head/chatHeads"+head_num+".jpg";
		boolean flag = DBConnection.executeSQL(conn, sql, userName ,password ,nickName,head,Common.getTime(),"3",remark);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"注册用户出错...");
		}
		return flag;
	}
	
	/**
	 * 执行SQL语句,前提是数据库连接已打开
	 */
	@SuppressWarnings("finally")
	public static boolean executeSQL(Connection conn,String sql,String... parameter){
		PreparedStatement ps = null;
		boolean flag = true;
		try {
//			旧的查询语句
//			ps = conn.prepareStatement(sql);
//			for (int i = 0; i < parameter.length; i++) {
//				ps.setString(i+1, parameter[i]);
//			}
//			MyLog.printSql(ps.toString());
			//新的查询语句
			String[] sQuerySqls = (sql+" ").split("[?]");
			if(sQuerySqls.length!=parameter.length+1){
				MyLog.getLogError("SQL语句参数个数不符...");
				return false;
			}
			else{
				StringBuffer SQL = new StringBuffer();
				SQL.append(sQuerySqls[0]);
				for(int i=0;i<parameter.length;i++){
					SQL.append("'"+parameter[i]+"'"+sQuerySqls[i+1]);
				}
				sql = SQL.toString();
			}
			MyLog.getLogSql(sql);
			ps = conn.prepareStatement(sql);
			ps.execute();
			ps.close();
		} catch (Exception e) {
			MyLog.getLogError(e,"执行SQL出错...");
			flag = false;
		} finally{
			return flag;
		}
	}
	/**
	 * 查询SQL语句,前提是数据库连接已打开
	 */
	public static ResultSet executeQuery(Connection conn,String sQuerySql,String... parameter){
		ResultSet rs =null;
		try {
//			旧的查询语句
//			PreparedStatement ps = conn.prepareStatement(sQuerySql);
//			for (int i = 0; i < parameter.length; i++) {
//				ps.setString(i+1, parameter[i]);
//			}
//			MyLog.printSql(ps.toString());
			//新的查询语句
			String[] sQuerySqls = (sQuerySql+" ").split("[?]");
			if(sQuerySqls.length!=parameter.length+1){
				MyLog.getLogError("SQL语句参数个数不符...");
				return null;
			}
			else{
				StringBuffer SQL = new StringBuffer();
				SQL.append(sQuerySqls[0]);
				for(int i=0;i<parameter.length;i++){
					SQL.append("'"+parameter[i]+"'"+sQuerySqls[i+1]);
				}
				sQuerySql = SQL.toString();
			}
			MyLog.getLogSql(sQuerySql);
			PreparedStatement ps = conn.prepareStatement(sQuerySql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			MyLog.getLogError(e,"查询SQL出错...");
		}
		return rs;
	}
}
