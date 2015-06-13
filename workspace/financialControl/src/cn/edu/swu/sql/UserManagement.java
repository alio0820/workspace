package cn.edu.swu.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
/**
 * @author zhaicandong
 *这是一个用户管理类，包括用户存在性查询，用户的增加，删除，信息修改等
 *主要是操作DepartmentUser和 SeparateLeader数据表
 *存在性查询：		public boolean isUserExist(String userName,String tableName,String columnName)；
 *
 *判断部门用户合法性：public String	isDepartmentUserExist(String userName,String password)；
 *判断领导用户合法性：public String	isSeparateLeaderExist(String userName,String password)；
 *
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

		if(userManager.isUserExist("li"))
			System.out.println("zhai");
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

	public boolean isUserExist(String userName){
		boolean res=false;
		ResultSet rs=null;
		Statement st=null;
		
		String sql="select name from user";
		System.out.println(sql);

		try {
			if(conn.isClosed()){
				return res;	
			}
			
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			
			while(rs.next()){
				if(rs.getString("name").equals(userName)){
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
	public String ispwCorrect(String userName,String password,String zhiwei,HttpServletRequest request){			
			ResultSet rs=null;
			Statement st=null;
			String nameId= null;
			String sql="select user.name,passwd,authLevel,realName from user,person where user.name='"+userName+"' and passwd='"+password+"' and authLevel='"+zhiwei+"' and user.name=person.name";
			System.out.println(sql);
			try {

				st=conn.createStatement();
				rs=st.executeQuery(sql);
				
				while(rs.next()){
					String name=rs.getString("name");
					String passwd=rs.getString("passwd");
					
					if(userName.equals(name) && password.equals(passwd)){  //该用户存在
						nameId = name;
						String realName=rs.getString("realName");
						HttpSession session = request.getSession();
						session.setAttribute("realName", realName);
						break;
					}
				}
				rs.close();
				st.close();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return nameId;
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
	
	public boolean createDepartmentUser(String userName,String password,int departmentID,String realName){
		boolean  res=false;
		
			String sql="insert into departmentUser(userName,password,departmentID,realName) values(?,?,?,?);";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, userName);
				pst.setString(2, password);
				pst.setInt(3, departmentID);
				pst.setString(4, realName);
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
	
	public boolean createSeparateLeader(String userName,String password,String realName,String  officialPosition){
		boolean  res=false;
		
			String sql="insert into SeparateLeader(userName,password,realName,officialPosition) values(?,?,?,?);";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, userName);
				pst.setString(2, password);
				pst.setString(3, realName);
				pst.setString(4, officialPosition);
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
