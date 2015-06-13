package swu.edu.cn.sql;

import java.sql.*;
import java.util.*;

import swu.edu.cn.bean.*;

/**
 * @author handonghai
 *����һ���û��࣬���������û��Ĺ������
 *�����ӡ�ɾ�����޸ġ�ȷ���û���
 */


public class UserManagement extends  DBConnection {
	
	public String userName;		//���û��ĵ�¼�����������в������Ǹ��û�����Ϊ
	public String classes;			//�û����ţ��������ⲿ�ţ�ϵͳ�����ģ���
	public String departmentName;
	public String realName;		//���û�����ʵ����
	
	
	public  UserManagement(String userName){
		
		super();
		this.userName=userName;
		
	}
	
	public  UserManagement(){	
		super();
		
	}
	
	
	
	/***********************************************************************************************/
	/**
	 * �ж��û���Ϊusername
	 * ����û����ڣ��򷵻�true
	 * ����û������ڣ��򷵻�false
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
			
			if(rs.next())		//������һ����¼
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
			
			if(rs.next()){		//������һ����¼
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
	 * �ú���������һ�������û�,Ĭ���Ǹ��û�������
	 * �����ڵ��øú���֮ǰ��Ҫ�жϸ��û��Ƿ����
	 * ���û��Լ������û�����isLegalΪfalse������Ա��ӣ�isLegalΪtrue
	 */
	
	public  boolean addUser(String userName,String password,String realName,String classes,String emailAddress,String isLegal){
			boolean  res=false;
		
			//Ӧ�ò�������Ϊ�գ�����
			
			
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
	 * ɾ��һ���Ѿ����ڵ��û������û������ǲ����û���Ҳ�������쵼�û�
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
	 * �ú���������һ���Ѿ����ڵĲ����û�
	 * ����user���е��û�
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
	 * ȷ��һ���û�Ϊ�Ϸ��û�������������������������������������������������
	 * �����ϵͳ����Ա����
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
			if(n>0)						//���޸ļ�¼������
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
	
		return	res;
	}
	
	/**
	 *�ú���ɸѡ�����еķǷ��û����ú����û�ϵͳ����Աȷ���Ƿ��û�
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
	 *�ú���ɸѡ�������û����ú����û�ϵͳ����Ա
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
			
			if(rs.next())		//������һ����¼
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;
	}
	/*******************************����������**********************************************/
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
