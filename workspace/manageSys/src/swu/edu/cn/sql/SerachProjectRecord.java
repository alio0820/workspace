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
				
				System.out.print(prb.getRate()+"\t");			//������ɵı���
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
	 * ��ѯĳ����ĳ���ϱ�û��ͨ���ļ�¼��ֻҪ��һ��û��ͨ��������ûͨ��
	 * ǣͷ���š���ǣͷ�쵼����������
	 * �������β����Լ���˵��Ҳ��Ҫ�˽���Щ��Ŀ�ύʧ�ܣ���Ҫ�����ύ
	 * ��������һ��û��ͨ��������ͨ��status��ֵ���ж�
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
				prb.setResponsibleDepartment(rs.getString("Department.departmentName"));	//���β��ž��ǵ�ǰѡ��Ĳ���
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
	 * ��ѯĳ����ĳ��û���ϱ��ļ�¼
	 * �������β����Լ���˵��Ҳ��Ҫ�˽���Щ��Ŀû���ϱ�����Ҫ�ϱ�
	 * ��������һ��û��ͨ��������ͨ��status��ֵ���ж�
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
					prb.setResponsibleDepartment(rs.getString("Department.departmentName"));	//���β��ž��ǵ�ǰѡ��Ĳ���
					prb.setLeader(rs.getString("leader"));
					prb.setExpectTask(rs.getString("expectTask"));
					
//					System.out.println(rs.getInt("ProjectRecord.taskMonth"));
					prb.setCurrentProgress(rs.getDouble("currentProgress"));
					//��Ϊ�������ӣ������·���ʾΪnull��rs.getInt("taskMonth")
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
	 * ��ѯĳ��Ŀ�����ϸ�����������ÿ�����쵼����ʾ
	 * ע�⣺��statusΪnull��000ʱ��������ʾ�쵼��ʾ����Ϊ��ʱΪ��Ч���ݣ�
	 * �ò�ѯ�������ϸ��ͼһ����ʾ
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
					prb.setResponsibleDepartment(rs.getString("Department.departmentName"));	//���β��ž��ǵ�ǰѡ��Ĳ���
					prb.setLeader(rs.getString("leader"));
					prb.setExpectTask(rs.getString("expectTask"));
					
					prb.setRate(rs.getDouble("rate"));
					
//					System.out.println(rs.getInt("ProjectRecord.taskMonth"));
					prb.setCurrentProgress(rs.getDouble("currentProgress"));
					//��Ϊ�������ӣ������·���ʾΪnull��rs.getInt("taskMonth")
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
