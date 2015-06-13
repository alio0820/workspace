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
 *����һ���û������࣬�����û������Բ�ѯ���û������ӣ�ɾ������Ϣ�޸ĵ�
 *��Ҫ�ǲ���DepartmentUser�� SeparateLeader���ݱ�
 *�����Բ�ѯ��		public boolean isUserExist(String userName,String tableName,String columnName)��
 *
 *�жϲ����û��Ϸ��ԣ�public String	isDepartmentUserExist(String userName,String password)��
 *�ж��쵼�û��Ϸ��ԣ�public String	isSeparateLeaderExist(String userName,String password)��
 *
 *���Ӳ����û���public boolean createDepartmentUser(String userName,String  departmentID)��
 *�����쵼�û���public boolean createSeparateLeader(String userName,String  officalPosition);
 *�����Ѿ����ڵĲ����û���public boolean updateDepartmentUser(String userName,String password,String realName,String comment)��
 *�����Ѿ����ڵ��쵼�û���public boolean updateSeparateLeader(String userName,String password,String realName,String comment);
 *ɾ���û���	public boolean deleteUser(String userName,String tableName)��
 */

public class UserManagement extends  DBConnection {
	/*******************************����������**********************************************/
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
	 * �ж��û���Ϊusername,�û��Ƿ�����ڱ�tableName��columnName��
	 * ����û����ڣ��򷵻�true
	 * ����û������ڣ��򷵻�false
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
	 * �ж��û���Ϊusername,����Ϊpassword�Ĳ����û��Ƿ����,�ú����ڵ�¼��ʱ��ʹ��
	 * ����û����ڣ��򷵻��û��Ĳ���
	 * ����û������ڣ��򷵻�null
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
					
					if(userName.equals(name) && password.equals(passwd)){  //���û�����
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
	 * ɾ��һ���Ѿ����ڵ��û������û������ǲ����û���Ҳ�������쵼�û�����Ҫ�ǿ�������һ�����ݱ�
	 * ���tableName=DepartmentUser����ɾ�����ǲ����û�
	 *  ���tableName=SeparateLeader����ɾ�������쵼�û�
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
	 * �ú���������һ�������û�,Ĭ���Ǹ��û�������
	 * �����ڵ��øú���֮ǰ��Ҫ�жϸ��û��Ƿ����
	 * �û�������Ĭ��������888888
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
	 * �ú���������һ���Ѿ����ڵĲ����û�
	 * ������departmentuser���е��û�
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
	 * �ú���������һ���쵼�û�,Ĭ���Ǹ��û�������
	 * �����ڵ��øú���֮ǰ��Ҫ�жϸ��û��Ƿ����
	 * �û�������Ĭ��������888888
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
	 * �ú���������һ���Ѿ����ڵ��쵼�û�,���û����û����͹�λ�ǲ����޸ĵ�
	 * ������SeparateLeader���е��û�
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
