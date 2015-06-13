package swu.edu.cn.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * @author handonghai
 *����һ���û������࣬�����û������Բ�ѯ���û������ӣ�ɾ������Ϣ�޸ĵ�
 *��Ҫ�ǲ���DepartmentUser�� SeparateLeader���ݱ�
 *�����Բ�ѯ��		public boolean isUserExist(String userName,String tableName,String columnName)��
 *�жϲ����û��Ϸ��ԣ�public String	isDepartmentUserExist(String userName,String password)��
 *�ж��쵼�û��Ϸ��ԣ�public String	isSeparateLeaderExist(String userName,String password)��
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
//
//		//System.out.println(DBConn.isUserExist("handonghai","DepartmentUser","userName"));
//		//System.out.println(DBConn.isDepartmentUserExist("handonghai", "123456"));	
//		System.out.println(DBConn.isSeparateLeaderExist("maozedong", "123456"));
//		System.out.println(DBConn.createDepartmentUser("zengjie3", "qu001"));
//		userManager.updateDepartmentUser("zengjie3", "990215", "����", "����");
		
//		System.out.println(userManager.isUserExist("zengjie", "departmentUser", "userName"));
//		System.out.println(userManager.isUserExist("zengjie", "separateLeader", "userName"));
//		System.out.println(userManager.isUserExist("leader000", "separateLeader", "userName"));
//		System.out.println(userManager.updateSeparateLeader("leader000","987654","������","��û���ϣ��Ժ���˵"));
		
//		System.out.println(userManager.createSeparateLeader("donghai", "zuzhibu"));
		
//		System.out.println(userManager.deleteUser("handonghai", "DepartmentUser"));
//		System.out.println(userManager.deleteUser("donghai", "SeparateLeader"));
		
//		userManager.insertDB("insert into DepartmentUser values('donghaihan','0000000','9999','����','������');");
//		userManager.deleteDB("delete  from  DepartmentUser where userName='zengjie3'");
	System.out.println(	userManager.updateDB("update DepartmentUser  set realName='��pi����' where userName='runtool'"));
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
	 * �ж��û���Ϊusername,����Ϊpassword�Ĳ����û��Ƿ����,�ú����ڵ�¼��ʱ��ʹ��
	 * ����û����ڣ��򷵻��û��Ĳ���
	 * ����û������ڣ��򷵻�null
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
					
					if(userName.equals(name) && password.equals(passwd)){  //���û�����
						department=rs.getString("departmentID");		//���ظ��û��Ĳ���
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
	 * �ж��û���Ϊusername������Ϊpassword�����ֹ��쵼�û��Ƿ����,�ú����ڵ�¼��ʱ��ʹ��
	 * ����û����ڣ��򷵻��û�����ʵ����
	 * ����û������ڣ��򷵻�null
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
					
					if(userName.equals(name) && password.equals(passwd)){ 			 //���û�����
						officialPosition=rs.getString("officialPosition");			//���ظ��û��Ĺ�ְ��duchashi ||zuzhibu ||qufenguan
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
