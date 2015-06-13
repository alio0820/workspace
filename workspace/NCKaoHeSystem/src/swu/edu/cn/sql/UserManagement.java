package swu.edu.cn.sql;

import java.sql.*;
import java.util.*;

import swu.edu.cn.bean.*;

/**
 * @author handonghai
 *这是一个用户类，包括所有用户的公告操作
 *如增加、删除、修改、确定用户，
 */


public class UserManagement extends  DBConnection {
	
	public String userName;		//该用户的登录名！！，所有操作都是该用户的行为
	public String classes;			//用户部门（包括特殊部门，系统保留的！）
	public String departmentName;
	public String realName;		//该用户的真实姓名
	
	
	public  UserManagement(String userName){
		
		super();
		this.userName=userName;
		
	}
	
	public  UserManagement(){	
		super();
		
	}
	
	
	
	/***********************************************************************************************/
	/**
	 * 判断用户名为username
	 * 如果用户存在，则返回true
	 * 如果用户不存在，则返回false
	 */

	public boolean isUserExist(){
		boolean res=false;
		ResultSet rs=null;
		Statement st=null;
		
		String sql="select userName from  userTable where userName='"+userName+"';";
		System.out.println(sql);

		try {
			if(conn.isClosed()){
				return res;	
			}
			
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			
			if(rs.next())		//至少有一条记录
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;
		
	}
	
	
	public boolean isUserExistAndLegal(String userName,String password){
		ResultSet rs=null;
		
		String selectSQL="select userName,password,classes,realName,departmentName from  userTable,Department where userName='"+userName+"' and password='"+password+"' and classes=departmentId;";
		System.out.println(selectSQL);

		try {
			
			 rs=this.SelectDB(selectSQL);
			
			if(rs.next()){		//至少有一条记录
				classes=rs.getString("classes");
				realName=rs.getString("realName");
				departmentName=rs.getString("departmentName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  true;
		
	}
	
	/***********************************************************************************************
	 * 
	 * 该函数将增加一个部门用户,默认是该用户不存在
	 * 所以在调用该函数之前需要判断该用户是否存在
	 * 若用户自己申请用户，则isLegal为false，管理员添加，isLegal为true
	 */
	
	public  boolean addUser(String userName,String password,String realName,String classes,String emailAddress,String isLegal){
			boolean  res=false;
		
			//应该参数都不为空！！！
			
			
			String sql="insert into userTable(userName,password,realName,classes,emailAddress, isLegal) values(?,?,?,?,?,?);";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, userName);
				pst.setString(2, password);
				pst.setString(3, realName);
				pst.setString(4, classes);
				pst.setString(5, emailAddress);
				pst.setString(6, password);
				
				
				boolean  bl=pst.execute();
				if(!bl){
					res=true;
					System.out.println("create an new user successfully!");
				}else{
					System.out.println("create an new user faild");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}		
	
		return  res;
	}



	/***********************************************************************************************
	/**
	 * 删除一个已经存在的用户，该用户可能是部门用户，也可能是领导用户
	 */
	
	
	public boolean deleteUser(){
		boolean  res=false;
		
		String sql="delete  from userTable where userName='"+userName+"'";
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
	 * 该函数将更新一个已经存在的部门用户
	 * 即更user表中的用户
	 */
	public boolean updateUser(String password,String emailAddress){
		
		boolean  res=false;
		
		String sql="update userTable set password=?,emailAddress=? where userName=?;";
		PreparedStatement pst=null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, emailAddress);
			pst.setString(3, userName);
			
			int n=pst.executeUpdate();
			if(n>0)
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
	
		return res;
	}
	
	/***********************************************************************************************
	 * 
	 * 确定一个用户为合法用户！！！！！！！！！！！！！！！！！！！！！！！！
	 * 这个由系统管理员操作
	 */
	
	public boolean confirmUser(){
		
		boolean  res=false;
		
		String sql="update userTable set isLegal=? where userName=?;";
		PreparedStatement pst=null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, "true");
			pst.setString(2,userName);
			
			int n=pst.executeUpdate();
			if(n>0)						//被修改记录的条数
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
	
		return	res;
	}
	
	/**
	 *该函数筛选出所有的非法用户，该函数用户系统管理员确定非法用户
	 */
	public ArrayList<UserBean>  searchIllegalityUser(){
		
		ArrayList<UserBean>  list=new ArrayList<UserBean>();
		
		String selectSQL="select userName,password,realName,classes,emailAddress,isLegal,departmentName from UserTable,Department where isLegal='false' and  classes=departmentId ";
		
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
//				System.out.println(rs.getString("userName"));
//				System.out.println(rs.getString("password"));
//				System.out.println(rs.getString("realName"));
//				System.out.println(rs.getString("classes"));
//				System.out.println(rs.getString("departmentName"));
//				System.out.println(rs.getString("emailAddress"));
//				System.out.println(rs.getString("isLegal"));
				
				UserBean  ub=new UserBean();
				ub.setUserName(rs.getString("userName"));
				ub.setPassword(rs.getString("password"));
				ub.setRealName(rs.getString("realName"));
				ub.setClassesId(rs.getString("classes"));			
				ub.setClassesName(rs.getString("departmentName"));			
				ub.setEmailAddress(rs.getString("emailAddress"));
				ub.setIsLegal(rs.getString("isLegal"));
				
				list.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
	/**
	 *该函数筛选出所有用户，该函数用户系统管理员
	 */
	public ArrayList<UserBean>  searchAllUser(){
		
		ArrayList<UserBean>  list=new ArrayList<UserBean>();
		
		String selectSQL="select userName,password,realName,classes,emailAddress,isLegal,departmentName from UserTable,Department where  classes=departmentId order by classes asc";
		
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				System.out.println(rs.getString("userName"));
				System.out.println(rs.getString("password"));
				System.out.println(rs.getString("realName"));
				System.out.println(rs.getString("classes"));
				System.out.println(rs.getString("departmentName"));
				System.out.println(rs.getString("emailAddress"));
				System.out.println(rs.getString("isLegal"));
				
				UserBean  ub=new UserBean();
				ub.setUserName(rs.getString("userName"));
				ub.setPassword(rs.getString("password"));
				ub.setRealName(rs.getString("realName"));
				ub.setClassesId(rs.getString("classes"));			
				ub.setClassesName(rs.getString("departmentName"));			
				ub.setEmailAddress(rs.getString("emailAddress"));
				ub.setIsLegal(rs.getString("isLegal"));
				
				list.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
	
	public boolean isDepartmentUserExist(String userName,String passWord) {
		boolean res=false;
		ResultSet rs=null;
		Statement st=null;
	
		String sql = "select username,password,realname,classes,departmentname from usertable join department on classes=departmentid where departmentid like '%department%' and username ='"+ userName+"' and password = '"+passWord+"';";
		System.out.println(sql);
		
		try {
			if(conn.isClosed()){
				return res;	
			}
			
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			
			if(rs.next())		//至少有一条记录
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;
	}
	/*******************************测试主函数**********************************************/
		public static void main(String[] args){		
			UserManagement  userManager=new UserManagement("donghai");
			userManager.OpenDB();
//			boolean  res=userManager.isUserExist();

			boolean bb=userManager.isUserExistAndLegal("donghai", "123456");
			
			
			System.out.println("classes="+userManager.classes);
			System.out.println("name="+userManager.realName);
			System.out.println(userManager.departmentName);
			
//			userManager.updateUser("donghai231", "ddd@125.com");
			
//			boolean b=userManager.confirmUser();
//			System.out.println("b="+b);
//			System.out.println(res);
			
//			userManager.searchIllegalityUser();
//			boolean exit1=userManager.isAdminExist("donghai", "donghai231");
//			System.out.println(exit1);
//			boolean exit2=userManager.isDepartmentUserExist("lichar", "123456");
//			System.out.println(exit2);
//			userManager.searchAllUser();
			userManager.CloseDB();
		}

}
