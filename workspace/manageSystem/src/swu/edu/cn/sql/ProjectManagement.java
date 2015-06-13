package swu.edu.cn.sql;

import  java.sql.*;

/**
 * 
 * @author ������
 *������Ҫ��ɶ�ԭʼ��Ŀ�Ĺ���������Ŀ�Ĳ�ѯ���޸ģ�������Ŀ����Ӻ�ɾ��
 *ͨ�������ж���Ŀ�Ƿ���ڣ�public boolean isProjectExist(String projectID)
 *ͨ������ɾ��һ����Ŀ������ɾ����¼��������public boolean deleteProject(String projectID)
 *
 */

public class ProjectManagement extends DBConnection {
	
	public ProjectManagement(){	
		super();
	}
	
	/***********************************************************************************************/
	public  static  void main(String[] args){
		
		
		ProjectManagement  pm=new  ProjectManagement();
		pm.OpenDB();
		
	System.out.println(pm.isProjectExist("000011"));	
//	System.out.println(pm.deleteProject("00001"));;
	pm.insertProject("han", "han", "han", "han", "han", "han", "han", 0.23, "han");
		
	}
	
	/***********************************************************************************************/
	/**
	 * �ж���Ŀ����ΪprojectID����Ŀ�Ƿ����
	 * ��������ڲ�����Ŀ��ɾ����Ŀ��ʱ����õ�
	 * ����û����ڣ��򷵻�true
	 * ����û������ڣ��򷵻�false
	 */

	public boolean isProjectExist(String projectID){
		boolean res=false;
		ResultSet rs=null;
		Statement st=null;
		
		String sql="select projectID,projectName from  Project;";

		try {
			if(conn.isClosed()){
				return res;	
			}
			
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			
			while(rs.next()){
				if(rs.getString("projectID").equals(projectID)){
					System.out.println("=======================================");
						res=true;
						break;
				}
				
			}
			System.out.println("**********************************");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;	
	}
	
	
	
	/***********************************************************************************************
	/**
	 * ɾ��һ���Ѿ����ڵ���Ŀ��Ĭ���Ǹ���Ŀ�Ѿ����ڣ�������Ŀ����
	 * ����trueɾ���ɹ�
	 * ����falseɾ��ʧ��
	 */
	public boolean deleteProject(String projectID){
		boolean  res=false;
		
		String sql="delete  from Project where projectID='"+projectID+"'";
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
	
	/***********************************************************************************************/	
	/**
	 * �����ݱ��в���һ�������ڵ���Ŀ��¼��ʹ��֮ǰ�ж���Ŀ�Ƿ����
	 * ������Ŀ��һЩ��ϸ��Ϣ
	 */
		
	public boolean insertProject(String projectID,String projectName,String superClass,String leadDepartment,
			String reponsibleDepartment,String leader,String expectTask,double currentProgress,String describe){
		String insertSQL="insert into Project values(?,?,?,?,?,?,?,?,?)";
		boolean  res=false;
		PreparedStatement  pst=null;
		
		try {
			pst=conn.prepareStatement(insertSQL);
			pst.setString(1, projectID);
			pst.setString(2, projectName);
			pst.setString(3, superClass);
			pst.setString(4, leadDepartment);
			pst.setString(5, reponsibleDepartment);
			pst.setString(6, leader);
			pst.setString(7, expectTask);
			pst.setDouble(8, currentProgress);
			pst.setString(9, describe);
					
			int sum=pst.executeUpdate();
			if(sum>0)
					res=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	
		
}
