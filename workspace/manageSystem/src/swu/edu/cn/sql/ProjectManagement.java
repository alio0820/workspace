package swu.edu.cn.sql;

import  java.sql.*;

/**
 * 
 * @author 韩东海
 *该类主要完成对原始项目的管理，包括项目的查询，修改，单个项目的添加和删除
 *通过主键判断项目是否存在：public boolean isProjectExist(String projectID)
 *通过主键删除一个项目，返回删除记录的条数：public boolean deleteProject(String projectID)
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
	 * 判断项目主键为projectID的项目是否存在
	 * 这个函数在插入项目，删除项目的时候会用到
	 * 如果用户存在，则返回true
	 * 如果用户不存在，则返回false
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
	 * 删除一个已经存在的项目，默认是该项目已经存在，输入项目主键
	 * 返回true删除成功
	 * 返回false删除失败
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
	 * 向数据表中插入一条不存在的项目记录，使用之前判断项目是否存在
	 * 包括项目的一些详细信息
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
