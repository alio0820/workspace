package swu.edu.cn.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * @author handonghai
 *这是一个用户管理类，包括用户存在性查询，用户的增加，删除，信息修改等
 *主要是操作DepartmentUser和 SeparateLeader数据表
 *存在性查询：		public boolean isUserExist(String userName,String tableName,String columnName)；
 *判断部门用户合法性：public String	isDepartmentUserExist(String userName,String password)；
 *判断领导用户合法性：public String	isSeparateLeaderExist(String userName,String password)；
 *增加部门用户：public boolean createDepartmentUser(String userName,String  departmentID)；
 *增加领导用户：public boolean createSeparateLeader(String userName,String  officalPosition);
 *更新已经存在的部门用户：public boolean updateDepartmentUser(String userName,String password,String realName,String comment)；
 *更新已经存在的领导用户：public boolean updateSeparateLeader(String userName,String password,String realName,String comment);
 *删除用户：	public boolean deleteUser(String userName,String tableName)；
 */

public class UserManagement extends  DBConnection {
	/*******************************测试主函数**********************************************/
	public static void main(String[] args){		
		UserManagement  userManager=new UserManagement();
		userManager.OpenDB();
//
//		//System.out.println(DBConn.isUserExist("handonghai","DepartmentUser","userName"));
//		//System.out.println(DBConn.isDepartmentUserExist("handonghai", "123456"));	
//		System.out.println(DBConn.isSeparateLeaderExist("maozedong", "123456"));
//		System.out.println(DBConn.createDepartmentUser("zengjie3", "qu001"));
//		userManager.updateDepartmentUser("zengjie3", "990215", "曾洁", "老婆");
		
//		System.out.println(userManager.isUserExist("zengjie", "departmentUser", "userName"));
//		System.out.println(userManager.isUserExist("zengjie", "separateLeader", "userName"));
//		System.out.println(userManager.isUserExist("leader000", "separateLeader", "userName"));
//		System.out.println(userManager.updateSeparateLeader("leader000","987654","韩东海","还没当上，以后再说"));
		
//		System.out.println(userManager.createSeparateLeader("donghai", "zuzhibu"));
		
//		System.out.println(userManager.deleteUser("handonghai", "DepartmentUser"));
//		System.out.println(userManager.deleteUser("donghai", "SeparateLeader"));
		
//		userManager.insertDB("insert into DepartmentUser values('donghaihan','0000000','9999','东海','韩韩韩');");
//		userManager.deleteDB("delete  from  DepartmentUser where userName='zengjie3'");
	System.out.println(	userManager.updateDB("update DepartmentUser  set realName='曾pi样儿' where userName='runtool'"));
		userManager.CloseDB();
	}
	
	
	
	public  UserManagement(){
		
		super();
	}
	
	/***********************************************************************************************/
	/*
	 * 判断用户名为username,用户是否存在于表tableName的columnName列
	 * 如果用户存在，则返回true
	 * 如果用户不存在，则返回false
	 */

	public boolean isUserExist(String userName,String tableName,String columnName){
		boolean res=false;
		ResultSet rs=null;
		Statement st=null;
		
		String sql="select "+columnName+" from  "+tableName;
		System.out.println(sql);

		try {
			if(conn.isClosed()){
				return res;	
			}
			
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			
			while(rs.next()){
				if(rs.getString("userName").equals(userName)){
						res=true;
						break;
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;
		
	}
	
	/***********************************************************************************************/
	/*
	 * 判断用户名为username,密码为password的部门用户是否存在,该函数在登录的时候使用
	 * 如果用户存在，则返回用户的部门
	 * 如果用户不存在，则返回null
	 */
	public String	isDepartmentUserExist(String userName,String password){
			String department=null;				
			ResultSet rs=null;
			Statement st=null;
			String sql="select username,password,departmentID from DepartmentUser";
			try {
				if(conn.isClosed()){
					return department;	
				}
				
				
				st=conn.createStatement();
				rs=st.executeQuery(sql);
				
				while(rs.next()){
					String name=rs.getString("userName");
					String passwd=rs.getString("password");
					
//					System.out.println(name);
//					System.out.println(passwd);
					
					if(userName.equals(name) && password.equals(passwd)){  //该用户存在
						department=rs.getString("departmentID");		//返回该用户的部门
						break;
					}

				}
				
				rs.close();
				st.close();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return department;
	}
	
	/***********************************************************************************************/
	/*
	 * 判断用户名为username，密码为password的区分管领导用户是否存在,该函数在登录的时候使用
	 * 如果用户存在，则返回用户的真实姓名
	 * 如果用户不存在，则返回null
	 */
	public String	isSeparateLeaderExist(String userName,String password){
			String officialPosition=null;				
			ResultSet rs=null;
			Statement st=null;
			String sql="select username,password,officialPosition from SeparateLeader";
			
			try {
				if(conn.isClosed()){
					return officialPosition;	
				}
				
				
				st=conn.createStatement();
				rs=st.executeQuery(sql);
				
				
				while(rs.next()){
					String name=rs.getString("userName");
					String passwd=rs.getString("password");

//					System.out.print(name+"\t");
//					System.out.print(passwd+"\t");
//					System.out.println(rs.getString("officialPosition"));
					
					if(userName.equals(name) && password.equals(passwd)){ 			 //该用户存在
						officialPosition=rs.getString("officialPosition");			//返回该用户的官职，duchashi ||zuzhibu ||qufenguan
						break;
					}

				}
				
				rs.close();
				st.close();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return  officialPosition;
	}
	
	/***********************************************************************************************
	/**
	 * 删除一个已经存在的用户，该用户可能是部门用户，也可能是领导用户，主要是看操作那一张数据表
	 * 如果tableName=DepartmentUser，则删除的是部门用户
	 *  如果tableName=SeparateLeader，则删除的是领导用户
	 */
	
	
	public boolean deleteUser(String userName,String tableName){
		boolean  res=false;
		
		String sql="delete  from "+tableName+" where userName='"+userName+"'";
		System.out.println(sql);
		
		try {
			Statement st=conn.createStatement();
			int  sum=st.executeUpdate(sql);
			System.out.println(sum);
			if(sum>0)
					res=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	/***********************************************************************************************
	 * 
	 * 该函数将增加一个部门用户,默认是该用户不存在
	 * 所以在调用该函数之前需要判断该用户是否存在
	 * 用户创建后默认密码是888888
	 */
	
	public boolean createDepartmentUser(String userName,String  departmentID){
		boolean  res=false;
		
			String sql="insert into departmentUser(userName,password,departmentID) values(?,'888888',?);";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, userName);
				pst.setString(2, departmentID);
				
				boolean  bl=pst.execute();
				if(!bl){
					res=true;
					System.out.println("insert an new DepartmentUser successfully!");
				}else{
					System.out.println("insert an new DepartmentUser faild");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}		

		return  res;
	}
	
	/***********************************************************************************************
	 * 
	 * 该函数将更新一个已经存在的部门用户
	 * 即更新departmentuser表中的用户
	 */
	public boolean updateDepartmentUser(String userName,String password,String realName,String comment){
		boolean  res=false;
		
		String sql="update departmentUser set password=?,realName=?,comment=? where userName=?;";
		PreparedStatement pst=null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, realName);
			pst.setString(3, comment);
			pst.setString(4, userName);
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
		
		return res;
	}
	
	
	/***********************************************************************************************
	 * 
	 * 该函数将增加一个领导用户,默认是该用户不存在
	 * 所以在调用该函数之前需要判断该用户是否存在
	 * 用户创建后默认密码是888888
	 * officialPosition=duchashi || zuzhibu ||qufenguan
	 */
	
	public boolean createSeparateLeader(String userName,String  officialPosition){
		boolean  res=false;
		
			String sql="insert into SeparateLeader(userName,password,officialPosition) values(?,'888888',?);";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, userName);
				pst.setString(2, officialPosition);
				
				boolean  bl=pst.execute();
				if(!bl){
					res=true;
					System.out.println("insert an new SeparateLeader successfully!");
				}else{
					System.out.println("insert an new SeparateLeader faild");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}		

		return  res;
	}
	
	
	/***********************************************************************************************
	 * 
	 * 该函数将更新一个已经存在的领导用户,该用户的用户名和官位是不能修改的
	 * 即更新SeparateLeader表中的用户
	 */
	public boolean updateSeparateLeader(String userName,String password,String realName,String comment){
		boolean  res=false;
		
		String sql="update SeparateLeader set password=?,realName=?,comment=? where userName=?;";
		PreparedStatement pst=null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, realName);
			pst.setString(3, comment);
			pst.setString(4, userName);
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
		
		return res;
	}

}
