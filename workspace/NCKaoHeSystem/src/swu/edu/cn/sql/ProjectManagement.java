package swu.edu.cn.sql;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

import swu.edu.cn.bean.*;
/**
 *����	������
 *����	2012-05-09
 *����	�����Ƕ���Ŀ���в��������������û�����Ŀ�Ĳ�ͬ����
 *
 */
public class ProjectManagement extends DBConnection {
	
	public ProjectManagement(){
		
	}
	
	public  static void main(String[] args){
		ProjectManagement  pm=new ProjectManagement();
		pm.OpenDB();
//		ArrayList<ProjectBean>	list=pm.searchProjectByDepartment("department119","evaluation002");
//		
//		for(ProjectBean pb:list){
//			System.out.println("���β���ID="+pb.getResDepartmentId());
//			System.out.println("����ID="+pb.getEvaluationId());
//			System.out.println("��Ŀ����="+pb.getEvaContent());
//			System.out.println("����ָ������="+pb.getEvaluationContent());
//			System.out.println(pb.getCurrentFinish());
//			
//			System.out.println(pb.getProjectName());
//			System.out.println(pb.getIsMoney());
//			System.out.println(pb.getTotalMoney());
//			System.out.println("----------------------");
//		}
		
		ArrayList<NoProjectEvaluationBean> list=pm.searchNoProjectEvaluationByNoReport("department119", 5);
		for(NoProjectEvaluationBean pmr:list){
			
			System.out.println(pmr.getEvaMonth());
			System.out.println(pmr.getMonthFinish());
			System.out.println(pmr.getEvaluationId());
			System.out.println(pmr.getEvaluationContent());
			System.out.println(pmr.getEvaDepartmentName());
		}
		pm.CloseDB();
		
	}
	/*****************************************************************************************/
	/**
	 *�ж�ĳ�����Ƿ�е���ĳ����ָ���µ���Ŀ��ǰ���Ǹò��ű��ÿ���ָ�꿼�ˣ�
	 *����Ժ���Ĳ���������Ҫ���е���Ŀ�Ͳ��е���Ŀ���õĺ�����������
	 *�е���Ŀ�ͷ���true�����е���Ŀ����false
	 */
	
	public boolean isDepartmentUndertakeProject(String evaluationId,String departmentId){	
		String  selectSQL="select projectId  from Project where Project.resDepartmentId='"+departmentId+"'  and evaluationId='"+evaluationId+"';";
		ResultSet rs=this.SelectDB(selectSQL);
		try {
			if(rs.next())
					return  true;							
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  false;
	}
	
	/*****************************************************************************************/
	/**
	 * �ú�������ĳ����ĳ����ָ���µ�ȫ����Ŀ
	 * ����ò���û�ге���Ŀ������Ҫ���ص��ò�����ɵĸ���������飡������������ʵ�֣�
	 */
	public ArrayList<ProjectBean>  searchProjectByDepartment(String evaluationId,String departmentId){
		ArrayList<ProjectBean>  list=new ArrayList<ProjectBean>();
		
//		String selectSQL="select t.evaid,t.evaluationcontent,t.leaddepartmentid,d1.departmentname as leadDept,t.ismoney,t.totalmoney,t.evacurrfinish,t.procurrentfinish,t.projectid,t.projectname,t.resdepartmentid,d2.departmentname as resDept,t.separateleader,t.evacontent,t.firstclassify,t.secondclassify  " +
//				"from((select evaluationform.evaluationid as evaid,evaluationcontent,leaddepartmentid,ismoney,totalmoney,evaluationform.currentfinish as evacurrfinish,project.currentFinish as procurrentfinish,projectid,projectname,resdepartmentid,separateleader,evacontent,firstclassify,secondclassify " +
//				"from evaluationform join project on (evaluationform.evaluationid=project.evaluationid)) t join department as d1 on (t.leaddepartmentid=d1.departmentid)join department as d2 on (t.resdepartmentid=d2.departmentid))where t.resdepartmentid='"+departmentId+"' and t.evaid='"+evaluationId+"';";
		
		String selectSQL="select evaid,leaddepartmentid,d1.departmentname as leadDeptName,ismoney,evatotalmoney,prototalmoney,evacurrentfinish,procurrentfinish,projectid,projectname,resdepartmentid,d2.departmentname as resDeptName,separateleader,efevacontent,proevacontent,t.firstclassify,t.secondclassify from((select evaluationform.evaluationid as evaid,evaluationform.evaluationcontent as efevacontent,project.evacontent as proevacontent,leaddepartmentid,ismoney,evaluationform.totalmoney as evatotalmoney,project.totalMoney as prototalmoney,evaluationform.currentfinish as evacurrentfinish,project.currentFinish as procurrentfinish,projectid,projectname,resdepartmentid,separateleader,firstclassify,secondclassify from evaluationform join project on (evaluationform.evaluationid=project.evaluationid)) t join department as d1 on (t.leaddepartmentid=d1.departmentid)join department as d2 on (t.resdepartmentid=d2.departmentid))where t.resdepartmentid='"+departmentId+"' and t.evaid='"+evaluationId+"'; ";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			
			while(rs.next()){
				
				ProjectBean pb=new ProjectBean();				

//				System.out.println(rs.getString("evaid"));
//				System.out.println(rs.getString("leaddepartmentid"));
//				System.out.println(rs.getString("leadDeptName"));
//				System.out.println(rs.getString("ismoney"));
//				System.out.println(rs.getString("evatotalmoney"));//evatotalmoney//prototalmoney
//				
//				
//				System.out.println(rs.getString("prototalmoney"));
//				System.out.println(rs.getString("evacurrentfinish"));
//				System.out.println(rs.getString("procurrentfinish"));
//				System.out.println(rs.getString("projectid"));				
//				System.out.println(rs.getString("projectname"));
//				
//				System.out.println(rs.getString("resdepartmentid"));
//				System.out.println(rs.getString("resDeptName"));
//				System.out.println(rs.getString("separateleader"));
//				System.out.println(rs.getString("efevacontent"));
//				System.out.println(rs.getString("proevacontent"));
//				
//				System.out.println(rs.getString("firstclassify"));
//				System.out.println(rs.getString("secondclassify"));
//				System.out.println("-------------------------------------");
//				
				
				
				pb.setProjectId(rs.getString("projectid"));
				pb.setProjectName(rs.getString("projectname"));
				pb.setEvaContent(rs.getString("proevacontent"));	//����Ŀ�Ŀ��˱�׼								
				pb.setEvaluationId(rs.getString("evaid"));
				pb.setEvaluationContent(rs.getString("efevacontent"));
				
				pb.setSeparateLeader(rs.getString("separateleader"));								
				pb.setEvaContent(rs.getString("proevacontent"));
				pb.setLeadDepartmentId(rs.getString("leaddepartmentid"));				
				pb.setLeadDepartmentName(rs.getString("leadDeptName"));
				pb.setResDepartmentId(rs.getString("resdepartmentid"));
				pb.setResDepartmentName(rs.getString("resDeptName"));


				
		
				pb.setIsMoney(rs.getString("ismoney"));
				pb.setTotalMoney(rs.getDouble("prototalmoney"));				//����		
				pb.setCurrentFinish(rs.getDouble("procurrentfinish"));	
				pb.setFirstClassify(rs.getString("firstclassify"));			
				pb.setSecondClassify(rs.getString("secondclassify"));			
				
				
				
				
				
				list.add(pb);
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	/**
	 *������������������ĳ���ŵ�ȫ����Ŀ
	 */
	public ArrayList<ProjectBean>  searchProjectByDepartment(String departmentId){
		ArrayList<ProjectBean> list=new ArrayList<ProjectBean>();
		
		
		
		return  list;
		
	}
	
	
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectByEvaluation(String evaluationId,String departmentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select evaid,evaluationcontent,leaddepartmentid,dept1.departmentname as leaddept,evadepartmentid,dept2.departmentname as evadept,evamonth,monthfinish,submittime,status,firstview,secondview,thirdview  " +
				"from((select evaluationform.evaluationid as evaid,evaluationcontent,leaddepartmentid,evadepartmentid,evamonth,monthfinish,submittime,status,firstview,secondview,thirdview  " +
				"from evaluationform join noprojectevaluation on evaluationform.evaluationid = noprojectevaluation.evaluationid) t  " +
				"join department as dept1 on (t.leaddepartmentid=dept1.departmentid) join department as dept2 on (t.evadepartmentid=dept2.departmentid))  " +
				"where evadepartmentid='"+departmentId+"' and  evaid='"+evaluationId+"';";
		/*evaid
		evaluationcontent
		leaddepartmentid
		leaddept
		evadepartmentid
		
		evadept
		evamonth
		monthfinish
		submittime
		status
		
		firstview
		secondview
		thirdview*/
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				npe.setEvaluationId(rs.getString("evaid"));
				npe.setEvaluationContent(rs.getString("evaluationcontent"));
				npe.setLeadDepartmentId(rs.getString("leaddepartmentid"));
				npe.setLeadDepartmentName(rs.getString("leaddept"));
				npe.setEvaDepartmentId(rs.getString("evadepartmentid"));
				
				npe.setLeadDepartmentName(rs.getString("evadept"));
				npe.setEvaMonth(rs.getInt("evamonth"));			
				npe.setMonthFinish(rs.getString("monthfinish"));
				npe.setSubmitTime(rs.getString("submittime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));
				
				list.add(npe);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return  list;
		
	
	
	}
	
	
	/**
	 * 
	 * ��ѯĳ����ĳ��û���ϱ��ļ�¼���������������Ҫ�ϱ��ļ�¼
	 * �������β����Լ���˵��Ҳ��Ҫ�˽���Щ��Ŀû���ϱ�����Ҫ�ϱ�
	 * ��������һ��û��ͨ��������ͨ��status��ֵ���ж�
	 * 
	 */
	
	public ArrayList<ProjectMonthRecordBean>  searchProjectByNoReport(String departmentID,int taskMonth){
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify  from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID  and Project.resDepartmentId='"+departmentID+"' ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId and taskMonth="+taskMonth+" ) where status is null;";

		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	currentFinish	firstClassify	secondClassify	
*/
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
//					System.out.println(rs.getString("projectId"));
//					System.out.println(rs.getString("projectName"));
//					System.out.println(rs.getString("isMoney"));
//					System.out.println(rs.getString("evaluationContent"));
//					System.out.println(rs.getString("totalProgress"));
//					System.out.println(rs.getString("departmentName"));
//					
//					System.out.println(rs.getString("evaContent"));
//					System.out.println(rs.getString("taskMonth"));
//					System.out.println(rs.getString("status"));
//					System.out.println(rs.getString("monthFinish"));
//					System.out.println(rs.getString("monthMoney"));
//					
//					System.out.println(rs.getString("monthProgress"));
//					System.out.println(rs.getString("submitTime"));
//					System.out.println(rs.getString("currentFinish"));
//					System.out.println(rs.getString("firstClassify"));
//					System.out.println(rs.getString("secondClassify"));
//					
//					System.out.println("--------------------------------------");
					
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
					
					
					list.add(pmrb);
			
				}
	
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	/**
	 *�ú������ص���֮ǰ����û���ύ����Ŀ��¼
	 */
	public ArrayList<ProjectMonthRecordBean>  searchAllProjectByNoReport(String departmentID){
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
	
				int len=(new java.util.Date()).getMonth()+1;
			
				for(int i=len;i>0;i--){
					
					ArrayList<ProjectMonthRecordBean> listTemp=searchProjectByNoReport(departmentID,i);
					
					for(ProjectMonthRecordBean pmb:listTemp)
							list.add(pmb);
				}

		return list;
		
	}
	
	/**���β����ϱ����ݺ�������ݿ⣡������*/
	public boolean ReportProjectRecord(String projectID,int taskMonth,String isMoney,double  monthProgress,double monthMoney,String monthFinish){
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		String submitTime = ts.toString().substring(0,10);  
		String status="000";
		//rojectID,taskMonth,monthFinish,monthMoney,monthProgress,submitTime,status
		String insertSQL=null;
		if(isMoney.replaceAll( "\\s","").equalsIgnoreCase("true")){
			//����Ŀ����ʽ�
			//���Ҹ���Ŀ��¼����ʽ�ı�����monthProgress
			ResultSet rs=this.SelectDB("select totalMoney from project where projectId='"+projectID+"'");
				try {
					rs.next();
					monthProgress=monthMoney/rs.getDouble("totalMoney");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			insertSQL="insert into ProjectMonthRecord(projectID,taskMonth,monthFinish,monthMoney,monthProgress,submitTime,status) values('"+projectID+"',"+taskMonth+",'"+monthFinish+"',"+monthMoney+","+monthProgress+",'"+submitTime+"','"+status+"');";

		}else{
			//����Ŀ���漰�ʽ�
			monthMoney=0;
			insertSQL="insert into ProjectMonthRecord(projectID,taskMonth,monthFinish,monthMoney,monthProgress,submitTime,status) values('"+projectID+"',"+taskMonth+",'"+monthFinish+"',"+monthMoney+","+monthProgress+",'"+submitTime+"','"+status+"');";

		}
		
		System.out.println(insertSQL);
		
		return super.insertDB(insertSQL);

}
	/**********************************************ǣͷ���Ŷ���Ŀ�Ĳ�������**********************************************/
	public ArrayList<ProjectMonthRecordBean> searchProjectByLeadDepatrment(String leadDeparmtentId){
	ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
	
	String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId  and evaForm.leadDepartmentId='"+leadDeparmtentId+"' )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId )where status='000';";


	System.out.println(selectSQL);
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			/*projectId	projectName	isMoney	evaluationContent	totalProgress	
			 * departmentName	evaContent	taskMonth	status	monthFinish	
			 * monthMoney	monthProgress	submitTime	firstView	secondView	
			 * thirdView	currentFinish	firstClassify	secondClassify
			 */
			
			ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
//				System.out.println(rs.getString("projectId"));
//				System.out.println(rs.getString("projectName"));
//				System.out.println(rs.getString("isMoney"));
//				System.out.println(rs.getString("evaluationContent"));
//				System.out.println(rs.getString("totalProgress"));
//				System.out.println(rs.getString("departmentName"));
//				
//				System.out.println(rs.getString("evaContent"));
//				System.out.println(rs.getString("taskMonth"));
//				System.out.println(rs.getString("status"));
//				System.out.println(rs.getString("monthFinish"));
//				System.out.println(rs.getString("monthMoney"));
//				
//				System.out.println(rs.getString("monthProgress"));
//				System.out.println(rs.getString("submitTime"));
//				System.out.println(rs.getString("currentFinish"));
//				System.out.println(rs.getString("firstClassify"));
//				System.out.println(rs.getString("secondClassify"));
				
//				System.out.println("--------------------------------------");
				
				pmrb.setProjectId(rs.getString("projectId"));
				pmrb.setProjectName(rs.getString("projectName"));
				pmrb.setIsMoney(rs.getString("isMoney"));
				pmrb.setTotalProgress(rs.getDouble("totalProgress"));
				pmrb.setResDepartmentName(rs.getString("departmentName"));
				
				
				pmrb.setEvaluationContent(rs.getString("evaluationContent"));
				
				pmrb.setProjectEvaContent(rs.getString("evaContent"));
				pmrb.setEvaMonth(rs.getInt("taskMonth"));
				pmrb.setStatus(rs.getString("status"));
				pmrb.setMonthFinish(rs.getString("monthFinish"));
				pmrb.setMonthProgress(rs.getDouble("monthMoney"));
				
				pmrb.setMonthProgress(rs.getDouble("monthProgress"));
				pmrb.setSubmitTime(rs.getString("submitTime"));
//				pmrb.setMonthFinish(rs.getString("currentFinish"));
				pmrb.setFirstView(rs.getString("firstView"));
				pmrb.setSecondView(rs.getString("secondView"));
				pmrb.setThirdView(rs.getString("thirdView"));
				pmrb.setMonthMoney(rs.getDouble("monthMoney"));
				list.add(pmrb);
		
			}


	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	
	}

	public int	LeadDepartmentShen(String projectID,int taskMonth,String yijian,boolean tongguo){
		//ͨ��status=T00����ͨ��ΪF00
		String status;
		if(tongguo==true){
			status="T00";
		}else{
			status="F00";
		}
		
		String updateSQL="update ProjectMonthRecord set status='"+status+"',firstView='"+yijian+"' where projectID='"+projectID+"' and taskMonth="+taskMonth;
		
		return this.updateDB(updateSQL);
			
	}

	/**********************************************���ֹ��쵼����Ŀ�Ĳ�������**********************************************/

	public ArrayList<ProjectMonthRecordBean>  QianTouLeaderViewList(String  leadarName){
		
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,evaForm.separateLeader,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId ) where  status='T00'  and  separateLeader='"+leadarName+"';";


		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	firstView	secondView	
				 * thirdView	currentFinish	firstClassify	secondClassify
				 */
				
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
					
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
//					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
					pmrb.setMonthMoney(rs.getDouble("monthMoney"));
					
					
					list.add(pmrb);
			
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	/**
	 * ǣͷ���쵼�������Ŀ��¼��ͨ��/��ͨ������Ҫ�����
	 * һ�����
	 * ���Ƕ�ĳ����¼�����޸�
	 * 
	 */

	public int	QianTouLeaderShen(String projectId,int taskMonth,String yijian,boolean tongguo){
		//ͨ����tongguo=true
		String status;
		if(tongguo==true){
			status="TT0";
		}else{
			status="TF0";
		}
		
		String updateSQL="update ProjectMonthRecord set status='"+status+"',secondView='"+yijian+"' where projectID='"+projectId+"' and taskMonth="+taskMonth;
		
		return this.updateDB(updateSQL);
			
	}
	
	/*****************************************���붽�����Ϊ*************************************************
	 * ������ɸѡ�������Լ��������Ŀ��¼
	 * ����ֻ�ܿ�����һ����ǣͷ���쵼�����ͨ������Ŀ
	 * ������Ŀ��Ҫ������������ˣ�
	 * ʹ��֮ǰ���ô����ݿ�����
	 * ������Ŀ��¼����
	 */

	public ArrayList<ProjectMonthRecordBean>  DuchaViewList(){
		
	ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,evaForm.separateLeader,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify    " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId ) where status='TT0';";


		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	firstView	secondView	
				 * thirdView	currentFinish	firstClassify	secondClassify
				 */
				
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
					
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
//					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
					pmrb.setMonthMoney(rs.getDouble("monthMoney"));
					
					
					list.add(pmrb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
	}
	
	/********************************************************************************************************************/
	/**
	 * �ú���ɸѡ��Ī����Ŀ����ĳ����Ҫ�ύ�ķ���Ŀ���ݣ����������ĳ����ָ��
	 */
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectEvaluationByNoReport(String departmentId,int evaMonth){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId  AND npe.evaMonth="+evaMonth+" ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status is null and  ed.evaDepartmentid='"+departmentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				//evaDepartmentid	departmentName	evaluationId	evaluationContent	leadDepartmentId	
				//departmentName	separateLeader	evaluationId	evaMonth	monthFinish	submitTime	
				//status	firstView	secondView	thirdView
				
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				npe.setLeadDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				
//				System.out.println(rs.getString("resDeptName"));
//				System.out.println(rs.getString("leadDeptName"));
				npe.setEvaDepartmentName(rs.getString("resDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));
				
				list.add(npe);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return  list;

	}
	
	/**
	 *ĳ�����ύĳ�·���Ŀ������
	 */
	public boolean ReportNoProjectRecord(String departmentId,String evaluationId,int taskMonth,String monthFinish){
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		String submitTime = ts.toString().substring(0,10);  
		String status="000";

		String	insertSQL="insert into NoProjectEvaluation(evaluationId,evaDepartmentId,evaMonth,monthFinish,submitTime,status) values('"+evaluationId+"','"+departmentId+"',"+taskMonth+",'"+monthFinish+"','"+submitTime+"','"+status+"');";

		System.out.println(insertSQL);
		return super.insertDB(insertSQL);
	}
	
	/**
	 *�ú���ɸѡ��ĳǣͷ������˵ķ���Ŀ��Ϣ
	 */
	public ArrayList<NoProjectEvaluationBean> searchNoProjectByLeadDepatrment(String leadDeparmtentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status='000' and  leadDep.departmentId='"+leadDeparmtentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				//evaDepartmentid	departmentName	evaluationId	evaluationContent	leadDepartmentId	
				//departmentName	separateLeader	evaluationId	evaMonth	monthFinish	submitTime	
				//status	firstView	secondView	thirdView
				
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				
				npe.setLeadDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				
//				System.out.println(rs.getString("resDeptName"));
//				System.out.println(rs.getString("leadDeptName"));
				npe.setEvaDepartmentName(rs.getString("resDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));			
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));

						
				list.add(npe);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return  list;
		
		}
	
	
	/**
	 * ��������������ǣͷ������˷���Ŀ��¼
	 */
	public int LeadDepartmentShen(String evaluationId,String evaDepartmentId,int taskMonth,String yijian,boolean tongguo){
	//ͨ��status=T00����ͨ��ΪF00
	String status;
	if(tongguo==true){
	status="T00";
	}else{
	status="F00";
	}

	String updateSQL="update NoProjectEvaluation set status='"+status+"',firstView='"+yijian+"' where evaluationId='"+evaluationId+"'  and evaDepartmentId='"+evaDepartmentId+"' and evaMonth="+taskMonth;

	return this.updateDB(updateSQL);

	} 
	
	/**
	 *�ú���ɸѡ��ǣͷ�쵼��˵ķ���Ŀ��¼����
	 */
		public ArrayList<NoProjectEvaluationBean>  QianTouLeaderNoProjectViewList(String  leadarName){
			
			ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
			
			String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
						"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status='T00' and  ef.separateLeader='"+leadarName+"';";


			System.out.println(selectSQL);
			ResultSet rs=this.SelectDB(selectSQL);
			
			try {
				while(rs.next()){
					/*projectId	projectName	isMoney	evaluationContent	totalProgress	
					 * departmentName	evaContent	taskMonth	status	monthFinish	
					 * monthMoney	monthProgress	submitTime	firstView	secondView	
					 * thirdView	currentFinish	firstClassify	secondClassify
					 */
					
					NoProjectEvaluationBean  pmrb=new NoProjectEvaluationBean();

						
					
					pmrb.setEvaluationId(rs.getString("evaluationId"));
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					pmrb.setLeadDepartmentId(rs.getString("leadDepartmentId"));
					pmrb.setLeadDepartmentName(rs.getString("leadDeptName"));
					pmrb.setEvaDepartmentId(rs.getString("evaDepartmentid"));
					
					
//					System.out.println(rs.getString("resDeptName"));
//					System.out.println(rs.getString("leadDeptName"));
					pmrb.setEvaDepartmentName(rs.getString("resDeptName"));
					pmrb.setEvaMonth(rs.getInt("evaMonth"));			
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
					pmrb.setStatus(rs.getString("status"));
					
					pmrb.setFirstView(rs.getString("firstview"));
					pmrb.setSecondView(rs.getString("secondview"));
					pmrb.setThirdView(rs.getString("thirdview"));
						
						list.add(pmrb);
				
					}


			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
	/**
	 *���ֹ��쵼�Է���Ŀ���У��ú������طֹ��쵼����Ŀ������ˣ�
	 *
	 */
	
	public int	QianTouLeaderNoProjectShen(String evaluationId,String departmentId,int evaMonth,String yijian,boolean tongguo){
		String status;
		if(tongguo==true){
			status="TT0";
		}else{
			status="TF0";
		}
		
		String updateSQL="update NoProjectEvaluation set status='"+status+"',secondView='"+yijian+"' where evaluationId='"+evaluationId+"' and evaDepartmentId='"+departmentId+"'  and  evaMonth="+evaMonth;
		
		System.out.println(updateSQL);
		
		return this.updateDB(updateSQL);
			
	}
	
	/**
	 * �ú���ɸѡ�������β����ύ��ĳ��Ŀ��������Ŀ��¼��û���ύ�ļ�¼�����ᱻɸѡ��������Ϊ���ݱ���û��������¼����Ҫ��ǣͷ����ʱ������
	 */
	public ArrayList<ProjectMonthRecordBean> searchProjectByDetails(String projectId){
	ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
	
	String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )inner join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId  and Project.projectId='"+projectId+"' )ORDER BY taskMonth DESC;";


	System.out.println(selectSQL);
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();

				pmrb.setProjectId(rs.getString("projectId"));
				pmrb.setProjectName(rs.getString("projectName"));
				pmrb.setIsMoney(rs.getString("isMoney"));
				pmrb.setTotalProgress(rs.getDouble("totalProgress"));
				pmrb.setResDepartmentName(rs.getString("departmentName"));
				
				
				pmrb.setEvaluationContent(rs.getString("evaluationContent"));
				
				pmrb.setProjectEvaContent(rs.getString("evaContent"));
				pmrb.setEvaMonth(rs.getInt("taskMonth"));
				pmrb.setStatus(rs.getString("status"));
				pmrb.setMonthFinish(rs.getString("monthFinish"));
				pmrb.setMonthProgress(rs.getDouble("monthMoney"));
				
				pmrb.setMonthProgress(rs.getDouble("monthProgress"));
				pmrb.setSubmitTime(rs.getString("submitTime"));
				pmrb.setMonthFinish(rs.getString("currentFinish"));
				pmrb.setFirstView(rs.getString("firstView"));
				pmrb.setSecondView(rs.getString("secondView"));
				pmrb.setThirdView(rs.getString("thirdView"));						
				list.add(pmrb);
			}

	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	
	}
	
	/**
	 * �ú���ɸѡ������Ŀ���飨�����·�,û���ύ�Ľ����ᱻɸѡ��������Ҫ��ǣͷ����ʱ������
	 */
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectByDetails(String departmentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status is null and  ed.evaDepartmentid='"+departmentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				npe.setLeadDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				npe.setEvaDepartmentName(rs.getString("resDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));			
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));

						
				list.add(npe);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return  list;
		
	
	}
	
	/**
	 * 
	 * С�����������溯���е���
	 */
	public String CTS(String status,int i){
		char c=status.charAt(i);
		String res;
		if(c=='F')	res="<font style='color:red'>δͨ��</font>";
		else if(c=='T')	res="ͨ��";
		else res="������";
		
		return res;
	}
	
	/**
	 * �ú����Ƕ�������˷���Ŀ��¼������
	 */
	public ArrayList<NoProjectEvaluationBean>  DuchaNoProjectViewList(){
		
	ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
					"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status='TT0';";


		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	firstView	secondView	
				 * thirdView	currentFinish	firstClassify	secondClassify
				 */
				
				NoProjectEvaluationBean  pmrb=new NoProjectEvaluationBean();
	
				pmrb.setEvaluationId(rs.getString("evaluationId"));
				pmrb.setEvaluationContent(rs.getString("evaluationContent"));
				pmrb.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				pmrb.setLeadDepartmentName(rs.getString("leadDeptName"));
				pmrb.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				pmrb.setEvaDepartmentName(rs.getString("resDeptName"));
				pmrb.setEvaMonth(rs.getInt("evaMonth"));			
				pmrb.setMonthFinish(rs.getString("monthFinish"));
				pmrb.setSubmitTime(rs.getString("submitTime"));
				pmrb.setStatus(rs.getString("status"));
				
				pmrb.setFirstView(rs.getString("firstview"));
				pmrb.setSecondView(rs.getString("secondview"));
				pmrb.setThirdView(rs.getString("thirdview"));
					
				list.add(pmrb);
			
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		}
		
	
	/**
	 * �ú���ɸѡ��ĳ�����ϱ�û��ͨ������Ŀ��¼
	 * @param leadDeparmtentId  �ϱ����ű��
	 * @return
	 */
	public ArrayList<ProjectMonthRecordBean> searchProjectFaildByLeadDepatrment(String leadDeparmtentId){
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
					"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId  and evaForm.leadDepartmentId='"+leadDeparmtentId+"' )inner join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId ) where status like '%F%';";

		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
	
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
									
					list.add(pmrb);
			
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
		}
	
	/**
	 * �ú���ɸѡ��ĳ�����ύδͨ���ķ���Ŀ��¼
	 * @param �����˲��ţ��ύ���ݵĲ��ű�ţ�
	 * @return
	 */
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectFaildEvaluation(String departmentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId  ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status like '%F%' and  ed.evaDepartmentid='"+departmentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				npe.setLeadDepartmentName(rs.getString("resDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				npe.setEvaDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));			
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));
		
				list.add(npe);				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return  list;
	}
	
	
	/**
	 * �����������Ŀ��¼��ͨ��/��ͨ������Ҫ�����
	 */

	public boolean	DuchaShen(String projectID,int taskMonth,String isMoney,String yijian,boolean tongguo){
		//ͨ����tongguo=true,false��ʾ��ͨ��
		String status;
		//�������ͬ��ͨ���󽫸����������ݱ���Ҫ���ʽ�ͽ��ȣ�ͨ��������
		if(tongguo==true ){		//ֻҪͨ������Ҫ�������ݱ���ʹ���ʽ��޹أ�ҲҪ���½��ȣ�		
			status="TTT";

			String updateSQL="update ProjectMonthRecord set status='"+status+"',thirdView='"+yijian+"' where projectID='"+projectID+"' and taskMonth="+taskMonth;
	
			String updateSQL1="update project set totalmoney =(select sum(projectmonthrecord.monthmoney) as promonthtotalmoney from projectmonthrecord where projectmonthrecord.projectid = '"+projectID+"' and status = 'TTT');";
			//��sql���ĳ�����projectId�йأ���ͨ��
			String updateSQL2="update evaluationform set evaluationform.totalmoney=(select sum(project.totalmoney) as prototalmoney from project where project.evaluationid = (SELECT evaluationId FROM Project WHERE projectId='"+projectID+"') ) where evaluationform.evaluationid = (SELECT evaluationId FROM Project WHERE projectId='"+projectID+"') ;";

			this.updateDB(updateSQL);
			this.updateDB(updateSQL1);
			this.updateDB(updateSQL2);
			
		}else{				//���鲻ͬ��,����ֻ����Ŀ��¼���в�����
			status="TTF";
			String updateSQL="update ProjectMonthRecord set status='"+status+"',thirdView='"+yijian+"' where projectID='"+projectID+"' and taskMonth="+taskMonth;
		
			 this.updateDB(updateSQL);			
		}	
			return true;
		}

	/**
	 * �ú����Ƕ�������˷���Ŀ������
	 * @param evaluationId			����ָ���ţ��ص���Ŀ��ţ�
	 * @param evaDepartmentId		�����˲��ű��
	 * @param evaMonth				�������·�
	 * @param yijian				���������
	 * @param tongguo				�Ƿ�ͨ��true/false
	 * @return
	 */
	public int	DuchaNoProjectShen(String evaluationId,String evaDepartmentId,int evaMonth,String yijian,boolean tongguo){
		//ͨ����tongguo=true,false��ʾ��ͨ��
		String status;
		//�������ͬ��ͨ���󽫸����������ݱ���Ҫ���ʽ�ͽ��ȣ�ͨ��������
		if(tongguo==true ){		//ֻҪͨ������Ҫ�������ݱ���ʹ���ʽ��޹أ�ҲҪ���½��ȣ�		
			status="TTT";

		}else{				//���鲻ͬ��,����ֻ����Ŀ��¼���в�����
			status="TTF";
		}
		
		String updateSQL="update NoProjectEvaluation set status='"+status+"',thirdView='"+yijian+"' where evaluationId='"+evaluationId+"' and  evaDepartmentId='"+evaDepartmentId+"' and  evaMonth="+evaMonth;

		return this.updateDB(updateSQL);
		}

}
