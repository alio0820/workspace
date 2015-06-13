package swu.edu.cn.sql;

import  java.sql.*;
import java.util.ArrayList;
import java.util.List;

import swu.edu.cn.bean.ProjectBean;
import swu.edu.cn.bean.ProjectRecordBean;

/**
 * 
 * @author 韩东海
 *该类主要完成对原始项目的管理，包括项目的查询，修改，单个项目的添加和删除
 *通过主键判断项目是否存在：public boolean isProjectExist(String projectID),现在是自增型主键，所以该函数不需要
 *通过主键删除一个项目，返回删除记录的条数：public boolean deleteProject(String projectID)
 *
 */

public class ProjectManagement extends DBConnection {

/******************************************测试朱函数Main******************************************************/
	public  static  void main(String[] args){
		
		
		ProjectManagement  pm=new  ProjectManagement();
		pm.OpenDB();
			
	//pm.insertProject( "han", "han", "han", "han", "han", "han", 0.23,"dfdddddddddd韩东海dff");
//		ArrayList<ProjectBean> list=pm.searchProjectByName("%");
//		ArrayList<ProjectBean> list=pm.searchProjectByProgress(112,0.1);
		
		ArrayList<ProjectBean> list=pm.searchProjectByClassify("重点项目");
		
		
//		while(!al.isEmpty()){
//			System.out.println(al.size());
//			ProjectBean pb=(ProjectBean) al.get(0);
//			
//			System.out.print(pb.getProjectName()+"\t");
//			System.out.print(pb.getResponsibleDepartment()+"\t");
//			System.out.println(pb.getCurrentProgress());
//			System.out.println(pb.getComment());
//			al.remove(0);
//			
//		}
//		System.out.println(list.size());
//		ArrayList<ProjectRecordBean> list=pm.searchProjectByReportFaild(112, 1);
		 for(ProjectBean prb : list){
			 	System.out.print(prb.getProjectID()+"\t");
			 	System.out.print(prb.getFirstClassify()+"\t");
			 	System.out.print(prb.getSecondClassify()+"\t");
			 	System.out.print(prb.getThirdClassify()+"\t");
				System.out.print(prb.getProjectName()+"\t");
				System.out.print(prb.getLeader()+"\t");
				System.out.print(prb.getExpectTask()+"\t");
				System.out.print(prb.getResponsibleDepartment()+"\t");
				
				System.out.println(prb.getCurrentProgress()+"\t");
//				System.out.println(prb.getStatus());
				
		 }
		
		
	}
	
	
	public ProjectManagement(){	
		super();
	}
	
	
	/***********************************************************************************************/
//	/***********************************************************************************************/
//	/**
//	 * 判断项目主键为projectID的项目是否存在,现在不需要了
//	 * 如果用户存在，则返回true
//	 * 如果用户不存在，则返回false
//	 */
//
//	public boolean isProjectExist(String projectID){
//		boolean res=false;
//		ResultSet rs=null;
//		Statement st=null;
//		
//		String sql="select projectID,projectName from  Project;";
//
//		try {
//			if(conn.isClosed()){
//				return res;	
//			}
//			
//			st=conn.createStatement();
//			rs=st.executeQuery(sql);
//			
//			while(rs.next()){
//				if(rs.getString("projectID").equals(projectID)){
//					System.out.println("=======================================");
//						res=true;
//						break;
//				}
//				
//			}
//			System.out.println("**********************************");
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return  res;	
//	}
	
	
	
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
	 * 向数据表中插入一条不存在的项目记录，该数据表 的主键是自增型
	 * 包括项目的一些详细信息
	 */
		
	public boolean insertProject(String projectName,String superClass,String leadDepartment,
			String responsibleDepartment,String leader,String expectTask,double currentProgress,String comment){
		String insertSQL="insert into Project (projectName,superClass,leadDepartment,responsibleDepartment,leader,expectTask,currentProgress,comment) values(?,?,?,?,?,?,?,?)";
		boolean  res=false;
		PreparedStatement  pst=null;
		
		try {
			pst=conn.prepareStatement(insertSQL);
			pst.setString(1, projectName);
			pst.setString(2, superClass);
			pst.setString(3, leadDepartment);
			pst.setString(4, responsibleDepartment);
			pst.setString(5, leader);
			pst.setString(6, expectTask);
			pst.setDouble(7, currentProgress);
			pst.setString(8, comment);
					
			int sum=pst.executeUpdate();
			if(sum>0)
					res=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 项目查询，按名字，责任部门，完成情况
	 * 
	 */
	
	/************************************************************************************************
	 * 按名字查询项目，返回该项目的详情，使用该函数前无需打开数据库连接
	 *如果projectName="%",则返回所有的项目（因为%和任何字符串都匹配！）
	 */
	public ArrayList<ProjectBean>  searchProjectByName(String projectName){
		ArrayList<ProjectBean> al=new ArrayList<ProjectBean>();
//		System.out.println(projectName);
		projectName = projectName.replaceAll( "\\s",   "");		//去掉空格等无用字符
		String name="%";
		for(int i=0;i<projectName.length();i++){			//插入匹配字符%
			
			name=name+projectName.charAt(i)+"%";
		}
		


//		String selectSQL="select  projectID, projectName,Project.comment,Department.departmentName,currentProgress from  Project,Department where Project.responsibleDepartment=Department.departmentID and  projectName like '"+name+"';";
		String selectSQL=" select  projectID, projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress " +
				"from  Project,ProjectClassify,Department " +
				"where Project.responsibleDepartment=Department.departmentID and  ProjectClassify.thirdClassify=Project.superClass and  projectName like '"+name+"';";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ProjectBean db=new ProjectBean();
				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				db.setProjectID(rs.getInt("projectID"));
				db.setProjectName(rs.getString("projectName"));
				
				db.setLeadDepartment("-");
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));
				db.setLeader(rs.getString("leader"));
				db.setExpectTask(rs.getString("expectTask"));
				db.setCurrentProgress(rs.getDouble("currentProgress"));
				db.setComment(rs.getString("comment"));
				al.add(db);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		
	}
	
	/**************************************************************************************************
	 * 返回一个责任部门，完成任务大于某一值得所有项目，使用该函数前无需打开数据库连接
	 * 当rate=0时，返回该责任部门的全部工程项目信息
	 */
	public ArrayList<ProjectBean>  searchProjectByProgress(int departmentID,double rate){
		ArrayList<ProjectBean> al=new ArrayList<ProjectBean>();

		String selectSQL="select  projectID, projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress  " +
				"from  Project,ProjectClassify,Department " +
				"where  responsibleDepartment="+departmentID+" and Project.superClass=ProjectClassify.thirdClassify  and Department.departmentID=Project.responsibleDepartment  and  currentProgress>= "+rate+";";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ProjectBean db=new ProjectBean();
//							System.out.println(rs.getInt("projectID"));

				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				db.setProjectID(rs.getInt("projectID"));
				db.setProjectName(rs.getString("projectName"));
				
				db.setLeadDepartment("-");
				db.setResponsibleDepartment("-");			//责任部门就是当前选择的部门
				db.setLeader(rs.getString("leader"));
				db.setExpectTask(rs.getString("expectTask"));
				db.setCurrentProgress(rs.getDouble("currentProgress"));
				db.setComment(rs.getString("comment"));
				al.add(db);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		
	}
	/**************************************************************************************************/
	
	/**
	 * 查询没有申报的项目
	 * status=null,表示未申报
	 * status=..,审核中
	 * status=。。。，审核未通过
	 * status=。。。审核通过
	 */
	
	public ArrayList<ProjectBean>  searchProjectByDepartment(int departmentID){
		ArrayList<ProjectBean> al=new ArrayList<ProjectBean>();
		
		String selectSQL=" select  projectID, projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress " +
		"from  Project,ProjectClassify,Department " +
		"where Project.responsibleDepartment="+departmentID+" and  ProjectClassify.thirdClassify=Project.superClass and Project.responsibleDepartment=Department.departmentID;";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ProjectBean db=new ProjectBean();
//							System.out.println(rs.getInt("projectID"));

				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				db.setProjectID(rs.getInt("projectID"));
				db.setProjectName(rs.getString("projectName"));
				
				db.setLeadDepartment("-");
				db.setResponsibleDepartment("-");			//责任部门就是当前选择的部门
				db.setLeader(rs.getString("leader"));
				db.setExpectTask(rs.getString("expectTask"));
				db.setCurrentProgress(rs.getDouble("currentProgress"));
				db.setComment(rs.getString("comment"));
				al.add(db);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		
	}
	/**
	 * 
	 *通过项目的分类来筛选项目
	 */
	
	public ArrayList<ProjectBean>  searchProjectByClassify(String  classify){
	
		ArrayList<ProjectBean> al=new ArrayList<ProjectBean>();
		
		String selectSQL=" select  projectID, projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress " +
		"from  Project,ProjectClassify,Department " +
		"where ProjectClassify.firstClassify='"+classify+"'and  ProjectClassify.thirdClassify=Project.superClass and Project.responsibleDepartment=Department.departmentID;";
		ResultSet rs=this.SelectDB(selectSQL);		
		try {
			while(rs.next()){
				ProjectBean db=new ProjectBean();
//							System.out.println(rs.getInt("projectID"));

				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				db.setProjectID(rs.getInt("projectID"));
				db.setProjectName(rs.getString("projectName"));
				
				db.setLeadDepartment("-");
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));			//责任部门就是当前选择的部门
				db.setLeader(rs.getString("leader"));
				db.setExpectTask(rs.getString("expectTask"));
				db.setCurrentProgress(rs.getDouble("currentProgress"));
				db.setComment(rs.getString("comment"));
				al.add(db);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	
	}	
	
	/**
	 * 
	 *通过项目的分类来筛选项目
	 *传入值：部门编号+评估指标（项目大分类）
	 *返回：该部门在该评估指标中承担的所有项目
	 *eg：工业园区委员会（112）+重点项目》》》》工业园区委员会承担的所有重点项目
	 *若只有评估指标，则返回所有部门该评估体系的项目
	 */
	
	public ArrayList<ProjectBean>  searchProjectByEvaluation(int departmentID,String  evaluationKey){
	
		ArrayList<ProjectBean> list=new ArrayList<ProjectBean>();
		
		String selectSQL=" select projectID,  projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress " +
		"from  Project,ProjectClassify,Department " +
		"where   Project.responsibleDepartment="+departmentID+"  and Project.responsibleDepartment=Department.departmentID and  ProjectClassify.thirdClassify=Project.superClass  and  firstClassify='"+evaluationKey+"';";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ProjectBean db=new ProjectBean();
//							System.out.println(rs.getInt("projectID"));

				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				db.setProjectID(rs.getInt("projectID"));
				db.setProjectName(rs.getString("projectName"));
				
				db.setLeadDepartment("-");
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));			//责任部门就是当前选择的部门
				db.setLeader(rs.getString("leader"));
				db.setExpectTask(rs.getString("expectTask"));
				db.setCurrentProgress(rs.getDouble("currentProgress"));
				db.setComment(rs.getString("comment"));
				list.add(db);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	
	}	
	
	/**
	 *重载上述方法，通过评估指标返回所有的部门该评估体系的项目列表
	 */
	public ArrayList<ProjectBean>  searchProjectByEvaluation(String  evaluationKey){
	
		ArrayList<ProjectBean> list=new ArrayList<ProjectBean>();
		
		String selectSQL=" select projectID,  projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress " +
		"from  Project,ProjectClassify,Department " +
		"where  Project.responsibleDepartment=Department.departmentID and  ProjectClassify.thirdClassify=Project.superClass  and  firstClassify='"+evaluationKey+"';";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ProjectBean db=new ProjectBean();
//							System.out.println(rs.getInt("projectID"));

				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				db.setProjectID(rs.getInt("projectID"));
				db.setProjectName(rs.getString("projectName"));
				
				db.setLeadDepartment("-");
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));			//责任部门就是当前选择的部门
				db.setLeader(rs.getString("leader"));
				db.setExpectTask(rs.getString("expectTask"));
				db.setCurrentProgress(rs.getDouble("currentProgress"));
				db.setComment(rs.getString("comment"));
				list.add(db);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	
	}
	
	
}
