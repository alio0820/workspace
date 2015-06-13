package swu.edu.cn.sql;

import  java.sql.*;
import java.util.ArrayList;
import java.util.List;

import swu.edu.cn.bean.ProjectBean;
import swu.edu.cn.bean.ProjectRecordBean;

/**
 * 
 * @author ������
 *������Ҫ��ɶ�ԭʼ��Ŀ�Ĺ���������Ŀ�Ĳ�ѯ���޸ģ�������Ŀ����Ӻ�ɾ��
 *ͨ�������ж���Ŀ�Ƿ���ڣ�public boolean isProjectExist(String projectID),���������������������Ըú�������Ҫ
 *ͨ������ɾ��һ����Ŀ������ɾ����¼��������public boolean deleteProject(String projectID)
 *
 */

public class ProjectManagement extends DBConnection {

/******************************************�����캯��Main******************************************************/
	public  static  void main(String[] args){
		
		
		ProjectManagement  pm=new  ProjectManagement();
		pm.OpenDB();
			
	//pm.insertProject( "han", "han", "han", "han", "han", "han", 0.23,"dfdddddddddd������dff");
//		ArrayList<ProjectBean> list=pm.searchProjectByName("%");
//		ArrayList<ProjectBean> list=pm.searchProjectByProgress(112,0.1);
		
		ArrayList<ProjectBean> list=pm.searchProjectByClassify("�ص���Ŀ");
		
		
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
//	 * �ж���Ŀ����ΪprojectID����Ŀ�Ƿ����,���ڲ���Ҫ��
//	 * ����û����ڣ��򷵻�true
//	 * ����û������ڣ��򷵻�false
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
	 * �����ݱ��в���һ�������ڵ���Ŀ��¼�������ݱ� ��������������
	 * ������Ŀ��һЩ��ϸ��Ϣ
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
	 * ��Ŀ��ѯ�������֣����β��ţ�������
	 * 
	 */
	
	/************************************************************************************************
	 * �����ֲ�ѯ��Ŀ�����ظ���Ŀ�����飬ʹ�øú���ǰ��������ݿ�����
	 *���projectName="%",�򷵻����е���Ŀ����Ϊ%���κ��ַ�����ƥ�䣡��
	 */
	public ArrayList<ProjectBean>  searchProjectByName(String projectName){
		ArrayList<ProjectBean> al=new ArrayList<ProjectBean>();
//		System.out.println(projectName);
		projectName = projectName.replaceAll( "\\s",   "");		//ȥ���ո�������ַ�
		String name="%";
		for(int i=0;i<projectName.length();i++){			//����ƥ���ַ�%
			
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
	 * ����һ�����β��ţ�����������ĳһֵ��������Ŀ��ʹ�øú���ǰ��������ݿ�����
	 * ��rate=0ʱ�����ظ����β��ŵ�ȫ��������Ŀ��Ϣ
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
				db.setResponsibleDepartment("-");			//���β��ž��ǵ�ǰѡ��Ĳ���
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
	 * ��ѯû���걨����Ŀ
	 * status=null,��ʾδ�걨
	 * status=..,�����
	 * status=�����������δͨ��
	 * status=���������ͨ��
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
				db.setResponsibleDepartment("-");			//���β��ž��ǵ�ǰѡ��Ĳ���
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
	 *ͨ����Ŀ�ķ�����ɸѡ��Ŀ
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
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));			//���β��ž��ǵ�ǰѡ��Ĳ���
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
	 *ͨ����Ŀ�ķ�����ɸѡ��Ŀ
	 *����ֵ�����ű��+����ָ�꣨��Ŀ����ࣩ
	 *���أ��ò����ڸ�����ָ���ге���������Ŀ
	 *eg����ҵ԰��ίԱ�ᣨ112��+�ص���Ŀ����������ҵ԰��ίԱ��е��������ص���Ŀ
	 *��ֻ������ָ�꣬�򷵻����в��Ÿ�������ϵ����Ŀ
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
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));			//���β��ž��ǵ�ǰѡ��Ĳ���
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
	 *��������������ͨ������ָ�귵�����еĲ��Ÿ�������ϵ����Ŀ�б�
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
				db.setResponsibleDepartment(rs.getString("Department.departmentName"));			//���β��ž��ǵ�ǰѡ��Ĳ���
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
