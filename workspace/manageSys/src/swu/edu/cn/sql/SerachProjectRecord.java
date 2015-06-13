package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import swu.edu.cn.bean.ProjectRecordBean;

public class SerachProjectRecord extends ProjectRecordManagement {
	
	public static void main(String [] args){
		SerachProjectRecord  spr=new SerachProjectRecord();
		spr.OpenDB();
//		ArrayList<ProjectRecordBean> list=spr.searchProjectByNoReport(112, 1);
		ArrayList<ProjectRecordBean> list=spr.searchProjectRecordByDetails(39);
		 for(ProjectRecordBean prb : list){
			 	System.out.print(prb.getProjectID()+"\t");
			 	System.out.print(prb.getFirstClassify()+"\t");
			 	System.out.print(prb.getSecondClassify()+"\t");
			 	System.out.print(prb.getThirdClassify()+"\t");
				System.out.print(prb.getProjectName()+"\t");
				
				System.out.print(prb.getTaskMonth()+"\t");
				System.out.print(prb.getLeader()+"\t");
				System.out.print(prb.getExpectTask()+"\t");
				System.out.print(prb.getResponsibleDepartment()+"\t");
				
				System.out.print(prb.getRate()+"\t");			//该月完成的比例
				System.out.println(prb.getStatus());
				System.out.println(prb.getLeadCompanyView());
				prb.getSeparateLeaderView();
				prb.getSupervisionView();
				
		 }
		
		spr.CloseDB();
	}
	
	
	public  SerachProjectRecord(){
			super();
		
	}
	
	/**
	 * 
	 * 查询某部门某月上报没有通过的记录，只要有一级没有通过，都叫没通过
	 * 牵头部门》》牵头领导》》督查室
	 * 对于责任部门自己来说，也需要了解哪些项目提交失败，需要重新提交
	 * 具体是哪一级没有通过，可以通过status的值来判断
	 * 
	 */
	
	public ArrayList<ProjectRecordBean>  searchProjectByReportFaild(int departmentID,int taskMonth){
		ArrayList<ProjectRecordBean> list=new ArrayList<ProjectRecordBean>();
		
		String selectSQL=" select  Project.projectID, projectName,leader,firstClassify,secondClassify,ProjectClassify.thirdClassify ,Project.expectTask,Project.comment,Department.departmentName,currentProgress,ProjectRecord.taskMonth,status  " +
		"from  Project,ProjectClassify,Department,ProjectRecord " +
		"where Project.responsibleDepartment="+departmentID+" and  ProjectClassify.thirdClassify=Project.superClass and Project.responsibleDepartment=Department.departmentID and Project.projectID=ProjectRecord.projectID  and  ProjectRecord.taskMonth="+taskMonth+" and status like '%F%';";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				
				ProjectRecordBean  prb=new ProjectRecordBean();

				prb.setFirstClassify(rs.getString("firstClassify"));
				prb.setSecondClassify(rs.getString("secondClassify"));
				prb.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
				
				prb.setProjectID(rs.getInt("projectID"));
				prb.setProjectName(rs.getString("projectName"));
				prb.setStatus(rs.getString("status"));
				prb.setLeadDepartment("-");
				prb.setResponsibleDepartment(rs.getString("Department.departmentName"));	//责任部门就是当前选择的部门
				prb.setLeader(rs.getString("leader"));
				prb.setExpectTask(rs.getString("expectTask"));
				prb.setCurrentProgress(rs.getDouble("currentProgress"));
				prb.setTaskMonth(rs.getInt("ProjectRecord.taskMonth"));
				prb.setComment(rs.getString("comment"));
				list.add(prb);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	/**
	 * 
	 * 查询某部门某月没有上报的记录
	 * 对于责任部门自己来说，也需要了解哪些项目没有上报，需要上报
	 * 具体是哪一级没有通过，可以通过status的值来判断
	 * 
	 */
	
	public ArrayList<ProjectRecordBean>  searchProjectByNoReport(int departmentID,int taskMonth){
		ArrayList<ProjectRecordBean> list=new ArrayList<ProjectRecordBean>();
		
		String selectSQL="select Project.projectID,projectName,leader,expectTask,ProjectRecord.taskMonth,status,Project.comment,Project.currentProgress,Department.departmentName,ProjectClassify.firstClassify, ProjectClassify.secondClassify,ProjectClassify.thirdClassify  " +
				"from (((project inner join Department on Project.leadDepartment=Department.departmentID and   Project.responsibleDepartment='"+departmentID+"'  ) inner join ProjectClassify on  ProjectClassify.thirdClassify=Project.superClass )left outer join ProjectRecord  on   Project.projectID=ProjectRecord.projectID and taskMonth="+taskMonth+" ) where status is null;";  // and status  is null 
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				
				
					ProjectRecordBean  prb=new ProjectRecordBean();

					prb.setFirstClassify(rs.getString("firstClassify"));
					prb.setSecondClassify(rs.getString("secondClassify"));
					prb.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
					
					prb.setProjectID(rs.getInt("Project.projectID"));
					prb.setProjectName(rs.getString("projectName"));
					prb.setStatus(rs.getString("status"));
					
					prb.setLeadDepartment("-");
					prb.setResponsibleDepartment(rs.getString("Department.departmentName"));	//责任部门就是当前选择的部门
					prb.setLeader(rs.getString("leader"));
					prb.setExpectTask(rs.getString("expectTask"));
					
//					System.out.println(rs.getInt("ProjectRecord.taskMonth"));
					prb.setCurrentProgress(rs.getDouble("currentProgress"));
					//因为是外连接，所以月份显示为null，rs.getInt("taskMonth")
					prb.setTaskMonth(taskMonth);
					prb.setComment(rs.getString("comment"));
					list.add(prb);
			
				}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	
	/**
	 * 
	 * 查询某项目的完成细节情况，包括每个月领导的批示
	 * 注意：当status为null或000时，不用显示领导批示（因为此时为无效数据）
	 * 该查询结果将和细节图一起显示
	 * 
	 */
	
	public ArrayList<ProjectRecordBean>  searchProjectRecordByDetails(int projectID){
		ArrayList<ProjectRecordBean> list=new ArrayList<ProjectRecordBean>();
		
		String selectSQL="select projectName,leader,rate,expectTask,ProjectRecord.taskMonth,status,Project.comment,Project.currentProgress,Department.departmentName,ProjectClassify.firstClassify, ProjectClassify.secondClassify,ProjectClassify.thirdClassify,leadCompanyView,separateLeaderView,supervisionView  " +
				"from (((project inner join Department on Project.projectID="+projectID+"   and Project.leadDepartment=Department.departmentID ) inner join ProjectClassify on  ProjectClassify.thirdClassify=Project.superClass )left outer join ProjectRecord  on   Project.projectID=ProjectRecord.projectID  );";  // and status  is null 
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				
				
					ProjectRecordBean  prb=new ProjectRecordBean();

					prb.setFirstClassify(rs.getString("firstClassify"));
					prb.setSecondClassify(rs.getString("secondClassify"));
					prb.setThirdClassify(rs.getString("ProjectClassify.thirdClassify"));
					
					prb.setProjectID(projectID);
					prb.setProjectName(rs.getString("projectName"));
					prb.setStatus(rs.getString("status"));
					
					prb.setLeadDepartment("-");
					prb.setResponsibleDepartment(rs.getString("Department.departmentName"));	//责任部门就是当前选择的部门
					prb.setLeader(rs.getString("leader"));
					prb.setExpectTask(rs.getString("expectTask"));
					
					prb.setRate(rs.getDouble("rate"));
					
//					System.out.println(rs.getInt("ProjectRecord.taskMonth"));
					prb.setCurrentProgress(rs.getDouble("currentProgress"));
					//因为是外连接，所以月份显示为null，rs.getInt("taskMonth")
					prb.setTaskMonth(rs.getInt("ProjectRecord.taskMonth"));
					
				
					
					prb.setLeadCompanyView(rs.getString("leadCompanyView"));
				
					prb.setSeparateLeaderView(rs.getString("separateLeaderView"));
					prb.setSupervisionView(rs.getString("supervisionView"));
					
					prb.setComment(rs.getString("comment"));
					
					list.add(prb);
			
				}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	

}
